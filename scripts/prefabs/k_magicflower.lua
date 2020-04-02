require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/lifeplant.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magicflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magicflower.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("nightmarefuel")
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("petals")
	inst.components.lootdropper:SpawnLootPrefab("petals")
	inst.components.lootdropper:SpawnLootPrefab("petals")
	inst.components.lootdropper:SpawnLootPrefab("petals")
	inst.components.lootdropper:SpawnLootPrefab("petals")
	inst:Remove()
end

local function onnear(inst) 
	inst.AnimState:PlayAnimation("idle_gargle")
	inst.AnimState:PushAnimation("idle_loop", true)
end

local function onfar(inst)
	inst.AnimState:PlayAnimation("idle_loop")
	inst.AnimState:PushAnimation("death",  false)
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("idle_loop")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("lifeplant.png")
	
	inst.AnimState:SetBank("lifeplant")
	inst.AnimState:SetBuild("lifeplant")
	inst.AnimState:PlayAnimation("idle_loop", true)
	
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
	inst.components.workable:SetWorkLeft(1)
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(3, 6)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_magicflower", fn, assets, prefabs),
MakePlacer("kyno_magicflower_placer", "lifeplant", "lifeplant", "idle_loop")