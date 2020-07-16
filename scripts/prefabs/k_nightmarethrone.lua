require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/maxwell_throne.zip"),
	Asset("ANIM", "anim/maxwell_endgame.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_nightmarethrone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_nightmarethrone.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_maxwellthrone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_maxwellthrone.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_nightmarethrone.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_nightmarethrone.xml"),
}

local prefabs = 
{
	"kyno_endgame_maxwell",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst.SoundEmitter:PlaySound("dontstarve/common/throne/thronemagic", "deathrattle")
	inst:Remove()
end

local function onhammered2(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst.SoundEmitter:PlaySound("dontstarve/common/throne/thronedisappear")
	inst:Remove()
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("appear")
	inst.AnimState:PushAnimation("idle")
	inst.SoundEmitter:PlaySound("dontstarve/common/throne/thronemagic", "deathrattle")
	inst:DoTaskInTime(3, function() inst.SoundEmitter:KillSound("deathrattle") end)
end

local function death(inst)
	inst.AnimState:PlayAnimation("death")
	inst.SoundEmitter:PlaySound("dontstarve/maxwell/breakchains")    
    inst:DoTaskInTime(113 * (1/30), function() inst.SoundEmitter:PlaySound("dontstarve/maxwell/blowsaway") end)
    inst:DoTaskInTime(95 * (1/30), function() inst.SoundEmitter:PlaySound("dontstarve/maxwell/throne_scream") end)    
    inst:DoTaskInTime(213 * (1/30), function() inst.SoundEmitter:KillSound("deathrattle") end)
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize(3, 2)    
	
    MakeObstaclePhysics(inst, .5)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("kyno_nightmarethrone.tex")
	
    inst.AnimState:SetBank("throne")
    inst.AnimState:SetBuild("maxwell_throne")
    inst.AnimState:PlayAnimation("idle")
    
	inst:AddTag("structure")
	inst:AddTag("nightmarethrone")
	
	inst:SetPrefabNameOverride("maxwellthrone")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
    return inst
end

local function fn2()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize(3, 2)    
	
    MakeObstaclePhysics(inst, .5)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("kyno_nightmarethrone.tex")
	
    inst.AnimState:SetBank("throne")
    inst.AnimState:SetBuild("maxwell_throne")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:SetFinalOffset(2)
    
	inst:AddTag("structure")
	inst:AddTag("nightmarethrone")
	
	inst:SetPrefabNameOverride("maxwellthrone")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	local function createExtras(inst)
	inst.towerprefab =  SpawnPrefab("kyno_endgame_maxwell")
	inst.towerprefab.entity:SetParent(inst.entity)
	end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered2)
	inst.components.workable:SetOnWorkCallback(function(inst, worker)
	if worker.components.combat then
	if worker.components.inventory == nil or not worker.components.inventory:IsInsulated() then
	worker.components.combat:GetAttacked(inst, TUNING.MOOSE_EGG_DAMAGE, nil, "electric")
	end
	end
	end)
	
	inst:DoTaskInTime(2, createExtras)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
    return inst
end

local function maxwellfn(Sim)
    local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	MakeObstaclePhysics(inst, 2)
    
    inst.AnimState:SetBank("maxwellthrone")
    inst.AnimState:SetBuild("maxwell_endgame")
    inst.AnimState:PlayAnimation("idle_loop", true)
	inst.AnimState:SetFinalOffset(3)
	
	inst:AddTag("locked_maxwell")
	
	inst:SetPrefabNameOverride("waxwell")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	
	--[[
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(5, 10)
    inst.components.playerprox:SetOnPlayerNear(onnear)
	inst.components.playerprox:SetOnPlayerFar(onfar)
	]]--
	
	inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("onhammered", death)

    return inst
end

local function maxwellplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("maxwell_endgame")
end

return Prefab("kyno_nightmarethrone", fn, assets, prefabs),
Prefab("kyno_maxwellthrone", fn2, assets, prefabs),
Prefab("kyno_endgame_maxwell", maxwellfn, assets, prefabs),
MakePlacer("kyno_nightmarethrone_placer", "throne", "maxwell_throne", "idle"),
MakePlacer("kyno_maxwellthrone_placer", "throne", "maxwell_throne", "idle", false, nil, nil, nil, nil, nil, maxwellplacetestfn)