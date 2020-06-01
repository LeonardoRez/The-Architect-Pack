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
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz big head!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Chump!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("You stink!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Feed me!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz stop complaining!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Cracker!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("MERDA MERDA MERDA")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("CUT STONES!!!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Ogait we need more resources!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I bet-t-t OoOogait is dying!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Willow is the best!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")					
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wigfrid Mains")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("1 Hit Kill Mode Disabled")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Alt+F4 to avoid death!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Filthy Wes main!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Why aren't you insane, noob?")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I don't struggle with any boss!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Arr! Pools is cheating cobblestones again!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Kynoox! Arrr! Fix this!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Nice farm chump! I'll steal this.")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Klei Forums 󰀅󰀆󰀅")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey guys, keyboard again.")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Yo, 12 living logs are missing! Arrr!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("LORO QUER BISCOITO!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Can you stop talking shit about Wolfgang?")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("FOR THE FIRE LORD! ARRR!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I know where is James Bucket's discord, chump!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Jazzy big nose!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey, weeabo!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wes is bes")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				end
			end
		end)
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local parrot_pirate2 = {"parrot_pirate"}
for i, parrot2 in ipairs(parrot_pirate2) do
	AddPrefabPostInit(parrot2, function(inst)
		inst:AddTag("Parrot_Pirate2")
		inst:AddComponent("talker")
		inst.components.talker.ontalk = ontalk
		inst.components.talker.fontsize = 30
		inst.components.talker.font = TALKINGFONT
		inst.components.talker.colour = GLOBAL.Vector3(.9, .4, .4)
		inst.components.talker.offset = GLOBAL.Vector3(0,-300,0)
		
		if not GLOBAL.TheWorld.ismastersim then
		   return inst
		end
		local talk_time = 5 * (0.8 + 0.4 * math.random()) --500
		inst:DoPeriodicTask(talk_time, function(inst)
			local x, y, z = inst.Transform:GetWorldPosition()
			local ents = GLOBAL.TheSim:FindEntities(x, y, z, 16, { "player" })
			ent = ents[1]
			
			if ent and ent.userid ~= nil then
				if math.random() < 0.050 then
					inst.components.talker:Say("Arrr! you little shit!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz big head!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Chump!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("You stink!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Feed me!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz stop complaining!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Cracker!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("MERDA MERDA MERDA")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("CUT STONES!!!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Ogait we need more resources!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I bet-t-t OoOogait is dying!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Willow is the best!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")					
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wigfrid Mains")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("1 Hit Kill Mode Disabled")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Alt+F4 to avoid death!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Filthy Wes main!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Why aren't you insane, noob?")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I don't struggle with any boss!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Arr! Pools is cheating cobblestones again!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Kynoox! Arrr! Fix this!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Nice farm chump! I'll steal this.")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Klei Forums 󰀅󰀆󰀅")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey guys, keyboard again.")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Yo, 12 living logs are missing! Arrr!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("LORO QUER BISCOITO!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Can you stop talking shit about Wolfgang?")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("FOR THE FIRE LORD! ARRR!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I know where is James Bucket's discord, chump!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Jazzy big nose!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")	
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey, weeabo!")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wes is bes")
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				end
			end
		end)
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
local parrot_pirate3 = {"kyno_parrot_boat"}
for i, parrot3 in ipairs(parrot_pirate3) do
	AddPrefabPostInit(parrot3, function(inst)
		inst:AddTag("Parrot_Pirate3")
		inst:AddComponent("talker")
		inst.components.talker.ontalk = ontalk
		inst.components.talker.fontsize = 30
		inst.components.talker.font = TALKINGFONT
		inst.components.talker.colour = GLOBAL.Vector3(.9, .4, .4)
		inst.components.talker.offset = GLOBAL.Vector3(0,-600,0)
		
		if not GLOBAL.TheWorld.ismastersim then
		   return inst
		end
		local talk_time = 5 * (0.8 + 0.4 * math.random()) --500
		inst:DoPeriodicTask(talk_time, function(inst)
			local x, y, z = inst.Transform:GetWorldPosition()
			local ents = GLOBAL.TheSim:FindEntities(x, y, z, 16, { "player" })
			ent = ents[1]
			
			if ent and ent.userid ~= nil then
				if math.random() < 0.050 then
					inst.components.talker:Say("Arrr! you little shit!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk") 
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz big head!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Chump!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("You stink!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Feed me!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Glermz stop complaining!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Cracker!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("MERDA MERDA MERDA")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("CUT STONES!!!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Ogait we need more resources!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I bet-t-t OoOogait is dying!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Willow is the best!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")					
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wigfrid Mains")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("1 Hit Kill Mode Disabled")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Alt+F4 to avoid death!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Filthy Wes main!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Why aren't you insane, noob?")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I don't struggle with any boss!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Arr! Pools is cheating cobblestones again!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Kynoox! Arrr! Fix this!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Nice farm chump! I'll steal this.")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Klei Forums 󰀅󰀆󰀅")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey guys, keyboard again.")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Yo, 12 living logs are missing! Arrr!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("LORO QUER BISCOITO!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Can you stop talking shit about Wolfgang?")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("FOR THE FIRE LORD! ARRR!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("I know where is James Bucket's discord, chump!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Jazzy big nose!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")	
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Hey, weeabo!")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				elseif math.random() < 0.050 then
					inst.components.talker:Say("Wes is bes")
					inst.AnimState:PlayAnimation("speak")
					inst.AnimState:PushAnimation("idle", true)
					inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/parrot/chirp", "talk")
				end
			end
		end)
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------