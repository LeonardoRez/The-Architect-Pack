require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/smelter.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function onfar(inst)
	inst.AnimState:PlayAnimation("smelting_pre")
	inst.AnimState:PushAnimation("smelting_loop", true)
end

local function onnear(inst)
	inst.AnimState:PlayAnimation("smelting_pst")
	inst.AnimState:PushAnimation("idle_full", true)
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit_full")
    inst.AnimState:PushAnimation("idle_full", true)
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_full", true)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("smelter.png")

    inst.AnimState:SetBank("smelter")
    inst.AnimState:SetBuild("smelter")
    inst.AnimState:PlayAnimation("idle_full")
	
	MakeObstaclePhysics(inst, .5)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("structure")
	inst:AddTag("furnace")
	inst:AddTag("smelter")

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(3, 6)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
    return inst
end

return Prefab("kyno_smelter", fn, assets, prefabs),
MakePlacer("kyno_smelter_placer", "smelter", "smelter", "idle_full")