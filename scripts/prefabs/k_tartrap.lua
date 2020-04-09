require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/tar_trap.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_tartrap.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_tartrap.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("charcoal")
	inst.components.lootdropper:SpawnLootPrefab("ash")
	inst.components.lootdropper:SpawnLootPrefab("boneshard")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle_full")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("tar_pit.png")
	
	inst.AnimState:SetBank("tar_trap")
	inst.AnimState:SetBuild("tar_trap")
	inst.AnimState:PlayAnimation("idle_full")
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
	
	inst:AddTag("tar_trap")
	
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

	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeLargeBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeLargePropagator(inst)

	return inst
end

return Prefab("kyno_tartrap", fn, assets, prefabs),
MakePlacer("kyno_tartrap_placer", "tar_trap", "tar_trap", "idle_full")