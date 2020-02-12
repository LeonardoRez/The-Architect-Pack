require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/doydoy_nest.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function onhammered(inst)
	if inst:HasTag("fire") and inst.components.burnable then
		inst.components.burnable:Extinguish()
	end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit_nest")
	inst.AnimState:PushAnimation("idle_nest")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("idle_nest")
	inst.AnimState:PushAnimation("idle_nest")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("doydoynest.png")
	
	inst.AnimState:SetBank("doydoy_nest")
	inst.AnimState:SetBuild("doydoy_nest")
	inst.AnimState:PlayAnimation("idle_nest", true)
	
	MakeObstaclePhysics(inst, 0.25)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("doydoy")
	inst:AddTag("doydoynest")
	inst:AddTag("structure")
	inst:AddTag("fullnest")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)
	
	MakeMediumBurnable(inst)
	MakeSmallPropagator(inst)

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

return Prefab("kyno_doydoy_nest", fn, assets, prefabs),
MakePlacer("kyno_doydoy_nest_placer", "doydoy_nest", "doydoy_nest", "idle_nest")