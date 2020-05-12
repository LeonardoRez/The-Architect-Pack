local function turnoffspeed(inst, eater)
	if eater.components.locomotor ~= nil and eater:HasTag("caffeined") then 
		eater:RemoveTag("caffeined")
		eater.components.locomotor.groundspeedmultiplier = 1
		eater.components.locomotor.externalspeedmultiplier = 1
	end
end

local kyno_foods =
{
	coffee =
	{	
		test = function(cooker, names, tags) return names.kyno_coffeebeans_cooked and (names.kyno_coffeebeans_cooked == 4 or (names.kyno_coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener)))	end,
		priority = 30,
		foodtype = FOODTYPE.GOODIES,
		health = TUNING.HEALING_SMALL,
		hunger = TUNING.CALORIES_TINY,
		sanity = -TUNING.SANITY_TINY,
		perishtime = TUNING.PERISH_MED,
		cooktime = 0.5,
		potlevel = "high"
	},
}

for k, recipe in pairs(kyno_foods) do
	recipe.name = k
	recipe.weight = 1
end

return kyno_foods