require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/cactus_volcano.zip"),
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("houndstooth")
	inst.components.lootdropper:SpawnLootPrefab("houndstooth")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("idle_spike")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("cactus_volcano.png")
	
	inst.AnimState:SetBank("cactus_volcano")
	inst.AnimState:SetBuild("cactus_volcano")
	inst.AnimState:PlayAnimation("idle_spike", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	inst:AddTag("thorny")
	inst:AddTag("elephantcactus")
	inst:AddTag("scarytoprey")
	
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(2)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_elephantcactus", fn, assets, prefabs),
MakePlacer("kyno_elephantcactus_placer", "cactus_volcano", "cactus_volcano", "idle_spike")
