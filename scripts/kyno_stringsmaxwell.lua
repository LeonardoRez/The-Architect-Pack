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
local kyno_maxwell = {"kyno_endgame_maxwell"}
for i, maxwell in ipairs(kyno_maxwell) do
	AddPrefabPostInit(maxwell, function(inst)
		inst:AddTag("MaxwellTalker")
		inst:AddComponent("talker")
		inst.components.talker.ontalk = ontalk
		inst.components.talker.fontsize = 40
		inst.components.talker.font = TALKINGFONT
		inst.components.talker.offset = GLOBAL.Vector3(0,-700,0)
		
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
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Forgive me if I don't get up.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP") 
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("They'll show you terrible, beautiful things.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then	
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Just dust. And the Void. And Them.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You can't change the rules of the game.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Go on, stay a while. Keep us company.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I don't know what they want. They... they just watch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Either way, you're just delaying the inevitable.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I'm so tired...")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Is this how it ends?")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I hope Charlie is okay...")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Maybe I was wrong, maybe...")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("At least you have freedom.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Heh. Took them long enough.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("God Mode Disabled")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You've been an interesting plaything, but I've grown tired of this game.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I've learned so much since then. I've built so much.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("There wasn't much here when I showed up.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Unless you get too close... Then...")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("What year is it out there? Time moves differently here.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Well, there's a reason I stay so dapper.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Reality is like that, sometimes.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("󰀅󰀆󰀅")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I think I've said enough.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I suppose I deserve that.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("This is the end of the line. We have no escape.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("It will change you, like it did me.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I'm so sorry, Charlie.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Maybe you can give me a little hand here?")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("They are watching us...")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You can't escape from them.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You Can (Not) Redo.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You should watch Thalz on Twitch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You should watch Jazzy on Twitch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You should watch Freddo on Twitch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You should watch Glermz on Twitch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("You should watch Griever on Twitch.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("DA PIPOCA PRO PAI")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("I've lost all my friends, I diserved.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("People always complain about Wolfgang's damage, but they cheese bosses.")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				elseif math.random() < 0.050 then
					inst.AnimState:PlayAnimation("dialog_loop")
					inst.components.talker:Say("Well well, if it isn't %s!")
					inst.SoundEmitter:PlaySound("dontstarve/maxwell/talk_LP_world6", "talk_LP")
					inst:DoTaskInTime(2, function() inst.SoundEmitter:KillSound("talk_LP") end)
					inst.AnimState:PushAnimation("idle_loop", true)
				end
			end
		end)
	end)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------