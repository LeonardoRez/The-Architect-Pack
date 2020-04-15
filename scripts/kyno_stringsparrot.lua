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
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz big head!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Chump!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("You stink!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Feed me!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz stop complaining!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Cracker!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("MERDA MERDA MERDA")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("CUT STONES!!!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp") 
				end
			end
		end)
	end)
end
---------------------------------------------------------------------------------------