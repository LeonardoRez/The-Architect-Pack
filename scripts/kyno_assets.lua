local _G = GLOBAL
local require = GLOBAL.require

Assets = {
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_obsidian.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_obsidian.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_charcoal.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_charcoal.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_volcano_shrub.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_volcano_shrub.xml"),
	
	Asset("IMAGE", "images/inventoryimages/dug_coffeebush.tex"),
	Asset("ATLAS", "images/inventoryimages/dug_coffeebush.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_altar_pillar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_altar_pillar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_volcano_altar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_volcano_altar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_workbench.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_workbench.xml"),
		
    Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw.xml"),
	
	Asset("IMAGE", "images/tabimages/kyno_shipwreckedtab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_shipwreckedtab.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sw_catalogue_book.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sw_catalogue_book.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_limpet.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_limpet.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_shipmast.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_shipmast.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_shipmast.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_shipmast.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_debris_1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_debris_1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_debris_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_debris_2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_debris_3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_debris_3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_crate.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_crate.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_living_jungletree.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_living_jungletree.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magmarock.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magmarock.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magmarock_gold.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magmarock_gold.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sharkittenden.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sharkittenden.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_potato.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_potato.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mermhut.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mermhut.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fishermermhut.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fishermermhut.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tidalpool.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tidalpool.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_poisonhole.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_poisonhole.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_slotmachine.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_slotmachine.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wildbore_head.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wildbore_head.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sandbagsmall_item.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sandbagsmall_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw_2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mangrovetree.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mangrovetree.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wreck_1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wreck_1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wreck_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wreck_2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wreck_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wreck_2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wreck_3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wreck_3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wreck_4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wreck_4.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_brain_rock.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_brain_rock.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_coral_1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_coral_1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_coral_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_coral_2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rock_coral_3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rock_coral_3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_redbarrel.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_redbarrel.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bermudatriangle.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bermudatriangle.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_octopusking.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_octopusking.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_luggagechest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_luggagechest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fishinhole.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fishinhole.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_buriedtreasure.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_buriedtreasure.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_krissure.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_krissure.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_lavapool.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_lavapool.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_dragoonegg.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dragoonegg.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_krakenchest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_krakenchest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_watercrate.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_watercrate.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_woodlegs_cage.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_woodlegs_cage.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tartrap.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tartrap.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tarpit.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tarpit.xml"),
	
	-- Unlisted Assets --
	Asset("ANIM", "anim/mod_turfs.zip"),
	Asset("ANIM", "anim/kyno_catalogues.zip"),
	-- Volcano Assets --
	Asset("ANIM", "anim/dragoon_den.zip"),
	Asset("ANIM", "anim/cactus_volcano.zip"),
	Asset("ANIM", "anim/rock_obsidian.zip"),
	Asset("ANIM", "anim/rock_charcoal.zip"),
	Asset("ANIM", "anim/volcano_shrub.zip"),
	Asset("ANIM", "anim/coffeebush.zip"),
	Asset("ANIM", "anim/kyno_coffeebeans.zip"),
	Asset("ANIM", "anim/coffee.zip"),
	Asset("ANIM", "anim/altar_pillar.zip"),
	Asset("ANIM", "anim/volcano_altar.zip"),
	Asset("ANIM", "anim/volcano_altar_fx.zip"),
	Asset("ANIM", "anim/workbench_obsidian.zip"),
	-- Shipwrecked Assets --
	Asset("ANIM", "anim/portal_shipwrecked.zip"),
	Asset("ANIM", "anim/portal_shipwrecked_build.zip"),
	Asset("ANIM", "anim/limpetrock.zip"),
	Asset("ANIM", "anim/bush_vine.zip"),
	Asset("ANIM", "anim/bambootree.zip"),
	Asset("ANIM", "anim/bambootree_build.zip"),
	Asset("ANIM", "anim/jungletreeseed.zip"),
	Asset("ANIM", "anim/tree_jungle_build.zip"),
	Asset("ANIM", "anim/tree_jungle_normal.zip"),
	Asset("ANIM", "anim/tree_jungle_short.zip"),
	Asset("ANIM", "anim/tree_jungle_tall.zip"),
	Asset("ANIM", "anim/dust_fx.zip"),
	Asset("ANIM", "anim/coconut.zip"),
	Asset("ANIM", "anim/palmtree_build.zip"),
	Asset("ANIM", "anim/palmtree_normal.zip"),
	Asset("ANIM", "anim/palmtree_short.zip"),
	Asset("ANIM", "anim/palmtree_tall.zip"),
	Asset("ANIM", "anim/sand_dune.zip"),
	Asset("ANIM", "anim/seashell.zip"),
	Asset("ANIM", "anim/parrot_pirate_intro.zip"),
	Asset("ANIM", "anim/crates.zip"),
	Asset("ANIM", "anim/living_jungle_tree.zip"),
	Asset("ANIM", "anim/rock_magma_gold.zip"),
	Asset("ANIM", "anim/rock_magma.zip"),
	Asset("ANIM", "anim/monkey_barrel_tropical.zip"),
	Asset("ANIM", "anim/sharkitten_den.zip"),
	Asset("ANIM", "anim/sweet_potato.zip"),
	Asset("ANIM", "anim/merm_sw_house.zip"),
	Asset("ANIM", "anim/merm_fisherman_house.zip"),
	Asset("ANIM", "anim/tidal_pool.zip"),
	Asset("ANIM", "anim/marsh_plant_tropical.zip"),
	Asset("ANIM", "anim/poison_hole.zip"),
	Asset("ANIM", "anim/slot_machine.zip"),
	Asset("ANIM", "anim/pig_house_tropical.zip"),
	Asset("ANIM", "anim/wildbore_head.zip"),
	Asset("ANIM", "anim/chiminea.zip"),
	Asset("ANIM", "anim/chiminea_fire.zip"),
	Asset("ANIM", "anim/firepit_obsidian.zip"),
	Asset("ANIM", "anim/palmleaf_hut.zip"),
	Asset("ANIM", "anim/palmleaf_hut_shdw.zip"),
	Asset("ANIM", "anim/doydoy_nest.zip"),
	Asset("ANIM", "anim/icemachine.zip"),
	Asset("ANIM", "anim/sand_castle.zip"),
	Asset("ANIM", "anim/piratihatitator.zip"),
	Asset("ANIM", "anim/sandbag_small.zip"),
	Asset("ANIM", "anim/sandbag.zip"),
	Asset("ANIM", "anim/wall_limestone.zip"),
	Asset("ANIM", "anim/woodlegs_cage.zip"),
	Asset("ANIM", "anim/woodlegs.zip"),
	Asset("ANIM", "anim/x_marks_spot.zip"),
	Asset("ANIM", "anim/geyser.zip"),
	Asset("ANIM", "anim/lava_pool.zip"),
	Asset("ANIM", "anim/dragoonegg.zip"),
	Asset("ANIM", "anim/tar_trap.zip"),
	Asset("ANIM", "anim/kyno_turfs.zip"),
	-- Sea Content --
	Asset("ANIM", "anim/tree_mangrove_build.zip"),
	Asset("ANIM", "anim/tree_mangrove_normal.zip"),
	Asset("ANIM", "anim/tree_mangrove_short.zip"),
	Asset("ANIM", "anim/tree_mangrove_tall.zip"),
	Asset("ANIM", "anim/shipwreck.zip"),
	Asset("ANIM", "anim/seaweed.zip"),
	Asset("ANIM", "anim/brain_coral_rock.zip"),
	Asset("ANIM", "anim/wall_sea.zip"),
	Asset("ANIM", "anim/wall_enforcedlimestone.zip"),
	Asset("ANIM", "anim/coral_rock.zip"),
	Asset("ANIM", "anim/gunpowder_barrel.zip"),
	Asset("ANIM", "anim/bermudatriangle.zip"),
	Asset("ANIM", "anim/ballphin_house.zip"),
	Asset("ANIM", "anim/octopus.zip"),
	Asset("ANIM", "anim/luggage.zip"),
	Asset("ANIM", "anim/fishschool.zip"),
	Asset("ANIM", "anim/buoy.zip"),
	Asset("ANIM", "anim/fire_water_pit.zip"),
	Asset("ANIM", "anim/sea_yard.zip"),
	Asset("ANIM", "anim/tar_extractor.zip"),
	Asset("ANIM", "anim/tar_extractor_meter.zip"),
	Asset("ANIM", "anim/musselfarm.zip"),
	Asset("ANIM", "anim/fish_farm.zip"),
	Asset("ANIM", "anim/researchlab5.zip"),
	Asset("ANIM", "anim/kraken_chest.zip"),
	Asset("ANIM", "anim/water_chest.zip"),
	Asset("ANIM", "anim/graves_water.zip"),
    Asset("ANIM", "anim/graves_water_crate.zip"),
	Asset("ANIM", "anim/tar_pit.zip"),
}