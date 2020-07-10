local assets =
{
    Asset("ANIM", "anim/telebrella.zip"),
	Asset("ANIM", "anim/swap_telebrella.zip"),
    Asset("ANIM", "anim/swap_telebrella_red.zip"),
    Asset("ANIM", "anim/swap_telebrella_green.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons_2.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_wagstaff.fev"),
	Asset("SOUND", "sound/dontstarve_wagstaff.fsb"),
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local TELEDIST = 1000

local function onfinished(inst)
    inst:Remove()
end

local function findclosestpad(inst, sourcepad, target)    
    local target = ThePlayer
    if sourcepad then
        target = sourcepad
    end
    local pad = nil
    if GetWorld().telipads then
        local dist = TELEDIST * TELEDIST
        for i,testpad in ipairs(GetWorld().telipads) do
            local x,y,z = testpad.Transform:GetWorldPosition()
            local ground = GetWorld()            
            local tile = ground.Map:GetTileAtPoint(x,y,z)
            if tile ~= GROUND.INTERIOR then
                local testdist = target:GetDistanceSqToInst(testpad)
                if testdist < dist and testpad ~= target then
                    pad = testpad
                    dist = testdist
                end
            end
        end
    end
    return pad
end

local function checkconnection(inst) 
    local player = ThePlayer
    local pad = findclosestpad(inst)    
    if inst.lastpad then
        inst.lastpad.turnoff(inst.lastpad)        
    end
    if pad then        
        if player:GetDistanceSqToInst(pad) < 2*2 then
            local otherpad = findclosestpad(inst,pad)
            inst.lastpad = pad
            if otherpad then            
                inst.lastpad.turnon(inst.lastpad)
            end
            pad = otherpad            
        end
        return pad        
    end
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_object", "swap_telebrella", "swap_telebrella")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
    local INTERVAL = 0.1
    inst.task = inst:DoPeriodicTask(INTERVAL, function() 
            local player = ThePlayer 
            local pad = checkconnection(inst) 
            if pad then
                inst.flashtime = inst.flashtime + INTERVAL
                local switch = false
                local dist = player:GetDistanceSqToInst(pad)
                local period = INTERVAL
                if not inst.red then
                    local max = TELEDIST*TELEDIST
                    if dist > max *0.9 then
                        period = INTERVAL
                    elseif dist > max *0.75 then
                        period = 1
                    elseif dist > max *0.5 then
                        period = 3
                    else 
                        period = 9999999
                    end
                end
                if inst.flashtime > period then
                    switch = true            
                    inst.flashtime = 0
                end
                if switch then
                    if not inst.red then
                        inst.SoundEmitter:PlaySound("dontstarve_wagstaff/characters/wagstaff/teleumbrella_beep")
                        inst.red = true
                    else                 
                        inst.red = nil
                    end                
                end
                if inst.red then
                    owner.AnimState:OverrideSymbol("swap_object", "swap_telebrella_red", "swap_telebrella")
                else
                    owner.AnimState:OverrideSymbol("swap_object", "swap_telebrella_green", "swap_telebrella")
                end                
            else
                owner.AnimState:OverrideSymbol("swap_object", "swap_telebrella", "swap_telebrella")            
            end
        end)
end

local function onunequip(inst, owner) 
    owner.AnimState:Hide("ARM_carry") 
    owner.AnimState:Show("ARM_normal") 
    if inst.task then
        inst.task:Cancel()
        inst.task = nil
    end
end

local function canteleport(staff, caster, target, pos)
    if checkconnection(staff) then
        return true
    end    
end

local function teleport(staff)
    local player = ThePlayer
    local pad = nil
    if canteleport(staff) then
        pad = checkconnection(staff)
    end
    if pad then
        local pos = pad:GetPosition()
        player.Transform:SetPosition(pos.x, pos.y, pos.z)
        TheCamera:Snap()
        player.components.locomotor:Clear()

        local light = SpawnPrefab("kyno_telebrella_glow")
        if light then
            local x,y,z = player.Transform:GetWorldPosition()
            light.Transform:SetPosition(x,y,z)
        end
    end
    staff.components.finiteuses:Use(1)
end

local function fn(Sim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "large")

    inst.AnimState:SetBank("telebrella")
    inst.AnimState:SetBuild("telebrella")
    inst.AnimState:PlayAnimation("idle")  

    inst:AddTag("telebrella")
    inst:AddTag("waterproofer")
	inst:AddTag("veryquickcast")
	
	inst.spelltype = "SCIENCE"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("tradable")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(17)
	
	inst:AddComponent("waterproofer")
	inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_SMALLMED)
	
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	
	inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(onfinished) 

    inst:AddComponent("insulator")
    inst.components.insulator:SetSummer()
	
	inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("spellcaster")
    inst.components.spellcaster:SetSpellFn(teleport)
    inst.components.spellcaster:SetCanCastFn(canteleport)
    inst.components.spellcaster.canuseonpoint = true
    inst.components.spellcaster.canuseonpoint_water = true
    inst.components.spellcaster.canusefrominventory = true
    -- inst.components.spellcaster.castingstate = "telebrella"

    MakeHauntableLaunch(inst)
	inst.teleport = teleport
	inst.flashtime = 0

    return inst
end

local INTENSITY = 1

local function fadein(inst)
    inst.components.fader:StopAll()
    inst.Light:Enable(true)
    if inst:IsAsleep() then
        inst.Light:SetIntensity(INTENSITY)
    else
        inst.Light:SetIntensity(0)
        inst.components.fader:Fade(0, INTENSITY, 0.6, function(v) inst.Light:SetIntensity(v) end)
    end
end

local function fadeout(inst)
    inst.components.fader:StopAll()
    if inst:IsAsleep() then
        inst.Light:SetIntensity(0)
    else
        inst.components.fader:Fade(INTENSITY, 0, 0.6, function(v) inst.Light:SetIntensity(v) end, function() inst.Light:Enable(false) end)
    end
end

local function glowfn(Sim)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddLight()
    inst.entity:AddNetwork()
	
    inst.Light:SetFalloff(.7)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(2)
    inst.Light:SetColour(220/255, 220/255, 220/255)
    inst.Light:Enable(false) 
	
    inst.fadein = fadein
    inst.fadeout = fadeout
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("fader")
	
    inst:DoTaskInTime(0,function()    
            fadein(inst)
        end)
    inst:DoTaskInTime(0.6,function()
            fadeout(inst)
        end)
    inst:DoTaskInTime(0.6 * 2,function()
            inst:Remove()
        end)    
		
    return inst   
end

return Prefab("kyno_telebrella", fn, assets),
Prefab("kyno_telebrella_glow", glowfn, assets)