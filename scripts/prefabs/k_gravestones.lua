require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/gravestones.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gravestone1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gravestone1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gravestone2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gravestone2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gravestone3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gravestone3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gravestone4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gravestone4.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function grave1fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gravestones.png")
	
    MakeObstaclePhysics(inst, .25)
	
    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("grave1")
    
	inst:AddTag("structure")
	inst:AddTag("grave")
	
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
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	
    return inst
end

local function grave2fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gravestones.png")
	
    MakeObstaclePhysics(inst, .25)
	
    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("grave2")
    
	inst:AddTag("structure")
	inst:AddTag("grave")
	
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
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	
    return inst
end

local function grave3fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gravestones.png")
	
    MakeObstaclePhysics(inst, .25)
	
    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("grave3")
    
	inst:AddTag("structure")
	inst:AddTag("grave")
	
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
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	
    return inst
end

local function grave4fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gravestones.png")
	
    MakeObstaclePhysics(inst, .25)
	
    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("grave4")
    
	inst:AddTag("structure")
	inst:AddTag("grave")
	
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
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	
    return inst
end

return Prefab("kyno_gravestone1", grave1fn, assets),
Prefab("kyno_gravestone2", grave2fn, assets),
Prefab("kyno_gravestone3", grave3fn, assets),
Prefab("kyno_gravestone4", grave4fn, assets),
MakePlacer("kyno_gravestone1_placer", "gravestone", "gravestones", "grave1"),
MakePlacer("kyno_gravestone2_placer", "gravestone", "gravestones", "grave2"),
MakePlacer("kyno_gravestone3_placer", "gravestone", "gravestones", "grave3"),
MakePlacer("kyno_gravestone4_placer", "gravestone", "gravestones", "grave4")