require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/rugs.zip"),
	Asset("ANIM", "anim/pig_shop_doormats.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_circle.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_circle.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_moth.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_moth.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_throneroom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_throneroom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_worn.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_worn.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_leather.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_leather.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_antiquities.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_antiquities.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_bank.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_bank.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_deli.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_deli.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_flag.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_flag.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_florist.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_florist.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_general.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_general.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_gift.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_gift.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_hoofspa.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_hoofspa.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_old.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_old.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_produce.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_produce.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rugs_tinker.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rugs_tinker.xml"),
	
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
    inst.Transform:SetRotation((rotation + 90) % 360)
end

local function common(burnable, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    inst.AnimState:SetBank("rugs")
    inst.AnimState:SetBuild("rugs")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
    
	inst:AddTag("structure")
	inst:AddTag("rugs")
	inst:AddTag("NOBLOCK")
	
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

local function common2(burnable, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetScale(1.4, 1.4, 1.4)
	
    inst.AnimState:SetBank("pig_shop_doormats")
    inst.AnimState:SetBuild("pig_shop_doormats")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
    
	inst:AddTag("structure")
	inst:AddTag("rugs")
	inst:AddTag("NOBLOCK")
	
	if save_rotation then
		inst.Transform:SetFourFaced()
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

local function circle()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("half_circle")
    return inst
end

local function beard()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_beard")
    return inst
end

local function braid()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_braid")
    return inst
end

local function catcoon()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_catcoon")
    return inst
end

local function crime()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_crime")
    return inst
end

local function fur()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_fur")
    return inst
end

local function hedgehog()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_hedgehog")
    return inst
end

local function hoofprints()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_hoofprints")
    return inst
end

local function leather()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_leather")
    return inst
end

local function metal()
    local inst = common(false, true)
    inst.AnimState:PlayAnimation("rug_metal")
    return inst
end

local function moth()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_moth_eaten")
    return inst
end

local function nailbed()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_nailbed")
    return inst
end

local function octagon()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_octagon")
    return inst
end

local function oval()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_oval")
    return inst
end

local function porcupuss()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_porcupuss")
    return inst
end

local function rectangle()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_rectangle")
    return inst
end

local function round()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_round")
    return inst
end

local function rubbermat()
    local inst = common(false, true)
    inst.AnimState:PlayAnimation("rug_rubbermat")
    return inst
end

local function square()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_square")
    return inst
end

local function swirl()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_swirl")
    return inst
end

local function throneroom()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_throneroom")
    return inst
end

local function tiles()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_tiles")
    return inst
end

local function web()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_web")
    return inst
end

local function wormhole()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_wormhole")
    return inst
end

local function worn()
    local inst = common(true, true)
    inst.AnimState:PlayAnimation("rug_worn")
    return inst
end

local function antiquities()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_antiquities")
    return inst
end

local function bank()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_bank")
    return inst
end

local function deli()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_deli")
    return inst
end

local function flag()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_flag")
    return inst
end

local function florist()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_florist")
    return inst
end

local function general()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_general")
    return inst
end

local function gift()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_giftshop")
    return inst
end

local function hoofspa()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_hoofspa")
    return inst
end

local function old()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_old")
    return inst
end

local function produce()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_produce")
    return inst
end

local function tinker()
    local inst = common2(true, true)
    inst.AnimState:PlayAnimation("idle_tinker")
    return inst
end

local function rugplacefn(inst)
	inst.AnimState:SetScale(1.2, 1.2, 1.2)
end

return Prefab("kyno_rugs_circle", circle, assets),
Prefab("kyno_rugs_beard", beard, assets),
Prefab("kyno_rugs_braid", braid, assets),
Prefab("kyno_rugs_catcoon", catcoon, assets),
Prefab("kyno_rugs_crime", crime, assets),
Prefab("kyno_rugs_fur", fur, assets),
Prefab("kyno_rugs_hedgehog", hedgehog, assets),
Prefab("kyno_rugs_hoofprints", hoofprints, assets),
Prefab("kyno_rugs_leather", leather, assets),
Prefab("kyno_rugs_metal", metal, assets),
Prefab("kyno_rugs_moth", moth, assets),
Prefab("kyno_rugs_nailbed", nailbed, assets),
Prefab("kyno_rugs_octagon", octagon, assets),
Prefab("kyno_rugs_oval", oval, assets),
Prefab("kyno_rugs_porcupuss", porcupuss, assets),
Prefab("kyno_rugs_rectangle", rectangle, assets),
Prefab("kyno_rugs_round", round, assets),
Prefab("kyno_rugs_rubbermat", rubbermat, assets),
Prefab("kyno_rugs_square", square, assets),
Prefab("kyno_rugs_swirl", swirl, assets),
Prefab("kyno_rugs_throneroom", throneroom, assets),
Prefab("kyno_rugs_tiles", tiles, assets),
Prefab("kyno_rugs_web", web, assets),
Prefab("kyno_rugs_wormhole", wormhole, assets),
Prefab("kyno_rugs_worn", worn, assets),
Prefab("kyno_rugs_antiquities", antiquities, assets),
Prefab("kyno_rugs_bank", bank, assets),
Prefab("kyno_rugs_deli", deli, assets),
Prefab("kyno_rugs_flag", flag, assets),
Prefab("kyno_rugs_florist", florist, assets),
Prefab("kyno_rugs_general", general, assets),
Prefab("kyno_rugs_gift", gift, assets),
Prefab("kyno_rugs_hoofspa", hoofspa, assets),
Prefab("kyno_rugs_old", old, assets),
Prefab("kyno_rugs_produce", produce, assets),
Prefab("kyno_rugs_tinker", tinker, assets),
MakePlacer("kyno_rugs_circle_placer", "rugs", "rugs", "half_circle", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_beard_placer", "rugs", "rugs", "rug_beard", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_braid_placer", "rugs", "rugs", "rug_braid", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_catcoon_placer", "rugs", "rugs", "rug_catcoon", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_crime_placer", "rugs", "rugs", "rug_crime", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_fur_placer", "rugs", "rugs", "rug_fur", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_hedgehog_placer", "rugs", "rugs", "rug_hedgehog", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_hoofprints_placer", "rugs", "rugs", "rug_hoofprints", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_leather_placer", "rugs", "rugs", "rug_leather", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_metal_placer", "rugs", "rugs", "rug_metal", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_moth_placer", "rugs", "rugs", "rug_moth_eaten", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_nailbed_placer", "rugs", "rugs", "rug_nailbed", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_octagon_placer", "rugs", "rugs", "rug_octagon", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_oval_placer", "rugs", "rugs", "rug_oval", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_porcupuss_placer", "rugs", "rugs", "rug_porcupuss", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_rectangle_placer", "rugs", "rugs", "rug_rectangle", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_round_placer", "rugs", "rugs", "rug_round", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_rubbermat_placer", "rugs", "rugs", "rug_rubbermat", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_square_placer", "rugs", "rugs", "rug_square", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_swirl_placer", "rugs", "rugs", "rug_swirl", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_throneroom_placer", "rugs", "rugs", "rug_throneroom", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_tiles_placer", "rugs", "rugs", "rug_tiles", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_web_placer", "rugs", "rugs", "rug_web", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_wormhole_placer", "rugs", "rugs", "rug_wormhole", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_worn_placer", "rugs", "rugs", "rug_worn", true, true, nil, nil, nil, 90),
MakePlacer("kyno_rugs_antiquities_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_antiquities", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_bank_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_bank", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_deli_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_deli", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_flag_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_flag", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_florist_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_florist", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_general_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_general", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_gift_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_giftshop", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_hoofspa_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_hoofspa", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_old_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_old", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_produce_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_produce", true, true, nil, nil, nil, 90, rugplacefn),
MakePlacer("kyno_rugs_tinker_placer", "pig_shop_doormats", "pig_shop_doormats", "idle_tinker", true, true, nil, nil, nil, 90, rugplacefn)