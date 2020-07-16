require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_mushroomstump.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mushstump.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mushstump.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("red_cap")
	inst.components.lootdropper:SpawnLootPrefab("red_cap")
	inst.components.lootdropper:SpawnLootPrefab("green_cap")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("pick")
	inst.AnimState:PushAnimation("idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetScale(.8, .8, .8)
	
	MakeObstaclePhysics(inst, .5)
	
	inst.AnimState:SetBank("quagmire_mushroomstump")
	inst.AnimState:SetBuild("quagmire_mushroomstump")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("mushroom_stump")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "QUAGMIRE_MUSHROOMSTUMP"
	
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

return Prefab("kyno_mushroomstump", fn, assets, prefabs),
MakePlacer("kyno_mushroomstump_placer", "quagmire_mushroomstump", "quagmire_mushroomstump", "idle")