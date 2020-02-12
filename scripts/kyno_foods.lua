local function turnoffspeed(inst)
	inst.components.locomotor.groundspeedmultiplier = 1
	inst.components.locomotor.externalspeedmultiplier = 1	 
end

local kyno_foods =
{
	coffee =
	{	
		test = function(cooker, names, tags) return names.kyno_coffeebeans_cooked and (names.kyno_coffeebeans_cooked == 4 or (names.kyno_coffeebeans_cooked == 3 and (tags.dairy or tags.sweetener)))	end,
		priority = 30,
		foodtype = "GOODIES",
		health = 3,
		hunger = 9.5,
		sanity = -5,
		perishtime = TUNING.PERISH_MED,
		cooktime = 0.5,
		oneatenfn = function(inst, eater)
		if eater.components.locomotor ~= nil then
			eater.components.locomotor.isrunning = true
			eater.components.locomotor.groundspeedmultiplier = 1.85
			eater.components.locomotor.externalspeedmultiplier = 1.85
			eater:DoTaskInTime(480, turnoffspeed)
			end
		end,
		potlevel = "high"
	},
}

for k, recipe in pairs(kyno_foods) do
	recipe.name = k
	recipe.weight = 1
end

return kyno_foods
