require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/thunderbird_nest.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_thundernest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_thundernest.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("orenest")
	inst.AnimState:PushAnimation("orenest", false)
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("orenest")
	inst.AnimState:PushAnimation("orenest", false)
end	

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("thunderbirdnest.png")
	
	inst.AnimState:SetBank("thunderbird_nest")
	inst.AnimState:SetBuild("thunderbird_nest")
	inst.AnimState:PlayAnimation("orenest", false)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("thundernest")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(2)
   
	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_thundernest", fn, assets, prefabs),
MakePlacer("kyno_thundernest_placer", "thunderbird_nest", "thunderbird_nest", "orenest")