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

require "recipe" -- We need this for "CHARACTER_INGREDIENT.SANITY" work.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
modimport("scripts/kyno_assets")
modimport("scripts/kyno_strings")
modimport("scripts/kyno_postinits")
modimport("libs/custom_tech_tree")
modimport("libs/env")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Assets = { -- Some Assets don't show correctly if they're not set here.
    Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw_2.xml", 256),
    Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_turfs_sw_2.tex"),
    Asset("ATLAS", "images/inventoryimages/kyno_turfs_sw_2.xml"),
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
	"k_sandcastle",
	"k_piratihatitator",
	"k_sandbag",
	"k_buriedtreasure",
	"k_krissure",
	"k_lavapool",
	"k_dragoonegg",
	"k_woodlegs_cage",
	"k_tartrap",
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
    for _, turf in pairs({"ash", "magmafield", "volcano", "volcano_rock", "jungle", "meadow", "snakeskinfloor", "beach"}) do
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

params.kyno_krakenchest = -- Fix for luggagechest aka Steamer Trunk.
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

params.kyno_waterchest = -- Fix for luggagechest aka Steamer Trunk.
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

for k, v in pairs(params) do
    containers.MAXITEMSLOTS = math.max(containers.MAXITEMSLOTS, v.widget.slotpos ~= nil and #v.widget.slotpos or 0)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- For some fucking reason the Prototyper and TechTree don't work if the recipes aren't here.
AddNewTechTree("BARQUINHO", 3)
local kyno_shipwreckedtab = AddRecipeTab("Shipwrecked Catalogue", 999, "images/tabimages/kyno_shipwreckedtab.xml", "kyno_shipwreckedtab.tex", nil, true)

local magmaingredient = Ingredient("turf_magmafield", 1)
magmaingredient.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local potatoingredient = Ingredient("potato", 1)
potatoingredient.atlas = "images/inventoryimages/kyno_potato.xml"

local beachingredient1 = Ingredient("turf_beach", 1)
beachingredient1.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local beachingredient2 = Ingredient("turf_beach", 2)
beachingredient2.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local beachingredient4 = Ingredient("turf_beach", 4)
beachingredient4.atlas = "images/inventoryimages/kyno_turfs_sw.xml"

local notags = {'NOBLOCK', 'player', 'FX'}
local function IsOcean(pt, rot)
    local ground_tile = TheWorld.Map:GetTileAtPoint(pt.x, pt.y, pt.z)
    return ground_tile and ground_tile == GROUND.OCEAN_COASTAL_SHORE and ground_tile == GROUND.SAVANNA -- Savanna it's just for the testings!
end

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


AddRecipe("kyno_sandhill", { beachingredient1 },
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


AddRecipe("kyno_sharkittenden", { beachingredient4, Ingredient("spoiled_fish", 1), Ingredient("spoiled_fish_small", 1)},
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


AddRecipe("kyno_sandcastle", { beachingredient2, Ingredient("cutgrass", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sandcastle_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sand_castle.tex")


AddRecipe("kyno_piratihatitator", {Ingredient("tophat", 1), Ingredient("robin", 1), Ingredient("boards", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_piratihatitator_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "piratihatitator.tex")


AddRecipe("kyno_buriedtreasure", {Ingredient("boneshard", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_buriedtreasure_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_buriedtreasure.xml", "kyno_buriedtreasure.tex")


AddRecipe("kyno_geyser", {Ingredient("charcoal", 4), Ingredient("redgem", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_geyser_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_krissure.xml", "kyno_krissure.tex")


AddRecipe("kyno_lavapool", {Ingredient("charcoal", 4), Ingredient("ash", 4), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_lavapool_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_lavapool.xml", "kyno_lavapool.tex")


AddRecipe("kyno_dragoonegg", {Ingredient("rocks", 5), Ingredient("redgem", 2), Ingredient("charcoal", 5)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_dragoonegg_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_dragoonegg.xml", "kyno_dragoonegg.tex")


AddRecipe("kyno_sandbagsmall_item", { beachingredient2, Ingredient("rope", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_sandbagsmall_item.xml", "kyno_sandbagsmall_item.tex")


AddRecipe("kyno_woodlegs_cage", {Ingredient("log", 5), Ingredient("rope", 2), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_woodlegs_cage_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_woodlegs_cage.xml", "kyno_woodlegs_cage.tex")


AddRecipe("kyno_tartrap", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_tartrap_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tartrap.xml", "kyno_tartrap.tex")


AddRecipe("kyno_dragoonden", {Ingredient("cutstone", 2), Ingredient("charcoal", 4), Ingredient("redgem", 2)}, 
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_dragoonden_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dragoonden.tex")


AddRecipe("kyno_elephantcactus", {Ingredient("poop", 4), Ingredient("houndstooth", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_elephantcactus_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "dug_elephantcactus.tex")


local COFFEE_PLANT = GetModConfigData("coffee_hack")
if COFFEE_PLANT == 0 then
AddRecipe("dug_coffeebush", {Ingredient("poop", 5), Ingredient("ash", 5), Ingredient("dug_berrybush", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 1, nil, "images/inventoryimages/dug_coffeebush.xml", "dug_coffeebush.tex")
end


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

local SEA_STRUCTURES = GetModConfigData("ocean_structures")
if SEA_STRUCTURES == 0 then
AddRecipe("mangrovetree_short", {Ingredient("log", 4), Ingredient("twigs", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "mangrovetree_short_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_mangrovetree.xml", "kyno_mangrovetree.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_1", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wreck_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_1.xml", "kyno_wreck_1.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_2", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wreck_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_2.xml", "kyno_wreck_2.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_3", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wreck_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_3.xml", "kyno_wreck_3.tex", IsOcean, nil, nil)


AddRecipe("kyno_wreck_4", {Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_wreck_4_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_wreck_4.xml", "kyno_wreck_4.tex", IsOcean, nil, nil)


AddRecipe("kyno_seaweed", {Ingredient("poop", 2), Ingredient("kelp", 1)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_seaweed_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "seaweed.tex", IsOcean, nil, nil)


AddRecipe("kyno_brain_rock", {Ingredient("rocks", 3), Ingredient(CHARACTER_INGREDIENT.SANITY, 20)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_brain_rock_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_brain_rock.xml", "kyno_brain_rock.tex", IsOcean, nil, nil)


AddRecipe("wall_enforcedlimestone_item", {Ingredient("cutstone", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_enforcedlimestone_item.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_1", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_coral_1_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_1.xml", "kyno_rock_coral_1.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_2", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_coral_2_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_2.xml", "kyno_rock_coral_2.tex", IsOcean, nil, nil)


AddRecipe("kyno_rock_coral_3", {Ingredient("rocks", 4), Ingredient("flint", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_rock_coral_3_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_rock_coral_3.xml", "kyno_rock_coral_3.tex", IsOcean, nil, nil)


AddRecipe("kyno_redbarrel", {Ingredient("boards", 2), Ingredient("gunpowder", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_redbarrel_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_redbarrel.xml", "kyno_redbarrel.tex", IsOcean, nil, nil)


AddRecipe("kyno_bermudatriangle", {Ingredient("nightmarefuel", 4), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_bermudatriangle_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_bermudatriangle.xml", "kyno_bermudatriangle.tex", IsOcean, nil, nil)


AddRecipe("kyno_ballphinhouse", {Ingredient("cutstone", 3), Ingredient("kelp", 4), Ingredient("flint", 3)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_ballphinhouse_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "ballphinhouse.tex", IsOcean, nil, nil)


AddRecipe("kyno_octopusking", {Ingredient("cutstone", 5), Ingredient("kelp", 5), Ingredient("goldnugget", 10)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_octopusking_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_octopusking.xml", "kyno_octopusking.tex", IsOcean, nil, nil)


AddRecipe("kyno_luggagechest", {Ingredient("boards", 3)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_luggagechest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_luggagechest.xml", "kyno_luggagechest.tex", IsOcean, nil, nil)


AddRecipe("kyno_fishinhole", {Ingredient("pondfish", 4), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_fishinhole_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_fishinhole.xml", "kyno_fishinhole.tex", IsOcean, nil, nil)


AddRecipe("kyno_buoy", {Ingredient("lantern", 1), Ingredient("twigs", 4), Ingredient("boards", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_buoy_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "buoy.tex", IsOcean, nil, nil)

AddRecipe("kyno_sea_chiminea", {Ingredient("cutstone", 2), Ingredient("log", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sea_chiminea_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_chiminea.tex", IsOcean, nil, nil)


AddRecipe("kyno_seayard", {Ingredient("log", 4), Ingredient("cutstone", 6), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_seayard_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "sea_yard.tex", IsOcean, nil, nil)


AddRecipe("kyno_extractor", {Ingredient("boards", 2), Ingredient("cutstone", 2), Ingredient("transistor", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_extractor_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "tar_extractor.tex", IsOcean, nil, nil)


AddRecipe("kyno_musselfarm", {Ingredient("boards", 1), Ingredient("twigs", 2), Ingredient("cutgrass", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_musselfarm_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "mussel_stick.tex", IsOcean, nil, nil)


AddRecipe("kyno_fishfarm", {Ingredient("silk", 2), Ingredient("rope", 2), Ingredient("pondfish", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_fishfarm_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "fish_farm.tex", IsOcean, nil, nil)


AddRecipe("kyno_sealab", {Ingredient("cutstone", 4), Ingredient("transistor", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_sealab_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "researchlab5.tex", IsOcean, nil, nil)


AddRecipe("kyno_krakenchest", {Ingredient("boards", 4), Ingredient("boneshard", 4)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_krakenchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_krakenchest.xml", "kyno_krakenchest.tex", IsOcean, nil, nil)


AddRecipe("kyno_waterchest", {Ingredient("boards", 3), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_waterchest_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "waterchest.tex", IsOcean, nil, nil)


AddRecipe("kyno_watercrate", {Ingredient("boards", 2), Ingredient("kelp", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_watercrate_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_watercrate.xml", "kyno_watercrate.tex", IsOcean, nil, nil)


AddRecipe("kyno_tarpit", {Ingredient("charcoal", 2), Ingredient("ash", 2), Ingredient("boneshard", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, "kyno_tarpit_placer", 1, nil, nil, nil, "images/inventoryimages/kyno_tarpit.xml", "kyno_tarpit.tex")
end


AddRecipe("wall_limestone_item", {Ingredient("cutstone", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_inventoryimages_sw.xml", "wall_limestone_item.tex")


AddRecipe("turf_magmafield", {Ingredient("turf_rocky", 2), Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_magmafield.tex")


AddRecipe("turf_volcano", { magmaingredient },
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano.tex")


AddRecipe("turf_ash", {Ingredient("ash", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_ash.tex")


AddRecipe("turf_volcano_rock", { magmaingredient, Ingredient("rocks", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_volcano_rock.tex")


AddRecipe("turf_tidalmarsh", {Ingredient("turf_marsh", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw_2.xml", "turf_tidalmarsh.tex")


AddRecipe("turf_jungle", {Ingredient("turf_forest", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_jungle.tex")


AddRecipe("turf_meadow", {Ingredient("turf_grass", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_meadow.tex")


AddRecipe("turf_beach", {Ingredient("turf_desertdirt", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_beach.tex")


AddRecipe("turf_snakeskinfloor", {Ingredient("turf_carpetfloor", 2)},
kyno_shipwreckedtab, TECH.BARQUINHO_ONE, nil, nil, nil, 4, nil, "images/inventoryimages/kyno_turfs_sw.xml", "turf_snakeskinfloor.tex")
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------