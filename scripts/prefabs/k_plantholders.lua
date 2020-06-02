require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/interior_plant.zip"),
	
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

local function common(burnable, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, .4)
	
    inst.AnimState:SetBank("interior_plant")
    inst.AnimState:SetBuild("interior_plant")
    
	inst:AddTag("structure")
	inst:AddTag("plantholder")
	
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

local function basic()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_basic")
    return inst
end

local function bonsai()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_bonsai")
    return inst
end

local function dishgarden()
    local inst = common(false, true)
    inst.AnimState:PlayAnimation("plant_dishgarden")
    return inst
end

local function draceana()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_draceana")
    return inst
end

local function fancy()
    local inst = common(false, true)
    inst.AnimState:PlayAnimation("plant_fancy")
    return inst
end

local function fernstand()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_fernstand")
    return inst
end

local function orchid()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_orchid")
    return inst
end

local function palm()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_palm")
    return inst
end

local function philodendron()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_philodendron")
    return inst
end

local function plantpet()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_plantpet")
    return inst
end

local function terrarium()
    local inst = common(false, true)
    inst.AnimState:PlayAnimation("plant_terrarium")
    return inst
end

local function traps()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_traps")
    return inst
end

local function sadness()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_winterfeasttreeofsadness")
    return inst
end

local function wip()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_wip")
    return inst
end

local function zz()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("plant_zz")
    return inst
end

local function plantholderplacefn(inst)
	inst.AnimState:SetScale(1.1, 1.1, 1.1)
end

return Prefab("kyno_plantholder_basic", basic, assets),
Prefab("kyno_plantholder_bonsai", bonsai, assets),
Prefab("kyno_plantholder_dishgarden", dishgarden, assets),
Prefab("kyno_plantholder_draceana", draceana, assets),
Prefab("kyno_plantholder_fancy", fancy, assets),
Prefab("kyno_plantholder_fernstand", fernstand, assets),
Prefab("kyno_plantholder_orchid", orchid, assets),
Prefab("kyno_plantholder_palm", palm, assets),
Prefab("kyno_plantholder_philodendron", philodendron, assets),
Prefab("kyno_plantholder_plantpet", plantpet, assets),
Prefab("kyno_plantholder_terrarium", terrarium, assets),
Prefab("kyno_plantholder_traps", traps, assets),
Prefab("kyno_plantholder_sadness", sadness, assets),
Prefab("kyno_plantholder_wip", wip, assets),
Prefab("kyno_plantholder_zz", zz, assets),
MakePlacer("kyno_plantholder_basic_placer", "interior_plant", "interior_plant", "plant_basic", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_bonsai_placer", "interior_plant", "interior_plant", "plant_bonsai", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_dishgarden_placer", "interior_plant", "interior_plant", "plant_dishgarden", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_draceana_placer", "interior_plant", "interior_plant", "plant_draceana", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_fancy_placer", "interior_plant", "interior_plant", "plant_fancy", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_fernstand_placer", "interior_plant", "interior_plant", "plant_fernstand", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_orchid_placer", "interior_plant", "interior_plant", "plant_orchid", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_palm_placer", "interior_plant", "interior_plant", "plant_palm", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_philodendron_placer", "interior_plant", "interior_plant", "plant_philodendron", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_plantpet_placer", "interior_plant", "interior_plant", "plant_plantpet", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_terrarium_placer", "interior_plant", "interior_plant", "plant_terrarium", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_traps_placer", "interior_plant", "interior_plant", "plant_traps", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_sadness_placer", "interior_plant", "interior_plant", "plant_winterfeasttreeofsadness", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_wip_placer", "interior_plant", "interior_plant", "plant_wip", nil, true, nil, nil, nil, "two", plantholderplacefn),
MakePlacer("kyno_plantholder_zz_placer", "interior_plant", "interior_plant", "plant_zz", nil, true, nil, nil, nil, "two", plantholderplacefn)