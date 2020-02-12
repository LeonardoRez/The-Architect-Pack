require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sharkitten_den.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sharkittenden.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sharkittenden.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("turf_desertdirt")
	inst.components.lootdropper:SpawnLootPrefab("turf_desertdirt")
	inst.components.lootdropper:SpawnLootPrefab("spoiled_fish")
	inst.components.lootdropper:SpawnLootPrefab("spoiled_fish_small")
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("sharkitten_den.png")
	
	inst.AnimState:SetBank("sharkittenden")
	inst.AnimState:SetBuild("sharkitten_den")
	inst.AnimState:PlayAnimation("idle_active")
	
	MakeObstaclePhysics(inst, 2)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	inst:AddTag("sharkhome")
	inst:AddTag("scarytoprey")
	
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(5)
	
	return inst
end

return Prefab("kyno_sharkittenden", fn, assets, prefabs),
MakePlacer("kyno_sharkittenden_placer", "sharkittenden", "sharkitten_den", "idle_active")