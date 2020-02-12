require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/volcano_altar.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_volcano_altar.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_volcano_altar.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local towerassets =
{
	Asset("ANIM", "anim/volcano_altar_fx.zip"),
}

local toweroff = 0
local altaroff = 2

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("idle_open")
	inst.AnimState:PushAnimation("idle_open")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("idle_open")
	inst.AnimState:PushAnimation("idle_open")
end

local function onbuilt2(inst)
	inst.AnimState:PlayAnimation("idle_open")
	inst.AnimState:PushAnimation("idle_open")
end

local function baseFn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetPriority(5)
	minimap:SetIcon("volcano_altar.png")
    inst.Transform:SetScale(1,1,1)
	
	inst.AnimState:SetBank("volcano_altar_fx")
	inst.AnimState:SetBuild("volcano_altar_fx")
	inst.AnimState:PlayAnimation("idle_open", true)
	
	inst.AnimState:SetFinalOffset(altaroff)
	
	MakeObstaclePhysics(inst, 2.0, 1.2)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	local function createExtras(inst)
    -- local x, y, z = inst.Transform:GetWorldPosition()
	inst.towerprefab =  SpawnPrefab("kyno_volcano_tower")
	-- inst.towerprefab.Transform:SetPosition( x, y, z )
	inst.towerprefab.entity:SetParent(inst.entity) -- ADAI GOD!
	end
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	inst:AddTag("altar")
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(5)

	inst:DoTaskInTime(FRAMES * 1, createExtras)
	
	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function towerFn(Sim)
    local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
    
    inst.Transform:SetScale(1,1,1)
    
    inst.AnimState:SetBank("volcano_altar")
    inst.AnimState:SetBuild("volcano_altar")
    inst.AnimState:PlayAnimation("idle_open", true)
	
	inst.AnimState:SetFinalOffset(toweroff)
    inst.persists = false
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
    
	inst:AddTag("NOCLICK")
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
    
	inst:ListenForEvent("onbuilt", onbuilt2)
	inst:ListenForEvent("onhammered", onhammered)

    return inst
end

return Prefab("kyno_volcano_altar", baseFn, assets, prefabs),
MakePlacer("kyno_volcano_altar_placer", "volcano_altar", "volcano_altar", "idle_close"),
Prefab("kyno_volcano_tower", towerFn, towerassets, prefabs)