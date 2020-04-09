require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/x_marks_spot.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_buriedtreasure.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_buriedtreasure.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("boneshard")
	inst.components.lootdropper:SpawnLootPrefab("boneshard")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("anim")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("xspot.png")
	
	inst.AnimState:SetBank("x_marks_spot")
	inst.AnimState:SetBuild("x_marks_spot")
	inst.AnimState:PlayAnimation("anim")
	
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

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_buriedtreasure", fn, assets, prefabs),
MakePlacer("kyno_buriedtreasure_placer", "x_marks_spot", "x_marks_spot", "anim")