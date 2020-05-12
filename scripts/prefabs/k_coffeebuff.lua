local function OnAttached(inst, target)
    if target.coffeebuff_duration then
        inst.components.timer:StartTimer("coffeebuff_done", target.coffeebuff_duration)
    end
    if not inst.components.timer:TimerExists("coffeebuff_done") then
        inst.components.debuff:Stop()
        return
    end
    inst.entity:SetParent(target.entity)
    inst.Transform:SetPosition(0, 0, 0)
    target.components.locomotor:SetExternalSpeedMultiplier(target, "coffeebuff", 1.83)
    inst:ListenForEvent("death", function()
        inst.components.debuff:Stop()
    end, target)
end

local function OnDetached(inst, target)
    target.components.locomotor:RemoveExternalSpeedMultiplier(target, "coffeebuff")
    inst:Remove()
end

local function OnExtended(inst, target)
    local current_duration = inst.components.timer:GetTimeLeft("coffeebuff_done")
    local new_duration = math.max(current_duration, target.coffeebuff_duration)
    inst.components.timer:StopTimer("coffeebuff_done")
    inst.components.timer:StartTimer("coffeebuff_done", new_duration)
end

local function fn()
    if not TheWorld.ismastersim then 
		return 
	end

    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:Hide()
    --[[Non-networked entity]]
    inst.persists = false

    inst:AddTag("CLASSIFIED")

    inst:AddComponent("debuff")
    inst.components.debuff:SetAttachedFn(OnAttached)
    inst.components.debuff:SetDetachedFn(OnDetached)
    inst.components.debuff:SetExtendedFn(OnExtended)
    inst.components.debuff.keepondespawn = true

    inst:AddComponent("timer")
    inst:ListenForEvent("timerdone", function(inst, data)
        if data.name == "coffeebuff_done" then
            inst.components.debuff:Stop()
        end
    end)

    return inst
end

function c_getcoffeeduration()
    local player = ConsoleCommandPlayer()
    local coffeebuff = player.components.debuffable.debuffs.coffeebuff
    local duration = coffeebuff and coffeebuff.inst.components.timer:GetTimeLeft("coffeebuff_done")
    player.components.talker:Say("Time Left: "..math.floor(duration or 0).." seconds")
end

return Prefab("coffeebuff", fn)
