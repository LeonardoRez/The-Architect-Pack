require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/monkey_barrel.zip"),
    Asset("ANIM", "anim/kyno_monkey_barrel.zip"),
    
	Asset("IMAGE", "images/inventoryimages/kyno_splumonkeypod.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_splumonkeypod.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_monkeybarrel.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_monkeybarrel.xml"),
	
	Asset("SOUND", "sound/monkey.fsb"),
}

local prefabs =
{
    "monkey",
    "poop",
    "cave_banana",
    "collapse_small",
}

local function shake(inst)
    inst.AnimState:PlayAnimation(math.random() > .5 and "move1" or "move2")
    inst.AnimState:PushAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/creatures/monkey/barrel_rattle")
end

local function shakebarrel(inst)
	inst.AnimState:PlayAnimation("shake")
	inst.AnimState:PushAnimation("idle", false)
    inst.SoundEmitter:PlaySound("dontstarve/creatures/monkey/barrel_rattle")
end

local function enqueueShake(inst)
    if inst.shake ~= nil then
        inst.shake:Cancel()
    end
    inst.shake = inst:DoPeriodicTask(GetRandomWithVariance(10, 3), shake)
end

local function enqueueShakeBarrel(inst)
    if inst.shake ~= nil then
        inst.shake:Cancel()
    end
    inst.shake = inst:DoPeriodicTask(GetRandomWithVariance(10, 3), shakebarrel)
end

local function onhammered(inst)
    if inst.shake ~= nil then
        inst.shake:Cancel()
        inst.shake = nil
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren(worker)
    end
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", false)

    enqueueShake(inst)
end

local function onhit_barrel(inst, worker)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren(worker)
    end
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", false)

    enqueueShakeBarrel(inst)
end

local function pushsafetospawn(inst)
    inst.task = nil
    inst:PushEvent("safetospawn")
end

local function ReturnChildren(inst)
    for k, child in pairs(inst.components.childspawner.childrenoutside) do
        if child.components.homeseeker ~= nil then
            child.components.homeseeker:GoHome()
        end
        child:PushEvent("gohome")
    end

    if inst.task == nil then
        inst.task = inst:DoTaskInTime(math.random(60, 120), pushsafetospawn)
    end
end

local function OnIgniteFn(inst)
    inst.AnimState:PlayAnimation("shake", true)

    if inst.shake ~= nil then
        inst.shake:Cancel()
        inst.shake = nil
    end

    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren()
    end
end

local function ongohome(inst, child)
    if child.components.inventory ~= nil then
        child.components.inventory:DropEverything(false, true)
    end
end

local function onsafetospawn(inst)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:StartSpawning()
    end
end

local function OnHaunt(inst)
    if inst.components.childspawner == nil or
        not inst.components.childspawner:CanSpawn() or
        math.random() > TUNING.HAUNT_CHANCE_HALF then
        return false
    end

    local target =
        FindEntity(inst,
            25,
            nil,
            { "_combat" },
            { "playerghost", "INLIMBO" },
            { "character", "monster" }
        )

    if target ~= nil then
        onhit(inst, target)
        return true
    end

    return false
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("monkeybarrel.png")

    MakeObstaclePhysics(inst, 1)

    inst.AnimState:SetBank("barrel")
    inst.AnimState:SetBuild("monkey_barrel")
    inst.AnimState:PlayAnimation("idle", true)

    inst:AddTag("cavedweller")
	inst:AddTag("structure")
	
	inst:SetPrefabNameOverride("monkeybarrel")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent( "childspawner" )
    inst.components.childspawner:SetRegenPeriod(120)
    inst.components.childspawner:SetSpawnPeriod(30)
    inst.components.childspawner:SetMaxChildren(math.random(3, 4))
    inst.components.childspawner:StartRegen()
    inst.components.childspawner.childname = "monkey"
    inst.components.childspawner:StartSpawning()
    inst.components.childspawner.ongohome = ongohome
    inst.components.childspawner:SetSpawnedFn(shake)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    local function ondanger()
        if inst.components.childspawner ~= nil then
            inst.components.childspawner:StopSpawning()
            ReturnChildren(inst) 
        end
    end

    inst:ListenForEvent("warnquake", ondanger, TheWorld)
    inst:ListenForEvent("monkeydanger", ondanger)
    inst:ListenForEvent("safetospawn", onsafetospawn)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
	MakeLargeBurnable(inst)
    enqueueShake(inst)

    return inst
end

local function barrelfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("monkeybarrel.png")

    MakeObstaclePhysics(inst, 1)

    inst.AnimState:SetBank("kyno_monkey_barrel")
    inst.AnimState:SetBuild("kyno_monkey_barrel")
    inst.AnimState:PlayAnimation("idle", false)

    inst:AddTag("cavedweller")
	inst:AddTag("structure")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent( "childspawner" )
    inst.components.childspawner:SetRegenPeriod(120)
    inst.components.childspawner:SetSpawnPeriod(30)
    inst.components.childspawner:SetMaxChildren(math.random(3, 4))
    inst.components.childspawner:StartRegen()
    inst.components.childspawner.childname = "monkey"
    inst.components.childspawner:StartSpawning()
    inst.components.childspawner.ongohome = ongohome
    inst.components.childspawner:SetSpawnedFn(shakebarrel)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit_barrel)

    local function ondanger()
        if inst.components.childspawner ~= nil then
            inst.components.childspawner:StopSpawning()
            ReturnChildren(inst) 
        end
    end

    inst:ListenForEvent("warnquake", ondanger, TheWorld)
    inst:ListenForEvent("monkeydanger", ondanger)
    inst:ListenForEvent("safetospawn", onsafetospawn)
	
	MakeLargeBurnable(inst)
    enqueueShakeBarrel(inst)

    return inst
end

return Prefab("kyno_monkeybarrel", fn, assets, prefabs),
Prefab("kyno_barrel", barrelfn, assets, prefabs),
MakePlacer("kyno_monkeybarrel_placer", "barrel", "monkey_barrel", "idle"),
MakePlacer("kyno_barrel_placer", "kyno_monkey_barrel", "kyno_monkey_barrel", "idle")