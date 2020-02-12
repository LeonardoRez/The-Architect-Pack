local assets =
{
    Asset("ANIM", "anim/merm_sw_house.zip"),
	Asset("ANIM", "anim/merm_fisherman_house.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mermhut.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mermhut.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fishermermhut.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fishermermhut.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
    "merm",
    "collapse_big",

    --loot:
    "boards",
    "rocks",
    "pondfish",
}

local loot =
{
    "boards",
    "rocks",
    "pondfish",
}

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst:RemoveComponent("childspawner")
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        if inst.components.childspawner ~= nil then
            inst.components.childspawner:ReleaseAllChildren(worker)
        end
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("idle")
    end
end

local function StartSpawning(inst)
    if not inst:HasTag("burnt") and
        not TheWorld.state.iswinter and
        inst.components.childspawner ~= nil then
        inst.components.childspawner:StartSpawning()
    end
end

local function StopSpawning(inst)
    if not inst:HasTag("burnt") and inst.components.childspawner ~= nil then
        inst.components.childspawner:StopSpawning()
    end
end

local function OnSpawned(inst, child)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")
        if TheWorld.state.isday and
            inst.components.childspawner ~= nil and
            inst.components.childspawner:CountChildrenOutside() >= 1 and
            child.components.combat.target == nil then
            StopSpawning(inst)
        end
    end
end

local function OnGoHome(inst, child)
    if not inst:HasTag("burnt") then
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")
        if inst.components.childspawner ~= nil and
            inst.components.childspawner:CountChildrenOutside() < 1 then
            StartSpawning(inst)
        end
    end
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt then
        inst.components.burnable.onburnt(inst)
    end
end

local function onignite(inst)
    if inst.components.childspawner ~= nil then
        inst.components.childspawner:ReleaseAllChildren()
    end
end

local function onburntup(inst)
    inst.AnimState:PlayAnimation("burnt")
end

local function OnIsDay(inst, isday)
    if isday then
        StopSpawning(inst)
    elseif not inst:HasTag("burnt") then
        if not TheWorld.state.iswinter then
            inst.components.childspawner:ReleaseAllChildren()
        end
        StartSpawning(inst)
    end
end

local function OnHaunt(inst)
    if inst.components.childspawner == nil or
        not inst.components.childspawner:CanSpawn() or
        math.random() > TUNING.HAUNT_CHANCE_HALF then
        return false
    end

    local target = FindEntity(inst, 25, nil, { "character" }, { "merm", "playerghost", "INLIMBO" })
    if target == nil then
        return false
    end

    onhit(inst, target)
    return true
end

local function onbuilt(inst)
    inst.SoundEmitter:PlaySound("dontstarve/characters/wurt/merm/hut/place")
    inst.AnimState:PlayAnimation("idle")
end

local function MermhutFn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("mermhouse_tropical.png")
	
	MakeObstaclePhysics(inst, 1)

	inst.AnimState:SetBank("merm_sw_house")
    inst.AnimState:SetBuild("merm_sw_house")
    inst.AnimState:PlayAnimation("idle")  

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

    inst:AddTag("structure")
    inst:AddTag("mermhouse")
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(2)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:AddComponent("childspawner")
	inst.components.childspawner.childname = "merm"
	inst.components.childspawner:SetSpawnedFn(OnSpawned)
	inst.components.childspawner:SetGoHomeFn(OnGoHome)
	inst.components.childspawner:SetRegenPeriod(TUNING.TOTAL_DAY_TIME * 4)
    inst.components.childspawner:SetSpawnPeriod(10)
    inst.components.childspawner:SetMaxChildren(TUNING.MERMHOUSE_MERMS)
    inst.components.childspawner:SetMaxEmergencyChildren(TUNING.MERMHOUSE_EMERGENCY_MERMS)
	inst.components.childspawner.emergencychildname = "merm"
	inst.components.childspawner:SetEmergencyRadius(TUNING.MERMHOUSE_EMERGENCY_RADIUS)

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	inst.components.hauntable:SetOnHauntFn(OnHaunt)

	MakeSnowCovered(inst, .01)
	
	inst:WatchWorldState("isday", OnIsDay)
	StartSpawning(inst)

	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	inst:ListenForEvent("onignite", onignite)
	inst:ListenForEvent("burntup", onburntup)

	inst.OnSave = onsave
	inst.OnLoad = onload

	inst:ListenForEvent("onbuilt", onbuilt)
	
	return inst
end

local function FishermermhutFn()
	local inst = CreateEntity()

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("mermhouse_tropical.png")
	
	MakeObstaclePhysics(inst, 1)

	inst.AnimState:SetBank("merm_fisherman_house")
    inst.AnimState:SetBuild("merm_fisherman_house")
    inst.AnimState:PlayAnimation("idle")  

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

    inst:AddTag("structure")
    inst:AddTag("mermhouse")
	
	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(2)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	inst:AddComponent("childspawner")
	inst.components.childspawner.childname = "merm"
	inst.components.childspawner:SetSpawnedFn(OnSpawned)
	inst.components.childspawner:SetGoHomeFn(OnGoHome)
	inst.components.childspawner:SetRegenPeriod(TUNING.TOTAL_DAY_TIME * 4)
    inst.components.childspawner:SetSpawnPeriod(10)
    inst.components.childspawner:SetMaxChildren(TUNING.MERMHOUSE_MERMS)
    inst.components.childspawner:SetMaxEmergencyChildren(TUNING.MERMHOUSE_EMERGENCY_MERMS)
	inst.components.childspawner.emergencychildname = "merm"
	inst.components.childspawner:SetEmergencyRadius(TUNING.MERMHOUSE_EMERGENCY_RADIUS)

	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)
	inst.components.hauntable:SetOnHauntFn(OnHaunt)

	MakeSnowCovered(inst, .01)
	
	inst:WatchWorldState("isday", OnIsDay)
	StartSpawning(inst)

	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	inst:ListenForEvent("onignite", onignite)
	inst:ListenForEvent("burntup", onburntup)

	inst.OnSave = onsave
	inst.OnLoad = onload

	inst:ListenForEvent("onbuilt", onbuilt)
	
	return inst
end

return Prefab("kyno_mermhut", MermhutFn, assets, prefabs),
Prefab("kyno_fishermermhut", FishermermhutFn, assets, prefabs),
MakePlacer("kyno_mermhut_placer", "merm_sw_house", "merm_sw_house", "idle"),
MakePlacer("kyno_fishermermhut_placer", "merm_fisherman_house", "merm_fisherman_house", "idle")