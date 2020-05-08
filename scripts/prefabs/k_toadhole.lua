require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/toadstool_actions.zip"),
    Asset("ANIM", "anim/toadstool_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_toadhole.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_toadhole.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("shovel")
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("toadstool_hole.png")
	
	MakeObstaclePhysics(inst, .5)
	inst.Transform:SetSixFaced()
	
	inst.AnimState:SetBank("toadstool")
	inst.AnimState:SetBuild("toadstool_build")
	inst.AnimState:PlayAnimation("picked", true)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	
	inst:AddTag("structure")
	inst:AddTag("froghole")
	
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

	return inst
end

return Prefab("kyno_toadhole", fn, assets, prefabs),
MakePlacer("kyno_toadhole_placer", "toadstool", "toadstool_build", "picked")