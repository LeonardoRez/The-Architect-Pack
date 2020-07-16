require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/blocker.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_basalt1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_basalt1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_basalt2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_basalt2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_basalt3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_basalt3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_basalt4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_basalt4.xml"),
}

local function onwork1(inst, worker, workleft)
	if workleft < TUNING.MARBLEPILLAR_MINE*(1/3) then
		inst.AnimState:PlayAnimation("block1", true)
	elseif workleft < TUNING.MARBLEPILLAR_MINE*(2/3) then
		inst.AnimState:PlayAnimation("block1", true)
	else
		inst.AnimState:PlayAnimation("block1", true)
	end
end

local function onwork2(inst, worker, workleft)
	if workleft < TUNING.MARBLEPILLAR_MINE*(1/3) then
		inst.AnimState:PlayAnimation("block2", true)
	elseif workleft < TUNING.MARBLEPILLAR_MINE*(2/3) then
		inst.AnimState:PlayAnimation("block2", true)
	else
		inst.AnimState:PlayAnimation("block2", true)
	end
end

local function onwork3(inst, worker, workleft)
	if workleft < TUNING.MARBLEPILLAR_MINE*(1/3) then
		inst.AnimState:PlayAnimation("block3", true)
	elseif workleft < TUNING.MARBLEPILLAR_MINE*(2/3) then
		inst.AnimState:PlayAnimation("block3", true)
	else
		inst.AnimState:PlayAnimation("block3", true)
	end
end

local function onwork4(inst, worker, workleft)
	if workleft < TUNING.MARBLEPILLAR_MINE*(1/3) then
		inst.AnimState:PlayAnimation("block4", true)
	elseif workleft < TUNING.MARBLEPILLAR_MINE*(2/3) then
		inst.AnimState:PlayAnimation("block4", true)
	else
		inst.AnimState:PlayAnimation("block4", true)
	end
end

local function onfinish(inst, worker)
	local pt = Point(inst.Transform:GetWorldPosition())
	inst.components.lootdropper:DropLoot(pt)
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function fn1()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("basalt.png")
	
	inst.AnimState:SetBank("blocker")
	inst.AnimState:SetBuild("blocker")
	inst.AnimState:PlayAnimation("block1", true)
	
	MakeObstaclePhysics(inst, 1)
	MakeSnowCoveredPristine(inst)
	
	inst:AddTag("structure")
	inst:AddTag("boulder_basalt")
	
	inst:SetPrefabNameOverride("basalt")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.MARBLEPILLAR_MINE)
	inst.components.workable:SetOnWorkCallback(onwork1)
	inst.components.workable:SetOnFinishCallback(onfinish)
	
	MakeSnowCovered(inst)

	return inst
end

local function fn2()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("basalt.png")
	
	inst.AnimState:SetBank("blocker")
	inst.AnimState:SetBuild("blocker")
	inst.AnimState:PlayAnimation("block2", true)
	
	MakeObstaclePhysics(inst, 1)
	MakeSnowCoveredPristine(inst)
	
	inst:AddTag("structure")
	inst:AddTag("boulder_basalt")
	
	inst:SetPrefabNameOverride("basalt")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.MARBLEPILLAR_MINE)
	inst.components.workable:SetOnWorkCallback(onwork2)
	inst.components.workable:SetOnFinishCallback(onfinish)
	
	MakeSnowCovered(inst)

	return inst
end

local function fn3()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("basalt.png")
	
	inst.AnimState:SetBank("blocker")
	inst.AnimState:SetBuild("blocker")
	inst.AnimState:PlayAnimation("block3", true)
	
	MakeObstaclePhysics(inst, 1)
	MakeSnowCoveredPristine(inst)
	
	inst:AddTag("structure")
	inst:AddTag("boulder_basalt")
	
	inst:SetPrefabNameOverride("basalt")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.MARBLEPILLAR_MINE)
	inst.components.workable:SetOnWorkCallback(onwork3)
	inst.components.workable:SetOnFinishCallback(onfinish)
	
	MakeSnowCovered(inst)

	return inst
end

local function fn4()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("basalt.png")
	
	inst.AnimState:SetBank("blocker")
	inst.AnimState:SetBuild("blocker")
	inst.AnimState:PlayAnimation("block4", true)
	
	MakeObstaclePhysics(inst, 1)
	MakeSnowCoveredPristine(inst)
	
	inst:AddTag("structure")
	inst:AddTag("boulder_basalt")
	
	inst:SetPrefabNameOverride("basalt")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.MARBLEPILLAR_MINE)
	inst.components.workable:SetOnWorkCallback(onwork4)
	inst.components.workable:SetOnFinishCallback(onfinish)
	
	MakeSnowCovered(inst)

	return inst
end

return Prefab("kyno_basalt1", fn1, assets, prefabs),
Prefab("kyno_basalt2", fn2, assets, prefabs),
Prefab("kyno_basalt3", fn3, assets, prefabs),
Prefab("kyno_basalt4", fn4, assets, prefabs),
MakePlacer("kyno_basalt1_placer", "blocker", "blocker", "block1"),
MakePlacer("kyno_basalt2_placer", "blocker", "blocker", "block2"),
MakePlacer("kyno_basalt3_placer", "blocker", "blocker", "block3"),
MakePlacer("kyno_basalt4_placer", "blocker", "blocker", "block4")