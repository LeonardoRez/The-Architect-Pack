require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/porkalypse_clock_01.zip"),
	Asset("ANIM", "anim/porkalypse_clock_02.zip"),
	Asset("ANIM", "anim/porkalypse_clock_03.zip"),
	Asset("ANIM", "anim/porkalypse_clock_marker.zip"),
	Asset("ANIM", "anim/porkalypse_totem.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_calendar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_calendar.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local prefabs =
{
	"kyno_aporkalypse_clock1",
	"kyno_aporkalypse_clock2",
	"kyno_aporkalypse_clock3",
}

local function OnNight(inst, isnight)
	if isnight then
		inst.AnimState:PlayAnimation("idle_pre")
		inst.AnimState:PushAnimation("idle_on", true)
		inst:DoTaskInTime(1/30, function()
		inst.SoundEmitter:KillSound("base_sound")
		inst.SoundEmitter:KillSound("totem_sound")
		end)
	end
end

local function OnNightFX(inst, isnight)
	if isnight then
		inst.AnimState:PlayAnimation("on_shake")
		inst.AnimState:PushAnimation("on_idle", true)
	end
end

local function OnDay(inst, isday)
	if isday then
		inst.AnimState:PlayAnimation("idle_pst")
		inst.AnimState:PushAnimation("idle_loop", true)
	end
end

local function onnear(inst, isday)
	if isday then
		inst:DoTaskInTime(1/30, function()
		inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/aporkalypse_clock/totem_LP", "totem_sound")
		inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/aporkalypse_clock/base_LP", "base_sound")
		end)
	end
end

local function onfar(inst)
	inst:DoTaskInTime(1/30, function()
	inst.SoundEmitter:KillSound("base_sound")
	inst.SoundEmitter:KillSound("totem_sound")
	end)
end

local function OnDayFX(inst, isday)
	if isday then
		inst.AnimState:PlayAnimation("off_shake")
		inst.AnimState:PushAnimation("off_idle", true)
	end
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("idle_off")
	inst.AnimState:PushAnimation("idle_off", false)
end

local function fn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("porkalypse_clock.png")
	
	inst.AnimState:SetBank("totem")
	inst.AnimState:SetBuild("porkalypse_totem")
	inst.AnimState:PlayAnimation("idle_loop", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("kynoclock")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	local function createExtras(inst)
	inst.clockprefab =  SpawnPrefab("kyno_aporkalypse_clock1")
	inst.clockprefab2 =  SpawnPrefab("kyno_aporkalypse_clock2")
	inst.clockprefab3 =  SpawnPrefab("kyno_aporkalypse_clock3")
	
	inst.clockprefab.entity:SetParent(inst.entity)
	inst.clockprefab2.entity:SetParent(inst.entity)
	inst.clockprefab3.entity:SetParent(inst.entity)
	end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)
	
	-- inst:AddComponent("playerprox")
    -- inst.components.playerprox:SetDist(8, 16)
    -- inst.components.playerprox:SetOnPlayerNear(onnear)
    -- inst.components.playerprox:SetOnPlayerFar(onfar)
	
	inst:AddComponent("savedrotation")
	
	inst:DoTaskInTime(FRAMES * 1, createExtras)
	
	inst:WatchWorldState("isday", OnDay)
    OnDay(inst, TheWorld.state.isday)

    inst:WatchWorldState("isnight", OnNight)
    OnNight(inst, TheWorld.state.isnight)

	return inst
end

local function clockfn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("clock_01")
    inst.AnimState:SetBuild("porkalypse_clock_01")
    inst.AnimState:PlayAnimation("off_idle")
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetSortOrder(1)
	
	inst.persists = false

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddTag("structure")
	inst:AddTag("kynoclock_01")
	inst:AddTag("NOCLICK")
	
	inst:AddComponent("savedrotation")
	
	inst:WatchWorldState("isday", OnDayFX)
    OnDayFX(inst, TheWorld.state.isday)

    inst:WatchWorldState("isnight", OnNightFX)
    OnNightFX(inst, TheWorld.state.isnight)
   
    return inst
end

local function clock2fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("clock_02")
    inst.AnimState:SetBuild("porkalypse_clock_02")
    inst.AnimState:PlayAnimation("off_idle")
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetSortOrder(2)
	
	inst.persists = false

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddTag("structure")
	inst:AddTag("kynoclock_02")
	inst:AddTag("NOCLICK")
	
	inst:AddComponent("savedrotation")
	
	inst:WatchWorldState("isday", OnDayFX)
    OnDayFX(inst, TheWorld.state.isday)

    inst:WatchWorldState("isnight", OnNightFX)
    OnNightFX(inst, TheWorld.state.isnight)
   
    return inst
end

local function clock3fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

    inst.AnimState:SetBank("clock_03")
    inst.AnimState:SetBuild("porkalypse_clock_03")
    inst.AnimState:PlayAnimation("off_idle")
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetSortOrder(3)
	
	inst.persists = false

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
    inst:AddTag("structure")
	inst:AddTag("kynoclock_03")
	inst:AddTag("NOCLICK")
	
	inst:AddComponent("savedrotation")
	
	inst:WatchWorldState("isday", OnDayFX)
    OnDayFX(inst, TheWorld.state.isday)

    inst:WatchWorldState("isnight", OnNightFX)
    OnNightFX(inst, TheWorld.state.isnight)
   
    return inst
end

local function aporkalypseclockplacetestfn(inst)
    inst.AnimState:AddOverrideBuild("porkalypse_clock_01")
    inst.AnimState:AddOverrideBuild("porkalypse_clock_02")
	inst.AnimState:AddOverrideBuild("porkalypse_clock_03")
    return true
end

return Prefab("kyno_aporkalypse_calendar", fn, assets, prefabs),
Prefab("kyno_aporkalypse_clock1", clockfn, assets, prefabs),
Prefab("kyno_aporkalypse_clock2", clock2fn, assets, prefabs),
Prefab("kyno_aporkalypse_clock3", clock3fn, assets, prefabs),
MakePlacer("kyno_aporkalypse_calendar_placer", "totem", "porkalypse_totem", "idle_loop", false, nil, nil, nil, 90, nil, aporkalypseclockplacetestfn)