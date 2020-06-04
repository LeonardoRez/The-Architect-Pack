require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/interior_wall_decals_florist.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_florist_latticefront.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_florist_latticefront.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_florist_latticeside.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_florist_latticeside.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_florist_pillarfront.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_florist_pillarfront.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_florist_pillarside.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_florist_pillarside.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_florist_tiered.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_florist_tiered.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_straw")
	inst:Remove()
end

local function onhit(inst, worker)
    local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

local function common(burnable, save_rotation, radius_long, shadow)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
    inst.entity:AddNetwork()
	
	if shadow then
		inst.DynamicShadow:SetSize(2.5, 1.5)
	end

	if radius_long then
		MakeObstaclePhysics(inst, 2)
	else
		MakeObstaclePhysics(inst, .6)
	end
	
    inst.AnimState:SetBank("interior_wall_decals_florist")
    inst.AnimState:SetBuild("interior_wall_decals_florist")
    
	inst:AddTag("structure")
	inst:AddTag("florist_decor")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
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
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeSmallBurnable(inst)
		MakeSmallPropagator(inst)
	end
	
    return inst
end

local function latticefront()
    local inst = common(true, true, true, false)
    inst.AnimState:PlayAnimation("lattice_front")
    return inst
end

local function latticeside()
    local inst = common(true, true, false, false)
    inst.AnimState:PlayAnimation("lattice_sidewall")
    return inst
end

local function pillarfront()
	local inst = common(true, true, false, false)
	inst.AnimState:PlayAnimation("pillar_front")
	return inst
end

local function pillarside()
	local inst = common(true, true, false, false)
	inst.AnimState:PlayAnimation("pillar_sidewall")
	return inst
end

local function tiered()
	local inst = common(true, true, false, false)
	inst.AnimState:PlayAnimation("tiered_trough")
	return inst
end

return Prefab("kyno_florist_latticefront", latticefront, assets),
Prefab("kyno_florist_latticeside", latticeside, assets),
Prefab("kyno_florist_pillarfront", pillarfront, assets),
Prefab("kyno_florist_pillarside", pillarside, assets),
Prefab("kyno_florist_tiered", tiered, assets),
MakePlacer("kyno_florist_latticefront_placer", "interior_wall_decals_florist", "interior_wall_decals_florist", "lattice_front"),
MakePlacer("kyno_florist_latticeside_placer", "interior_wall_decals_florist", "interior_wall_decals_florist", "lattice_sidewall"),
MakePlacer("kyno_florist_pillarfront_placer", "interior_wall_decals_florist", "interior_wall_decals_florist", "pillar_front"),
MakePlacer("kyno_florist_pillarside_placer", "interior_wall_decals_florist", "interior_wall_decals_florist", "pillar_sidewall"),
MakePlacer("kyno_florist_tiered_placer", "interior_wall_decals_florist", "interior_wall_decals_florist", "tiered_trough")