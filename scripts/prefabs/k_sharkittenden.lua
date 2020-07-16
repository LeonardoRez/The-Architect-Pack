require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sharkitten_den.zip"),
	Asset("ANIM", "anim/sharkitten_basic.zip"),
	Asset("ANIM", "anim/sharkitten_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sharkittenden.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sharkittenden.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
}

local prefabs = 
{
	"kyno_sharkittenden_low",
	"kyno_sharkitten",
	"kyno_sharkitten2",
}

local anims = {"idle_active", "idle_inactive"}

local function dig_up_active(inst, worker, workleft)
	SpawnPrefab("sand_puff_large_front").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("sand_puff_large_back").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:Remove()
	SpawnPrefab("kyno_sharkittenden_low").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function dig_up_inactive(inst, worker, workleft)
	SpawnPrefab("sand_puff_large_front").Transform:SetPosition(inst.Transform:GetWorldPosition())
	SpawnPrefab("sand_puff_large_back").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.components.lootdropper:SpawnLootPrefab("spoiled_fish")
	inst.components.lootdropper:SpawnLootPrefab("spoiled_fish_small")
	inst.components.lootdropper:SpawnLootPrefab("turf_beach")
	inst.components.lootdropper:SpawnLootPrefab("turf_beach")
	inst:Remove()
end

local shark_front = 1
local shark_front_2 = 1

local shark_defs = {
	shark = { { -2.28, 0, 2.14 } },
}

local shark_defs_2 = {
	shark2 = { { 2.28, 0, -2.14 } },
}

local function Sleep(inst)
if inst:HasTag("shark") then
	inst:DoTaskInTime(4+math.random()*5, function() Sleep(inst) end)
		inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/tiger_kitten/idle", "idle")
	end
end

local function activefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("sharkitten_den.png")
	
	inst.AnimState:SetBank("sharkittenden")
	inst.AnimState:SetBuild("sharkitten_den")
	inst.AnimState:PlayAnimation("idle_active")
	
	MakeObstaclePhysics(inst, 2)
	
	inst:AddTag("structure")
	inst:AddTag("sharkhome")
	inst:AddTag("scarytoprey")
	
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
	inst.components.workable:SetOnFinishCallback(dig_up_active)
	inst.components.workable:SetWorkLeft(5)
	
	inst:AddComponent("savedrotation")
	
	return inst
end

local function sharkfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	inst.DynamicShadow:SetSize(2.5, 1.5)
	inst.Transform:SetFourFaced()
	
	inst.AnimState:SetScale(.75, .75, .75)
	
	MakeObstaclePhysics(inst, .5)
	
	inst.AnimState:SetBank("sharkitten")
	inst.AnimState:SetBuild("sharkitten_build")
	inst.AnimState:PlayAnimation("idle", true)
	inst.persists = false
		
	inst:AddTag("shark")
	inst:AddTag("animal")	
	inst:AddTag("epic")	
		
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	Sleep(inst)

	return inst
end

local function inactivefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("sharkitten_den.png")
	
	inst.AnimState:SetBank("sharkittenden")
	inst.AnimState:SetBuild("sharkitten_den")
	inst.AnimState:PlayAnimation("idle_inactive")
	
	MakeObstaclePhysics(inst, 2)
	
	inst:AddTag("structure")
	inst:AddTag("sharkhome")
	inst:AddTag("scarytoprey")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up_inactive)
	inst.components.workable:SetWorkLeft(2)
	
	return inst
end

return Prefab("kyno_sharkittenden", activefn, assets, prefabs),
Prefab("kyno_sharkittenden_low", inactivefn, assets, prefabs),
Prefab("kyno_sharkitten", sharkfn, assets, prefabs),
Prefab("kyno_sharkitten2", sharkfn, assets, prefabs),
MakePlacer("kyno_sharkittenden_placer", "sharkittenden", "sharkitten_den", "idle_active", false, nil, nil, nil, 90, nil)