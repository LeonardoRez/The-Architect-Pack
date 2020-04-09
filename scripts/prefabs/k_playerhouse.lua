require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_house_sale.zip"),
    Asset("ANIM", "anim/player_small_house1.zip"),
    Asset("ANIM", "anim/player_large_house1.zip"),

    Asset("ANIM", "anim/player_large_house1_manor_build.zip"),
    Asset("ANIM", "anim/player_large_house1_villa_build.zip"),
    Asset("ANIM", "anim/player_small_house1_cottage_build.zip"),
    Asset("ANIM", "anim/player_small_house1_tudor_build.zip"),
    Asset("ANIM", "anim/player_small_house1_gothic_build.zip"),
    Asset("ANIM", "anim/player_small_house1_brick_build.zip"),
    Asset("ANIM", "anim/player_small_house1_turret_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUND", "sound/pig.fsb"),
}

local SCALEBUILD = {}
SCALEBUILD["player_large_house1_manor_build"] = true
SCALEBUILD["player_large_house1_villa_build"] = true
SCALEBUILD["player_small_house1_cottage_build"] = true
SCALEBUILD["player_small_house1_tudor_build"] = true
SCALEBUILD["player_small_house1_gothic_build"] = true
SCALEBUILD["player_small_house1_brick_build"] = true
SCALEBUILD["player_small_house1_turret_build"] = true

local SETBANK = {}
SETBANK["player_large_house1_manor_build"] = "player_large_house1"
SETBANK["player_large_house1_villa_build"] = "player_large_house1"
SETBANK["player_small_house1_cottage_build"] = "player_small_house1"
SETBANK["player_small_house1_tudor_build"] = "player_small_house1"
SETBANK["player_small_house1_gothic_build"] = "player_small_house1"
SETBANK["player_small_house1_brick_build"] = "player_small_house1"
SETBANK["player_small_house1_turret_build"] = "player_small_house1"

local house_builds = {
   "player_large_house1_manor_build",
   "player_large_house1_villa_build",
   "player_small_house1_cottage_build",
   "player_small_house1_tudor_build",
   "player_small_house1_gothic_build",
   "player_small_house1_brick_build",
   "player_small_house1_turret_build",
}

local function setScale(inst,build)
    if SCALEBUILD[build] then
        inst.AnimState:SetScale(0.75,0.75,0.75)
	end
end

local function getScale(inst,build)
    if SCALEBUILD[build] then
        return {0.75,0.75,0.75}
	end
end

local function LightsOn(inst, isdusk)
    if not inst:HasTag("burnt") and isdusk then
        inst.Light:Enable(true)
        inst.AnimState:PlayAnimation("lit", true)
        inst.lightson = true
    end
end

local function LightsOff(inst, isday)
    if not inst:HasTag("burnt") and isday then
        inst.Light:Enable(false)
        inst.AnimState:PlayAnimation("idle", true)
        inst.lightson = false
    end
end

local function onfar(inst)
end

local function getstatus(inst)
    if inst:HasTag("burnt") then
        return "BURNT"
    elseif inst.unboarded then
        return "SOLD"
    end
end

local function onnear(inst)
end

local function onwere(child)
    if child.parent and not child.parent:HasTag("burnt") then
        child.parent.SoundEmitter:KillSound("pigsound")
    end
end

local function onnormal(child)
    if child.parent and not child.parent:HasTag("burnt") then
        child.parent.SoundEmitter:KillSound("pigsound")
    end
end

local function onoccupied(inst, child)
    if not inst:HasTag("burnt") then
        if inst.doortask then
            inst.doortask:Cancel()
            inst.doortask = nil
        end
        inst.doortask = inst:DoTaskInTime(1, function() LightsOn(inst) end)
    	if child then
    	    inst:ListenForEvent("transformwere", onwere, child)
    	    inst:ListenForEvent("transformnormal", onnormal, child)
    	end
    end
end

local function onburntup(inst)
    if inst.doortask ~= nil then
        inst.doortask:Cancel()
        inst.doortask = nil
    end
    if inst.inittask ~= nil then
        inst.inittask:Cancel()
        inst.inittask = nil
    end
    if inst._window ~= nil then
        inst._window:Remove()
        inst._window = nil
    end
    if inst._windowsnow ~= nil then
        inst._windowsnow:Remove()
        inst._windowsnow = nil
    end
end

local function onignite(inst)
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        inst.components.spawner:ReleaseChild()
    end
end

local function onhammered(inst, worker)
    if inst:HasTag("fire") and inst.components.burnable then
        inst.components.burnable:Extinguish()
    end
    if inst.doortask then
        inst.doortask:Cancel()
        inst.doortask = nil
    end
    inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
    	inst.AnimState:PlayAnimation("hit")
    	inst.AnimState:PushAnimation("idle")
    end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function setcolor(inst,num)
    if not num then
        num = math.random()
    end
    local color = 0.5 + num * 0.5
    inst.AnimState:SetMultColour(color, color, color, 1)
    return num
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end
    data.build = inst.build
    data.animset = inst.animset
    data.colornum = inst.colornum
end

local function onload(inst, data)
    if data then
        if data.build then
            inst.build = data.build
            inst.AnimState:SetBuild(inst.build) 
            setScale(inst,inst.build)
        end
        if data.animset then
            inst.animset = data.animset
            inst.AnimState:SetBank( inst.animset )
        end    
        if data.colornum then
            inst.colornum = setcolor(inst, data.colornum)
        end
        if data.burnt then
            inst.components.burnable.onburnt(inst)
        end
    end
end

local function Slantyfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_house_sale.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("pig_house_sale")
	inst.AnimState:SetBuild("pig_house_sale")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true
	
	inst:AddTag("structure")
	inst:AddTag("playerhouse")

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function Manorfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_house_sale.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_large")
	inst.AnimState:SetBuild("player_large_house1_manor_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true
	
	inst:AddTag("structure")
	inst:AddTag("playerhouse")

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Villafn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_villa.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_large")
	inst.AnimState:SetBuild("player_large_house1_villa_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Cottagefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_cottage.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_small")
	inst.AnimState:SetBuild("player_small_house1_cottage_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Tudorfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_tudor.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_small")
	inst.AnimState:SetBuild("player_small_house1_tudor_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Gothicfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_gothic.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_small")
	inst.AnimState:SetBuild("player_small_house1_gothic_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Brickfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_brick.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_small")
	inst.AnimState:SetBuild("player_small_house1_brick_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function Turretfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("player_house_turret.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(4)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:SetBank("playerhouse_small")
	inst.AnimState:SetBuild("player_small_house1_turret_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:Hide("boards")
	
	MakeObstaclePhysics(inst, 1)
	inst.unboarded = true

	inst:AddTag("structure")
	inst:AddTag("playerhouse")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:WatchWorldState("isday", LightsOff)
    LightsOff(inst, TheWorld.state.isday)

    inst:WatchWorldState("isdusk", LightsOn)
    LightsOn(inst, TheWorld.state.isdusk)

	return inst
end

local function playerhouseplacetestfn(inst)
    inst.AnimState:Hide("SNOW")
	inst.AnimState:SetScale(0.75,0.75,0.75)
	inst.AnimState:Hide("boards")
    return true
end

return Prefab("kyno_playerhouse", Slantyfn, assets, prefabs),
MakePlacer("kyno_playerhouse_placer", "pig_house_sale", "pig_house_sale", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_manor", Manorfn, assets, prefabs),
MakePlacer("kyno_playerhouse_manor_placer", "playerhouse_large", "player_large_house1_manor_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_villa", Villafn, assets, prefabs),
MakePlacer("kyno_playerhouse_villa_placer", "playerhouse_large", "player_large_house1_villa_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_cottage", Cottagefn, assets, prefabs),
MakePlacer("kyno_playerhouse_cottage_placer", "playerhouse_small", "player_small_house1_cottage_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_tudor", Tudorfn, assets, prefabs),
MakePlacer("kyno_playerhouse_tudor_placer", "playerhouse_small", "player_small_house1_tudor_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_gothic", Gothicfn, assets, prefabs),
MakePlacer("kyno_playerhouse_gothic_placer", "playerhouse_small", "player_small_house1_gothic_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_brick", Brickfn, assets, prefabs),
MakePlacer("kyno_playerhouse_brick_placer", "playerhouse_small", "player_small_house1_brick_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn),

Prefab("kyno_playerhouse_turret", Turretfn, assets, prefabs),
MakePlacer("kyno_playerhouse_turret_placer", "playerhouse_small", "player_small_house1_turret_build", "idle", false, nil, nil, nil, nil, nil, playerhouseplacetestfn)