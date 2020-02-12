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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
modimport("scripts/kyno_assets")
modimport("scripts/kyno_strings")
modimport("scripts/kyno_postinits")
modimport("libs/custom_tech_tree")
modimport("libs/env")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Assets = { -- Some Assets don't show correctly if they're not set here.
    Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw.xml", 256),
    Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_potato.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_potato.xml"),
	Asset("IMAGE", "images/tabimages/kyno_shipwreckedtab.tex"),
	Asset("ATLAS", "images/tabimages/kyno_shipwreckedtab.xml"),
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
PrefabFiles = {
	-- VOLCANO CONTENT --
	"k_dragoonden",
	"k_elephantcactus",
	"k_rock_obsidian",
	"k_rock_charcoal",
	"k_volcano_shrub",
	"k_coffeebush",
	"k_dug_coffeebush",
	"k_coffeebeans",
	"k_coffee",  -- I Spent 5 HOURS TO MAKE THIS SHIT WORK.
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
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddMinimapAtlas("images/minimapimages/kyno_minimap_atlas_sw.xml")
AddMinimapAtlas("images/minimapimages/kyno_shipmast.xml")
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
-- I Took the turfs code from eXiGe's mod. I hope he doesn't get mad at me xddddddddddd
if GLOBAL.TheNet:GetIsMasterSimulation() then
    local turf_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw.xml"
    for _, turf in pairs({"ash", "magmafield", "volcano", "volcano_rock"}) do
        local turf_name = "turf_"..turf
        AddPrefabPostInit(turf_name, function(inst)
            inst.components.inventoryitem.imagename = turf_name
            inst.components.inventoryitem.atlasname = turf_atlas
        end)
    end
end

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
-- For some fucking reason the Prototyper and TechTree don't work if the recipes aren't here.
AddNewTechTree("BARQUINHO", 3)
local kyno_shipwreckedtab = AddRecipeTab("Shipwrecked Catalogue", 999, "images/tabimages/kyno_shipwreckedtab.xml", "kyno_shipwreckedtab.tex", nil, true)

local magmaingredient = Ingredient("turf_magmafield", 1)
magmaingredient.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local potatoingredient = Ingredient("potato", 1)
potatoingredient.atlas = "images/inventoryimages/kyno_potato.xml"

AddRecipe("kyno_sw_prototyper", {Ingredient("transistor", 2), Ingredient("boards", 4), Ingredient("pondfish", 4)},
RECIPETABS.SCIENCE, TECH.SCIENCE_TWO, "kyno_sw_prototyper_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "shipwrecked_entrance.tex")


AddRecipe("kyno_rock_limpet", {Ingredient("rocks", 4), Ingredient("nitre", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_limpet_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_limpet.xml", "kyno_rock_limpet.tex")


AddRecipe("kyno_vinebush", {Ingredient("twigs", 4), Ingredient("poop", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_vinebush_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bush_vine.tex")


AddRecipe("kyno_bambootree", {Ingredient("twigs", 4), Ingredient("poop", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_bambootree_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_bambootree.tex")


AddRecipe("jungletreeseed", {Ingredient("pinecone", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "jungletreeseed.tex")


AddRecipe("coconut", {Ingredient("acorn", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "coconut.tex")


AddRecipe("kyno_sweet_potato_planted", {Ingredient("potato_seeds", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sweet_potato_planted_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sweet_potato.tex")


AddRecipe("kyno_sandhill", {Ingredient("turf_desertdirt", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sandhill_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand.tex")


AddRecipe("seashell", {Ingredient("flint", 1), Ingredient("nitre", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 1, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seashell.tex")


AddRecipe("kyno_shipmast", {Ingredient("boards", 2), Ingredient("robin", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_shipmast_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_shipmast.xml", "kyno_shipmast.tex")


AddRecipe("kyno_debris_1", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_debris_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_1.xml", "kyno_debris_1.tex")


AddRecipe("kyno_debris_2", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_debris_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_2.xml", "kyno_debris_2.tex")


AddRecipe("kyno_debris_3", {Ingredient("boards", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_debris_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_debris_3.xml", "kyno_debris_3.tex")


AddRecipe("kyno_crate", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_crate_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_crate.xml", "kyno_crate.tex")


AddRecipe("kyno_living_jungletree", {Ingredient("livinglog", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_living_jungletree_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_living_jungletree.xml", "kyno_living_jungletree.tex")


AddRecipe("kyno_magmarock", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_magmarock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magmarock.xml", "kyno_magmarock.tex")


AddRecipe("kyno_magmarock_gold", {Ingredient("rocks", 4), Ingredient("flint", 4), Ingredient("goldnugget", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_magmarock_gold_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_magmarock_gold.xml", "kyno_magmarock_gold.tex")


AddRecipe("kyno_primeape_barrel", {Ingredient("cave_banana", 4), Ingredient("poop", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_primeape_barrel_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "primeapebarrel.tex")


AddRecipe("kyno_sharkittenden", {Ingredient("turf_desertdirt", 4), Ingredient("spoiled_fish", 1), Ingredient("spoiled_fish_small", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sharkittenden_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_sharkittenden.xml", "kyno_sharkittenden.tex")


AddRecipe("kyno_mermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_mermhut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mermhut.xml", "kyno_mermhut.tex")


AddRecipe("kyno_fishermermhut", {Ingredient("boards", 4), Ingredient("cutstone", 3), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_fishermermhut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_fishermermhut.xml", "kyno_fishermermhut.tex")


AddRecipe("kyno_tidalpool_small", {Ingredient("pondeel", 2), Ingredient("turf_mud", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_tidalpool_small_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_medium", {Ingredient("pondeel", 4), Ingredient("turf_mud", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_tidalpool_medium_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_tidalpool_big", {Ingredient("pondeel", 6), Ingredient("turf_mud", 3)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_tidalpool_big_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tidalpool.xml", "kyno_tidalpool.tex")


AddRecipe("kyno_poisonhole", {Ingredient("poop", 2), Ingredient("spoiled_food", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_poisonhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_poisonhole.xml", "kyno_poisonhole.tex")


AddRecipe("kyno_slotmachine", {Ingredient("boards", 4), Ingredient("goldnugget", 6)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_slotmachine_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_slotmachine.xml", "kyno_slotmachine.tex")


AddRecipe("kyno_wildbore_house", {Ingredient("boards", 4), Ingredient("twigs", 10), Ingredient("pigskin", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wildbore_house_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wildborehouse.tex")


AddRecipe("kyno_wildbore_head", {Ingredient("pigskin", 2), Ingredient("twigs", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wildbore_head_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wildbore_head.xml", "kyno_wildbore_head.tex")


AddRecipe("kyno_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_chiminea_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "chiminea.tex")


AddRecipe("kyno_obsidian_firepit", {Ingredient("log", 10), Ingredient("redgem", 2), Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_obsidian_firepit_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "obsidianfirepit.tex")


AddRecipe("kyno_palmleaf_hut", {Ingredient("cutgrass", 5), Ingredient("rope", 3), Ingredient("twigs", 5)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_palmleaf_hut_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "palmleaf_hut.tex")


AddRecipe("kyno_doydoy_nest",{Ingredient("twigs", 8), Ingredient("goose_feather", 2), Ingredient("poop", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_doydoy_nest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "doydoynest.tex")


AddRecipe("kyno_icemaker", {Ingredient("heatrock", 1), Ingredient("twigs", 5), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_icemaker_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "icemaker.tex")


AddRecipe("kyno_dragoonden", {Ingredient("cutstone", 2), Ingredient("charcoal", 4), Ingredient("redgem", 2)}, 
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_dragoonden_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dragoonden.tex")


AddRecipe("kyno_elephantcactus", {Ingredient("poop", 4), Ingredient("houndstooth", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_elephantcactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


AddRecipe("dug_coffeebush", {Ingredient("poop", 5), Ingredient("ash", 5), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 1, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")


AddRecipe("kyno_rock_obsidian", {Ingredient("rocks", 5), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_obsidian_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_obsidian.xml", "kyno_rock_obsidian.tex")


AddRecipe("kyno_rock_charcoal", {Ingredient("charcoal", 5), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_charcoal_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_charcoal.xml", "kyno_rock_charcoal.tex")


AddRecipe("kyno_volcano_shrub", {Ingredient("twigs", 4), Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_volcano_shrub_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_volcano_shrub.xml", "kyno_volcano_shrub.tex")


AddRecipe("kyno_altar_pillar", {Ingredient("cutstone", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_altar_pillar_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_altar_pillar.xml", "kyno_altar_pillar.tex")


AddRecipe("kyno_volcano_altar", {Ingredient("cutstone", 3), Ingredient("nightmarefuel", 5), Ingredient("ash", 5)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_volcano_altar_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_volcano_altar.xml", "kyno_volcano_altar.tex")


AddRecipe("kyno_workbench", {Ingredient("cutstone", 2), Ingredient("boards", 4), Ingredient("charcoal", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_workbench_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_workbench.xml", "kyno_workbench.tex")


AddRecipe("turf_magmafield", {Ingredient("turf_rocky", 1), Ingredient("rocks", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_magmafield.tex")


AddRecipe("turf_volcano", { magmaingredient },
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano.tex")


AddRecipe("turf_ash", {Ingredient("ash", 10)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_ash.tex")


AddRecipe("turf_volcano_rock", { magmaingredient, Ingredient("rocks", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano_rock.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------