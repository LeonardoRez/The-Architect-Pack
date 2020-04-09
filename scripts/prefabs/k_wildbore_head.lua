require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/wildbore_head.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wildbore_head.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wildbore_head.xml"),
}

local function OnFinish(inst)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    if TheWorld.state.isfullmoon then
        inst.components.lootdropper:SpawnLootPrefab("nightmarefuel")
    end
    inst.components.lootdropper:DropLoot()
    inst:Remove()
end

local function OnWorked(inst) 
    if not inst:HasTag("burnt") then 
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation(inst.awake and "idle_awake" or "idle_asleep")
    end
end

local function OnFullMoon(inst, isfullmoon)
    if not inst:HasTag("burnt") then
        if isfullmoon then
            if not inst.awake then
                inst.awake = true
                inst.AnimState:PlayAnimation("wake")
                inst.AnimState:PushAnimation("idle_awake", false)
            end
        elseif inst.awake then
            inst.awake = nil
            inst.AnimState:PlayAnimation("sleep")
            inst.AnimState:PushAnimation("idle_asleep", false)
        end
    end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function OnFinishHaunt(inst)
    if inst.awake and not (TheWorld.state.isfullmoon or inst:HasTag("burnt")) then
        inst.awake = nil
        inst.AnimState:PlayAnimation("sleep")
        inst.AnimState:PushAnimation("idle_asleep", false)
    end
end

local function OnHaunt(inst, haunter)
    if not (inst.awake or inst:HasTag("burnt")) then
        inst.awake = true
        inst.AnimState:PlayAnimation("wake")
        inst.AnimState:PushAnimation("idle_awake")
        inst:DoTaskInTime(4, OnFinishHaunt)
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_TINY
        return true
    end
    return false
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	
	inst.AnimState:SetBank("wildbore_head")
	inst.AnimState:SetBuild("wildbore_head")
	inst.AnimState:PlayAnimation("idle_asleep")
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst.flies = inst:SpawnChild("flies")
    inst.awake = nil
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
    inst.components.workable:SetOnWorkCallback(OnWorked)
    inst.components.workable.onfinish = OnFinish

	MakeSmallBurnable(inst, nil, nil, true)
    MakeSmallPropagator(inst)

    inst.OnSave = onsave
    inst.OnLoad = onload

    inst:WatchWorldState("isfullmoon", OnFullMoon)
    OnFullMoon(inst, TheWorld.state.isfullmoon)

    inst:AddComponent("hauntable")
    inst.components.hauntable.cooldown = TUNING.HAUNT_COOLDOWN_MEDIUM
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

	return inst
end

return Prefab("kyno_wildbore_head", fn, assets, prefabs),
MakePlacer("kyno_wildbore_head_placer", "wildbore_head", "wildbore_head", "idle_asleep")