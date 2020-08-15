--[[
local GIVESHELF = GLOBAL.Action({priority = 10, distance = 1, mount_valid = true})
GIVESHELF.str = ("Place")
GIVESHELF.id = "GIVESHELF"
GIVESHELF.fn = function(act)
	if act.invobject.components.inventoryitem then
			act.target.components.shelfer:AcceptGift(act.doer, act.invobject)
			return true
			
	end 
end
AddAction(GIVESHELF)

AddComponentAction("USEITEM", "inventoryitem", function(inst, doer, target, actions, right) 
    if not right then
		if target:HasTag("shelfcanaccept") then
			table.insert(actions, ACTIONS.GIVESHELF)        
		end 	
	end
end)

local PICKUP = GLOBAL.Action({priority = 1, distance = 2, mount_valid = true})
PICKUP.str = (GLOBAL.STRINGS.ACTIONS.PICKUP)
PICKUP.id = "PICKUP"
PICKUP.fn = function(act)
	if act.target and act.target.components.inventoryitem and act.target.components.shelfer then
		local item  = act.target.components.shelfer:GetGift()
		if item then
		item:AddTag("inshelf")
		if item.components.perishable then item.components.perishable:StartPerishing() end		
		act.target = act.target.components.shelfer:GiveGift()	
		end
	end

    if act.doer.components.inventory ~= nil and
        act.target ~= nil and
        act.target.components.inventoryitem ~= nil and
        (act.target.components.inventoryitem.canbepickedup or
        (act.target.components.inventoryitem.canbepickedupalive and not act.doer:HasTag("player"))) and
        not (act.target:IsInLimbo() or
            (act.target.components.burnable ~= nil and act.target.components.burnable:IsBurning()) or
            (act.target.components.projectile ~= nil and act.target.components.projectile:IsThrown())) then

        if act.target.components.container ~= nil and act.target.components.container:IsOpen() and not act.target.components.container:IsOpenedBy(act.doer) then
            return false, "inuse"
        end

        act.doer:PushEvent("onpickupitem", { item = act.target })

        if act.target.components.equippable ~= nil and not act.target.components.equippable:IsRestricted(act.doer) then
            local equip = act.doer.components.inventory:GetEquippedItem(act.target.components.equippable.equipslot)
            if equip ~= nil and not act.target.components.inventoryitem.cangoincontainer then
                if equip.components.inventoryitem ~= nil and equip.components.inventoryitem.cangoincontainer then
                    act.doer.components.inventory:GiveItem(act.doer.components.inventory:Unequip(act.target.components.equippable.equipslot))
                else
                    act.doer.components.inventory:DropItem(equip)
                end
                act.doer.components.inventory:Equip(act.target)
                return true
            elseif act.doer:HasTag("player") then
                if equip == nil or act.doer.components.inventory:GetNumSlots() <= 0 then
                    act.doer.components.inventory:Equip(act.target)
                    return true
                elseif GLOBAL.GetGameModeProperty("non_item_equips") then
                    act.doer.components.inventory:DropItem(equip)
                    act.doer.components.inventory:Equip(act.target)
                    return true
                end
            end
        end

        act.doer.components.inventory:GiveItem(act.target, nil, act.target:GetPosition())
        return true
    end
end
AddAction(PICKUP)

AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(GLOBAL.ACTIONS.GIVESHELF, "give"))
AddStategraphActionHandler("wilson_client", GLOBAL.ActionHandler(GLOBAL.ACTIONS.GIVESHELF, "give"))

local State = GLOBAL.State
local FRAMES = GLOBAL.FRAMES
local EventHandler = GLOBAL.EventHandler
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS
local TimeEvent = GLOBAL.TimeEvent
local ActionHandler = GLOBAL.ActionHandler
local ACTIONS = GLOBAL.ACTIONS
local TheNet = GLOBAL.TheNet
local SpawnPrefab = GLOBAL.SpawnPrefab
local PlayFootstep = GLOBAL.PlayFootstep
local Vector3 = GLOBAL.Vector3
local STRINGS = GLOBAL.STRINGS

AddStategraphState("wilson",
	State{
        name = "telebrella",
        tags = { "busy", "pausepredict", "transform", "nomorph" },

        onenter = function(inst)
            inst.telbrellalight = GLOBAL.SpawnPrefab("kyno_telebrella_glow")
            if inst.telbrellalight then
                local x,y,z = inst.Transform:GetWorldPosition()
                inst.telbrellalight.Transform:SetPosition(x,y,z)
            end         
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("teleport_out") 
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,

        timeline = 
        {
            TimeEvent(13*FRAMES, function(inst)     
                inst.SoundEmitter:PlaySound("dontstarve/rain/thunder_close")
            end),
        },

        events = {
            EventHandler("animover", function(inst)
				if inst.AnimState:AnimDone() then
					inst.sg:GoToState("telebrella_finish") 
				end
            end ),
        },
    }
)

AddStategraphState("wilson",
	State{
        name = "telebrella_finish",
        tags = { "busy", "pausepredict", "transform", "nomorph" },

        onenter = function(inst)
            if not inst.telbrellalight then
                inst.telbrellalight = SpawnPrefab("kyno_telebrella_glow")
                if inst.telbrellalight then
                    local x,y,z = inst.Transform:GetWorldPosition()
                    inst.telbrellalight.Transform:SetPosition(x,y,z)
                end
            end           
            inst.components.playercontroller:Enable(false)
            inst.AnimState:PlayAnimation("teleport_finish") 
        end,

        onexit = function(inst)
            inst.components.playercontroller:Enable(true)
        end,

        timeline = 
        {
        },

        events = {
            EventHandler("animover", function(inst)
			    inst:SnapCamera()
		        inst:PerformBufferedAction()
				inst.sg:GoToState("telebrella_pst") 
            end ),
        },
    }
)

AddStategraphState("wilson",
	State{
        name = "telebrella_pst",
        tags = { "busy", "pausepredict", "transform", "nomorph" },
        
		onenter = function(inst)
		    inst:SnapCamera()
		    inst:PerformBufferedAction()
            inst.AnimState:PlayAnimation("teleport_in") 
        end,
		
        timeline=
        {
            TimeEvent(10*FRAMES, function(inst) inst.SoundEmitter:PlaySound("dontstarve_wagstaff/characters/wagstaff/telebrella/telebrella_end") end),
        },

        events=
        {
            EventHandler("animover", function(inst)
                if inst.AnimState:AnimDone() then
                    inst.sg:GoToState("idle")
                end
            end),
        },        
		
		onexit = function(inst)
			inst.components.playercontroller:Enable(true)
        end,
    }
)

AddStategraphPostInit("wilson", function(inst)
local _castspell_actionhandler = inst.actionhandlers[ACTIONS.CASTSPELL].deststate
	inst.actionhandlers[ACTIONS.CASTSPELL].deststate = function(inst, action, ...)
		return action.invobject ~= nil
            and ( (action.invobject:HasTag("telebrella") and "telebrella")
				or _castspell_actionhandler(inst, action, ...)
				)
	end
end)
]]--

AddComponentAction("USEITEM", "fertilizer", function(inst, doer, target, actions)
    if actions[1] == ACTIONS.FERTILIZE and inst:HasTag("coffeefertilizer") ~= target:HasTag("coffeebush") then
        actions[1] = nil
    end
end)