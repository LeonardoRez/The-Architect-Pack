require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/grass_inwater.zip"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("dug_grass")
	inst:Remove()
end

local function onpickedfn(inst)
    inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/item_wet_harvest")
    inst.AnimState:PlayAnimation("picking")
    inst.AnimState:PushAnimation("picked", true)
end

local function onregenfn(inst)
    inst.AnimState:PlayAnimation("grow")
    inst.AnimState:PushAnimation("idle", true)
end

local function makeemptyfn(inst)
    inst.AnimState:PlayAnimation("picked", true)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("grass.png")
	
	inst.AnimState:SetBank("grass_inwater")
	inst.AnimState:SetBuild("grass_inwater")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:SetPhysicsRadiusOverride(1)
    MakeWaterObstaclePhysics(inst, 0.80, 2, 1.25)
	
	inst:AddTag("structure")
	inst:AddTag("plant")
	inst:AddTag("aquatic")
	inst:AddTag("wet")
	inst:AddTag("ignorewalkableplatforms")
	
	inst:SetPrefabNameOverride("grass")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)

	inst.AnimState:SetTime(math.random() * 2)

    local color = 0.75 + math.random() * 0.25
    inst.AnimState:SetMultColour(color, color, color, 1)

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve_DLC002/common/item_wet_harvest"
    inst.components.pickable:SetUp("cutgrass", TUNING.GRASS_REGROW_TIME)
    inst.components.pickable.onregenfn = onregenfn
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.makeemptyfn = makeemptyfn
	
    MakeNoGrowInWinter(inst)

	return inst
end

return Prefab("kyno_sea_grass", fn, assets, prefabs),
MakePlacer("kyno_sea_grass_placer", "grass_inwater", "grass_inwater", "idle")