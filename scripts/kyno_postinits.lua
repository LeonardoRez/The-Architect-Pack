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
------------------------------------------------------------------------------------------------------------
modimport "scripts/kyno_assets"
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("coconut", function(inst)	
	if inst.components.perishable ~= nil then
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
	end 
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_limestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_enforcedlimestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
------------------------------------------------------------------------------------------------------------