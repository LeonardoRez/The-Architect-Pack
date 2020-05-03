require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/portal_stone.zip"),
	Asset("ANIM", "anim/portal_stone_construction.zip"),
	Asset("ANIM", "anim/portal_moonrock.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_floridpostern.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_floridpostern.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_portalbuilding.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_portalbuilding.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_celestialportal.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_celestialportal.xml"),
}

local STONE_SOUNDS =
{
    idle_loop = "dontstarve/common/together/spawn_vines/spawnportal_idle_LP",
    idle = "dontstarve/common/together/spawn_vines/spawnportal_idle",
    scratch = "dontstarve/common/together/spawn_vines/spawnportal_scratch",
    jacob = "dontstarve/common/together/spawn_vines/spawnportal_jacob",
    blink = "dontstarve/common/together/spawn_vines/spawnportal_blink",
    vines = "dontstarve/common/together/spawn_vines/vines",
    spawning_loop = "dontstarve/common/together/spawn_vines/spawnportal_spawning",
    armswing = "dontstarve/common/together/spawn_vines/spawnportal_armswing",
    shake = "dontstarve/common/together/spawn_vines/spawnportal_shake",
    open = "dontstarve/common/together/spawn_vines/spawnportal_open",
}

local MOONROCK_SOUNDS =
{
    idle = "dontstarve/common/together/spawn_vines/spawnportal_idle",
    jacob = "dontstarve/common/together/spawn_vines/spawnportal_jacob",
    spawning_loop = "dontstarve/common/together/spawn_vines/spawnportal_spawning",
    shake = "dontstarve/common/together/spawn_vines/spawnportal_shake",
    open = "dontstarve/common/together/spawn_vines/spawnportal_open",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("idle_loop")
    inst.AnimState:PushAnimation("idle_loop", true)
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("pre_fx")
	inst.AnimState:PlayAnimation("fx")
    inst.AnimState:PlayAnimation("pst_fx")
	inst.AnimState:PushAnimation("idle_loop", true)
	-- inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_vines/spawnportal_spawning")
end

local function onbuilt_moon(inst)
	inst.AnimState:PlayAnimation("fx")
	inst.AnimState:PushAnimation("idle_loop", true)
	-- inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_portal_celestial/reveal")
end
	
local function Scratch(inst)
if inst:HasTag("portal_dst") then
	inst:DoTaskInTime(10+math.random()*5, function() Scratch(inst) end)
		inst.AnimState:PlayAnimation("idle_eyescratch")
		-- inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_vines/spawnportal_scratch")
		inst.AnimState:PushAnimation("idle_loop", true)
	end
end

local function charliefn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("portal_dst.png")
	
    inst.AnimState:SetBank("portal_dst")
    inst.AnimState:SetBuild("portal_stone")
    inst.AnimState:PlayAnimation("idle_loop", true)
    
	inst:AddTag("structure")
	inst:AddTag("portal_dst")
	inst:AddTag("resurrector")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_vines/spawnportal_idle_LP")
	
	-- inst:SetStateGraph("SGmultiplayerportal")
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
	
	MakeHauntableWork(inst)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	Scratch(inst)
	
    return inst
end

local function buildfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("portal_dst.png")
	
    inst.AnimState:SetBank("portal_construction_dst")
    inst.AnimState:SetBuild("portal_stone_construction")
	inst.AnimState:AddOverrideBuild("portal_stone")
    inst.AnimState:PlayAnimation("idle_loop", true)
    -- inst.AnimState:OverrideSymbol("portal01", "portal01", "portal01")
	inst.AnimState:Hide("stage2")
	inst.AnimState:Hide("stage3")
	inst.AnimState:Hide("moonrock_vines_0")
	inst.AnimState:Hide("moonrock_vines_1")
	inst.AnimState:Hide("moonrock_vines_2")
	inst.AnimState:Hide("moonrock_vines_3")
	inst.AnimState:Hide("moonrock_vines_4")
	inst.AnimState:Hide("moonrock_vines_5")
	inst.AnimState:Hide("moonrock_vines_6")
	inst.AnimState:Hide("moonrock_vines_7")
	inst.AnimState:Hide("eye")
	inst.AnimState:Show("portal01")
    
	inst:AddTag("structure")
	inst:AddTag("portal_building")
	inst:AddTag("resurrector")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_vines/spawnportal_idle_LP")
	
	-- inst:SetStateGraph("SGmultiplayerportal")
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
	
	MakeHauntableWork(inst)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	Scratch(inst)
	
    return inst
end

local function celestialfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("portal_dst.png")
	
    inst.AnimState:SetBank("portal_moonrock_dst")
    inst.AnimState:SetBuild("portal_moonrock")
    inst.AnimState:PlayAnimation("idle_loop", true)
    
	inst:AddTag("structure")
	inst:AddTag("portal_dst")
	inst:AddTag("resurrector")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.SoundEmitter:PlaySound("dontstarve/common/together/spawn_vines/spawnportal_idle")
	
	-- inst:SetStateGraph("SGmultiplayerportal")
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_INSTANT_REZ)
	
	MakeHauntableWork(inst)
	
	inst:ListenForEvent("onbuilt", onbuilt_moon)
	
	Scratch(inst)
	
    return inst
end

local function buildingplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("portal_stone")
	inst.AnimState:Hide("stage2")
	inst.AnimState:Hide("stage3")
	inst.AnimState:Hide("moonrock_vines_0")
	inst.AnimState:Hide("moonrock_vines_1")
	inst.AnimState:Hide("moonrock_vines_2")
	inst.AnimState:Hide("moonrock_vines_3")
	inst.AnimState:Hide("moonrock_vines_4")
	inst.AnimState:Hide("moonrock_vines_5")
	inst.AnimState:Hide("moonrock_vines_6")
	inst.AnimState:Hide("moonrock_vines_7")
	inst.AnimState:Hide("eye")
	inst.AnimState:Show("portal01")
end

return Prefab("kyno_portalstone", charliefn, assets),
Prefab("kyno_portalbuilding", buildfn, assets),
Prefab("kyno_celestialportal", celestialfn, assets),
MakePlacer("kyno_portalstone_placer", "portal_dst", "portal_stone", "idle_loop"),
MakePlacer("kyno_portalbuilding_placer", "portal_construction_dst", "portal_stone_construction", "idle_loop", false, nil, nil, nil, nil, nil, buildingplacetestfn),
MakePlacer("kyno_celestialportal_placer", "portal_moonrock_dst", "portal_moonrock", "idle_loop")