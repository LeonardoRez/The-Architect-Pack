require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_salt_pond.zip"),
	Asset("ANIM", "anim/quagmire_salt_rack.zip"),
    Asset("ANIM", "anim/splash.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_saltpond.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_saltpond.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_saltpond_rack.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_saltpond_rack.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_saltpond.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_saltpond.xml"),
}

local prefabs =
{
	"pondfish",
	"kyno_salt_rack",
	"saltrock",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("idle", true)
    inst.AnimState:PushAnimation("idle", true)
end

local function onbuilt(inst)
    inst.AnimState:PushAnimation("idle", true)
end

local function onfar(inst)
	inst.AnimState:PlayAnimation("picked")
	inst.AnimState:PushAnimation("placer", true)
end

local function onnear(inst)
	inst.AnimState:PlayAnimation("grow")
	inst.AnimState:PushAnimation("idle", true)
end

local function pondfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_saltpond.tex")
	
	MakeObstaclePhysics(inst, 1.95)
	
    inst.AnimState:SetBank("quagmire_salt_pond")
    inst.AnimState:SetBuild("quagmire_salt_pond")
    inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    
	inst:AddTag("watersource")
    inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("birdblocker")
    inst:AddTag("saltpond")

    inst.no_wet_prefix = true
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("fishable")
    inst.components.fishable.maxfish = TUNING.OASISLAKE_MAX_FISH
    inst.components.fishable:SetRespawnTime(TUNING.OASISLAKE_FISH_RESPAWN_TIME)
    inst.components.fishable:AddFish("pondfish")
	
	inst:AddComponent("savedrotation")
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

local function saltpondfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_saltpond.tex")
	
	MakeObstaclePhysics(inst, 1.95)
	
    inst.AnimState:SetBank("quagmire_salt_pond")
    inst.AnimState:SetBuild("quagmire_salt_pond")
    inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
    
	inst:AddTag("watersource")
    inst:AddTag("antlion_sinkhole_blocker")
    inst:AddTag("birdblocker")
    inst:AddTag("saltpond")

    inst.no_wet_prefix = true
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	local function createRack(inst)
	inst.saltrackprefab = SpawnPrefab("kyno_salt_rack")
	inst.saltrackprefab.entity:SetParent(inst.entity)
	end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("savedrotation")
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:DoTaskInTime(FRAMES * 1, createRack)
	
	MakeHauntableWork(inst)
	
    return inst
end

local function rackfn()
    local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
    
    inst.AnimState:SetBank("quagmire_salt_rack")
    inst.AnimState:SetBuild("quagmire_salt_rack")
    inst.AnimState:PlayAnimation("idle", true)
	
    inst.persists = false
	
	inst:AddTag("NOCLICK")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(5, 6)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)
	
    return inst
end

local function rackplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("quagmire_salt_rack")
	-- inst.AnimState:AddOverrideBank("quagmire_salt_rack")
	inst.AnimState:PlayAnimation("idle")
end

return Prefab("kyno_saltpond", pondfn, assets, prefabs),
Prefab("kyno_saltpond_rack", saltpondfn, assets, prefabs),
Prefab("kyno_salt_rack", rackfn, assets, prefabs),
MakePlacer("kyno_saltpond_placer", "quagmire_salt_pond", "quagmire_salt_pond", "idle", true, nil, nil, nil, 90, nil),
MakePlacer("kyno_saltpond_rack_placer", "quagmire_salt_pond", "quagmire_salt_pond", "idle", true, nil, nil, nil, 90, nil, rackplacetestfn)