require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/chessmonster_ruins.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_brokenclockwork1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_brokenclockwork1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_brokenclockwork2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_brokenclockwork2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_brokenclockwork3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_brokenclockwork3.xml"),
}

local prefabs =
{
    "bishop",
    "rook",
    "knight",
    "gears",
    "redgem",
    "greengem",
    "yellowgem",
    "purplegem",
    "orangegem",
    "collapse_small",
    "maxwell_smoke",
    "chessjunk_ruinsrespawner_inst",
}

SetSharedLootTable("chess_junk",
{
    {'trinket_6',      1.00},
    {'trinket_6',      0.55},
    {'trinket_1',      0.25},
    {'gears',          0.25},
    {'redgem',         0.25},
    {"greengem" ,      0.05},
    {"yellowgem",      0.05},
    {"purplegem",      0.05},
    {"orangegem",      0.05},
    {"thulecite",      0.01},
})

local MAXHITS = 6

local function SpawnScion(pos, friendly, style, player)
    SpawnPrefab("maxwell_smoke").Transform:SetPosition(pos:Get())

    local scion = SpawnPrefab(
        (style == 1 and (math.random() < .5 and "bishop_nightmare" or "knight_nightmare")) or
        (style == 2 and (math.random() < .3 and "rook_nightmare" or "knight_nightmare")) or
        (math.random() < .3 and "rook_nightmare" or "bishop_nightmare")
    )

    if scion ~= nil then
        scion.Transform:SetPosition(pos:Get())
        --V2C: player could be invalid
        --     either cuz of something that happened during the TaskInTime
        --     or as a result of the lightning strike
        if player == nil or
            not player:IsValid() or
            player:HasTag("playerghost") or
            (player.components.health ~= nil and player.components.health:IsDead()) then
            player = FindClosestPlayerInRange(pos.x, pos.y, pos.z, 20, true)
        end
        if player ~= nil then
            if not friendly and scion.components.combat ~= nil then
                scion.components.combat:SetTarget(player)
            elseif scion.components.follower ~= nil and player.components.minigame_participator == nil then
                player:PushEvent("makefriend")
                scion.components.follower:SetLeader(player)
            end
        end
    end
end

local function OnPlayerRepaired(inst, player)
    inst.components.lootdropper:AddChanceLoot("gears", .1)
    inst.components.lootdropper:DropLoot()
    SpawnScion(inst:GetPosition(), true, inst.style, player)
    inst:Remove()
end

local function OnRepaired(inst, doer)
    if inst.components.workable.workleft < MAXHITS then
        inst.SoundEmitter:PlaySound("dontstarve/common/chesspile_repair")
        inst.AnimState:PlayAnimation("hit"..inst.style)
        inst.AnimState:PushAnimation("idle"..inst.style)
    else
        inst.AnimState:PlayAnimation("hit"..inst.style)
        inst.AnimState:PushAnimation("hit"..inst.style)
        inst.SoundEmitter:PlaySound("dontstarve/common/chesspile_ressurect")
        if not inst.loadingrepaired then
            inst.components.lootdropper:DropLoot()
        end
        inst:DoTaskInTime(.7, OnPlayerRepaired, doer)
        inst.repaired = true
    end
end

local function OnHammered(inst, worker)
    inst.components.lootdropper:DropLoot()
	local fx = SpawnPrefab("collapse_small")
	fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
	fx:SetMaterial("metal")
    inst:Remove()
end

local function OnHit(inst, worker, workLeft)
    inst.AnimState:PlayAnimation("hit"..inst.style)
    inst.AnimState:PushAnimation("idle"..inst.style)
    inst.SoundEmitter:PlaySound("dontstarve/common/lightningrod")
end

local function OnSave(inst, data)
    data.repaired = inst.repaired or nil
end

local function OnLoad(inst, data)
    if data ~= nil and data.repaired then
        inst.loadingrepaired = true
        inst.components.workable:SetWorkLeft(MAXHITS)
        OnRepaired(inst)
        inst.loadingrepaired = nil
    end
end

local function BasePile(style)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("chessjunk.png")

    MakeObstaclePhysics(inst, 1.2)
	
	inst.style = style

    inst.AnimState:SetBank("chessmonster_ruins")
    inst.AnimState:SetBuild("chessmonster_ruins")
    inst.AnimState:PlayAnimation("idle"..inst.style)
	
	inst:AddTag("chess")
    inst:AddTag("mech")

    inst.entity:SetPristine()
	
	inst:SetPrefabNameOverride("chessjunk1")

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(MAXHITS/2)
    inst.components.workable:SetMaxWork(MAXHITS)
    inst.components.workable:SetOnFinishCallback(OnHammered)
    inst.components.workable:SetOnWorkCallback(OnHit)

    inst:AddComponent("repairable")
    inst.components.repairable.repairmaterial = MATERIALS.GEARS
    inst.components.repairable.onrepaired = OnRepaired

    MakeHauntableWork(inst)

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    return inst
end

local function Junk(style)
    return function()
        return BasePile(style)
    end
end

local function RandomJunkFn()
    local inst = BasePile(math.random(3))
    inst:SetPrefabName("kyno_brokenclockwork"..inst.style)
	return inst
end

local function onruinsrespawn(inst, respawner)
	if not respawner:IsAsleep() then
		inst.AnimState:PlayAnimation("hit"..tostring(inst.style))
		inst.AnimState:PushAnimation("idle"..tostring(inst.style), false)

		local fx = SpawnPrefab("small_puff")
		fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
		fx.Transform:SetScale(1.5, 1.5, 1.5)
	end
end

return Prefab("kyno_brokenclockwork", RandomJunkFn, assets, prefabs),
Prefab("kyno_brokenclockwork1", Junk(1), assets, prefabs),
Prefab("kyno_brokenclockwork2", Junk(2), assets, prefabs),
Prefab("kyno_brokenclockwork3", Junk(3), assets, prefabs),
MakePlacer("kyno_brokenclockwork1_placer", "chessmonster_ruins", "chessmonster_ruins", "idle1"),
MakePlacer("kyno_brokenclockwork2_placer", "chessmonster_ruins", "chessmonster_ruins", "idle2"),
MakePlacer("kyno_brokenclockwork3_placer", "chessmonster_ruins", "chessmonster_ruins", "idle3")