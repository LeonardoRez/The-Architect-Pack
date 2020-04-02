require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/interior_wall_decals_batcave.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_batpit.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_batpit.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("batwing")
	inst.components.lootdropper:SpawnLootPrefab("rocks")
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("pit")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetScale(0.60,0.60,0.60)
	
	inst.AnimState:SetBank("interior_wall_decals_cave")
	inst.AnimState:SetBuild("interior_wall_decals_batcave")
	inst.AnimState:PlayAnimation("pit", true)
	
	MakeObstaclePhysics(inst, 2)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("boulder")
	inst:AddTag("bathole")

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(2)
	
	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_batpit", fn, assets, prefabs),
MakePlacer("kyno_batpit_placer", "interior_wall_decals_cave", "interior_wall_decals_batcave", "pit")