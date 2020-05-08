require "prefabutil"

local assets = 
{
	Asset("ANIM", "anim/pillar_ruins.zip"),
	Asset("ANIM", "anim/pillar_atrium.zip"),
	Asset("ANIM", "anim/pillar_algae.zip"),
	Asset("ANIM", "anim/pillar_cave.zip"),
	Asset("ANIM", "anim/pillar_cave_flintless.zip"),
	Asset("ANIM", "anim/pillar_cave_rock.zip"),
	Asset("ANIM", "anim/pillar_stalactite.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_ruins.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_ruins.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_algae.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_algae.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_atrium.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_atrium.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_atrium_on.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_atrium_on.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_cave.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_cave.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_rock.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_rock.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_flintless.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_flintless.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pillar_stalactite.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pillar_stalactite.xml"),
}  

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function ruinsfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_ruins")
	inst.AnimState:SetBuild("pillar_ruins")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function algaefn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_algae")
	inst.AnimState:SetBuild("pillar_algae")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function atriumfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_atrium")
	inst.AnimState:SetBuild("pillar_atrium")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function atriumonfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_atrium")
	inst.AnimState:SetBuild("pillar_atrium")
	inst.AnimState:PlayAnimation("idle_active", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function cavefn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_cave")
	inst.AnimState:SetBuild("pillar_cave")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function flintlessfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_cave_flintless")
	inst.AnimState:SetBuild("pillar_cave_flintless")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function rockfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	MakeObstaclePhysics(inst, 2.35)
	
	inst.AnimState:SetBank("pillar_cave_rock")
	inst.AnimState:SetBuild("pillar_cave_rock")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

local function stalactitefn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("pillar_stalactite")
	inst.AnimState:SetBuild("pillar_stalactite")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("giantpillar")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(10)
	inst.components.workable:SetOnFinishCallback(onhammered)

	return inst
end

return Prefab("kyno_pillar_ruins", ruinsfn, assets, prefabs),
Prefab("kyno_pillar_algae", algaefn, assets, prefabs),
Prefab("kyno_pillar_atrium", atriumfn, assets, prefabs),
Prefab("kyno_pillar_atrium_on", atriumonfn, assets, prefabs),
Prefab("kyno_pillar_cave", cavefn, assets, prefabs),
Prefab("kyno_pillar_flintless", flintlessfn, assets, prefabs),
Prefab("kyno_pillar_rock", rockfn, assets, prefabs),
Prefab("kyno_pillar_stalactite", stalactitefn, assets, prefabs),
MakePlacer("kyno_pillar_ruins_placer", "pillar_ruins", "pillar_ruins", "idle"),
MakePlacer("kyno_pillar_algae_placer", "pillar_algae", "pillar_algae", "idle"),
MakePlacer("kyno_pillar_atrium_placer", "pillar_atrium", "pillar_atrium", "idle"),
MakePlacer("kyno_pillar_atrium_on_placer", "pillar_atrium", "pillar_atrium", "idle_active"),
MakePlacer("kyno_pillar_cave_placer", "pillar_cave", "pillar_cave", "idle"),
MakePlacer("kyno_pillar_flintless_placer", "pillar_cave_flintless", "pillar_cave_flintless", "idle"),
MakePlacer("kyno_pillar_rock_placer", "pillar_cave_rock", "pillar_cave_rock", "idle"),
MakePlacer("kyno_pillar_stalactite_placer", "pillar_stalactite", "pillar_stalactite", "idle")