local _G = GLOBAL
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local resolvefilepath = GLOBAL.resolvefilepath
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler
local AllRecipes = GLOBAL.AllRecipes

-- require("recipe")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
modimport("scripts/kyno_assets")
modimport("scripts/kyno_strings")
modimport("scripts/kyno_stringsparrot")
modimport("scripts/kyno_postinits")
modimport("scripts/kyno_endtable")
modimport("scripts/kyno_lights")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Assets = { -- Some Assets don't show correctly if they're not set here.
	-- Assets for Mini Signs.
    Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_ham.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_gorge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_forge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_3.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_irongate_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_pig_ruins_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_moltenfence_item.xml", 256),
	-- Common Assets.
    Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw_2.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_gorge.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_gorge.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons_2.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons_3.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons_3.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_potato.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_potato.xml"),
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
	Asset("ANIM", "anim/kyno_turfs2.zip"),
	Asset("ANIM", "anim/kyno_turfs3.zip"),
	Asset("ANIM", "anim/kyno_turfs4.zip"),
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
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PrefabFiles = {
	"k_custom_placers",
	-- VOLCANO CONTENT --
	"k_dragoonden",
	"k_elephantcactus",
	"k_rock_obsidian",
	"k_rock_charcoal",
	"k_volcano_shrub",
	"k_coffeebush",
	"k_dug_coffeebush",
	"k_fakecoffeebush",
	"k_coffeebeans",
	"k_coffee",
	"k_foods",
	"k_altar_pillar",
	"k_volcano_altar",
	"k_workbench",
	"k_sw_prototyper",
	-- SHIPWRECKED CONTENT --
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
	-- HAMLET CONTENT --
	"k_ham_prototyper",
	"k_cavecleft",
	"k_pigruins",
	"k_manthill",
	"k_pigshops",
	"k_pigtower",
	"k_pigpalace",
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
	"cactus",
	"k_tumbleweed",
	"k_reeds",
	"pumpkin_lantern",
	"birdcage",
	"birds",
	"k_plants",
	"k_sorchedground",
	"k_burnttree",
	"k_stumptree",
	"k_moonshell",
	"rock_ice",
	"k_moonbase",
	"k_rock_sinkhole",
	"k_sinkhole",
	"k_gargoyles",
	"k_moonrock_pieces",
	"k_walrus_camp",
	"k_tallbirdnest",
	"k_moosenest",
	"mooseegg",
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
	-- SEA CONTENT (Currently disabled) --
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddIngredientValues({"kyno_coffeebeans_cooked"}, {fruit=1}, true)
AddIngredientValues({"kyno_coffeebeans"}, {fruit=1}, true)
AddIngredientValues({"coconut"}, {fruit=2}, true)
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
for k, v in pairs(require("kyno_foods")) do
	if not v.tags then
		AddCookerRecipe("cookpot", v)
	end
	AddCookerRecipe("portablecookpot", v)
end

for k, v in pairs(require("kyno_food_spicer")) do
	AddCookerRecipe("portablespicer", v)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- I Took the turfs code from eXiGe's mod. I hope he doesn't get mad at me xd
if GLOBAL.TheNet:GetIsMasterSimulation() then
    local turf_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw.xml"
    for _, turf in pairs({"ash", "magmafield", "volcano", "volcano_rock", "jungle", "meadow", "snakeskinfloor", "beach", "foundation", "fields", "cobbleroad", "pigruins", "lawn"}) do
        local turf_name = "turf_"..turf
        AddPrefabPostInit(turf_name, function(inst)
            inst.components.inventoryitem.imagename = turf_name
            inst.components.inventoryitem.atlasname = turf_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw_2.xml"
    for _, turf in pairs({"tidalmarsh"}) do
        local kyno_turf_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_name
            inst.components.inventoryitem.atlasname = kyno_turf_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_ham_atlas = MODROOT.."images/inventoryimages/kyno_turfs_ham.xml"
    for _, turf in pairs({"rainforest", "plains", "deepjungle", "bog", "mossy_blossom", "gasjungle", "beard_hair", "antcave", "batcave"}) do
        local kyno_turf_ham_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_ham_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_ham_name
            inst.components.inventoryitem.atlasname = kyno_turf_ham_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_gorge_atlas = MODROOT.."images/inventoryimages/kyno_turfs_gorge.xml"
    for _, turf in pairs({"pinkpark", "pinkstone", "greyforest", "stonecity", "browncarpet"}) do
        local kyno_turf_gorge_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_gorge_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_gorge_name
            inst.components.inventoryitem.atlasname = kyno_turf_gorge_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_forge_atlas = MODROOT.."images/inventoryimages/kyno_turfs_forge.xml"
    for _, turf in pairs({"forgeroad", "forgerock"}) do
        local kyno_turf_forge_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_forge_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_forge_name
            inst.components.inventoryitem.atlasname = kyno_turf_forge_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons.xml"
    for _, item in pairs({"coconut", "wall_enforcedlimestone_item", "wall_limestone_item", "jungletreeseed", "seashell", "kyno_sandbagsmall_item", "dug_coffeebush", "coffee", "kyno_coffeebeans", "kyno_coffeebeans_cooked", "packim_fishbone"}) do
        local item_name = item
        AddPrefabPostInit(item_name, function(inst)
            inst.components.inventoryitem.imagename = item_name
            inst.components.inventoryitem.atlasname = item_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item2_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons_2.xml"
    for _, item2 in pairs({"teatree_nut", "burr", "hedge_block_item", "hedge_cone_item", "hedge_layered_item", "ro_bin_gizzard_stone"}) do
        local item2_name = item2
        AddPrefabPostInit(item2_name, function(inst)
            inst.components.inventoryitem.imagename = item2_name
            inst.components.inventoryitem.atlasname = item2_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item3_atlas = MODROOT.."images/inventoryimages/wall_pig_ruins_item.xml"
    for _, item3 in pairs({"wall_pig_ruins_item"}) do
        local item3_name = item3
        AddPrefabPostInit(item3_name, function(inst)
            inst.components.inventoryitem.imagename = item3_name
            inst.components.inventoryitem.atlasname = item3_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item4_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons_3.xml"
    for _, item4 in pairs({"hedge_block_aged_item", "hedge_cone_aged_item", "hedge_layered_aged_item"}) do
        local item4_name = item4
        AddPrefabPostInit(item4_name, function(inst)
            inst.components.inventoryitem.imagename = item4_name
            inst.components.inventoryitem.atlasname = item4_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item5_atlas = MODROOT.."images/inventoryimages/kyno_irongate_item.xml"
    for _, item5 in pairs({"kyno_irongate_item"}) do
        local item5_name = item5
        AddPrefabPostInit(item5_name, function(inst)
            inst.components.inventoryitem.imagename = item5_name
            inst.components.inventoryitem.atlasname = item5_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item6_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw_2.xml"
    for _, item6 in pairs({"wall_enforcedlimestone_land_item"}) do
        local item6_name = item6
        AddPrefabPostInit(item6_name, function(inst)
            inst.components.inventoryitem.imagename = item6_name
            inst.components.inventoryitem.atlasname = item6_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item7_atlas = MODROOT.."images/inventoryimages/kyno_moltenfence_item.xml"
    for _, item7 in pairs({"kyno_moltenfence_item"}) do
        local item7_name = item7
        AddPrefabPostInit(item7_name, function(inst)
            inst.components.inventoryitem.imagename = item7_name
            inst.components.inventoryitem.atlasname = item7_atlas
        end)
    end
end

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
-- finished food will not spoil on crock pot 
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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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

params.kyno_krakenchest = -- Fix for krakenchest aka Chest from the Depths.
{
    widget =
    {
        slotpos = {},
        animbank = "ui_chester_shadow_3x4",
        animbuild = "ui_chester_shadow_3x4",
        pos = GLOBAL.Vector3(0, 200, 0),
        side_align_tip = 160,
    },
    type = "chest",
}
for y = 2, 0, -1 do
    for x = 0, 2 do
        table.insert(params.kyno_krakenchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
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

params.kyno_rootchest = -- Fix for rootchest aka Root Trunk
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
        table.insert(params.kyno_rootchest.widget.slotpos, GLOBAL.Vector3(80 * x - 80 * 2 + 80, 80 * y - 80 * 2 + 80, 0))
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

for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- For some fucking reason the Prototyper and TechTree don't work if the recipes aren't here.
-- AddNewTechTree("BOAT", 3)
-- AddNewTechTree("PIG", 3)
-- AddNewTechTree("GNAW", 3)
-- AddNewTechTree("PUGNA", 3)
-- AddNewTechTree("CACTI", 3)
local kyno_shipwreckedtab = AddRecipeTab("Shipwrecked", 998, "images/tabimages/kyno_shipwreckedtab.xml", "kyno_shipwreckedtab.tex", nil, true)
local kyno_hamlettab = AddRecipeTab("Hamlet", 998, "images/tabimages/kyno_hamlettab.xml", "kyno_hamlettab.tex", nil, true)
local kyno_gorgetab = AddRecipeTab("The Gorge", 998, "images/tabimages/kyno_gorgetab.xml", "kyno_gorgetab.tex", nil, true)
local kyno_forgetab = AddRecipeTab("The Forge", 998, "images/tabimages/kyno_forgetab.xml", "kyno_forgetab.tex", nil, true)
local kyno_surfacetab = AddRecipeTab("Surface", 998, "images/tabimages/kyno_surfacetab.xml", "kyno_surfacetab.tex", nil, true)

local magmaingredient = Ingredient("turf_magmafield", 2)
magmaingredient.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local potatoingredient = Ingredient("potato", 1)
potatoingredient.atlas = "images/inventoryimages.xml"

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

AddRecipe("kyno_sw_prototyper", {Ingredient("boards", 4), Ingredient("pondfish", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sw_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "shipwrecked_entrance.tex")


AddRecipe("kyno_ham_prototyper", {Ingredient("boards", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ham_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "porkland_entrance.tex")


AddRecipe("kyno_gorge_prototyper", {Ingredient("cutstone", 3), Ingredient("meatballs", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_gorge_prototyper_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_gnawaltar.xml", "kyno_gnawaltar.tex")


AddRecipe("kyno_pugna", {Ingredient("hambat", 1), Ingredient("meat", 10), Ingredient("reviver", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_pugna_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pugna.xml", "kyno_pugna.tex")


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


AddRecipe("kyno_reeds", {Ingredient("cutreeds", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_reeds_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_reeds.xml", "kyno_reeds.tex")


AddRecipe("dug_sapling_moon", {Ingredient("dug_sapling", 1), Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_sapling_moon.tex")


AddRecipe("dug_rock_avocado_bush", {Ingredient("rock_avocado_fruit", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_rock_avocado_bush.tex")


AddRecipe("dug_trap_starfish", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages1.xml", "dug_trap_starfish.tex")

-- This shit wasn't working LOL.
AddRecipe("kyno_burntmarsh", {Ingredient("ash", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burntmarsh_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burntmarsh.xml", "kyno_burntmarsh.tex")


AddRecipe("red_mushroom", {Ingredient("red_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_red_mushroom_placer", 1, nil, nil, nil, "images/kyno_redmush.xml", "kyno_redmush.tex")


AddRecipe("green_mushroom", {Ingredient("green_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_green_mushroom_placer", 1, nil, nil, nil, "images/kyno_greenmush.xml", "kyno_greenmush.tex")


AddRecipe("blue_mushroom", {Ingredient("blue_cap", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_blue_mushroom_placer", 1, nil, nil, nil, "images/kyno_bluemush.xml", "kyno_bluemush.tex")


AddRecipe("flower_rose", {Ingredient("petals", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rose_placer", 0, nil, nil, nil, "images/kyno_rose.xml", "kyno_rose.tex")


AddRecipe("flower_withered", {Ingredient("cutgrass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_flower_withered_placer", 0, nil, nil, nil, "images/kyno_flowerwithered.xml", "kyno_flowerwithered.tex")


AddRecipe("cactus", {Ingredient("cactus_meat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_cactus.xml", "kyno_cactus.tex")


AddRecipe("oasis_cactus", {Ingredient("cactus_meat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_oasis_cactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_oasis_cactus.xml", "kyno_oasis_cactus.tex")


AddRecipe("kyno_tumbleweed", {Ingredient("cutgrass", 2), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tumbleweed_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tumbleweed.xml", "kyno_tumbleweed.tex")


AddRecipe("mandrake_planted", {Ingredient("mandrake", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mandrake_planted_placer", 0, nil, nil, nil, "images/kyno_mandrake_planted.xml", "kyno_mandrake_planted.tex")


AddRecipe("carrot_planted", {Ingredient("carrot", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_carrotplanted_placer", 0, nil, nil, nil, "images/kyno_carrot_planted.xml", "kyno_carrot_planted.tex")


AddRecipe("kyno_marsh_plant", {Ingredient("succulent_picked", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_plant_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_marshplant.xml", "kyno_marshplant.tex")


AddRecipe("kyno_plant_algae", {Ingredient("cutlichen", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_plant_algae_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_caveplant.xml", "kyno_caveplant.tex")


AddRecipe("succulent_plant", {Ingredient("cutgrass", 1), Ingredient("seeds", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_succulent_plant_placer", 0, nil, nil, nil, "images/inventoryimages.xml", "succulent_picked.tex")


AddRecipe("kyno_pondrock", {Ingredient("rocks", 1), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondrock_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedrock.xml", "kyno_scorchedrock.tex")


AddRecipe("kyno_scorchedground", {Ingredient("ash", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedground_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_scorchedground.xml", "kyno_scorchedground.tex")


AddRecipe("kyno_burnttree_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree.xml", "kyno_burnttree.tex")


AddRecipe("kyno_burnttree2_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree2_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree2_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree2.xml", "kyno_burnttree2.tex")


AddRecipe("kyno_burnttree3_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree3_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree3_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree3.xml", "kyno_burnttree3.tex")


AddRecipe("kyno_burnttree4_short", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_normal", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree4_tall", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree4_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree4.xml", "kyno_burnttree4.tex")


AddRecipe("kyno_burnttree5", {Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_burnttree5_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_burnttree5.xml", "kyno_burnttree5.tex")


AddRecipe("kyno_stump_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump_short.xml", "kyno_stump_short.tex")


AddRecipe("kyno_stump_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump_normal.xml", "kyno_stump_normal.tex")


AddRecipe("kyno_stump_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump_tall.xml", "kyno_stump_tall.tex")


AddRecipe("kyno_stump2_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump2_short.xml", "kyno_stump2_short.tex")


AddRecipe("kyno_stump2_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump2_normal.xml", "kyno_stump2_normal.tex")


AddRecipe("kyno_stump2_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump2_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump2_tall.xml", "kyno_stump2_tall.tex")


AddRecipe("kyno_stump3_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump3_short.xml", "kyno_stump3_short.tex")


AddRecipe("kyno_stump3_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump3_normal.xml", "kyno_stump3_normal.tex")


AddRecipe("kyno_stump3_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump3_tall.xml", "kyno_stump3_tall.tex")


AddRecipe("kyno_stump3_old", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump3_old_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump3_old.xml", "kyno_stump3_old.tex")


AddRecipe("kyno_stump4_short", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump4_short.xml", "kyno_stump4_short.tex")


AddRecipe("kyno_stump4_normal", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_normal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump4_normal.xml", "kyno_stump4_normal.tex")


AddRecipe("kyno_stump4_tall", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump4_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump4_tall.xml", "kyno_stump4_tall.tex")


AddRecipe("kyno_stump5", {Ingredient("log", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_stump5_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_stump5.xml", "kyno_stump5.tex")


AddRecipe("lumpy_sapling", {Ingredient("pinecone", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lumpy_sapling_placer", 1, nil, nil, nil, "images/kyno_lumpysapling.xml", "kyno_lumpysapling.tex")


AddRecipe("marsh_tree", {Ingredient("log", 3), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marsh_tree_placer", 1, nil, nil, nil, "images/kyno_marsh_tree.xml", "kyno_marsh_tree.tex")


AddRecipe("rock_petrified_tree_short", {Ingredient("rocks", 1), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_short_placer", 1, nil, nil, nil, "images/kyno_rocktree_short.xml", "kyno_rocktree_short.tex")


AddRecipe("rock_petrified_tree_med", {Ingredient("rocks", 2), Ingredient("nitre", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_placer", 1, nil, nil, nil, "images/kyno_rocktree.xml", "kyno_rocktree.tex")


AddRecipe("rock_petrified_tree_tall", {Ingredient("rocks", 3), Ingredient("nitre", 3), Ingredient("flint", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_tall_placer", 1, nil, nil, nil, "images/kyno_rocktree_tall.xml", "kyno_rocktree_tall.tex")


AddRecipe("rock_petrified_tree_old", {Ingredient("rocks", 2), Ingredient("nitre", 1), Ingredient("flint", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_petrified_tree_old_placer", 1, nil, nil, nil, "images/kyno_rocktree_old.xml", "kyno_rocktree_old.tex")


AddRecipe("kyno_marbletree_1", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree1_placer", 1, nil, nil, nil, "images/kyno_marbletree1.xml", "kyno_marbletree1.tex")


AddRecipe("kyno_marbletree_2", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree2_placer", 1, nil, nil, nil, "images/kyno_marbletree2.xml", "kyno_marbletree2.tex")


AddRecipe("kyno_marbletree_3", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree3_placer", 1, nil, nil, nil, "images/kyno_marbletree3.xml", "kyno_marbletree3.tex")


AddRecipe("kyno_marbletree_4", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marbletree4_placer", 1, nil, nil, nil, "images/kyno_marbletree4.xml", "kyno_marbletree4.tex")


AddRecipe("kyno_rock_sinkhole", {Ingredient("rocks", 4), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock_sinkhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sinkholerock.xml", "kyno_sinkholerock.tex")


AddRecipe("kyno_sinkhole", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sinkhole.xml", "kyno_sinkhole.tex")


AddRecipe("kyno_sinkhole_closed", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_closed_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sinkholeclosed.xml", "kyno_sinkholeclosed.tex")


AddRecipe("kyno_sinkhole_vip", {Ingredient("rocks", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sinkhole_vip_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sinkholevip.xml", "kyno_sinkholevip.tex")


AddRecipe("kyno_cavehole", {Ingredient("rocks", 3), Ingredient("rope", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_cavehole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_cavehole.xml", "kyno_cavehole.tex")


AddRecipe("rock1", {Ingredient("rocks", 3), Ingredient("nitre", 1), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock1_placer", 1, nil, nil, nil, "images/kyno_rock1.xml", "kyno_rock1.tex")


AddRecipe("rock2", {Ingredient("rocks", 3), Ingredient("goldnugget", 1), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rock2_placer", 1, nil, nil, nil, "images/kyno_rock2.xml", "kyno_rock2.tex")


AddRecipe("rock_flintless", {Ingredient("rocks", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockflintless_placer", 1, nil, nil, nil, "images/kyno_rockflintless.xml", "kyno_rockflintless.tex")


AddRecipe("rock_ice", {Ingredient("ice", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockice_placer", 1, nil, nil, nil, "images/kyno_rockice.xml", "kyno_rockice.tex")


AddRecipe("rock_moon", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rockmoon_placer", 1, nil, nil, nil, "images/kyno_rockmoon.xml", "kyno_rockmoon.tex")


AddRecipe("kyno_moonshell", {Ingredient("rocks", 3), Ingredient("moonrocknugget", 2), Ingredient("flint", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonshell_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rockmoonshell.xml", "kyno_rockmoonshell.tex")


AddRecipe("moonglass_rock", {Ingredient("moonglass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonglass_placer", 1, nil, nil, nil, "images/kyno_moonglass.xml", "kyno_moonglass.tex")


AddRecipe("kyno_moonrock_pieces", {Ingredient("moonrocknugget", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonrubble_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_moonrubble.xml", "kyno_moonrubble.tex")


AddRecipe("kyno_hound_gargoyle_1", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonhound.xml", "kyno_moonhound.tex")


AddRecipe("kyno_hound_gargoyle_2", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonhound2.xml", "kyno_moonhound2.tex")


AddRecipe("kyno_hound_gargoyle_3", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonhound3.xml", "kyno_moonhound3.tex")


AddRecipe("kyno_hound_gargoyle_4", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hound_gargoyle_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonhound4.xml", "kyno_moonhound4.tex")


AddRecipe("kyno_werepig_gargoyle_1", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig.xml", "kyno_moonpig.tex")


AddRecipe("kyno_werepig_gargoyle_2", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig2.xml", "kyno_moonpig2.tex")


AddRecipe("kyno_werepig_gargoyle_3", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig3.xml", "kyno_moonpig3.tex")


AddRecipe("kyno_werepig_gargoyle_4", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig4.xml", "kyno_moonpig4.tex")


AddRecipe("kyno_werepig_gargoyle_5", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_5_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig5.xml", "kyno_moonpig5.tex")


AddRecipe("kyno_werepig_gargoyle_6", {Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_werepig_gargoyle_6_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_moonpig6.xml", "kyno_moonpig6.tex")


AddRecipe("kyno_moonbase", {Ingredient("moonrocknugget", 15), Ingredient("nightmarefuel", 10), Ingredient("opalpreciousgem", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonbase_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_moonbase.xml", "kyno_moonbase.tex")


AddRecipe("pigtorch", {Ingredient("log", 4), Ingredient("poop", 2), Ingredient("charcoal", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigtorch_placer", 1, nil, nil, nil, "images/kyno_pigtorch.xml", "kyno_pigtorch.tex")


AddRecipe("mermhouse", {Ingredient("boards", 4), Ingredient("rocks", 3), Ingredient("pondfish", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rundown_placer", 1, nil, nil, nil, "images/kyno_rundown.xml", "kyno_rundown.tex")


AddRecipe("kyno_walrus_camp", {Ingredient("cutstone", 3), Ingredient("walrus_tusk", 1), Ingredient("log", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_walrus_camp_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_igloo.xml", "kyno_igloo.tex")


AddRecipe("rabbithole", {Ingredient("rabbit", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rabbithole_placer", 1, nil, nil, nil, "images/kyno_rabbithole.xml", "kyno_rabbithole.tex")


AddRecipe("catcoonden", {Ingredient("log", 4), Ingredient("silk", 2), Ingredient("coontail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hollowstump_placer", 1, nil, nil, nil, "images/kyno_hollowstump.xml", "kyno_hollowstump.tex")


AddRecipe("houndmound", {Ingredient("houndstooth", 4), Ingredient("boneshard", 2), Ingredient("monstermeat", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndmound_placer", 1, nil, nil, nil, "images/kyno_houndmound.xml", "kyno_houndmound.tex")


AddRecipe("kyno_tallbirdnest", {Ingredient("tallbirdegg", 1), Ingredient("cutgrass", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_tallbirdnest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tallbirdnest.xml", "kyno_tallbirdnest.tex")


AddRecipe("beehive", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_beehive_placer", 1, nil, nil, nil, "images/kyno_beehive.xml", "kyno_beehive.tex")


AddRecipe("wasphive", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_wasphive_placer", 1, nil, nil, nil, "images/kyno_wasphive.xml", "kyno_wasphive.tex")


AddRecipe("moose_nesting_ground", {Ingredient("twigs", 15)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_nestground_placer", 1, nil, nil, nil, "images/kyno_nestground.xml", "kyno_nestground.tex")


AddRecipe("kyno_goosenest", {Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_goosenest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_goosenest.xml", "kyno_goosenest.tex")


AddRecipe("kyno_goosenestegg", {Ingredient("bird_egg", 10), Ingredient("cutgrass", 4), Ingredient("twigs", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_goosenestegg_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_goosenestegg.xml", "kyno_goosenestegg.tex")


AddRecipe("kyno_honeypatch", {Ingredient("honey", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_honeypatch_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_honeypatch.xml", "kyno_honeypatch.tex")


AddRecipe("kyno_giantbeehive_small", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_small_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_beehivesmall.xml", "kyno_beehivesmall.tex")


AddRecipe("kyno_giantbeehive_medium", {Ingredient("honey", 6), Ingredient("honeycomb", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_medium_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_beehivemedium.xml", "kyno_beehivemedium.tex")


AddRecipe("kyno_giantbeehive", {Ingredient("honey", 10), Ingredient("honeycomb", 1), Ingredient("hivehat", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_giantbeehive_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_beehivelarge.xml", "kyno_beehivelarge.tex")


AddRecipe("kyno_klausbag", {Ingredient("deer_antler1", 1), Ingredient("silk", 6), Ingredient("charcoal", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_klausbag.xml", "kyno_klausbag.tex")


AddRecipe("kyno_klausbag_winter", {Ingredient("deer_antler3", 1), Ingredient("silk", 6), Ingredient("charcoal", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_klausbag_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_klausbag_winter.xml", "kyno_klausbag_winter.tex")


AddRecipe("kyno_molehill", {Ingredient("mole", 1), Ingredient("nitre", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_molehill_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_molehill.xml", "kyno_molehill.tex")


AddRecipe("moonspiderden", {Ingredient("spidereggsack", 1), Ingredient("moonrocknugget", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_moonspiderden_placer", 1, nil, nil, nil, "images/kyno_moonspiderden.xml", "kyno_moonspiderden.tex")


AddRecipe("kyno_statueglommer", {Ingredient("glommerwings", 1), Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueglommer_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_glommerstatue.xml", "kyno_glommerstatue.tex")


AddRecipe("kyno_statuemaxwell", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuemaxwell_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuemaxwell.xml", "kyno_statuemaxwell.tex")


AddRecipe("statueharp", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueharp_placer", 1, nil, nil, nil, "images/kyno_statueharp.xml", "kyno_statueharp.tex")


AddRecipe("kyno_statueangel", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueangel_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statueangel.xml", "kyno_statueangel.tex")


AddRecipe("marblepillar", {Ingredient("marble", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_marblepillar_placer", 1, nil, nil, nil, "images/kyno_marblepillar.xml", "kyno_marblepillar.tex")


AddRecipe("kyno_statue_marble_muse", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_muse_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuemarble1.xml", "kyno_statuemarble1.tex")


AddRecipe("kyno_statue_marble", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuemarble2.xml", "kyno_statuemarble2.tex")


AddRecipe("kyno_statue_marble_urn", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_urn_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuemarble3.xml", "kyno_statuemarble3.tex")


AddRecipe("kyno_statue_marble_pawn", {Ingredient("marble", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statue_marble_pawn_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuemarble4.xml", "kyno_statuemarble4.tex")


AddRecipe("kyno_statuerook", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuerook.xml", "kyno_statuerook.tex")


AddRecipe("kyno_statueknight", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statueknight.xml", "kyno_statueknight.tex")


AddRecipe("kyno_statuebishop", {Ingredient("marble", 3), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuebishop.xml", "kyno_statuebishop.tex")


AddRecipe("kyno_statuerook_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuerook_repaired_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuerook_fixed.xml", "kyno_statuerook_fixed.tex")


AddRecipe("kyno_statueknight_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statueknight_repaired_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statueknight_fixed.xml", "kyno_statueknight_fixed.tex")


AddRecipe("kyno_statuebishop_repaired", {Ingredient("marble", 4), Ingredient("gears", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_statuebishop_repaired_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_statuebishop_fixed.xml", "kyno_statuebishop_fixed.tex")


AddRecipe("kyno_sculpture_rooknose", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_rooknose_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "sculpture_rooknose.tex")


AddRecipe("kyno_sculpture_knighthead", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_knighthead_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "sculpture_knighthead.tex")


AddRecipe("kyno_sculpture_bishophead", {Ingredient("marble", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bishophead_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "sculpture_bishophead.tex")


AddRecipe("kyno_sandspike_small", {Ingredient("turf_desertdirt", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_small_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sandspike_small.xml", "kyno_sandspike_small.tex")


AddRecipe("kyno_sandspike_med", {Ingredient("turf_desertdirt", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_med_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sandspike_med.xml", "kyno_sandspike_med.tex")


AddRecipe("kyno_sandspike_tall", {Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandspike_tall_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sandspike_tall.xml", "kyno_sandspike_tall.tex")


AddRecipe("kyno_sandblock", {Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sandblock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sandblock.xml", "kyno_sandblock.tex")


AddRecipe("glassspike_short", {Ingredient("turf_desertdirt", 2), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_short.xml", "kyno_glassspike_short.tex")


AddRecipe("glassspike_med", {Ingredient("turf_desertdirt", 3), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_med.xml", "kyno_glassspike_med.tex")


AddRecipe("glassspike_tall", {Ingredient("turf_desertdirt", 4), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassspike_tall.xml", "kyno_glassspike_tall.tex")


AddRecipe("glassblock", {Ingredient("turf_desertdirt", 4), Ingredient("torch", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/kyno_glassblock.xml", "kyno_glassblock.tex")


AddRecipe("kyno_altar_glass", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_glass_placer", 1, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_glass.tex")


AddRecipe("kyno_altar_idol", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_idol_placer", 1, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_idol.tex")


AddRecipe("kyno_altar_seed", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_seed_placer", 1, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_seed.tex")


AddRecipe("kyno_altar_crown", {Ingredient("moonrocknugget", 4), Ingredient("moonglass", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_altar_crown_placer", 1, nil, nil, nil, "images/inventoryimages1.xml", "moon_altar_crown.tex")


AddRecipe("kyno_invitingformation1", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_invitingformation1.xml", "kyno_invitingformation1.tex")


AddRecipe("kyno_invitingformation2", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_invitingformation2.xml", "kyno_invitingformation2.tex")


AddRecipe("kyno_invitingformation3", {Ingredient("rocks", 4), Ingredient("moonrocknugget", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_invitingformation3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_invitingformation3.xml", "kyno_invitingformation3.tex")


AddRecipe("kyno_obelisk", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_obelisk_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_obelisk.xml", "kyno_obelisk.tex")


AddRecipe("kyno_sanityrock", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_sanityrock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_obelisksanity.xml", "kyno_obelisksanity.tex")


AddRecipe("kyno_insanityrock", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_insanityrock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_obeliskinsanity.xml", "kyno_obeliskinsanity.tex")


AddRecipe("kyno_pigking", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pigking.xml", "kyno_pigking.tex")


AddRecipe("kyno_pigking_elite", {Ingredient("meat", 10), Ingredient("reviver", 1), Ingredient("pigskin", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pigking_elite_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pigking_elite.xml", "kyno_pigking_elite.tex")


AddRecipe("kyno_critterlab", {Ingredient("rocks", 6), Ingredient("cutgrass", 6), Ingredient("seeds", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_critterlab_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rockden.xml", "kyno_rockden.tex")


AddRecipe("kyno_pighead", {Ingredient("twigs", 2), Ingredient("pigskin", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pighead_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pighead.xml", "kyno_pighead.tex")


AddRecipe("kyno_mermhead", {Ingredient("twigs", 2), Ingredient("pondfish", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_mermhead_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mermhead.xml", "kyno_mermhead.tex")


AddRecipe("kyno_bunnyhead", {Ingredient("twigs", 2), Ingredient("manrabbit_tail", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bunnyhead_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bunnyhead.xml", "kyno_bunnyhead.tex")


AddRecipe("kyno_touchstone", {Ingredient("rocks", 10), Ingredient("marble", 10), Ingredient("nightmarefuel", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_touchstone_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_touchstone.xml", "kyno_touchstone.tex")


AddRecipe("kyno_portalstone", {Ingredient("cutstone", 4), Ingredient("nightmarefuel", 10), Ingredient("petals", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalstone_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_floridpostern.xml", "kyno_floridpostern.tex")


AddRecipe("kyno_portalbuilding", {Ingredient("multiplayer_portal_moonrock_constr_plans", 1), Ingredient("nightmarefuel", 10), Ingredient("petals", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_portalbuilding_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_portalbuilding.xml", "kyno_portalbuilding.tex")


AddRecipe("kyno_celestialportal", {Ingredient("purplemooneye", 1), Ingredient("nightmarefuel", 10), Ingredient("moonrocknugget", 12)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_celestialportal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_celestialportal.xml", "kyno_celestialportal.tex")


AddRecipe("kyno_lake", {Ingredient("ice", 16), Ingredient("pondfish", 4), Ingredient("turf_desertdirt", 4)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_lake_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_lake.xml", "kyno_lake.tex")


AddRecipe("kyno_pond", {Ingredient("ice", 8), Ingredient("pondfish", 2), Ingredient("froglegs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pond_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pond.xml", "kyno_pond.tex")


AddRecipe("kyno_pondmarsh", {Ingredient("ice", 8), Ingredient("pondfish", 2), Ingredient("mosquito", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondmarsh_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pondmarsh.xml", "kyno_pondmarsh.tex")


AddRecipe("kyno_pondlava", {Ingredient("ice", 8), Ingredient("redgem", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_pondlava_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pondmagma.xml", "kyno_pondmagma.tex")


AddRecipe("kyno_hotspring", {Ingredient("moonglass", 5)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_hotspring_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hotspring.xml", "kyno_hotspring.tex")


AddRecipe("kyno_basalt1", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_basalt1.xml", "kyno_basalt1.tex")


AddRecipe("kyno_basalt2", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_basalt2.xml", "kyno_basalt2.tex")


AddRecipe("kyno_basalt4", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_basalt4.xml", "kyno_basalt4.tex")


AddRecipe("kyno_basalt3", {Ingredient("rocks", 10), Ingredient("flint", 10)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_basalt3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_basalt3.xml", "kyno_basalt3.tex")


AddRecipe("driftwood_small1", {Ingredient("driftwood_log", 2), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood1_placer", 1, nil, nil, nil, "images/kyno_driftwood1.xml", "kyno_driftwood1.tex")


AddRecipe("driftwood_small2", {Ingredient("driftwood_log", 2), Ingredient("twigs", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood2_placer", 1, nil, nil, nil, "images/kyno_driftwood2.xml", "kyno_driftwood2.tex")


AddRecipe("driftwood_tall", {Ingredient("driftwood_log", 4), Ingredient("twigs", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_driftwood3_placer", 1, nil, nil, nil, "images/kyno_driftwood3.xml", "kyno_driftwood3.tex")


AddRecipe("houndbone", {Ingredient("boneshard", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_houndbone_placer", 1, nil, nil, nil, "images/kyno_bones.xml", "kyno_bones.tex")


AddRecipe("kyno_bonemound", {Ingredient("boneshard", 2), Ingredient("houndstooth", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_bonemound_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bonemound.xml", "kyno_bonemound.tex")


AddRecipe("dead_sea_bones", {Ingredient("boneshard", 2)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_seabones_placer", 1, nil, nil, nil, "images/kyno_seabones.xml", "kyno_seabones.tex")


AddRecipe("skeleton", {Ingredient("boneshard", 3)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_skeleton_placer", 1, nil, nil, nil, "images/kyno_skeleton.xml", "kyno_skeleton.tex")


AddRecipe("kyno_scorchedskeleton", {Ingredient("boneshard", 3), Ingredient("charcoal", 1)},
kyno_surfacetab, TECH.SCIENCE_TWO, "kyno_scorchedskeleton_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_crispyskeleton.xml", "kyno_crispyskeleton.tex")


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


AddRecipe("kyno_magmagolem", {Ingredient("rocks", 4), Ingredient("redgem", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_magmagolem_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magmagolem.xml", "kyno_magmagolem.tex")


AddRecipe("kyno_shieldstandard", {Ingredient("boards", 1), Ingredient("purplegem", 1), Ingredient("houndstooth", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_shieldstandard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_purplestandard.xml", "kyno_purplestandard.tex")


AddRecipe("kyno_attackstandard", {Ingredient("boards", 1), Ingredient("redgem", 1), Ingredient("boneshard", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_attackstandard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_redstandard.xml", "kyno_redstandard.tex")


AddRecipe("kyno_healstandard", {Ingredient("boards", 1), Ingredient("bluegem", 1), Ingredient("petals", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healstandard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bluestandard.xml", "kyno_bluestandard.tex")


AddRecipe("kyno_bannerstandard", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_banner1.xml", "kyno_banner1.tex")


AddRecipe("kyno_bannerstandard_2", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_banner2.xml", "kyno_banner2.tex")


AddRecipe("kyno_bannerstandard_3", {Ingredient("boards", 1), Ingredient("silk", 2), Ingredient("boneshard", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_bannerstandard_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_banner3.xml", "kyno_banner3.tex")


AddRecipe("kyno_lavaspawner", {Ingredient("cutstone", 1), Ingredient("redgem", 1), Ingredient("boneshard", 3)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavaspawner_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavaspawner.xml", "kyno_lavaspawner.tex")


AddRecipe("kyno_lavagateway", {Ingredient("cutstone", 2), Ingredient("redgem", 2), Ingredient("nightmarefuel", 4)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavagateway_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_lavagateway.xml", "kyno_lavagateway.tex")


AddRecipe("kyno_anchorgateway", {Ingredient("cutstone", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_anchorgateway_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_anchorgateway.xml", "kyno_anchorgateway.tex")


AddRecipe("kyno_moltenfence_item", {Ingredient("fence_item", 4), Ingredient("boneshard", 2)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_moltenfence.xml", "kyno_moltenfence.tex")


AddRecipe("kyno_lavahole", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_lavahole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_lavahole.xml", "kyno_lavahole.tex")


AddRecipe("kyno_healflower", {Ingredient("petals", 1), Ingredient("nightmarefuel", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, "kyno_healflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_healblossom.xml", "kyno_healblossom.tex")


AddRecipe("turf_forgerock", {Ingredient("turf_rocky", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgerock.tex")


AddRecipe("turf_forgeroad", {Ingredient("turf_road", 2), Ingredient("redgem", 1)},
kyno_forgetab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_forge.xml", "turf_forgeroad.tex")


AddRecipe("kyno_queenaltar", {Ingredient("cutstone", 4), Ingredient("redgem", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_queenaltar_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_queenaltar.xml", "kyno_queenaltar.tex")


AddRecipe("kyno_beaststatue", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1.xml", "kyno_beaststatue1.tex")


AddRecipe("kyno_beaststatue_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue1_left.xml", "kyno_beaststatue1_left.tex")


AddRecipe("kyno_beaststatue2", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2.xml", "kyno_beaststatue2.tex")


AddRecipe("kyno_beaststatue2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_beaststatue2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_beaststatue2_left.xml", "kyno_beaststatue2_left.tex")


AddRecipe("kyno_bollard", {Ingredient("cutstone", 1)},
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


AddRecipe("kyno_saltpond_rack", {Ingredient("saltrock", 2), Ingredient("ice", 4), Ingredient("twigs", 4)},
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


AddRecipe("kyno_worshipper2_left", {Ingredient("cutstone", 1), Ingredient("redgem", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_worshipper2_left_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_worshipper2_left.xml", "kyno_worshipper2_left.tex")


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
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_potato_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_2.tex")


AddRecipe("kyno_turnip_planted", {Ingredient("eggplant_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_turnip_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_5.tex")


AddRecipe("kyno_carrot_planted", {Ingredient("carrot_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_carrot_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_6.tex")


AddRecipe("kyno_onion_planted", {Ingredient("onion_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_onion_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_4.tex")


AddRecipe("kyno_wheat_planted", {Ingredient("cutgrass", 2)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_wheat_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_1.tex")


AddRecipe("kyno_garlic_planted", {Ingredient("garlic_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "kyno_garlic_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_7.tex")


AddRecipe("kyno_tomato_planted", {Ingredient("tomato_seeds", 1)},
kyno_gorgetab, TECH.SCIENCE_TWO, "Kyno_tomato_planted_placer", 1, nil, nil, nil, "images/inventoryimages.xml", "quagmire_seedpacket_3.tex")


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
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lamppost_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "city_lamp.tex")


AddRecipe("kyno_pighouse_farm", {Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_farm_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_farmhouse.xml", "kyno_farmhouse.tex")


AddRecipe("kyno_pighouse_city", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pighouse_city_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pighouse_city.tex")


AddRecipe("kyno_pigshop_deli", {Ingredient("boards", 4), Ingredient("honeyham", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_deli_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_deli.tex")


AddRecipe("kyno_pigshop_general", {Ingredient("boards", 4), Ingredient("axe", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_general_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_general.tex")


AddRecipe("kyno_pigshop_spa", {Ingredient("boards", 4), Ingredient("bandage", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_spa_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hoofspa.tex")


AddRecipe("kyno_pigshop_produce", {Ingredient("boards", 4), Ingredient("eggplant", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_produce_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_produce.tex")


AddRecipe("kyno_pigshop_flower", {Ingredient("boards", 4), Ingredient("petals", 12), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_flower_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_florist.tex")


AddRecipe("kyno_pigshop_antiquities", {Ingredient("boards", 4), Ingredient("hammer", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_antiquities_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_antiquities.tex")


AddRecipe("kyno_pigshop_arcane", {Ingredient("boards", 4), Ingredient("nightmarefuel", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_arcane_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_arcane.tex")


AddRecipe("kyno_pigshop_weapons", {Ingredient("boards", 4), Ingredient("spear", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_weapons_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_weapons.tex")


AddRecipe("kyno_pigshop_hatshop", {Ingredient("boards", 4), Ingredient("tophat", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_hatshop_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_hatshop.tex")


AddRecipe("kyno_pigshop_bank", {Ingredient("cutstone", 3), Ingredient("goldnugget", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_bank_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_bank.tex")


AddRecipe("kyno_pigshop_tinker", {Ingredient("cutstone", 3), Ingredient("boards", 3), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_tinker_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_tinker.tex")


AddRecipe("kyno_pigshop_academy", {Ingredient("cutstone", 3), Ingredient("papyrus", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_academy_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_academy.xml", "kyno_academy.tex")


AddRecipe("kyno_pigshop_cityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_cityhall_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigshop_mycityhall", {Ingredient("boards", 3), Ingredient("goldnugget", 4), Ingredient("silk", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigshop_mycityhall_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_shop_cityhall_player.tex")


AddRecipe("kyno_pigpalace", {Ingredient("marble", 4), Ingredient("goldnugget", 4), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalace_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_pigpalace.xml", "kyno_pigpalace.tex")


AddRecipe("kyno_playerhouse", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "playerhouse_city.tex")


AddRecipe("kyno_playerhouse_manor", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_manor_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_manor_craft.tex")


AddRecipe("kyno_playerhouse_cottage", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_cottage_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_cottage_craft.tex")


AddRecipe("kyno_playerhouse_tudor", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_tudor_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_tudor_craft.tex")


AddRecipe("kyno_playerhouse_villa", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_villa_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_villa_craft.tex")


AddRecipe("kyno_playerhouse_gothic", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_gothic_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_gothic_craft.tex")


AddRecipe("kyno_playerhouse_brick", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_brick_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_brick_craft.tex")


AddRecipe("kyno_playerhouse_turret", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("goldnugget", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_playerhouse_turret_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "player_house_turret_craft.tex")


AddRecipe("kyno_pigtower3", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower3_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigtower2", {Ingredient("cutstone", 3), Ingredient("spear", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigtower2_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_pigpalacetower", {Ingredient("cutstone", 3), Ingredient("goldnugget", 2), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigpalacetower_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "pig_guard_tower.tex")


AddRecipe("kyno_royalguard", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_royalguard.xml", "kyno_royalguard.tex")


AddRecipe("kyno_royalguard_2", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_royalguard_2.xml", "kyno_royalguard_2.tex")


AddRecipe("kyno_royalguard_rich", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich.xml", "kyno_royalguard_rich.tex")


AddRecipe("kyno_royalguard_rich_2", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_rich_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_royalguard_rich_2.xml", "kyno_royalguard_rich_2.tex")


AddRecipe("kyno_royalguard_palace", {Ingredient("meat", 2), Ingredient("armorwood", 1), Ingredient("pigskin", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_royalguard_palace_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_royalguard_palace.xml", "kyno_royalguard_palace.tex")


AddRecipe("kyno_cavecleft", {Ingredient("rocks", 5), Ingredient("flint", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cavecleft_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_cavecleft.xml", "kyno_cavecleft.tex")


AddRecipe("kyno_pigruinssmall", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruinssmall_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_pigruinssmall.xml", "kyno_pigruinssmall.tex")


AddRecipe("kyno_pigruins1", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("pigskin", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins1_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_pigruins1.xml", "kyno_pigruins1.tex")


AddRecipe("kyno_pigruins2", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins2_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_pigruins2.xml", "kyno_pigruins2.tex")


AddRecipe("kyno_pigruins3", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("flint", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins3_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_pigruins3.xml", "kyno_pigruins3.tex")


AddRecipe("kyno_pigruins4", {Ingredient("cutstone", 3), Ingredient("cutgrass", 5), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pigruins4_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_pigruins4.xml", "kyno_pigruins4.tex")


AddRecipe("kyno_manthill", {Ingredient("twigs", 10), Ingredient("cutgrass", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_manthill_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_anthill.xml", "kyno_anthill.tex")


AddRecipe("kyno_mantqueenhill", {Ingredient("cutstone", 3), Ingredient("rocks", 4), Ingredient("redgem", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mantqueenhill_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_antqueenhill.xml", "kyno_antqueenhill.tex")


AddRecipe("kyno_antthrone", {Ingredient("rocks", 10), Ingredient("nitre", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antthrone_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_antthrone.xml", "kyno_antthrone.tex")


AddRecipe("kyno_ant_queen", {Ingredient("rocks", 10), Ingredient("nitre", 5), Ingredient("reviver", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ant_queen_placer", 3, nil, nil, nil, "images/inventoryimages/kyno_antqueen.xml", "kyno_antqueen.tex")


AddRecipe("kyno_antcombhome", {Ingredient("honey", 4), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcombhome_placer", 2, nil, nil, nil, "images/inventoryimages/kyno_antcombhome.xml", "kyno_antcombhome.tex")


AddRecipe("kyno_antchest", {Ingredient("honey", 2), Ingredient("boards", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_antchest.xml", "kyno_antchest.tex")


AddRecipe("kyno_antcache", {Ingredient("boards", 2), Ingredient("honey", 2), Ingredient("honeycomb", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antcache_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_antcache.xml", "kyno_antcache.tex")


AddRecipe("kyno_aporkalypse_calendar", {Ingredient("cutstone", 3), Ingredient("transistor", 2), Ingredient("nightmarefuel", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aporkalypse_calendar_placer", 5, nil, nil, nil, "images/inventoryimages/kyno_calendar.xml", "kyno_calendar.tex")


AddRecipe("kyno_smashingpot", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smashingpot_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_smashingpot.xml", "kyno_smashingpot.tex")


AddRecipe("wall_pig_ruins_item", {Ingredient("thulecite", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_ancientwall.xml", "kyno_ancientwall.tex")


AddRecipe("kyno_rock_artichoke", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_artichoke_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_artichoke.xml", "kyno_artichoke.tex")


AddRecipe("kyno_ruins_head", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_head_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_gianthead.xml", "kyno_ruins_gianthead.tex")


AddRecipe("kyno_ruins_pigstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_pigstatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_pigstatue.xml", "kyno_ruins_pigstatue.tex")


AddRecipe("kyno_ruins_antstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_antstatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_antstatue.xml", "kyno_ruins_antstatue.tex")


AddRecipe("kyno_ruins_idolstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_idolstatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_idolstatue.xml", "kyno_ruins_idolstatue.tex")


AddRecipe("kyno_ruins_plaquestatue", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_plaquestatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_plaquestatue.xml", "kyno_ruins_plaquestatue.tex")


AddRecipe("kyno_ruins_trufflestatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("purplegem", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_trufflestatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_trufflestatue.xml", "kyno_ruins_trufflestatue.tex")


AddRecipe("kyno_ruins_sowstatue", {Ingredient("rocks", 4), Ingredient("nitre", 2), Ingredient("bluegem", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ruins_sowstatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruins_sowstatue.xml", "kyno_ruins_sowstatue.tex")


AddRecipe("kyno_brazier", {Ingredient("cutstone", 1), Ingredient("charcoal", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_brazier_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_brazier.xml", "kyno_brazier.tex")


AddRecipe("kyno_wishingwell", {Ingredient("cutstone", 2), Ingredient("ice", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_wishingwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_wishingwell.xml", "kyno_wishingwell.tex")


AddRecipe("kyno_endwell", {Ingredient("cutstone", 2), Ingredient("nightmarefuel", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_endwell_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_endwell.xml", "kyno_endwell.tex")


AddRecipe("kyno_strikingstatue", {Ingredient("cutstone", 1), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_strikingstatue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_dartstatue.xml", "kyno_dartstatue.tex")


AddRecipe("kyno_speartrap", {Ingredient("spear", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_speartrap_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_speartrap.xml", "kyno_speartrap.tex")


AddRecipe("kyno_pillar_front", {Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruinspillar.xml", "kyno_ruinspillar.tex")


AddRecipe("kyno_pillar_front_blue", {Ingredient("cutstone", 1), Ingredient("bluegem", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pillar_front_blue_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_ruinspillarblue.xml", "kyno_ruinspillarblue.tex")


AddRecipe("kyno_teeteringpillar", {Ingredient("cutstone", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teeteringpillar_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_teeteringpillar.xml", "kyno_teeteringpillar.tex")


AddRecipe("kyno_pugaliskfountain", {Ingredient("cutstone", 4), Ingredient("ice", 10), Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskfountain_placer", 4, nil, nil, nil, "images/inventoryimages/kyno_fountainyouth.xml", "kyno_fountainyouth.tex")


AddRecipe("kyno_trapdoor", {Ingredient("cutstone", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trapdoor_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_trapdoor.xml", "kyno_trapdoor.tex")


AddRecipe("kyno_pugaliskcorpse", {Ingredient("boneshard", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_pugaliskcorpse_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_snakebody.xml", "kyno_snakebody.tex")


AddRecipe("kyno_teleporter_hamlet", {Ingredient("cutstone", 2), Ingredient("transistor", 2), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_teleporter_hamlet_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_potatohamlet.xml", "kyno_potatohamlet.tex")


AddRecipe("kyno_exoticflower", {Ingredient("petals", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_exoticflower_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_exoticflower.xml", "kyno_exoticflower.tex")


AddRecipe("kyno_rock_eruption", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rock_eruption_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_eruption.xml", "kyno_eruption.tex")


AddRecipe("kyno_rockplug", {Ingredient("rocks", 3), Ingredient("nitre", 2), Ingredient("flint", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rockplug_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rockplug.xml", "kyno_rockplug.tex")


AddRecipe("kyno_antrock", {Ingredient("rocks", 3), Ingredient("nitre", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_antrock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_antrock.xml", "kyno_antrock.tex")


AddRecipe("kyno_balloon_wreck", {Ingredient("silk", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_balloon_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_balloon.xml", "kyno_balloon.tex")


AddRecipe("kyno_basket_wreck", {Ingredient("boards", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basket_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_basket.xml", "kyno_basket.tex")


AddRecipe("kyno_flags_wreck", {Ingredient("papyrus", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flags_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_flags.xml", "kyno_flags.tex")


AddRecipe("kyno_sandbag_wreck", { beachingredient1, Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sandbag_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bagsand.xml", "kyno_bagsand.tex")


AddRecipe("kyno_suitcase_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_suitcase_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_suitcase.xml", "kyno_suitcase.tex")


AddRecipe("kyno_trunk_wreck", {Ingredient("boards", 1), Ingredient("silk", 1), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_trunk_wreck_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_trunk.xml", "kyno_trunk.tex")


AddRecipe("kyno_grub", {Ingredient("reviver", 1), Ingredient("slurtle_shellpieces", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_grub_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_grub.xml", "kyno_grub.tex")


AddRecipe("kyno_flytrap", {Ingredient("plantmeat", 2), Ingredient("houndstooth", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_flytrap_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_flytrap.xml", "kyno_flytrap.tex")


AddRecipe("kyno_dungball", {Ingredient("poop", 2), Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungball_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_dungball.xml", "kyno_dungball.tex")


AddRecipe("kyno_dungpile", {Ingredient("poop", 4), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_dungpile_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_dungpile.xml", "kyno_dungpile.tex")


AddRecipe("kyno_gnatmound", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_gnatmound_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_gnatmound.xml", "kyno_gnatmound.tex")


AddRecipe("kyno_mandrakehouse", {Ingredient("mandrake", 1), Ingredient("boards", 4), Ingredient("cutgrass", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_mandrakehouse_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mandrakehouse.xml", "kyno_mandrakehouse.tex")


AddRecipe("kyno_bandittreasure", {Ingredient("feather_crow", 4), Ingredient("goldnugget", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bandittreasure_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_banditcamp.xml", "kyno_banditcamp.tex")


AddRecipe("kyno_sparkpool", {Ingredient("ice", 5), Ingredient("goldnugget", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sparkpool_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sparklingpool.xml", "kyno_sparklingpool.tex")


AddRecipe("kyno_bathole", {Ingredient("batwing", 1), Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bathole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bathole.xml", "kyno_bathole.tex")


AddRecipe("kyno_batpit", {Ingredient("batwing", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_batpit_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_batpit.xml", "kyno_batpit.tex")


AddRecipe("kyno_stoneslab", {Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_stoneslab_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_slab.xml", "kyno_slab.tex")


AddRecipe("kyno_thundernest", {Ingredient("redgem", 1), Ingredient("rocks", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thundernest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_thundernest.xml", "kyno_thundernest.tex")


AddRecipe("kyno_rocnest", {Ingredient("cutgrass", 10), Ingredient("twigs", 10), Ingredient("flint", 10)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rocnest_placer", 0, nil, nil, nil, "images/inventoryimages/kyno_rocnest.xml", "kyno_rocnest.tex")


AddRecipe("kyno_nest_house", {Ingredient("cutstone", 1), Ingredient("boards", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_house_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rochouse.xml", "kyno_rochouse.tex")


AddRecipe("kyno_nest_rusty_lamp", {Ingredient("lantern", 1), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_rusty_lamp_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocrustylamp.xml", "kyno_rocrustylamp.tex")


AddRecipe("kyno_nest_tree1", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_roctree1.xml", "kyno_roctree1.tex")


AddRecipe("kyno_nest_tree2", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_tree2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_roctree2.xml", "kyno_roctree2.tex")


AddRecipe("kyno_nest_bush", {Ingredient("cutgrass", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_bush_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocbush.xml", "kyno_rocbush.tex")


AddRecipe("kyno_nest_trunk", {Ingredient("log", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_trunk_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_roctrunk.xml", "kyno_roctrunk.tex")


AddRecipe("kyno_nest_branch1", {Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocbranch1.xml", "kyno_rocbranch1.tex")


AddRecipe("kyno_nest_branch2", {Ingredient("twigs", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_branch2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocbranch2.xml", "kyno_rocbranch2.tex")


AddRecipe("kyno_nest_debris1", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocstick1.xml", "kyno_rocstick1.tex")


AddRecipe("kyno_nest_debris2", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocstick2.xml", "kyno_rocstick2.tex")


AddRecipe("kyno_nest_debris3", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocstick3.xml", "kyno_rocstick3.tex")


AddRecipe("kyno_nest_debris4", {Ingredient("twigs", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_debris4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocstick4.xml", "kyno_rocstick4.tex")


AddRecipe("kyno_nest_egg1", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocshell1.xml", "kyno_rocshell1.tex")


AddRecipe("kyno_nest_egg2", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocshell2.xml", "kyno_rocshell2.tex")


AddRecipe("kyno_nest_egg3", {Ingredient("rocks", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocshell3.xml", "kyno_rocshell3.tex")


AddRecipe("kyno_nest_egg4", {Ingredient("rocks", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nest_egg4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rocshell4.xml", "kyno_rocshell4.tex")


AddRecipe("kyno_ironhulk_spider", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_spider_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hulkspider.xml", "kyno_hulkspider.tex")


AddRecipe("kyno_ironhulk_claw", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_claw_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hulkclaw.xml", "kyno_hulkclaw.tex")


AddRecipe("kyno_ironhulk_leg", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_leg_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hulkleg.xml", "kyno_hulkleg.tex")


AddRecipe("kyno_ironhulk_head", {Ingredient("gears", 3), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_head_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hulkhead.xml", "kyno_hulkhead.tex")


AddRecipe("kyno_ironhulk_large", {Ingredient("gears", 6), Ingredient("transistor", 2), Ingredient("nightmarefuel", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_ironhulk_large_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_hulklarge.xml", "kyno_hulklarge.tex")


AddRecipe("kyno_bramble1", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bramble1.xml", "kyno_bramble1.tex")


AddRecipe("kyno_bramble2", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bramble2.xml", "kyno_bramble2.tex")


AddRecipe("kyno_bramble3", {Ingredient("dug_marsh_bush", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramble3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bramble3.xml", "kyno_bramble3.tex")


AddRecipe("kyno_bramblecore", {Ingredient("dug_marsh_bush", 1), Ingredient("petals", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_bramblecore_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "bramble_bulb.tex")


AddRecipe("kyno_aloe_planted", {Ingredient("corn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_aloe_planted_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "aloe.tex")


AddRecipe("kyno_asparagus_planted", {Ingredient("asparagus", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_asparagus_planted_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "asparagus.tex")


AddRecipe("kyno_radish_planted", {Ingredient("pepper", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_radish_planted_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "radish.tex")


AddRecipe("kyno_leafystalk", {Ingredient("log", 10), Ingredient("succulent_picked", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_leafystalk_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_leafystalk.xml", "kyno_leafystalk.tex")


AddRecipe("kyno_cocoon", {Ingredient("lightbulb", 1), Ingredient("ice", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_cocoon_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_cocoon.xml", "kyno_cocoon.tex")


AddRecipe("kyno_junglefern", {Ingredient("foliage", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_junglefern.xml", "kyno_junglefern.tex")


AddRecipe("kyno_junglefern_green", {Ingredient("succulent_picked", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_junglefern_green_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_junglefern2.xml", "kyno_junglefern2.tex")


AddRecipe("kyno_magicflower", {Ingredient("petals", 5), Ingredient("nightmarefuel", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_magicflower_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magicflower.xml", "kyno_magicflower.tex")


AddRecipe("kyno_nettleplant", {Ingredient("cutlichen", 3)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_nettleplant_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_nettle.tex")


AddRecipe("kyno_tallgrass", {Ingredient("dug_grass", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tallgrass_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "dug_grass.tex")


AddRecipe("tubertree_short", {Ingredient("log", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertree_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tubertree.xml", "kyno_tubertree.tex")


AddRecipe("tubertreebloom_short", {Ingredient("log", 3), Ingredient("petals", 3), Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_tubertreebloom_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tubertreebloom.xml", "kyno_tubertreebloom.tex")


AddRecipe("kyno_clawtree_sapling", {Ingredient("pinecone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_clawtree_sapling_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "clawpalmtree_sapling.tex")


AddRecipe("teatree_nut", {Ingredient("acorn", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "teatree_nut.tex")


AddRecipe("burr", {Ingredient("twiggy_nut", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "burr.tex")


AddRecipe("rainforesttree_bloom_short", { burringredient },
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_bloom_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_treebloom.xml", "kyno_treebloom.tex")


AddRecipe("rainforesttree_rot_short", { burringredient, Ingredient("spoiled_food", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "rainforesttree_rot_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_treerot.xml", "kyno_treerot.tex")


AddRecipe("cocoonedtree_short", { burringredient, Ingredient("silk", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "cocoonedtree_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_cocoonedtree.xml", "kyno_cocoonedtree.tex")


AddRecipe("kyno_corkchest", {Ingredient("boards", 2), Ingredient("rope", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_corkchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "corkchest.tex")


AddRecipe("kyno_rootchest", {Ingredient("boards", 3), Ingredient("nightmarefuel", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_rootchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "roottrunk.tex")


AddRecipe("kyno_hogusporkusator", {Ingredient("boards", 4), Ingredient("pigskin", 4), Ingredient("feather_robin_winter", 4)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_hogusporkusator_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "hogusporkusator.tex")


AddRecipe("kyno_sprinkler", {Ingredient("transistor", 2), Ingredient("gears", 2), Ingredient("ice", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_sprinkler_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "sprinkler.tex")


AddRecipe("kyno_smelter", {Ingredient("cutstone", 2), Ingredient("boards", 4), Ingredient("transistor", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_smelter_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "smelter.tex")


AddRecipe("kyno_basefan", {Ingredient("transistor", 2), Ingredient("gears", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_basefan_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "basefan.tex")


AddRecipe("kyno_thumper", {Ingredient("gears", 3), Ingredient("flint", 10), Ingredient("hammer", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_thumper_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "thumper.tex")


AddRecipe("kyno_telipad", {Ingredient("gears", 1), Ingredient("transistor", 1), Ingredient("cutstone", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_telipad_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "telipad.tex")


AddRecipe("kyno_lawnornament_1", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_1.tex")


AddRecipe("kyno_lawnornament_2", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_2.tex")


AddRecipe("kyno_lawnornament_3", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_3.tex")


AddRecipe("kyno_lawnornament_4", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_4.tex")


AddRecipe("kyno_lawnornament_5", {Ingredient("cutgrass", 5), Ingredient("log", 2)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_5_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_5.tex")


AddRecipe("kyno_lawnornament_6", {Ingredient("dug_berrybush", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_6_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_6.tex")


AddRecipe("kyno_lawnornament_7", {Ingredient("dug_berrybush_juicy", 1), Ingredient("marble", 1)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_lawnornament_7_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_ham.xml", "lawnornament_7.tex")


AddRecipe("kyno_topiary_1", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pigtopiary.xml", "kyno_pigtopiary.tex")


AddRecipe("kyno_topiary_2", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_werepigtopiary.xml", "kyno_werepigtopiary.tex")


AddRecipe("kyno_topiary_3", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_beefalotopiary.xml", "kyno_beefalotopiary.tex")


AddRecipe("kyno_topiary_4", {Ingredient("cutgrass", 5), Ingredient("twigs", 5)},
kyno_hamlettab, TECH.SCIENCE_TWO, "kyno_topiary_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_pigkingtopiary.xml", "kyno_pigkingtopiary.tex")


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


AddRecipe("kyno_rock_limpet", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_limpet_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_limpet.xml", "kyno_rock_limpet.tex")


AddRecipe("kyno_vinebush", {Ingredient("dug_marsh_bush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_vinebush_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bush_vine.tex")


AddRecipe("kyno_bambootree", {Ingredient("dug_sapling", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bambootree_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bambootree.tex")


AddRecipe("jungletreeseed", {Ingredient("pinecone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "jungletreeseed.tex")


AddRecipe("coconut", {Ingredient("acorn", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "coconut.tex")


AddRecipe("kyno_sweet_potato_planted", {Ingredient("potato", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sweet_potato_planted_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sweet_potato.tex")


AddRecipe("kyno_sandhill", { beachingredient1 },
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandhill_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand.tex")


AddRecipe("seashell", {Ingredient("flint", 1), Ingredient("nitre", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seashell.tex")


AddRecipe("kyno_shipmast", {Ingredient("boards", 2), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_shipmast_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_shipmast.xml", "kyno_shipmast.tex")


AddRecipe("kyno_debris_1", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_1.xml", "kyno_debris_1.tex")


AddRecipe("kyno_debris_2", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_2.xml", "kyno_debris_2.tex")


AddRecipe("kyno_debris_3", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_debris_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_3.xml", "kyno_debris_3.tex")


AddRecipe("kyno_crate", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_crate_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_crate.xml", "kyno_crate.tex")


AddRecipe("kyno_living_jungletree", {Ingredient("livinglog", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_living_jungletree_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_living_jungletree.xml", "kyno_living_jungletree.tex")


AddRecipe("kyno_magmarock", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magmarock.xml", "kyno_magmarock.tex")


AddRecipe("kyno_magmarock_gold", {Ingredient("rocks", 4), Ingredient("flint", 4), Ingredient("goldnugget", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_magmarock_gold_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magmarock_gold.xml", "kyno_magmarock_gold.tex")


AddRecipe("kyno_primeape_barrel", {Ingredient("cave_banana", 4), Ingredient("poop", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_primeape_barrel_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "primeapebarrel.tex")


AddRecipe("kyno_sharkittenden", { beachingredient4, Ingredient("spoiled_fish", 1), Ingredient("spoiled_fish_small", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sharkittenden_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sharkittenden.xml", "kyno_sharkittenden.tex")


AddRecipe("kyno_mermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_mermhut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mermhut.xml", "kyno_mermhut.tex")


AddRecipe("kyno_fishermermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishermermhut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_fishermermhut.xml", "kyno_fishermermhut.tex")


AddRecipe("kyno_tidalpool_small", {Ingredient("pondeel", 2), Ingredient("turf_mud", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_small_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_medium", {Ingredient("pondeel", 4), Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_medium_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_big", {Ingredient("pondeel", 6), Ingredient("turf_mud", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tidalpool_big_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_poisonhole", {Ingredient("poop", 2), Ingredient("spoiled_food", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_poisonhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_poisonhole.xml", "kyno_poisonhole.tex")


AddRecipe("kyno_slotmachine", {Ingredient("boards", 4), Ingredient("goldnugget", 6)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_slotmachine_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_slotmachine.xml", "kyno_slotmachine.tex")


AddRecipe("kyno_wildbore_house", {Ingredient("boards", 4), Ingredient("twigs", 10), Ingredient("pigskin", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_house_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wildborehouse.tex")


AddRecipe("kyno_wildbore_head", {Ingredient("pigskin", 2), Ingredient("twigs", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wildbore_head_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wildbore_head.xml", "kyno_wildbore_head.tex")


AddRecipe("kyno_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_chiminea_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "chiminea.tex")


AddRecipe("kyno_obsidian_firepit", {Ingredient("log", 10), Ingredient("redgem", 2), Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_obsidian_firepit_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "obsidianfirepit.tex")


AddRecipe("kyno_palmleaf_hut", {Ingredient("cutgrass", 5), Ingredient("rope", 3), Ingredient("twigs", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_palmleaf_hut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "palmleaf_hut.tex")


AddRecipe("kyno_doydoy_nest",{Ingredient("twigs", 8), Ingredient("goose_feather", 2), Ingredient("bird_egg", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_doydoy_nest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "doydoynest.tex")


AddRecipe("kyno_icemaker", {Ingredient("heatrock", 1), Ingredient("twigs", 5), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_icemaker_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "icemaker.tex")


AddRecipe("kyno_sandcastle", { beachingredient2, Ingredient("cutgrass", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sandcastle_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand_castle.tex")


AddRecipe("kyno_teleporter_sw", {Ingredient("boards", 2), Ingredient("cutgrass", 4), Ingredient("nightmarefuel", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_teleporter_sw_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_potatosw.xml", "kyno_potatosw.tex")


AddRecipe("kyno_piratihatitator", {Ingredient("tophat", 1), Ingredient("robin", 1), Ingredient("boards", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_piratihatitator_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "piratihatitator.tex")


AddRecipe("kyno_buriedtreasure", {Ingredient("boneshard", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buriedtreasure_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_buriedtreasure.xml", "kyno_buriedtreasure.tex")


AddRecipe("kyno_geyser", {Ingredient("charcoal", 4), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_geyser_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_krissure.xml", "kyno_krissure.tex")


AddRecipe("kyno_lavapool", {Ingredient("charcoal", 4), Ingredient("ash", 4), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_lavapool_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_lavapool.xml", "kyno_lavapool.tex")


AddRecipe("kyno_dragoonegg", {Ingredient("rocks", 5), Ingredient("redgem", 2), Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonegg_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_dragoonegg.xml", "kyno_dragoonegg.tex")


AddRecipe("kyno_sandbagsmall_item", { beachingredient2, Ingredient("rope", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_sandbagsmall_item.xml", "kyno_sandbagsmall_item.tex")


AddRecipe("wall_limestone_item", {Ingredient("cutstone", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_limestone_item.tex")


AddRecipe("wall_enforcedlimestone_land_item", {Ingredient("cutstone", 2), Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 8, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "wall_enforcedlimestone_land_item.tex")


AddRecipe("kyno_woodlegs_cage", {Ingredient("log", 5), Ingredient("rope", 2), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_woodlegs_cage_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_woodlegs_cage.xml", "kyno_woodlegs_cage.tex")


AddRecipe("kyno_tartrap", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tartrap_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tartrap.xml", "kyno_tartrap.tex")


AddRecipe("kyno_dragoonden", {Ingredient("cutstone", 2), Ingredient("charcoal", 4), Ingredient("redgem", 2)}, 
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_dragoonden_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dragoonden.tex")


AddRecipe("kyno_elephantcactus_active", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("kyno_elephantcactus", {Ingredient("dug_marsh_bush", 1), Ingredient("houndstooth", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_elephantcactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")

--[[
local COFFEE_PLANT = GetModConfigData("coffee_hack")
if COFFEE_PLANT == 0 then
AddRecipe("dug_coffeebush", {Ingredient("ash", 5), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.LOST, nil, nil, nil, 1, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")
end
]]--

AddRecipe("kyno_fakecoffeebush", {Ingredient("ash", 1), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fakecoffeebush_placer", 1, nil, nil, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")


AddRecipe("kyno_rock_obsidian", {Ingredient("rocks", 5), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_obsidian_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_obsidian.xml", "kyno_rock_obsidian.tex")


AddRecipe("kyno_rock_charcoal", {Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_charcoal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_charcoal.xml", "kyno_rock_charcoal.tex")


AddRecipe("kyno_volcano_shrub", {Ingredient("twigs", 4), Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_shrub_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_volcano_shrub.xml", "kyno_volcano_shrub.tex")


AddRecipe("kyno_altar_pillar", {Ingredient("cutstone", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_altar_pillar_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_altar_pillar.xml", "kyno_altar_pillar.tex")


AddRecipe("kyno_volcano_altar", {Ingredient("cutstone", 3), Ingredient("nightmarefuel", 5), Ingredient("ash", 5)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_volcano_altar_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_volcano_altar.xml", "kyno_volcano_altar.tex")


AddRecipe("kyno_workbench", {Ingredient("cutstone", 2), Ingredient("boards", 4), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_workbench_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_workbench.xml", "kyno_workbench.tex")


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
-- Debug Mode (Recipes that currently don't have full support)
local SEA_STRUCTURES = GetModConfigData("ocean_structures")
if SEA_STRUCTURES == 0 then
AddRecipe("mangrovetree_short", {Ingredient("log", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "mangrovetree_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mangrovetree.xml", "kyno_mangrovetree.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_1", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_1.xml", "kyno_wreck_1.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_2", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_2.xml", "kyno_wreck_2.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_3", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_3.xml", "kyno_wreck_3.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_4", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_wreck_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_4.xml", "kyno_wreck_4.tex", IsOcean, nil, nil)


AddRecipe("kyno_seaweed", {Ingredient("poop", 1), Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seaweed_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seaweed.tex", IsOcean, nil, nil)


AddRecipe("kyno_brain_rock", {Ingredient("rocks", 3), Ingredient("meat", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_brain_rock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_brain_rock.xml", "kyno_brain_rock.tex", IsOcean, nil, nil)


AddRecipe("wall_enforcedlimestone_item", {Ingredient("cutstone", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_enforcedlimestone_item.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_1", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_1.xml", "kyno_rock_coral_1.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_2", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_2.xml", "kyno_rock_coral_2.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_3", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_rock_coral_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_3.xml", "kyno_rock_coral_3.tex", IsOcean, nil, nil)


AddRecipe("kyno_redbarrel", {Ingredient("boards", 2), Ingredient("gunpowder", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_redbarrel_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_redbarrel.xml", "kyno_redbarrel.tex", IsOcean, nil, nil)


AddRecipe("kyno_bermudatriangle", {Ingredient("nightmarefuel", 4), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_bermudatriangle_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bermudatriangle.xml", "kyno_bermudatriangle.tex", IsOcean, nil, nil)


AddRecipe("kyno_ballphinhouse", {Ingredient("cutstone", 3), Ingredient("kelp", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_ballphinhouse_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "ballphinhouse.tex", IsOcean, nil, nil)


AddRecipe("kyno_octopusking", {Ingredient("cutstone", 5), Ingredient("kelp", 5), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_octopusking_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_octopusking.xml", "kyno_octopusking.tex", IsOcean, nil, nil)


AddRecipe("kyno_luggagechest", {Ingredient("boards", 3)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_luggagechest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_luggagechest.xml", "kyno_luggagechest.tex", IsOcean, nil, nil)


AddRecipe("kyno_fishinhole", {Ingredient("pondfish", 4), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishinhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_fishinhole.xml", "kyno_fishinhole.tex", IsOcean, nil, nil)


AddRecipe("kyno_buoy", {Ingredient("lantern", 1), Ingredient("twigs", 4), Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_buoy_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "buoy.tex", IsOcean, nil, nil)

AddRecipe("kyno_sea_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sea_chiminea_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_chiminea.tex", IsOcean, nil, nil)


AddRecipe("kyno_seayard", {Ingredient("log", 4), Ingredient("cutstone", 6), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_seayard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_yard.tex", IsOcean, nil, nil)


AddRecipe("kyno_extractor", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_extractor_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "tar_extractor.tex", IsOcean, nil, nil)


AddRecipe("kyno_musselfarm", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_musselfarm_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "mussel_stick.tex", IsOcean, nil, nil)


AddRecipe("kyno_fishfarm", {Ingredient("silk", 2), Ingredient("rope", 2), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_fishfarm_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "fish_farm.tex", IsOcean, nil, nil)


AddRecipe("kyno_sealab", {Ingredient("cutstone", 4), Ingredient("transistor", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_sealab_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "researchlab5.tex", IsOcean, nil, nil)


AddRecipe("kyno_krakenchest", {Ingredient("boards", 4), Ingredient("boneshard", 4)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_krakenchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_krakenchest.xml", "kyno_krakenchest.tex", IsOcean, nil, nil)


AddRecipe("kyno_waterchest", {Ingredient("boards", 3), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_waterchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "waterchest.tex", IsOcean, nil, nil)


AddRecipe("kyno_watercrate", {Ingredient("boards", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_watercrate_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_watercrate.xml", "kyno_watercrate.tex", IsOcean, nil, nil)


AddRecipe("kyno_tarpit", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.SCIENCE_TWO, "kyno_tarpit_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tarpit.xml", "kyno_tarpit.tex")
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
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/temperate_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/temperate_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/temperate_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_bloodmoon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_warm_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_warm_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/purple_moon_cc.tex") )
	
	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colour_cubes/temperate_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/temperate_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/temperate_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colour_cubes/pork_cold_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/pork_cold_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/pork_cold_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colour_cubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/pork_warm_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/pork_warm_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colour_cubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/SW_dry_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/SW_dry_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 2 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/sw_mild_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_mild_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_mild_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_wet_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_wet_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_wet_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/sw_green_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/sw_green_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_dusk_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/SW_dry_night_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/purple_moon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colour_cubes/sw_mild_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/SW_mild_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/SW_mild_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colour_cubes/SW_wet_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/SW_wet_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/SW_wet_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colour_cubes/sw_green_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/sw_green_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/sw_green_dusk_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colour_cubes/SW_dry_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/SW_dry_dusk_cc.tex"),
						night = resolvefilepath("images/colour_cubes/SW_dry_night_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 3 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/sw_mild_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/snow_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_bloodmoon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_warm_day_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/purple_moon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colour_cubes/sw_mild_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/sw_mild_day_cc.tex"),
						night = resolvefilepath("images/colour_cubes/sw_mild_day_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colour_cubes/snow_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/snow_cc.tex"),
						night = resolvefilepath("images/colour_cubes/snow_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colour_cubes/pork_cold_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/pork_cold_day_cc.tex"),
						night = resolvefilepath("images/colour_cubes/pork_cold_day_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colour_cubes/pork_warm_day_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/pork_warm_day_cc.tex"),
						night = resolvefilepath("images/colour_cubes/pork_warm_day_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 4 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/lavaarena2_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_bloodmoon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/purple_moon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						night = resolvefilepath("images/colour_cubes/lavaarena2_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/pork_cold_bloodmoon_cc.tex"),
					},
				})
				break
			end
		end
	end)
elseif GetModConfigData("colourcubes") == 5 then
local DST = GLOBAL.TheSim:GetGameID() == "DST"
	table.insert( Assets, Asset("IMAGE", "images/colour_cubes/quagmire_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/purple_moon_cc.tex") )
	table.insert( Assets, Asset("IMAGE","images/colour_cubes/pork_cold_bloodmoon_cc.tex") )

	AddComponentPostInit("colourcube", function(self)
		for _,v in pairs(GLOBAL.TheWorld.event_listeners["playerdeactivated"][GLOBAL.TheWorld]) do
			if getval(v,"OnOverrideCCTable") then
				setval(v, "OnOverrideCCTable.UpdateAmbientCCTable.SEASON_COLOURCUBES",{
					autumn =
					{
						day = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					winter =
					{
						day = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					spring =
					{
						day = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
					summer =
					{
						day = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						dusk = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						night = resolvefilepath("images/colour_cubes/quagmire_cc.tex"),
						full_moon = resolvefilepath("images/colour_cubes/purple_moon_cc.tex"),
					},
				})
				break
			end
		end
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Using this now, because the old wasn't updating placer in client-side.
function Map:IsVolcano(x, y, z)
    local tile = self:GetTileAtPoint(x, y, z)
    return tile == GROUND.ASH or tile == GROUND.VOLCANO or tile == GROUND.MAGMAFIELD
end

local _CanDeployPlantAtPoint = Map.CanDeployPlantAtPoint
function Map:CanDeployPlantAtPoint(pt, inst, ...)
    if inst:HasTag("coffeebush") then
        return self:IsVolcano(pt:Get())
            and self:IsDeployPointClear(pt, inst, inst.replica.inventoryitem ~= nil and inst.replica.inventoryitem:DeploySpacingRadius() or DEPLOYSPACING_RADIUS[DEPLOYSPACING.DEFAULT])
    else
        return _CanDeployPlantAtPoint(self, pt, inst, ...)
    end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------