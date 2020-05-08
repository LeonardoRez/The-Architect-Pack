require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/cave_exit.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_surfacestairs.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_surfacestairs.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_surfacestairs_closed.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_surfacestairs_closed.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_surfacestairs_vip.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_surfacestairs_vip.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function openfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 2)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("cave_open2.png")
	
    inst.AnimState:SetBank("cave_stairs")
    inst.AnimState:SetBuild("cave_exit")
    inst.AnimState:PlayAnimation("open")
    
	inst:AddTag("structure")
	inst:AddTag("surfacestairs")
	
	inst:SetPrefabNameOverride("cave_exit")
	
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

local function closedfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 2)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("cave_open2.png")
	
    inst.AnimState:SetBank("cave_stairs")
    inst.AnimState:SetBuild("cave_exit")
    inst.AnimState:PlayAnimation("no_access")
    
	inst:AddTag("structure")
	inst:AddTag("surfacestairs")
	
	inst:SetPrefabNameOverride("cave_exit")
	
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

local function vipfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 2)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("cave_open2.png")
	
    inst.AnimState:SetBank("cave_stairs")
    inst.AnimState:SetBuild("cave_exit")
    inst.AnimState:PlayAnimation("over_capacity")
    
	inst:AddTag("structure")
	inst:AddTag("surfacestairs")
	
	inst:SetPrefabNameOverride("cave_exit")
	
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

return Prefab("kyno_surfacestairs", openfn, assets),
Prefab("kyno_surfacestairs_closed", closedfn, assets),
Prefab("kyno_surfacestairs_vip", vipfn, assets),
MakePlacer("kyno_surfacestairs_placer", "cave_stairs", "cave_exit", "open"),
MakePlacer("kyno_surfacestairs_closed_placer", "cave_stairs", "cave_exit", "no_access"),
MakePlacer("kyno_surfacestairs_vip_placer", "cave_stairs", "cave_exit", "over_capacity")