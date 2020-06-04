require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/interior_wall_decals_palace.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_palace_pillar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_palace_pillar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_palace_throne.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_palace_throne.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_palace_plant.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_palace_plant.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
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
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .6)
	end
	
    inst.AnimState:SetBank("wall_decals_palace")
    inst.AnimState:SetBuild("interior_wall_decals_palace")
    
	inst:AddTag("structure")
	inst:AddTag("palace_decor")
	
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

local function pillar()
    local inst = common(false, true, false, false)
    inst.AnimState:PlayAnimation("pillar")
    return inst
end

local function plant()
    local inst = common(true, true, false, false)
    inst.AnimState:PlayAnimation("plant")
    return inst
end

local function throne()
    local inst = common(false, true, true, false)
    inst.AnimState:PlayAnimation("throne")
    return inst
end

return Prefab("kyno_palace_pillar", pillar, assets),
Prefab("kyno_palace_plant", plant, assets),
Prefab("kyno_palace_throne", throne, assets),
MakePlacer("kyno_palace_pillar_placer", "wall_decals_palace", "interior_wall_decals_palace", "pillar"),
MakePlacer("kyno_palace_plant_placer", "wall_decals_palace", "interior_wall_decals_palace", "plant"),
MakePlacer("kyno_palace_throne_placer", "wall_decals_palace", "interior_wall_decals_palace", "throne")