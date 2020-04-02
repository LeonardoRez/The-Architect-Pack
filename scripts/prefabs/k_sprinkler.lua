require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/sprinkler.zip"),
	Asset("ANIM", "anim/sprinkler_placement.zip"),
	Asset("ANIM", "anim/sprinkler_meter.zip"),
	
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

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit_off")
    inst.AnimState:PushAnimation("idle_off")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_off")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("sprinkler.png")

    inst.AnimState:SetBank("sprinkler")
    inst.AnimState:SetBuild("sprinkler")
    inst.AnimState:PlayAnimation("idle_off")
	inst.AnimState:OverrideSymbol("swap_meter", "sprinkler_meter", "10")
	inst.AnimState:Hide("SNOW")
	
	MakeObstaclePhysics(inst, 1)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("structure")
	inst:AddTag("firesupressor")
	inst:AddTag("sprinkler")

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
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

local function sprinklerplacetestfn(inst)
	inst.AnimState:OverrideSymbol("swap_meter", "sprinkler_meter", "10")
end

return Prefab("kyno_sprinkler", fn, assets, prefabs),
MakePlacer("kyno_sprinkler_placer", "sprinkler", "sprinkler", "idle_off", false, nil, nil, nil, nil, nil, sprinklerplacetestfn)