require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/nosweatresurrectionstone.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_compromisingstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_compromisingstatue.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_compromisingstatue.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_compromisingstatue.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local COOLDOWN = 20 
local TIMEOUT = 10 

local function OnTimeout(inst)
    inst._task = nil
    if inst.AnimState:IsCurrentAnimation("resurrect") or
        inst.AnimState:IsCurrentAnimation("idle_broken") then
        inst.AnimState:PlayAnimation("repair")
        inst.AnimState:PushAnimation("idle_activate", false)
        inst.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_activate")
        inst._enablelights:set(true)
    end
end

local function OnHaunt(inst, haunter)
    if inst._task == nil and
        haunter:CanUseTouchStone(inst) and
        inst.AnimState:IsCurrentAnimation("idle_activate") then
        inst.AnimState:PlayAnimation("resurrect")
        inst.AnimState:PushAnimation("idle_broken", false)
        inst.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_break")
        inst._enablelights:set(false)
        inst._task = inst:DoTaskInTime(TIMEOUT, OnTimeout)
        return true
    end
end

local function OnAnimOver(inst)
    if inst.components.hauntable == nil and
        inst.AnimState:IsCurrentAnimation("idle_activate") then
        inst:AddComponent("hauntable")
        inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
        inst.components.hauntable:SetOnHauntFn(OnHaunt)
    end
end

local function OnActivateResurrection(inst, guy)
    if inst._task ~= nil then
        inst._task:Cancel()
        inst._task = nil
    end
    TheWorld:PushEvent("ms_sendlightningstrike", inst:GetPosition())
    inst.SoundEmitter:PlaySound("dontstarve/common/resurrectionstone_break")
    inst.components.cooldown:StartCharging()
    guy:PushEvent("usedtouchstone", inst)
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, .5)
	inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)
    inst.Physics:ClearCollisionMask()
    inst.Physics:CollidesWith(COLLISION.WORLD)
    inst.Physics:CollidesWith(COLLISION.ITEMS)
    inst.Physics:CollidesWith(COLLISION.CHARACTERS)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("nosweatresurrectionstone.png")
	
    inst.AnimState:SetBank("nosweatresurrectionstone")
    inst.AnimState:SetBuild("nosweatresurrectionstone")
    inst.AnimState:PlayAnimation("idle_activate")
    
	inst:AddTag("structure")
	inst:AddTag("nosweatresurrectionstone")
	inst:AddTag("antlion_sinkhole_blocker")
	inst:AddTag("resurrector")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
	inst:AddComponent("cooldown")
    inst.components.cooldown.cooldown_duration = COOLDOWN
    inst.components.cooldown.onchargedfn = OnCharged
    inst.components.cooldown.startchargingfn = OnStartCharging
    inst.components.cooldown.charged = true

    inst._task = nil

    inst:ListenForEvent("animover", OnAnimOver)
    inst:ListenForEvent("activateresurrection", OnActivateResurrection)
	
    return inst
end

return Prefab("kyno_compromisingstatue", fn, assets),
MakePlacer("kyno_compromisingstatue_placer", "nosweatresurrectionstone", "nosweatresurrectionstone", "idle_activate")