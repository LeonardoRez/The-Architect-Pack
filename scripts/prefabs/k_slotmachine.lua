require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/slot_machine.zip"),
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_slotmachine.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_slotmachine.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle")
end

local function CalcSanityAura(inst, observer)
	return -(TUNING.SANITYAURA_MED*(2))
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("slot_machine.png")
	
	inst.AnimState:SetBank("slot_machine")
	inst.AnimState:SetBuild("slot_machine")
	inst.AnimState:PlayAnimation("idle")
	
	MakeObstaclePhysics(inst, 0.8, 1.2)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = CalcSanityAura
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_slotmachine", fn, assets, prefabs),
MakePlacer("kyno_slotmachine_placer", "slot_machine", "slot_machine", "idle")  