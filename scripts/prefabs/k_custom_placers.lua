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
MakePlacer("kyno_mandrake_planted_placer", "mandrake", "mandrake", "ground"),
MakePlacer("kyno_carrotplanted_placer", "carrot", "carrot", "planted"),
MakePlacer("kyno_lumpy_sapling_placer", "pinecone", "pinecone", "idle_planted2"),
MakePlacer("kyno_marsh_tree_placer", "marsh_tree", "tree_marsh", "sway1_loop"),
MakePlacer("kyno_petrified_tree_short_placer", "petrified_tree_short", "petrified_tree_short", "full"),
MakePlacer("kyno_petrified_tree_placer", "petrified_tree", "petrified_tree", "full"),
MakePlacer("kyno_petrified_tree_tall_placer", "petrified_tree_tall", "petrified_tree_tall", "full"),
MakePlacer("kyno_petrified_tree_old_placer", "petrified_tree_old", "petrified_tree_old", "full"),
MakePlacer("kyno_marbletree1_placer", "marble_trees", "marble_trees", "full_1"),
MakePlacer("kyno_marbletree2_placer", "marble_trees", "marble_trees", "full_2"),
MakePlacer("kyno_marbletree3_placer", "marble_trees", "marble_trees", "full_3"),
MakePlacer("kyno_marbletree4_placer", "marble_trees", "marble_trees", "full_4"),
MakePlacer("kyno_rock1_placer", "rock", "rock", "full"),
MakePlacer("kyno_rock2_placer", "rock2", "rock2", "full"),
MakePlacer("kyno_rockflintless_placer", "rock_flintless", "rock_flintless", "full"),
MakePlacer("kyno_rockice_placer", "ice_boulder", "ice_boulder", "full"),
MakePlacer("kyno_rockmoon_placer", "rock5", "rock7", "full"),
MakePlacer("kyno_moonrubble_placer", "moonrock_pieces", "moonrock_pieces", "s3"),
MakePlacer("kyno_moonglass_placer", "moonglass_rock", "moonglass_rock", "full"),
MakePlacer("kyno_pigtorch_placer", "pigtorch", "pig_torch", "idle"),
MakePlacer("kyno_rundown_placer", "merm_house", "merm_house", "idle"),
MakePlacer("kyno_rabbithole_placer", "rabbithole", "rabbit_hole", "idle"),
MakePlacer("kyno_hollowstump_placer", "catcoon_den", "catcoon_den", "idle"),
MakePlacer("kyno_houndmound_placer", "houndbase", "hound_base", "idle"),
MakePlacer("kyno_beehive_placer", "beehive", "beehive", "cocoon_small"),
MakePlacer("kyno_wasphive_placer", "wasphive", "wasphive", "cocoon_small"),
MakePlacer("kyno_nestground_placer", "nesting_ground", "nesting_ground", "idle", true),
MakePlacer("kyno_molehill_placer", "mole", "mole_build", "mound_idle"),
MakePlacer("kyno_moonspiderden_placer", "spider_mound_mutated", "spider_mound_mutated", "full"),
MakePlacer("kyno_statueharp_placer", "statue_small", "statue_small_harp_build", "full"),
MakePlacer("kyno_marblepillar_placer", "marble_pillar", "marble_pillar", "full"),
MakePlacer("kyno_succulent_plant_placer", "succulent", "succulent", "idle")