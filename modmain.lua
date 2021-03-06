local _G = GLOBAL
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local resolvefilepath = GLOBAL.resolvefilepath
local AllRecipes = GLOBAL.AllRecipes
local TechTree = require("techtree")

require("recipes")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
modimport("scripts/kyno_assets")
modimport("scripts/kyno_strings")
modimport("scripts/kyno_stringsparrot")
modimport("scripts/kyno_stringsmaxwell")
modimport("scripts/kyno_postinits")
modimport("scripts/kyno_endtable")
modimport("scripts/kyno_lights")
modimport("scripts/kyno_combat")
modimport("scripts/kyno_combat_replica")
modimport("scripts/kyno_fx")
modimport("scripts/kyno_preparedfoods")
modimport("scripts/kyno_actions")
modimport("libs/env")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Assets = { -- Some Assets don't show correctly if they're not set here.
	-- Assets for Mini Signs.
    Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_ham.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_gorge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_forge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_new.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/turf_sticky.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_coffee.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_3.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_irongate_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_pig_ruins_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_moltenfence_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_legacy_inventoryimages.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_redflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_orangeflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_yellowflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_greenflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_blueflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_cyanflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_purpleflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_wall_reed.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_glass_pitchfork.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_bone_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_living_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_mud_item.xml", 256),
	-- Common Assets.
    Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw_2.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_gorge.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_gorge.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_new.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_new.xml"),
	Asset("IMAGE", "images/inventoryimages/turf_sticky.tex"),
    Asset("ATLAS", "images/inventoryimages/turf_sticky.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_wall_reed.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wall_reed.xml"),
	Asset("IMAGE", "images/inventoryimages/wall_bone_item.tex"),
	Asset("ATLAS", "images/inventoryimages/wall_bone_item.xml"),
	Asset("IMAGE", "images/inventoryimages/wall_living_item.tex"),
	Asset("ATLAS", "images/inventoryimages/wall_living_item.xml"),
	Asset("IMAGE", "images/inventoryimages/wall_mud_item.tex"),
	Asset("ATLAS", "images/inventoryimages/wall_mud_item.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons_2.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons_3.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons_3.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_legacy_inventoryimages.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_legacy_inventoryimages.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_redflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_redflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_orangeflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_orangeflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_yellowflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_yellowflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_greenflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_greenflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_blueflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_blueflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_cyanflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cyanflies.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_purpleflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_purpleflies.xml"),
	Asset("IMAGE", "images/tabimages/kyno_shipwreckedtab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_shipwreckedtab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_hamlettab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_hamlettab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_gorgetab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_gorgetab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_forgetab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_forgetab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_surfacetab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_surfacetab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_cavetab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_cavetab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_housetab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_housetab.xml"),
	Asset("IMAGE", "images/tabimages/kyno_painttab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_painttab.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_ruinspillar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ruinspillar.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_thundernest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_thundernest.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_turfs_ham.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_forge.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_turfs_forge.xml"),
	Asset("IMAGE", "images/inventoryimages/wall_pig_ruins_item.tex"),
	Asset("ATLAS", "images/inventoryimages/wall_pig_ruins_item.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_irongate_item.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_irongate_item.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_moltenfence.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_moltenfence.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_moltenfence_item.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_moltenfence_item.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_burntmarsh.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_burntmarsh.xml"),
    Asset("IMAGE", "images/inventoryimages/kyno_coffee.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_coffee.xml"),
	Asset("ANIM", "anim/kyno_turfs2.zip"),
	Asset("ANIM", "anim/kyno_turfs3.zip"),
	Asset("ANIM", "anim/kyno_turfs4.zip"),
	Asset("ANIM", "anim/leaves_canopy.zip"),
	Asset("ANIM", "anim/leaves_canopy_test.zip"),
	Asset("ANIM", "anim/leaves_canopy2.zip"),
	Asset("ANIM", "anim/red_clawling.zip"),
	Asset("ANIM", "anim/cave_exit_rope.zip"),
	Asset("ANIM", "anim/copycreep_build.zip"),
	Asset("ANIM", "anim/vine01_build.zip"),
	Asset("ANIM", "anim/vine02_build.zip"),
	Asset("ANIM", "anim/vines_rainforest_border.zip"), 
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
	Asset("SOUNDPACKAGE", "sound/dontstarve_wagstaff.fev"),
	Asset("SOUND", "sound/dontstarve_wagstaff.fsb"),
	Asset("IMAGE", "images/kyno_redmush.tex"),
	Asset("ATLAS", "images/kyno_redmush.xml"),
	Asset("IMAGE", "images/kyno_greenmush.tex"),
	Asset("ATLAS", "images/kyno_greenmush.xml"),
	Asset("IMAGE", "images/kyno_bluemush.tex"),
	Asset("ATLAS", "images/kyno_bluemush.xml"),
	Asset("IMAGE", "images/kyno_rose.tex"),
	Asset("ATLAS", "images/kyno_rose.xml"),
	Asset("IMAGE", "images/kyno_flowerwithered.tex"),
	Asset("ATLAS", "images/kyno_flowerwithered.xml"),
	Asset("IMAGE", "images/kyno_mandrake_planted.tex"),
	Asset("ATLAS", "images/kyno_mandrake_planted.xml"),
	Asset("IMAGE", "images/inventoryimages/toucan_hamlet.tex"),
	Asset("ATLAS", "images/inventoryimages/toucan_hamlet.xml"),
	Asset("IMAGE", "images/kyno_carrot_planted.tex"),
	Asset("ATLAS", "images/kyno_carrot_planted.xml"),
	Asset("IMAGE", "images/kyno_lumpysapling.tex"),
	Asset("ATLAS", "images/kyno_lumpysapling.xml"),
	Asset("IMAGE", "images/kyno_marsh_tree.tex"),
	Asset("ATLAS", "images/kyno_marsh_tree.xml"),
	Asset("IMAGE", "images/kyno_rocktree_short.tex"),
	Asset("ATLAS", "images/kyno_rocktree_short.xml"),
	Asset("IMAGE", "images/kyno_rocktree.tex"),
	Asset("ATLAS", "images/kyno_rocktree.xml"),
	Asset("IMAGE", "images/kyno_rocktree_tall.tex"),
	Asset("ATLAS", "images/kyno_rocktree_tall.xml"),
	Asset("IMAGE", "images/kyno_rocktree_old.tex"),
	Asset("ATLAS", "images/kyno_rocktree_old.xml"),
	Asset("IMAGE", "images/kyno_marbletree1.tex"),
	Asset("ATLAS", "images/kyno_marbletree1.xml"),
	Asset("IMAGE", "images/kyno_marbletree2.tex"),
	Asset("ATLAS", "images/kyno_marbletree2.xml"),
	Asset("IMAGE", "images/kyno_marbletree3.tex"),
	Asset("ATLAS", "images/kyno_marbletree3.xml"),
	Asset("IMAGE", "images/kyno_marbletree4.tex"),
	Asset("ATLAS", "images/kyno_marbletree4.xml"),
	Asset("IMAGE", "images/kyno_rock1.tex"),
	Asset("ATLAS", "images/kyno_rock1.xml"),
	Asset("IMAGE", "images/kyno_rock2.tex"),
	Asset("ATLAS", "images/kyno_rock2.xml"),
	Asset("IMAGE", "images/kyno_rockflintless.tex"),
	Asset("ATLAS", "images/kyno_rockflintless.xml"),
	Asset("IMAGE", "images/kyno_rockice.tex"),
	Asset("ATLAS", "images/kyno_rockice.xml"),
	Asset("IMAGE", "images/kyno_rockmoon.tex"),
	Asset("ATLAS", "images/kyno_rockmoon.xml"),
	Asset("IMAGE", "images/kyno_moonglass.tex"),
	Asset("ATLAS", "images/kyno_moonglass.xml"),
	Asset("IMAGE", "images/kyno_pigtorch.tex"),
	Asset("ATLAS", "images/kyno_pigtorch.xml"),
	Asset("IMAGE", "images/kyno_rundown.tex"),
	Asset("ATLAS", "images/kyno_rundown.xml"),
	Asset("IMAGE", "images/kyno_rabbithole.tex"),
	Asset("ATLAS", "images/kyno_rabbithole.xml"),
	Asset("IMAGE", "images/kyno_hollowstump.tex"),
	Asset("ATLAS", "images/kyno_hollowstump.xml"),
	Asset("IMAGE", "images/kyno_houndmound.tex"),
	Asset("ATLAS", "images/kyno_houndmound.xml"),
	Asset("IMAGE", "images/kyno_beehive.tex"),
	Asset("ATLAS", "images/kyno_beehive.xml"),
	Asset("IMAGE", "images/kyno_wasphive.tex"),
	Asset("ATLAS", "images/kyno_wasphive.xml"),
	Asset("IMAGE", "images/kyno_nestground.tex"),
	Asset("ATLAS", "images/kyno_nestground.xml"),
	Asset("IMAGE", "images/kyno_moonspiderden.tex"),
	Asset("ATLAS", "images/kyno_moonspiderden.xml"),
	Asset("IMAGE", "images/kyno_statueharp.tex"),
	Asset("ATLAS", "images/kyno_statueharp.xml"),
	Asset("IMAGE", "images/kyno_marblepillar.tex"),
	Asset("ATLAS", "images/kyno_marblepillar.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_statuemaxwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_statuemaxwell.xml"),
	Asset("IMAGE", "images/kyno_glassspike_short.tex"),
	Asset("ATLAS", "images/kyno_glassspike_short.xml"),
	Asset("IMAGE", "images/kyno_glassspike_med.tex"),
	Asset("ATLAS", "images/kyno_glassspike_med.xml"),
	Asset("IMAGE", "images/kyno_glassspike_tall.tex"),
	Asset("ATLAS", "images/kyno_glassspike_tall.xml"),
	Asset("IMAGE", "images/kyno_glassblock.tex"),
	Asset("ATLAS", "images/kyno_glassblock.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_pondmagma.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pondmagma.xml"),
	Asset("IMAGE", "images/kyno_driftwood1.tex"),
	Asset("ATLAS", "images/kyno_driftwood1.xml"),
	Asset("IMAGE", "images/kyno_driftwood2.tex"),
	Asset("ATLAS", "images/kyno_driftwood2.xml"),
	Asset("IMAGE", "images/kyno_driftwood3.tex"),
	Asset("ATLAS", "images/kyno_driftwood3.xml"),
	Asset("IMAGE", "images/kyno_bones.tex"),
	Asset("ATLAS", "images/kyno_bones.xml"),
	Asset("IMAGE", "images/kyno_seabones.tex"),
	Asset("ATLAS", "images/kyno_seabones.xml"),
	Asset("IMAGE", "images/kyno_skeleton.tex"),
	Asset("ATLAS", "images/kyno_skeleton.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_legacywall.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_legacywall.xml"),
	Asset("SOUNDPACKAGE", "sound/shadwell_sfx.fev"),
	Asset("SOUND", "sound/shadwell_sfx.fsb"),
	Asset("IMAGE", "images/kyno_sunkenchest.tex"),
	Asset("ATLAS", "images/kyno_sunkenchest.xml"),
	Asset("IMAGE", "images/kyno_shellcluster.tex"),
	Asset("ATLAS", "images/kyno_shellcluster.xml"),
	Asset("IMAGE", "images/kyno_oceandebris.tex"),
	Asset("ATLAS", "images/kyno_oceandebris.xml"),
	Asset("IMAGE", "images/inventoryimages/potato.tex"),
	Asset("ATLAS", "images/inventoryimages/potato.xml"),
	Asset("IMAGE", "images/inventoryimages/singingshell_octave3.tex"),
	Asset("ATLAS", "images/inventoryimages/singingshell_octave3.xml"),
	Asset("IMAGE", "images/inventoryimages/singingshell_octave4.tex"),
	Asset("ATLAS", "images/inventoryimages/singingshell_octave4.xml"),
	Asset("IMAGE", "images/inventoryimages/singingshell_octave5.tex"),
	Asset("ATLAS", "images/inventoryimages/singingshell_octave5.xml"),
	Asset("IMAGE", "images/inventoryimages/rock_avocado_fruit.tex"),
	Asset("ATLAS", "images/inventoryimages/rock_avocado_fruit.xml"),
	Asset("IMAGE", "images/kyno_redmushtree.tex"),
	Asset("ATLAS", "images/kyno_redmushtree.xml"),
	Asset("IMAGE", "images/kyno_greenmushtree.tex"),
	Asset("ATLAS", "images/kyno_greenmushtree.xml"),
	Asset("IMAGE", "images/kyno_bluemushtree.tex"),
	Asset("ATLAS", "images/kyno_bluemushtree.xml"),
	Asset("IMAGE", "images/kyno_webbedmushtree.tex"),
	Asset("ATLAS", "images/kyno_webbedmushtree.xml"),
	Asset("IMAGE", "images/kyno_stalagmitefull.tex"),
	Asset("ATLAS", "images/kyno_stalagmitefull.xml"),
	Asset("IMAGE", "images/kyno_stalagmitemed.tex"),
	Asset("ATLAS", "images/kyno_stalagmitemed.xml"),
	Asset("IMAGE", "images/kyno_stalagmitelow.tex"),
	Asset("ATLAS", "images/kyno_stalagmitelow.xml"),
	Asset("IMAGE", "images/kyno_stalagmitetall_full.tex"),
	Asset("ATLAS", "images/kyno_stalagmitetall_full.xml"),
	Asset("IMAGE", "images/kyno_stalagmitetall_med.tex"),
	Asset("ATLAS", "images/kyno_stalagmitetall_med.xml"),
	Asset("IMAGE", "images/kyno_stalagmitetall_low.tex"),
	Asset("ATLAS", "images/kyno_stalagmitetall_low.xml"),
	Asset("IMAGE", "images/kyno_spiderhole.tex"),
	Asset("ATLAS", "images/kyno_spiderhole.xml"),
	Asset("IMAGE", "images/kyno_slurtlehole.tex"),
	Asset("ATLAS", "images/kyno_slurtlehole.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_caveholeitems.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_caveholeitems.xml"),
	Asset("IMAGE", "images/kyno_bananatree.tex"),
	Asset("ATLAS", "images/kyno_bananatree.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_legacyruins_wall.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_legacyruins_wall.xml"),
	Asset("IMAGE", "images/kyno_saladfurnace.tex"),
	Asset("ATLAS", "images/kyno_saladfurnace.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_glass_pitchfork.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_glass_pitchfork.xml"),
	Asset("ATLAS", "images/inventoryimages/statuemarblebroodling.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblebroodling.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarblehutch.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblehutch.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarbleglomglom.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarbleglomglom.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarblechester.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblechester.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarblekittykit.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblekittykit.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarblevargling.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblevargling.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarbleewelet.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarbleewelet.tex"),
	Asset("ATLAS", "images/inventoryimages/statuemarblegiblet.xml"),
    Asset("IMAGE", "images/inventoryimages/statuemarblegiblet.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonebroodling.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonebroodling.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonehutch.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonehutch.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestoneglomglom.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestoneglomglom.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonechester.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonechester.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonekittykit.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonekittykit.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonevargling.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonevargling.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestoneewelet.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestoneewelet.tex"),
	Asset("ATLAS", "images/inventoryimages/statuestonegiblet.xml"),
    Asset("IMAGE", "images/inventoryimages/statuestonegiblet.tex"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas_blank.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas_blank.xml"),
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PrefabFiles = {
	"k_custom_placers",
	-- SHIPWRECKED CONTENT --
	"k_dragoonden",
	"k_elephantcactus",
	"k_rock_obsidian",
	"k_rock_charcoal",
	"k_volcano_shrub",
	"k_coffeebush",
	"k_dug_coffeebush",
	"k_fakecoffeebush",
	"k_coffeebeans",
	"k_coffeebuff",
	"k_coffee",
	"k_altar_pillar",
	"k_volcano_altar",
	"k_workbench",
	"k_dragoonspit",
	"k_volcano_stairs",
	"k_sw_prototyper",
	"k_limpet_stone",
	"k_vinebush",
	"k_bambootree",
	"k_sw_pinecones",
	"k_jungletree",
	"k_jungletree_sapling",
	"k_coconut",
	"k_palmtree",
	"k_palmtree_sapling",
	"k_sandpile",
	"k_seashell",
	"k_seashell_buried",
	"k_debris",
	"k_crates",
	"k_living_jungletree",
	"k_magmarock",
	"k_primeape_barrel",
	"k_sharkittenden",
	"k_sweet_potato",
	"k_mermhuts",
	"k_tidalpool_small",
	"k_tidalpool_medium",
	"k_tidalpool_big",
	"k_poisonhole",
	"k_slotmachine",
	"k_wildbore_house",
	"k_wildbore_head",
	"k_chiminea",
	"k_chiminea_fire",
	"k_obsidian_firepit",
	"k_obsidian_firepit_fire",
	"k_palmleafhut",
	"k_doydoy_nest",
	"k_icemaker",
	"k_sandcastle",
	"k_piratihatitator",
	"k_sandbag",
	"k_buriedtreasure",
	"k_krissure",
	"k_lavapool",
	"k_dragoonegg",
	"k_woodlegs_cage",
	"k_tartrap",
	"k_packim",
	"k_packim_fishbone",
	"k_teleportato_shipwrecked",
	"k_bootybag",
	"k_parrot_boat",
	"k_surfboard",
	"k_seal",
	"k_trinkets_sw",
	"k_earring",
	-- HAMLET CONTENT --
	"k_ham_prototyper",
	"k_cavecleft",
	"k_pigruins",
	"k_manthill",
	"k_pigshops",
	"k_pigtower",
	"k_pigpalace",
	"k_pigpalace2",
	"k_pighouse_city",
	"k_playerhouse",
	"k_smashingpot",
	"k_walls_ham",
	"k_antcombhome",
	"k_antchest",
	"k_antcache",
	"k_rock_artichoke",
	"k_aporkalypse_calendar",
	"k_lostrelics",
	"k_ruins_well",
	"k_strikingstatue",
	"k_speartrap",
	"k_fountainpillar",
	"k_ruinspillar",
	"k_fountainofyouth",
	"k_fountaintrapdoor",
	"k_pugaliskbones",
	"k_exoticflowers",
	"k_rock_eruption",
	"k_brazier",
	"k_balloonwreckage",
	"k_dungball",
	"k_dungpile",
	"k_gnatmound",
	"k_mandrakehouse",
	"k_banditcamp",
	"k_sparklingpool",
	"k_bathole",
	"k_batpit",
	"k_antthrone",
	"k_stoneslab",
	"k_thundernest",
	"k_roc_nest",
	"k_roc_junk",
	"k_ironhulks",
	"k_brambles",
	"k_clawtree",
	"k_clawtree_sapling",
	"k_redclawtree",
	"k_red_clawtree_sapling",
	"k_aloe",
	"k_asparagus",
	"k_leafystalk",
	"k_glowfly_cocoon",
	"k_junglefern",
	"k_vines",
	"k_hedge_block",
	"k_hedge_block_aged",
	"k_hedge_cone",
	"k_hedge_cone_aged",
	"k_hedge_layered",
	"k_hedge_layered_aged",
	"k_lawnornaments",
	"k_topiary",
	"k_magicflower",
	"k_nettleplant",
	"k_tallgrass",
	"k_rock_plug",
	"k_corkchest",
	"k_rootchest",
	"k_hogusporkusator",
	"k_sprinkler",
	"k_smelter",
	"k_oscillating_fan",
	"k_thumper",
	"k_telipad",
	"k_telebrella",
	"k_tubertree",
	"k_tubertree_bloom",
	"k_rainforesttree_rot",
	"k_rainforesttree_bloom",
	"k_rainforesttree",
	"k_rainforesttree_sapling",
	"k_cocoonedtree",
	"k_teatree",
	"k_teatree_sapling",
	"k_teatree_nut",
	"k_ham_pinecones",
	"k_lamppost",
	"k_radish",
	"k_giantgrub",
	"k_snaptooth",
	"k_teleportato_hamlet",
	"k_pigguards",
	"k_ro_bin",
	"k_ro_bin_gizzard_stone",
	"k_relics",
	"k_pherostone",
	"k_oincs",
	"k_canopy_shadow",
	"k_pomegranate_tree",
	"k_rock_bat",
	"k_trinkets_ham",
	-- THE GORGE CONTENT --
	"k_gorge_prototyper",
	"k_bollard",
	"k_queen_beast",
	"k_beast_statue",
	"k_ivy",
	"k_gorge_gateway",
	"k_mermcarts",
	"k_streetlights",
	"k_mealingstone",
	"k_crabtrap",
	"k_saltpond",
	"k_safe",
	"k_oldstructures",
	"k_ironfence",
	"k_irongate",
	"k_urn",
	"k_stoneobelisk",
	"k_gnawangel",
	"k_gnawangel2",
	"k_birdfountain",
	"k_cottontree",
	"k_spottyshrub",
	"k_oven",
	"k_grill",
	"k_grill_large",
	"k_pothanger",
	"k_pothanger_small",
	"k_pothanger_syrup",
	"k_mushroomstump",
	"k_swamphouses",
	"k_pigelder",
	"k_planted_carrot",
	"k_planted_potato",
	"k_planted_turnip",
	"k_planted_onion",
	"k_planted_wheat",
	"k_planted_garlic",
	"k_planted_tomato",
	"k_gorgecoins",
	-- THE FORGE CONTENT --
	"k_pugna",
	"k_magmagolem",
	"k_standards",
	"k_forge_gateway",
	"k_healblossom",
	"k_lavahole",
	"k_moltenfence",
	"k_forge_spawner",
	-- BASE GAME CONTENT -- 
	"k_burntmarsh",
	"k_cactus",
	"k_tumbleweed",
	"k_reeds",
	"pumpkin_lantern",
	"birdcage",
	"k_birds",
	"k_plants",
	"k_sorchedground",
	"k_burnttree",
	"k_stumptree",
	"k_moonshell",
	"k_rock_ice",
	"k_moonbase",
	"k_rock_sinkhole",
	"k_sinkhole",
	"k_gargoyles",
	"k_moonrock_pieces",
	"k_walrus_camp",
	"k_tallbirdnest",
	"k_moosenest",
	"k_mooseegg",
	"k_giantbeehive",
	"k_klausbag",
	"k_statueglommer",
	"k_marbletree",
	"k_statuemarble",
	"k_statuemaxwell",
	"k_statuechess",
	"k_statuechess_repaired",
	"k_statuepiece",
	"k_sandspike",
	"k_celestialpiece",
	"k_invitingformation",
	"k_obelisk",
	"k_pigking",
	"k_critterlab",
	"k_charlietable",
	"k_mobheads",
	"k_statueangel",
	"k_touchstone",
	"k_multiplayerportal",
	"k_lake",
	"k_ponds",
	"k_ponds2",
	"k_lava_rock",
	"k_hotspring",
	"k_basalt",
	"k_molehill",
	"k_bonemound",
	"k_scorchedskeleton",
	"k_mound",
	"k_gravestones",
	"k_wormhole",
	"k_moon_fissure",
	"k_propsign",
	"k_friendomatic",
	"k_accomplishmentshrine",
	"k_teleportato_rog",
	"k_skullchest",
	"k_sunkboat",
	"k_white_moonrock",
	"k_walls_rog",
	"k_shopkeeper",
	"k_bonfire",
	"k_unbuilthouse",
	"k_snowman",
	"k_jamesbucket",
	"k_bags",
	"k_scarecrow",
	"k_minitree",
	"k_treeclump",
	"k_bbq",
	"k_truffles",
	"k_biigfoot",
	"k_waxwelldoor",
	"k_waxwelltrap",
	"k_waxwellgramaphone",
	"k_waxwelllight",
	"k_waxwelllight_flame",
	"k_waxwelllock",
	"k_nightmarethrone",
	"k_shadowportal",
	"k_hermitrack",
	"k_hermitbeebox",
	"k_hermithouse",
	"k_sunkenchest",
	"k_marsh_tree",
	"k_rocks",
	"k_pigtorch",
	"k_mermhouse",
	"k_catcoonden",
	"k_houndmound",
	"k_beehive",
	"k_wasphive",
	"k_moonspiderden",
	"k_driftwoodtree",
	"k_houndbone",
	"k_deadseabones",
	"k_skeleton",
	"k_eyeplant",
	"k_stagehand",
	"k_rabbithole",
	"k_truesaltlick",
	"k_fireflies",
	"k_teslapost",
	"k_wigfridge",
	"k_gingerbreadhouse",
	"k_claystatues",
	"k_frozenfurnace",
	"k_legacymarsh",
	"k_antlionsinkhole",
	"k_deer_fx_ice",
	"k_deer_fx_fire",
	-- "k_compromisingstatue",
	"k_talisman",
	"k_poisontree",
	"k_antlion",
	"k_snowpile",
	"k_pottedplants",
	"plant_normal",
	"stalker",
	"shadowchesspieces",
	"oasislake",
	"livingtree_halloween",
	-- CAVES CONTENT --
	"k_flowerlight",
	"k_batiliskden",
	"k_toadstoolcap",
	"k_toadhole",
	"k_sporecaps",
	"k_boomshroom",
	"k_tentaclehole",
	"k_bigtentacle",
	"k_nightmarefissure",
	"k_wormlight",
	"k_ruinshole",
	"k_lichen",
	"k_legacylichen",
	"k_monkeybarrel",
	"k_brokenrelics",
	"k_brokenbits",
	"k_ruins_statue_tall",
	"k_ruins_statue_small",
	"k_nightmarelight",
	"k_brokenclockworks",
	"k_ornatechest",
	"k_apss",
	"k_pillars",
	"k_stairs",
	"k_legacy_ruins_tall",
	"k_legacy_ruins_small",
	"k_shadowchanneler",
	"k_statueatrium",
	"k_atriumrubble",
	"k_atriumbeacon",
	"k_atriumobelisk",
	"k_atriumfence",
	"k_atriumgateway",
	"k_mushtree",
	"k_mushtree_webbed",
	"k_stalagmite",
	"k_stalagmite_tall",
	"k_spiderhole",
	"k_slurtlehole",
	"k_cave_banana_tree",
	"k_sinkhole_ruins",
	-- SEA CONTENT --
	"k_mangrovetrees",
	"k_wrecks",
	"k_seaweed",
	"k_brain_rock",
	"k_walls_sw",
	"k_walls_sea",
	"k_rock_coral",
	"k_redbarrel",
	"k_bermudatriangle",
	"k_ballphin_palace",
	"k_octopusking",
	"k_luggagechest",
	"k_fishinhole",
	"k_buoy",
	"k_sea_chiminea",
	"k_seayard",
	"k_tar_extractor",
	"k_musselstick",
	"k_fishfarm",
	"k_sea_lab",
	"k_krakenchest",
	"k_waterchest",
	"k_watercrates",
	"k_tarpit",
	"k_seastack",
	"k_saltstack",
	"k_wobster_den",
	"k_sea_grass",
	"k_sea_reeds",
	"k_volcano",
	"k_lilypad",
	"k_lotusplant",
	"k_lotusflower",
	"k_fishes",
	"k_whalebubbles",
	"k_masts",
	-- INTERIOR CONTENT --
	-- "k_shelves",
	-- "k_shelves_slots",
	"k_plantholders",
	"k_chairs",
	"k_rugs",
	"k_lamps",
	"k_tables",
	"k_interior_accademia",
	"k_interior_arcane",
	"k_interior_deli",
	"k_interior_florist",
	"k_interior_mayoroffice",
	"k_interior_millinery",
	"k_interior_palace",
	"k_interior_general",
	"k_interior_containers",
	-- NEW CONTENT --
	"k_glass_pitchfork",
	"k_birdstand",
	"k_tents",
	"lobster_home",
	"lobster_claw",
	"lobster",
	"rocky",
	"statuemarblebroodling",
	"statuemarbleglomglom",
	"statuemarblechester",
	"statuemarblehutch",
	"statuemarblekittykit",
	"statuemarbleewelet",
	"statuemarblevargling",
	"statuemarblegiblet",
    "statuestonebroodling",
	"statuestoneglomglom",
	"statuestonechester",
	"statuestonehutch",
	"statuestonekittykit",
	"statuestoneewelet",
	"statuestonevargling",
	"statuestonegiblet",
	"statuestonebroodling",
	"statuestoneglomglom",
	"statuestonechester",
	"statuestonehutch",
	"statuestonekittykit",
	"statuestoneewelet",
	"statuestonevargling",
	"statuestonegiblet",
    "statuestonebroodling",
	"statuestoneglomglom",
	"statuestonechester",
	"statuestonehutch",
	"statuestonekittykit",
	"statuestoneewelet",
	"statuestonevargling",
	"statuestonegiblet",
	"k_canvas",
	"k_farm_decor",
	"k_garden_plants",
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local atlas = (src and src.components.inventoryitem and src.components.inventoryitem.atlasname and resolvefilepath(src.components.inventoryitem.atlasname) ) or "images/inventoryimages/kyno_inventoryimages_ham.xml"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddMinimapAtlas("images/minimapimages/kyno_minimap_atlas_sw.xml")
AddMinimapAtlas("images/minimapimages/kyno_minimap_atlas_ham.xml")
AddMinimapAtlas("images/minimapimages/kyno_shipmast.xml")
AddMinimapAtlas("images/minimapimages/kyno_gnawaltar.xml")
AddMinimapAtlas("images/minimapimages/kyno_queenaltar.xml")
AddMinimapAtlas("images/minimapimages/kyno_beaststatue.xml")
AddMinimapAtlas("images/minimapimages/kyno_ivy.xml")
AddMinimapAtlas("images/minimapimages/kyno_saltpond.xml")
AddMinimapAtlas("images/minimapimages/kyno_safe.xml")
AddMinimapAtlas("images/minimapimages/kyno_carriage.xml")
AddMinimapAtlas("images/minimapimages/kyno_bike.xml")
AddMinimapAtlas("images/minimapimages/kyno_gorgeclock.xml")
AddMinimapAtlas("images/minimapimages/kyno_pubdoor.xml")
AddMinimapAtlas("images/minimapimages/kyno_housedoor.xml")
AddMinimapAtlas("images/minimapimages/kyno_roof.xml")
AddMinimapAtlas("images/minimapimages/kyno_clocktower.xml")
AddMinimapAtlas("images/minimapimages/kyno_house.xml")
AddMinimapAtlas("images/minimapimages/kyno_chimney1.xml")
AddMinimapAtlas("images/minimapimages/kyno_chimney2.xml")
AddMinimapAtlas("images/minimapimages/kyno_sammywagon.xml")
AddMinimapAtlas("images/minimapimages/kyno_piptoncart.xml")
AddMinimapAtlas("images/minimapimages/kyno_urn.xml")
AddMinimapAtlas("images/minimapimages/kyno_stoneobelisk.xml")
AddMinimapAtlas("images/minimapimages/kyno_worshipper.xml")
AddMinimapAtlas("images/minimapimages/kyno_worshipper2.xml")
AddMinimapAtlas("images/minimapimages/kyno_birdfountain.xml")
AddMinimapAtlas("images/minimapimages/kyno_oven.xml")
AddMinimapAtlas("images/minimapimages/kyno_grill.xml")
AddMinimapAtlas("images/minimapimages/kyno_pothanger.xml")
AddMinimapAtlas("images/minimapimages/kyno_pigelder.xml")
AddMinimapAtlas("images/minimapimages/kyno_pugna.xml")
AddMinimapAtlas("images/minimapimages/kyno_magmagolem.xml")
AddMinimapAtlas("images/minimapimages/kyno_lavagateway.xml")
AddMinimapAtlas("images/minimapimages/kyno_lavaspawner.xml")
AddMinimapAtlas("images/minimapimages/kyno_skullchest.xml")
AddMinimapAtlas("images/minimapimages/kyno_shopkeeper1.xml")
AddMinimapAtlas("images/minimapimages/kyno_shopkeeper2.xml")
AddMinimapAtlas("images/minimapimages/kyno_bonfire.xml")
AddMinimapAtlas("images/minimapimages/kyno_snowman.xml")
AddMinimapAtlas("images/minimapimages/kyno_scarecrow.xml")
AddMinimapAtlas("images/minimapimages/kyno_treeclump.xml")
AddMinimapAtlas("images/minimapimages/kyno_nightmarethrone.xml")
AddMinimapAtlas("images/minimapimages/kyno_appletree.xml")
AddMinimapAtlas("images/minimapimages/kyno_compromisingstatue.xml")
AddMinimapAtlas("images/minimapimages/lobster_home.xml")
AddMinimapAtlas("images/minimapimages/kyno_birdstand.xml")
AddMinimapAtlas("images/minimapimages/kyno_silktent.xml")
AddMinimapAtlas("images/minimapimages/kyno_furtent.xml")
AddMinimapAtlas("images/minimapimages/kyno_tentacletent.xml")
AddMinimapAtlas("images/minimapimages/kyno_tikitent.xml")
AddMinimapAtlas("images/minimapimages/kyno_canvas_blank.xml")
AddMinimapAtlas("images/minimapimages/kyno_garden_pot.xml")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local kyno_shipwreckedtab = AddRecipeTab("Shipwrecked", 998, "images/tabimages/kyno_shipwreckedtab.xml", "kyno_shipwreckedtab.tex", nil, true)
local kyno_hamlettab = AddRecipeTab("Hamlet", 998, "images/tabimages/kyno_hamlettab.xml", "kyno_hamlettab.tex", nil, true)
local kyno_gorgetab = AddRecipeTab("The Gorge", 998, "images/tabimages/kyno_gorgetab.xml", "kyno_gorgetab.tex", nil, true)
local kyno_forgetab = AddRecipeTab("The Forge", 998, "images/tabimages/kyno_forgetab.xml", "kyno_forgetab.tex", nil, true)
local kyno_surfacetab = AddRecipeTab("Surface", 998, "images/tabimages/kyno_surfacetab.xml", "kyno_surfacetab.tex", nil, true)
local kyno_cavetab = AddRecipeTab("Underground", 998, "images/tabimages/kyno_cavetab.xml", "kyno_cavetab.tex", nil, true)
local kyno_housetab = AddRecipeTab("Renovate", 998, "images/tabimages/kyno_housetab.xml", "kyno_housetab.tex", nil, true)
local kyno_painttab = AddRecipeTab("Painting", 998, "images/tabimages/kyno_painttab.xml", "kyno_painttab.tex", nil, true)

local magmaingredient = Ingredient("turf_magmafield", 2)
magmaingredient.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local potatoingredient = Ingredient("potato", 1)
potatoingredient.atlas = "images/inventoryimages/potato.xml"

local avocadoingredient = Ingredient("rock_avocado_fruit", 3)
avocadoingredient.atlas = "images/inventoryimages/rock_avocado_fruit.xml"

local shell1ingredient = Ingredient("singingshell_octave3", 1)
shell1ingredient.atlas = "images/inventoryimages/singingshell_octave3.xml"

local shell2ingredient = Ingredient("singingshell_octave4", 1)
shell2ingredient.atlas = "images/inventoryimages/singingshell_octave4.xml"

local shell3ingredient = Ingredient("singingshell_octave5", 1)
shell3ingredient.atlas = "images/inventoryimages/singingshell_octave5.xml"

local beachingredient1 = Ingredient("turf_beach", 1)
beachingredient1.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local beachingredient2 = Ingredient("turf_beach", 2)
beachingredient2.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local beachingredient4 = Ingredient("turf_beach", 4)
beachingredient4.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local burringredient = Ingredient("burr", 1)
burringredient.atlas = "images/inventoryimages/kyno_inventoryimages_ham.xml"

local rainforestingredient = Ingredient("turf_rainforest", 1)
rainforestingredient.atlas = "images/inventoryimages/kyno_turfs_ham.xml"

local deepjungleingredient = Ingredient("turf_deepjungle", 1)
deepjungleingredient.atlas = "images/inventoryimages/kyno_turfs_ham.xml"

local oincingredient1 = Ingredient("kyno_oinc1", 1)
oincingredient1.atlas = "images/inventoryimages/kyno_minisign_icons_2.xml"

local oincingredient10 = Ingredient("kyno_oinc10", 1)
oincingredient10.atlas = "images/inventoryimages/kyno_minisign_icons_2.xml"

local oincingredient100 = Ingredient("kyno_oinc100", 1)
oincingredient100.atlas = "images/inventoryimages/kyno_minisign_icons_2.xml"

local seashellingredient = Ingredient("seashell", 2)
seashellingredient.atlas = "images/inventoryimages/kyno_inventoryimages_sw.xml"

local snowfallingredient = Ingredient("turf_snowfall", 1)
snowfallingredient.atlas = "images/inventoryimages/kyno_turfs_new.xml"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Tweaked Recipes for basebuilding. 
local TWEAK_RECIPES = GetModConfigData("tweak_recipes")
if TWEAK_RECIPES then
local gatetweak = Recipe("fence_gate_item", {Ingredient("boards", 1), Ingredient("rope", 1) }, RECIPETABS.TOWN, TECH.SCIENCE_TWO,nil,nil,nil,2)
local gate_sortkey = AllRecipes["minisign"]["sortkey"]
gatetweak.sortkey = gate_sortkey + 0.1

local fencetweak = Recipe("fence_item", {Ingredient("twigs", 4), Ingredient("rope", 1) }, RECIPETABS.TOWN, TECH.SCIENCE_ONE,nil,nil,nil,8)
local fence_sortkey = AllRecipes["fence_gate_item"]["sortkey"]
fencetweak.sortkey = fence_sortkey + 0.1

local haytweak = Recipe("wall_hay_item", {Ingredient("cutgrass", 4), Ingredient("twigs", 2) }, RECIPETABS.TOWN, TECH.SCIENCE_ONE,nil,nil,nil,8)
local hay_sortkey = AllRecipes["fence_item"]["sortkey"]
haytweak.sortkey = hay_sortkey + 0.1

local woodtweak = Recipe("wall_wood_item", {Ingredient("boards", 2),Ingredient("rope", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_ONE,nil,nil,nil,8)
local wood_sortkey = AllRecipes["wall_hay_item"]["sortkey"]
woodtweak.sortkey = wood_sortkey + 0.1

local stonetweak = Recipe("wall_stone_item", {Ingredient("cutstone", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO,nil,nil,nil,8)
local stone_sortkey = AllRecipes["wall_wood_item"]["sortkey"]
stonetweak.sortkey = stone_sortkey + 0.1

local moontweak = Recipe("wall_moonrock_item", {Ingredient("moonrocknugget", 4)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO,nil,nil,nil,8)
local moon_sortkey = AllRecipes["wall_stone_item"]["sortkey"]
moontweak.sortkey = moon_sortkey + 0.1

local roadtweak = Recipe("turf_road", {Ingredient("turf_rocky", 1), Ingredient("boards", 1)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO, nil, nil, nil, 4)
local road_sortkey = AllRecipes["trophyscale_fish"]["sortkey"]
roadtweak.sortkey = road_sortkey + 0.1

local floortweak = Recipe("turf_woodfloor", {Ingredient("boards", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, 4)
local floor_sortkey = AllRecipes["turf_road"]["sortkey"]
floortweak.sortkey = floor_sortkey + 0.1

local checkertweak = Recipe("turf_checkerfloor", {Ingredient("marble", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, 4)
local checker_sortkey = AllRecipes["turf_woodfloor"]["sortkey"]
checkertweak.sortkey = checker_sortkey + 0.1

local carpettweak = Recipe("turf_carpetfloor", {Ingredient("boards", 1), Ingredient("beefalowool", 1)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, 4)
local carpet_sortkey = AllRecipes["turf_checkerfloor"]["sortkey"]
carpettweak.sortkey = carpet_sortkey + 0.1

local dragonflytweak = Recipe("turf_dragonfly", {Ingredient("dragon_scales", 1), Ingredient("cutstone", 2)}, RECIPETABS.TOWN, TECH.SCIENCE_TWO, nil, nil, nil, 6)
local dragonfly_sortkey = AllRecipes["turf_carpetfloor"]["sortkey"]
dragonflytweak.sortkey = dragonfly_sortkey + 0.1

local shelltweak = Recipe("turf_shellbeach", {Ingredient("slurtle_shellpieces", 2)}, RECIPETABS.TOWN, TECH.LOST, nil, nil, nil, 4)
local shell_sortkey = AllRecipes["turf_dragonfly"]["sortkey"]
shelltweak.sortkey = shell_sortkey + 0.1

local marshtweak = Recipe("turf_marsh", {Ingredient("cutreeds", 1), Ingredient("spoiled_food", 2)}, RECIPETABS.TOWN,  TECH.SCIENCE_TWO, nil, nil, 4, nil, "merm_builder")
local marsh_sortkey = AllRecipes["mermwatchtower"]["sortkey"]
marshtweak.sortkey = marsh_sortkey + 0.1
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function IsOcean(pt, rot)
	local ground_tile = GLOBAL.TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
	return ground_tile and ground_tile == GROUND.OCEAN_COASTAL_SHORE and ground_tile == GROUND.OCEAN_BRINEPOOL_SHORE and ground_tile == GROUND.OCEAN_COASTAL and ground_tile == GROUND.OCEAN_BRINEPOOL and ground_tile == GROUND.OCEAN_SWELL and ground_tile == GROUND.OCEAN_ROUGH and ground_tile == GROUND.OCEAN_HAZARDOUS and ground_tile == GROUND.SAVANNA
end

local KynPropSign = AddRecipe("kyno_propsign", {Ingredient("boards", 1)},
RECIPETABS.WAR, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_propsign.xml", "kyno_propsign.tex")
local prop_sortkey = AllRecipes["whip"]["sortkey"]
KynPropSign.sortkey = prop_sortkey + 0.1

local KynDiviningRod = AddRecipe("diviningrod", {Ingredient("twigs", 1), Ingredient("nightmarefuel", 5), Ingredient("gears", 1)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "diviningrod.tex")
local rod_sortkey = AllRecipes["researchlab2"]["sortkey"]
KynDiviningRod.sortkey = rod_sortkey + 0.1

local KynRack = AddRecipe("kyno_meatrack_hermit_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_meatrack_hermit_blueprint")
local rack_sortkey = AllRecipes["hermitshop_turf_shellbeach_blueprint"]["sortkey"]
KynRack.sortkey = rack_sortkey + 0.1

local KynBox = AddRecipe("kyno_beebox_hermit_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_beebox_hermit_blueprint")
local box_sortkey = AllRecipes["kyno_meatrack_hermit_blueprint"]["sortkey"]
KynBox.sortkey = box_sortkey + 0.1

local KynHouse = AddRecipe("kyno_hermithouse1_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_hermithouse1_blueprint")
local hermit_sortkey = AllRecipes["kyno_beebox_hermit_blueprint"]["sortkey"]
KynHouse.sortkey = hermit_sortkey + 0.1

local KynHouse2 = AddRecipe("kyno_hermithouse2_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_hermithouse2_blueprint")
local hermit2_sortkey = AllRecipes["kyno_hermithouse1_blueprint"]["sortkey"]
KynHouse2.sortkey = hermit2_sortkey + 0.1

local KynHouse3 = AddRecipe("kyno_hermithouse3_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_hermithouse3_blueprint")
local hermit3_sortkey = AllRecipes["kyno_hermithouse2_blueprint"]["sortkey"]
KynHouse3.sortkey = hermit3_sortkey + 0.1

local KynHouse4 = AddRecipe("kyno_hermithouse4_blueprint", {Ingredient("messagebottleempty", 3)},
RECIPETABS.HERMITCRABSHOP, TECH.HERMITCRABSHOP_SEVEN, nil, nil, true, nil, nil, nil, "blueprint_rare.tex", nil, "kyno_hermithouse4_blueprint")
local hermit4_sortkey = AllRecipes["kyno_hermithouse3_blueprint"]["sortkey"]
KynHouse4.sortkey = hermit4_sortkey + 0.1

local KynFridge = AddRecipe("kyno_wigfridge", {Ingredient("cutstone", 1), Ingredient("gears", 1), Ingredient("meat", 2)},
RECIPETABS.FARM, TECH.LOST, "kyno_wigfridge_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wigfridge.xml", "kyno_wigfridge.tex")
local wigfridge_sortkey = AllRecipes["icebox"]["sortkey"]
KynFridge.sortkey = wigfridge_sortkey + 0.1

local KynFurnace = AddRecipe("kyno_frozenfurnace", {Ingredient("bluegem", 2), Ingredient("ice", 10), Ingredient("dragon_scales", 1)},
RECIPETABS.TOWN, TECH.LOST, "kyno_frozenfurnace_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_frozenfurnace.xml", "kyno_frozenfurnace.tex")
local furnace_sortkey = AllRecipes["dragonflyfurnace"]["sortkey"]
KynFurnace.sortkey = furnace_sortkey + 0.1

local KynFurnace2 = AddRecipe("saladfurnace", {Ingredient("greengem", 2), Ingredient("ratatouille", 10), Ingredient("dragon_scales", 1)},
RECIPETABS.TOWN, TECH.LOST, "kyno_frozenfurnace_placer", 0, nil, nil, nil, "images/kyno_saladfurnace.xml", "kyno_saladfurnace.tex")
local furnace2_sortkey = AllRecipes["kyno_frozenfurnace"]["sortkey"]
KynFurnace2.sortkey = furnace2_sortkey + 0.1

local KynMast1 = AddRecipe("kyno_mast_item_01", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_01.xml", "kyno_mast_01.tex")
local mast_sortkey = AllRecipes["mast_item"]["sortkey"]
KynMast1.sortkey = mast_sortkey + 0.1

local KynMast2 = AddRecipe("kyno_mast_item_02", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_02.xml", "kyno_mast_02.tex")
local mast2_sortkey = AllRecipes["kyno_mast_item_01"]["sortkey"]
KynMast2.sortkey = mast2_sortkey + 0.1

local KynMast3 = AddRecipe("kyno_mast_item_03", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_03.xml", "kyno_mast_03.tex")
local mast3_sortkey = AllRecipes["kyno_mast_item_02"]["sortkey"]
KynMast3.sortkey = mast3_sortkey + 0.1

local KynMast4 = AddRecipe("kyno_mast_item_04", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_04.xml", "kyno_mast_04.tex")
local mast4_sortkey = AllRecipes["kyno_mast_item_03"]["sortkey"]
KynMast4.sortkey = mast4_sortkey + 0.1

local KynMast5 = AddRecipe("kyno_mast_item_05", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_05.xml", "kyno_mast_05.tex")
local mast5_sortkey = AllRecipes["kyno_mast_item_04"]["sortkey"]
KynMast5.sortkey = mast5_sortkey + 0.1

local KynMast6 = AddRecipe("kyno_mast_item_06", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_06.xml", "kyno_mast_06.tex")
local mast6_sortkey = AllRecipes["kyno_mast_item_05"]["sortkey"]
KynMast6.sortkey = mast6_sortkey + 0.1

local KynMast7 = AddRecipe("kyno_mast_item_07", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_07.xml", "kyno_mast_07.tex")
local mast7_sortkey = AllRecipes["kyno_mast_item_06"]["sortkey"]
KynMast7.sortkey = mast7_sortkey + 0.1

local KynMast8 = AddRecipe("kyno_mast_item_08", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_08.xml", "kyno_mast_08.tex")
local mast8_sortkey = AllRecipes["kyno_mast_item_07"]["sortkey"]
KynMast8.sortkey = mast8_sortkey + 0.1

local KynMast9 = AddRecipe("kyno_mast_item_09", {Ingredient("boards", 3), Ingredient("rope", 3), Ingredient("silk", 8)},
RECIPETABS.SEAFARING, TECH.SEAFARING_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_mast_09.xml", "kyno_mast_09.tex")
local mast9_sortkey = AllRecipes["kyno_mast_item_08"]["sortkey"]
KynMast9.sortkey = mast9_sortkey + 0.1

local KynFork = AddRecipe("kyno_glass_pitchfork", {Ingredient("pitchfork", 1), Ingredient("moonglass", 3)},
RECIPETABS.MOON_ALTAR, TECH.MOON_ALTAR_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_glass_pitchfork.xml", "kyno_glass_pitchfork.tex")
local fork_sortkey = AllRecipes["moonglassaxe"]["sortkey"]
KynFork.sortkey = fork_sortkey + 0.1

local KynLobster = AddRecipe("lobster_home", {Ingredient("lobster_claw", 2, "images/inventoryimages/lobster_claw.xml"), Ingredient("pickaxe", 1), Ingredient("cutstone", 3)},
RECIPETABS.TOWN, TECH.SCIENCE_TWO, "lobster_home_placer", 0, nil, nil, nil, "images/inventoryimages/lobster_home.xml", "lobster_home.tex")
local lobster_sortkey = AllRecipes["rabbithouse"]["sortkey"]
KynLobster.sortkey = lobster_sortkey + 0.1

local KynStand = AddRecipe("kyno_birdstand", {Ingredient("log", 6), Ingredient("papyrus", 2), Ingredient("seeds", 2)},
RECIPETABS.TOWN, TECH.SCIENCE_TWO, "kyno_birdstand_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_birdstand.xml", "kyno_birdstand.tex")
local stand_sortkey = AllRecipes["birdcage"]["sortkey"]
KynStand.sortkey = stand_sortkey + 0.1

local SWEAT = GetModConfigData("SWEAT")
if SWEET == 1 then
-- Classic Mode
AddRecipe("kyno_sw_prototyper", {Ingredient("boards", 4), Ingredient("pondfish", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sw_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "shipwrecked_entrance.tex")


AddRecipe("kyno_ham_prototyper", {Ingredient("boards", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ham_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "porkland_entrance.tex")


AddRecipe("kyno_gorge_prototyper", {Ingredient("cutstone", 3), Ingredient("meatballs", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_gorge_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gnawaltar.xml", "kyno_gnawaltar.tex")


AddRecipe("kyno_canvas_blank", {Ingredient("boards", 4), Ingredient("papyrus", 3)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas_blank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas_blank.xml", "kyno_canvas_blank.tex")


AddRecipe("kyno_canvas1", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas1.xml", "kyno_canvas1.tex")


AddRecipe("kyno_canvas2", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas2.xml", "kyno_canvas2.tex")


AddRecipe("kyno_canvas3", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas3.xml", "kyno_canvas3.tex")


AddRecipe("kyno_canvas4", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas4.xml", "kyno_canvas4.tex")


AddRecipe("kyno_canvas5", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas5.xml", "kyno_canvas5.tex")


AddRecipe("kyno_canvas6", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas6.xml", "kyno_canvas6.tex")


AddRecipe("kyno_canvas7", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas7.xml", "kyno_canvas7.tex")


AddRecipe("kyno_canvas8", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas8_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas8.xml", "kyno_canvas8.tex")


AddRecipe("kyno_canvas9", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas9_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas9.xml", "kyno_canvas9.tex")


AddRecipe("kyno_canvas10", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas10_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas10.xml", "kyno_canvas10.tex")


AddRecipe("kyno_canvas11", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas11_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas11.xml", "kyno_canvas11.tex")


AddRecipe("kyno_canvas12", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas12_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas12.xml", "kyno_canvas12.tex")


AddRecipe("kyno_canvas13", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas13_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas13.xml", "kyno_canvas13.tex")


AddRecipe("kyno_canvas14", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas14_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas14.xml", "kyno_canvas14.tex")


AddRecipe("kyno_canvas15", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas15_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas15.xml", "kyno_canvas15.tex")


AddRecipe("kyno_canvas16", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas16_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas16.xml", "kyno_canvas16.tex")


AddRecipe("kyno_canvas17", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas17_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas17.xml", "kyno_canvas17.tex")


AddRecipe("kyno_canvas18", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas18_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas18.xml", "kyno_canvas18.tex")


AddRecipe("kyno_canvas19", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas19_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas19.xml", "kyno_canvas19.tex")


AddRecipe("kyno_canvas20", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas20_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas20.xml", "kyno_canvas20.tex")


AddRecipe("kyno_canvas21", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas21_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas21.xml", "kyno_canvas21.tex")


AddRecipe("kyno_canvas22", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas22_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas22.xml", "kyno_canvas22.tex")


AddRecipe("kyno_canvas23", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas23_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas23.xml", "kyno_canvas23.tex")


AddRecipe("kyno_canvas24", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas24_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas24.xml", "kyno_canvas24.tex")


AddRecipe("kyno_canvas25", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas25_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas25.xml", "kyno_canvas25.tex")


AddRecipe("kyno_canvas26", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas26_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas26.xml", "kyno_canvas26.tex")


AddRecipe("kyno_canvas27", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas27_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas27.xml", "kyno_canvas27.tex")


AddRecipe("kyno_canvas28", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas28_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas28.xml", "kyno_canvas28.tex")


AddRecipe("kyno_canvas29", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas29_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas29.xml", "kyno_canvas29.tex")


AddRecipe("kyno_canvas30", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas30_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas30.xml", "kyno_canvas30.tex")


AddRecipe("kyno_canvas31", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas31_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas31.xml", "kyno_canvas31.tex")


AddRecipe("kyno_canvas32", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas32_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas32.xml", "kyno_canvas32.tex")


AddRecipe("kyno_canvas33", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas33_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas33.xml", "kyno_canvas33.tex")


AddRecipe("kyno_canvas34", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas34_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas34.xml", "kyno_canvas34.tex")


AddRecipe("kyno_canvas35", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas35_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas35.xml", "kyno_canvas35.tex")


AddRecipe("kyno_canvas36", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas36_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas36.xml", "kyno_canvas36.tex")


AddRecipe("kyno_canvas37", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas37_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas37.xml", "kyno_canvas37.tex")


AddRecipe("kyno_canvas38", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas38_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas38.xml", "kyno_canvas38.tex")


AddRecipe("kyno_canvas39", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas39_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas39.xml", "kyno_canvas39.tex")


AddRecipe("kyno_canvas40", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas40_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas40.xml", "kyno_canvas40.tex")


AddRecipe("kyno_canvas41", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas41_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas41.xml", "kyno_canvas41.tex")


AddRecipe("kyno_canvas42", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas42_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas42.xml", "kyno_canvas42.tex")


AddRecipe("kyno_canvas43", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas43_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas43.xml", "kyno_canvas43.tex")


AddRecipe("kyno_canvas44", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas44_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas44.xml", "kyno_canvas44.tex")


AddRecipe("kyno_canvas45", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas45_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas45.xml", "kyno_canvas45.tex")


AddRecipe("kyno_canvas46", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas46_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas46.xml", "kyno_canvas46.tex")


AddRecipe("kyno_canvas47", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas47_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas47.xml", "kyno_canvas47.tex")


AddRecipe("kyno_canvas48", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas48_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas48.xml", "kyno_canvas48.tex")


AddRecipe("kyno_canvas49", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas49_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas49.xml", "kyno_canvas49.tex")


AddRecipe("kyno_canvas50", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas50_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas50.xml", "kyno_canvas50.tex")


AddRecipe("kyno_canvas51", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas51_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas51.xml", "kyno_canvas51.tex")


AddRecipe("kyno_canvas52", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas52_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas52.xml", "kyno_canvas52.tex")


AddRecipe("kyno_canvas53", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas53_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas53.xml", "kyno_canvas53.tex")


AddRecipe("kyno_canvas54", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas54_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas54.xml", "kyno_canvas54.tex")


AddRecipe("kyno_canvas55", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas55_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas55.xml", "kyno_canvas55.tex")


AddRecipe("kyno_canvas56", {Ingredient("boards", 4), Ingredient("papyrus", 3), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas56_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas56.xml", "kyno_canvas56.tex")


AddRecipe("kyno_plantholder_basic", {Ingredient("log", 2), Ingredient("twigs", 4), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_basic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_basic.tex")


AddRecipe("kyno_plantholder_wip", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_wip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_wip.tex")


AddRecipe("kyno_plantholder_fancy", {Ingredient("marble", 2), Ingredient("feather_crow", 2), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_fancy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_fancy.tex")


AddRecipe("kyno_plantholder_bonsai", {Ingredient("cutstone", 1), Ingredient("dug_berrybush_juicy", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_bonsai_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_bonsai.tex")


AddRecipe("kyno_plantholder_dishgarden", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_dishgarden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_dishgarden.tex")


AddRecipe("kyno_plantholder_philodendron", {Ingredient("marble", 1), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_philodendron_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_philodendron.tex")


AddRecipe("kyno_plantholder_orchid", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 2), Ingredient("petals", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_orchid_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_orchid.tex")


AddRecipe("kyno_plantholder_draceana", {Ingredient("log", 4), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_draceana_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_draceana.tex")


AddRecipe("kyno_plantholder_palm", {Ingredient("cutgrass", 4), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_palm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_palm.tex")


AddRecipe("kyno_plantholder_zz", {Ingredient("cutgrass", 2), Ingredient("twigs", 4), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_zz_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_zz.tex")


AddRecipe("kyno_plantholder_fernstand", {Ingredient("goldnugget", 2), Ingredient("foliage", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_fernstand_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_fernstand.tex")


AddRecipe("kyno_plantholder_terrarium", {Ingredient("cutstone", 2), Ingredient("moonglass", 4), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_terrarium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_terrarium.tex")


AddRecipe("kyno_plantholder_plantpet", {Ingredient("log", 4), Ingredient("rocks", 3), Ingredient("twigs", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_plantpet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_plantpet.tex")


AddRecipe("kyno_plantholder_traps", {Ingredient("cutstone", 1), Ingredient("houndstooth", 2), Ingredient("succulent_picked", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_traps_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_traps.tex")


AddRecipe("kyno_plantholder_sadness", {Ingredient("boards", 1), Ingredient("dug_sapling", 1), Ingredient("winter_ornament_plain3", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_sadness_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_winterfeasttreeofsadness.tex")


AddRecipe("kyno_palace_plant", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_plant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_plant.xml", "kyno_palace_plant.tex")


AddRecipe("kyno_chair_classic", {Ingredient("marble", 2), Ingredient("silk", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_classic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_classic.tex")


AddRecipe("kyno_chair_corner", {Ingredient("boards", 2), Ingredient("silk", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_corner_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_corner.tex")


AddRecipe("kyno_chair_bench", {Ingredient("boards", 2), Ingredient("silk", 3), Ingredient("turf_carpetfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_bench_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_bench.tex")


AddRecipe("kyno_chair_horned", {Ingredient("boards", 2), Ingredient("silk", 3), Ingredient("turf_checkerfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_horned_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_horned.tex")


AddRecipe("kyno_chair_footrest", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_footrest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_footrest.tex")


AddRecipe("kyno_chair_lounge", {Ingredient("boards", 2), Ingredient("silk", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_lounge_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_lounge.tex")


AddRecipe("kyno_chair_massager", {Ingredient("boards", 3), Ingredient("transistor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_massager_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_massager.tex")


AddRecipe("kyno_chair_stuffed", {Ingredient("silk", 4), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_stuffed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_stuffed.tex")


AddRecipe("kyno_chair_rocking", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_rocking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_rocking.tex")


AddRecipe("kyno_chair_ottoman", {Ingredient("boards", 2), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_ottoman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_ottoman.tex")


AddRecipe("kyno_chair_chaise", {Ingredient("marble", 2), Ingredient("silk", 3), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_chaise_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_chaise.tex")


AddRecipe("kyno_palace_throne", {Ingredient("goldnugget", 4), Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_throne_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_throne.xml", "kyno_palace_throne.tex")


AddRecipe("kyno_rugs_round", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_round_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_round.tex")


AddRecipe("kyno_rugs_square", {Ingredient("silk", 4), Ingredient("tentaclespots", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_square_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_square.tex")


AddRecipe("kyno_rugs_oval", {Ingredient("silk", 4), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_oval_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_oval.tex")


AddRecipe("kyno_rugs_rectangle", {Ingredient("silk", 4), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_rectangle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_rectangle.tex")


AddRecipe("kyno_rugs_fur", {Ingredient("silk", 2), Ingredient("beefalowool", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_fur_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_fur.tex")


AddRecipe("kyno_rugs_hedgehog", {Ingredient("silk", 4), Ingredient("houndstooth", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hedgehog_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_hedgehog.tex")


AddRecipe("kyno_rugs_porcupuss", {Ingredient("silk", 4), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_porcupuss_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_porcupuss.tex")


AddRecipe("kyno_rugs_hoofprints", {Ingredient("silk", 4), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hoofprints_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_hoofprint.tex")


AddRecipe("kyno_rugs_octagon", {Ingredient("silk", 4), Ingredient("yellowgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_octagon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_octagon.tex")


AddRecipe("kyno_rugs_swirl", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_swirl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_swirl.tex")


AddRecipe("kyno_rugs_catcoon", {Ingredient("silk", 4), Ingredient("coontail", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_catcoon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_catcoon.tex")


AddRecipe("kyno_rugs_rubbermat", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_rubbermat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_rubbermat.tex")


AddRecipe("kyno_rugs_web", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_web_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_web.tex")


AddRecipe("kyno_rugs_metal", {Ingredient("silk", 4), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_metal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_metal.tex")


AddRecipe("kyno_rugs_wormhole", {Ingredient("silk", 4), Ingredient("meat", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_wormhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_wormhole.tex")


AddRecipe("kyno_rugs_braid", {Ingredient("silk", 4), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_braid_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_braid.tex")


AddRecipe("kyno_rugs_beard", {Ingredient("silk", 4), Ingredient("beardhair", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_beard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_beard.tex")


AddRecipe("kyno_rugs_nailbed", {Ingredient("silk", 4), Ingredient("houndstooth", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_nailbed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_nailbed.tex")


AddRecipe("kyno_rugs_crime", {Ingredient("silk", 4), Ingredient("reviver", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_crime_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_crime.tex")


AddRecipe("kyno_rugs_tiles", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_tiles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_tiles.tex")


AddRecipe("kyno_rugs_circle", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_circle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_circle.xml", "kyno_rugs_circle.tex")


AddRecipe("kyno_rugs_moth", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_moth_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_moth.xml", "kyno_rugs_moth.tex")


AddRecipe("kyno_rugs_leather", {Ingredient("silk", 4), Ingredient("beefalowool", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_leather_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_leather.xml", "kyno_rugs_leather.tex")


AddRecipe("kyno_rugs_throneroom", {Ingredient("silk", 4), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_throneroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_throneroom.xml", "kyno_rugs_throneroom.tex")


AddRecipe("kyno_rugs_worn", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_worn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_worn.xml", "kyno_rugs_worn.tex")


AddRecipe("kyno_rugs_antiquities", {Ingredient("silk", 4), oincingredient1 },
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_antiquities_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_antiquities.xml", "kyno_rugs_antiquities.tex")


AddRecipe("kyno_rugs_bank", {Ingredient("silk", 4), oincingredient100 },
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_bank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_bank.xml", "kyno_rugs_bank.tex")


AddRecipe("kyno_rugs_deli", {Ingredient("silk", 4), Ingredient("hambat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_deli_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_deli.xml", "kyno_rugs_deli.tex")


AddRecipe("kyno_rugs_flag", {Ingredient("silk", 4), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_flag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_flag.xml", "kyno_rugs_flag.tex")


AddRecipe("kyno_rugs_florist", {Ingredient("silk", 4), Ingredient("petals_evil", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_florist_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_florist.xml", "kyno_rugs_florist.tex")


AddRecipe("kyno_rugs_general", {Ingredient("silk", 4), Ingredient("shovel", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_general_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_general.xml", "kyno_rugs_general.tex")


AddRecipe("kyno_rugs_gift", {Ingredient("silk", 4), Ingredient("purplegem", 1), Ingredient("yellowgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_gift_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_gift.xml", "kyno_rugs_gift.tex")


AddRecipe("kyno_rugs_hoofspa", {Ingredient("silk", 4), Ingredient("moonglass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hoofspa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_hoofspa.xml", "kyno_rugs_hoofspa.tex")


AddRecipe("kyno_rugs_old", {Ingredient("silk", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_old_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_old.xml", "kyno_rugs_old.tex")


AddRecipe("kyno_rugs_produce", {Ingredient("silk", 4), Ingredient("carrot", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_produce_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_produce.xml", "kyno_rugs_produce.tex")


AddRecipe("kyno_rugs_tinker", {Ingredient("silk", 4), Ingredient("blueprint", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_tinker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_tinker.xml", "kyno_rugs_tinker.tex")


AddRecipe("kyno_lamps_fringe", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_fringe_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_fringe.tex")


AddRecipe("kyno_lamps_stainglass", {Ingredient("lantern", 1), Ingredient("purplegem", 1), Ingredient("moonglass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_stainglass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_stainglass.tex")


AddRecipe("kyno_lamps_downbridge", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_downbridge_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_downbridge.tex")


AddRecipe("kyno_lamps_dualembroidered", {Ingredient("lantern", 1), Ingredient("moonglass", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualembroidered_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2embroidered.tex")


AddRecipe("kyno_lamps_ceramic", {Ingredient("lantern", 1), Ingredient("marble", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_ceramic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_ceramic.tex")


AddRecipe("kyno_lamps_glass", {Ingredient("lantern", 1), Ingredient("moonglass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_glass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_glass.tex")


AddRecipe("kyno_lamps_dualfringes", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualfringes_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2fringes.tex")


AddRecipe("kyno_lamps_candelabra", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("torch", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_candelabra_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_candelabra.tex")


AddRecipe("kyno_lamps_elizabethan", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_elizabethan_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_elizabethan.tex")


AddRecipe("kyno_lamps_gothic", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_gothic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_gothic.tex")


AddRecipe("kyno_lamps_orb", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("lightbulb", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_orb_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_orb.tex")


AddRecipe("kyno_lamps_bellshade", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_bellshade_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_bellshade.tex")


AddRecipe("kyno_lamps_crystals", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_crystals_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_crystals.tex")


AddRecipe("kyno_lamps_upturn", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_upturn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_upturn.tex")


AddRecipe("kyno_lamps_dualupturns", {Ingredient("lantern", 1), Ingredient("cutstone", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualupturns_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2upturns.tex")


AddRecipe("kyno_lamps_spool", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("redgem", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_spool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_spool.tex")


AddRecipe("kyno_lamps_edison", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_edison_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_edison.tex")


AddRecipe("kyno_lamps_adjustable", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_adjustable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_adjustable.tex")


AddRecipe("kyno_lamps_rightangles", {Ingredient("lantern", 1), Ingredient("goldnugget", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_rightangles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_rightangles.tex")


AddRecipe("kyno_lamps_fancy", {Ingredient("lantern", 1), Ingredient("marble", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_fancy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_hoofspa.tex")


AddRecipe("kyno_lamps_festivetree", {Ingredient("pinecone", 1), Ingredient("winter_ornament_light1", 1), Ingredient("winter_ornament_boss_deerclops", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_festivetree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_festivetree.tex")


AddRecipe("kyno_tables_round", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_round_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_round.tex")


AddRecipe("kyno_tables_banker", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_banker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_banker.tex")


AddRecipe("kyno_tables_diy", {Ingredient("boards", 2), Ingredient("twigs", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_diy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_diy.tex")


AddRecipe("kyno_tables_raw", {Ingredient("boards", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_raw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_raw.tex")


AddRecipe("kyno_tables_crate", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_crate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_crate.tex")


AddRecipe("kyno_tables_chess", {Ingredient("boards", 2), Ingredient("trinket_28", 1), Ingredient("trinket_16", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_chess_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_chess.tex")


AddRecipe("kyno_accademia_woodtable", {Ingredient("boards", 2), Ingredient("moonglass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_woodtable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table.xml", "kyno_accademia_table.tex")


AddRecipe("kyno_accademia_booktable", {Ingredient("boards", 2), Ingredient("papyrus", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_booktable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table_books.xml", "kyno_accademia_table_books.tex")


AddRecipe("kyno_accademia_wiptable", {Ingredient("boards", 2), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_wiptable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table_wip.xml", "kyno_accademia_table_wip.tex")


AddRecipe("kyno_interior_parts", {Ingredient("boards", 2), Ingredient("moonglass", 2), Ingredient("gears", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_parts_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_tableparts.xml", "kyno_interior_tableparts.tex")


AddRecipe("kyno_accademia_anvil", {Ingredient("cutstone", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_anvil_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_anvil.xml", "kyno_accademia_anvil.tex")


AddRecipe("kyno_accademia_stoneblock", {Ingredient("marble", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_stoneblock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_stoneblock.xml", "kyno_accademia_stoneblock.tex")


AddRecipe("kyno_accademia_vase", {Ingredient("marble", 3), Ingredient("bluegem", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_vase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_vase.xml", "kyno_accademia_vase.tex")


AddRecipe("kyno_accademia_pottingwheel", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel.xml", "kyno_accademia_pottingwheel.tex")


AddRecipe("kyno_accademia_pottingwheelurn", {Ingredient("boards", 3), Ingredient("marble", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelurn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_urn.xml", "kyno_accademia_pottingwheel_urn.tex")


AddRecipe("kyno_accademia_pottingwheelclay", {Ingredient("boards", 3), Ingredient("rocks", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelclay_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_clay.xml", "kyno_accademia_pottingwheel_clay.tex")


AddRecipe("kyno_accademia_pottingwheelwip", {Ingredient("boards", 3), Ingredient("cutstone", 1), Ingredient("hammer", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelwip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_wip.xml", "kyno_accademia_pottingwheel_wip.tex")


AddRecipe("kyno_accademia_velvetback", {Ingredient("goldnugget", 4), Ingredient("redgem", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_velvetback_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_velvetback.xml", "kyno_accademia_velvetback.tex")


AddRecipe("kyno_accademia_velvetside", {Ingredient("goldnugget", 4), Ingredient("redgem", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_velvetside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_velvetside.xml", "kyno_accademia_velvetside.tex")


AddRecipe("kyno_arcane_bookcase", {Ingredient("livinglog", 6), Ingredient("papyrus", 4), Ingredient("nightmarefuel", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_bookcase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_bookcase.xml", "kyno_arcane_bookcase.tex")


AddRecipe("kyno_arcane_chestclosed", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_chestclosed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_chestclosed.xml", "kyno_arcane_chestclosed.tex")


AddRecipe("kyno_arcane_chestopen", {Ingredient("boards", 3), Ingredient("blueprint", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_chestopen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_chestopen.xml", "kyno_arcane_chestopen.tex")


AddRecipe("kyno_arcane_containers", {Ingredient("marble", 4), Ingredient("cutstone", 2), Ingredient("nightmarefuel", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_containers_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_containers.xml", "kyno_arcane_containers.tex")


AddRecipe("kyno_arcane_tablemagic", {Ingredient("boards", 3), Ingredient("turf_carpetfloor", 1), Ingredient("trinket_32", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_tablemagic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_tablemagic.xml", "kyno_arcane_tablemagic.tex")


AddRecipe("kyno_arcane_tabledistillery", {Ingredient("boards", 3), Ingredient("trinket_35", 1), Ingredient("nightmarefuel", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_tabledistillery_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_tabledistillery.xml", "kyno_arcane_tabledistillery.tex")


AddRecipe("kyno_deli_stackside", {Ingredient("cutgrass", 5), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_deli_stackside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_deli_stackside.xml", "kyno_deli_stackside.tex")


AddRecipe("kyno_deli_stackfront", {Ingredient("cutgrass", 5), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_deli_stackfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_deli_stackfront.xml", "kyno_deli_stackfront.tex")


AddRecipe("kyno_florist_latticefront", {Ingredient("boards", 1), Ingredient("twigs", 5), Ingredient("petals", 5)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_latticefront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_latticefront.xml", "kyno_florist_latticefront.tex")


AddRecipe("kyno_florist_latticeside", {Ingredient("boards", 1), Ingredient("twigs", 5), Ingredient("petals", 5)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_latticeside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_latticeside.xml", "kyno_florist_latticeside.tex")


AddRecipe("kyno_florist_pillarfront", {Ingredient("boards", 1), Ingredient("twigs", 5), Ingredient("petals", 5)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_pillarfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_pillarfront.xml", "kyno_florist_pillarfront.tex")


AddRecipe("kyno_florist_pillarside", {Ingredient("boards", 1), Ingredient("twigs", 5), Ingredient("petals", 5)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_pillarside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_pillarside.xml", "kyno_florist_pillarside.tex")


AddRecipe("kyno_florist_tiered", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_tiered_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_tiered.xml", "kyno_florist_tiered.tex")


AddRecipe("kyno_mayoroffice_bookcase", {Ingredient("boards", 4), Ingredient("papyrus", 4), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_mayoroffice_bookcase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mayoroffice_bookcase.xml", "kyno_mayoroffice_bookcase.tex")


AddRecipe("kyno_mayoroffice_desk", {Ingredient("boards", 3), Ingredient("lantern", 1), Ingredient("featherpencil", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_mayoroffice_desk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mayoroffice_desk.xml", "kyno_mayoroffice_desk.tex")


AddRecipe("kyno_millinery_hatbox1", {Ingredient("boards", 2), Ingredient("tophat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_hatbox1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_hatbox1.xml", "kyno_millinery_hatbox1.tex")


AddRecipe("kyno_millinery_hatbox2", {Ingredient("boards", 2), Ingredient("winterhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_hatbox2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_hatbox2.xml", "kyno_millinery_hatbox2.tex")


AddRecipe("kyno_millinery_sewingmachine", {Ingredient("cutstone", 3), Ingredient("sewing_kit", 6), Ingredient("gears", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_sewingmachine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_sewingmachine.xml", "kyno_millinery_sewingmachine.tex")


AddRecipe("kyno_millinery_worktable", {Ingredient("boards", 3), Ingredient("papyrus", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_worktable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_worktable.xml", "kyno_millinery_worktable.tex")


AddRecipe("kyno_palace_pillar", {Ingredient("marble", 4), Ingredient("goldnugget", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_pillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_pillar.xml", "kyno_palace_pillar.tex")


AddRecipe("kyno_interior_baskets", {Ingredient("boards", 2), Ingredient("cutgrass", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_baskets_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_baskets.xml", "kyno_interior_baskets.tex")


AddRecipe("kyno_interior_bin", {Ingredient("boards", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_bin_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_bin.xml", "kyno_interior_bin.tex")


AddRecipe("kyno_interior_cans", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_cans_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_cans.xml", "kyno_interior_cans.tex")


AddRecipe("kyno_interior_display", {Ingredient("marble", 2), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_display_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_display.xml", "kyno_interior_display.tex")


AddRecipe("kyno_interior_endtable", {Ingredient("boards", 2), Ingredient("taffy", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_endtable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_endtable.xml", "kyno_interior_endtable.tex")


AddRecipe("kyno_interior_rollholder", {Ingredient("boards", 2), Ingredient("blueprint", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_rollholder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_rollholder.xml", "kyno_interior_rollholder.tex")


AddRecipe("kyno_interior_rollholderfront", {Ingredient("boards", 2), Ingredient("blueprint", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_rollholderfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_rollholderfront.xml", "kyno_interior_rollholderfront.tex")


AddRecipe("kyno_interior_vase", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_vase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_vase.xml", "kyno_interior_vase.tex")


AddRecipe("kyno_interior_urn", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_urn.xml", "kyno_interior_urn.tex")


AddRecipe("kyno_interior_vasemarble", {Ingredient("marble", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_vasemarble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_vasemarble.xml", "kyno_interior_vasemarble.tex")


AddRecipe("kyno_interior_wired", {Ingredient("fence_item", 2), Ingredient("petals", 1), Ingredient("papyrus", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_wired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_wired.xml", "kyno_interior_wired.tex")


AddRecipe("kyno_containers_box1", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box1.xml", "kyno_containers_box1.tex")


AddRecipe("kyno_containers_box2", {Ingredient("boards", 2), Ingredient("tophat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box2.xml", "kyno_containers_box2.tex")


AddRecipe("kyno_containers_box3", {Ingredient("boards", 2), Ingredient("winterhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box3.xml", "kyno_containers_box3.tex")


AddRecipe("kyno_containers_box4", {Ingredient("boards", 2), Ingredient("strawhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box4.xml", "kyno_containers_box4.tex")


AddRecipe("kyno_containers_box5", {Ingredient("boards", 2), Ingredient("beefalohat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box5.xml", "kyno_containers_box5.tex")


AddRecipe("kyno_containers_box6", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box6.xml", "kyno_containers_box6.tex")


AddRecipe("kyno_containers_box7", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box7.xml", "kyno_containers_box7.tex")


AddRecipe("kyno_containers_box8", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box8_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box8.xml", "kyno_containers_box8.tex")


AddRecipe("kyno_containers_box9", {Ingredient("boards", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box9_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box9.xml", "kyno_containers_box9.tex")


AddRecipe("kyno_containers_box10", {Ingredient("papyrus", 2), Ingredient("rope", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box10_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box10.xml", "kyno_containers_box10.tex")


AddRecipe("kyno_containers_box11", {Ingredient("papyrus", 2), Ingredient("rope", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box11_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box11.xml", "kyno_containers_box11.tex")


AddRecipe("kyno_containers_box12", {Ingredient("cutgrass", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box12_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box12.xml", "kyno_containers_box12.tex")


AddRecipe("kyno_containers_box13", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box13_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box13.xml", "kyno_containers_box13.tex")


AddRecipe("kyno_containers_box14", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box14_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box14.xml", "kyno_containers_box14.tex")


AddRecipe("kyno_containers_box15", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box15_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box15.xml", "kyno_containers_box15.tex")


AddRecipe("kyno_containers_box16", {Ingredient("boards", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box16_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box16.xml", "kyno_containers_box16.tex")


AddRecipe("turf_marbletile", {Ingredient("marble", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_marbletile.tex")


AddRecipe("turf_chess", {Ingredient("turf_checkerfloor", 1), Ingredient("turf_road", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_chess.tex")


AddRecipe("turf_slate", {Ingredient("rocks", 1), Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_slate.tex")


AddRecipe("turf_metalsheet", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_metalsheet.tex")


AddRecipe("turf_garden", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_garden.tex")


AddRecipe("turf_geometric", {Ingredient("turf_checkerfloor", 1), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_geometric.tex")


AddRecipe("turf_shagcarpet", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_shagcarpet.tex")


AddRecipe("turf_transitional", {Ingredient("turf_checkerfloor", 1), Ingredient("turf_woodfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_transitional.tex")


AddRecipe("turf_woodpanel", {Ingredient("turf_woodfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_woodpanel.tex")


AddRecipe("turf_herring", {Ingredient("boneshard", 1), Ingredient("turf_road", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_herring.tex")


AddRecipe("turf_hexagon", {Ingredient("turf_checkerfloor", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_hexagon.tex")


AddRecipe("turf_hoof", {Ingredient("cutstone", 1), Ingredient("pigskin", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_hoof.tex")


AddRecipe("turf_octagon", {Ingredient("turf_checkerfloor", 1), Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_octagon.tex")


AddRecipe("kyno_pugna", {Ingredient("hambat", 1), Ingredient("meat", 10), Ingredient("reviver", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_pugna_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pugna.xml", "kyno_pugna.tex")


AddRecipe("cave_fern", {Ingredient("foliage", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_cavefern_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "foliage.tex")


AddRecipe("flower_withered", {Ingredient("cutgrass", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flower_withered_placer", 0, nil, nil, nil, "images/kyno_flowerwithered.xml", "kyno_flowerwithered.tex")


AddRecipe("kyno_plant_algae", {Ingredient("cutlichen", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_plant_algae_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_caveplant.xml", "kyno_caveplant.tex")


AddRecipe("kyno_flowerlightone", {Ingredient("lightbulb", 1), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightone.xml", "kyno_flowerlightone.tex")


AddRecipe("kyno_flowerlightspringy", {Ingredient("lightbulb", 1), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightspringy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightspringy.xml", "kyno_flowerlightspringy.tex")


AddRecipe("kyno_flowerlighttwo", {Ingredient("lightbulb", 2), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlighttwo_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlighttwo.xml", "kyno_flowerlighttwo.tex")


AddRecipe("kyno_flowerlightthree", {Ingredient("lightbulb", 3), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightthree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightthree.xml", "kyno_flowerlightthree.tex")


AddRecipe("kyno_mushtree_medium", {Ingredient("log", 2), Ingredient("red_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_redmushtree_placer", 0, nil, nil, nil, "images/kyno_redmushtree.xml", "kyno_redmushtree.tex")


AddRecipe("kyno_mushtree_small", {Ingredient("log", 2), Ingredient("green_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_greenmushtree_placer", 0, nil, nil, nil, "images/kyno_greenmushtree.xml", "kyno_greenmushtree.tex")


AddRecipe("kyno_mushtree_tall", {Ingredient("log", 2), Ingredient("blue_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bluemushtree_placer", 0, nil, nil, nil, "images/kyno_bluemushtree.xml", "kyno_bluemushtree.tex")


AddRecipe("kyno_mushtree_tall_webbed", {Ingredient("log", 2), Ingredient("blue_cap", 1), Ingredient("silk", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_webbedmushtree_placer", 0, nil, nil, nil, "images/kyno_webbedmushtree.xml", "kyno_webbedmushtree.tex")


AddRecipe("kyno_stump6", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump6.xml", "kyno_stump6.tex")


AddRecipe("kyno_stump7", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump7.xml", "kyno_stump7.tex")


AddRecipe("kyno_stump8", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump8.xml", "kyno_stump8.tex")


AddRecipe("kyno_stalagmite_full", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitefull_placer", 0, nil, nil, nil, "images/kyno_stalagmitefull.xml", "kyno_stalagmitefull.tex")


AddRecipe("kyno_stalagmite_med", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitemed_placer", 0, nil, nil, nil, "images/kyno_stalagmitemed.xml", "kyno_stalagmitemed.tex")


AddRecipe("kyno_stalagmite_low", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitelow_placer", 0, nil, nil, nil, "images/kyno_stalagmitelow.xml", "kyno_stalagmitelow.tex")


AddRecipe("kyno_stalagmite_tall_full", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_full_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_full.xml", "kyno_stalagmitetall_full.tex")


AddRecipe("kyno_stalagmite_tall_med", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_med_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_med.xml", "kyno_stalagmitetall_med.tex")


AddRecipe("kyno_stalagmite_tall_low", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_low_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_low.xml", "kyno_stalagmitetall_low.tex")


AddRecipe("kyno_spiderhole", {Ingredient("rocks", 3), Ingredient("silk", 2), Ingredient("flint", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_spiderhole_placer", 0, nil, nil, nil, "images/kyno_spiderhole.xml", "kyno_spiderhole.tex")


AddRecipe("kyno_batiliskden", {Ingredient("guano", 5), Ingredient("batwing", 3), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_batiliskden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batiliskden.xml", "kyno_batiliskden.tex")


AddRecipe("kyno_pondcave", {Ingredient("ice", 8), Ingredient("eel", 2), Ingredient("cutlichen", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pondcave_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondcave.xml", "kyno_pondcave.tex")


AddRecipe("kyno_toadhole", {Ingredient("shovel", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadhole.xml", "kyno_toadhole.tex")


AddRecipe("kyno_toadstoolcap", {Ingredient("shroom_skin", 1), Ingredient("green_cap", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadstoolcap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadstoolcap.xml", "kyno_toadstoolcap.tex")


AddRecipe("kyno_toadstoolcap_dark", {Ingredient("shroom_skin", 1), Ingredient("green_cap", 3), Ingredient("canary", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadstoolcap_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadstoolcap_dark.xml", "kyno_toadstoolcap_dark.tex")


AddRecipe("kyno_sporecap", {Ingredient("green_cap", 4), Ingredient("log", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sporecap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sporecap.xml", "kyno_sporecap.tex")


AddRecipe("kyno_sporecap_dark", {Ingredient("green_cap", 4), Ingredient("log", 2), Ingredient("spoiled_food", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sporecap_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sporecap_dark.xml", "kyno_sporecap_dark.tex")


AddRecipe("kyno_boomshroom", {Ingredient("green_cap", 2), Ingredient("spoiled_food", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_boomshroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boomshroom.xml", "kyno_boomshroom.tex")


AddRecipe("kyno_boomshroom_dark", {Ingredient("blue_cap", 2), Ingredient("spoiled_food", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_boomshroom_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boomshroom_dark.xml", "kyno_boomshroom_dark.tex")


AddRecipe("kyno_tentaclehole", {Ingredient("tentaclespots", 2), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_tentaclehole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tentaclehole.xml", "kyno_tentaclehole.tex")


AddRecipe("kyno_bigtentacle", {Ingredient("tentaclespots", 5), Ingredient("tentaclespike", 1), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bigtentacle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bigtentacle.xml", "kyno_bigtentacle.tex")


AddRecipe("kyno_nightmarefissure", {Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_nightmarefissure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarefissure.xml", "kyno_nightmarefissure.tex")


AddRecipe("kyno_nightmarefissure_ruins", {Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_nightmarefissure_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarefissure_ruins.xml", "kyno_nightmarefissure_ruins.tex")


AddRecipe("kyno_slurtlehole", {Ingredient("slurtle_shellpieces", 4), Ingredient("slurtleslime", 2), Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_slurtlehole_placer", 0, nil, nil, nil, "images/kyno_slurtlehole.xml", "kyno_slurtlehole.tex")


AddRecipe("kyno_wormlight", {Ingredient("wormlight_lesser", 1), Ingredient("poop", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_wormlight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormlight.xml", "kyno_wormlight.tex")


AddRecipe("cavein_boulder", {Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "cavein_boulder.tex")


AddRecipe("kyno_ruinshole", {Ingredient("shovel", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinshole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_caveholeitems.xml", "kyno_caveholeitems.tex")


AddRecipe("kyno_lichenplant", {Ingredient("cutlichen", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lichenplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lichenplant.xml", "kyno_lichenplant.tex")


AddRecipe("kyno_lichenplant_legacy", {Ingredient("cutlichen", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lichenplant_legacy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lichenplant_legacy.xml", "kyno_lichenplant_legacy.tex")


AddRecipe("kyno_cave_banana_tree", {Ingredient("cave_banana", 3), Ingredient("log", 2), Ingredient("twigs", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bananatree_placer", 0, nil, nil, nil, "images/kyno_bananatree.xml", "kyno_bananatree.tex")


AddRecipe("kyno_monkeybarrel", {Ingredient("cave_banana", 4), Ingredient("log", 4), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_monkeybarrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_splumonkeypod.xml", "kyno_splumonkeypod.tex")


AddRecipe("kyno_barrel", {Ingredient("cave_banana", 4), Ingredient("boards", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_barrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_monkeybarrel.xml", "kyno_monkeybarrel.tex")


AddRecipe("kyno_ruinsbowl", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsbowl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsbowl.xml", "kyno_ruinsbowl.tex")


AddRecipe("kyno_ruinschair", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinschair_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinschair.xml", "kyno_ruinschair.tex")


AddRecipe("kyno_ruinschipbowl", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinschipbowl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinschipbowl.xml", "kyno_ruinschipbowl.tex")


AddRecipe("kyno_ruinsplate", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsplate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsplate.xml", "kyno_ruinsplate.tex")


AddRecipe("kyno_ruinstable", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinstable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinstable.xml", "kyno_ruinstable.tex")


AddRecipe("kyno_ruinsvase", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsvase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsvase.xml", "kyno_ruinsvase.tex")


AddRecipe("kyno_brokenbits_full", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenbits_full_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenbits.xml", "kyno_brokenbits.tex")


AddRecipe("kyno_sinkhole_ruins", {Ingredient("thulecite_pieces", 6)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sinkhole_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkhole_ruins.xml", "kyno_sinkhole_ruins.tex")


AddRecipe("kyno_statueruins_nogem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_nogem.xml", "kyno_statueruins_nogem.tex")


AddRecipe("kyno_statueruins_bluegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("bluegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_bluegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_bluegem.xml", "kyno_statueruins_bluegem.tex")


AddRecipe("kyno_statueruins_redgem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("redgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_redgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_redgem.xml", "kyno_statueruins_redgem.tex")


AddRecipe("kyno_statueruins_purplegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("purplegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_purplegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_purplegem.xml", "kyno_statueruins_purplegem.tex")


AddRecipe("kyno_statueruins_orangegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("orangegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_orangegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_orangegem.xml", "kyno_statueruins_orangegem.tex")


AddRecipe("kyno_statueruins_yellowgem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("yellowgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_yellowgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_yellowgem.xml", "kyno_statueruins_yellowgem.tex")


AddRecipe("kyno_statueruins_greengem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("greengem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_greengem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_greengem.xml", "kyno_statueruins_greengem.tex")


AddRecipe("kyno_statueruins_small_nogem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_nogem.xml", "kyno_statueruins_small_nogem.tex")


AddRecipe("kyno_statueruins_small_bluegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("bluegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_bluegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_bluegem.xml", "kyno_statueruins_small_bluegem.tex")


AddRecipe("kyno_statueruins_small_redgem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("redgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_redgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_redgem.xml", "kyno_statueruins_small_redgem.tex")


AddRecipe("kyno_statueruins_small_purplegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("purplegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_purplegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_purplegem.xml", "kyno_statueruins_small_purplegem.tex")


AddRecipe("kyno_statueruins_small_orangegem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("orangegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_orangegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_orangegem.xml", "kyno_statueruins_small_orangegem.tex")


AddRecipe("kyno_statueruins_small_yellowgem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("yellowgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_yellowgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_yellowgem.xml", "kyno_statueruins_small_yellowgem.tex")


AddRecipe("kyno_statueruins_small_greengem", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2), Ingredient("greengem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_greengem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_greengem.xml", "kyno_statueruins_small_greengem.tex")


AddRecipe("kyno_ruinsnightmarelight", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 3), Ingredient("cutstone", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsnightmarelight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsnightmarelight.xml", "kyno_ruinsnightmarelight.tex")


AddRecipe("kyno_brokenclockwork1", {Ingredient("gears", 2), Ingredient("trinket_6", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork1.xml", "kyno_brokenclockwork1.tex")


AddRecipe("kyno_brokenclockwork2", {Ingredient("gears", 2), Ingredient("trinket_6", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork2.xml", "kyno_brokenclockwork2.tex")


AddRecipe("kyno_brokenclockwork3", {Ingredient("gears", 2), Ingredient("trinket_6", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork3.xml", "kyno_brokenclockwork3.tex")


AddRecipe("kyno_ornatechest", {Ingredient("boards", 3), Ingredient("thulecite", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ornatechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ornatechest.xml", "kyno_ornatechest.tex")


AddRecipe("kyno_ornatechest_large", {Ingredient("boards", 4), Ingredient("thulecite", 6)},
kyno_cavetab, TECH.LOST, "kyno_ornatechest_large_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ornatechest_large.xml", "kyno_ornatechest_large.tex")


AddRecipe("kyno_ancient_altar_broken", {Ingredient("thulecite", 24), Ingredient("purplegem", 2), Ingredient("minotaurhorn", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ancient_altar_broken_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_apss_broken.xml", "kyno_apss_broken.tex")


AddRecipe("kyno_pillar_stalactite", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_stalactite_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_stalactite.xml", "kyno_pillar_stalactite.tex")


AddRecipe("kyno_pillar_cave", {Ingredient("rocks", 10), Ingredient("flint", 10), Ingredient("nitre", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_cave_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_cave.xml", "kyno_pillar_cave.tex")


AddRecipe("kyno_pillar_flintless", {Ingredient("rocks", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_flintless_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_flintless.xml", "kyno_pillar_flintless.tex")


AddRecipe("kyno_pillar_rock", {Ingredient("rocks", 10), Ingredient("flint", 10), Ingredient("nitre", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_rock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_rock.xml", "kyno_pillar_rock.tex")


AddRecipe("kyno_pillar_algae", {Ingredient("cutlichen", 10), Ingredient("slurtleslime", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_algae_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_algae.xml", "kyno_pillar_algae.tex")


AddRecipe("kyno_pillar_ruins", {Ingredient("thulecite_pieces", 10), Ingredient("thulecite", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_ruins.xml", "kyno_pillar_ruins.tex")


AddRecipe("kyno_pillar_atrium", {Ingredient("rocks", 10), Ingredient("nightmarefuel", 10)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_atrium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_atrium.xml", "kyno_pillar_atrium.tex")


AddRecipe("kyno_pillar_atrium_on", {Ingredient("rocks", 10), Ingredient("nightmarefuel", 10), Ingredient("purplegem", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_atrium_on_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_atrium_on.xml", "kyno_pillar_atrium_on.tex")


AddRecipe("kyno_surfacestairs", {Ingredient("rocks", 15)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs.xml", "kyno_surfacestairs.tex")


AddRecipe("kyno_surfacestairs_closed", {Ingredient("rocks", 15)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_closed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs_closed.xml", "kyno_surfacestairs_closed.tex")


AddRecipe("kyno_surfacestairs_vip", {Ingredient("rocks", 15)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_vip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs_vip.xml", "kyno_surfacestairs_vip.tex")


AddRecipe("kyno_lsr_nogem", {Ingredient("cutstone", 3), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lsr_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacyruins_nogem.xml", "kyno_legacyruins_nogem.tex")


AddRecipe("kyno_lsr_small_nogem", {Ingredient("cutstone", 3), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lsr_small_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacyruins_small_nogem.xml", "kyno_legacyruins_small_nogem.tex")


AddRecipe("wall_legacyruins_item", {Ingredient("thulecite", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 6, nil, "images/inventoryimages/kyno_legacyruins_wall.xml", "kyno_legacyruins_wall.tex")


AddRecipe("kyno_shadowchanneler", {Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_shadowchanneler_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shadowhand.xml", "kyno_shadowhand.tex")


AddRecipe("kyno_statueatrium", {Ingredient("thulecite", 3), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueatrium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueatrium.xml", "kyno_statueatrium.tex")


AddRecipe("kyno_atriumrubble1", {Ingredient("cutstone", 1), Ingredient("thulecite_pieces", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumrubble1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumrubble1.xml", "kyno_atriumrubble1.tex")


AddRecipe("kyno_atriumrubble2", {Ingredient("cutstone", 1), Ingredient("thulecite_pieces", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumrubble2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumrubble2.xml", "kyno_atriumrubble2.tex")


AddRecipe("kyno_atriumbeacon", {Ingredient("cutstone", 1), Ingredient("thulecite", 1), Ingredient("nightmarefuel", 5)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumbeacon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumbeacon.xml", "kyno_atriumbeacon.tex")


AddRecipe("kyno_atriumobelisk", {Ingredient("cutstone", 2), Ingredient("thulecite", 3), Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumobelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumobelisk.xml", "kyno_atriumobelisk.tex")


AddRecipe("kyno_atriumfence", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumfence_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumfence.xml", "kyno_atriumfence.tex")


AddRecipe("kyno_atriumgateway_wip", {Ingredient("thulecite", 10), Ingredient("sewing_tape", 3), Ingredient("cutstone", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumgateway_wip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ancientgateway_wip.xml", "kyno_ancientgateway_wip.tex")


AddRecipe("kyno_atriumgateway", {Ingredient("thulecite", 10), Ingredient("nightmarefuel", 10), Ingredient("cutstone", 3)},
kyno_cavetab, TECH.LOST, "kyno_atriumgateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ancientgateway.xml", "kyno_ancientgateway.tex")


AddRecipe("turf_sinkhole", {Ingredient("turf_grass", 2), Ingredient("poop", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_sinkhole.tex")


AddRecipe("turf_underrock", {Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_underrock.tex")


AddRecipe("turf_cave", {Ingredient("guano", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_cave.tex")


AddRecipe("turf_fungus_red", {Ingredient("red_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus_red.tex")


AddRecipe("turf_fungus_green", {Ingredient("green_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus_green.tex")


AddRecipe("turf_fungus", {Ingredient("blue_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus.tex")


AddRecipe("turf_mud", {Ingredient("turf_marsh", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_mud.tex")


AddRecipe("turf_ruinsbrick", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinsbrick.tex")


AddRecipe("turf_ruinsbricktrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinsbricktrim.tex")


AddRecipe("turf_ruinstile", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstile.tex")


AddRecipe("turf_ruinstiletrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstiletrim.tex")


AddRecipe("turf_ruinstrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstrim.tex")


AddRecipe("turf_ruinstrimtrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstrimtrim.tex")


AddRecipe("dug_berrybush", {Ingredient("berries", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush.tex")


AddRecipe("dug_berrybush2", {Ingredient("dug_berrybush", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush2.tex")


AddRecipe("dug_berrybush_juicy", {Ingredient("berries_juicy", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush_juicy.tex")


AddRecipe("dug_grass", {Ingredient("cutgrass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_grass.tex")


AddRecipe("dug_sapling", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_sapling.tex")


AddRecipe("dug_marsh_bush", {Ingredient("dug_sapling", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_marsh_bush.tex")


AddRecipe("kyno_reeds", {Ingredient("cutreeds", 4), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_reeds_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_reeds.xml", "kyno_reeds.tex")


AddRecipe("dug_sapling_moon", {Ingredient("dug_sapling", 1), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_sapling_moon.tex")


AddRecipe("dug_rock_avocado_bush", { avocadoingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_rock_avocado_bush.tex")


AddRecipe("dug_trap_starfish", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_trap_starfish.tex")

-- This shit wasn't working LOL.
AddRecipe("kyno_burntmarsh", {Ingredient("ash", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burntmarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burntmarsh.xml", "kyno_burntmarsh.tex")


AddRecipe("red_mushroom", {Ingredient("red_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_red_mushroom_placer", 0, nil, nil, nil, "images/kyno_redmush.xml", "kyno_redmush.tex")


AddRecipe("green_mushroom", {Ingredient("green_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_green_mushroom_placer", 0, nil, nil, nil, "images/kyno_greenmush.xml", "kyno_greenmush.tex")


AddRecipe("blue_mushroom", {Ingredient("blue_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_blue_mushroom_placer", 0, nil, nil, nil, "images/kyno_bluemush.xml", "kyno_bluemush.tex")


AddRecipe("flower_rose", {Ingredient("petals", 1), Ingredient("stinger", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rose_placer", 0, nil, nil, nil, "images/kyno_rose.xml", "kyno_rose.tex")


AddRecipe("kyno_cactus", {Ingredient("cactus_meat", 2), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cactus.xml", "kyno_cactus.tex")


AddRecipe("kyno_oasis_cactus", {Ingredient("cactus_meat", 2), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_oasis_cactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_oasis_cactus.xml", "kyno_oasis_cactus.tex")


AddRecipe("kyno_tumbleweed", {Ingredient("cutgrass", 2), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tumbleweed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tumbleweed.xml", "kyno_tumbleweed.tex")


AddRecipe("mandrake_planted", {Ingredient("mandrake", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mandrake_planted_placer", 0, nil, nil, nil, "images/kyno_mandrake_planted.xml", "kyno_mandrake_planted.tex")


AddRecipe("carrot_planted", {Ingredient("carrot", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_carrotplanted_placer", 0, nil, nil, nil, "images/kyno_carrot_planted.xml", "kyno_carrot_planted.tex")


AddRecipe("kyno_marsh_plant", {Ingredient("succulent_picked", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_plant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_marshplant.xml", "kyno_marshplant.tex")


AddRecipe("succulent_plant", {Ingredient("succulent_picked", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_succulent_plant_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "succulent_picked.tex")


AddRecipe("kyno_pondrock", {Ingredient("rocks", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedrock.xml", "kyno_scorchedrock.tex")


AddRecipe("kyno_scorchedground", {Ingredient("ash", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedground_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedground.xml", "kyno_scorchedground.tex")


AddRecipe("kyno_burnttree_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree2_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree3_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree4_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree5", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree5.xml", "kyno_burnttree5.tex")


AddRecipe("kyno_stump_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_short.xml", "kyno_stump_short.tex")


AddRecipe("kyno_stump_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_normal.xml", "kyno_stump_normal.tex")


AddRecipe("kyno_stump_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_tall.xml", "kyno_stump_tall.tex")


AddRecipe("kyno_stump2_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_short.xml", "kyno_stump2_short.tex")


AddRecipe("kyno_stump2_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_normal.xml", "kyno_stump2_normal.tex")


AddRecipe("kyno_stump2_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_tall.xml", "kyno_stump2_tall.tex")


AddRecipe("kyno_stump3_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_short.xml", "kyno_stump3_short.tex")


AddRecipe("kyno_stump3_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_normal.xml", "kyno_stump3_normal.tex")


AddRecipe("kyno_stump3_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_tall.xml", "kyno_stump3_tall.tex")


AddRecipe("kyno_stump3_old", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_old_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_old.xml", "kyno_stump3_old.tex")


AddRecipe("kyno_stump4_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_short.xml", "kyno_stump4_short.tex")


AddRecipe("kyno_stump4_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_normal.xml", "kyno_stump4_normal.tex")


AddRecipe("kyno_stump4_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_tall.xml", "kyno_stump4_tall.tex")


AddRecipe("kyno_stump5", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump5.xml", "kyno_stump5.tex")


AddRecipe("lumpy_sapling", {Ingredient("pinecone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lumpy_sapling_placer", 0, nil, nil, nil, "images/kyno_lumpysapling.xml", "kyno_lumpysapling.tex")


AddRecipe("kyno_marsh_tree", {Ingredient("log", 3), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_tree_placer", 0, nil, nil, nil, "images/kyno_marsh_tree.xml", "kyno_marsh_tree.tex")


AddRecipe("rock_petrified_tree_short", {Ingredient("rocks", 1), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_short_placer", 0, nil, nil, nil, "images/kyno_rocktree_short.xml", "kyno_rocktree_short.tex")


AddRecipe("rock_petrified_tree_med", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_placer", 0, nil, nil, nil, "images/kyno_rocktree.xml", "kyno_rocktree.tex")


AddRecipe("rock_petrified_tree_tall", {Ingredient("rocks", 3), Ingredient("nitre", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_tall_placer", 0, nil, nil, nil, "images/kyno_rocktree_tall.xml", "kyno_rocktree_tall.tex")


AddRecipe("rock_petrified_tree_old", {Ingredient("rocks", 2), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_old_placer", 0, nil, nil, nil, "images/kyno_rocktree_old.xml", "kyno_rocktree_old.tex")


AddRecipe("kyno_marbletree_1", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree1_placer", 0, nil, nil, nil, "images/kyno_marbletree1.xml", "kyno_marbletree1.tex")


AddRecipe("kyno_marbletree_2", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree2_placer", 0, nil, nil, nil, "images/kyno_marbletree2.xml", "kyno_marbletree2.tex")


AddRecipe("kyno_marbletree_3", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree3_placer", 0, nil, nil, nil, "images/kyno_marbletree3.xml", "kyno_marbletree3.tex")


AddRecipe("kyno_marbletree_4", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree4_placer", 0, nil, nil, nil, "images/kyno_marbletree4.xml", "kyno_marbletree4.tex")


AddRecipe("kyno_rock_sinkhole", {Ingredient("rocks", 4), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock_sinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholerock.xml", "kyno_sinkholerock.tex")


AddRecipe("kyno_sinkhole", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkhole.xml", "kyno_sinkhole.tex")


AddRecipe("kyno_sinkhole_closed", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_closed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholeclosed.xml", "kyno_sinkholeclosed.tex")


AddRecipe("kyno_sinkhole_vip", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_vip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholevip.xml", "kyno_sinkholevip.tex")


AddRecipe("kyno_cavehole", {Ingredient("rocks", 3), Ingredient("rope", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cavehole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cavehole.xml", "kyno_cavehole.tex")


AddRecipe("kyno_rock1", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock1_placer", 0, nil, nil, nil, "images/kyno_rock1.xml", "kyno_rock1.tex")


AddRecipe("kyno_rock2", {Ingredient("rocks", 3), Ingredient("goldnugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock2_placer", 0, nil, nil, nil, "images/kyno_rock2.xml", "kyno_rock2.tex")


AddRecipe("kyno_rock_flintless", {Ingredient("rocks", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockflintless_placer", 0, nil, nil, nil, "images/kyno_rockflintless.xml", "kyno_rockflintless.tex")


AddRecipe("kyno_rock_ice", {Ingredient("ice", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockice_placer", 0, nil, nil, nil, "images/kyno_rockice.xml", "kyno_rockice.tex")


AddRecipe("kyno_snowhill", { snowfallingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_snowhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "kyno_snowpile.tex")


AddRecipe("kyno_rock_moon", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockmoon_placer", 0, nil, nil, nil, "images/kyno_rockmoon.xml", "kyno_rockmoon.tex")


AddRecipe("kyno_moonshell", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonshell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockmoonshell.xml", "kyno_rockmoonshell.tex")


AddRecipe("kyno_moonglass_rock", {Ingredient("moonglass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonglass_placer", 0, nil, nil, nil, "images/kyno_moonglass.xml", "kyno_moonglass.tex")


AddRecipe("kyno_moonrock_pieces", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonrubble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonrubble.xml", "kyno_moonrubble.tex")


AddRecipe("kyno_hound_gargoyle_1", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound.xml", "kyno_moonhound.tex")


AddRecipe("kyno_hound_gargoyle_2", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound2.xml", "kyno_moonhound2.tex")


AddRecipe("kyno_hound_gargoyle_3", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound3.xml", "kyno_moonhound3.tex")


AddRecipe("kyno_hound_gargoyle_4", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound4.xml", "kyno_moonhound4.tex")


AddRecipe("kyno_werepig_gargoyle_1", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig.xml", "kyno_moonpig.tex")


AddRecipe("kyno_werepig_gargoyle_2", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig2.xml", "kyno_moonpig2.tex")


AddRecipe("kyno_werepig_gargoyle_3", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig3.xml", "kyno_moonpig3.tex")


AddRecipe("kyno_werepig_gargoyle_4", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig4.xml", "kyno_moonpig4.tex")


AddRecipe("kyno_werepig_gargoyle_5", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig5.xml", "kyno_moonpig5.tex")


AddRecipe("kyno_werepig_gargoyle_6", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig6.xml", "kyno_moonpig6.tex")


AddRecipe("kyno_moonbase", {Ingredient("moonrocknugget", 15), Ingredient("nightmarefuel", 10), Ingredient("opalpreciousgem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonbase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonbase.xml", "kyno_moonbase.tex")


AddRecipe("kyno_eyeplant", {Ingredient("plantmeat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_eyeplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_eyeplant.xml", "kyno_eyeplant.tex")


AddRecipe("kyno_contrarregra", {Ingredient("marble", 2), Ingredient("nightmarefuel", 2), Ingredient("turf_carpetfloor", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_contrarregra_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_contrarregra.xml", "kyno_contrarregra.tex")


AddRecipe("kyno_pigtorch", {Ingredient("log", 4), Ingredient("poop", 2), Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigtorch_placer", 0, nil, nil, nil, "images/kyno_pigtorch.xml", "kyno_pigtorch.tex")


AddRecipe("kyno_mermhouse", {Ingredient("boards", 4), Ingredient("rocks", 3), Ingredient("pondfish", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rundown_placer", 0, nil, nil, nil, "images/kyno_rundown.xml", "kyno_rundown.tex")


AddRecipe("kyno_walrus_camp", {Ingredient("cutstone", 3), Ingredient("walrus_tusk", 1), Ingredient("log", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_walrus_camp_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_igloo.xml", "kyno_igloo.tex")


AddRecipe("kyno_rabbithole", {Ingredient("rabbit", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rabbithole_placer", 0, nil, nil, nil, "images/kyno_rabbithole.xml", "kyno_rabbithole.tex")


AddRecipe("kyno_catcoonden", {Ingredient("log", 4), Ingredient("silk", 2), Ingredient("coontail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hollowstump_placer", 0, nil, nil, nil, "images/kyno_hollowstump.xml", "kyno_hollowstump.tex")


AddRecipe("kyno_poisontree", {Ingredient("livinglog", 3), Ingredient("nightmarefuel", 3), Ingredient("acorn", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_poisontree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_poisontree.xml", "kyno_poisontree.tex")


AddRecipe("kyno_houndmound", {Ingredient("houndstooth", 4), Ingredient("boneshard", 2), Ingredient("monstermeat", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndmound_placer", 0, nil, nil, nil, "images/kyno_houndmound.xml", "kyno_houndmound.tex")


AddRecipe("kyno_tallbirdnest", {Ingredient("tallbirdegg", 1), Ingredient("cutgrass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tallbirdnest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tallbirdnest.xml", "kyno_tallbirdnest.tex")


AddRecipe("kyno_beehive", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_beehive_placer", 0, nil, nil, nil, "images/kyno_beehive.xml", "kyno_beehive.tex")


AddRecipe("kyno_wasphive", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wasphive_placer", 0, nil, nil, nil, "images/kyno_wasphive.xml", "kyno_wasphive.tex")


AddRecipe("kyno_moose_nesting_ground", {Ingredient("twigs", 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_nestground_placer", 0, nil, nil, nil, "images/kyno_nestground.xml", "kyno_nestground.tex")


AddRecipe("kyno_goosenest", {Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_goosenest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_goosenest.xml", "kyno_goosenest.tex")


AddRecipe("kyno_goosenestegg", {Ingredient("bird_egg", 10), Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
kyno_surfacetab, TECH.LOST, "kyno_goosenestegg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_goosenestegg.xml", "kyno_goosenestegg.tex")


AddRecipe("kyno_honeypatch", {Ingredient("honey", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_honeypatch_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_honeypatch.xml", "kyno_honeypatch.tex")


AddRecipe("kyno_giantbeehive_small", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivesmall.xml", "kyno_beehivesmall.tex")


AddRecipe("kyno_giantbeehive_medium", {Ingredient("honey", 6), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_medium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivemedium.xml", "kyno_beehivemedium.tex")


AddRecipe("kyno_giantbeehive", {Ingredient("honey", 10), Ingredient("honeycomb", 1), Ingredient("hivehat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivelarge.xml", "kyno_beehivelarge.tex")


AddRecipe("kyno_klausbag", {Ingredient("deer_antler1", 1), Ingredient("silk", 6), Ingredient("charcoal", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_klausbag.xml", "kyno_klausbag.tex")


AddRecipe("kyno_klausbag_winter", {Ingredient("deer_antler3", 1), Ingredient("silk", 6), Ingredient("charcoal", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_klausbag_winter.xml", "kyno_klausbag_winter.tex")


AddRecipe("kyno_icegeyser", {Ingredient("ice", 4), Ingredient("bluegem", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_icegeyser_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_icegeyser.xml", "kyno_icegeyser.tex")


AddRecipe("kyno_magmafield", {Ingredient("torch", 2), Ingredient("redgem", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_magmafield_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmafield.xml", "kyno_magmafield.tex")


AddRecipe("kyno_molehill", {Ingredient("mole", 1), Ingredient("nitre", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_molehill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_molehill.xml", "kyno_molehill.tex")


AddRecipe("kyno_moonspiderden", {Ingredient("spidereggsack", 1), Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonspiderden_placer", 0, nil, nil, nil, "images/kyno_moonspiderden.xml", "kyno_moonspiderden.tex")


AddRecipe("kyno_statueglommer", {Ingredient("glommerwings", 1), Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueglommer_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_glommerstatue.xml", "kyno_glommerstatue.tex")


AddRecipe("kyno_statuemaxwell", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuemaxwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemaxwell.xml", "kyno_statuemaxwell.tex")


AddRecipe("statueharp", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueharp_placer", 0, nil, nil, nil, "images/kyno_statueharp.xml", "kyno_statueharp.tex")


AddRecipe("kyno_statueangel", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueangel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueangel.xml", "kyno_statueangel.tex")


AddRecipe("marblepillar", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marblepillar_placer", 0, nil, nil, nil, "images/kyno_marblepillar.xml", "kyno_marblepillar.tex")


AddRecipe("kyno_statue_marble_muse", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_muse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble1.xml", "kyno_statuemarble1.tex")


AddRecipe("kyno_statue_marble", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble2.xml", "kyno_statuemarble2.tex")


AddRecipe("kyno_statue_marble_urn", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble3.xml", "kyno_statuemarble3.tex")


AddRecipe("kyno_statue_marble_pawn", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_pawn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble4.xml", "kyno_statuemarble4.tex")


AddRecipe("kyno_statuerook", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuerook.xml", "kyno_statuerook.tex")


AddRecipe("kyno_statueknight", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueknight.xml", "kyno_statueknight.tex")


AddRecipe("kyno_statuebishop", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuebishop.xml", "kyno_statuebishop.tex")


AddRecipe("kyno_statuerook_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuerook_fixed.xml", "kyno_statuerook_fixed.tex")


AddRecipe("kyno_statueknight_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueknight_fixed.xml", "kyno_statueknight_fixed.tex")


AddRecipe("kyno_statuebishop_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuebishop_fixed.xml", "kyno_statuebishop_fixed.tex")


AddRecipe("kyno_sculpture_rooknose", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rooknose_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_rooknose.tex")


AddRecipe("kyno_sculpture_knighthead", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_knighthead_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_knighthead.tex")


AddRecipe("kyno_sculpture_bishophead", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bishophead_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_bishophead.tex")


AddRecipe("statuemarblebroodling", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblebroodling_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblebroodling.xml", "statuemarblebroodling.tex")

	
AddRecipe("statuemarblevargling", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblevargling_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblevargling.xml", "statuemarblevargling.tex")

	
AddRecipe("statuemarblekittykit", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblekittykit_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblekittykit.xml", "statuemarblekittykit.tex")

	
AddRecipe("statuemarblegiblet", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblegiblet_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblegiblet.xml", "statuemarblegiblet.tex")

	
AddRecipe("statuemarbleewelet", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarbleewelet_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarbleewelet.xml", "statuemarbleewelet.tex")

	
AddRecipe("statuemarblehutch", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblehutch_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblehutch.xml", "statuemarblehutch.tex")

	
AddRecipe("statuemarblechester", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblechester_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblechester.xml", "statuemarblechester.tex")

	
AddRecipe("statuemarbleglomglom", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarbleglomglom_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarbleglomglom.xml", "statuemarbleglomglom.tex")


AddRecipe("statuestonebroodling", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonebroodling_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonebroodling.xml", "statuestonebroodling.tex")


AddRecipe("statuestonevargling", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonevargling_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonevargling.xml", "statuestonevargling.tex")
	

AddRecipe("statuestonekittykit", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonekittykit_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonekittykit.xml", "statuestonekittykit.tex")
	
	
AddRecipe("statuestonegiblet", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonegiblet_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonegiblet.xml", "statuestonegiblet.tex")
	
	
AddRecipe("statuestoneewelet", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestoneewelet_placer", 0, nil, nil, nil, "images/inventoryimages/statuestoneewelet.xml", "statuestoneewelet.tex")
	
	
AddRecipe("statuestonehutch", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonehutch_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonehutch.xml", "statuestonehutch.tex")
	
	
AddRecipe("statuestonechester", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonechester_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonechester.xml", "statuestonechester.tex")

	
AddRecipe("statuestoneglomglom", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestoneglomglom_placer", 0, nil, nil, nil, "images/inventoryimages/statuestoneglomglom.xml", "statuestoneglomglom.tex")

	
AddRecipe("kyno_antlion", {Ingredient("townportaltalisman", 6), Ingredient("meat", 4), Ingredient("antliontrinket", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_antlion_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antlion.xml", "kyno_antlion.tex")


AddRecipe("kyno_talisman", {Ingredient("townportaltalisman", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_talisman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_talisman.xml", "kyno_talisman.tex")


AddRecipe("kyno_sandspike_small", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_small.xml", "kyno_sandspike_small.tex")


AddRecipe("kyno_sandspike_med", {Ingredient("turf_desertdirt", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_med_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_med.xml", "kyno_sandspike_med.tex")


AddRecipe("kyno_sandspike_tall", {Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_tall.xml", "kyno_sandspike_tall.tex")


AddRecipe("kyno_sandblock", {Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandblock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandblock.xml", "kyno_sandblock.tex")


AddRecipe("glassspike_short", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_short.xml", "kyno_glassspike_short.tex")


AddRecipe("glassspike_med", {Ingredient("turf_desertdirt", 3), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_med.xml", "kyno_glassspike_med.tex")


AddRecipe("glassspike_tall", {Ingredient("turf_desertdirt", 4), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_tall.xml", "kyno_glassspike_tall.tex")


AddRecipe("glassblock", {Ingredient("turf_desertdirt", 4), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassblock.xml", "kyno_glassblock.tex")


AddRecipe("kyno_antlionsinkhole", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_antlionsinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antlionsinkhole.xml", "kyno_antlionsinkhole.tex")


AddRecipe("kyno_altar_glass", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_glass_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_glass.tex")


AddRecipe("kyno_altar_idol", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_idol_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_idol.tex")


AddRecipe("kyno_altar_seed", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_seed_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_seed.tex")


AddRecipe("kyno_altar_crown", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_crown_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_crown.tex")


AddRecipe("kyno_invitingformation1", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation1.xml", "kyno_invitingformation1.tex")


AddRecipe("kyno_invitingformation2", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation2.xml", "kyno_invitingformation2.tex")


AddRecipe("kyno_invitingformation3", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation3.xml", "kyno_invitingformation3.tex")


AddRecipe("kyno_obelisk", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_obelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obelisk.xml", "kyno_obelisk.tex")


AddRecipe("kyno_sanityrock", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sanityrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obelisksanity.xml", "kyno_obelisksanity.tex")


AddRecipe("kyno_insanityrock", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_insanityrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obeliskinsanity.xml", "kyno_obeliskinsanity.tex")


AddRecipe("kyno_pigking", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigking.xml", "kyno_pigking.tex")


AddRecipe("kyno_pigking_elite", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_elite_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigking_elite.xml", "kyno_pigking_elite.tex")


AddRecipe("kyno_critterlab", {Ingredient("rocks", 6), Ingredient("cutgrass", 6), Ingredient("seeds", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_critterlab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockden.xml", "kyno_rockden.tex")


AddRecipe("kyno_pighead", {Ingredient("twigs", 2), Ingredient("pigskin", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pighead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pighead.xml", "kyno_pighead.tex")


AddRecipe("kyno_mermhead", {Ingredient("twigs", 2), Ingredient("pondfish", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mermhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mermhead.xml", "kyno_mermhead.tex")

-- This one is from authority of JustJasper. I need to ask him if I can use this!!!
AddRecipe("kyno_bunnyhead", {Ingredient("twigs", 2), Ingredient("manrabbit_tail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bunnyhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bunnyhead.xml", "kyno_bunnyhead.tex")


AddRecipe("kyno_wigfridhead", {Ingredient("twigs", 2), Ingredient("wathgrithrhat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wigfridhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wigfridhead.xml", "kyno_wigfridhead.tex")


AddRecipe("kyno_garden_handcar", {Ingredient("cutstone", 2), Ingredient("turf_grass", 2), Ingredient("boards", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_handcar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_handcar.xml", "kyno_garden_handcar.tex")


AddRecipe("kyno_garden_spray", {Ingredient("lifeinjector", 1), Ingredient("poop", 3), Ingredient("seeds", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_spray_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_spray.xml", "kyno_garden_spray.tex")


AddRecipe("kyno_garden_blank", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_blank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_blank.xml", "kyno_garden_blank.tex")


AddRecipe("kyno_garden_sunflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("petals", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_sunflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_sunflower.xml", "kyno_garden_sunflower.tex")


AddRecipe("kyno_garden_doublesunflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("petals", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_doublesunflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_doublesunflower.xml", "kyno_garden_doublesunflower.tex")


AddRecipe("kyno_garden_greenie", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("corn", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_greenie_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_greenie.xml", "kyno_garden_greenie.tex")


AddRecipe("kyno_garden_frozen", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("ice", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_frozen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_frozen.xml", "kyno_garden_frozen.tex")


AddRecipe("kyno_garden_dragon", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("dragonfruit", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_dragon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_dragon.xml", "kyno_garden_dragon.tex")


AddRecipe("kyno_garden_potato", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), potatoingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_potato_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_potato.xml", "kyno_garden_potato.tex")


AddRecipe("kyno_garden_whiteflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("petals", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_whiteflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_whiteflower.xml", "kyno_garden_whiteflower.tex")


AddRecipe("kyno_garden_pepper", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("pepper", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_pepper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_pepper.xml", "kyno_garden_pepper.tex")


AddRecipe("kyno_garden_greenflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 2), Ingredient("succulent_picked", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_greenflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_greenflower.xml", "kyno_garden_greenflower.tex")


AddRecipe("kyno_pottedredmushroom", {Ingredient("red_cap", 5), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedredmushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedredmushroom.xml", "kyno_pottedredmushroom.tex")


AddRecipe("kyno_pottedgreenmushroom", {Ingredient("green_cap", 5), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedgreenmushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedgreenmushroom.xml", "kyno_pottedgreenmushroom.tex")


AddRecipe("kyno_pottedbluemushroom", {Ingredient("blue_cap", 5), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedbluemushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedbluemushroom.xml", "kyno_pottedbluemushroom.tex")


AddRecipe("kyno_pottedflower", {Ingredient("petals", 5), Ingredient("slurtle_shellpieces", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedflower.xml", "kyno_pottedflower.tex")


AddRecipe("kyno_pottedevilflower", {Ingredient("petals_evil", 5), Ingredient("slurtle_shellpieces", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedevilflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedevilflower.xml", "kyno_pottedevilflower.tex")


AddRecipe("kyno_pottedrose", {Ingredient("petals", 5), Ingredient("stinger", 1), Ingredient("marble", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedrose_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedrose.xml", "kyno_pottedrose.tex")


AddRecipe("kyno_pottedcactus", {Ingredient("cactus_meat", 5), Ingredient("stinger", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedcactus.xml", "kyno_pottedcactus.tex")


AddRecipe("kyno_p_farmrock", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrock.xml", "kyno_p_farmrock.tex")


AddRecipe("kyno_p_farmrocktall", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrocktall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrocktall.xml", "kyno_p_farmrocktall.tex")


AddRecipe("kyno_p_farmrockflat", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrockflat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrockflat.xml", "kyno_p_farmrockflat.tex")


AddRecipe("kyno_p_stick", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stick.xml", "kyno_p_stick.tex")


AddRecipe("kyno_p_stickleft", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stickleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stickleft.xml", "kyno_p_stickleft.tex")


AddRecipe("kyno_p_stickright", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stickright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stickright.xml", "kyno_p_stickright.tex")


AddRecipe("kyno_p_signleft", {Ingredient("minisign_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_signleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_signleft.xml", "kyno_p_signleft.tex")


AddRecipe("kyno_p_signright", {Ingredient("minisign_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_signright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_signright.xml", "kyno_p_signright.tex")


AddRecipe("kyno_p_fencepost", {Ingredient("fence_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_fencepost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_fencepost.xml", "kyno_p_fencepost.tex")


AddRecipe("kyno_p_fencepostright", {Ingredient("fence_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_fencepostright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_fencepostright.xml", "kyno_p_fencepostright.tex")


AddRecipe("kyno_p_burntstick", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstick.xml", "kyno_p_burntstick.tex")


AddRecipe("kyno_p_burntstickleft", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstickleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstickleft.xml", "kyno_p_burntstickleft.tex")


AddRecipe("kyno_p_burntstickright", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstickright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstickright.xml", "kyno_p_burntstickright.tex")


AddRecipe("kyno_p_burntfencepost", {Ingredient("fence_item", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntfencepost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntfencepost.xml", "kyno_p_burntfencepost.tex")


AddRecipe("kyno_p_burntfencepostright", {Ingredient("fence_item", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntfencepostright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntfencepostright.xml", "kyno_p_burntfencepostright.tex")


AddRecipe("kyno_touchstone", {Ingredient("rocks", 10), Ingredient("marble", 10), Ingredient("nightmarefuel", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_touchstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_touchstone.xml", "kyno_touchstone.tex")


AddRecipe("kyno_portalstone", {Ingredient("cutstone", 4), Ingredient("nightmarefuel", 10), Ingredient("petals", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_floridpostern.xml", "kyno_floridpostern.tex")


AddRecipe("kyno_portalbuilding", {Ingredient("multiplayer_portal_moonrock_constr_plans", 1), Ingredient("nightmarefuel", 10), Ingredient("petals", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalbuilding_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_portalbuilding.xml", "kyno_portalbuilding.tex")


AddRecipe("kyno_celestialportal", {Ingredient("purplemooneye", 1), Ingredient("nightmarefuel", 10), Ingredient("moonrocknugget", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_celestialportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_celestialportal.xml", "kyno_celestialportal.tex")


AddRecipe("kyno_lake", {Ingredient("ice", 16), Ingredient("pondfish", 4), Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lake_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lake.xml", "kyno_lake.tex")


AddRecipe("kyno_pond", {Ingredient("ice", 8), Ingredient("pondfish", 2), Ingredient("froglegs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pond_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pond.xml", "kyno_pond.tex")


AddRecipe("kyno_pondmarsh", {Ingredient("ice", 8), Ingredient("pondfish", 2), Ingredient("mosquito", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondmarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondmarsh.xml", "kyno_pondmarsh.tex")


AddRecipe("kyno_pondlava", {Ingredient("ice", 8), Ingredient("redgem", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondlava_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondmagma.xml", "kyno_pondmagma.tex")


AddRecipe("kyno_hotspring", {Ingredient("moonglass", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hotspring_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hotspring.xml", "kyno_hotspring.tex")


AddRecipe("kyno_basalt1", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt1.xml", "kyno_basalt1.tex")


AddRecipe("kyno_basalt2", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt2.xml", "kyno_basalt2.tex")


AddRecipe("kyno_basalt4", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt4.xml", "kyno_basalt4.tex")


AddRecipe("kyno_basalt3", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt3.xml", "kyno_basalt3.tex")


AddRecipe("kyno_driftwood_small1", {Ingredient("driftwood_log", 1), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood1_placer", 0, nil, nil, nil, "images/kyno_driftwood1.xml", "kyno_driftwood1.tex")


AddRecipe("kyno_driftwood_small2", {Ingredient("driftwood_log", 1), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood2_placer", 0, nil, nil, nil, "images/kyno_driftwood2.xml", "kyno_driftwood2.tex")


AddRecipe("kyno_driftwood_tall", {Ingredient("driftwood_log", 2), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood3_placer", 0, nil, nil, nil, "images/kyno_driftwood3.xml", "kyno_driftwood3.tex")


AddRecipe("kyno_houndbone", {Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndbone_placer", 0, nil, nil, nil, "images/kyno_bones.xml", "kyno_bones.tex")


AddRecipe("kyno_bonemound", {Ingredient("boneshard", 2), Ingredient("houndstooth", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bonemound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bonemound.xml", "kyno_bonemound.tex")


AddRecipe("kyno_dead_sea_bones", {Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_seabones_placer", 0, nil, nil, nil, "images/kyno_seabones.xml", "kyno_seabones.tex")


AddRecipe("kyno_skeleton", {Ingredient("boneshard", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_skeleton_placer", 0, nil, nil, nil, "images/kyno_skeleton.xml", "kyno_skeleton.tex")


AddRecipe("kyno_scorchedskeleton", {Ingredient("boneshard", 3), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedskeleton_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crispyskeleton.xml", "kyno_crispyskeleton.tex")


AddRecipe("kyno_mound", {Ingredient("boneshard", 3), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 20)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mound.xml", "kyno_mound.tex")


AddRecipe("kyno_gravestone1", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone1.xml", "kyno_gravestone1.tex")


AddRecipe("kyno_gravestone2", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone2.xml", "kyno_gravestone2.tex")


AddRecipe("kyno_gravestone3", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone3.xml", "kyno_gravestone3.tex")


AddRecipe("kyno_gravestone4", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone4.xml", "kyno_gravestone4.tex")


AddRecipe("kyno_wormhole", {Ingredient("houndstooth", 3), Ingredient("meat", 3), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wormhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormhole.xml", "kyno_wormhole.tex")


AddRecipe("kyno_wormhole_sick", {Ingredient("houndstooth", 3), Ingredient("monstermeat", 3), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wormhole_sick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormhole_sick.xml", "kyno_wormhole_sick.tex")


AddRecipe("kyno_sunkenchest", {Ingredient("goldnugget", 4), Ingredient("slurtle_shellpieces", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_sunkenchest.xml", "kyno_sunkenchest.tex")


AddRecipe("shell_cluster", { shell1ingredient, shell2ingredient, shell3ingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_shellcluster.xml", "kyno_shellcluster.tex")


AddRecipe("oceanfishableflotsam", {Ingredient("poop", 3), Ingredient("cutgrass", 3), Ingredient("kelp", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_oceandebris_placer", 0, nil, nil, nil, "images/kyno_oceandebris.xml", "kyno_oceandebris.tex")


AddRecipe("kyno_moonfissure", {Ingredient("moonrocknugget", 8), Ingredient("nightmarefuel", 8), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 100)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonfissure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonfissure.xml", "kyno_moonfissure.tex")


AddRecipe("kyno_moonfissure_plugged", {Ingredient("moonrocknugget", 4), Ingredient("slurtle_shellpieces", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonfissure_plugged_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonfissure_plugged.xml", "kyno_moonfissure_plugged.tex")


AddRecipe("kyno_meatrack_hermit", {Ingredient("twigs", 3), Ingredient("moon_tree_blossom", 2), Ingredient("rope", 3)},
kyno_surfacetab, TECH.LOST, "kyno_meatrack_hermit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_meatrack_hermit.xml", "kyno_meatrack_hermit.tex")


AddRecipe("kyno_beebox_hermit", {Ingredient("moon_tree_blossom", 4), Ingredient("honeycomb", 1), Ingredient("bee", 4)},
kyno_surfacetab, TECH.LOST, "kyno_beebox_hermit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beebox_hermit.xml", "kyno_beebox_hermit.tex")


AddRecipe("kyno_hermithouse1", {Ingredient("rocks", 10), Ingredient("log", 5), Ingredient("slurtle_shellpieces", 5)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse1.xml", "kyno_hermithouse1.tex")


AddRecipe("kyno_hermithouse2", {Ingredient("cookiecuttershell", 10), Ingredient("boards", 10)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse2.xml", "kyno_hermithouse2.tex")


AddRecipe("kyno_hermithouse3", {Ingredient("marble", 10), Ingredient("rope", 10)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse3.xml", "kyno_hermithouse3.tex")


AddRecipe("kyno_hermithouse4", {Ingredient("moonrocknugget", 5), Ingredient("cactus_flower", 10)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse4.xml", "kyno_hermithouse4.tex")


AddRecipe("kyno_propsign_structure", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_propsign_structure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_propsign.xml", "kyno_propsign.tex")


AddRecipe("kyno_gingerbreadhouse1", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse1.xml", "kyno_gingerbreadhouse1.tex")


AddRecipe("kyno_gingerbreadhouse2", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse2.xml", "kyno_gingerbreadhouse2.tex")


AddRecipe("kyno_gingerbreadhouse3", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse3.xml", "kyno_gingerbreadhouse3.tex")


AddRecipe("kyno_gingerbreadhouse4", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse4.xml", "kyno_gingerbreadhouse4.tex")


AddRecipe("kyno_clayhound", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_clayhound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_clayhound.xml", "kyno_clayhound.tex")


AddRecipe("kyno_claywarg", {Ingredient("cutstone", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_claywarg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_claywarg.xml", "kyno_claywarg.tex")


AddRecipe("kyno_silktent", {Ingredient("silk", 8), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_silktent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_silktent.xml", "kyno_silktent.tex")


AddRecipe("kyno_furtent", {Ingredient("beefalowool", 8), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_furtent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_furtent.xml", "kyno_furtent.tex")


AddRecipe("kyno_tikitent", {Ingredient("manrabbit_tail", 6), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tikitent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tikitent.xml", "kyno_tikitent.tex")


AddRecipe("kyno_tentacletent", {Ingredient("tentaclespots", 4), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tentacletent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tentacletent.xml", "kyno_tentacletent.tex")


AddRecipe("kyno_friendomatic", {Ingredient("boards", 4), Ingredient("nightmarefuel", 4), Ingredient("rocks", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_friendomatic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_friendomatic.xml", "kyno_friendomatic.tex")


AddRecipe("kyno_accomplishment_shrine", {Ingredient("goldnugget", 10), Ingredient("cutstone", 1), Ingredient("gears", 6)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_accomplishment_shrine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "accomplishment_shrine.tex")


AddRecipe("kyno_teleporter_rog", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("gears", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teleporter_rog_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatorog.xml", "kyno_potatorog.tex")


AddRecipe("kyno_teleporter_adventure", {Ingredient("boards", 2), Ingredient("nightmarefuel", 4), Ingredient("gears", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teleporter_adventure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatoadventure.xml", "kyno_potatoadventure.tex")


AddRecipe("kyno_skullchest", {Ingredient("boards", 3), Ingredient("boneshard", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_skullchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_skullchest.xml", "kyno_skullchest.tex")


AddRecipe("kyno_sunkboat", {Ingredient("boards", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sunkboat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sunkboat.xml", "kyno_sunkboat.tex")


AddRecipe("kyno_sunkboat2", {Ingredient("boards", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sunkboat2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sunkboat2.xml", "kyno_sunkboat2.tex")


AddRecipe("kyno_white_moonrock", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_white_moonrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_whitemoonrock.xml", "kyno_whitemoonrock.tex")


AddRecipe("wall_legacy_moonrock_item", {Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_legacywall.xml", "kyno_legacywall.tex")


AddRecipe("wall_reed_item", {Ingredient("cutreeds", 4), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_wall_reed.xml", "wall_reed_item.tex")


AddRecipe("wall_bone_item", {Ingredient("boneshard", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_bone_item.xml", "wall_bone_item.tex")


AddRecipe("wall_living_item", {Ingredient("wall_stone_item", 2), Ingredient("tentaclespots", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_living_item.xml", "wall_living_item.tex")


AddRecipe("wall_mud_item", {Ingredient("wall_hay_item", 2), Ingredient("poop", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_mud_item.xml", "wall_mud_item.tex")


AddRecipe("kyno_juryriggedportal", {Ingredient("cutstone", 3), Ingredient("boards", 3), Ingredient("nightmarefuel", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_juryriggedportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_juryrigged.xml", "kyno_juryrigged.tex")


AddRecipe("kyno_shopkeeper1", {Ingredient("umbrella", 1), Ingredient("trunkvest_summer", 1), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_shopkeeper1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shopkeeper1.xml", "kyno_shopkeeper1.tex")


AddRecipe("kyno_shopkeeper2", {Ingredient("boards", 1), Ingredient("reflectivevest", 1), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_shopkeeper2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shopkeeper2.xml", "kyno_shopkeeper2.tex")


AddRecipe("kyno_bonfire", {Ingredient("log", 3), Ingredient("cutgrass", 3), Ingredient("charcoal", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bonfire_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bonfire.xml", "kyno_bonfire.tex")


AddRecipe("kyno_unbuilthouse", {Ingredient("boards", 2), Ingredient("cutstone", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_unbuilthouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_unbuilt.xml", "kyno_unbuilt.tex")


AddRecipe("kyno_snowman", {Ingredient("ice", 6), Ingredient("carrot", 1), Ingredient("tophat", 1)},
kyno_surfacetab, TECH.LOST, "kyno_snowman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_snowman.xml", "kyno_snowman.tex")


AddRecipe("kyno_bucket", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bucket_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bucket.xml", "kyno_bucket.tex")


AddRecipe("kyno_bags", {Ingredient("rope", 2), Ingredient("cutgrass", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bags_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bag.xml", "kyno_bag.tex")


AddRecipe("kyno_scarecrow", {Ingredient("strawhat", 1), Ingredient("cutgrass", 3), Ingredient("twigs", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scarecrow_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scarecrow.xml", "kyno_scarecrow.tex")


AddRecipe("kyno_minitree", {Ingredient("log", 3), Ingredient("cutgrass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_minitree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_minitree.xml", "kyno_minitree.tex")


AddRecipe("kyno_legacymarsh", {Ingredient("dug_grass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_legacymarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacymarsh.xml", "kyno_legacymarsh.tex")


AddRecipe("kyno_treeclump", {Ingredient("log", 10), Ingredient("pinecone", 5)},
kyno_surfacetab, TECH.LOST, "kyno_treeclump_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treeclump.xml", "kyno_treeclump.tex")


AddRecipe("kyno_bbq", {Ingredient("log", 2), Ingredient("rocks", 12), Ingredient("meat", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bbq_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bbq.xml", "kyno_bbq.tex")


AddRecipe("kyno_teslapost", {Ingredient("lantern", 1), Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teslapost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_teslapost.xml", "kyno_teslapost.tex")


-- AddRecipe("kyno_compromisingstatue", {Ingredient(GLOBAL.CHARACTER_INGREDIENT.HEALTH, 40), Ingredient("cutstone", 2), Ingredient("twigs", 2)},
-- kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_compromisingstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_compromisingstatue.xml", "kyno_compromisingstatue.tex")


AddRecipe("kyno_truffles", {Ingredient("blue_cap", 2), Ingredient("green_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_truffles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_truffles.xml", "kyno_truffles.tex")


AddRecipe("kyno_biigfoot_footprint", {Ingredient("turf_mud", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_biigfoot_footprint_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_biigfoot_footprint.xml", "kyno_biigfoot_footprint.tex")


AddRecipe("kyno_biigfoot", {Ingredient("meat", 20), Ingredient("dragon_scales", 2), Ingredient("boneshard", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_biigfoot_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_biigfoot.xml", "kyno_biigfoot.tex")


AddRecipe("kyno_waxwelldoor", {Ingredient("boards", 3), Ingredient("cutstone", 3), Ingredient("gears", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelldoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelldoor.xml", "kyno_waxwelldoor.tex")


AddRecipe("kyno_trap_teeth_maxwell", {Ingredient("marble", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_trap_teeth_maxwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trapteeth.xml", "kyno_trapteeth.tex")


AddRecipe("kyno_gramaphone", {Ingredient("goldnugget", 5), Ingredient("nightmarefuel", 5), Ingredient("gears", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gramaphone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gramaphone.xml", "kyno_gramaphone.tex")


AddRecipe("kyno_waxwelltorch", {Ingredient("marble", 4), Ingredient("charcoal", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelltorch_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelltorch.xml", "kyno_waxwelltorch.tex")


AddRecipe("kyno_adventurelock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_adventurelock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_adventurelock.xml", "kyno_adventurelock.tex")


AddRecipe("kyno_waxwelllock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 5), Ingredient("silk", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelllock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelllock.xml", "kyno_waxwelllock.tex")


AddRecipe("kyno_nightmarethrone", {Ingredient("nightmarefuel", 20), Ingredient(GLOBAL.CHARACTER_INGREDIENT.HEALTH, 50)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_nightmarethrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarethrone.xml", "kyno_nightmarethrone.tex")


AddRecipe("kyno_maxwellthrone", {Ingredient("nightmarefuel", 20), Ingredient("meat", 4), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_maxwellthrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_maxwellthrone.xml", "kyno_maxwellthrone.tex")


AddRecipe("kyno_shadowportal", {Ingredient("livinglog", 4), Ingredient("nightmarefuel", 4), Ingredient("purplegem", 1)},
kyno_surfacetab, TECH.LOST, "kyno_shadowportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shadowportal.xml", "kyno_shadowportal.tex")


AddRecipe("kyno_truesaltlick", {Ingredient("boards", 2), Ingredient("saltrock", 4)},
RECIPETABS.TOOLS, TECH.SCIENCE_TWO, "kyno_truesaltlick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_salt_lick.xml", "kyno_salt_lick.tex")


AddRecipe("turf_grass", {Ingredient("cutgrass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_grass.tex")


AddRecipe("turf_forest", {Ingredient("pinecone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_forest.tex")


AddRecipe("turf_deciduous", {Ingredient("red_cap", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_deciduous.tex")


AddRecipe("turf_savanna", {Ingredient("cutgrass", 2), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_savanna.tex")


AddRecipe("turf_desertdirt", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_desertdirt.tex")


AddRecipe("turf_rocky", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_rocky.tex")


AddRecipe("turf_pebblebeach", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages2.xml", "turf_pebblebeach.tex")


AddRecipe("turf_redcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("red_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_redcarpet.tex")


AddRecipe("turf_pinkcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("spidergland", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_pinkcarpet.tex")


AddRecipe("turf_orangecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("carrot", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_orangecarpet.tex")


AddRecipe("turf_cyancarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_cyancarpet.tex")


AddRecipe("turf_whitecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("saltrock", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_whitecarpet.tex")


AddRecipe("turf_snowfall", {Ingredient("ice", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_snowfall.tex")


AddRecipe("turf_modern_cobblestones", {Ingredient("turf_road", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_modern_cobblestones.tex")


AddRecipe("turf_sticky", {Ingredient("honey", 2), Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/turf_sticky.xml", "turf_sticky.tex")


AddRecipe("kyno_magmagolem", {Ingredient("rocks", 4), Ingredient("redgem", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_magmagolem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmagolem.xml", "kyno_magmagolem.tex")


AddRecipe("kyno_shieldstandard", {Ingredient("boards", 1), Ingredient("purplegem", 1), Ingredient("houndstooth", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_shieldstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_purplestandard.xml", "kyno_purplestandard.tex")


AddRecipe("kyno_attackstandard", {Ingredient("boards", 1), Ingredient("redgem", 1), Ingredient("boneshard", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_attackstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_redstandard.xml", "kyno_redstandard.tex")


AddRecipe("kyno_healstandard", {Ingredient("boards", 1), Ingredient("bluegem", 1), Ingredient("petals", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bluestandard.xml", "kyno_bluestandard.tex")


AddRecipe("kyno_bannerstandard", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner1.xml", "kyno_banner1.tex")


AddRecipe("kyno_bannerstandard_2", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner2.xml", "kyno_banner2.tex")


AddRecipe("kyno_bannerstandard_3", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner3.xml", "kyno_banner3.tex")


AddRecipe("kyno_lavaspawner", {Ingredient("cutstone", 1), Ingredient("redgem", 1), Ingredient("boneshard", 3)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavaspawner_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavaspawner.xml", "kyno_lavaspawner.tex")


AddRecipe("kyno_lavagateway", {Ingredient("cutstone", 2), Ingredient("redgem", 2), Ingredient("nightmarefuel", 4)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavagateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavagateway.xml", "kyno_lavagateway.tex")


AddRecipe("kyno_anchorgateway", {Ingredient("cutstone", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_anchorgateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_anchorgateway.xml", "kyno_anchorgateway.tex")


AddRecipe("kyno_moltenfence_item", {Ingredient("fence_item", 4), Ingredient("boneshard", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_moltenfence.xml", "kyno_moltenfence.tex")


AddRecipe("kyno_lavahole", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavahole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavahole.xml", "kyno_lavahole.tex")


AddRecipe("kyno_healflower", {Ingredient("petals", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_healblossom.xml", "kyno_healblossom.tex")


AddRecipe("kyno_artificial_healflower", {Ingredient("petals", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_artificial_healflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_healblossom2.xml", "kyno_healblossom2.tex")


AddRecipe("turf_forgerock", {Ingredient("turf_rocky", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgerock.tex")


AddRecipe("turf_forgeroad", {Ingredient("turf_road", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgeroad.tex")


AddRecipe("kyno_queenaltar", {Ingredient("cutstone", 4), Ingredient("redgem", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_queenaltar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_queenaltar.xml", "kyno_queenaltar.tex")


AddRecipe("kyno_beaststatue", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1.xml", "kyno_beaststatue1.tex")


-- AddRecipe("kyno_beaststatue_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1_left.xml", "kyno_beaststatue1_left.tex")


AddRecipe("kyno_beaststatue2", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2.xml", "kyno_beaststatue2.tex")


-- AddRecipe("kyno_beaststatue2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2_left.xml", "kyno_beaststatue2_left.tex")


AddRecipe("kyno_bollard", {Ingredient("rocks", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_bollard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bollard.xml", "kyno_bollard.tex")


AddRecipe("kyno_ivy", {Ingredient("twigs", 4), Ingredient("cutgrass", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ivy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ivy.xml", "kyno_ivy.tex")


AddRecipe("kyno_streetlight1", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_streetlight1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_streetlight1.xml", "kyno_streetlight1.tex")


AddRecipe("kyno_streetlight2", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_streetlight2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_streetlight2.xml", "kyno_streetlight2.tex")


AddRecipe("kyno_mossygateway", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mossygateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mossygateway.xml", "kyno_mossygateway.tex")


AddRecipe("kyno_sammywagon", {Ingredient("boards", 1), Ingredient("cutgrass", 5)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_sammywagon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sammywagon.xml", "kyno_sammywagon.tex")


AddRecipe("kyno_mealingstone", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mealingstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mealingstone.xml", "kyno_mealingstone.tex")


AddRecipe("kyno_safechest", {Ingredient("cutstone", 2), Ingredient("goldnugget", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_safechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_safe.xml", "kyno_safe.tex")


AddRecipe("kyno_saltpond", {Ingredient("saltrock", 2), Ingredient("ice", 4), Ingredient("pondfish", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_saltpond_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltpond.xml", "kyno_saltpond.tex")


AddRecipe("kyno_saltpond_rack", {Ingredient("saltrock", 4), Ingredient("ice", 4), Ingredient("twigs", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_saltpond_rack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltpond_rack.xml", "kyno_saltpond_rack.tex")


AddRecipe("kyno_crabtrap", {Ingredient("boards", 1), Ingredient("silk", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_crabtrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crabtrap.xml", "kyno_crabtrap.tex")


AddRecipe("kyno_rubble_carriage", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_carriage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_carriage.xml", "kyno_carriage.tex")


AddRecipe("kyno_rubble_bike", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_bike_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bike.xml", "kyno_bike.tex")


AddRecipe("kyno_rubble_clock", {Ingredient("boards", 1), Ingredient("compass", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_clock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gorgeclock.xml", "kyno_gorgeclock.tex")


AddRecipe("kyno_rubble_cathedral", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_cathedral_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cathedral.xml", "kyno_cathedral.tex")


AddRecipe("kyno_rubble_pubdoor", {Ingredient("cutstone", 2), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_pubdoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pubdoor.xml", "kyno_pubdoor.tex")


AddRecipe("kyno_rubble_door", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_door_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_housedoor.xml", "kyno_housedoor.tex")


AddRecipe("kyno_rubble_roof", {Ingredient("cutstone", 2), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_roof_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roof.xml", "kyno_roof.tex")


AddRecipe("kyno_rubble_clocktower", {Ingredient("cutstone", 2), Ingredient("compass", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_clocktower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_clocktower.xml", "kyno_clocktower.tex")


AddRecipe("kyno_rubble_house", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_house.xml", "kyno_house.tex")


AddRecipe("kyno_rubble_chimney", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_chimney_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_chimney1.xml", "kyno_chimney1.tex")


AddRecipe("kyno_rubble_chimney2", {Ingredient("cutstone", 2), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_chimney2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_chimney2.xml", "kyno_chimney2.tex")


AddRecipe("kyno_piptoncart", {Ingredient("cutstone", 1), Ingredient("bluegem", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_piptoncart_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_piptoncart.xml", "kyno_piptoncart.tex")


AddRecipe("kyno_irongate_item", {Ingredient("twigs", 6), Ingredient("flint", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 2, nil, "images/inventoryimages/kyno_irongate_item.xml", "kyno_irongate_item.tex")


AddRecipe("kyno_ironfencesmall", {Ingredient("twigs", 3), Ingredient("flint", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ironfencesmall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ironfencesmall.xml", "kyno_ironfencesmall.tex")


AddRecipe("kyno_ironfencetall", {Ingredient("twigs", 3), Ingredient("flint", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ironfencetall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ironfencesmall.xml", "kyno_ironfencesmall.tex")


AddRecipe("kyno_urn", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_urn.xml", "kyno_urn.tex")


AddRecipe("kyno_worshipper", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper.xml", "kyno_worshipper.tex")


AddRecipe("kyno_worshipper2", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper2.xml", "kyno_worshipper2.tex")


-- AddRecipe("kyno_worshipper2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper2_left.xml", "kyno_worshipper2_left.tex")


AddRecipe("kyno_stoneobelisk", {Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_stoneobelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stoneobelisk.xml", "kyno_stoneobelisk.tex")


AddRecipe("kyno_birdfountain", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_birdfountain_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_birdfountain.xml", "kyno_birdfountain.tex")


AddRecipe("cottontree_normal", {Ingredient("log", 1), Ingredient("pinecone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "cottontree_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cottontree.xml", "kyno_cottontree.tex")


AddRecipe("kyno_spottyshrub", {Ingredient("dug_berrybush2", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_spottyshrub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_spottyshrub.xml", "kyno_spottyshrub.tex")


AddRecipe("kyno_oven", {Ingredient("cutstone", 2), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_oven_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_oven.tex")


AddRecipe("kyno_grill_small", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_grill_small_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_grill_small.tex")


AddRecipe("kyno_grill_large", {Ingredient("cutstone", 2), Ingredient("twigs", 4), Ingredient("charcoal", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_grill_large_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_grill.tex")


AddRecipe("kyno_pothanger_potsmall", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_potsmall_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_pothanger", {Ingredient("cutstone", 2), Ingredient("twigs", 4), Ingredient("charcoal", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_pothanger_syrup", {Ingredient("cutstone", 2), Ingredient("twigs", 3), Ingredient("honey", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_syrup_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_mushroomstump", {Ingredient("red_cap", 3), Ingredient("green_cap", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mushroomstump_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mushstump.xml", "kyno_mushstump.tex")


AddRecipe("kyno_swampmermhouserubble", {Ingredient("rocks", 2), Ingredient("log", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swampmermhouserubble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swampmermhouserubble.xml", "kyno_swampmermhouserubble.tex")


AddRecipe("kyno_swamppighouse", {Ingredient("boards", 4), Ingredient("cutstone", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swamppighouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swamppighouse.xml", "kyno_swamppighouse.tex")


AddRecipe("kyno_swampmermhouse", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swampmermhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swampmermhouse.xml", "kyno_swampmermhouse.tex")


AddRecipe("kyno_pigelder", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pigelder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigelder.xml", "kyno_pigelder.tex")


AddRecipe("kyno_potato_planted", {Ingredient("potato_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_potato_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_2.tex")


AddRecipe("kyno_turnip_planted", {Ingredient("eggplant_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_turnip_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_5.tex")


AddRecipe("kyno_carrot_planted", {Ingredient("carrot_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_carrot_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_6.tex")


AddRecipe("kyno_onion_planted", {Ingredient("onion_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_onion_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_4.tex")


AddRecipe("kyno_wheat_planted", {Ingredient("cutgrass", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_wheat_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_1.tex")


AddRecipe("kyno_garlic_planted", {Ingredient("garlic_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_garlic_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_7.tex")


AddRecipe("kyno_tomato_planted", {Ingredient("tomato_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "Kyno_tomato_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_3.tex")


AddRecipe("turf_pinkpark", {Ingredient("turf_deciduous", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_pinkpark.tex")


AddRecipe("turf_pinkstone", {Ingredient("turf_road", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_pinkstone.tex")


AddRecipe("turf_greyforest", {Ingredient("turf_forest", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_greyforest.tex")


AddRecipe("turf_stonecity", {Ingredient("turf_road", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_stonecity.tex")


AddRecipe("turf_browncarpet", {Ingredient("turf_carpetfloor", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_browncarpet.tex")


AddRecipe("kyno_lamppost", {Ingredient("cutstone", 1), Ingredient("lantern", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lamppost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "city_lamp.tex")


AddRecipe("kyno_pighouse_farm", {Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_farm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_farmhouse.xml", "kyno_farmhouse.tex")


AddRecipe("kyno_pighouse_city", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_city_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pighouse_city.tex")


AddRecipe("kyno_pigshop_deli", {Ingredient("boards", 4), Ingredient("honeyham", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_deli_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_deli.tex")


AddRecipe("kyno_pigshop_general", {Ingredient("boards", 4), Ingredient("axe", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_general_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_general.tex")


AddRecipe("kyno_pigshop_spa", {Ingredient("boards", 4), Ingredient("bandage", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_spa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hoofspa.tex")


AddRecipe("kyno_pigshop_produce", {Ingredient("boards", 4), Ingredient("eggplant", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_produce_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_produce.tex")


AddRecipe("kyno_pigshop_flower", {Ingredient("boards", 4), Ingredient("petals", 12), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_flower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_florist.tex")


AddRecipe("kyno_pigshop_antiquities", {Ingredient("boards", 4), Ingredient("hammer", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_antiquities_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_antiquities.tex")


AddRecipe("kyno_pigshop_arcane", {Ingredient("boards", 4), Ingredient("nightmarefuel", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_arcane_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_arcane.tex")


AddRecipe("kyno_pigshop_weapons", {Ingredient("boards", 4), Ingredient("spear", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_weapons_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_weapons.tex")


AddRecipe("kyno_pigshop_hatshop", {Ingredient("boards", 4), Ingredient("tophat", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_hatshop_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hatshop.tex")


AddRecipe("kyno_pigshop_bank", {Ingredient("cutstone", 3), Ingredient("goldnugget", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_bank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_bank.tex")


AddRecipe("kyno_pigshop_tinker", {Ingredient("cutstone", 3), Ingredient("boards", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_tinker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_tinker.tex")


AddRecipe("kyno_pigshop_academy", {Ingredient("cutstone", 3), Ingredient("papyrus", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_academy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_academy.xml", "kyno_academy.tex")


AddRecipe("kyno_pigshop_cityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_cityhall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigshop_mycityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("silk", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_mycityhall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigpalace", {Ingredient("marble", 4), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalace_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigpalace.xml", "kyno_pigpalace.tex")


AddRecipe("kyno_pigpalace2", {Ingredient("cutstone", 4), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalace2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigpalace.xml", "kyno_pigpalace.tex")


AddRecipe("kyno_playerhouse", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "playerhouse_city.tex")


AddRecipe("kyno_playerhouse_manor", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_manor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_manor_craft.tex")


AddRecipe("kyno_playerhouse_cottage", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_cottage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_cottage_craft.tex")


AddRecipe("kyno_playerhouse_tudor", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_tudor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_tudor_craft.tex")


AddRecipe("kyno_playerhouse_villa", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_villa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_villa_craft.tex")


AddRecipe("kyno_playerhouse_gothic", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_gothic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_gothic_craft.tex")


AddRecipe("kyno_playerhouse_brick", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_brick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_brick_craft.tex")


AddRecipe("kyno_playerhouse_turret", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_turret_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_turret_craft.tex")


AddRecipe("kyno_pigtower3", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower2", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigpalacetower", {Ingredient("cutstone", 3), Ingredient("goldnugget", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalacetower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_royalguard", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard.xml", "kyno_royalguard.tex")


AddRecipe("kyno_royalguard_2", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_2.xml", "kyno_royalguard_2.tex")


AddRecipe("kyno_royalguard_rich", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich.xml", "kyno_royalguard_rich.tex")


AddRecipe("kyno_royalguard_rich_2", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich_2.xml", "kyno_royalguard_rich_2.tex")


AddRecipe("kyno_royalguard_palace", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_palace_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_palace.xml", "kyno_royalguard_palace.tex")


AddRecipe("kyno_cavecleft", {Ingredient("rocks", 5), Ingredient("flint", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cavecleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cavecleft.xml", "kyno_cavecleft.tex")


AddRecipe("kyno_pigruinssmall", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruinssmall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruinssmall.xml", "kyno_pigruinssmall.tex")


AddRecipe("kyno_pigruins1", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins1.xml", "kyno_pigruins1.tex")


AddRecipe("kyno_pigruins2", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins2.xml", "kyno_pigruins2.tex")


AddRecipe("kyno_pigruins3", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("flint", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins3.xml", "kyno_pigruins3.tex")


AddRecipe("kyno_pigruins4", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins4.xml", "kyno_pigruins4.tex")


AddRecipe("kyno_manthill", {Ingredient("twigs", 10), Ingredient("cutgrass", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_manthill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_anthill.xml", "kyno_anthill.tex")


AddRecipe("kyno_mantqueenhill", {Ingredient("cutstone", 3), Ingredient("rocks", 4), Ingredient("redgem", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mantqueenhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antqueenhill.xml", "kyno_antqueenhill.tex")


AddRecipe("kyno_antthrone", {Ingredient("rocks", 10), Ingredient("nitre", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antthrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antthrone.xml", "kyno_antthrone.tex")


AddRecipe("kyno_ant_queen", {Ingredient("rocks", 10), Ingredient("nitre", 5), Ingredient("reviver", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ant_queen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antqueen.xml", "kyno_antqueen.tex")


AddRecipe("kyno_antcombhome", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcombhome_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antcombhome.xml", "kyno_antcombhome.tex")


AddRecipe("kyno_antchest", {Ingredient("honey", 2), Ingredient("boards", 3)},
kyno_hamlettab, TECH.LOST, "kyno_antchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antchest.xml", "kyno_antchest.tex")


AddRecipe("kyno_antcache", {Ingredient("boards", 2), Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcache_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antcache.xml", "kyno_antcache.tex")


AddRecipe("kyno_aporkalypse_calendar", {Ingredient("cutstone", 3), Ingredient("transistor", 2), Ingredient("nightmarefuel", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aporkalypse_calendar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_calendar.xml", "kyno_calendar.tex")


AddRecipe("kyno_smashingpot", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smashingpot_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_smashingpot.xml", "kyno_smashingpot.tex")


AddRecipe("wall_pig_ruins_item", {Ingredient("thulecite", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_ancientwall.xml", "kyno_ancientwall.tex")


AddRecipe("kyno_rock_artichoke", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_artichoke_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_artichoke.xml", "kyno_artichoke.tex")


AddRecipe("kyno_ruins_head", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_gianthead.xml", "kyno_ruins_gianthead.tex")


AddRecipe("kyno_ruins_pigstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_pigstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_pigstatue.xml", "kyno_ruins_pigstatue.tex")


AddRecipe("kyno_ruins_antstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_antstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_antstatue.xml", "kyno_ruins_antstatue.tex")


AddRecipe("kyno_ruins_idolstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_idolstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_idolstatue.xml", "kyno_ruins_idolstatue.tex")


AddRecipe("kyno_ruins_plaquestatue", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_plaquestatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_plaquestatue.xml", "kyno_ruins_plaquestatue.tex")


AddRecipe("kyno_ruins_trufflestatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("purplegem", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_trufflestatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_trufflestatue.xml", "kyno_ruins_trufflestatue.tex")


AddRecipe("kyno_ruins_sowstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("bluegem", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_sowstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_sowstatue.xml", "kyno_ruins_sowstatue.tex")


AddRecipe("kyno_brazier", {Ingredient("cutstone", 1), Ingredient("charcoal", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_brazier_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brazier.xml", "kyno_brazier.tex")


AddRecipe("kyno_wishingwell", {Ingredient("cutstone", 2), Ingredient("ice", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_wishingwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wishingwell.xml", "kyno_wishingwell.tex")


AddRecipe("kyno_endwell", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_endwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_endwell.xml", "kyno_endwell.tex")


AddRecipe("kyno_strikingstatue", {Ingredient("cutstone", 1), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_strikingstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dartstatue.xml", "kyno_dartstatue.tex")


AddRecipe("kyno_speartrap", {Ingredient("spear", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_speartrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_speartrap.xml", "kyno_speartrap.tex")


AddRecipe("kyno_pillar_front", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinspillar.xml", "kyno_ruinspillar.tex")


AddRecipe("kyno_pillar_front_blue", {Ingredient("cutstone", 1), Ingredient("bluegem", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_blue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinspillarblue.xml", "kyno_ruinspillarblue.tex")


AddRecipe("kyno_teeteringpillar", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teeteringpillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_teeteringpillar.xml", "kyno_teeteringpillar.tex")


AddRecipe("kyno_pugaliskfountain", {Ingredient("cutstone", 4), Ingredient("ice", 10), Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskfountain_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fountainyouth.xml", "kyno_fountainyouth.tex")


AddRecipe("kyno_trapdoor", {Ingredient("cutstone", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trapdoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trapdoor.xml", "kyno_trapdoor.tex")


AddRecipe("kyno_pugaliskcorpse", {Ingredient("boneshard", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskcorpse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_snakebody.xml", "kyno_snakebody.tex")


AddRecipe("kyno_teleporter_hamlet", {Ingredient("cutstone", 2), Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teleporter_hamlet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatohamlet.xml", "kyno_potatohamlet.tex")


AddRecipe("kyno_exoticflower", {Ingredient("petals", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_exoticflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_exoticflower.xml", "kyno_exoticflower.tex")


AddRecipe("kyno_artificial_exoticflower", {Ingredient("petals", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_artificial_exoticflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_exoticflower2.xml", "kyno_exoticflower2.tex")


AddRecipe("kyno_rock_eruption", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_eruption_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_eruption.xml", "kyno_eruption.tex")


AddRecipe("kyno_rockplug", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rockplug_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockplug.xml", "kyno_rockplug.tex")


AddRecipe("kyno_rock_batboulder", {Ingredient("rocks", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_batboulder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batboulder.xml", "kyno_batboulder.tex")


AddRecipe("kyno_antrock", {Ingredient("rocks", 3), Ingredient("nitre", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antrock.xml", "kyno_antrock.tex")


AddRecipe("kyno_balloon_wreck", {Ingredient("silk", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_balloon_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_balloon.xml", "kyno_balloon.tex")


AddRecipe("kyno_basket_wreck", {Ingredient("boards", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basket_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basket.xml", "kyno_basket.tex")


AddRecipe("kyno_flags_wreck", {Ingredient("papyrus", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flags_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flags.xml", "kyno_flags.tex")


AddRecipe("kyno_sandbag_wreck", { beachingredient1, Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sandbag_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bagsand.xml", "kyno_bagsand.tex")


AddRecipe("kyno_suitcase_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_suitcase_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_suitcase.xml", "kyno_suitcase.tex")


AddRecipe("kyno_trunk_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trunk_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trunk.xml", "kyno_trunk.tex")


AddRecipe("kyno_grub", {Ingredient("reviver", 1), Ingredient("slurtle_shellpieces", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_grub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_grub.xml", "kyno_grub.tex")


AddRecipe("kyno_flytrap", {Ingredient("plantmeat", 2), Ingredient("houndstooth", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flytrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flytrap.xml", "kyno_flytrap.tex")


AddRecipe("kyno_dungball", {Ingredient("poop", 2), Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungball_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dungball.xml", "kyno_dungball.tex")


AddRecipe("kyno_dungpile", {Ingredient("poop", 4), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungpile_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dungpile.xml", "kyno_dungpile.tex")


AddRecipe("kyno_gnatmound", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_gnatmound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gnatmound.xml", "kyno_gnatmound.tex")


AddRecipe("kyno_mandrakehouse", {Ingredient("mandrake", 1), Ingredient("boards", 4), Ingredient("cutgrass", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mandrakehouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mandrakehouse.xml", "kyno_mandrakehouse.tex")


AddRecipe("kyno_bandittreasure", {Ingredient("feather_crow", 4), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bandittreasure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banditcamp.xml", "kyno_banditcamp.tex")


AddRecipe("kyno_sparkpool", {Ingredient("ice", 5), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sparkpool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sparklingpool.xml", "kyno_sparklingpool.tex")


AddRecipe("kyno_bathole", {Ingredient("batwing", 1), Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bathole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bathole.xml", "kyno_bathole.tex")


AddRecipe("kyno_batpit", {Ingredient("batwing", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_batpit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batpit.xml", "kyno_batpit.tex")


AddRecipe("kyno_stoneslab", {Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_stoneslab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_slab.xml", "kyno_slab.tex")


AddRecipe("kyno_thundernest", {Ingredient("redgem", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thundernest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_thundernest.xml", "kyno_thundernest.tex")


AddRecipe("kyno_rocnest", {Ingredient("cutgrass", 10), Ingredient("twigs", 10), Ingredient("flint", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rocnest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocnest.xml", "kyno_rocnest.tex")


AddRecipe("kyno_nest_house", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rochouse.xml", "kyno_rochouse.tex")


AddRecipe("kyno_nest_rusty_lamp", {Ingredient("lantern", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_rusty_lamp_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocrustylamp.xml", "kyno_rocrustylamp.tex")


AddRecipe("kyno_nest_tree1", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctree1.xml", "kyno_roctree1.tex")


AddRecipe("kyno_nest_tree2", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctree2.xml", "kyno_roctree2.tex")


AddRecipe("kyno_nest_bush", {Ingredient("cutgrass", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_bush_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbush.xml", "kyno_rocbush.tex")


AddRecipe("kyno_nest_trunk", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_trunk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctrunk.xml", "kyno_roctrunk.tex")


AddRecipe("kyno_nest_branch1", {Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbranch1.xml", "kyno_rocbranch1.tex")


AddRecipe("kyno_nest_branch2", {Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbranch2.xml", "kyno_rocbranch2.tex")


AddRecipe("kyno_nest_debris1", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick1.xml", "kyno_rocstick1.tex")


AddRecipe("kyno_nest_debris2", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick2.xml", "kyno_rocstick2.tex")


AddRecipe("kyno_nest_debris3", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick3.xml", "kyno_rocstick3.tex")


AddRecipe("kyno_nest_debris4", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick4.xml", "kyno_rocstick4.tex")


AddRecipe("kyno_nest_egg1", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell1.xml", "kyno_rocshell1.tex")


AddRecipe("kyno_nest_egg2", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell2.xml", "kyno_rocshell2.tex")


AddRecipe("kyno_nest_egg3", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell3.xml", "kyno_rocshell3.tex")


AddRecipe("kyno_nest_egg4", {Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell4.xml", "kyno_rocshell4.tex")


AddRecipe("kyno_ironhulk_spider", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_spider_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkspider.xml", "kyno_hulkspider.tex")


AddRecipe("kyno_ironhulk_claw", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_claw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkclaw.xml", "kyno_hulkclaw.tex")


AddRecipe("kyno_ironhulk_leg", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_leg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkleg.xml", "kyno_hulkleg.tex")


AddRecipe("kyno_ironhulk_head", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkhead.xml", "kyno_hulkhead.tex")


AddRecipe("kyno_ironhulk_large", {Ingredient("gears", 6), Ingredient("transistor", 2), Ingredient("nightmarefuel", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_large_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulklarge.xml", "kyno_hulklarge.tex")


AddRecipe("kyno_bramble1", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble1.xml", "kyno_bramble1.tex")


AddRecipe("kyno_bramble2", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble2.xml", "kyno_bramble2.tex")


AddRecipe("kyno_bramble3", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble3.xml", "kyno_bramble3.tex")


AddRecipe("kyno_bramblecore", {Ingredient("dug_marsh_bush", 1), Ingredient("petals", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramblecore_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "bramble_bulb.tex")


AddRecipe("kyno_aloe_planted", {Ingredient("corn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aloe_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "aloe.tex")


AddRecipe("kyno_asparagus_planted", {Ingredient("asparagus", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_asparagus_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "asparagus.tex")


AddRecipe("kyno_radish_planted", {Ingredient("pepper", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_radish_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "radish.tex")


AddRecipe("kyno_leafystalk", {Ingredient("log", 10), Ingredient("succulent_picked", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_leafystalk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_leafystalk.xml", "kyno_leafystalk.tex")


AddRecipe("kyno_vine1", {Ingredient("rope", 2), Ingredient("plantmeat", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vineone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine1.xml", "kyno_vine1.tex")


AddRecipe("kyno_vine2", {Ingredient("rope", 2), Ingredient("cutgrass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vinetwo_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine2.xml", "kyno_vine2.tex")


AddRecipe("kyno_vine3", {Ingredient("rope", 2), Ingredient("cutgrass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vinethree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine3.xml", "kyno_vine3.tex")


AddRecipe("kyno_cocoon", {Ingredient("lightbulb", 1), Ingredient("ice", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cocoon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cocoon.xml", "kyno_cocoon.tex")


AddRecipe("kyno_junglefern", {Ingredient("foliage", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_junglefern.xml", "kyno_junglefern.tex")


AddRecipe("kyno_junglefern_green", {Ingredient("succulent_picked", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_green_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_junglefern2.xml", "kyno_junglefern2.tex")


AddRecipe("kyno_magicflower", {Ingredient("petals", 5), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_magicflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magicflower.xml", "kyno_magicflower.tex")


AddRecipe("kyno_nettleplant", {Ingredient("cutlichen", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nettleplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_nettle.tex")


AddRecipe("kyno_tallgrass", {Ingredient("dug_grass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tallgrass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_grass.tex")


AddRecipe("tubertree_short", {Ingredient("log", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tubertree.xml", "kyno_tubertree.tex")


AddRecipe("tubertreebloom_short", {Ingredient("log", 3), Ingredient("petals", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertreebloom_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tubertreebloom.xml", "kyno_tubertreebloom.tex")


AddRecipe("kyno_clawtree_sapling", {Ingredient("pinecone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_clawtree_sapling_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "clawpalmtree_sapling.tex")


AddRecipe("kyno_clawtree2_sapling", {Ingredient("pinecone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_clawtree2_sapling_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_red_clawtree.xml", "kyno_red_clawtree.tex")


AddRecipe("teatree_nut", {Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "teatree_nut.tex")


AddRecipe("burr", {Ingredient("twiggy_nut", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "burr.tex")


AddRecipe("rainforesttree_bloom_short", { burringredient },
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_bloom_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treebloom.xml", "kyno_treebloom.tex")


AddRecipe("rainforesttree_rot_short", { burringredient, Ingredient("spoiled_food", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_rot_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treerot.xml", "kyno_treerot.tex")


AddRecipe("cocoonedtree_short", { burringredient, Ingredient("silk", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "cocoonedtree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cocoonedtree.xml", "kyno_cocoonedtree.tex")


AddRecipe("kyno_pomegranate_tree", {Ingredient("pomegranate", 3), Ingredient("log", 2), Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pomegranate_tree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_appletree.xml", "kyno_appletree.tex")


AddRecipe("kyno_corkchest", {Ingredient("boards", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_corkchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "corkchest.tex")


AddRecipe("kyno_rootchest", {Ingredient("boards", 3), Ingredient("nightmarefuel", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rootchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "roottrunk.tex")


AddRecipe("kyno_truerootchest", {Ingredient("boards", 3), Ingredient("livinglog", 3), Ingredient("nightmarefuel", 5)},
kyno_hamlettab, TECH.LOST, "kyno_rootchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "roottrunk.tex")


AddRecipe("kyno_hogusporkusator", {Ingredient("boards", 4), Ingredient("pigskin", 4), Ingredient("feather_robin_winter", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_hogusporkusator_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hogusporkusator.tex")


AddRecipe("kyno_sprinkler", {Ingredient("transistor", 2), Ingredient("gears", 2), Ingredient("ice", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sprinkler_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "sprinkler.tex")


AddRecipe("kyno_smelter", {Ingredient("cutstone", 2), Ingredient("boards", 4), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smelter_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "smelter.tex")


AddRecipe("kyno_basefan", {Ingredient("transistor", 2), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basefan_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "basefan.tex")


AddRecipe("kyno_thumper", {Ingredient("gears", 3), Ingredient("flint", 10), Ingredient("hammer", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thumper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "thumper.tex")


AddRecipe("kyno_telipad", {Ingredient("gears", 3), Ingredient("transistor", 2), Ingredient("cutstone", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_telipad_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "telipad.tex")


AddRecipe("kyno_telebrella", {Ingredient("gears", 2), Ingredient("transistor", 2), Ingredient("umbrella", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_minisign_icons_2.xml", "kyno_telebrella.tex")


AddRecipe("kyno_lawnornament_1", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_1.tex")


AddRecipe("kyno_lawnornament_2", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_2.tex")


AddRecipe("kyno_lawnornament_3", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_3.tex")


AddRecipe("kyno_lawnornament_4", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_4.tex")


AddRecipe("kyno_lawnornament_5", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_5.tex")


AddRecipe("kyno_lawnornament_6", {Ingredient("dug_berrybush", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_6.tex")


AddRecipe("kyno_lawnornament_7", {Ingredient("dug_berrybush_juicy", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_7.tex")


AddRecipe("kyno_topiary_1", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigtopiary.xml", "kyno_pigtopiary.tex")


AddRecipe("kyno_topiary_2", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_werepigtopiary.xml", "kyno_werepigtopiary.tex")


AddRecipe("kyno_topiary_3", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beefalotopiary.xml", "kyno_beefalotopiary.tex")


AddRecipe("kyno_topiary_4", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigkingtopiary.xml", "kyno_pigkingtopiary.tex")


AddRecipe("hedge_block_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_block_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_block_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_block_item.tex")
end

AddRecipe("hedge_cone_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_cone_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_cone_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_cone_item.tex")
end

AddRecipe("hedge_layered_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_layered_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_layered_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_layered_item.tex")
end

AddRecipe("turf_cobbleroad", {Ingredient("turf_rocky", 1), Ingredient("boards", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_cobbleroad.tex")


AddRecipe("turf_foundation", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_foundation.tex")


AddRecipe("turf_lawn", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_lawn.tex")


AddRecipe("turf_fields", {Ingredient("turf_grass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_fields.tex")


AddRecipe("turf_rainforest", {Ingredient("turf_grass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_rainforest.tex")


AddRecipe("turf_deepjungle", {Ingredient("turf_forest", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_deepjungle.tex")


AddRecipe("turf_gasjungle", {Ingredient("turf_marsh", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_gasjungle.tex")


AddRecipe("turf_plains", {Ingredient("turf_savanna", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_plains.tex")


AddRecipe("turf_mossy_blossom", {Ingredient("turf_deciduous", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_mossy_blossom.tex")


AddRecipe("turf_bog", {Ingredient("turf_desertdirt", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_bog.tex")


AddRecipe("turf_antcave", {Ingredient("turf_mud", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_antcave.tex")


AddRecipe("turf_batcave", {Ingredient("turf_cave", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_batcave.tex")


AddRecipe("turf_pigruins", {Ingredient("turf_underrock", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_pigruins.tex")


AddRecipe("turf_beard_hair", {Ingredient("beardhair", 2), Ingredient("cutgrass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_beard_hair.tex")

local VANITY = GetModConfigData("vanity_items")
if VANITY == 0 then
AddRecipe("kyno_relic_1", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_1.tex")


AddRecipe("kyno_relic_2", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_2.tex")


AddRecipe("kyno_relic_3", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_3.tex")


AddRecipe("kyno_relic_4", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_4.tex")


AddRecipe("kyno_relic_5", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_5.tex")


AddRecipe("kyno_pherostone", {Ingredient("goldnugget", 3), Ingredient("rocks", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pheromonestone.tex")


AddRecipe("kyno_oinc1", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc.tex")


AddRecipe("kyno_oinc10", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc10.tex")


AddRecipe("kyno_oinc100", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc100.tex")


AddRecipe("kyno_gorgecoin1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin1.tex")


AddRecipe("kyno_gorgecoin2", {Ingredient("goldnugget", 2), Ingredient("bluegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin2.tex")


AddRecipe("kyno_gorgecoin3", {Ingredient("goldnugget", 2), Ingredient("redgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin3.tex")


AddRecipe("kyno_gorgecoin4", {Ingredient("goldnugget", 2), Ingredient("opalpreciousgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin4.tex")
end

AddRecipe("berries", {Ingredient("berries_juicy", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "berries.tex")


AddRecipe("berries_juicy", {Ingredient("berries", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "berries_juicy.tex")


AddRecipe("fossil_piece", {Ingredient("boneshard", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "fossil_piece.tex")


AddRecipe("bullkelp_root", {Ingredient("kelp", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "bullkelp_root.tex")


AddRecipe("fireflies", {Ingredient("lightbulb", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "fireflies.tex")


AddRecipe("kyno_redflies", {Ingredient("fireflies", 1), Ingredient("redgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_redflies.xml", "kyno_redflies.tex")


AddRecipe("kyno_orangeflies", {Ingredient("fireflies", 1), Ingredient("orangegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_orangeflies.xml", "kyno_orangeflies.tex")


AddRecipe("kyno_yellowflies", {Ingredient("fireflies", 1), Ingredient("yellowgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_yellowflies.xml", "kyno_yellowflies.tex")


AddRecipe("kyno_greenflies", {Ingredient("fireflies", 1), Ingredient("greengem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_greenflies.xml", "kyno_greenflies.tex")


AddRecipe("kyno_blueflies", {Ingredient("fireflies", 1), Ingredient("bluegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_blueflies.xml", "kyno_blueflies.tex")


AddRecipe("kyno_cyanflies", {Ingredient("fireflies", 1), Ingredient("moonrocknugget", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_cyanflies.xml", "kyno_cyanflies.tex")


AddRecipe("kyno_purpleflies", {Ingredient("fireflies", 1), Ingredient("purplegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_purpleflies.xml", "kyno_purpleflies.tex")


AddRecipe("trinket_1", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_1.tex")


AddRecipe("trinket_2", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_2.tex")


AddRecipe("trinket_3", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_3.tex")


AddRecipe("trinket_4", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_4.tex")


AddRecipe("trinket_5", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_5.tex")


AddRecipe("trinket_6", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_6.tex")


AddRecipe("trinket_7", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_7.tex")


AddRecipe("trinket_8", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_8.tex")


AddRecipe("trinket_9", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_9.tex")


AddRecipe("trinket_10", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_10.tex")


AddRecipe("trinket_11", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_11.tex")


AddRecipe("trinket_12", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_12.tex")


AddRecipe("trinket_13", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_13.tex")


AddRecipe("trinket_14", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_14.tex")

-- 15 and 16 are Shadow Pices Trinket.
AddRecipe("trinket_17", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_17.tex")


AddRecipe("trinket_18", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_18.tex")


AddRecipe("trinket_19", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_19.tex")


AddRecipe("trinket_20", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_20.tex")


AddRecipe("trinket_21", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_21.tex")


AddRecipe("trinket_22", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_22.tex")


AddRecipe("trinket_23", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_23.tex")


AddRecipe("trinket_24", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_24.tex")


AddRecipe("trinket_25", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_25.tex")


AddRecipe("trinket_26", {Ingredient("goldnugget", 9)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_26.tex")


AddRecipe("trinket_27", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_27.tex")


AddRecipe("antliontrinket", {Ingredient("goldnugget", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "antliontrinket.tex")


AddRecipe("trinket_32", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_32.tex")


AddRecipe("trinket_33", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_33.tex")


AddRecipe("trinket_34", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_34.tex")


AddRecipe("trinket_35", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_35.tex")


AddRecipe("trinket_36", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_36.tex")


AddRecipe("trinket_37", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_37.tex")


AddRecipe("trinket_38", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_38.tex")


AddRecipe("trinket_39", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_39.tex")


AddRecipe("trinket_40", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_40.tex")


AddRecipe("trinket_41", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_41.tex")


AddRecipe("trinket_42", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_42.tex")


AddRecipe("trinket_43", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_43.tex")


AddRecipe("trinket_44", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_44.tex")


AddRecipe("trinket_45", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_45.tex")


AddRecipe("trinket_46", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_46.tex")

-- SW Trinkets --
AddRecipe("trinket_sw_13", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_13.tex")


AddRecipe("trinket_sw_14", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_14.tex")


AddRecipe("trinket_sw_15", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_15.tex")


AddRecipe("trinket_sw_16", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_16.tex")


AddRecipe("trinket_sw_17", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_17.tex")


AddRecipe("trinket_sw_18", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_18.tex")


AddRecipe("trinket_sw_19", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_19.tex")


AddRecipe("trinket_sw_20", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_20.tex")


AddRecipe("trinket_sw_21", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_21.tex")


AddRecipe("trinket_sw_22", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_22.tex")


AddRecipe("trinket_sw_23", {Ingredient("goldnugget", 10)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_23.tex")


AddRecipe("kyno_earring", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "kyno_earring.tex")

-- HAM Trinkets --
AddRecipe("trinket_ham_1", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham_2.xml", "trinket_ham_1.tex")


AddRecipe("trinket_ham_3", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham_2.xml", "trinket_ham_3.tex")


AddRecipe("halloween_ornament_1", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_1.tex")


AddRecipe("halloween_ornament_2", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_2.tex")


AddRecipe("halloween_ornament_3", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_3.tex")


AddRecipe("halloween_ornament_4", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_4.tex")


AddRecipe("halloween_ornament_5", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_5.tex")


AddRecipe("halloween_ornament_6", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_6.tex")


AddRecipe("winter_ornament_plain1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain1.tex")


AddRecipe("winter_ornament_plain1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain1.tex")


AddRecipe("winter_ornament_plain2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain2.tex")


AddRecipe("winter_ornament_plain3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain3.tex")


AddRecipe("winter_ornament_plain4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain4.tex")


AddRecipe("winter_ornament_plain5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain5.tex")


AddRecipe("winter_ornament_plain6", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain6.tex")


AddRecipe("winter_ornament_plain7", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain7.tex")


AddRecipe("winter_ornament_plain8", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain8.tex")


AddRecipe("winter_ornament_plain9", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain9.tex")


AddRecipe("winter_ornament_plain10", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain10.tex")


AddRecipe("winter_ornament_plain11", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain11.tex")


AddRecipe("winter_ornament_plain12", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain12.tex")


AddRecipe("winter_ornament_fancy1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy1.tex")


AddRecipe("winter_ornament_fancy2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy2.tex")


AddRecipe("winter_ornament_fancy3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy3.tex")


AddRecipe("winter_ornament_fancy4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy4.tex")


AddRecipe("winter_ornament_fancy5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy5.tex")


AddRecipe("winter_ornament_fancy6", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy6.tex")


AddRecipe("winter_ornament_fancy7", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy7.tex")


AddRecipe("winter_ornament_fancy8", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy8.tex")


AddRecipe("winter_ornament_festivalevents1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents1.tex")


AddRecipe("winter_ornament_festivalevents2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents2.tex")


AddRecipe("winter_ornament_festivalevents3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents3.tex")


AddRecipe("winter_ornament_festivalevents4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents4.tex")


AddRecipe("winter_ornament_festivalevents5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents5.tex")


AddRecipe("kyno_novelty_ride", {Ingredient("boards", 2), Ingredient("silk", 2), Ingredient("gears", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_novelty_ride_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_novelty_ride.xml", "kyno_novelty_ride.tex")


AddRecipe("kyno_rock_limpet", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_limpet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_limpet.xml", "kyno_rock_limpet.tex")


AddRecipe("kyno_vinebush", {Ingredient("dug_marsh_bush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_vinebush_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bush_vine.tex")


AddRecipe("kyno_bambootree", {Ingredient("dug_sapling", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bambootree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bambootree.tex")


AddRecipe("jungletreeseed", {Ingredient("pinecone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "jungletreeseed.tex")


AddRecipe("coconut", {Ingredient("acorn", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "coconut.tex")


AddRecipe("kyno_sweet_potato_planted", { potatoingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sweet_potato_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sweet_potato.tex")


AddRecipe("kyno_sandhill", { beachingredient1 },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand.tex")


AddRecipe("seashell", {Ingredient("flint", 1), Ingredient("nitre", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seashell.tex")


AddRecipe("kyno_surfboard", {Ingredient("boards", 2), seashellingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_surfboard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "surfboard_item.tex")


AddRecipe("kyno_parrot_boat", {Ingredient("boards", 3), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_parrot_boat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_parrot_boat.xml", "kyno_parrot_boat.tex")


AddRecipe("kyno_boat_empty", {Ingredient("boards", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_boat_empty_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boat_empty.xml", "kyno_boat_empty.tex")


AddRecipe("kyno_shipmast", {Ingredient("boards", 2), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_shipmast_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shipmast.xml", "kyno_shipmast.tex")


AddRecipe("kyno_debris_1", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_1.xml", "kyno_debris_1.tex")


AddRecipe("kyno_debris_2", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_2.xml", "kyno_debris_2.tex")


AddRecipe("kyno_debris_3", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_3.xml", "kyno_debris_3.tex")


AddRecipe("kyno_crate", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_crate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crate.xml", "kyno_crate.tex")


AddRecipe("kyno_living_jungletree", {Ingredient("livinglog", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_living_jungletree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_living_jungletree.xml", "kyno_living_jungletree.tex")


AddRecipe("kyno_magmarock", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmarock.xml", "kyno_magmarock.tex")


AddRecipe("kyno_magmarock_gold", {Ingredient("rocks", 4), Ingredient("flint", 4), Ingredient("goldnugget", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_gold_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmarock_gold.xml", "kyno_magmarock_gold.tex")


AddRecipe("kyno_primeape_barrel", {Ingredient("cave_banana", 4), Ingredient("poop", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_primeape_barrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "primeapebarrel.tex")


AddRecipe("kyno_sharkittenden", { beachingredient4, Ingredient("spoiled_fish", 1), Ingredient("spoiled_fish_small", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sharkittenden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sharkittenden.xml", "kyno_sharkittenden.tex")


AddRecipe("kyno_mermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_mermhut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mermhut.xml", "kyno_mermhut.tex")


AddRecipe("kyno_fishermermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishermermhut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fishermermhut.xml", "kyno_fishermermhut.tex")


AddRecipe("kyno_tidalpool_small", {Ingredient("pondeel", 2), Ingredient("turf_mud", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_medium", {Ingredient("pondeel", 3), Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_medium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_big", {Ingredient("pondeel", 4), Ingredient("turf_mud", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_big_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_poisonhole", {Ingredient("poop", 2), Ingredient("spoiled_food", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_poisonhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_poisonhole.xml", "kyno_poisonhole.tex")


AddRecipe("kyno_slotmachine", {Ingredient("boards", 4), Ingredient("goldnugget", 6)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_slotmachine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_slotmachine.xml", "kyno_slotmachine.tex")


AddRecipe("kyno_wildbore_house", {Ingredient("boards", 4), Ingredient("twigs", 10), Ingredient("pigskin", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wildborehouse.tex")


AddRecipe("kyno_wildbore_head", {Ingredient("pigskin", 2), Ingredient("twigs", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wildbore_head.xml", "kyno_wildbore_head.tex")


AddRecipe("kyno_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_chiminea_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "chiminea.tex")


AddRecipe("kyno_obsidian_firepit", {Ingredient("rocks", 12), Ingredient("redgem", 8), Ingredient("log", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_obsidian_firepit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "obsidianfirepit.tex")


AddRecipe("kyno_palmleaf_hut", {Ingredient("cutgrass", 5), Ingredient("rope", 3), Ingredient("twigs", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_palmleaf_hut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "palmleaf_hut.tex")


AddRecipe("kyno_doydoy_nest",{Ingredient("twigs", 8), Ingredient("goose_feather", 2), Ingredient("tallbirdegg", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_doydoy_nest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "doydoynest.tex")


AddRecipe("kyno_icemaker", {Ingredient("heatrock", 1), Ingredient("twigs", 5), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_icemaker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "icemaker.tex")


AddRecipe("kyno_sandcastle", { beachingredient2, Ingredient("cutgrass", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandcastle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand_castle.tex")


AddRecipe("kyno_teleporter_sw", {Ingredient("boards", 2), Ingredient("cutgrass", 4), Ingredient("nightmarefuel", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_teleporter_sw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatosw.xml", "kyno_potatosw.tex")


AddRecipe("kyno_piratihatitator", {Ingredient("tophat", 1), Ingredient("robin", 1), Ingredient("boards", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_piratihatitator_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "piratihatitator.tex")


AddRecipe("kyno_buriedtreasure", {Ingredient("boneshard", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buriedtreasure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_buriedtreasure.xml", "kyno_buriedtreasure.tex")


AddRecipe("kyno_geyser", {Ingredient("charcoal", 4), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_geyser_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_krissure.xml", "kyno_krissure.tex")


AddRecipe("kyno_lavapool", {Ingredient("charcoal", 4), Ingredient("ash", 4), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_lavapool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavapool.xml", "kyno_lavapool.tex")


AddRecipe("kyno_dragoonegg", {Ingredient("rocks", 5), Ingredient("redgem", 2), Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonegg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dragoonegg.xml", "kyno_dragoonegg.tex")


AddRecipe("kyno_dragoonspit", {Ingredient("redgem", 1), Ingredient("rocks", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonspit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dragoonspit.xml", "kyno_dragoonspit.tex")


AddRecipe("kyno_sandbagsmall_item", { beachingredient2, Ingredient("rope", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_sandbagsmall_item.xml", "kyno_sandbagsmall_item.tex")


AddRecipe("wall_limestone_item", {Ingredient("cutstone", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_limestone_item.tex")


AddRecipe("wall_enforcedlimestone_land_item", {Ingredient("cutstone", 2), Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "wall_enforcedlimestone_land_item.tex")


AddRecipe("kyno_woodlegs_cage", {Ingredient("log", 5), Ingredient("rope", 2), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_woodlegs_cage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_woodlegs_cage.xml", "kyno_woodlegs_cage.tex")


AddRecipe("kyno_seal", {Ingredient("meat", 4), Ingredient("reviver", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_seal.xml", "kyno_seal.tex")


AddRecipe("kyno_tartrap", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tartrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tartrap.xml", "kyno_tartrap.tex")


AddRecipe("kyno_volcanostairs", {Ingredient("cutstone", 1), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcanostairs_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcanostairs.xml", "kyno_volcanostairs.tex")


AddRecipe("kyno_dragoonden", {Ingredient("cutstone", 2), Ingredient("charcoal", 4), Ingredient("redgem", 2)}, 
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dragoonden.tex")


AddRecipe("kyno_elephantcactus_active", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("kyno_elephantcactus", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("kyno_fakecoffeebush", {Ingredient("ash", 1), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fakecoffeebush_placer", 0, nil, nil, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")


AddRecipe("kyno_rock_obsidian", {Ingredient("rocks", 5), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_obsidian_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_obsidian.xml", "kyno_rock_obsidian.tex")


AddRecipe("kyno_rock_charcoal", {Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_charcoal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_charcoal.xml", "kyno_rock_charcoal.tex")


AddRecipe("kyno_volcano_shrub", {Ingredient("twigs", 4), Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_shrub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano_shrub.xml", "kyno_volcano_shrub.tex")


AddRecipe("kyno_altar_pillar", {Ingredient("cutstone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_altar_pillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_altar_pillar.xml", "kyno_altar_pillar.tex")


AddRecipe("kyno_volcano_altar", {Ingredient("cutstone", 3), Ingredient("nightmarefuel", 5), Ingredient("ash", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_altar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano_altar.xml", "kyno_volcano_altar.tex")


AddRecipe("kyno_workbench", {Ingredient("cutstone", 2), Ingredient("boards", 4), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_workbench_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_workbench.xml", "kyno_workbench.tex")


AddRecipe("turf_magmafield", {Ingredient("turf_rocky", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_magmafield.tex")


AddRecipe("turf_volcano", { magmaingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano.tex")


AddRecipe("turf_ash", {Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_ash.tex")


AddRecipe("turf_volcano_rock", { magmaingredient, Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano_rock.tex")


AddRecipe("turf_tidalmarsh", {Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "turf_tidalmarsh.tex")


AddRecipe("turf_jungle", {Ingredient("turf_forest", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_jungle.tex")


AddRecipe("turf_meadow", {Ingredient("turf_grass", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_meadow.tex")


AddRecipe("turf_beach", {Ingredient("turf_desertdirt", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_beach.tex")


AddRecipe("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_snakeskinfloor.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- (Recipes that currently don't have full support)
local SEA_STRUCTURES = GetModConfigData("ocean_structures")
if SEA_STRUCTURES == 0 then
AddRecipe("mangrovetree_short", {Ingredient("log", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "mangrovetree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mangrovetree.xml", "kyno_mangrovetree.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_1", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_1.xml", "kyno_wreck_1.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_2", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_2.xml", "kyno_wreck_2.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_3", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_3.xml", "kyno_wreck_3.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_4", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_4.xml", "kyno_wreck_4.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_seaweed", {Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seaweed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seaweed.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_brain_rock", {Ingredient("rocks", 3), Ingredient("meat", 4), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 50)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_brain_rock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brain_rock.xml", "kyno_brain_rock.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("wall_enforcedlimestone_item", {Ingredient("cutstone", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_enforcedlimestone_item.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_1", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_1.xml", "kyno_rock_coral_1.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_2", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_2.xml", "kyno_rock_coral_2.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_3", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_3.xml", "kyno_rock_coral_3.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_redbarrel", {Ingredient("boards", 2), Ingredient("gunpowder", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_redbarrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_redbarrel.xml", "kyno_redbarrel.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_bermudatriangle", {Ingredient("nightmarefuel", 4), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bermudatriangle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bermudatriangle.xml", "kyno_bermudatriangle.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_ballphinhouse", {Ingredient("cutstone", 3), Ingredient("fishmeat_small", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_ballphinhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "ballphinhouse.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_octopusking", {Ingredient("cutstone", 5), Ingredient("fishmeat", 10), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_octopusking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_octopusking.xml", "kyno_octopusking.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_luggagechest", {Ingredient("boards", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_luggagechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_luggagechest.xml", "kyno_luggagechest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_fishinhole", {Ingredient("pondfish", 4), Ingredient("eel", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishinhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fishinhole.xml", "kyno_fishinhole.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_buoy", {Ingredient("lantern", 1), Ingredient("twigs", 4), Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buoy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "buoy.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)

AddRecipe("kyno_sea_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sea_chiminea_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_chiminea.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_seayard", {Ingredient("log", 4), Ingredient("cutstone", 6), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seayard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_yard.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_extractor", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_extractor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "tar_extractor.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_musselfarm", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_musselfarm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "mussel_stick.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_fishfarm", {Ingredient("silk", 2), Ingredient("rope", 2), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishfarm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "fish_farm.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sealab", {Ingredient("cutstone", 4), Ingredient("transistor", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sealab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "researchlab5.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_krakenchest", {Ingredient("boards", 4), Ingredient("boneshard", 6)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_krakenchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_krakenchest.xml", "kyno_krakenchest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_waterchest", {Ingredient("boards", 3), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_waterchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "waterchest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_watercrate", {Ingredient("boards", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_watercrate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_watercrate.xml", "kyno_watercrate.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_tarpit", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tarpit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tarpit.xml", "kyno_tarpit.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_whalebubbles", {Ingredient("ice", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_whalebubbles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_whalebubbles.xml", "kyno_whalebubbles.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)  


AddRecipe("kyno_seastack", {Ingredient("rocks", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_seastack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_seastack.xml", "kyno_seastack.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_saltstack", {Ingredient("rocks", 2), Ingredient("saltrock", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_saltstack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltstack.xml", "kyno_saltstack.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_wobster_den", {Ingredient("rocks", 4), Ingredient("wobster_sheller_land", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wobster_den_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wobster_den.xml", "kyno_wobster_den.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_moon_wobster_den", {Ingredient("rocks", 4), Ingredient("moonglass", 2), Ingredient("wobster_moonglass_land", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moon_wobster_den_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wobster_den_moon.xml", "kyno_wobster_den_moon.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sea_grass", {Ingredient("dug_grass", 1), Ingredient("poop", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sea_grass_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "dug_grass.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sea_reeds", {Ingredient("cutreeds", 1), Ingredient("poop", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sea_reeds_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_reeds.xml", "kyno_reeds.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_volcano", {Ingredient("rocks", 400), Ingredient("redgem", 20), Ingredient("oceanfish_small_8_inv", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano.xml", "kyno_volcano.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_lilypad", {Ingredient("kelp", 6)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lilypad_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lilypad.xml", "kyno_lilypad.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_lotusplant", {Ingredient("kelp", 2), Ingredient("petals", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lotusplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lotusplant.xml", "kyno_lotusplant.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) end

else

-- No Sweat Mode
AddRecipe("kyno_sw_prototyper", {Ingredient("boards", 2), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sw_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "shipwrecked_entrance.tex")


AddRecipe("kyno_ham_prototyper", {Ingredient("boards", 2), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ham_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "porkland_entrance.tex")


AddRecipe("kyno_gorge_prototyper", {Ingredient("cutstone", 1), Ingredient("meatballs", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_gorge_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gnawaltar.xml", "kyno_gnawaltar.tex")


AddRecipe("kyno_canvas_blank", {Ingredient("boards", 2), Ingredient("papyrus", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas_blank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas_blank.xml", "kyno_canvas_blank.tex")


AddRecipe("kyno_canvas1", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas1.xml", "kyno_canvas1.tex")


AddRecipe("kyno_canvas2", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas2.xml", "kyno_canvas2.tex")


AddRecipe("kyno_canvas3", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas3.xml", "kyno_canvas3.tex")


AddRecipe("kyno_canvas4", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas4.xml", "kyno_canvas4.tex")


AddRecipe("kyno_canvas5", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas5.xml", "kyno_canvas5.tex")


AddRecipe("kyno_canvas6", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas6.xml", "kyno_canvas6.tex")


AddRecipe("kyno_canvas7", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas7.xml", "kyno_canvas7.tex")


AddRecipe("kyno_canvas8", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas8_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas8.xml", "kyno_canvas8.tex")


AddRecipe("kyno_canvas9", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas9_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas9.xml", "kyno_canvas9.tex")


AddRecipe("kyno_canvas10", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas10_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas10.xml", "kyno_canvas10.tex")


AddRecipe("kyno_canvas11", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas11_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas11.xml", "kyno_canvas11.tex")


AddRecipe("kyno_canvas12", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas12_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas12.xml", "kyno_canvas12.tex")


AddRecipe("kyno_canvas13", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas13_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas13.xml", "kyno_canvas13.tex")


AddRecipe("kyno_canvas14", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas14_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas14.xml", "kyno_canvas14.tex")


AddRecipe("kyno_canvas15", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas15_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas15.xml", "kyno_canvas15.tex")


AddRecipe("kyno_canvas16", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas16_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas16.xml", "kyno_canvas16.tex")


AddRecipe("kyno_canvas17", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas17_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas17.xml", "kyno_canvas17.tex")


AddRecipe("kyno_canvas18", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas18_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas18.xml", "kyno_canvas18.tex")


AddRecipe("kyno_canvas19", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas19_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas19.xml", "kyno_canvas19.tex")


AddRecipe("kyno_canvas20", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas20_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas20.xml", "kyno_canvas20.tex")


AddRecipe("kyno_canvas21", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas21_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas21.xml", "kyno_canvas21.tex")


AddRecipe("kyno_canvas22", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas22_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas22.xml", "kyno_canvas22.tex")


AddRecipe("kyno_canvas23", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas23_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas23.xml", "kyno_canvas23.tex")


AddRecipe("kyno_canvas24", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas24_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas24.xml", "kyno_canvas24.tex")


AddRecipe("kyno_canvas25", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas25_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas25.xml", "kyno_canvas25.tex")


AddRecipe("kyno_canvas26", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas26_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas26.xml", "kyno_canvas26.tex")


AddRecipe("kyno_canvas27", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas27_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas27.xml", "kyno_canvas27.tex")


AddRecipe("kyno_canvas28", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas28_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas28.xml", "kyno_canvas28.tex")


AddRecipe("kyno_canvas29", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas29_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas29.xml", "kyno_canvas29.tex")


AddRecipe("kyno_canvas30", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas30_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas30.xml", "kyno_canvas30.tex")


AddRecipe("kyno_canvas31", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas31_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas31.xml", "kyno_canvas31.tex")


AddRecipe("kyno_canvas32", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas32_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas32.xml", "kyno_canvas32.tex")


AddRecipe("kyno_canvas33", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas33_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas33.xml", "kyno_canvas33.tex")


AddRecipe("kyno_canvas34", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas34_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas34.xml", "kyno_canvas34.tex")


AddRecipe("kyno_canvas35", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas35_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas35.xml", "kyno_canvas35.tex")


AddRecipe("kyno_canvas36", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas36_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas36.xml", "kyno_canvas36.tex")


AddRecipe("kyno_canvas37", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas37_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas37.xml", "kyno_canvas37.tex")


AddRecipe("kyno_canvas38", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas38_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas38.xml", "kyno_canvas38.tex")


AddRecipe("kyno_canvas39", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas39_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas39.xml", "kyno_canvas39.tex")


AddRecipe("kyno_canvas40", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas40_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas40.xml", "kyno_canvas40.tex")


AddRecipe("kyno_canvas41", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas41_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas41.xml", "kyno_canvas41.tex")


AddRecipe("kyno_canvas42", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas42_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas42.xml", "kyno_canvas42.tex")


AddRecipe("kyno_canvas43", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas43_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas43.xml", "kyno_canvas43.tex")


AddRecipe("kyno_canvas44", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas44_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas44.xml", "kyno_canvas44.tex")


AddRecipe("kyno_canvas45", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas45_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas45.xml", "kyno_canvas45.tex")


AddRecipe("kyno_canvas46", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas46_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas46.xml", "kyno_canvas46.tex")


AddRecipe("kyno_canvas47", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas47_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas47.xml", "kyno_canvas47.tex")


AddRecipe("kyno_canvas48", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas48_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas48.xml", "kyno_canvas48.tex")


AddRecipe("kyno_canvas49", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas49_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas49.xml", "kyno_canvas49.tex")


AddRecipe("kyno_canvas50", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas50_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas50.xml", "kyno_canvas50.tex")


AddRecipe("kyno_canvas51", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas51_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas51.xml", "kyno_canvas51.tex")


AddRecipe("kyno_canvas52", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas52_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas52.xml", "kyno_canvas52.tex")


AddRecipe("kyno_canvas53", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas53_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas53.xml", "kyno_canvas53.tex")


AddRecipe("kyno_canvas54", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas54_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas54.xml", "kyno_canvas54.tex")


AddRecipe("kyno_canvas55", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas55_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas55.xml", "kyno_canvas55.tex")


AddRecipe("kyno_canvas56", {Ingredient("boards", 2), Ingredient("papyrus", 1), Ingredient("featherpencil", 1)},
kyno_painttab, TECH.SCIENCE_TWO, "kyno_canvas56_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_canvas56.xml", "kyno_canvas56.tex")


AddRecipe("kyno_plantholder_basic", {Ingredient("log", 1), Ingredient("twigs", 2), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_basic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_basic.tex")


AddRecipe("kyno_plantholder_wip", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_wip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_wip.tex")


AddRecipe("kyno_plantholder_fancy", {Ingredient("marble", 1), Ingredient("feather_crow", 1), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_fancy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_fancy.tex")


AddRecipe("kyno_plantholder_bonsai", {Ingredient("cutstone", 1), Ingredient("dug_berrybush_juicy", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_bonsai_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_bonsai.tex")


AddRecipe("kyno_plantholder_dishgarden", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_dishgarden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_dishgarden.tex")


AddRecipe("kyno_plantholder_philodendron", {Ingredient("marble", 1), Ingredient("succulent_picked", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_philodendron_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_philodendron.tex")


AddRecipe("kyno_plantholder_orchid", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 2), Ingredient("petals", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_orchid_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_orchid.tex")


AddRecipe("kyno_plantholder_draceana", {Ingredient("log", 1), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_draceana_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_draceana.tex")


AddRecipe("kyno_plantholder_palm", {Ingredient("cutgrass", 1), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_palm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_palm.tex")


AddRecipe("kyno_plantholder_zz", {Ingredient("cutgrass", 1), Ingredient("twigs", 1), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_zz_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_zz.tex")


AddRecipe("kyno_plantholder_fernstand", {Ingredient("goldnugget", 2), Ingredient("foliage", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_fernstand_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_fernstand.tex")


AddRecipe("kyno_plantholder_terrarium", {Ingredient("cutstone", 2), Ingredient("moonglass", 2), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_terrarium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_terrarium.tex")


AddRecipe("kyno_plantholder_plantpet", {Ingredient("log", 2), Ingredient("rocks", 2), Ingredient("twigs", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_plantpet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_plantpet.tex")


AddRecipe("kyno_plantholder_traps", {Ingredient("cutstone", 1), Ingredient("houndstooth", 2), Ingredient("succulent_picked", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_traps_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_traps.tex")


AddRecipe("kyno_plantholder_sadness", {Ingredient("boards", 1), Ingredient("dug_sapling", 1), Ingredient("winter_ornament_plain3", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_plantholder_sadness_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_plantholder_winterfeasttreeofsadness.tex")


AddRecipe("kyno_palace_plant", {Ingredient("cutstone", 1), Ingredient("succulent_picked", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_plant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_plant.xml", "kyno_palace_plant.tex")


AddRecipe("kyno_chair_classic", {Ingredient("marble", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_classic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_classic.tex")


AddRecipe("kyno_chair_corner", {Ingredient("boards", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_corner_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_corner.tex")


AddRecipe("kyno_chair_bench", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("turf_carpetfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_bench_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_bench.tex")


AddRecipe("kyno_chair_horned", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("turf_checkerfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_horned_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_horned.tex")


AddRecipe("kyno_chair_footrest", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_footrest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_footrest.tex")


AddRecipe("kyno_chair_lounge", {Ingredient("boards", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_lounge_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_lounge.tex")


AddRecipe("kyno_chair_massager", {Ingredient("boards", 1), Ingredient("transistor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_massager_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_massager.tex")


AddRecipe("kyno_chair_stuffed", {Ingredient("silk", 2), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_stuffed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_stuffed.tex")


AddRecipe("kyno_chair_rocking", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_rocking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_rocking.tex")


AddRecipe("kyno_chair_ottoman", {Ingredient("boards", 1), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_ottoman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_ottoman.tex")


AddRecipe("kyno_chair_chaise", {Ingredient("marble", 1), Ingredient("silk", 1), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_chair_chaise_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_chair_chaise.tex")


AddRecipe("kyno_palace_throne", {Ingredient("goldnugget", 2), Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_throne_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_throne.xml", "kyno_palace_throne.tex")


AddRecipe("kyno_rugs_round", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_round_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_round.tex")


AddRecipe("kyno_rugs_square", {Ingredient("silk", 2), Ingredient("tentaclespots", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_square_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_square.tex")


AddRecipe("kyno_rugs_oval", {Ingredient("silk", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_oval_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_oval.tex")


AddRecipe("kyno_rugs_rectangle", {Ingredient("silk", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_rectangle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_rectangle.tex")


AddRecipe("kyno_rugs_fur", {Ingredient("silk", 2), Ingredient("beefalowool", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_fur_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_fur.tex")


AddRecipe("kyno_rugs_hedgehog", {Ingredient("silk", 2), Ingredient("houndstooth", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hedgehog_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_hedgehog.tex")


AddRecipe("kyno_rugs_porcupuss", {Ingredient("silk", 2), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_porcupuss_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_porcupuss.tex")


AddRecipe("kyno_rugs_hoofprints", {Ingredient("silk", 2), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hoofprints_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_hoofprint.tex")


AddRecipe("kyno_rugs_octagon", {Ingredient("silk", 2), Ingredient("yellowgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_octagon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_octagon.tex")


AddRecipe("kyno_rugs_swirl", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_swirl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_swirl.tex")


AddRecipe("kyno_rugs_catcoon", {Ingredient("silk", 2), Ingredient("coontail", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_catcoon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_catcoon.tex")


AddRecipe("kyno_rugs_rubbermat", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_rubbermat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_rubbermat.tex")


AddRecipe("kyno_rugs_web", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_web_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_web.tex")


AddRecipe("kyno_rugs_metal", {Ingredient("silk", 2), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_metal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_metal.tex")


AddRecipe("kyno_rugs_wormhole", {Ingredient("silk", 2), Ingredient("meat", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_wormhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_wormhole.tex")


AddRecipe("kyno_rugs_braid", {Ingredient("silk", 2), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_braid_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_braid.tex")


AddRecipe("kyno_rugs_beard", {Ingredient("silk", 2), Ingredient("beardhair", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_beard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_beard.tex")


AddRecipe("kyno_rugs_nailbed", {Ingredient("silk", 2), Ingredient("houndstooth", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_nailbed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_nailbed.tex")


AddRecipe("kyno_rugs_crime", {Ingredient("silk", 2), Ingredient("reviver", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_crime_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_crime.tex")


AddRecipe("kyno_rugs_tiles", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_tiles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_rug_tiles.tex")


AddRecipe("kyno_rugs_circle", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_circle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_circle.xml", "kyno_rugs_circle.tex")


AddRecipe("kyno_rugs_moth", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_moth_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_moth.xml", "kyno_rugs_moth.tex")


AddRecipe("kyno_rugs_leather", {Ingredient("silk", 2), Ingredient("beefalowool", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_leather_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_leather.xml", "kyno_rugs_leather.tex")


AddRecipe("kyno_rugs_throneroom", {Ingredient("silk", 2), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_throneroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_throneroom.xml", "kyno_rugs_throneroom.tex")


AddRecipe("kyno_rugs_worn", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_worn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_worn.xml", "kyno_rugs_worn.tex")


AddRecipe("kyno_rugs_antiquities", {Ingredient("silk", 2), oincingredient1 },
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_antiquities_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_antiquities.xml", "kyno_rugs_antiquities.tex")


AddRecipe("kyno_rugs_bank", {Ingredient("silk", 2), oincingredient100 },
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_bank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_bank.xml", "kyno_rugs_bank.tex")


AddRecipe("kyno_rugs_deli", {Ingredient("silk", 2), Ingredient("hambat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_deli_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_deli.xml", "kyno_rugs_deli.tex")


AddRecipe("kyno_rugs_flag", {Ingredient("silk", 2), Ingredient("pigskin", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_flag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_flag.xml", "kyno_rugs_flag.tex")


AddRecipe("kyno_rugs_florist", {Ingredient("silk", 2), Ingredient("petals_evil", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_florist_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_florist.xml", "kyno_rugs_florist.tex")


AddRecipe("kyno_rugs_general", {Ingredient("silk", 2), Ingredient("shovel", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_general_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_general.xml", "kyno_rugs_general.tex")


AddRecipe("kyno_rugs_gift", {Ingredient("silk", 2), Ingredient("purplegem", 1), Ingredient("yellowgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_gift_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_gift.xml", "kyno_rugs_gift.tex")


AddRecipe("kyno_rugs_hoofspa", {Ingredient("silk", 2), Ingredient("moonglass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_hoofspa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_hoofspa.xml", "kyno_rugs_hoofspa.tex")


AddRecipe("kyno_rugs_old", {Ingredient("silk", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_old_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_old.xml", "kyno_rugs_old.tex")


AddRecipe("kyno_rugs_produce", {Ingredient("silk", 2), Ingredient("carrot", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_produce_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_produce.xml", "kyno_rugs_produce.tex")


AddRecipe("kyno_rugs_tinker", {Ingredient("silk", 2), Ingredient("blueprint", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_rugs_tinker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rugs_tinker.xml", "kyno_rugs_tinker.tex")


AddRecipe("kyno_lamps_fringe", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("silk", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_fringe_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_fringe.tex")


AddRecipe("kyno_lamps_stainglass", {Ingredient("lantern", 1), Ingredient("purplegem", 1), Ingredient("moonglass", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_stainglass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_stainglass.tex")


AddRecipe("kyno_lamps_downbridge", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("silk", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_downbridge_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_downbridge.tex")


AddRecipe("kyno_lamps_dualembroidered", {Ingredient("lantern", 1), Ingredient("moonglass", 1), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualembroidered_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2embroidered.tex")


AddRecipe("kyno_lamps_ceramic", {Ingredient("lantern", 1), Ingredient("marble", 1), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_ceramic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_ceramic.tex")


AddRecipe("kyno_lamps_glass", {Ingredient("lantern", 1), Ingredient("moonglass", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_glass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_glass.tex")


AddRecipe("kyno_lamps_dualfringes", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualfringes_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2fringes.tex")


AddRecipe("kyno_lamps_candelabra", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("torch", 3)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_candelabra_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_candelabra.tex")


AddRecipe("kyno_lamps_elizabethan", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_elizabethan_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_elizabethan.tex")


AddRecipe("kyno_lamps_gothic", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_gothic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_gothic.tex")


AddRecipe("kyno_lamps_orb", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("lightbulb", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_orb_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_orb.tex")


AddRecipe("kyno_lamps_bellshade", {Ingredient("lantern", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_bellshade_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_bellshade.tex")


AddRecipe("kyno_lamps_crystals", {Ingredient("lantern", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_crystals_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_crystals.tex")


AddRecipe("kyno_lamps_upturn", {Ingredient("lantern", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_upturn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_upturn.tex")


AddRecipe("kyno_lamps_dualupturns", {Ingredient("lantern", 1), Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_dualupturns_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_2upturns.tex")


AddRecipe("kyno_lamps_spool", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_spool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_spool.tex")


AddRecipe("kyno_lamps_edison", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_edison_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_edison.tex")


AddRecipe("kyno_lamps_adjustable", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_adjustable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_adjustable.tex")


AddRecipe("kyno_lamps_rightangles", {Ingredient("lantern", 1), Ingredient("goldnugget", 4)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_rightangles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_rightangles.tex")


AddRecipe("kyno_lamps_fancy", {Ingredient("lantern", 1), Ingredient("marble", 1), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_fancy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_hoofspa.tex")


AddRecipe("kyno_lamps_festivetree", {Ingredient("pinecone", 1), Ingredient("winter_ornament_light1", 1), Ingredient("winter_ornament_boss_deerclops", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_lamps_festivetree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_lamp_festivetree.tex")


AddRecipe("kyno_tables_round", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_round_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_round.tex")


AddRecipe("kyno_tables_banker", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_banker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_banker.tex")


AddRecipe("kyno_tables_diy", {Ingredient("boards", 1), Ingredient("twigs", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_diy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_diy.tex")


AddRecipe("kyno_tables_raw", {Ingredient("boards", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_raw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_raw.tex")


AddRecipe("kyno_tables_crate", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_crate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_crate.tex")


AddRecipe("kyno_tables_chess", {Ingredient("boards", 1), Ingredient("trinket_28", 1), Ingredient("trinket_16", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_tables_chess_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "reno_table_chess.tex")


AddRecipe("kyno_accademia_woodtable", {Ingredient("boards", 1), Ingredient("moonglass", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_woodtable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table.xml", "kyno_accademia_table.tex")


AddRecipe("kyno_accademia_booktable", {Ingredient("boards", 1), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_booktable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table_books.xml", "kyno_accademia_table_books.tex")


AddRecipe("kyno_accademia_wiptable", {Ingredient("boards", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_wiptable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_table_wip.xml", "kyno_accademia_table_wip.tex")


AddRecipe("kyno_interior_parts", {Ingredient("boards", 1), Ingredient("moonglass", 1), Ingredient("gears", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_parts_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_tableparts.xml", "kyno_interior_tableparts.tex")


AddRecipe("kyno_accademia_anvil", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_anvil_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_anvil.xml", "kyno_accademia_anvil.tex")


AddRecipe("kyno_accademia_stoneblock", {Ingredient("marble", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_stoneblock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_stoneblock.xml", "kyno_accademia_stoneblock.tex")


AddRecipe("kyno_accademia_vase", {Ingredient("marble", 1), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_vase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_vase.xml", "kyno_accademia_vase.tex")


AddRecipe("kyno_accademia_pottingwheel", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel.xml", "kyno_accademia_pottingwheel.tex")


AddRecipe("kyno_accademia_pottingwheelurn", {Ingredient("boards", 1), Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelurn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_urn.xml", "kyno_accademia_pottingwheel_urn.tex")


AddRecipe("kyno_accademia_pottingwheelclay", {Ingredient("boards", 1), Ingredient("rocks", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelclay_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_clay.xml", "kyno_accademia_pottingwheel_clay.tex")


AddRecipe("kyno_accademia_pottingwheelwip", {Ingredient("boards", 1), Ingredient("cutstone", 1), Ingredient("hammer", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_pottingwheelwip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_pottingwheel_wip.xml", "kyno_accademia_pottingwheel_wip.tex")


AddRecipe("kyno_accademia_velvetback", {Ingredient("goldnugget", 2), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_velvetback_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_velvetback.xml", "kyno_accademia_velvetback.tex")


AddRecipe("kyno_accademia_velvetside", {Ingredient("goldnugget", 2), Ingredient("redgem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_accademia_velvetside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_accademia_velvetside.xml", "kyno_accademia_velvetside.tex")


AddRecipe("kyno_arcane_bookcase", {Ingredient("livinglog", 3), Ingredient("papyrus", 2), Ingredient("nightmarefuel", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_bookcase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_bookcase.xml", "kyno_arcane_bookcase.tex")


AddRecipe("kyno_arcane_chestclosed", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_chestclosed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_chestclosed.xml", "kyno_arcane_chestclosed.tex")


AddRecipe("kyno_arcane_chestopen", {Ingredient("boards", 1), Ingredient("blueprint", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_chestopen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_chestopen.xml", "kyno_arcane_chestopen.tex")


AddRecipe("kyno_arcane_containers", {Ingredient("marble", 1), Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_containers_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_containers.xml", "kyno_arcane_containers.tex")


AddRecipe("kyno_arcane_tablemagic", {Ingredient("boards", 1), Ingredient("turf_carpetfloor", 1), Ingredient("trinket_32", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_tablemagic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_tablemagic.xml", "kyno_arcane_tablemagic.tex")


AddRecipe("kyno_arcane_tabledistillery", {Ingredient("boards", 1), Ingredient("trinket_35", 1), Ingredient("nightmarefuel", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_arcane_tabledistillery_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_arcane_tabledistillery.xml", "kyno_arcane_tabledistillery.tex")


AddRecipe("kyno_deli_stackside", {Ingredient("cutgrass", 2), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_deli_stackside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_deli_stackside.xml", "kyno_deli_stackside.tex")


AddRecipe("kyno_deli_stackfront", {Ingredient("cutgrass", 2), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_deli_stackfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_deli_stackfront.xml", "kyno_deli_stackfront.tex")


AddRecipe("kyno_florist_latticefront", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_latticefront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_latticefront.xml", "kyno_florist_latticefront.tex")


AddRecipe("kyno_florist_latticeside", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_latticeside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_latticeside.xml", "kyno_florist_latticeside.tex")


AddRecipe("kyno_florist_pillarfront", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_pillarfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_pillarfront.xml", "kyno_florist_pillarfront.tex")


AddRecipe("kyno_florist_pillarside", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("petals", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_pillarside_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_pillarside.xml", "kyno_florist_pillarside.tex")


AddRecipe("kyno_florist_tiered", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_florist_tiered_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_florist_tiered.xml", "kyno_florist_tiered.tex")


AddRecipe("kyno_mayoroffice_bookcase", {Ingredient("boards", 2), Ingredient("papyrus", 2), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_mayoroffice_bookcase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mayoroffice_bookcase.xml", "kyno_mayoroffice_bookcase.tex")


AddRecipe("kyno_mayoroffice_desk", {Ingredient("boards", 2), Ingredient("lantern", 1), Ingredient("featherpencil", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_mayoroffice_desk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mayoroffice_desk.xml", "kyno_mayoroffice_desk.tex")


AddRecipe("kyno_millinery_hatbox1", {Ingredient("boards", 1), Ingredient("tophat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_hatbox1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_hatbox1.xml", "kyno_millinery_hatbox1.tex")


AddRecipe("kyno_millinery_hatbox2", {Ingredient("boards", 1), Ingredient("winterhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_hatbox2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_hatbox2.xml", "kyno_millinery_hatbox2.tex")


AddRecipe("kyno_millinery_sewingmachine", {Ingredient("cutstone", 2), Ingredient("sewing_kit", 3), Ingredient("gears", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_sewingmachine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_sewingmachine.xml", "kyno_millinery_sewingmachine.tex")


AddRecipe("kyno_millinery_worktable", {Ingredient("boards", 1), Ingredient("papyrus", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_millinery_worktable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_millinery_worktable.xml", "kyno_millinery_worktable.tex")


AddRecipe("kyno_palace_pillar", {Ingredient("marble", 1), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_palace_pillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_palace_pillar.xml", "kyno_palace_pillar.tex")


AddRecipe("kyno_interior_baskets", {Ingredient("boards", 1), Ingredient("cutgrass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_baskets_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_baskets.xml", "kyno_interior_baskets.tex")


AddRecipe("kyno_interior_bin", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_bin_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_bin.xml", "kyno_interior_bin.tex")


AddRecipe("kyno_interior_cans", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_cans_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_cans.xml", "kyno_interior_cans.tex")


AddRecipe("kyno_interior_display", {Ingredient("marble", 1), Ingredient("goldnugget", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_display_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_display.xml", "kyno_interior_display.tex")


AddRecipe("kyno_interior_endtable", {Ingredient("boards", 1), Ingredient("taffy", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_endtable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_endtable.xml", "kyno_interior_endtable.tex")


AddRecipe("kyno_interior_rollholder", {Ingredient("boards", 1), Ingredient("blueprint", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_rollholder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_rollholder.xml", "kyno_interior_rollholder.tex")


AddRecipe("kyno_interior_rollholderfront", {Ingredient("boards", 1), Ingredient("blueprint", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_rollholderfront_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_rollholderfront.xml", "kyno_interior_rollholderfront.tex")


AddRecipe("kyno_interior_vase", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_vase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_vase.xml", "kyno_interior_vase.tex")


AddRecipe("kyno_interior_urn", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_urn.xml", "kyno_interior_urn.tex")


AddRecipe("kyno_interior_vasemarble", {Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_vasemarble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_vasemarble.xml", "kyno_interior_vasemarble.tex")


AddRecipe("kyno_interior_wired", {Ingredient("fence_item", 1), Ingredient("petals", 1), Ingredient("papyrus", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_interior_wired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_interior_wired.xml", "kyno_interior_wired.tex")


AddRecipe("kyno_containers_box1", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box1.xml", "kyno_containers_box1.tex")


AddRecipe("kyno_containers_box2", {Ingredient("boards", 1), Ingredient("tophat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box2.xml", "kyno_containers_box2.tex")


AddRecipe("kyno_containers_box3", {Ingredient("boards", 1), Ingredient("winterhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box3.xml", "kyno_containers_box3.tex")


AddRecipe("kyno_containers_box4", {Ingredient("boards", 1), Ingredient("strawhat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box4.xml", "kyno_containers_box4.tex")


AddRecipe("kyno_containers_box5", {Ingredient("boards", 1), Ingredient("beefalohat", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box5.xml", "kyno_containers_box5.tex")


AddRecipe("kyno_containers_box6", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box6.xml", "kyno_containers_box6.tex")


AddRecipe("kyno_containers_box7", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box7.xml", "kyno_containers_box7.tex")


AddRecipe("kyno_containers_box8", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box8_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box8.xml", "kyno_containers_box8.tex")


AddRecipe("kyno_containers_box9", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box9_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box9.xml", "kyno_containers_box9.tex")


AddRecipe("kyno_containers_box10", {Ingredient("papyrus", 1), Ingredient("rope", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box10_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box10.xml", "kyno_containers_box10.tex")


AddRecipe("kyno_containers_box11", {Ingredient("papyrus", 1), Ingredient("rope", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box11_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box11.xml", "kyno_containers_box11.tex")


AddRecipe("kyno_containers_box12", {Ingredient("cutgrass", 2)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box12_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box12.xml", "kyno_containers_box12.tex")


AddRecipe("kyno_containers_box13", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box13_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box13.xml", "kyno_containers_box13.tex")


AddRecipe("kyno_containers_box14", {Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box14_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box14.xml", "kyno_containers_box14.tex")


AddRecipe("kyno_containers_box15", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box15_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box15.xml", "kyno_containers_box15.tex")


AddRecipe("kyno_containers_box16", {Ingredient("boards", 1)},
kyno_housetab, TECH.SCIENCE_TWO, "kyno_containers_box16_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_containers_box16.xml", "kyno_containers_box16.tex")


AddRecipe("turf_marbletile", {Ingredient("marble", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_marbletile.tex")


AddRecipe("turf_chess", {Ingredient("turf_checkerfloor", 1), Ingredient("turf_road", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_chess.tex")


AddRecipe("turf_slate", {Ingredient("rocks", 1), Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_slate.tex")


AddRecipe("turf_metalsheet", {Ingredient("cutstone", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_metalsheet.tex")


AddRecipe("turf_garden", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_garden.tex")


AddRecipe("turf_geometric", {Ingredient("turf_checkerfloor", 1), Ingredient("bluegem", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_geometric.tex")


AddRecipe("turf_shagcarpet", {Ingredient("turf_carpetfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_shagcarpet.tex")


AddRecipe("turf_transitional", {Ingredient("turf_checkerfloor", 1), Ingredient("turf_woodfloor", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_transitional.tex")


AddRecipe("turf_woodpanel", {Ingredient("turf_woodfloor", 2)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_woodpanel.tex")


AddRecipe("turf_herring", {Ingredient("boneshard", 1), Ingredient("turf_road", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_herring.tex")


AddRecipe("turf_hexagon", {Ingredient("turf_checkerfloor", 1), Ingredient("cutstone", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_hexagon.tex")


AddRecipe("turf_hoof", {Ingredient("cutstone", 1), Ingredient("pigskin", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_hoof.tex")


AddRecipe("turf_octagon", {Ingredient("turf_checkerfloor", 1), Ingredient("marble", 1)},
kyno_housetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "turf_octagon.tex")


AddRecipe("kyno_pugna", {Ingredient("hambat", 1), Ingredient("meat", 4), Ingredient("reviver", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_pugna_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pugna.xml", "kyno_pugna.tex")


AddRecipe("cave_fern", {Ingredient("foliage", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_cavefern_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "foliage.tex")


AddRecipe("flower_withered", {Ingredient("cutgrass", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flower_withered_placer", 0, nil, nil, nil, "images/kyno_flowerwithered.xml", "kyno_flowerwithered.tex")


AddRecipe("kyno_plant_algae", {Ingredient("cutlichen", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_plant_algae_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_caveplant.xml", "kyno_caveplant.tex")


AddRecipe("kyno_flowerlightone", {Ingredient("lightbulb", 1), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightone.xml", "kyno_flowerlightone.tex")


AddRecipe("kyno_flowerlightspringy", {Ingredient("lightbulb", 1), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightspringy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightspringy.xml", "kyno_flowerlightspringy.tex")


AddRecipe("kyno_flowerlighttwo", {Ingredient("lightbulb", 2), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlighttwo_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlighttwo.xml", "kyno_flowerlighttwo.tex")


AddRecipe("kyno_flowerlightthree", {Ingredient("lightbulb", 3), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_flowerlightthree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flowerlightthree.xml", "kyno_flowerlightthree.tex")


AddRecipe("kyno_mushtree_medium", {Ingredient("log", 2), Ingredient("red_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_redmushtree_placer", 0, nil, nil, nil, "images/kyno_redmushtree.xml", "kyno_redmushtree.tex")


AddRecipe("kyno_mushtree_small", {Ingredient("log", 2), Ingredient("green_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_greenmushtree_placer", 0, nil, nil, nil, "images/kyno_greenmushtree.xml", "kyno_greenmushtree.tex")


AddRecipe("kyno_mushtree_tall", {Ingredient("log", 2), Ingredient("blue_cap", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bluemushtree_placer", 0, nil, nil, nil, "images/kyno_bluemushtree.xml", "kyno_bluemushtree.tex")


AddRecipe("kyno_mushtree_tall_webbed", {Ingredient("log", 2), Ingredient("blue_cap", 1), Ingredient("silk", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_webbedmushtree_placer", 0, nil, nil, nil, "images/kyno_webbedmushtree.xml", "kyno_webbedmushtree.tex")


AddRecipe("kyno_stump6", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump6.xml", "kyno_stump6.tex")


AddRecipe("kyno_stump7", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump7.xml", "kyno_stump7.tex")


AddRecipe("kyno_stump8", {Ingredient("log", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stump6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump8.xml", "kyno_stump8.tex")


AddRecipe("kyno_stalagmite_full", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitefull_placer", 0, nil, nil, nil, "images/kyno_stalagmitefull.xml", "kyno_stalagmitefull.tex")


AddRecipe("kyno_stalagmite_med", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitemed_placer", 0, nil, nil, nil, "images/kyno_stalagmitemed.xml", "kyno_stalagmitemed.tex")


AddRecipe("kyno_stalagmite_low", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitelow_placer", 0, nil, nil, nil, "images/kyno_stalagmitelow.xml", "kyno_stalagmitelow.tex")


AddRecipe("kyno_stalagmite_tall_full", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_full_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_full.xml", "kyno_stalagmitetall_full.tex")


AddRecipe("kyno_stalagmite_tall_med", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_med_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_med.xml", "kyno_stalagmitetall_med.tex")


AddRecipe("kyno_stalagmite_tall_low", {Ingredient("rocks", 3), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_stalagmitetall_low_placer", 0, nil, nil, nil, "images/kyno_stalagmitetall_low.xml", "kyno_stalagmitetall_low.tex")


AddRecipe("kyno_spiderhole", {Ingredient("rocks", 3), Ingredient("silk", 2), Ingredient("flint", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_spiderhole_placer", 0, nil, nil, nil, "images/kyno_spiderhole.xml", "kyno_spiderhole.tex")


AddRecipe("kyno_batiliskden", {Ingredient("guano", 3), Ingredient("batwing", 3), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_batiliskden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batiliskden.xml", "kyno_batiliskden.tex")


AddRecipe("kyno_pondcave", {Ingredient("ice", 4), Ingredient("eel", 2), Ingredient("cutlichen", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pondcave_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondcave.xml", "kyno_pondcave.tex")


AddRecipe("kyno_toadhole", {Ingredient("shovel", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadhole.xml", "kyno_toadhole.tex")


AddRecipe("kyno_toadstoolcap", {Ingredient("shroom_skin", 1), Ingredient("green_cap", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadstoolcap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadstoolcap.xml", "kyno_toadstoolcap.tex")


AddRecipe("kyno_toadstoolcap_dark", {Ingredient("shroom_skin", 1), Ingredient("green_cap", 3), Ingredient("canary", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_toadstoolcap_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_toadstoolcap_dark.xml", "kyno_toadstoolcap_dark.tex")


AddRecipe("kyno_sporecap", {Ingredient("green_cap", 2), Ingredient("log", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sporecap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sporecap.xml", "kyno_sporecap.tex")


AddRecipe("kyno_sporecap_dark", {Ingredient("green_cap", 2), Ingredient("log", 2), Ingredient("spoiled_food", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sporecap_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sporecap_dark.xml", "kyno_sporecap_dark.tex")


AddRecipe("kyno_boomshroom", {Ingredient("green_cap", 2), Ingredient("spoiled_food", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_boomshroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boomshroom.xml", "kyno_boomshroom.tex")


AddRecipe("kyno_boomshroom_dark", {Ingredient("blue_cap", 2), Ingredient("spoiled_food", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_boomshroom_dark_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boomshroom_dark.xml", "kyno_boomshroom_dark.tex")


AddRecipe("kyno_tentaclehole", {Ingredient("tentaclespots", 2), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_tentaclehole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tentaclehole.xml", "kyno_tentaclehole.tex")


AddRecipe("kyno_bigtentacle", {Ingredient("tentaclespots", 2), Ingredient("tentaclespike", 1), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bigtentacle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bigtentacle.xml", "kyno_bigtentacle.tex")


AddRecipe("kyno_nightmarefissure", {Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_nightmarefissure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarefissure.xml", "kyno_nightmarefissure.tex")


AddRecipe("kyno_nightmarefissure_ruins", {Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_nightmarefissure_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarefissure_ruins.xml", "kyno_nightmarefissure_ruins.tex")


AddRecipe("kyno_slurtlehole", {Ingredient("slurtle_shellpieces", 2), Ingredient("slurtleslime", 2), Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_slurtlehole_placer", 0, nil, nil, nil, "images/kyno_slurtlehole.xml", "kyno_slurtlehole.tex")


AddRecipe("kyno_wormlight", {Ingredient("wormlight_lesser", 1), Ingredient("poop", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_wormlight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormlight.xml", "kyno_wormlight.tex")


AddRecipe("cavein_boulder", {Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "cavein_boulder.tex")


AddRecipe("kyno_ruinshole", {Ingredient("shovel", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinshole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_caveholeitems.xml", "kyno_caveholeitems.tex")


AddRecipe("kyno_lichenplant", {Ingredient("cutlichen", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lichenplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lichenplant.xml", "kyno_lichenplant.tex")


AddRecipe("kyno_lichenplant_legacy", {Ingredient("cutlichen", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lichenplant_legacy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lichenplant_legacy.xml", "kyno_lichenplant_legacy.tex")


AddRecipe("kyno_cave_banana_tree", {Ingredient("cave_banana", 3), Ingredient("log", 2), Ingredient("twigs", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_bananatree_placer", 0, nil, nil, nil, "images/kyno_bananatree.xml", "kyno_bananatree.tex")


AddRecipe("kyno_monkeybarrel", {Ingredient("cave_banana", 2), Ingredient("log", 4), Ingredient("poop", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_monkeybarrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_splumonkeypod.xml", "kyno_splumonkeypod.tex")


AddRecipe("kyno_barrel", {Ingredient("cave_banana", 2), Ingredient("boards", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_barrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_monkeybarrel.xml", "kyno_monkeybarrel.tex")


AddRecipe("kyno_ruinsbowl", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsbowl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsbowl.xml", "kyno_ruinsbowl.tex")


AddRecipe("kyno_ruinschair", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinschair_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinschair.xml", "kyno_ruinschair.tex")


AddRecipe("kyno_ruinschipbowl", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinschipbowl_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinschipbowl.xml", "kyno_ruinschipbowl.tex")


AddRecipe("kyno_ruinsplate", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsplate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsplate.xml", "kyno_ruinsplate.tex")


AddRecipe("kyno_ruinstable", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinstable_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinstable.xml", "kyno_ruinstable.tex")


AddRecipe("kyno_ruinsvase", {Ingredient("rocks", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsvase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsvase.xml", "kyno_ruinsvase.tex")


AddRecipe("kyno_brokenbits_full", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenbits_full_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenbits.xml", "kyno_brokenbits.tex")


AddRecipe("kyno_sinkhole_ruins", {Ingredient("thulecite_pieces", 6)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_sinkhole_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkhole_ruins.xml", "kyno_sinkhole_ruins.tex")


AddRecipe("kyno_statueruins_nogem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_nogem.xml", "kyno_statueruins_nogem.tex")


AddRecipe("kyno_statueruins_bluegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("bluegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_bluegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_bluegem.xml", "kyno_statueruins_bluegem.tex")


AddRecipe("kyno_statueruins_redgem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("redgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_redgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_redgem.xml", "kyno_statueruins_redgem.tex")


AddRecipe("kyno_statueruins_purplegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("purplegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_purplegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_purplegem.xml", "kyno_statueruins_purplegem.tex")


AddRecipe("kyno_statueruins_orangegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("orangegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_orangegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_orangegem.xml", "kyno_statueruins_orangegem.tex")


AddRecipe("kyno_statueruins_yellowgem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("yellowgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_yellowgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_yellowgem.xml", "kyno_statueruins_yellowgem.tex")


AddRecipe("kyno_statueruins_greengem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("greengem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_greengem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_greengem.xml", "kyno_statueruins_greengem.tex")


AddRecipe("kyno_statueruins_small_nogem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_nogem.xml", "kyno_statueruins_small_nogem.tex")


AddRecipe("kyno_statueruins_small_bluegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("bluegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_bluegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_bluegem.xml", "kyno_statueruins_small_bluegem.tex")


AddRecipe("kyno_statueruins_small_redgem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("redgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_redgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_redgem.xml", "kyno_statueruins_small_redgem.tex")


AddRecipe("kyno_statueruins_small_purplegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("purplegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_purplegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_purplegem.xml", "kyno_statueruins_small_purplegem.tex")


AddRecipe("kyno_statueruins_small_orangegem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("orangegem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_orangegem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_orangegem.xml", "kyno_statueruins_small_orangegem.tex")


AddRecipe("kyno_statueruins_small_yellowgem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("yellowgem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_yellowgem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_yellowgem.xml", "kyno_statueruins_small_yellowgem.tex")


AddRecipe("kyno_statueruins_small_greengem", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2), Ingredient("greengem", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueruins_small_greengem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueruins_small_greengem.xml", "kyno_statueruins_small_greengem.tex")


AddRecipe("kyno_ruinsnightmarelight", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 3), Ingredient("cutstone", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ruinsnightmarelight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinsnightmarelight.xml", "kyno_ruinsnightmarelight.tex")


AddRecipe("kyno_brokenclockwork1", {Ingredient("gears", 1), Ingredient("trinket_6", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork1.xml", "kyno_brokenclockwork1.tex")


AddRecipe("kyno_brokenclockwork2", {Ingredient("gears", 1), Ingredient("trinket_6", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork2.xml", "kyno_brokenclockwork2.tex")


AddRecipe("kyno_brokenclockwork3", {Ingredient("gears", 1), Ingredient("trinket_6", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_brokenclockwork3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brokenclockwork3.xml", "kyno_brokenclockwork3.tex")


AddRecipe("kyno_ornatechest", {Ingredient("boards", 1), Ingredient("thulecite", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ornatechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ornatechest.xml", "kyno_ornatechest.tex")


AddRecipe("kyno_ornatechest_large", {Ingredient("boards", 2), Ingredient("thulecite", 3)},
kyno_cavetab, TECH.LOST, "kyno_ornatechest_large_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ornatechest_large.xml", "kyno_ornatechest_large.tex")


AddRecipe("kyno_ancient_altar_broken", {Ingredient("thulecite", 24), Ingredient("purplegem", 2), Ingredient("minotaurhorn", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_ancient_altar_broken_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_apss_broken.xml", "kyno_apss_broken.tex")


AddRecipe("kyno_pillar_stalactite", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_stalactite_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_stalactite.xml", "kyno_pillar_stalactite.tex")


AddRecipe("kyno_pillar_cave", {Ingredient("rocks", 4), Ingredient("flint", 4), Ingredient("nitre", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_cave_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_cave.xml", "kyno_pillar_cave.tex")


AddRecipe("kyno_pillar_flintless", {Ingredient("rocks", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_flintless_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_flintless.xml", "kyno_pillar_flintless.tex")


AddRecipe("kyno_pillar_rock", {Ingredient("rocks", 4), Ingredient("flint", 4), Ingredient("nitre", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_rock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_rock.xml", "kyno_pillar_rock.tex")


AddRecipe("kyno_pillar_algae", {Ingredient("cutlichen", 4), Ingredient("slurtleslime", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_algae_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_algae.xml", "kyno_pillar_algae.tex")


AddRecipe("kyno_pillar_ruins", {Ingredient("thulecite_pieces", 4), Ingredient("thulecite", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_ruins_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_ruins.xml", "kyno_pillar_ruins.tex")


AddRecipe("kyno_pillar_atrium", {Ingredient("rocks", 4), Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_atrium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_atrium.xml", "kyno_pillar_atrium.tex")


AddRecipe("kyno_pillar_atrium_on", {Ingredient("rocks", 4), Ingredient("nightmarefuel", 2), Ingredient("purplegem", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_pillar_atrium_on_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pillar_atrium_on.xml", "kyno_pillar_atrium_on.tex")


AddRecipe("kyno_surfacestairs", {Ingredient("rocks", 5)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs.xml", "kyno_surfacestairs.tex")


AddRecipe("kyno_surfacestairs_closed", {Ingredient("rocks", 5)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_closed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs_closed.xml", "kyno_surfacestairs_closed.tex")


AddRecipe("kyno_surfacestairs_vip", {Ingredient("rocks", 5)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_surfacestairs_vip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_surfacestairs_vip.xml", "kyno_surfacestairs_vip.tex")


AddRecipe("kyno_lsr_nogem", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lsr_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacyruins_nogem.xml", "kyno_legacyruins_nogem.tex")


AddRecipe("kyno_lsr_small_nogem", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_lsr_small_nogem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacyruins_small_nogem.xml", "kyno_legacyruins_small_nogem.tex")


AddRecipe("wall_legacyruins_item", {Ingredient("thulecite", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 6, nil, "images/inventoryimages/kyno_legacyruins_wall.xml", "kyno_legacyruins_wall.tex")


AddRecipe("kyno_shadowchanneler", {Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_shadowchanneler_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shadowhand.xml", "kyno_shadowhand.tex")


AddRecipe("kyno_statueatrium", {Ingredient("thulecite", 2), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_statueatrium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueatrium.xml", "kyno_statueatrium.tex")


AddRecipe("kyno_atriumrubble1", {Ingredient("cutstone", 1), Ingredient("thulecite_pieces", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumrubble1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumrubble1.xml", "kyno_atriumrubble1.tex")


AddRecipe("kyno_atriumrubble2", {Ingredient("cutstone", 1), Ingredient("thulecite_pieces", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumrubble2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumrubble2.xml", "kyno_atriumrubble2.tex")


AddRecipe("kyno_atriumbeacon", {Ingredient("cutstone", 1), Ingredient("thulecite", 1), Ingredient("nightmarefuel", 5)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumbeacon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumbeacon.xml", "kyno_atriumbeacon.tex")


AddRecipe("kyno_atriumobelisk", {Ingredient("cutstone", 2), Ingredient("thulecite", 3), Ingredient("nightmarefuel", 4)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumobelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumobelisk.xml", "kyno_atriumobelisk.tex")


AddRecipe("kyno_atriumfence", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumfence_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_atriumfence.xml", "kyno_atriumfence.tex")


AddRecipe("kyno_atriumgateway_wip", {Ingredient("thulecite", 5), Ingredient("sewing_tape", 2), Ingredient("cutstone", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, "kyno_atriumgateway_wip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ancientgateway_wip.xml", "kyno_ancientgateway_wip.tex")


AddRecipe("kyno_atriumgateway", {Ingredient("thulecite", 5), Ingredient("nightmarefuel", 5), Ingredient("cutstone", 2)},
kyno_cavetab, TECH.LOST, "kyno_atriumgateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ancientgateway.xml", "kyno_ancientgateway.tex")


AddRecipe("turf_sinkhole", {Ingredient("turf_grass", 2), Ingredient("poop", 1)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_sinkhole.tex")


AddRecipe("turf_underrock", {Ingredient("rocks", 3)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_underrock.tex")


AddRecipe("turf_cave", {Ingredient("guano", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_cave.tex")


AddRecipe("turf_fungus_red", {Ingredient("red_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus_red.tex")


AddRecipe("turf_fungus_green", {Ingredient("green_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus_green.tex")


AddRecipe("turf_fungus", {Ingredient("blue_cap", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_fungus.tex")


AddRecipe("turf_mud", {Ingredient("turf_marsh", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_mud.tex")


AddRecipe("turf_ruinsbrick", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinsbrick.tex")


AddRecipe("turf_ruinsbricktrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinsbricktrim.tex")


AddRecipe("turf_ruinstile", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstile.tex")


AddRecipe("turf_ruinstiletrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstiletrim.tex")


AddRecipe("turf_ruinstrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstrim.tex")


AddRecipe("turf_ruinstrimtrim", {Ingredient("thulecite", 2)},
kyno_cavetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_ruinstrimtrim.tex")


AddRecipe("dug_berrybush", {Ingredient("berries", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush.tex")


AddRecipe("dug_berrybush2", {Ingredient("dug_berrybush", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush2.tex")


AddRecipe("dug_berrybush_juicy", {Ingredient("berries_juicy", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_berrybush_juicy.tex")


AddRecipe("dug_grass", {Ingredient("cutgrass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_grass.tex")


AddRecipe("dug_sapling", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_sapling.tex")


AddRecipe("dug_marsh_bush", {Ingredient("dug_sapling", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "dug_marsh_bush.tex")


AddRecipe("kyno_reeds", {Ingredient("cutreeds", 4), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_reeds_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_reeds.xml", "kyno_reeds.tex")


AddRecipe("dug_sapling_moon", {Ingredient("dug_sapling", 1), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_sapling_moon.tex")


AddRecipe("dug_rock_avocado_bush", { avocadoingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_rock_avocado_bush.tex")


AddRecipe("dug_trap_starfish", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_trap_starfish.tex")

-- This shit wasn't working LOL.
AddRecipe("kyno_burntmarsh", {Ingredient("ash", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burntmarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burntmarsh.xml", "kyno_burntmarsh.tex")


AddRecipe("red_mushroom", {Ingredient("red_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_red_mushroom_placer", 0, nil, nil, nil, "images/kyno_redmush.xml", "kyno_redmush.tex")


AddRecipe("green_mushroom", {Ingredient("green_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_green_mushroom_placer", 0, nil, nil, nil, "images/kyno_greenmush.xml", "kyno_greenmush.tex")


AddRecipe("blue_mushroom", {Ingredient("blue_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_blue_mushroom_placer", 0, nil, nil, nil, "images/kyno_bluemush.xml", "kyno_bluemush.tex")


AddRecipe("flower_rose", {Ingredient("petals", 1), Ingredient("stinger", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rose_placer", 0, nil, nil, nil, "images/kyno_rose.xml", "kyno_rose.tex")


AddRecipe("kyno_cactus", {Ingredient("cactus_meat", 1), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cactus.xml", "kyno_cactus.tex")


AddRecipe("kyno_oasis_cactus", {Ingredient("cactus_meat", 1), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_oasis_cactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_oasis_cactus.xml", "kyno_oasis_cactus.tex")


AddRecipe("kyno_tumbleweed", {Ingredient("cutgrass", 1), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tumbleweed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tumbleweed.xml", "kyno_tumbleweed.tex")


AddRecipe("mandrake_planted", {Ingredient("mandrake", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mandrake_planted_placer", 0, nil, nil, nil, "images/kyno_mandrake_planted.xml", "kyno_mandrake_planted.tex")


AddRecipe("carrot_planted", {Ingredient("carrot", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_carrotplanted_placer", 0, nil, nil, nil, "images/kyno_carrot_planted.xml", "kyno_carrot_planted.tex")


AddRecipe("kyno_marsh_plant", {Ingredient("succulent_picked", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_plant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_marshplant.xml", "kyno_marshplant.tex")


AddRecipe("succulent_plant", {Ingredient("succulent_picked", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_succulent_plant_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "succulent_picked.tex")


AddRecipe("kyno_pondrock", {Ingredient("rocks", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedrock.xml", "kyno_scorchedrock.tex")


AddRecipe("kyno_scorchedground", {Ingredient("ash", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedground_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedground.xml", "kyno_scorchedground.tex")


AddRecipe("kyno_burnttree_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree2_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree3_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree4_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree5", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_burnttree5.xml", "kyno_burnttree5.tex")


AddRecipe("kyno_stump_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_short.xml", "kyno_stump_short.tex")


AddRecipe("kyno_stump_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_normal.xml", "kyno_stump_normal.tex")


AddRecipe("kyno_stump_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump_tall.xml", "kyno_stump_tall.tex")


AddRecipe("kyno_stump2_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_short.xml", "kyno_stump2_short.tex")


AddRecipe("kyno_stump2_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_normal.xml", "kyno_stump2_normal.tex")


AddRecipe("kyno_stump2_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump2_tall.xml", "kyno_stump2_tall.tex")


AddRecipe("kyno_stump3_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_short.xml", "kyno_stump3_short.tex")


AddRecipe("kyno_stump3_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_normal.xml", "kyno_stump3_normal.tex")


AddRecipe("kyno_stump3_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_tall.xml", "kyno_stump3_tall.tex")


AddRecipe("kyno_stump3_old", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_old_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump3_old.xml", "kyno_stump3_old.tex")


AddRecipe("kyno_stump4_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_short.xml", "kyno_stump4_short.tex")


AddRecipe("kyno_stump4_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_normal.xml", "kyno_stump4_normal.tex")


AddRecipe("kyno_stump4_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump4_tall.xml", "kyno_stump4_tall.tex")


AddRecipe("kyno_stump5", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stump5.xml", "kyno_stump5.tex")


AddRecipe("lumpy_sapling", {Ingredient("pinecone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lumpy_sapling_placer", 0, nil, nil, nil, "images/kyno_lumpysapling.xml", "kyno_lumpysapling.tex")


AddRecipe("kyno_marsh_tree", {Ingredient("log", 3), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_tree_placer", 0, nil, nil, nil, "images/kyno_marsh_tree.xml", "kyno_marsh_tree.tex")


AddRecipe("rock_petrified_tree_short", {Ingredient("rocks", 1), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_short_placer", 0, nil, nil, nil, "images/kyno_rocktree_short.xml", "kyno_rocktree_short.tex")


AddRecipe("rock_petrified_tree_med", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_placer", 0, nil, nil, nil, "images/kyno_rocktree.xml", "kyno_rocktree.tex")


AddRecipe("rock_petrified_tree_tall", {Ingredient("rocks", 3), Ingredient("nitre", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_tall_placer", 0, nil, nil, nil, "images/kyno_rocktree_tall.xml", "kyno_rocktree_tall.tex")


AddRecipe("rock_petrified_tree_old", {Ingredient("rocks", 2), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_old_placer", 0, nil, nil, nil, "images/kyno_rocktree_old.xml", "kyno_rocktree_old.tex")


AddRecipe("kyno_marbletree_1", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree1_placer", 0, nil, nil, nil, "images/kyno_marbletree1.xml", "kyno_marbletree1.tex")


AddRecipe("kyno_marbletree_2", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree2_placer", 0, nil, nil, nil, "images/kyno_marbletree2.xml", "kyno_marbletree2.tex")


AddRecipe("kyno_marbletree_3", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree3_placer", 0, nil, nil, nil, "images/kyno_marbletree3.xml", "kyno_marbletree3.tex")


AddRecipe("kyno_marbletree_4", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree4_placer", 0, nil, nil, nil, "images/kyno_marbletree4.xml", "kyno_marbletree4.tex")


AddRecipe("kyno_rock_sinkhole", {Ingredient("rocks", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock_sinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholerock.xml", "kyno_sinkholerock.tex")


AddRecipe("kyno_sinkhole", {Ingredient("rocks", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkhole.xml", "kyno_sinkhole.tex")


AddRecipe("kyno_sinkhole_closed", {Ingredient("rocks", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_closed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholeclosed.xml", "kyno_sinkholeclosed.tex")


AddRecipe("kyno_sinkhole_vip", {Ingredient("rocks", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_vip_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sinkholevip.xml", "kyno_sinkholevip.tex")


AddRecipe("kyno_cavehole", {Ingredient("rocks", 2), Ingredient("rope", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cavehole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cavehole.xml", "kyno_cavehole.tex")


AddRecipe("kyno_rock1", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock1_placer", 0, nil, nil, nil, "images/kyno_rock1.xml", "kyno_rock1.tex")


AddRecipe("kyno_rock2", {Ingredient("rocks", 3), Ingredient("goldnugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock2_placer", 0, nil, nil, nil, "images/kyno_rock2.xml", "kyno_rock2.tex")


AddRecipe("kyno_rock_flintless", {Ingredient("rocks", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockflintless_placer", 0, nil, nil, nil, "images/kyno_rockflintless.xml", "kyno_rockflintless.tex")


AddRecipe("kyno_rock_ice", {Ingredient("ice", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockice_placer", 0, nil, nil, nil, "images/kyno_rockice.xml", "kyno_rockice.tex")


AddRecipe("kyno_snowhill", { snowfallingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_snowhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "kyno_snowpile.tex")


AddRecipe("kyno_rock_moon", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockmoon_placer", 0, nil, nil, nil, "images/kyno_rockmoon.xml", "kyno_rockmoon.tex")


AddRecipe("kyno_moonshell", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonshell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockmoonshell.xml", "kyno_rockmoonshell.tex")


AddRecipe("kyno_moonglass_rock", {Ingredient("moonglass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonglass_placer", 0, nil, nil, nil, "images/kyno_moonglass.xml", "kyno_moonglass.tex")


AddRecipe("kyno_moonrock_pieces", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonrubble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonrubble.xml", "kyno_moonrubble.tex")


AddRecipe("kyno_hound_gargoyle_1", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound.xml", "kyno_moonhound.tex")


AddRecipe("kyno_hound_gargoyle_2", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound2.xml", "kyno_moonhound2.tex")


AddRecipe("kyno_hound_gargoyle_3", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound3.xml", "kyno_moonhound3.tex")


AddRecipe("kyno_hound_gargoyle_4", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonhound4.xml", "kyno_moonhound4.tex")


AddRecipe("kyno_werepig_gargoyle_1", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig.xml", "kyno_moonpig.tex")


AddRecipe("kyno_werepig_gargoyle_2", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig2.xml", "kyno_moonpig2.tex")


AddRecipe("kyno_werepig_gargoyle_3", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig3.xml", "kyno_moonpig3.tex")


AddRecipe("kyno_werepig_gargoyle_4", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig4.xml", "kyno_moonpig4.tex")


AddRecipe("kyno_werepig_gargoyle_5", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig5.xml", "kyno_moonpig5.tex")


AddRecipe("kyno_werepig_gargoyle_6", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonpig6.xml", "kyno_moonpig6.tex")


AddRecipe("kyno_moonbase", {Ingredient("moonrocknugget", 10), Ingredient("nightmarefuel", 5), Ingredient("opalpreciousgem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonbase_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonbase.xml", "kyno_moonbase.tex")


AddRecipe("kyno_eyeplant", {Ingredient("plantmeat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_eyeplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_eyeplant.xml", "kyno_eyeplant.tex")


AddRecipe("kyno_contrarregra", {Ingredient("marble", 1), Ingredient("nightmarefuel", 2), Ingredient("turf_carpetfloor", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_contrarregra_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_contrarregra.xml", "kyno_contrarregra.tex")


AddRecipe("kyno_pigtorch", {Ingredient("log", 2), Ingredient("poop", 2), Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigtorch_placer", 0, nil, nil, nil, "images/kyno_pigtorch.xml", "kyno_pigtorch.tex")


AddRecipe("kyno_mermhouse", {Ingredient("boards", 2), Ingredient("rocks", 3), Ingredient("pondfish", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rundown_placer", 0, nil, nil, nil, "images/kyno_rundown.xml", "kyno_rundown.tex")


AddRecipe("kyno_walrus_camp", {Ingredient("cutstone", 1), Ingredient("walrus_tusk", 1), Ingredient("log", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_walrus_camp_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_igloo.xml", "kyno_igloo.tex")


AddRecipe("kyno_rabbithole", {Ingredient("rabbit", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rabbithole_placer", 0, nil, nil, nil, "images/kyno_rabbithole.xml", "kyno_rabbithole.tex")


AddRecipe("kyno_catcoonden", {Ingredient("log", 2), Ingredient("silk", 2), Ingredient("coontail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hollowstump_placer", 0, nil, nil, nil, "images/kyno_hollowstump.xml", "kyno_hollowstump.tex")


AddRecipe("kyno_poisontree", {Ingredient("livinglog", 2), Ingredient("nightmarefuel", 3), Ingredient("acorn", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_poisontree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_poisontree.xml", "kyno_poisontree.tex")


AddRecipe("kyno_houndmound", {Ingredient("houndstooth", 2), Ingredient("boneshard", 2), Ingredient("monstermeat", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndmound_placer", 0, nil, nil, nil, "images/kyno_houndmound.xml", "kyno_houndmound.tex")


AddRecipe("kyno_tallbirdnest", {Ingredient("tallbirdegg", 1), Ingredient("cutgrass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tallbirdnest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tallbirdnest.xml", "kyno_tallbirdnest.tex")


AddRecipe("kyno_beehive", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_beehive_placer", 0, nil, nil, nil, "images/kyno_beehive.xml", "kyno_beehive.tex")


AddRecipe("kyno_wasphive", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wasphive_placer", 0, nil, nil, nil, "images/kyno_wasphive.xml", "kyno_wasphive.tex")


AddRecipe("kyno_moose_nesting_ground", {Ingredient("twigs", 6)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_nestground_placer", 0, nil, nil, nil, "images/kyno_nestground.xml", "kyno_nestground.tex")


AddRecipe("kyno_goosenest", {Ingredient("cutgrass", 2), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_goosenest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_goosenest.xml", "kyno_goosenest.tex")


AddRecipe("kyno_goosenestegg", {Ingredient("bird_egg", 4), Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
kyno_surfacetab, TECH.LOST, "kyno_goosenestegg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_goosenestegg.xml", "kyno_goosenestegg.tex")


AddRecipe("kyno_honeypatch", {Ingredient("honey", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_honeypatch_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_honeypatch.xml", "kyno_honeypatch.tex")


AddRecipe("kyno_giantbeehive_small", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivesmall.xml", "kyno_beehivesmall.tex")


AddRecipe("kyno_giantbeehive_medium", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_medium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivemedium.xml", "kyno_beehivemedium.tex")


AddRecipe("kyno_giantbeehive", {Ingredient("honey", 6), Ingredient("honeycomb", 1), Ingredient("hivehat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beehivelarge.xml", "kyno_beehivelarge.tex")


AddRecipe("kyno_klausbag", {Ingredient("deer_antler1", 1), Ingredient("silk", 4), Ingredient("charcoal", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_klausbag.xml", "kyno_klausbag.tex")


AddRecipe("kyno_klausbag_winter", {Ingredient("deer_antler3", 1), Ingredient("silk", 4), Ingredient("charcoal", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_klausbag_winter.xml", "kyno_klausbag_winter.tex")


AddRecipe("kyno_icegeyser", {Ingredient("ice", 2), Ingredient("bluegem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_icegeyser_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_icegeyser.xml", "kyno_icegeyser.tex")


AddRecipe("kyno_magmafield", {Ingredient("torch", 2), Ingredient("redgem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_magmafield_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmafield.xml", "kyno_magmafield.tex")


AddRecipe("kyno_molehill", {Ingredient("mole", 1), Ingredient("nitre", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_molehill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_molehill.xml", "kyno_molehill.tex")


AddRecipe("kyno_moonspiderden", {Ingredient("spidereggsack", 1), Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonspiderden_placer", 0, nil, nil, nil, "images/kyno_moonspiderden.xml", "kyno_moonspiderden.tex")


AddRecipe("kyno_statueglommer", {Ingredient("glommerwings", 1), Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueglommer_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_glommerstatue.xml", "kyno_glommerstatue.tex")


AddRecipe("kyno_statuemaxwell", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuemaxwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemaxwell.xml", "kyno_statuemaxwell.tex")


AddRecipe("statueharp", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueharp_placer", 0, nil, nil, nil, "images/kyno_statueharp.xml", "kyno_statueharp.tex")


AddRecipe("kyno_statueangel", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueangel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueangel.xml", "kyno_statueangel.tex")


AddRecipe("marblepillar", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marblepillar_placer", 0, nil, nil, nil, "images/kyno_marblepillar.xml", "kyno_marblepillar.tex")


AddRecipe("kyno_statue_marble_muse", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_muse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble1.xml", "kyno_statuemarble1.tex")


AddRecipe("kyno_statue_marble", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble2.xml", "kyno_statuemarble2.tex")


AddRecipe("kyno_statue_marble_urn", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble3.xml", "kyno_statuemarble3.tex")


AddRecipe("kyno_statue_marble_pawn", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_pawn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuemarble4.xml", "kyno_statuemarble4.tex")


AddRecipe("kyno_statuerook", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuerook.xml", "kyno_statuerook.tex")


AddRecipe("kyno_statueknight", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueknight.xml", "kyno_statueknight.tex")


AddRecipe("kyno_statuebishop", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuebishop.xml", "kyno_statuebishop.tex")


AddRecipe("kyno_statuerook_repaired", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuerook_fixed.xml", "kyno_statuerook_fixed.tex")


AddRecipe("kyno_statueknight_repaired", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statueknight_fixed.xml", "kyno_statueknight_fixed.tex")


AddRecipe("kyno_statuebishop_repaired", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_repaired_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_statuebishop_fixed.xml", "kyno_statuebishop_fixed.tex")


AddRecipe("kyno_sculpture_rooknose", {Ingredient("marble", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rooknose_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_rooknose.tex")


AddRecipe("kyno_sculpture_knighthead", {Ingredient("marble", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_knighthead_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_knighthead.tex")


AddRecipe("kyno_sculpture_bishophead", {Ingredient("marble", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bishophead_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "sculpture_bishophead.tex")


AddRecipe("statuemarblebroodling", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblebroodling_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblebroodling.xml", "statuemarblebroodling.tex")

	
AddRecipe("statuemarblevargling", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblevargling_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblevargling.xml", "statuemarblevargling.tex")

	
AddRecipe("statuemarblekittykit", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblekittykit_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblekittykit.xml", "statuemarblekittykit.tex")

	
AddRecipe("statuemarblegiblet", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblegiblet_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblegiblet.xml", "statuemarblegiblet.tex")

	
AddRecipe("statuemarbleewelet", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarbleewelet_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarbleewelet.xml", "statuemarbleewelet.tex")

	
AddRecipe("statuemarblehutch", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblehutch_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblehutch.xml", "statuemarblehutch.tex")

	
AddRecipe("statuemarblechester", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarblechester_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarblechester.xml", "statuemarblechester.tex")

	
AddRecipe("statuemarbleglomglom", {Ingredient("marble", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuemarbleglomglom_placer", 0, nil, nil, nil, "images/inventoryimages/statuemarbleglomglom.xml", "statuemarbleglomglom.tex")


AddRecipe("statuestonebroodling", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonebroodling_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonebroodling.xml", "statuestonebroodling.tex")


AddRecipe("statuestonevargling", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonevargling_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonevargling.xml", "statuestonevargling.tex")
	

AddRecipe("statuestonekittykit", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonekittykit_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonekittykit.xml", "statuestonekittykit.tex")
	
	
AddRecipe("statuestonegiblet", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonegiblet_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonegiblet.xml", "statuestonegiblet.tex")
	
	
AddRecipe("statuestoneewelet", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestoneewelet_placer", 0, nil, nil, nil, "images/inventoryimages/statuestoneewelet.xml", "statuestoneewelet.tex")
	
	
AddRecipe("statuestonehutch", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonehutch_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonehutch.xml", "statuestonehutch.tex")
	
	
AddRecipe("statuestonechester", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestonechester_placer", 0, nil, nil, nil, "images/inventoryimages/statuestonechester.xml", "statuestonechester.tex")

	
AddRecipe("statuestoneglomglom", {Ingredient("cutstone", 2)}, 
kyno_surfacetab, TECH.SCIENCE_TWO, "statuestoneglomglom_placer", 0, nil, nil, nil, "images/inventoryimages/statuestoneglomglom.xml", "statuestoneglomglom.tex")


AddRecipe("kyno_antlion", {Ingredient("townportaltalisman", 2), Ingredient("meat", 2), Ingredient("antliontrinket", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_antlion_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antlion.xml", "kyno_antlion.tex")


AddRecipe("kyno_talisman", {Ingredient("townportaltalisman", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_talisman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_talisman.xml", "kyno_talisman.tex")


AddRecipe("kyno_sandspike_small", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_small.xml", "kyno_sandspike_small.tex")


AddRecipe("kyno_sandspike_med", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_med_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_med.xml", "kyno_sandspike_med.tex")


AddRecipe("kyno_sandspike_tall", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_tall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandspike_tall.xml", "kyno_sandspike_tall.tex")


AddRecipe("kyno_sandblock", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandblock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sandblock.xml", "kyno_sandblock.tex")


AddRecipe("glassspike_short", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_short.xml", "kyno_glassspike_short.tex")


AddRecipe("glassspike_med", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_med.xml", "kyno_glassspike_med.tex")


AddRecipe("glassspike_tall", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_tall.xml", "kyno_glassspike_tall.tex")


AddRecipe("glassblock", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassblock.xml", "kyno_glassblock.tex")


AddRecipe("kyno_antlionsinkhole", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_antlionsinkhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antlionsinkhole.xml", "kyno_antlionsinkhole.tex")


AddRecipe("kyno_altar_glass", {Ingredient("moonrocknugget", 2), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_glass_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_glass.tex")


AddRecipe("kyno_altar_idol", {Ingredient("moonrocknugget", 2), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_idol_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_idol.tex")


AddRecipe("kyno_altar_seed", {Ingredient("moonrocknugget", 2), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_seed_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_seed.tex")


AddRecipe("kyno_altar_crown", {Ingredient("moonrocknugget", 2), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_crown_placer", 0, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_crown.tex")


AddRecipe("kyno_invitingformation1", {Ingredient("rocks", 2), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation1.xml", "kyno_invitingformation1.tex")


AddRecipe("kyno_invitingformation2", {Ingredient("rocks", 2), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation2.xml", "kyno_invitingformation2.tex")


AddRecipe("kyno_invitingformation3", {Ingredient("rocks", 2), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_invitingformation3.xml", "kyno_invitingformation3.tex")


AddRecipe("kyno_obelisk", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_obelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obelisk.xml", "kyno_obelisk.tex")


AddRecipe("kyno_sanityrock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sanityrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obelisksanity.xml", "kyno_obelisksanity.tex")


AddRecipe("kyno_insanityrock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_insanityrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_obeliskinsanity.xml", "kyno_obeliskinsanity.tex")


AddRecipe("kyno_pigking", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigking.xml", "kyno_pigking.tex")


AddRecipe("kyno_pigking_elite", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_elite_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigking_elite.xml", "kyno_pigking_elite.tex")


AddRecipe("kyno_critterlab", {Ingredient("rocks", 3), Ingredient("cutgrass", 3), Ingredient("seeds", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_critterlab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockden.xml", "kyno_rockden.tex")


AddRecipe("kyno_pighead", {Ingredient("twigs", 2), Ingredient("pigskin", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pighead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pighead.xml", "kyno_pighead.tex")


AddRecipe("kyno_mermhead", {Ingredient("twigs", 2), Ingredient("pondfish", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mermhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mermhead.xml", "kyno_mermhead.tex")

-- This one is from authority of JustJasper. I need to ask him if I can use this!!!
AddRecipe("kyno_bunnyhead", {Ingredient("twigs", 2), Ingredient("manrabbit_tail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bunnyhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bunnyhead.xml", "kyno_bunnyhead.tex")


AddRecipe("kyno_wigfridhead", {Ingredient("twigs", 2), Ingredient("wathgrithrhat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wigfridhead_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wigfridhead.xml", "kyno_wigfridhead.tex")


AddRecipe("kyno_garden_handcar", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_handcar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_handcar.xml", "kyno_garden_handcar.tex")


AddRecipe("kyno_garden_spray", {Ingredient("lifeinjector", 1), Ingredient("poop", 2), Ingredient("seeds", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_spray_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_spray.xml", "kyno_garden_spray.tex")


AddRecipe("kyno_garden_blank", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_blank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_blank.xml", "kyno_garden_blank.tex")


AddRecipe("kyno_garden_sunflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("petals", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_sunflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_sunflower.xml", "kyno_garden_sunflower.tex")


AddRecipe("kyno_garden_doublesunflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("petals", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_doublesunflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_doublesunflower.xml", "kyno_garden_doublesunflower.tex")


AddRecipe("kyno_garden_greenie", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("corn", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_greenie_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_greenie.xml", "kyno_garden_greenie.tex")


AddRecipe("kyno_garden_frozen", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("ice", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_frozen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_frozen.xml", "kyno_garden_frozen.tex")


AddRecipe("kyno_garden_dragon", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("dragonfruit", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_dragon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_dragon.xml", "kyno_garden_dragon.tex")


AddRecipe("kyno_garden_potato", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), potatoingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_potato_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_potato.xml", "kyno_garden_potato.tex")


AddRecipe("kyno_garden_whiteflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("petals", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_whiteflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_whiteflower.xml", "kyno_garden_whiteflower.tex")


AddRecipe("kyno_garden_pepper", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("pepper", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_pepper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_pepper.xml", "kyno_garden_pepper.tex")


AddRecipe("kyno_garden_greenflower", {Ingredient("cutstone", 1), Ingredient("turf_grass", 1), Ingredient("succulent_picked", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_garden_greenflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_garden_greenflower.xml", "kyno_garden_greenflower.tex")


AddRecipe("kyno_pottedredmushroom", {Ingredient("red_cap", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedredmushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedredmushroom.xml", "kyno_pottedredmushroom.tex")


AddRecipe("kyno_pottedgreenmushroom", {Ingredient("green_cap", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedgreenmushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedgreenmushroom.xml", "kyno_pottedgreenmushroom.tex")


AddRecipe("kyno_pottedbluemushroom", {Ingredient("blue_cap", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedbluemushroom_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedbluemushroom.xml", "kyno_pottedbluemushroom.tex")


AddRecipe("kyno_pottedflower", {Ingredient("petals", 1), Ingredient("slurtle_shellpieces", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedflower.xml", "kyno_pottedflower.tex")


AddRecipe("kyno_pottedevilflower", {Ingredient("petals_evil", 1), Ingredient("slurtle_shellpieces", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedevilflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedevilflower.xml", "kyno_pottedevilflower.tex")


AddRecipe("kyno_pottedrose", {Ingredient("petals", 1), Ingredient("stinger", 1), Ingredient("marble", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedrose_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedrose.xml", "kyno_pottedrose.tex")


AddRecipe("kyno_pottedcactus", {Ingredient("cactus_meat", 1), Ingredient("stinger", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pottedcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pottedcactus.xml", "kyno_pottedcactus.tex")


AddRecipe("kyno_p_farmrock", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrock.xml", "kyno_p_farmrock.tex")


AddRecipe("kyno_p_farmrocktall", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrocktall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrocktall.xml", "kyno_p_farmrocktall.tex")


AddRecipe("kyno_p_farmrockflat", {Ingredient("rocks", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_farmrockflat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_farmrockflat.xml", "kyno_p_farmrockflat.tex")


AddRecipe("kyno_p_stick", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stick.xml", "kyno_p_stick.tex")


AddRecipe("kyno_p_stickleft", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stickleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stickleft.xml", "kyno_p_stickleft.tex")


AddRecipe("kyno_p_stickright", {Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_stickright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_stickright.xml", "kyno_p_stickright.tex")


AddRecipe("kyno_p_signleft", {Ingredient("minisign_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_signleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_signleft.xml", "kyno_p_signleft.tex")


AddRecipe("kyno_p_signright", {Ingredient("minisign_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_signright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_signright.xml", "kyno_p_signright.tex")


AddRecipe("kyno_p_fencepost", {Ingredient("fence_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_fencepost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_fencepost.xml", "kyno_p_fencepost.tex")


AddRecipe("kyno_p_fencepostright", {Ingredient("fence_item", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_fencepostright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_fencepostright.xml", "kyno_p_fencepostright.tex")


AddRecipe("kyno_p_burntstick", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstick.xml", "kyno_p_burntstick.tex")


AddRecipe("kyno_p_burntstickleft", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstickleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstickleft.xml", "kyno_p_burntstickleft.tex")


AddRecipe("kyno_p_burntstickright", {Ingredient("twigs", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntstickright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntstickright.xml", "kyno_p_burntstickright.tex")


AddRecipe("kyno_p_burntfencepost", {Ingredient("fence_item", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntfencepost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntfencepost.xml", "kyno_p_burntfencepost.tex")


AddRecipe("kyno_p_burntfencepostright", {Ingredient("fence_item", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_p_burntfencepostright_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_p_burntfencepostright.xml", "kyno_p_burntfencepostright.tex")


AddRecipe("kyno_touchstone", {Ingredient("rocks", 3), Ingredient("marble", 3), Ingredient("nightmarefuel", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_touchstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_touchstone.xml", "kyno_touchstone.tex")


AddRecipe("kyno_portalstone", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 4), Ingredient("petals", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_floridpostern.xml", "kyno_floridpostern.tex")


AddRecipe("kyno_portalbuilding", {Ingredient("multiplayer_portal_moonrock_constr_plans", 1), Ingredient("nightmarefuel", 4), Ingredient("petals", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalbuilding_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_portalbuilding.xml", "kyno_portalbuilding.tex")


AddRecipe("kyno_celestialportal", {Ingredient("purplemooneye", 1), Ingredient("nightmarefuel", 4), Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_celestialportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_celestialportal.xml", "kyno_celestialportal.tex")


AddRecipe("kyno_lake", {Ingredient("ice", 4), Ingredient("pondfish", 2), Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lake_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lake.xml", "kyno_lake.tex")


AddRecipe("kyno_pond", {Ingredient("ice", 3), Ingredient("pondfish", 2), Ingredient("froglegs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pond_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pond.xml", "kyno_pond.tex")


AddRecipe("kyno_pondmarsh", {Ingredient("ice", 3), Ingredient("pondfish", 2), Ingredient("mosquito", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondmarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondmarsh.xml", "kyno_pondmarsh.tex")


AddRecipe("kyno_pondlava", {Ingredient("ice", 3), Ingredient("redgem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondlava_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pondmagma.xml", "kyno_pondmagma.tex")


AddRecipe("kyno_hotspring", {Ingredient("moonglass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hotspring_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hotspring.xml", "kyno_hotspring.tex")


AddRecipe("kyno_basalt1", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt1.xml", "kyno_basalt1.tex")


AddRecipe("kyno_basalt2", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt2.xml", "kyno_basalt2.tex")


AddRecipe("kyno_basalt4", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt4.xml", "kyno_basalt4.tex")


AddRecipe("kyno_basalt3", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basalt3.xml", "kyno_basalt3.tex")


AddRecipe("kyno_driftwood_small1", {Ingredient("driftwood_log", 1), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood1_placer", 0, nil, nil, nil, "images/kyno_driftwood1.xml", "kyno_driftwood1.tex")


AddRecipe("kyno_driftwood_small2", {Ingredient("driftwood_log", 1), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood2_placer", 0, nil, nil, nil, "images/kyno_driftwood2.xml", "kyno_driftwood2.tex")


AddRecipe("kyno_driftwood_tall", {Ingredient("driftwood_log", 2), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood3_placer", 0, nil, nil, nil, "images/kyno_driftwood3.xml", "kyno_driftwood3.tex")


AddRecipe("kyno_houndbone", {Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndbone_placer", 0, nil, nil, nil, "images/kyno_bones.xml", "kyno_bones.tex")


AddRecipe("kyno_bonemound", {Ingredient("boneshard", 1), Ingredient("houndstooth", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bonemound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bonemound.xml", "kyno_bonemound.tex")


AddRecipe("kyno_dead_sea_bones", {Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_seabones_placer", 0, nil, nil, nil, "images/kyno_seabones.xml", "kyno_seabones.tex")


AddRecipe("kyno_skeleton", {Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_skeleton_placer", 0, nil, nil, nil, "images/kyno_skeleton.xml", "kyno_skeleton.tex")


AddRecipe("kyno_scorchedskeleton", {Ingredient("boneshard", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedskeleton_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crispyskeleton.xml", "kyno_crispyskeleton.tex")


AddRecipe("kyno_mound", {Ingredient("boneshard", 1), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 20)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mound.xml", "kyno_mound.tex")


AddRecipe("kyno_gravestone1", {Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone1.xml", "kyno_gravestone1.tex")


AddRecipe("kyno_gravestone2", {Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone2.xml", "kyno_gravestone2.tex")


AddRecipe("kyno_gravestone3", {Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone3.xml", "kyno_gravestone3.tex")


AddRecipe("kyno_gravestone4", {Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gravestone4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gravestone4.xml", "kyno_gravestone4.tex")


AddRecipe("kyno_wormhole", {Ingredient("houndstooth", 2), Ingredient("meat", 2), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wormhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormhole.xml", "kyno_wormhole.tex")


AddRecipe("kyno_wormhole_sick", {Ingredient("houndstooth", 2), Ingredient("monstermeat", 2), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wormhole_sick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wormhole_sick.xml", "kyno_wormhole_sick.tex")


AddRecipe("kyno_sunkenchest", {Ingredient("goldnugget", 2), Ingredient("slurtle_shellpieces", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_sunkenchest.xml", "kyno_sunkenchest.tex")


AddRecipe("shell_cluster", { shell1ingredient, shell2ingredient, shell3ingredient },
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_shellcluster.xml", "kyno_shellcluster.tex")


AddRecipe("oceanfishableflotsam", {Ingredient("poop", 1), Ingredient("cutgrass", 1), Ingredient("kelp", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_oceandebris_placer", 0, nil, nil, nil, "images/kyno_oceandebris.xml", "kyno_oceandebris.tex")


AddRecipe("kyno_moonfissure", {Ingredient("moonrocknugget", 8), Ingredient("nightmarefuel", 8), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 100)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonfissure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonfissure.xml", "kyno_moonfissure.tex")


AddRecipe("kyno_moonfissure_plugged", {Ingredient("moonrocknugget", 2), Ingredient("slurtle_shellpieces", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonfissure_plugged_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonfissure_plugged.xml", "kyno_moonfissure_plugged.tex")


AddRecipe("kyno_meatrack_hermit", {Ingredient("twigs", 3), Ingredient("moon_tree_blossom", 2), Ingredient("rope", 3)},
kyno_surfacetab, TECH.LOST, "kyno_meatrack_hermit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_meatrack_hermit.xml", "kyno_meatrack_hermit.tex")


AddRecipe("kyno_beebox_hermit", {Ingredient("moon_tree_blossom", 4), Ingredient("honeycomb", 1), Ingredient("bee", 4)},
kyno_surfacetab, TECH.LOST, "kyno_beebox_hermit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beebox_hermit.xml", "kyno_beebox_hermit.tex")


AddRecipe("kyno_hermithouse1", {Ingredient("rocks", 3), Ingredient("log", 3), Ingredient("slurtle_shellpieces", 3)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse1.xml", "kyno_hermithouse1.tex")


AddRecipe("kyno_hermithouse2", {Ingredient("cookiecuttershell", 2), Ingredient("boards", 3)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse2.xml", "kyno_hermithouse2.tex")


AddRecipe("kyno_hermithouse3", {Ingredient("marble", 3), Ingredient("rope", 3)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse3.xml", "kyno_hermithouse3.tex")


AddRecipe("kyno_hermithouse4", {Ingredient("moonrocknugget", 3), Ingredient("cactus_flower", 2)},
kyno_surfacetab, TECH.LOST, "kyno_hermithouse4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hermithouse4.xml", "kyno_hermithouse4.tex")


AddRecipe("kyno_propsign_structure", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_propsign_structure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_propsign.xml", "kyno_propsign.tex")


AddRecipe("kyno_gingerbreadhouse1", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse1.xml", "kyno_gingerbreadhouse1.tex")


AddRecipe("kyno_gingerbreadhouse2", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse2.xml", "kyno_gingerbreadhouse2.tex")


AddRecipe("kyno_gingerbreadhouse3", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse3.xml", "kyno_gingerbreadhouse3.tex")


AddRecipe("kyno_gingerbreadhouse4", {Ingredient("crumbs", 5), Ingredient("wintersfeastfuel", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gingerbreadhouse4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gingerbreadhouse4.xml", "kyno_gingerbreadhouse4.tex")


AddRecipe("kyno_clayhound", {Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_clayhound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_clayhound.xml", "kyno_clayhound.tex")


AddRecipe("kyno_claywarg", {Ingredient("cutstone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_claywarg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_claywarg.xml", "kyno_claywarg.tex")


AddRecipe("kyno_silktent", {Ingredient("silk", 4), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_silktent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_silktent.xml", "kyno_silktent.tex")


AddRecipe("kyno_furtent", {Ingredient("beefalowool", 4), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_furtent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_furtent.xml", "kyno_furtent.tex")


AddRecipe("kyno_tentacletent", {Ingredient("tentaclespots", 4), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tentacletent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tentacletent.xml", "kyno_tentacletent.tex")


AddRecipe("kyno_tikitent", {Ingredient("manrabbit_tail", 4), Ingredient("twigs", 4), Ingredient("rope", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tikitent_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tikitent.xml", "kyno_tikitent.tex")


AddRecipe("kyno_friendomatic", {Ingredient("boards", 2), Ingredient("nightmarefuel", 2), Ingredient("rocks", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_friendomatic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_friendomatic.xml", "kyno_friendomatic.tex")


AddRecipe("kyno_accomplishment_shrine", {Ingredient("goldnugget", 5), Ingredient("cutstone", 1), Ingredient("gears", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_accomplishment_shrine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "accomplishment_shrine.tex")


AddRecipe("kyno_teleporter_rog", {Ingredient("boards", 1), Ingredient("cutstone", 1), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teleporter_rog_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatorog.xml", "kyno_potatorog.tex")


AddRecipe("kyno_teleporter_adventure", {Ingredient("boards", 1), Ingredient("nightmarefuel", 2), Ingredient("gears", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teleporter_adventure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatoadventure.xml", "kyno_potatoadventure.tex")


AddRecipe("kyno_skullchest", {Ingredient("boards", 3), Ingredient("boneshard", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_skullchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_skullchest.xml", "kyno_skullchest.tex")


AddRecipe("kyno_sunkboat", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sunkboat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sunkboat.xml", "kyno_sunkboat.tex")


AddRecipe("kyno_sunkboat2", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sunkboat2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sunkboat2.xml", "kyno_sunkboat2.tex")


AddRecipe("kyno_white_moonrock", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_white_moonrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_whitemoonrock.xml", "kyno_whitemoonrock.tex")


AddRecipe("wall_legacy_moonrock_item", {Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_legacywall.xml", "kyno_legacywall.tex")


AddRecipe("wall_reed_item", {Ingredient("cutreeds", 4), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_wall_reed.xml", "wall_reed_item.tex")


AddRecipe("wall_bone_item", {Ingredient("boneshard", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_bone_item.xml", "wall_bone_item.tex")


AddRecipe("wall_living_item", {Ingredient("wall_stone_item", 2), Ingredient("tentaclespots", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_living_item.xml", "wall_living_item.tex")


AddRecipe("wall_mud_item", {Ingredient("wall_hay_item", 2), Ingredient("poop", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/wall_mud_item.xml", "wall_mud_item.tex")


AddRecipe("kyno_juryriggedportal", {Ingredient("cutstone", 2), Ingredient("boards", 2), Ingredient("nightmarefuel", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_juryriggedportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_juryrigged.xml", "kyno_juryrigged.tex")


AddRecipe("kyno_shopkeeper1", {Ingredient("umbrella", 1), Ingredient("trunkvest_summer", 1), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_shopkeeper1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shopkeeper1.xml", "kyno_shopkeeper1.tex")


AddRecipe("kyno_shopkeeper2", {Ingredient("boards", 1), Ingredient("reflectivevest", 1), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_shopkeeper2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shopkeeper2.xml", "kyno_shopkeeper2.tex")


AddRecipe("kyno_bonfire", {Ingredient("log", 2), Ingredient("cutgrass", 3), Ingredient("charcoal", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bonfire_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bonfire.xml", "kyno_bonfire.tex")


AddRecipe("kyno_unbuilthouse", {Ingredient("boards", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_unbuilthouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_unbuilt.xml", "kyno_unbuilt.tex")


AddRecipe("kyno_snowman", {Ingredient("ice", 4), Ingredient("carrot", 1), Ingredient("tophat", 1)},
kyno_surfacetab, TECH.LOST, "kyno_snowman_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_snowman.xml", "kyno_snowman.tex")


AddRecipe("kyno_bucket", {Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bucket_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bucket.xml", "kyno_bucket.tex")


AddRecipe("kyno_bags", {Ingredient("rope", 1), Ingredient("cutgrass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bags_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bag.xml", "kyno_bag.tex")


AddRecipe("kyno_scarecrow", {Ingredient("strawhat", 1), Ingredient("cutgrass", 3), Ingredient("twigs", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scarecrow_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scarecrow.xml", "kyno_scarecrow.tex")


AddRecipe("kyno_minitree", {Ingredient("log", 1), Ingredient("cutgrass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_minitree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_minitree.xml", "kyno_minitree.tex")


AddRecipe("kyno_legacymarsh", {Ingredient("dug_grass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_legacymarsh_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_legacymarsh.xml", "kyno_legacymarsh.tex")


AddRecipe("kyno_treeclump", {Ingredient("log", 10), Ingredient("pinecone", 5)},
kyno_surfacetab, TECH.LOST, "kyno_treeclump_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treeclump.xml", "kyno_treeclump.tex")


AddRecipe("kyno_bbq", {Ingredient("log", 2), Ingredient("rocks", 12), Ingredient("meat", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bbq_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bbq.xml", "kyno_bbq.tex")


AddRecipe("kyno_teslapost", {Ingredient("lantern", 1), Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_teslapost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_teslapost.xml", "kyno_teslapost.tex")


-- AddRecipe("kyno_compromisingstatue", {Ingredient(GLOBAL.CHARACTER_INGREDIENT.HEALTH, 40), Ingredient("cutstone", 2), Ingredient("twigs", 2)},
-- kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_compromisingstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_compromisingstatue.xml", "kyno_compromisingstatue.tex")


AddRecipe("kyno_truffles", {Ingredient("blue_cap", 2), Ingredient("green_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_truffles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_truffles.xml", "kyno_truffles.tex")


AddRecipe("kyno_biigfoot_footprint", {Ingredient("turf_mud", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_biigfoot_footprint_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_biigfoot_footprint.xml", "kyno_biigfoot_footprint.tex")


AddRecipe("kyno_biigfoot", {Ingredient("meat", 10), Ingredient("dragon_scales", 1), Ingredient("boneshard", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_biigfoot_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_biigfoot.xml", "kyno_biigfoot.tex")


AddRecipe("kyno_waxwelldoor", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelldoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelldoor.xml", "kyno_waxwelldoor.tex")


AddRecipe("kyno_trap_teeth_maxwell", {Ingredient("marble", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_trap_teeth_maxwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trapteeth.xml", "kyno_trapteeth.tex")


AddRecipe("kyno_gramaphone", {Ingredient("goldnugget", 2), Ingredient("nightmarefuel", 2), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_gramaphone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gramaphone.xml", "kyno_gramaphone.tex")


AddRecipe("kyno_waxwelltorch", {Ingredient("marble", 2), Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelltorch_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelltorch.xml", "kyno_waxwelltorch.tex")


AddRecipe("kyno_adventurelock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_adventurelock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_adventurelock.xml", "kyno_adventurelock.tex")


AddRecipe("kyno_waxwelllock", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2), Ingredient("silk", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_waxwelllock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_waxwelllock.xml", "kyno_waxwelllock.tex")


AddRecipe("kyno_nightmarethrone", {Ingredient("nightmarefuel", 10), Ingredient(GLOBAL.CHARACTER_INGREDIENT.HEALTH, 50)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_nightmarethrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_nightmarethrone.xml", "kyno_nightmarethrone.tex")


AddRecipe("kyno_maxwellthrone", {Ingredient("nightmarefuel", 10), Ingredient("meat", 2), Ingredient("reviver", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_maxwellthrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_maxwellthrone.xml", "kyno_maxwellthrone.tex")


AddRecipe("kyno_shadowportal", {Ingredient("livinglog", 4), Ingredient("nightmarefuel", 4), Ingredient("purplegem", 1)},
kyno_surfacetab, TECH.LOST, "kyno_shadowportal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shadowportal.xml", "kyno_shadowportal.tex")


AddRecipe("kyno_truesaltlick", {Ingredient("boards", 2), Ingredient("saltrock", 4)},
RECIPETABS.TOOLS, TECH.SCIENCE_TWO, "kyno_truesaltlick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_salt_lick.xml", "kyno_salt_lick.tex")


AddRecipe("turf_grass", {Ingredient("cutgrass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_grass.tex")


AddRecipe("turf_forest", {Ingredient("pinecone", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_forest.tex")


AddRecipe("turf_deciduous", {Ingredient("red_cap", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_deciduous.tex")


AddRecipe("turf_savanna", {Ingredient("cutgrass", 2), Ingredient("poop", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_savanna.tex")


AddRecipe("turf_desertdirt", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_desertdirt.tex")


AddRecipe("turf_rocky", {Ingredient("rocks", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages.xml", "turf_rocky.tex")


AddRecipe("turf_pebblebeach", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages2.xml", "turf_pebblebeach.tex")


AddRecipe("turf_redcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("red_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_redcarpet.tex")


AddRecipe("turf_pinkcarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("spidergland", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_pinkcarpet.tex")


AddRecipe("turf_orangecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("carrot", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_orangecarpet.tex")


AddRecipe("turf_cyancarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_cyancarpet.tex")


AddRecipe("turf_whitecarpet", {Ingredient("turf_carpetfloor", 1), Ingredient("saltrock", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_whitecarpet.tex")


AddRecipe("turf_snowfall", {Ingredient("ice", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_snowfall.tex")


AddRecipe("turf_modern_cobblestones", {Ingredient("turf_road", 1), Ingredient("cutstone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_new.xml", "turf_modern_cobblestones.tex")


AddRecipe("turf_sticky", {Ingredient("honey", 2), Ingredient("boards", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/turf_sticky.xml", "turf_sticky.tex")


AddRecipe("kyno_magmagolem", {Ingredient("rocks", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_magmagolem_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmagolem.xml", "kyno_magmagolem.tex")


AddRecipe("kyno_shieldstandard", {Ingredient("boards", 1), Ingredient("purplegem", 1), Ingredient("houndstooth", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_shieldstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_purplestandard.xml", "kyno_purplestandard.tex")


AddRecipe("kyno_attackstandard", {Ingredient("boards", 1), Ingredient("redgem", 1), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_attackstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_redstandard.xml", "kyno_redstandard.tex")


AddRecipe("kyno_healstandard", {Ingredient("boards", 1), Ingredient("bluegem", 1), Ingredient("petals", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bluestandard.xml", "kyno_bluestandard.tex")


AddRecipe("kyno_bannerstandard", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner1.xml", "kyno_banner1.tex")


AddRecipe("kyno_bannerstandard_2", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner2.xml", "kyno_banner2.tex")


AddRecipe("kyno_bannerstandard_3", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banner3.xml", "kyno_banner3.tex")


AddRecipe("kyno_lavaspawner", {Ingredient("cutstone", 1), Ingredient("redgem", 1), Ingredient("boneshard", 3)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavaspawner_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavaspawner.xml", "kyno_lavaspawner.tex")


AddRecipe("kyno_lavagateway", {Ingredient("cutstone", 2), Ingredient("redgem", 1), Ingredient("nightmarefuel", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavagateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavagateway.xml", "kyno_lavagateway.tex")


AddRecipe("kyno_anchorgateway", {Ingredient("cutstone", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_anchorgateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_anchorgateway.xml", "kyno_anchorgateway.tex")


AddRecipe("kyno_moltenfence_item", {Ingredient("fence_item", 2), Ingredient("boneshard", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_moltenfence.xml", "kyno_moltenfence.tex")


AddRecipe("kyno_lavahole", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavahole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavahole.xml", "kyno_lavahole.tex")


AddRecipe("kyno_healflower", {Ingredient("petals", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_healblossom.xml", "kyno_healblossom.tex")


AddRecipe("kyno_artificial_healflower", {Ingredient("petals", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_artificial_healflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_healblossom2.xml", "kyno_healblossom2.tex")


AddRecipe("turf_forgerock", {Ingredient("turf_rocky", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgerock.tex")


AddRecipe("turf_forgeroad", {Ingredient("turf_road", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgeroad.tex")


AddRecipe("kyno_queenaltar", {Ingredient("cutstone", 4), Ingredient("redgem", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_queenaltar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_queenaltar.xml", "kyno_queenaltar.tex")


AddRecipe("kyno_beaststatue", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1.xml", "kyno_beaststatue1.tex")


-- AddRecipe("kyno_beaststatue_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1_left.xml", "kyno_beaststatue1_left.tex")


AddRecipe("kyno_beaststatue2", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2.xml", "kyno_beaststatue2.tex")


-- AddRecipe("kyno_beaststatue2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2_left.xml", "kyno_beaststatue2_left.tex")


AddRecipe("kyno_bollard", {Ingredient("rocks", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_bollard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bollard.xml", "kyno_bollard.tex")


AddRecipe("kyno_ivy", {Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ivy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ivy.xml", "kyno_ivy.tex")


AddRecipe("kyno_streetlight1", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_streetlight1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_streetlight1.xml", "kyno_streetlight1.tex")


AddRecipe("kyno_streetlight2", {Ingredient("lantern", 1), Ingredient("cutstone", 1), Ingredient("transistor", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_streetlight2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_streetlight2.xml", "kyno_streetlight2.tex")


AddRecipe("kyno_mossygateway", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mossygateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mossygateway.xml", "kyno_mossygateway.tex")


AddRecipe("kyno_sammywagon", {Ingredient("boards", 1), Ingredient("cutgrass", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_sammywagon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sammywagon.xml", "kyno_sammywagon.tex")


AddRecipe("kyno_mealingstone", {Ingredient("cutstone", 1), Ingredient("rocks", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mealingstone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mealingstone.xml", "kyno_mealingstone.tex")


AddRecipe("kyno_safechest", {Ingredient("cutstone", 1), Ingredient("goldnugget", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_safechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_safe.xml", "kyno_safe.tex")


AddRecipe("kyno_saltpond", {Ingredient("saltrock", 2), Ingredient("ice", 2), Ingredient("pondfish", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_saltpond_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltpond.xml", "kyno_saltpond.tex")


AddRecipe("kyno_saltpond_rack", {Ingredient("saltrock", 2), Ingredient("ice", 2), Ingredient("twigs", 4)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_saltpond_rack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltpond_rack.xml", "kyno_saltpond_rack.tex")


AddRecipe("kyno_crabtrap", {Ingredient("boards", 1), Ingredient("silk", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_crabtrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crabtrap.xml", "kyno_crabtrap.tex")


AddRecipe("kyno_rubble_carriage", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_carriage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_carriage.xml", "kyno_carriage.tex")


AddRecipe("kyno_rubble_bike", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_bike_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bike.xml", "kyno_bike.tex")


AddRecipe("kyno_rubble_clock", {Ingredient("boards", 1), Ingredient("compass", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_clock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gorgeclock.xml", "kyno_gorgeclock.tex")


AddRecipe("kyno_rubble_cathedral", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_cathedral_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cathedral.xml", "kyno_cathedral.tex")


AddRecipe("kyno_rubble_pubdoor", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_pubdoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pubdoor.xml", "kyno_pubdoor.tex")


AddRecipe("kyno_rubble_door", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_door_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_housedoor.xml", "kyno_housedoor.tex")


AddRecipe("kyno_rubble_roof", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_roof_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roof.xml", "kyno_roof.tex")


AddRecipe("kyno_rubble_clocktower", {Ingredient("cutstone", 1), Ingredient("compass", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_clocktower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_clocktower.xml", "kyno_clocktower.tex")


AddRecipe("kyno_rubble_house", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_house.xml", "kyno_house.tex")


AddRecipe("kyno_rubble_chimney", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_chimney_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_chimney1.xml", "kyno_chimney1.tex")


AddRecipe("kyno_rubble_chimney2", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_rubble_chimney2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_chimney2.xml", "kyno_chimney2.tex")


AddRecipe("kyno_piptoncart", {Ingredient("cutstone", 1), Ingredient("bluegem", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_piptoncart_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_piptoncart.xml", "kyno_piptoncart.tex")


AddRecipe("kyno_irongate_item", {Ingredient("twigs", 2), Ingredient("flint", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 2, nil, "images/inventoryimages/kyno_irongate_item.xml", "kyno_irongate_item.tex")


AddRecipe("kyno_ironfencesmall", {Ingredient("twigs", 1), Ingredient("flint", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ironfencesmall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ironfencesmall.xml", "kyno_ironfencesmall.tex")


AddRecipe("kyno_ironfencetall", {Ingredient("twigs", 1), Ingredient("flint", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_ironfencetall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ironfencesmall.xml", "kyno_ironfencesmall.tex")


AddRecipe("kyno_urn", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_urn_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_urn.xml", "kyno_urn.tex")


AddRecipe("kyno_worshipper", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper.xml", "kyno_worshipper.tex")


AddRecipe("kyno_worshipper2", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper2.xml", "kyno_worshipper2.tex")


-- AddRecipe("kyno_worshipper2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
-- kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper2_left.xml", "kyno_worshipper2_left.tex")


AddRecipe("kyno_stoneobelisk", {Ingredient("cutstone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_stoneobelisk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_stoneobelisk.xml", "kyno_stoneobelisk.tex")


AddRecipe("kyno_birdfountain", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_birdfountain_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_birdfountain.xml", "kyno_birdfountain.tex")


AddRecipe("cottontree_normal", {Ingredient("log", 1), Ingredient("pinecone", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "cottontree_normal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cottontree.xml", "kyno_cottontree.tex")


AddRecipe("kyno_spottyshrub", {Ingredient("dug_berrybush2", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_spottyshrub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_spottyshrub.xml", "kyno_spottyshrub.tex")


AddRecipe("kyno_oven", {Ingredient("cutstone", 1), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_oven_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_oven.tex")


AddRecipe("kyno_grill_small", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_grill_small_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_grill_small.tex")


AddRecipe("kyno_grill_large", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_grill_large_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_grill.tex")


AddRecipe("kyno_pothanger_potsmall", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_potsmall_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_pothanger", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("charcoal", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_pothanger_syrup", {Ingredient("cutstone", 1), Ingredient("twigs", 3), Ingredient("honey", 3)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pothanger_syrup_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_crate_pot_hanger.tex")


AddRecipe("kyno_mushroomstump", {Ingredient("red_cap", 1), Ingredient("green_cap", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_mushroomstump_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mushstump.xml", "kyno_mushstump.tex")


AddRecipe("kyno_swampmermhouserubble", {Ingredient("rocks", 2), Ingredient("log", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swampmermhouserubble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swampmermhouserubble.xml", "kyno_swampmermhouserubble.tex")


AddRecipe("kyno_swamppighouse", {Ingredient("boards", 2), Ingredient("cutstone", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swamppighouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swamppighouse.xml", "kyno_swamppighouse.tex")


AddRecipe("kyno_swampmermhouse", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("pondfish", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_swampmermhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_swampmermhouse.xml", "kyno_swampmermhouse.tex")


AddRecipe("kyno_pigelder", {Ingredient("meat", 4), Ingredient("reviver", 1), Ingredient("pigskin", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_pigelder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigelder.xml", "kyno_pigelder.tex")


AddRecipe("kyno_potato_planted", {Ingredient("potato_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_potato_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_2.tex")


AddRecipe("kyno_turnip_planted", {Ingredient("eggplant_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_turnip_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_5.tex")


AddRecipe("kyno_carrot_planted", {Ingredient("carrot_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_carrot_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_6.tex")


AddRecipe("kyno_onion_planted", {Ingredient("onion_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_onion_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_4.tex")


AddRecipe("kyno_wheat_planted", {Ingredient("cutgrass", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_wheat_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_1.tex")


AddRecipe("kyno_garlic_planted", {Ingredient("garlic_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_garlic_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_7.tex")


AddRecipe("kyno_tomato_planted", {Ingredient("tomato_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "Kyno_tomato_planted_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_3.tex")


AddRecipe("turf_pinkpark", {Ingredient("turf_deciduous", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_pinkpark.tex")


AddRecipe("turf_pinkstone", {Ingredient("turf_road", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_pinkstone.tex")


AddRecipe("turf_greyforest", {Ingredient("turf_forest", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_greyforest.tex")


AddRecipe("turf_stonecity", {Ingredient("turf_road", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_stonecity.tex")


AddRecipe("turf_browncarpet", {Ingredient("turf_carpetfloor", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_gorge.xml", "turf_browncarpet.tex")


AddRecipe("kyno_lamppost", {Ingredient("cutstone", 1), Ingredient("lantern", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lamppost_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "city_lamp.tex")


AddRecipe("kyno_pighouse_farm", {Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_farm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_farmhouse.xml", "kyno_farmhouse.tex")


AddRecipe("kyno_pighouse_city", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_city_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pighouse_city.tex")


AddRecipe("kyno_pigshop_deli", {Ingredient("boards", 4), Ingredient("honeyham", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_deli_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_deli.tex")


AddRecipe("kyno_pigshop_general", {Ingredient("boards", 4), Ingredient("axe", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_general_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_general.tex")


AddRecipe("kyno_pigshop_spa", {Ingredient("boards", 4), Ingredient("bandage", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_spa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hoofspa.tex")


AddRecipe("kyno_pigshop_produce", {Ingredient("boards", 4), Ingredient("eggplant", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_produce_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_produce.tex")


AddRecipe("kyno_pigshop_flower", {Ingredient("boards", 4), Ingredient("petals", 12), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_flower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_florist.tex")


AddRecipe("kyno_pigshop_antiquities", {Ingredient("boards", 4), Ingredient("hammer", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_antiquities_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_antiquities.tex")


AddRecipe("kyno_pigshop_arcane", {Ingredient("boards", 4), Ingredient("nightmarefuel", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_arcane_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_arcane.tex")


AddRecipe("kyno_pigshop_weapons", {Ingredient("boards", 4), Ingredient("spear", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_weapons_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_weapons.tex")


AddRecipe("kyno_pigshop_hatshop", {Ingredient("boards", 4), Ingredient("tophat", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_hatshop_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hatshop.tex")


AddRecipe("kyno_pigshop_bank", {Ingredient("cutstone", 3), Ingredient("goldnugget", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_bank_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_bank.tex")


AddRecipe("kyno_pigshop_tinker", {Ingredient("cutstone", 3), Ingredient("boards", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_tinker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_tinker.tex")


AddRecipe("kyno_pigshop_academy", {Ingredient("cutstone", 3), Ingredient("papyrus", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_academy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_academy.xml", "kyno_academy.tex")


AddRecipe("kyno_pigshop_cityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_cityhall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigshop_mycityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("silk", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_mycityhall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigpalace", {Ingredient("marble", 2), Ingredient("goldnugget", 2), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalace_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigpalace.xml", "kyno_pigpalace.tex")


AddRecipe("kyno_pigpalace2", {Ingredient("cutstone", 2), Ingredient("goldnugget", 2), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalace2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigpalace.xml", "kyno_pigpalace.tex")


AddRecipe("kyno_playerhouse", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "playerhouse_city.tex")


AddRecipe("kyno_playerhouse_manor", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_manor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_manor_craft.tex")


AddRecipe("kyno_playerhouse_cottage", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_cottage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_cottage_craft.tex")


AddRecipe("kyno_playerhouse_tudor", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_tudor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_tudor_craft.tex")


AddRecipe("kyno_playerhouse_villa", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_villa_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_villa_craft.tex")


AddRecipe("kyno_playerhouse_gothic", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_gothic_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_gothic_craft.tex")


AddRecipe("kyno_playerhouse_brick", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_brick_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_brick_craft.tex")


AddRecipe("kyno_playerhouse_turret", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_turret_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_turret_craft.tex")


AddRecipe("kyno_pigtower3", {Ingredient("cutstone", 1), Ingredient("spear", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower", {Ingredient("cutstone", 1), Ingredient("spear", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower2", {Ingredient("cutstone", 1), Ingredient("spear", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigpalacetower", {Ingredient("cutstone", 1), Ingredient("goldnugget", 2), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalacetower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_royalguard", {Ingredient("meat", 1), Ingredient("armorwood", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard.xml", "kyno_royalguard.tex")


AddRecipe("kyno_royalguard_2", {Ingredient("meat", 1), Ingredient("armorwood", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_2.xml", "kyno_royalguard_2.tex")


AddRecipe("kyno_royalguard_rich", {Ingredient("meat", 1), Ingredient("armorwood", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich.xml", "kyno_royalguard_rich.tex")


AddRecipe("kyno_royalguard_rich_2", {Ingredient("meat", 1), Ingredient("armorwood", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich_2.xml", "kyno_royalguard_rich_2.tex")


AddRecipe("kyno_royalguard_palace", {Ingredient("meat", 1), Ingredient("armorwood", 1), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_palace_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_royalguard_palace.xml", "kyno_royalguard_palace.tex")


AddRecipe("kyno_cavecleft", {Ingredient("rocks", 2), Ingredient("flint", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cavecleft_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cavecleft.xml", "kyno_cavecleft.tex")


AddRecipe("kyno_pigruinssmall", {Ingredient("cutstone", 1), Ingredient("cutgrass", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruinssmall_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruinssmall.xml", "kyno_pigruinssmall.tex")


AddRecipe("kyno_pigruins1", {Ingredient("cutstone", 1), Ingredient("cutgrass", 3), Ingredient("pigskin", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins1.xml", "kyno_pigruins1.tex")


AddRecipe("kyno_pigruins2", {Ingredient("cutstone", 1), Ingredient("cutgrass", 3), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins2.xml", "kyno_pigruins2.tex")


AddRecipe("kyno_pigruins3", {Ingredient("cutstone", 1), Ingredient("cutgrass", 3), Ingredient("flint", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins3.xml", "kyno_pigruins3.tex")


AddRecipe("kyno_pigruins4", {Ingredient("cutstone", 1), Ingredient("cutgrass", 3), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigruins4.xml", "kyno_pigruins4.tex")


AddRecipe("kyno_manthill", {Ingredient("twigs", 4), Ingredient("cutgrass", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_manthill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_anthill.xml", "kyno_anthill.tex")


AddRecipe("kyno_mantqueenhill", {Ingredient("cutstone", 1), Ingredient("rocks", 3), Ingredient("redgem", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mantqueenhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antqueenhill.xml", "kyno_antqueenhill.tex")


AddRecipe("kyno_antthrone", {Ingredient("rocks", 4), Ingredient("nitre", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antthrone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antthrone.xml", "kyno_antthrone.tex")


AddRecipe("kyno_ant_queen", {Ingredient("rocks", 4), Ingredient("nitre", 4), Ingredient("reviver", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ant_queen_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antqueen.xml", "kyno_antqueen.tex")


AddRecipe("kyno_antcombhome", {Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcombhome_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antcombhome.xml", "kyno_antcombhome.tex")


AddRecipe("kyno_antchest", {Ingredient("honey", 2), Ingredient("boards", 3)},
kyno_hamlettab, TECH.LOST, "kyno_antchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antchest.xml", "kyno_antchest.tex")


AddRecipe("kyno_antcache", {Ingredient("boards", 2), Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcache_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antcache.xml", "kyno_antcache.tex")


AddRecipe("kyno_aporkalypse_calendar", {Ingredient("cutstone", 1), Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aporkalypse_calendar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_calendar.xml", "kyno_calendar.tex")


AddRecipe("kyno_smashingpot", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smashingpot_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_smashingpot.xml", "kyno_smashingpot.tex")


AddRecipe("wall_pig_ruins_item", {Ingredient("thulecite", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_ancientwall.xml", "kyno_ancientwall.tex")


AddRecipe("kyno_rock_artichoke", {Ingredient("rocks", 2), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_artichoke_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_artichoke.xml", "kyno_artichoke.tex")


AddRecipe("kyno_ruins_head", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("goldnugget", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_gianthead.xml", "kyno_ruins_gianthead.tex")


AddRecipe("kyno_ruins_pigstatue", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("goldnugget", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_pigstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_pigstatue.xml", "kyno_ruins_pigstatue.tex")


AddRecipe("kyno_ruins_antstatue", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("goldnugget", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_antstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_antstatue.xml", "kyno_ruins_antstatue.tex")


AddRecipe("kyno_ruins_idolstatue", {Ingredient("rocks", 2), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_idolstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_idolstatue.xml", "kyno_ruins_idolstatue.tex")


AddRecipe("kyno_ruins_plaquestatue", {Ingredient("rocks", 2), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_plaquestatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_plaquestatue.xml", "kyno_ruins_plaquestatue.tex")


AddRecipe("kyno_ruins_trufflestatue", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("purplegem", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_trufflestatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_trufflestatue.xml", "kyno_ruins_trufflestatue.tex")


AddRecipe("kyno_ruins_sowstatue", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("bluegem", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_sowstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruins_sowstatue.xml", "kyno_ruins_sowstatue.tex")


AddRecipe("kyno_brazier", {Ingredient("cutstone", 1), Ingredient("charcoal", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_brazier_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brazier.xml", "kyno_brazier.tex")


AddRecipe("kyno_wishingwell", {Ingredient("cutstone", 1), Ingredient("ice", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_wishingwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wishingwell.xml", "kyno_wishingwell.tex")


AddRecipe("kyno_endwell", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_endwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_endwell.xml", "kyno_endwell.tex")


AddRecipe("kyno_strikingstatue", {Ingredient("cutstone", 1), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_strikingstatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dartstatue.xml", "kyno_dartstatue.tex")


AddRecipe("kyno_speartrap", {Ingredient("spear", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_speartrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_speartrap.xml", "kyno_speartrap.tex")


AddRecipe("kyno_pillar_front", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinspillar.xml", "kyno_ruinspillar.tex")


AddRecipe("kyno_pillar_front_blue", {Ingredient("cutstone", 1), Ingredient("bluegem", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_blue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_ruinspillarblue.xml", "kyno_ruinspillarblue.tex")


AddRecipe("kyno_teeteringpillar", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teeteringpillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_teeteringpillar.xml", "kyno_teeteringpillar.tex")


AddRecipe("kyno_pugaliskfountain", {Ingredient("cutstone", 2), Ingredient("ice", 4), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskfountain_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fountainyouth.xml", "kyno_fountainyouth.tex")


AddRecipe("kyno_trapdoor", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trapdoor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trapdoor.xml", "kyno_trapdoor.tex")


AddRecipe("kyno_pugaliskcorpse", {Ingredient("boneshard", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskcorpse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_snakebody.xml", "kyno_snakebody.tex")


AddRecipe("kyno_teleporter_hamlet", {Ingredient("cutstone", 1), Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teleporter_hamlet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatohamlet.xml", "kyno_potatohamlet.tex")


AddRecipe("kyno_exoticflower", {Ingredient("petals", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_exoticflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_exoticflower.xml", "kyno_exoticflower.tex")


AddRecipe("kyno_artificial_exoticflower", {Ingredient("petals", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_artificial_exoticflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_exoticflower2.xml", "kyno_exoticflower2.tex")


AddRecipe("kyno_rock_eruption", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_eruption_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_eruption.xml", "kyno_eruption.tex")


AddRecipe("kyno_rockplug", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rockplug_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rockplug.xml", "kyno_rockplug.tex")


AddRecipe("kyno_rock_batboulder", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_batboulder_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batboulder.xml", "kyno_batboulder.tex")


AddRecipe("kyno_antrock", {Ingredient("rocks", 2), Ingredient("nitre", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_antrock.xml", "kyno_antrock.tex")


AddRecipe("kyno_balloon_wreck", {Ingredient("silk", 1), Ingredient("rope", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_balloon_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_balloon.xml", "kyno_balloon.tex")


AddRecipe("kyno_basket_wreck", {Ingredient("boards", 1), Ingredient("rope", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basket_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_basket.xml", "kyno_basket.tex")


AddRecipe("kyno_flags_wreck", {Ingredient("papyrus", 1), Ingredient("rope", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flags_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flags.xml", "kyno_flags.tex")


AddRecipe("kyno_sandbag_wreck", { beachingredient1, Ingredient("rope", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sandbag_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bagsand.xml", "kyno_bagsand.tex")


AddRecipe("kyno_suitcase_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_suitcase_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_suitcase.xml", "kyno_suitcase.tex")


AddRecipe("kyno_trunk_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trunk_wreck_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_trunk.xml", "kyno_trunk.tex")


AddRecipe("kyno_grub", {Ingredient("reviver", 1), Ingredient("slurtle_shellpieces", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_grub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_grub.xml", "kyno_grub.tex")


AddRecipe("kyno_flytrap", {Ingredient("plantmeat", 2), Ingredient("houndstooth", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flytrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_flytrap.xml", "kyno_flytrap.tex")


AddRecipe("kyno_dungball", {Ingredient("poop", 1), Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungball_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dungball.xml", "kyno_dungball.tex")


AddRecipe("kyno_dungpile", {Ingredient("poop", 1), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungpile_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dungpile.xml", "kyno_dungpile.tex")


AddRecipe("kyno_gnatmound", {Ingredient("rocks", 2), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_gnatmound_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gnatmound.xml", "kyno_gnatmound.tex")


AddRecipe("kyno_mandrakehouse", {Ingredient("mandrake", 1), Ingredient("boards", 2), Ingredient("cutgrass", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mandrakehouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mandrakehouse.xml", "kyno_mandrakehouse.tex")


AddRecipe("kyno_bandittreasure", {Ingredient("feather_crow", 1), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bandittreasure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_banditcamp.xml", "kyno_banditcamp.tex")


AddRecipe("kyno_sparkpool", {Ingredient("ice", 3), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sparkpool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sparklingpool.xml", "kyno_sparklingpool.tex")


AddRecipe("kyno_bathole", {Ingredient("batwing", 1), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bathole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bathole.xml", "kyno_bathole.tex")


AddRecipe("kyno_batpit", {Ingredient("batwing", 1), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_batpit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_batpit.xml", "kyno_batpit.tex")


AddRecipe("kyno_stoneslab", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_stoneslab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_slab.xml", "kyno_slab.tex")


AddRecipe("kyno_thundernest", {Ingredient("redgem", 1), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thundernest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_thundernest.xml", "kyno_thundernest.tex")


AddRecipe("kyno_rocnest", {Ingredient("cutgrass", 3), Ingredient("twigs", 3), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rocnest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocnest.xml", "kyno_rocnest.tex")


AddRecipe("kyno_nest_house", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rochouse.xml", "kyno_rochouse.tex")


AddRecipe("kyno_nest_rusty_lamp", {Ingredient("lantern", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_rusty_lamp_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocrustylamp.xml", "kyno_rocrustylamp.tex")


AddRecipe("kyno_nest_tree1", {Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctree1.xml", "kyno_roctree1.tex")


AddRecipe("kyno_nest_tree2", {Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctree2.xml", "kyno_roctree2.tex")


AddRecipe("kyno_nest_bush", {Ingredient("cutgrass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_bush_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbush.xml", "kyno_rocbush.tex")


AddRecipe("kyno_nest_trunk", {Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_trunk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_roctrunk.xml", "kyno_roctrunk.tex")


AddRecipe("kyno_nest_branch1", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbranch1.xml", "kyno_rocbranch1.tex")


AddRecipe("kyno_nest_branch2", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocbranch2.xml", "kyno_rocbranch2.tex")


AddRecipe("kyno_nest_debris1", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick1.xml", "kyno_rocstick1.tex")


AddRecipe("kyno_nest_debris2", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick2.xml", "kyno_rocstick2.tex")


AddRecipe("kyno_nest_debris3", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick3.xml", "kyno_rocstick3.tex")


AddRecipe("kyno_nest_debris4", {Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocstick4.xml", "kyno_rocstick4.tex")


AddRecipe("kyno_nest_egg1", {Ingredient("rocks", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell1.xml", "kyno_rocshell1.tex")


AddRecipe("kyno_nest_egg2", {Ingredient("rocks", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell2.xml", "kyno_rocshell2.tex")


AddRecipe("kyno_nest_egg3", {Ingredient("rocks", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell3.xml", "kyno_rocshell3.tex")


AddRecipe("kyno_nest_egg4", {Ingredient("rocks", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocshell4.xml", "kyno_rocshell4.tex")


AddRecipe("kyno_ironhulk_spider", {Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_spider_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkspider.xml", "kyno_hulkspider.tex")


AddRecipe("kyno_ironhulk_claw", {Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_claw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkclaw.xml", "kyno_hulkclaw.tex")


AddRecipe("kyno_ironhulk_leg", {Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_leg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkleg.xml", "kyno_hulkleg.tex")


AddRecipe("kyno_ironhulk_head", {Ingredient("gears", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulkhead.xml", "kyno_hulkhead.tex")


AddRecipe("kyno_ironhulk_large", {Ingredient("gears", 2), Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_large_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_hulklarge.xml", "kyno_hulklarge.tex")


AddRecipe("kyno_bramble1", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble1.xml", "kyno_bramble1.tex")


AddRecipe("kyno_bramble2", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble2.xml", "kyno_bramble2.tex")


AddRecipe("kyno_bramble3", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bramble3.xml", "kyno_bramble3.tex")


AddRecipe("kyno_bramblecore", {Ingredient("dug_marsh_bush", 1), Ingredient("petals", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramblecore_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "bramble_bulb.tex")


AddRecipe("kyno_aloe_planted", {Ingredient("corn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aloe_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "aloe.tex")


AddRecipe("kyno_asparagus_planted", {Ingredient("asparagus", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_asparagus_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "asparagus.tex")


AddRecipe("kyno_radish_planted", {Ingredient("pepper", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_radish_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "radish.tex")


AddRecipe("kyno_leafystalk", {Ingredient("log", 4), Ingredient("succulent_picked", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_leafystalk_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_leafystalk.xml", "kyno_leafystalk.tex")


AddRecipe("kyno_vine1", {Ingredient("rope", 1), Ingredient("plantmeat", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vineone_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine1.xml", "kyno_vine1.tex")


AddRecipe("kyno_vine2", {Ingredient("rope", 1), Ingredient("cutgrass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vinetwo_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine2.xml", "kyno_vine2.tex")


AddRecipe("kyno_vine3", {Ingredient("rope", 1), Ingredient("cutgrass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_vinethree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_vine3.xml", "kyno_vine3.tex")


AddRecipe("kyno_cocoon", {Ingredient("lightbulb", 1), Ingredient("ice", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cocoon_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cocoon.xml", "kyno_cocoon.tex")


AddRecipe("kyno_junglefern", {Ingredient("foliage", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_junglefern.xml", "kyno_junglefern.tex")


AddRecipe("kyno_junglefern_green", {Ingredient("succulent_picked", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_green_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_junglefern2.xml", "kyno_junglefern2.tex")


AddRecipe("kyno_magicflower", {Ingredient("petals", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_magicflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magicflower.xml", "kyno_magicflower.tex")


AddRecipe("kyno_nettleplant", {Ingredient("cutlichen", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nettleplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_nettle.tex")


AddRecipe("kyno_tallgrass", {Ingredient("dug_grass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tallgrass_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_grass.tex")


AddRecipe("tubertree_short", {Ingredient("log", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tubertree.xml", "kyno_tubertree.tex")


AddRecipe("tubertreebloom_short", {Ingredient("log", 3), Ingredient("petals", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertreebloom_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tubertreebloom.xml", "kyno_tubertreebloom.tex")


AddRecipe("kyno_clawtree_sapling", {Ingredient("pinecone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_clawtree_sapling_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "clawpalmtree_sapling.tex")


AddRecipe("kyno_clawtree2_sapling", {Ingredient("pinecone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_clawtree2_sapling_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_red_clawtree.xml", "kyno_red_clawtree.tex")


AddRecipe("teatree_nut", {Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "teatree_nut.tex")


AddRecipe("burr", {Ingredient("twiggy_nut", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "burr.tex")


AddRecipe("rainforesttree_bloom_short", { burringredient },
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_bloom_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treebloom.xml", "kyno_treebloom.tex")


AddRecipe("rainforesttree_rot_short", { burringredient, Ingredient("spoiled_food", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_rot_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_treerot.xml", "kyno_treerot.tex")


AddRecipe("cocoonedtree_short", { burringredient, Ingredient("silk", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "cocoonedtree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_cocoonedtree.xml", "kyno_cocoonedtree.tex")


AddRecipe("kyno_pomegranate_tree", {Ingredient("pomegranate", 3), Ingredient("log", 2), Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pomegranate_tree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_appletree.xml", "kyno_appletree.tex")


AddRecipe("kyno_corkchest", {Ingredient("boards", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_corkchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "corkchest.tex")


AddRecipe("kyno_rootchest", {Ingredient("boards", 3), Ingredient("nightmarefuel", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rootchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "roottrunk.tex")


AddRecipe("kyno_truerootchest", {Ingredient("boards", 3), Ingredient("livinglog", 3), Ingredient("nightmarefuel", 3)},
kyno_hamlettab, TECH.LOST, "kyno_rootchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "roottrunk.tex")


AddRecipe("kyno_hogusporkusator", {Ingredient("boards", 4), Ingredient("pigskin", 4), Ingredient("feather_robin_winter", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_hogusporkusator_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hogusporkusator.tex")


AddRecipe("kyno_sprinkler", {Ingredient("transistor", 1), Ingredient("gears", 1), Ingredient("ice", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sprinkler_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "sprinkler.tex")


AddRecipe("kyno_smelter", {Ingredient("cutstone", 1), Ingredient("boards", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smelter_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "smelter.tex")


AddRecipe("kyno_basefan", {Ingredient("transistor", 1), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basefan_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "basefan.tex")


AddRecipe("kyno_thumper", {Ingredient("gears", 3), Ingredient("flint", 10), Ingredient("hammer", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thumper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "thumper.tex")


AddRecipe("kyno_telipad", {Ingredient("gears", 3), Ingredient("transistor", 2), Ingredient("cutstone", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_telipad_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "telipad.tex")


AddRecipe("kyno_telebrella", {Ingredient("gears", 1), Ingredient("transistor", 2), Ingredient("umbrella", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_minisign_icons_2.xml", "kyno_telebrella.tex")


AddRecipe("kyno_lawnornament_1", {Ingredient("cutgrass", 1), Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_1.tex")


AddRecipe("kyno_lawnornament_2", {Ingredient("cutgrass", 1), Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_2.tex")


AddRecipe("kyno_lawnornament_3", {Ingredient("cutgrass", 1), Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_3.tex")


AddRecipe("kyno_lawnornament_4", {Ingredient("cutgrass", 1), Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_4.tex")


AddRecipe("kyno_lawnornament_5", {Ingredient("cutgrass", 1), Ingredient("log", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_5_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_5.tex")


AddRecipe("kyno_lawnornament_6", {Ingredient("dug_berrybush", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_6_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_6.tex")


AddRecipe("kyno_lawnornament_7", {Ingredient("dug_berrybush_juicy", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_7_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_7.tex")


AddRecipe("kyno_topiary_1", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigtopiary.xml", "kyno_pigtopiary.tex")


AddRecipe("kyno_topiary_2", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_werepigtopiary.xml", "kyno_werepigtopiary.tex")


AddRecipe("kyno_topiary_3", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beefalotopiary.xml", "kyno_beefalotopiary.tex")


AddRecipe("kyno_topiary_4", {Ingredient("cutgrass", 1), Ingredient("twigs", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_pigkingtopiary.xml", "kyno_pigkingtopiary.tex")


AddRecipe("hedge_block_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_block_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_block_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_block_item.tex")
end

AddRecipe("hedge_cone_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_cone_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_cone_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_cone_item.tex")
end

AddRecipe("hedge_layered_item", {Ingredient("wall_hay_item", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_layered_item.tex")

local AGED_HEDGES = GetModConfigData("aged_hedges")
if AGED_HEDGES == 0 then
AddRecipe("hedge_layered_aged_item", {Ingredient("wall_hay_item", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hedge_layered_item.tex")
end

AddRecipe("turf_cobbleroad", {Ingredient("turf_rocky", 1), Ingredient("boards", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_cobbleroad.tex")


AddRecipe("turf_foundation", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_foundation.tex")


AddRecipe("turf_lawn", {Ingredient("cutgrass", 2), Ingredient("nitre", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_lawn.tex")


AddRecipe("turf_fields", {Ingredient("turf_grass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_fields.tex")


AddRecipe("turf_rainforest", {Ingredient("turf_grass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_rainforest.tex")


AddRecipe("turf_deepjungle", {Ingredient("turf_forest", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_deepjungle.tex")


AddRecipe("turf_gasjungle", {Ingredient("turf_marsh", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_gasjungle.tex")


AddRecipe("turf_plains", {Ingredient("turf_savanna", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_plains.tex")


AddRecipe("turf_mossy_blossom", {Ingredient("turf_deciduous", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_mossy_blossom.tex")


AddRecipe("turf_bog", {Ingredient("turf_desertdirt", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_bog.tex")


AddRecipe("turf_antcave", {Ingredient("turf_mud", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_antcave.tex")


AddRecipe("turf_batcave", {Ingredient("turf_cave", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_batcave.tex")


AddRecipe("turf_pigruins", {Ingredient("turf_underrock", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_pigruins.tex")


AddRecipe("turf_beard_hair", {Ingredient("beardhair", 2), Ingredient("cutgrass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_ham.xml", "turf_beard_hair.tex")

local VANITY = GetModConfigData("vanity_items")
if VANITY == 0 then
AddRecipe("kyno_relic_1", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_1.tex")


AddRecipe("kyno_relic_2", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_2.tex")


AddRecipe("kyno_relic_3", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_3.tex")


AddRecipe("kyno_relic_4", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_4.tex")


AddRecipe("kyno_relic_5", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "relic_5.tex")


AddRecipe("kyno_pherostone", {Ingredient("goldnugget", 3), Ingredient("rocks", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pheromonestone.tex")


AddRecipe("kyno_oinc1", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc.tex")


AddRecipe("kyno_oinc10", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc10.tex")


AddRecipe("kyno_oinc100", {Ingredient("goldnugget", 1)}, 
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "oinc100.tex")


AddRecipe("kyno_gorgecoin1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin1.tex")


AddRecipe("kyno_gorgecoin2", {Ingredient("goldnugget", 2), Ingredient("bluegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin2.tex")


AddRecipe("kyno_gorgecoin3", {Ingredient("goldnugget", 2), Ingredient("redgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin3.tex")


AddRecipe("kyno_gorgecoin4", {Ingredient("goldnugget", 2), Ingredient("opalpreciousgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "quagmire_coin4.tex")
end

AddRecipe("berries", {Ingredient("berries_juicy", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "berries.tex")


AddRecipe("berries_juicy", {Ingredient("berries", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "berries_juicy.tex")


AddRecipe("fossil_piece", {Ingredient("boneshard", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "fossil_piece.tex")


AddRecipe("bullkelp_root", {Ingredient("kelp", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "bullkelp_root.tex")


AddRecipe("fireflies", {Ingredient("lightbulb", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "fireflies.tex")


AddRecipe("kyno_redflies", {Ingredient("fireflies", 1), Ingredient("redgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_redflies.xml", "kyno_redflies.tex")


AddRecipe("kyno_orangeflies", {Ingredient("fireflies", 1), Ingredient("orangegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_orangeflies.xml", "kyno_orangeflies.tex")


AddRecipe("kyno_yellowflies", {Ingredient("fireflies", 1), Ingredient("yellowgem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_yellowflies.xml", "kyno_yellowflies.tex")


AddRecipe("kyno_greenflies", {Ingredient("fireflies", 1), Ingredient("greengem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_greenflies.xml", "kyno_greenflies.tex")


AddRecipe("kyno_blueflies", {Ingredient("fireflies", 1), Ingredient("bluegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_blueflies.xml", "kyno_blueflies.tex")


AddRecipe("kyno_cyanflies", {Ingredient("fireflies", 1), Ingredient("moonrocknugget", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_cyanflies.xml", "kyno_cyanflies.tex")


AddRecipe("kyno_purpleflies", {Ingredient("fireflies", 1), Ingredient("purplegem", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_purpleflies.xml", "kyno_purpleflies.tex")


AddRecipe("trinket_1", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_1.tex")


AddRecipe("trinket_2", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_2.tex")


AddRecipe("trinket_3", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_3.tex")


AddRecipe("trinket_4", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_4.tex")


AddRecipe("trinket_5", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_5.tex")


AddRecipe("trinket_6", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_6.tex")


AddRecipe("trinket_7", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_7.tex")


AddRecipe("trinket_8", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_8.tex")


AddRecipe("trinket_9", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_9.tex")


AddRecipe("trinket_10", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_10.tex")


AddRecipe("trinket_11", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_11.tex")


AddRecipe("trinket_12", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_12.tex")


AddRecipe("trinket_13", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_13.tex")


AddRecipe("trinket_14", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_14.tex")

-- 15 and 16 are Shadow Pices Trinket.
AddRecipe("trinket_17", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_17.tex")


AddRecipe("trinket_18", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_18.tex")


AddRecipe("trinket_19", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_19.tex")


AddRecipe("trinket_20", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_20.tex")


AddRecipe("trinket_21", {Ingredient("goldnugget", 5)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_21.tex")


AddRecipe("trinket_22", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_22.tex")


AddRecipe("trinket_23", {Ingredient("goldnugget", 3)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_23.tex")


AddRecipe("trinket_24", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_24.tex")


AddRecipe("trinket_25", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_25.tex")


AddRecipe("trinket_26", {Ingredient("goldnugget", 9)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_26.tex")


AddRecipe("trinket_27", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_27.tex")


AddRecipe("antliontrinket", {Ingredient("goldnugget", 1)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "antliontrinket.tex")


AddRecipe("trinket_32", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_32.tex")


AddRecipe("trinket_33", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_33.tex")


AddRecipe("trinket_34", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_34.tex")


AddRecipe("trinket_35", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_35.tex")


AddRecipe("trinket_36", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_36.tex")


AddRecipe("trinket_37", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_37.tex")


AddRecipe("trinket_38", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_38.tex")


AddRecipe("trinket_39", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_39.tex")


AddRecipe("trinket_40", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_40.tex")


AddRecipe("trinket_41", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_41.tex")


AddRecipe("trinket_42", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_42.tex")


AddRecipe("trinket_43", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_43.tex")


AddRecipe("trinket_44", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_44.tex")


AddRecipe("trinket_45", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_45.tex")


AddRecipe("trinket_46", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "trinket_46.tex")

-- SW Trinkets --
AddRecipe("trinket_sw_13", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_13.tex")


AddRecipe("trinket_sw_14", {Ingredient("goldnugget", 8)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_14.tex")


AddRecipe("trinket_sw_15", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_15.tex")


AddRecipe("trinket_sw_16", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_16.tex")


AddRecipe("trinket_sw_17", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_17.tex")


AddRecipe("trinket_sw_18", {Ingredient("goldnugget", 7)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_18.tex")


AddRecipe("trinket_sw_19", {Ingredient("goldnugget", 6)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_19.tex")


AddRecipe("trinket_sw_20", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_20.tex")


AddRecipe("trinket_sw_21", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_21.tex")


AddRecipe("trinket_sw_22", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_22.tex")


AddRecipe("trinket_sw_23", {Ingredient("goldnugget", 10)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "trinket_sw_23.tex")


AddRecipe("kyno_earring", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "kyno_earring.tex")

-- HAM Trinkets --
AddRecipe("trinket_ham_1", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham_2.xml", "trinket_ham_1.tex")


AddRecipe("trinket_ham_3", {Ingredient("goldnugget", 4)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham_2.xml", "trinket_ham_3.tex")


AddRecipe("halloween_ornament_1", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_1.tex")


AddRecipe("halloween_ornament_2", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_2.tex")


AddRecipe("halloween_ornament_3", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_3.tex")


AddRecipe("halloween_ornament_4", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_4.tex")


AddRecipe("halloween_ornament_5", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_5.tex")


AddRecipe("halloween_ornament_6", {Ingredient("nightmarefuel", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "halloween_ornament_6.tex")


AddRecipe("winter_ornament_plain1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain1.tex")


AddRecipe("winter_ornament_plain1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain1.tex")


AddRecipe("winter_ornament_plain2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain2.tex")


AddRecipe("winter_ornament_plain3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain3.tex")


AddRecipe("winter_ornament_plain4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain4.tex")


AddRecipe("winter_ornament_plain5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain5.tex")


AddRecipe("winter_ornament_plain6", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain6.tex")


AddRecipe("winter_ornament_plain7", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain7.tex")


AddRecipe("winter_ornament_plain8", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain8.tex")


AddRecipe("winter_ornament_plain9", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain9.tex")


AddRecipe("winter_ornament_plain10", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain10.tex")


AddRecipe("winter_ornament_plain11", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain11.tex")


AddRecipe("winter_ornament_plain12", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_plain12.tex")


AddRecipe("winter_ornament_fancy1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy1.tex")


AddRecipe("winter_ornament_fancy2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy2.tex")


AddRecipe("winter_ornament_fancy3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy3.tex")


AddRecipe("winter_ornament_fancy4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy4.tex")


AddRecipe("winter_ornament_fancy5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy5.tex")


AddRecipe("winter_ornament_fancy6", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy6.tex")


AddRecipe("winter_ornament_fancy7", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy7.tex")


AddRecipe("winter_ornament_fancy8", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_fancy8.tex")


AddRecipe("winter_ornament_festivalevents1", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents1.tex")


AddRecipe("winter_ornament_festivalevents2", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents2.tex")


AddRecipe("winter_ornament_festivalevents3", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents3.tex")


AddRecipe("winter_ornament_festivalevents4", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents4.tex")


AddRecipe("winter_ornament_festivalevents5", {Ingredient("goldnugget", 2)},
RECIPETABS.REFINE, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages.xml", "winter_ornament_festivalevents5.tex")


AddRecipe("kyno_novelty_ride", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("gears", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_novelty_ride_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_novelty_ride.xml", "kyno_novelty_ride.tex")


AddRecipe("kyno_rock_limpet", {Ingredient("rocks", 2), Ingredient("nitre", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_limpet_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_limpet.xml", "kyno_rock_limpet.tex")


AddRecipe("kyno_vinebush", {Ingredient("dug_marsh_bush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_vinebush_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bush_vine.tex")


AddRecipe("kyno_bambootree", {Ingredient("dug_sapling", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bambootree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bambootree.tex")


AddRecipe("jungletreeseed", {Ingredient("pinecone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "jungletreeseed.tex")


AddRecipe("coconut", {Ingredient("acorn", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "coconut.tex")


AddRecipe("kyno_sweet_potato_planted", { potatoingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sweet_potato_planted_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sweet_potato.tex")


AddRecipe("kyno_sandhill", { beachingredient1 },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandhill_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand.tex")


AddRecipe("seashell", {Ingredient("flint", 1), Ingredient("nitre", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seashell.tex")


AddRecipe("kyno_surfboard", {Ingredient("boards", 1), seashellingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_surfboard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "surfboard_item.tex")


AddRecipe("kyno_parrot_boat", {Ingredient("boards", 1), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_parrot_boat_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_parrot_boat.xml", "kyno_parrot_boat.tex")


AddRecipe("kyno_boat_empty", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_boat_empty_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_boat_empty.xml", "kyno_boat_empty.tex")


AddRecipe("kyno_shipmast", {Ingredient("boards", 1), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_shipmast_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_shipmast.xml", "kyno_shipmast.tex")


AddRecipe("kyno_debris_1", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_1.xml", "kyno_debris_1.tex")


AddRecipe("kyno_debris_2", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_2.xml", "kyno_debris_2.tex")


AddRecipe("kyno_debris_3", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_debris_3.xml", "kyno_debris_3.tex")


AddRecipe("kyno_crate", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_crate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_crate.xml", "kyno_crate.tex")


AddRecipe("kyno_living_jungletree", {Ingredient("livinglog", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_living_jungletree_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_living_jungletree.xml", "kyno_living_jungletree.tex")


AddRecipe("kyno_magmarock", {Ingredient("rocks", 2), Ingredient("flint", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmarock.xml", "kyno_magmarock.tex")


AddRecipe("kyno_magmarock_gold", {Ingredient("rocks", 2), Ingredient("flint", 2), Ingredient("goldnugget", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_gold_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_magmarock_gold.xml", "kyno_magmarock_gold.tex")


AddRecipe("kyno_primeape_barrel", {Ingredient("cave_banana", 2), Ingredient("poop", 2), Ingredient("twigs", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_primeape_barrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "primeapebarrel.tex")


AddRecipe("kyno_sharkittenden", { beachingredient4, Ingredient("spoiled_fish", 1), Ingredient("spoiled_fish_small", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sharkittenden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_sharkittenden.xml", "kyno_sharkittenden.tex")


AddRecipe("kyno_mermhut", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_mermhut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mermhut.xml", "kyno_mermhut.tex")


AddRecipe("kyno_fishermermhut", {Ingredient("boards", 2), Ingredient("cutstone", 1), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishermermhut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fishermermhut.xml", "kyno_fishermermhut.tex")


AddRecipe("kyno_tidalpool_small", {Ingredient("pondeel", 2), Ingredient("turf_mud", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_small_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_medium", {Ingredient("pondeel", 3), Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_medium_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_big", {Ingredient("pondeel", 4), Ingredient("turf_mud", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_big_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_poisonhole", {Ingredient("poop", 2), Ingredient("spoiled_food", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_poisonhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_poisonhole.xml", "kyno_poisonhole.tex")


AddRecipe("kyno_slotmachine", {Ingredient("boards", 2), Ingredient("goldnugget", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_slotmachine_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_slotmachine.xml", "kyno_slotmachine.tex")


AddRecipe("kyno_wildbore_house", {Ingredient("boards", 2), Ingredient("twigs", 5), Ingredient("pigskin", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_house_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wildborehouse.tex")


AddRecipe("kyno_wildbore_head", {Ingredient("pigskin", 2), Ingredient("twigs", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_head_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wildbore_head.xml", "kyno_wildbore_head.tex")


AddRecipe("kyno_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_chiminea_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "chiminea.tex")


AddRecipe("kyno_obsidian_firepit", {Ingredient("rocks", 12), Ingredient("redgem", 8), Ingredient("log", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_obsidian_firepit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "obsidianfirepit.tex")


AddRecipe("kyno_palmleaf_hut", {Ingredient("cutgrass", 3), Ingredient("rope", 3), Ingredient("twigs", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_palmleaf_hut_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "palmleaf_hut.tex")


AddRecipe("kyno_doydoy_nest",{Ingredient("twigs", 3), Ingredient("goose_feather", 2), Ingredient("tallbirdegg", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_doydoy_nest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "doydoynest.tex")


AddRecipe("kyno_icemaker", {Ingredient("heatrock", 1), Ingredient("twigs", 3), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_icemaker_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "icemaker.tex")


AddRecipe("kyno_sandcastle", { beachingredient2, Ingredient("cutgrass", 2), Ingredient("flint", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandcastle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand_castle.tex")


AddRecipe("kyno_teleporter_sw", {Ingredient("boards", 1), Ingredient("cutgrass", 2), Ingredient("nightmarefuel", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_teleporter_sw_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_potatosw.xml", "kyno_potatosw.tex")


AddRecipe("kyno_piratihatitator", {Ingredient("tophat", 1), Ingredient("robin", 1), Ingredient("boards", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_piratihatitator_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "piratihatitator.tex")


AddRecipe("kyno_buriedtreasure", {Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buriedtreasure_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_buriedtreasure.xml", "kyno_buriedtreasure.tex")


AddRecipe("kyno_geyser", {Ingredient("charcoal", 2), Ingredient("redgem", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_geyser_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_krissure.xml", "kyno_krissure.tex")


AddRecipe("kyno_lavapool", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_lavapool_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavapool.xml", "kyno_lavapool.tex")


AddRecipe("kyno_dragoonegg", {Ingredient("rocks", 2), Ingredient("redgem", 1), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonegg_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dragoonegg.xml", "kyno_dragoonegg.tex")


AddRecipe("kyno_dragoonspit", {Ingredient("redgem", 1), Ingredient("rocks", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonspit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_dragoonspit.xml", "kyno_dragoonspit.tex")


AddRecipe("kyno_sandbagsmall_item", { beachingredient2, Ingredient("rope", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_sandbagsmall_item.xml", "kyno_sandbagsmall_item.tex")


AddRecipe("wall_limestone_item", {Ingredient("cutstone", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_limestone_item.tex")


AddRecipe("wall_enforcedlimestone_land_item", {Ingredient("cutstone", 2), Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "wall_enforcedlimestone_land_item.tex")


AddRecipe("kyno_woodlegs_cage", {Ingredient("log", 2), Ingredient("rope", 2), Ingredient("goldnugget", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_woodlegs_cage_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_woodlegs_cage.xml", "kyno_woodlegs_cage.tex")


AddRecipe("kyno_seal", {Ingredient("meat", 2), Ingredient("reviver", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_seal.xml", "kyno_seal.tex")


AddRecipe("kyno_tartrap", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tartrap_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tartrap.xml", "kyno_tartrap.tex")


AddRecipe("kyno_volcanostairs", {Ingredient("cutstone", 1), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcanostairs_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcanostairs.xml", "kyno_volcanostairs.tex")


AddRecipe("kyno_dragoonden", {Ingredient("cutstone", 1), Ingredient("charcoal", 2), Ingredient("redgem", 1)}, 
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonden_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dragoonden.tex")


AddRecipe("kyno_elephantcactus_active", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("kyno_elephantcactus", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("kyno_fakecoffeebush", {Ingredient("ash", 1), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fakecoffeebush_placer", 0, nil, nil, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")


AddRecipe("kyno_rock_obsidian", {Ingredient("rocks", 2), Ingredient("redgem", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_obsidian_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_obsidian.xml", "kyno_rock_obsidian.tex")


AddRecipe("kyno_rock_charcoal", {Ingredient("charcoal", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_charcoal_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_charcoal.xml", "kyno_rock_charcoal.tex")


AddRecipe("kyno_volcano_shrub", {Ingredient("twigs", 2), Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_shrub_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano_shrub.xml", "kyno_volcano_shrub.tex")


AddRecipe("kyno_altar_pillar", {Ingredient("cutstone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_altar_pillar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_altar_pillar.xml", "kyno_altar_pillar.tex")


AddRecipe("kyno_volcano_altar", {Ingredient("cutstone", 1), Ingredient("nightmarefuel", 3), Ingredient("ash", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_altar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano_altar.xml", "kyno_volcano_altar.tex")


AddRecipe("kyno_workbench", {Ingredient("cutstone", 1), Ingredient("boards", 2), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_workbench_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_workbench.xml", "kyno_workbench.tex")


AddRecipe("turf_magmafield", {Ingredient("turf_rocky", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_magmafield.tex")


AddRecipe("turf_volcano", { magmaingredient },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano.tex")


AddRecipe("turf_ash", {Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_ash.tex")


AddRecipe("turf_volcano_rock", { magmaingredient, Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano_rock.tex")


AddRecipe("turf_tidalmarsh", {Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "turf_tidalmarsh.tex")


AddRecipe("turf_jungle", {Ingredient("turf_forest", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_jungle.tex")


AddRecipe("turf_meadow", {Ingredient("turf_grass", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_meadow.tex")


AddRecipe("turf_beach", {Ingredient("turf_desertdirt", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_beach.tex")


AddRecipe("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_snakeskinfloor.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- (Recipes that currently don't have full support)
local SEA_STRUCTURES = GetModConfigData("ocean_structures")
if SEA_STRUCTURES == 0 then
AddRecipe("mangrovetree_short", {Ingredient("log", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "mangrovetree_short_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_mangrovetree.xml", "kyno_mangrovetree.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_1", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_1.xml", "kyno_wreck_1.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_2", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_2.xml", "kyno_wreck_2.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_3", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_3.xml", "kyno_wreck_3.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_wreck_4", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_4_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wreck_4.xml", "kyno_wreck_4.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_seaweed", {Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seaweed_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seaweed.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_brain_rock", {Ingredient("rocks", 3), Ingredient("meat", 4), Ingredient(GLOBAL.CHARACTER_INGREDIENT.SANITY, 50)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_brain_rock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_brain_rock.xml", "kyno_brain_rock.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("wall_enforcedlimestone_item", {Ingredient("cutstone", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_enforcedlimestone_item.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_1", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_1_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_1.xml", "kyno_rock_coral_1.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_2", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_2.xml", "kyno_rock_coral_2.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_rock_coral_3", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_3_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_3.xml", "kyno_rock_coral_3.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_redbarrel", {Ingredient("boards", 2), Ingredient("gunpowder", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_redbarrel_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_redbarrel.xml", "kyno_redbarrel.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_bermudatriangle", {Ingredient("nightmarefuel", 4), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bermudatriangle_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_bermudatriangle.xml", "kyno_bermudatriangle.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_ballphinhouse", {Ingredient("cutstone", 3), Ingredient("fishmeat_small", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_ballphinhouse_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "ballphinhouse.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_octopusking", {Ingredient("cutstone", 5), Ingredient("fishmeat", 10), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_octopusking_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_octopusking.xml", "kyno_octopusking.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_luggagechest", {Ingredient("boards", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_luggagechest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_luggagechest.xml", "kyno_luggagechest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_fishinhole", {Ingredient("pondfish", 4), Ingredient("eel", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishinhole_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_fishinhole.xml", "kyno_fishinhole.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_buoy", {Ingredient("lantern", 1), Ingredient("twigs", 4), Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buoy_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "buoy.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)

AddRecipe("kyno_sea_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sea_chiminea_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_chiminea.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_seayard", {Ingredient("log", 4), Ingredient("cutstone", 6), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seayard_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_yard.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_extractor", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_extractor_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "tar_extractor.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_musselfarm", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_musselfarm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "mussel_stick.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_fishfarm", {Ingredient("silk", 2), Ingredient("rope", 2), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishfarm_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "fish_farm.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sealab", {Ingredient("cutstone", 4), Ingredient("transistor", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sealab_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "researchlab5.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_krakenchest", {Ingredient("boards", 4), Ingredient("boneshard", 6)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_krakenchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_krakenchest.xml", "kyno_krakenchest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_waterchest", {Ingredient("boards", 3), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_waterchest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "waterchest.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_watercrate", {Ingredient("boards", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_watercrate_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_watercrate.xml", "kyno_watercrate.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_tarpit", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tarpit_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_tarpit.xml", "kyno_tarpit.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_whalebubbles", {Ingredient("ice", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_whalebubbles_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_whalebubbles.xml", "kyno_whalebubbles.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)  


AddRecipe("kyno_seastack", {Ingredient("rocks", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_seastack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_seastack.xml", "kyno_seastack.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_saltstack", {Ingredient("rocks", 2), Ingredient("saltrock", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_saltstack_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_saltstack.xml", "kyno_saltstack.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_wobster_den", {Ingredient("rocks", 4), Ingredient("wobster_sheller_land", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wobster_den_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wobster_den.xml", "kyno_wobster_den.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_moon_wobster_den", {Ingredient("rocks", 4), Ingredient("moonglass", 2), Ingredient("wobster_moonglass_land", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moon_wobster_den_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wobster_den_moon.xml", "kyno_wobster_den_moon.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sea_grass", {Ingredient("dug_grass", 1), Ingredient("poop", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sea_grass_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "dug_grass.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_sea_reeds", {Ingredient("cutreeds", 1), Ingredient("poop", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sea_reeds_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_reeds.xml", "kyno_reeds.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_volcano", {Ingredient("rocks", 400), Ingredient("redgem", 20), Ingredient("oceanfish_small_8_inv", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_volcano.xml", "kyno_volcano.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) 


AddRecipe("kyno_lilypad", {Ingredient("kelp", 6)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lilypad_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lilypad.xml", "kyno_lilypad.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end)


AddRecipe("kyno_lotusplant", {Ingredient("kelp", 2), Ingredient("petals", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lotusplant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lotusplant.xml", "kyno_lotusplant.tex", function(pt) return not GLOBAL.TheWorld.Map:IsAboveGroundAtPoint(pt:Get()) end) end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Colour Cubes
local function getval(fn, path)
	local val = fn
	for entry in path:gmatch("[^%.]+") do
		local i=1
		while true do
			local name, value = GLOBAL.debug.getupvalue(val, i)
			if name == entry then
				val = value
				break
			elseif name == nil then
				return
			end
			i=i+1
		end
	end
	return val
end

local function setval(fn, path, new)
	local val = fn
	local prev = nil
	local i
	for entry in path:gmatch("[^%.]+") do
		i = 1
		prev = val
		while true do
			local name, value = GLOBAL.debug.getupvalue(val, i)
			if name == entry then
				val = value
				break
			elseif name == nil then
				return
			end
			i=i+1
		end
	end
	GLOBAL.debug.setupvalue(prev, i ,new)
end

local DST = GLOBAL.TheSim:GetGameID() == "DST"
if GetModConfigData("colourcubes") == 1 then
	table.insert( Assets, Asset("IMAGE","images/colourcubes/temperate_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )
	
	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/temperate_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/temperate_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/temperate_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 2 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colourcubes/sw_mild_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_wet_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/sw_green_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/SW_wet_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_wet_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_wet_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/sw_green_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/sw_green_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/sw_green_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 3 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colourcubes/sw_mild_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/snow_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/snow_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/snow_cc.tex"),
						night = resolvefilepath("images/colourcubes/snow_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 4 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colourcubes/day05_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/dusk03_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/night03_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )
	
	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/day05_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/dusk03_cc.tex"),
						night = resolvefilepath("images/colourcubes/night03_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/pork_cold_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_cold_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_cold_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_warm_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_warm_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_dry_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_dry_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 5 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colourcubes/sw_mild_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_mild_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_wet_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_wet_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_warm_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/SW_dry_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )
	
	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/sw_mild_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_mild_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_mild_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/SW_wet_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_wet_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_wet_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/pork_warm_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/pork_warm_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/SW_dry_dusk_cc.tex"),
						night = resolvefilepath("images/colourcubes/SW_dry_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 6 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colourcubes/lavaarena2_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colourcubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 7 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE", "images/colourcubes/quagmire_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colourcubes/pork_cold_bloodmoon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colourcubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colourcubes/purple_moon_cc.tex"),
					},
				})
				break
			end
		end
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Wall Code
local function IsNearOther(other, pt, min_spacing_sq)
    local spacing_sq = min_spacing_sq
    if other:HasTag("wall") then
        spacing_sq = 1
    elseif other.deploy_extra_spacing then
        spacing_sq = math.max(other.deploy_extra_spacing * other.deploy_extra_spacing, min_spacing_sq)
    end
    return other:GetDistanceSqToPoint(pt.x, 0, pt.z) < spacing_sq
end

require("components/map")
local Map = _G.Map
local MapIsDeployPointClear = Map.IsDeployPointClear
function Map:IsDeployPointClear(pt, inst, min_spacing, min_spacing_sq_fn, near_other_fn)
    return MapIsDeployPointClear(Map, pt, inst, min_spacing, min_spacing_sq_fn, near_other_fn or IsNearOther)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local KEEP_FOOD = GetModConfigData("keep_food_on_cookpot")
if KEEP_FOOD == 1 then
    AddPrefabPostInit("cookpot", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
	AddPrefabPostInit("portablecookpot", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
	AddPrefabPostInit("portablespicer", function(inst)
        if inst.components.stewer then
            inst.components.stewer.onspoil = function() 
                inst.components.stewer.spoiltime = 1
                inst.components.stewer.targettime = GLOBAL.GetTime()
                inst.components.stewer.product_spoilage = 0
            end
        end
    end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local containers = require "containers" -- Fix for containers.

local params = {}

local containers_widgetsetup_base = containers.widgetsetup
function containers.widgetsetup(container, prefab, data, ...)
    local t = params[prefab or container.inst.prefab]
    if t ~= nil then
        for k, v in pairs(t) do
            container[k] = v
        end
        container:SetNumSlots(container.widget.slotpos ~= nil and #container.widget.slotpos or 0)
    else
        containers_widgetsetup_base(container, prefab, data, ...)
    end
end

params.kyno_luggagechest = -- Fix for luggagechest aka Steamer Trunk.
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_luggagechest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_waterchest = -- Fix for waterchest aka Sea Chest.
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_waterchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_antchest = -- Fix for antchest aka Honey Chest.
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_antchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_corkchest = -- Fix for corkchest aka Cork Barrel.
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_corkchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.packim = -- Fix for packim aka Packim Baggims
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chester",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.packim.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_safechest = -- Fix for safechest aka Safe
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_safechest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.ro_bin = -- Fix for ro_bin aka Ro Bin
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chester_shadow_3x4",
        animbuild = "ui_chester_shadow_3x4",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chester",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.ro_bin.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_skullchest = -- Fix for skullchest aka Skull Chest
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_skullchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

params.kyno_ornatechest = -- Fix for ornatechest aka Ornate Chest
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chest_3x3",
        animbuild = "ui_chest_3x3",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_ornatechest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
    end
end

for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Using this now, because the old wasn't updating placer in client-side.
function Map:IsVolcano(x, y, z)
    local tile = self:GetTileAtPoint(x, y, z)
    return tile == GROUND.ASH or tile == GROUND.VOLCANO or tile == GROUND.MAGMAFIELD
end

local _CanDeployPlantAtPoint = Map.CanDeployPlantAtPoint
function Map:CanDeployPlantAtPoint(pt, inst, ...)
    if inst:HasTag("coffeebush") and inst:HasTag("coffeeplant") then
        return self:IsVolcano(pt:Get())
            and self:IsDeployPointClear(pt, inst, inst.replica.inventoryitem ~= nil and inst.replica.inventoryitem:DeploySpacingRadius() or DEPLOYSPACING_RADIUS[DEPLOYSPACING.DEFAULT])
    else
        return _CanDeployPlantAtPoint(self, pt, inst, ...)
    end
end

local _CanDeploySandbagAtPoint = Map.CanDeploySandbagAtPoint
function Map:CanDeploySandbagAtPoint(pt, inst, ...)
	for i, v in ipairs(TheSim:FindEntities(pt.x, 0, pt.z, 2, {"kyno_sandbagsmall_item"})) do
        if v ~= inst and
            v.entity:IsVisible() and
            v.components.placer == nil and
            v.entity:GetParent() == nil then
			local opt = v:GetPosition()
			if math.abs(math.abs(opt.x) - math.abs(pt.x)) < 1 and math.abs(math.abs(opt.z) - math.abs(pt.z)) < 1 then
				return false
			end
        end
    end
    return _CanDeploySandbagAtPoint(self, pt, inst, ...)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local PLACING_METHOD = GetModConfigData("PLACING_METHOD")
if PLACING_METHOD == 0 then
	for _,v in pairs(GLOBAL.AllRecipes) do
		v.min_spacing = 0
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Table For Display Mod
local TheNet = _G.TheNet
local IsServer = TheNet:GetIsServer() or TheNet:IsDedicated()

	_G.AllRecipes["table_winters_feast"].level = TechTree.Create(_G.TECH.NONE)
	local food_fx = "wintersfeast2019/winters_feast/table/fx"
	local function SetFoodSymbol(inst, foodname, override_build)
		if foodname == nil then
			inst.AnimState:ClearOverrideSymbol("swap_cooked")
		else
			inst.AnimState:OverrideSymbol("swap_cooked", override_build or "food_winters_feast_2019", foodname)
		end
	end
	
	local function change(inst)
		if inst and inst.components and inst.components.shelf then
			local old_onshelfitemfn = inst.components.shelf.onshelfitemfn
			inst.components.shelf.onshelfitemfn = function(inst, item)
				if item ~= nil then
					inst.components.trader:Disable()
					if item.prefab ~= "spoiled_food" and not item:HasTag("wintersfeastcookedfood") then 
						if item:HasTag("spicedfood") then
							local spice_start, spice_end = string.find(item.prefab, "_spice_")
							local baseprefab = string.sub(item.prefab, 1, spice_start - 1)
							local spicesymbol = string.sub(item.prefab, spice_start + 1)

							SetFoodSymbol(inst, baseprefab, item.food_symbol_build or item.AnimState:GetBuild())
							inst.AnimState:OverrideSymbol("swap_garnish", "spices", spicesymbol)
							inst.AnimState:OverrideSymbol("swap_plate", "plate_food", "plate")
						else
							SetFoodSymbol(inst, item.prefab, item.AnimState:GetBuild())
						end
						if item.components.perishable then
							item.components.perishable:StopPerishing()
						end
						inst.components.wintersfeasttable.canfeast = false
						inst.components.shelf.cantakeitem = true

						inst.AnimState:PlayAnimation("food")
						inst.AnimState:PushAnimation("idle")

						inst.SoundEmitter:PlaySound(food_fx)
					else
						old_onshelfitemfn(inst, item)
					end
				end
			end
			local old_ontakeitemfn = inst.components.shelf.ontakeitemfn
			inst.components.shelf.ontakeitemfn = function(inst, taker, item)
				if item and item.components and item.components.perishable then
					item.components.perishable:StartPerishing()
				end
				old_ontakeitemfn(inst, taker, item)
			end
		end
	end
AddPrefabPostInit("table_winters_feast", change)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------