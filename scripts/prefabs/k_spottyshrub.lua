require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_spiceshrub.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_spottyshrub.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_spottyshrub.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst.components.lootdropper:SpawnLootPrefab("dug_berrybush")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("grow")
	inst.AnimState:PushAnimation("idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("quagmire_spotspice_shrub.png")
	
	MakeObstaclePhysics(inst, .3)
	
	inst.AnimState:SetBank("quagmire_spiceshrub")
	inst.AnimState:SetBuild("quagmire_spiceshrub")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("spottyshrub")
	
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

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_spottyshrub", fn, assets, prefabs),
MakePlacer("kyno_spottyshrub_placer", "quagmire_spiceshrub", "quagmire_spiceshrub", "idle")