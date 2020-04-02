require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/ant_hill_entrance.zip"),
    Asset("ANIM", "anim/ant_queen_entrance.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_anthill.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_anthill.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antqueenhill.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antqueenhill.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
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

local function onbuilt_queen(inst)
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("ant_hill_entrance.png")

    inst.AnimState:SetBank("ant_hill_entrance")
    inst.AnimState:SetBuild("ant_hill_entrance")
    inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1.3)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("structure")
	inst:AddTag("ant_entrance")

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	inst:ListenForEvent("onbuilt", onbuilt)
	MakeSnowCovered(inst)

    return inst
end

local function queenfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("ant_queen_entrance.png")

    inst.AnimState:SetBank("entrance")
    inst.AnimState:SetBuild("ant_queen_entrance")
    inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1.3)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddTag("structure")
	inst:AddTag("queen_entrance")

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	inst:ListenForEvent("onbuilt", onbuilt_queen)
	MakeSnowCovered(inst)

    return inst
end

return Prefab("kyno_manthill", fn, assets, prefabs),
MakePlacer("kyno_manthill_placer", "ant_hill_entrance", "ant_hill_entrance", "idle"),
Prefab("kyno_mantqueenhill", queenfn, assets, prefabs),
MakePlacer("kyno_mantqueenhill_placer", "entrance", "ant_queen_entrance", "idle")