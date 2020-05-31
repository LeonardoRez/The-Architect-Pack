AddIngredientValues({"kyno_coffeebeans_cooked"}, {fruit=1}, true)
AddIngredientValues({"kyno_coffeebeans"}, {fruit=.5}, true)
AddIngredientValues({"kyno_lotus_flower"}, {veggie=1}, true)
AddIngredientValues({"kyno_lotus_flower_cooked"}, {veggie=1}, true)

local coffee =	{	
	name = "coffee",
	test = function(cooker, names, tags) return names.kyno_coffeebeans_cooked and (names.kyno_coffeebeans_cooked == 4 or (names.kyno_coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener)))	end,
	priority = 30,
	foodtype = FOODTYPE.GOODIES,
	health = TUNING.HEALING_SMALL,
	hunger = TUNING.CALORIES_TINY,
	sanity = -TUNING.SANITY_TINY,
	perishtime = TUNING.PERISH_MED,
	cooktime = 0.5,
	weight = 1,
	potlevel = "low",
	floater = {"small", 0.05, 0.7},
}

for _, spice in pairs({"chili", "garlic", "sugar", "salt"}) do
    local spiced_coffee = _G.shallowcopy(coffee)
    local spicename = "spice_"..spice
    spiced_coffee.basename = "coffee"
    spiced_coffee.name = "coffee_"..spicename
    spiced_coffee.spice = spicename
    spiced_coffee.test = function(cooker, names, tags)
        return names.coffee and names[spicename]
    end
    spiced_coffee.cooktime = 0.12
    spiced_coffee.priority = 100
    AddCookerRecipe("portablespicer", spiced_coffee)
end

AddCookerRecipe("cookpot", coffee)
AddCookerRecipe("portablecookpot", coffee)