local assets =
{
    Asset("ANIM", "anim/fireflies.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_redflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_redflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_orangeflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_orangeflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_yellowflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_yellowflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_greenflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_greenflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_blueflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_blueflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cyanflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cyanflies.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_purpleflies.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_purpleflies.xml"),
}

local INTENSITY = .5

local function randomizefadein()
    return math.random(1, 31)
end

local function randomizefadeout()
    return math.random(32, 63)
end

local function immediatefadeout()
    return 0
end

local function resolvefaderate(x)
    return (x == 0 and 0)
        or (x < 32 and INTENSITY * FRAMES / (3 + (x - 1) / 15))
        or INTENSITY * FRAMES / ((32 - x) / 31 - .75)
end

local function updatefade(inst, rate)
    inst._fadeval:set_local(math.clamp(inst._fadeval:value() + rate, 0, INTENSITY))

    inst.Light:SetIntensity(inst._fadeval:value())

    if rate == 0 or
        (rate < 0 and inst._fadeval:value() <= 0) or
        (rate > 0 and inst._fadeval:value() >= INTENSITY) then
        inst._fadetask:Cancel()
        inst._fadetask = nil
        if inst._fadeval:value() <= 0 and TheWorld.ismastersim then
            inst:AddTag("NOCLICK")
            inst.Light:Enable(false)
        end
    end
end

local function fadein(inst)
    local ismastersim = TheWorld.ismastersim
    if not ismastersim or resolvefaderate(inst._faderate:value()) <= 0 then
        if ismastersim then
            inst:RemoveTag("NOCLICK")
            inst.Light:Enable(true)
            inst.AnimState:PlayAnimation("swarm_pre")
            inst.AnimState:PushAnimation("swarm_loop", true)
            inst._faderate:set(randomizefadein())
        end
        if inst._fadetask ~= nil then
            inst._fadetask:Cancel()
        end
        local rate = resolvefaderate(inst._faderate:value()) * math.clamp(1 - inst._fadeval:value() / INTENSITY, 0, 1)
        inst._fadetask = inst:DoPeriodicTask(FRAMES, updatefade, nil, rate)
        if not ismastersim then
            updatefade(inst, rate)
        end
    end
end

local function fadeout(inst)
    local ismastersim = TheWorld.ismastersim
    if not ismastersim or resolvefaderate(inst._faderate:value()) > 0 then
        if ismastersim then
            inst.AnimState:PlayAnimation("swarm_pst")
            inst._faderate:set(randomizefadeout())
        end
        if inst._fadetask ~= nil then
            inst._fadetask:Cancel()
        end
        local rate = resolvefaderate(inst._faderate:value()) * math.clamp(inst._fadeval:value() / INTENSITY, 0, 1)
        inst._fadetask = inst:DoPeriodicTask(FRAMES, updatefade, nil, rate)
        if not ismastersim then
            updatefade(inst, rate)
        end
    end
end

local function OnFadeRateDirty(inst)
    local rate = resolvefaderate(inst._faderate:value())
    if rate > 0 then
        fadein(inst)
    elseif rate < 0 then
        fadeout(inst)
    elseif inst._fadetask ~= nil then
        inst._fadetask:Cancel()
        inst._fadetask = nil
        inst._fadeval:set_local(0)

        inst.Light:SetIntensity(0)
    end
end

local function updatelight(inst)
    if TheWorld.state.isnight and not inst.components.playerprox:IsPlayerClose() and inst.components.inventoryitem.owner == nil then
        fadein(inst)
    else
        fadeout(inst)
    end
end

local function ondropped(inst)
    inst.components.workable:SetWorkLeft(1)
    inst._fadeval:set(0)
    inst._faderate:set_local(immediatefadeout())
    fadein(inst)
    inst:DoTaskInTime(2 + math.random(), updatelight)
end

local function onpickup(inst)
    if inst._fadetask ~= nil then
        inst._fadetask:Cancel()
        inst._fadetask = nil
    end
    inst._fadeval:set_local(0)
    inst._faderate:set(immediatefadeout())
    inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
end

local function onworked(inst, worker)
    if worker.components.inventory ~= nil then
        worker.components.inventory:GiveItem(inst, nil, inst:GetPosition())
    end
end

local function getstatus(inst)
    if inst.components.inventoryitem.owner ~= nil then
        return "HELD"
    end
end

local function OnIsNight(inst)
    inst:DoTaskInTime(2 + math.random(), updatelight)
end

local function fn_red()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(255/255, 15/255, 15/255)
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_redflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_orange()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(255/255, 156/255, 0/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_orangeflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_yellow()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(255/255, 255/255, 0/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_yellowflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_green()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(75/255, 255/255, 0/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_greenflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_blue()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(10/255, 75/255, 255/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)

    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_blueflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_cyan()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(0/255, 255/255, 255/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)
	
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_cyanflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

local function fn_purple()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddPhysics()
    inst.entity:AddLight()
    inst.entity:AddNetwork()

    inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(INTENSITY)
    inst.Light:SetRadius(1)
	inst.Light:SetColour(180/255, 0/255, 255/255) 
	inst.Light:SetIntensity(0)
    inst.Light:Enable(false)
    inst.Light:EnableClientModulation(true)
	
    inst.AnimState:SetBloomEffectHandle("shaders/anim.ksh")

    inst.AnimState:SetBank("fireflies")
    inst.AnimState:SetBuild("fireflies")
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("cattoyairborne")
	inst:AddTag("flying")
	inst:AddTag("NOBLOCK")
    inst:AddTag("NOCLICK")

    inst._fadeval = net_float(inst.GUID, "fireflies._fadeval")
    inst._faderate = net_smallbyte(inst.GUID, "fireflies._faderate", "onfaderatedirty")
    inst._fadetask = nil
	
	inst:SetPrefabNameOverride("fireflies")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        inst:ListenForEvent("onfaderatedirty", OnFadeRateDirty)

        return inst
    end
	
	inst:AddComponent("tradable")

    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(3,5)
    inst.components.playerprox:SetOnPlayerNear(updatelight)
    inst.components.playerprox:SetOnPlayerFar(updatelight)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = getstatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.NET)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworked)

    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
    inst.components.stackable.forcedropsingle = true

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_purpleflies.xml"
	
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPickupFn(onpickup)
    inst.components.inventoryitem.canbepickedup = false
    inst.components.inventoryitem.canbepickedupalive = true

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
    inst.components.fuel.fueltype = FUELTYPE.CAVE

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:WatchWorldState("isnight", OnIsNight)

    updatelight(inst)

    return inst
end

return Prefab("kyno_redflies", fn_red, assets),
Prefab("kyno_orangeflies", fn_orange, assets),
Prefab("kyno_yellowflies", fn_yellow, assets),
Prefab("kyno_greenflies", fn_green, assets),
Prefab("kyno_blueflies", fn_blue, assets),
Prefab("kyno_cyanflies", fn_cyan, assets),
Prefab("kyno_purpleflies", fn_purple, assets)