require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/kyno_salt_lick.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_salt_lick.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_salt_lick.xml"),
}

local function AlertNearbyCritters(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,y,z, TUNING.SALTLICK_CHECK_DIST, { "saltlicker" }, { "INLIMBO" })
    for i,ent in ipairs(ents) do
        ent:PushEvent("saltlick_placed", { inst = inst })
    end
end

local imagerange = 5
local function getimagenum(inst, pct)
    local image = math.ceil(pct * imagerange)
    image = imagerange - image + 1

    return tostring(image)
end

local function PlayIdle(inst, push)
    if inst:HasTag("burnt") then
        return
    end
    if push then
        inst.AnimState:PushAnimation("idle1", true)
    else
        inst.AnimState:PlayAnimation("idle1", true)
    end
end

local function OnUsed(inst, data)
    PlayIdle(inst)
end

local function OnBuilt(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/salt_lick_craft")
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle1")
    AlertNearbyCritters(inst)
end

local function OnFinished(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("idle6", true)
    end
    inst:RemoveTag("saltlick")
end

local function OnHammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function OnHit(inst)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("dontstarve/common/salt_lick_hit")
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle1")
    end
end

local function OnBurnt(inst)
    inst:RemoveTag("saltlick")
end

local function OnSave(inst, data)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() or inst:HasTag("burnt") then
        data.burnt = true
    end
end

local function OnLoad(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .4)

    inst.MiniMapEntity:SetIcon("saltlick.png")

    inst.AnimState:SetBank("kyno_salt_lick")
    inst.AnimState:SetBuild("kyno_salt_lick")
	inst.AnimState:PlayAnimation("idle1", true)

    inst:AddTag("structure")
    inst:AddTag("saltlick")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(OnHammered)
    inst.components.workable:SetOnWorkCallback(OnHit)

    inst:ListenForEvent("onbuilt", OnBuilt)
    inst:ListenForEvent("ondropped", AlertNearbyCritters)

    MakeSnowCovered(inst)
    MakeSmallBurnable(inst, nil, nil, true)
    inst:ListenForEvent("burntup", OnBurnt)
    MakeSmallPropagator(inst)
    MakeHauntableLaunch(inst)

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

return Prefab("kyno_truesaltlick", fn, assets),
MakePlacer("kyno_truesaltlick_placer", "kyno_salt_lick", "kyno_salt_lick", "idle1")