require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/ruins_bowl.zip"),
	Asset("ANIM", "anim/ruins_chair.zip"),
	Asset("ANIM", "anim/ruins_chipbowl.zip"),
	Asset("ANIM", "anim/ruins_plate.zip"),
	Asset("ANIM", "anim/ruins_rubble.zip"),
	Asset("ANIM", "anim/ruins_table.zip"),
	Asset("ANIM", "anim/ruins_vase.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinsbowl.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinsbowl.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinschair.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinschair.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinschipbowl.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinschipbowl.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinsplate.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinsplate.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinstable.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinstable.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinsvase.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinsvase.xml"),
}

local prefabs = 
{
	"cutstone",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot_bigger")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("broken")
end

local function bowlfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_bowl")
	inst.AnimState:SetBuild("ruins_bowl")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function chairfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_chair")
	inst.AnimState:SetBuild("ruins_chair")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function chipbowlfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_chipbowl")
	inst.AnimState:SetBuild("ruins_chipbowl")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function platefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_plate")
	inst.AnimState:SetBuild("ruins_plate")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function tablefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_table")
	inst.AnimState:SetBuild("ruins_table")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function vasefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("relic.png")
	
	inst.AnimState:SetBank("ruins_vase")
	inst.AnimState:SetBuild("ruins_vase")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("brokenrelic")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_ruinsbowl", bowlfn, assets, prefabs),
Prefab("kyno_ruinschair", chairfn, assets, prefabs),
Prefab("kyno_ruinschipbowl", chipbowlfn, assets, prefabs),
Prefab("kyno_ruinsplate", platefn, assets, prefabs),
Prefab("kyno_ruinstable", tablefn, assets, prefabs),
Prefab("kyno_ruinsvase", vasefn, assets, prefabs),
MakePlacer("kyno_ruinsbowl_placer", "ruins_bowl", "ruins_bowl", "broken"),
MakePlacer("kyno_ruinschair_placer", "ruins_chair", "ruins_chair", "broken"),
MakePlacer("kyno_ruinschipbowl_placer", "ruins_chipbowl", "ruins_chipbowl", "broken"),
MakePlacer("kyno_ruinsplate_placer", "ruins_plate", "ruins_plate", "broken"),
MakePlacer("kyno_ruinstable_placer", "ruins_table", "ruins_table", "broken"),
MakePlacer("kyno_ruinsvase_placer", "ruins_vase", "ruins_vase", "broken")