require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/dungball_build.zip"),   
	
	Asset("IMAGE", "images/inventoryimages/kyno_dungball.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dungball.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function dig_up(inst, chopper)
	inst:PushAnimation("break")
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("twigs")
	inst.components.lootdropper:SpawnLootPrefab("twigs")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddDynamicShadow()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.Transform:SetFourFaced()
    inst.DynamicShadow:SetSize(1.7, .8)
	
	inst.AnimState:SetBank("tumbleweed")
	inst.AnimState:SetBuild("dungball_build")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("dungball")
	inst:AddTag("structure")

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

return Prefab("kyno_dungball", fn, assets, prefabs),
MakePlacer("kyno_dungball_placer", "tumbleweed", "dungball_build", "idle")