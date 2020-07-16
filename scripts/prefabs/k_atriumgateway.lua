require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/atrium_gate.zip"),
    Asset("ANIM", "anim/atrium_floor.zip"),
	Asset("ANIM", "anim/kyno_ancientgateway.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ancientgateway.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ancientgateway.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ancientgateway_wip.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ancientgateway_wip.xml"),
}

local prefabs =
{
    "atrium_gate_activatedfx",
    "atrium_gate_pulsesfx",
    "atrium_gate_explodesfx",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function DoPulse(inst)
if inst:HasTag("thegateway") then
	inst:DoTaskInTime(4+math.random()*5, function() DoPulse(inst) end)
		inst.AnimState:PlayAnimation("overload_pulse")
		inst.SoundEmitter:PlaySound("dontstarve/common/together/atrium_gate/shadow_pulse")
		inst.AnimState:PushAnimation("overload_loop", true)
	end
end

local function CreateFloor()
    local inst = CreateEntity()

    inst:AddTag("DECOR")
    inst:AddTag("NOCLICK")
    --[[Non-networked entity]]
    inst.persists = false

    inst.entity:AddTransform()
    inst.entity:AddAnimState()

    inst.AnimState:SetBank("atrium_floor")
    inst.AnimState:SetBuild("atrium_floor")
    inst.AnimState:PlayAnimation("idle_active")
    inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(2)

    return inst
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
    inst.entity:AddNetwork()
	
	inst.Light:Enable(true)
    inst.Light:SetRadius(8.0)
    inst.Light:SetFalloff(.9)
    inst.Light:SetIntensity(0.65)
    inst.Light:SetColour(200 / 255, 140 / 255, 140 / 255)
	
    MakeObstaclePhysics(inst, 1)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("atrium_gate.png")
	
    inst.AnimState:SetBank("atrium_gate")
    inst.AnimState:SetBuild("atrium_gate")
    inst.AnimState:PlayAnimation("overload_loop", true)
    
	inst:AddTag("structure")
	inst:AddTag("thegateway")
	
	DoPulse(inst)
	
	if not TheNet:IsDedicated() then
        CreateFloor().entity:SetParent(inst.entity)
    end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.SoundEmitter:PlaySound("dontstarve/common/together/atrium_gate/destabilize_LP", "loop")
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("worldmigrator")
	
	MakeHauntableWork(inst)
	
    return inst
end

local function wipfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 1)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("atrium_gate.png")
	
	local k = 1.2
	inst.AnimState:SetScale(k, k, k)
	
    inst.AnimState:SetBank("kyno_ancientgateway")
    inst.AnimState:SetBuild("kyno_ancientgateway")
    inst.AnimState:PlayAnimation("idle", true)
    
	inst:AddTag("structure")
	inst:AddTag("wipgateway")
	
	if not TheNet:IsDedicated() then
        CreateFloor().entity:SetParent(inst.entity)
    end
	
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
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	MakeHauntableWork(inst)
	
    return inst
end

local function gatewayplacetestfn(inst)
	local k = 1.2
	inst.AnimState:SetScale(k, k, k)
end

return Prefab("kyno_atriumgateway", fn, assets, prefabs),
Prefab("kyno_atriumgateway_wip", wipfn, assets, prefabs),
MakePlacer("kyno_atriumgateway_placer", "atrium_gate", "atrium_gate", "idle_active"),
MakePlacer("kyno_atriumgateway_wip_placer", "kyno_ancientgateway", "kyno_ancientgateway", "idle", false, nil, nil, nil, nil, nil, gatewayplacetestfn)