require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/gold_puddle.zip"),
	-- Asset("ANIM", "anim/water_ring_fx.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sparklingpool.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sparklingpool.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("ice")
	inst.components.lootdropper:SpawnLootPrefab("ice")
	inst.components.lootdropper:SpawnLootPrefab("ice")
	inst.components.lootdropper:SpawnLootPrefab("goldnugget")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("appear")
	inst.AnimState:PushAnimation("big_idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("gold_puddle")
	inst.AnimState:SetBuild("gold_puddle")
	inst.AnimState:PlayAnimation("big_idle")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(2)
	
	inst:AddTag("structure")
	inst:AddTag("buriedtreasure")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)
	
	inst:AddComponent("savedrotation")

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_sparkpool", fn, assets, prefabs),
MakePlacer("kyno_sparkpool_placer", "gold_puddle", "gold_puddle", "big_idle", true, nil, nil, nil, 90, nil)