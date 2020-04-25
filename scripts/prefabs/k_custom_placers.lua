local function cottontreeplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("quagmire_tree_cotton_trunk_build")
	inst.AnimState:Hide("swap_tapper")
    inst.AnimState:Hide("sap")
end

local function plantedcarrotplacetestfn(inst)
	-- inst.AnimState:AddOverrideBuild("quagmire_soil")
	inst.AnimState:Show("crop_bulb1")
	inst.AnimState:Show("crop_leaf1")
	inst.AnimState:Show("soil_back")
	inst.AnimState:Show("soil_front")
end

local function plantedpotatoplacetestfn(inst)
	inst.AnimState:Show("crop_bulb2")
	inst.AnimState:Show("crop_leaf2")
	inst.AnimState:Show("soil_back")
	inst.AnimState:Show("soil_front")
end

local function plantedturnipplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("quagmire_soil")
	inst.AnimState:Hide("mouseover")
	inst.AnimState:Show("crop_bulb1")
	inst.AnimState:Show("crop_leaf1")
end

local function plantedwheatplacetestfn(inst)
	inst.AnimState:Show("crop_bulb3")
	inst.AnimState:Show("crop_leaf3")
	inst.AnimState:Show("soil_back")
	inst.AnimState:Show("soil_front")
end

return
MakePlacer("cottontree_normal_placer", "quagmire_tree_cotton_normal", "quagmire_tree_cotton_build", "sway1_loop", false, nil, nil, nil, nil, nil, cottontreeplacetestfn),
MakePlacer("kyno_carrot_planted_placer", "quagmire_soil", "quagmire_crop_carrot", "crop_full", false, nil, nil, nil, nil, nil, plantedcarrotplacetestfn),
MakePlacer("kyno_potato_planted_placer", "quagmire_soil", "quagmire_crop_potato", "crop_full", false, nil, nil, nil, nil, nil, plantedpotatoplacetestfn),
MakePlacer("kyno_turnip_planted_placer", "quagmire_soil", "quagmire_crop_turnip", "crop_full", false, nil, nil, nil, nil, nil, plantedcarrotplacetestfn),
MakePlacer("kyno_onion_planted_placer", "quagmire_soil", "quagmire_crop_onion", "crop_full", false, nil, nil, nil, nil, nil, plantedcarrotplacetestfn),
MakePlacer("kyno_wheat_planted_placer", "quagmire_soil", "quagmire_crop_wheat", "crop_full", false, nil, nil, nil, nil, nil, plantedwheatplacetestfn),
MakePlacer("kyno_garlic_planted_placer", "quagmire_soil", "quagmire_crop_garlic", "crop_full", false, nil, nil, nil, nil, nil, plantedcarrotplacetestfn),
MakePlacer("kyno_tomato_planted_placer", "quagmire_soil", "quagmire_crop_tomato", "crop_full", false, nil, nil, nil, nil, plantedpotatoplacetestfn),
MakePlacer("kyno_red_mushroom_placer", "mushrooms", "mushrooms", "red"),
MakePlacer("kyno_green_mushroom_placer", "mushrooms", "mushrooms", "green"),
MakePlacer("kyno_blue_mushroom_placer", "mushrooms", "mushrooms", "blue"),
MakePlacer("kyno_rose_placer", "flowers", "flowers", "rose"),
MakePlacer("kyno_flower_withered_placer", "withered_flowers", "withered_flowers", "wf3"),
MakePlacer("kyno_mandrake_planted_placer", "mandrake", "mandrake", "ground")