local _G = GLOBAL
local require = GLOBAL.require

Assets = {
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
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
	
	Asset("IMAGE", "images/inventoryimages/kyno_cavecleft.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cavecleft.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigruinssmall.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigruinssmall.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigruins1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigruins1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigruins2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigruins2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigruins3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigruins3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigruins4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigruins4.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_anthill.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_anthill.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antqueenhill.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antqueenhill.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_academy.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_academy.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigpalace.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigpalace.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_farmhouse.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_farmhouse.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_smashingpot.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_smashingpot.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ancientwall.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ancientwall.xml"),
	
	Asset("IMAGE", "images/inventoryimages/wall_pig_ruins_item.tex"),
	Asset("ATLAS", "images/inventoryimages/wall_pig_ruins_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antcombhome.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antcombhome.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antchest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antchest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antcache.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antcache.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_artichoke.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_artichoke.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_calendar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_calendar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_pigstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_pigstatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_antstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_antstatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_idolstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_idolstatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_plaquestatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_plaquestatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_trufflestatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_trufflestatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruins_sowstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruins_sowstatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wishingwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wishingwell.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_endwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_endwell.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_dartstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dartstatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_speartrap.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_speartrap.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_teeteringpillar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_teeteringpillar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinspillar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinspillar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ruinspillarblue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinspillarblue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fountainyouth.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fountainyouth.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_trapdoor.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_trapdoor.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_snakebody.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_snakebody.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_exoticflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_exoticflower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_eruption.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_eruption.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_brazier.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_brazier.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_balloon.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_balloon.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_basket.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_basket.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_flags.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_flags.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bagsand.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bagsand.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_suitcase.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_suitcase.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_trunk.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_trunk.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_dungball.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dungball.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_dungpile.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dungpile.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gnatmound.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gnatmound.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mandrakehouse.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mandrakehouse.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_banditcamp.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_banditcamp.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sparklingpool.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sparklingpool.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bathole.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bathole.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_batpit.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_batpit.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antthrone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antthrone.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_slab.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_slab.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_thundernest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_thundernest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocnest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocnest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocbranch1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocbranch1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocbranch2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocbranch2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocbush.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocbush.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rochouse.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rochouse.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocrustylamp.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocrustylamp.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocstick1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocstick1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocstick2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocstick2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocstick3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocstick3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocstick4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocstick4.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocstick1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocstick1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_roctree1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_roctree1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_roctree2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_roctree2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_roctrunk.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_roctrunk.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocshell1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocshell1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocshell2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocshell2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocshell3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocshell3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_rocshell4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_rocshell4.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_hulkspider.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_hulkspider.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_hulkclaw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_hulkclaw.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_hulkleg.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_hulkleg.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_hulkhead.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_hulkhead.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bramble1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bramble1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bramble2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bramble2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bramble3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bramble3.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_hulklarge.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_hulklarge.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_leafystalk.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_leafystalk.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cocoon.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cocoon.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_junglefern.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_junglefern.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_junglefern2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_junglefern2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_vine1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_vine1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_vine2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_vine2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/hedge_block_aged_item.tex"),
	Asset("ATLAS", "images/inventoryimages/hedge_block_aged_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/hedge_cone_aged_item.tex"),
	Asset("ATLAS", "images/inventoryimages/hedge_cone_aged_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/hedge_layered_aged_item.tex"),
	Asset("ATLAS", "images/inventoryimages/hedge_layered_aged_item.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigtopiary.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigtopiary.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_werepigtopiary.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_werepigtopiary.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_beefalotopiary.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_beefalotopiary.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pigkingtopiary.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pigkingtopiary.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magicflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magicflower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tubertree.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tubertree.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tubertreebloom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tubertreebloom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_treerot.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_treerot.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_treebloom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_treebloom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cocoonedtree.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cocoonedtree.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_turfs_ham.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_grub.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_grub.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_flytrap.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_flytrap.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gnawaltar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gnawaltar.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_gnawaltar.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_gnawaltar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bollard.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bollard.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_queenaltar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_queenaltar.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_queenaltar.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_queenaltar.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_beaststatue1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_beaststatue1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_beaststatue2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_beaststatue2.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_beaststatue.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_beaststatue.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_beaststatue1_left.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_beaststatue1_left.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_beaststatue2_left.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_beaststatue2_left.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_potatohamlet.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_potatohamlet.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ivy.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ivy.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_ivy.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_ivy.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mossygateway.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mossygateway.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_mossygateway.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_mossygateway.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sammywagon.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sammywagon.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_piptoncart.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_piptoncart.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_streetlight1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_streetlight1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_streetlight2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_streetlight2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mealingstone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mealingstone.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_crabtrap.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_crabtrap.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_saltpond.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_saltpond.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_saltpond_rack.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_saltpond_rack.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_safe.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_safe.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_safe.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_safe.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_carriage.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_carriage.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_carriage.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_carriage.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_bike.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_bike.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_bike.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_bike.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gorgeclock.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gorgeclock.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_gorgeclock.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_gorgeclock.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cathedral.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cathedral.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_cathedral.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_cathedral.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pubdoor.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pubdoor.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_pubdoor.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_pubdoor.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_housedoor.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_housedoor.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_housedoor.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_housedoor.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_roof.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_roof.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_roof.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_roof.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_clocktower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_clocktower.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_clocktower.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_clocktower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_house.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_house.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_house.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_house.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_chimney1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_chimney1.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_chimney1.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_chimney1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_chimney2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_chimney2.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_chimney2.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_chimney2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antqueen.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antqueen.xml"),
	
	-- Unlisted Assets --
	Asset("ANIM", "anim/mod_turfs.zip"),
	Asset("ANIM", "anim/kyno_catalogues.zip"), -- Unused.
	Asset("ANIM", "anim/kyno_turfs.zip"),
	Asset("ANIM", "anim/kyno_turfs2.zip"),
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
	Asset("ANIM", "anim/doydoy.zip"),
	Asset("ANIM", "anim/doydoy_adult_build.zip"),
	Asset("ANIM", "anim/packim_fishbone.zip"),
	Asset("ANIM", "anim/packim.zip"),
	Asset("ANIM", "anim/packim_build.zip"),
	Asset("ANIM", "anim/packim_fat_build.zip"),
	Asset("ANIM", "anim/packim_fire_build.zip"),
	Asset("ANIM", "anim/teleportato_shipwrecked.zip"),
	-- Hamlet Content --
	Asset("ANIM", "anim/vamp_bat_entrance.zip"),
	Asset("ANIM", "anim/portal_hamlet.zip"),
	Asset("ANIM", "anim/portal_hamlet_build.zip"),
	Asset("ANIM", "anim/pig_ruins_entrance.zip"),
    Asset("ANIM", "anim/pig_door_test.zip"), 
    Asset("ANIM", "anim/pig_ruins_entrance_build.zip"),
    Asset("ANIM", "anim/pig_ruins_entrance_top_build.zip"),
	Asset("ANIM", "anim/ant_hill_entrance.zip"),
    Asset("ANIM", "anim/ant_queen_entrance.zip"),
	Asset("ANIM", "anim/pig_shop.zip"),    
    Asset("ANIM", "anim/pig_shop_florist.zip"),
    Asset("ANIM", "anim/pig_shop_hoofspa.zip"),
    Asset("ANIM", "anim/pig_shop_produce.zip"),
    Asset("ANIM", "anim/pig_shop_general.zip"),
    Asset("ANIM", "anim/pig_shop_deli.zip"),    
    Asset("ANIM", "anim/pig_shop_antiquities.zip"),       
    Asset("ANIM", "anim/flag_post_duster_build.zip"),
    Asset("ANIM", "anim/flag_post_perdy_build.zip"),
    Asset("ANIM", "anim/flag_post_royal_build.zip"),
    Asset("ANIM", "anim/flag_post_wilson_build.zip"), 
    Asset("ANIM", "anim/pig_cityhall.zip"),      
    Asset("ANIM", "anim/pig_shop_arcane.zip"),
    Asset("ANIM", "anim/pig_shop_weapons.zip"),
    Asset("ANIM", "anim/pig_shop_accademia.zip"),
    Asset("ANIM", "anim/pig_shop_millinery.zip"),
    Asset("ANIM", "anim/pig_shop_bank.zip"),   
    Asset("ANIM", "anim/pig_shop_tinker.zip"), 
	Asset("ANIM", "anim/pig_tower_build.zip"),
	Asset("ANIM", "anim/pig_tower_royal_build.zip"),
	Asset("ANIM", "anim/palace.zip"),
    Asset("ANIM", "anim/pig_shop_doormats.zip"),
    Asset("ANIM", "anim/palace_door.zip"),
	Asset("ANIM", "anim/pig_farmhouse_build.zip"),
	Asset("ANIM", "anim/pig_townhouse1.zip"),
    Asset("ANIM", "anim/pig_townhouse5.zip"),
    Asset("ANIM", "anim/pig_townhouse6.zip"),    
    Asset("ANIM", "anim/pig_townhouse1_pink_build.zip"),
    Asset("ANIM", "anim/pig_townhouse1_green_build.zip"),
    Asset("ANIM", "anim/pig_townhouse1_brown_build.zip"),
    Asset("ANIM", "anim/pig_townhouse1_white_build.zip"),
    Asset("ANIM", "anim/pig_townhouse5_beige_build.zip"),
    Asset("ANIM", "anim/pig_townhouse6_red_build.zip"),
	Asset("ANIM", "anim/pig_house_sale.zip"),
    Asset("ANIM", "anim/player_small_house1.zip"),
    Asset("ANIM", "anim/player_large_house1.zip"),
    Asset("ANIM", "anim/player_large_house1_manor_build.zip"),
    Asset("ANIM", "anim/player_large_house1_villa_build.zip"),
    Asset("ANIM", "anim/player_small_house1_cottage_build.zip"),
    Asset("ANIM", "anim/player_small_house1_tudor_build.zip"),
    Asset("ANIM", "anim/player_small_house1_gothic_build.zip"),
    Asset("ANIM", "anim/player_small_house1_brick_build.zip"),
    Asset("ANIM", "anim/player_small_house1_turret_build.zip"),
	Asset("ANIM", "anim/pig_ruins_pot.zip"),
	Asset("ANIM", "anim/wall_pig_ruins.zip"),
	Asset("ANIM", "anim/ant_house.zip"),
	Asset("ANIM", "anim/ant_chest.zip"),
	Asset("ANIM", "anim/ant_chest_honey_build.zip"),
	Asset("ANIM", "anim/ant_honey_cache.zip"),
	Asset("ANIM", "anim/ruins_artichoke.zip"),
	Asset("ANIM", "anim/ruins_giant_head.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_pig.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_ant.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_idol.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_plaque.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_mushroom.zip"),
	Asset("ANIM", "anim/statue_pig_ruins_idol_blue.zip"),
	Asset("ANIM", "anim/pig_ruins_dart_statue.zip"),
	Asset("ANIM", "anim/spear_trap.zip"), 	
	Asset("ANIM", "anim/fountain_pillar.zip"),
	Asset("ANIM", "anim/interior_wall_decals_ruins.zip"),
	Asset("ANIM", "anim/interior_wall_decals_ruins_blue.zip"),
	Asset("ANIM", "anim/python_fountain.zip"),
	Asset("ANIM", "anim/python_trap_door.zip"),
	Asset("ANIM", "anim/python_test.zip"),
	Asset("ANIM", "anim/flowers_rainforest.zip"), 
	Asset("ANIM", "anim/rock_basalt.zip"),
	Asset("ANIM", "anim/ruins_torch.zip"),
	Asset("ANIM", "anim/balloon_wreckage.zip"),
	Asset("ANIM", "anim/dungball_build.zip"),
	Asset("ANIM", "anim/dung_pile.zip"),
	Asset("ANIM", "anim/gnat_mound.zip"),
	Asset("ANIM", "anim/gnat.zip"),
	Asset("ANIM", "anim/x_marks_spot_bandit.zip"),
	Asset("ANIM", "anim/gold_puddle.zip"),
	Asset("ANIM", "anim/interior_wall_decals_batcave.zip"),
	Asset("ANIM", "anim/throne.zip"),
	Asset("ANIM", "anim/rock_flipping.zip"),
	Asset("ANIM", "anim/thunderbird_nest.zip"),
	Asset("ANIM", "anim/thunderbird.zip"),
	Asset("ANIM", "anim/roc_nest.zip"),
	Asset("ANIM", "anim/roc_junk.zip"),   
    Asset("ANIM", "anim/roc_egg_shells.zip"),
	Asset("ANIM", "anim/metal_spider.zip"),
    Asset("ANIM", "anim/metal_claw.zip"),
    Asset("ANIM", "anim/metal_leg.zip"),
    Asset("ANIM", "anim/metal_head.zip"),
	Asset("ANIM", "anim/metal_hulk_build.zip"),
	Asset("ANIM", "anim/metal_hulk_basic.zip"),
    Asset("ANIM", "anim/metal_hulk_attacks.zip"),
    Asset("ANIM", "anim/metal_hulk_actions.zip"),
	Asset("ANIM", "anim/bramble.zip"),
	Asset("ANIM", "anim/bramble1_build.zip"),
	Asset("ANIM","anim/bramble_core.zip"),
	Asset("ANIM", "anim/claw_tree_build.zip"),
	Asset("ANIM", "anim/claw_tree_normal.zip"),
	Asset("ANIM", "anim/claw_tree_short.zip"),
	Asset("ANIM", "anim/claw_tree_tall.zip"),
	Asset("ANIM", "anim/clawling.zip"),
	Asset("ANIM", "anim/clawling2.zip"),
	Asset("ANIM", "anim/aloe.zip"),
	Asset("ANIM", "anim/asparagus2.zip"),
	Asset("ANIM", "anim/pillar_tree.zip"),
	Asset("ANIM", "anim/lantern_fly.zip"),
	Asset("ANIM", "anim/fern_plant.zip"),
    Asset("ANIM", "anim/fern2_plant.zip"),
	Asset("ANIM", "anim/cave_exit_rope.zip"),
	Asset("ANIM", "anim/copycreep_build.zip"),
	Asset("ANIM", "anim/vine01_build.zip"),
	Asset("ANIM", "anim/vine02_build.zip"),
	Asset("ANIM", "anim/hedge.zip"),
	Asset("ANIM", "anim/hedge1_build.zip"),
	Asset("ANIM", "anim/hedge2_build.zip"),
	Asset("ANIM", "anim/hedge3_build.zip"),
	Asset("ANIM", "anim/topiary.zip"),
    Asset("ANIM", "anim/topiary01_build.zip"),    
    Asset("ANIM", "anim/topiary02_build.zip"),    
    Asset("ANIM", "anim/topiary03_build.zip"),    
    Asset("ANIM", "anim/topiary04_build.zip"),    
    Asset("ANIM", "anim/topiary05_build.zip"),    
    Asset("ANIM", "anim/topiary06_build.zip"),    
    Asset("ANIM", "anim/topiary07_build.zip"),
	Asset("ANIM", "anim/topiary_pigman_build.zip"),
    Asset("ANIM", "anim/topiary_werepig_build.zip"),
    Asset("ANIM", "anim/topiary_beefalo_build.zip"),
    Asset("ANIM", "anim/topiary_pigking_build.zip"), 
	Asset("ANIM", "anim/lifeplant.zip"),
	Asset("ANIM", "anim/nettle.zip"),
	Asset("ANIM", "anim/nettle_bulb_build.zip"),	
	Asset("ANIM", "anim/nettle_budding_build.zip"),	
	Asset("ANIM", "anim/grass_tall.zip"),
	Asset("ANIM", "anim/treasure_chest_cork.zip"),
	Asset("ANIM", "anim/hogusporkusator.zip"),
	Asset("ANIM", "anim/treasure_chest_roottrunk.zip"),
	Asset("ANIM", "anim/sprinkler.zip"),
	Asset("ANIM", "anim/sprinkler_placement.zip"),
	Asset("ANIM", "anim/sprinkler_meter.zip"),
	Asset("ANIM", "anim/smelter.zip"),
	Asset("ANIM", "anim/basefan.zip"),
	Asset("ANIM", "anim/wagstaff_thumper.zip"),
	Asset("ANIM", "anim/teleport_pad.zip"),
	Asset("ANIM", "anim/teleport_pad_beacon.zip"),
	Asset("ANIM", "anim/tuber_tree_build.zip"),
	Asset("ANIM", "anim/tuber_bloom_build.zip"),
	Asset("ANIM", "anim/tuber_tree.zip"),
	Asset("ANIM", "anim/tree_forest_rot_build.zip"),
	Asset("ANIM", "anim/tree_rainforest_gas_build.zip"),
	Asset("ANIM", "anim/tree_forest_bloom_build.zip"),
	Asset("ANIM", "anim/tree_rainforest_build.zip"),
	Asset("ANIM", "anim/tree_rainforest_bloom_build.zip"),
	Asset("ANIM", "anim/tree_rainforest_normal.zip"),
	Asset("ANIM", "anim/tree_rainforest_short.zip"),
	Asset("ANIM", "anim/tree_rainforest_tall.zip"),
	Asset("ANIM", "anim/tree_rainforest_web_build.zip"),
	Asset("ANIM", "anim/burr.zip"),
	Asset("ANIM", "anim/tree_leaf_short.zip"),
    Asset("ANIM", "anim/tree_leaf_normal.zip"),
    Asset("ANIM", "anim/tree_leaf_tall.zip"),
    Asset("ANIM", "anim/teatree_trunk_build.zip"),
    Asset("ANIM", "anim/teatree_build.zip"), 
	Asset("ANIM", "anim/lamp_post2.zip"),
    Asset("ANIM", "anim/lamp_post2_city_build.zip"),    
    Asset("ANIM", "anim/lamp_post2_yotp_build.zip"),
	Asset("ANIM", "anim/radish.zip"),
	Asset("ANIM", "anim/giant_grub.zip"),
	Asset("ANIM", "anim/venus_flytrap_lg_build.zip"),
	Asset("ANIM", "anim/venus_flytrap_planted.zip"),
	Asset("ANIM", "anim/teleportato_hamlet.zip"),
	Asset("ANIM", "anim/crickant_queen_basics.zip"),
	-- The Gorge Content --
	Asset("ANIM", "anim/quagmire_altar_statue1_left.zip"),
	Asset("ANIM", "anim/quagmire_altar_statue2_left.zip"),
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