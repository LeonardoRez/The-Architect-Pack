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
---------------------------------------------------------------------------------------
local parrot_pirate = {"kyno_shipmast"}
for i, parrot in ipairs(parrot_pirate) do
	AddPrefabPostInit(parrot, function(inst)
		inst:AddTag("Parrot_Pirate")
		inst:AddComponent("talker")
		inst.components.talker.ontalk = ontalk
		inst.components.talker.fontsize = 30
		inst.components.talker.font = TALKINGFONT
		inst.components.talker.colour = GLOBAL.Vector3(.9, .4, .4)
		inst.components.talker.offset = GLOBAL.Vector3(0,-600,0)
		
		if not GLOBAL.TheWorld.ismastersim then
		   return inst
		end
		local talk_time = 10 * (0.8 + 0.4 * math.random()) --500
		inst:DoPeriodicTask(talk_time, function(inst)
			local x, y, z = inst.Transform:GetWorldPosition()
			local ents = GLOBAL.TheSim:FindEntities(x, y, z, 16, { "player" })
			ent = ents[1]
			
			if ent and ent.userid ~= nil then
				if math.random() < 0.050 then
					inst.components.talker:Say("Arrr! you little shit!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz big head!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Chump!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("You stink!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Feed me!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz stop complaining!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Cracker!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Seu viadinho!")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("CUT STONES!!!")
				end
			end
		end)
	end)
end
---------------------------------------------------------------------------------------