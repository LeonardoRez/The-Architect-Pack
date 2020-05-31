require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/seaweed.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("kelp")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("grow")
	inst.AnimState:PushAnimation("idle_plant", true)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("seaweed.png")
	
	inst.AnimState:SetBank("seaweed")
	inst.AnimState:SetBuild("seaweed")
	inst.AnimState:PlayAnimation("idle_plant", true)
	
	inst:SetPhysicsRadiusOverride(1)
    MakeWaterObstaclePhysics(inst, 0.80, 2, 1.25)
	
	inst:AddTag("structure")
	inst:AddTag("seaweed")
	inst:AddTag("aquatic")
	inst:AddTag("wet")
	inst:AddTag("ignorewalkableplatforms")
	
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

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_seaweed", fn, assets, prefabs),
MakePlacer("kyno_seaweed_placer", "seaweed", "seaweed", "idle_plant")