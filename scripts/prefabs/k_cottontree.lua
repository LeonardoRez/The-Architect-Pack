local assets =
{
    Asset("ANIM", "anim/quagmire_sapbucket.zip"),
    Asset("ANIM", "anim/quagmire_tree_cotton_build.zip"),
    Asset("ANIM", "anim/quagmire_tree_cotton_trunk_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cottontree.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cottontree.xml"),
    -- Asset("MINIMAP_IMAGE", "minimap_saptree.tex"),
    -- Asset("MINIMAP_IMAGE", "quagmire_sugarwoodtree_stump"),
    -- Asset("MINIMAP_IMAGE", "quagmire_sugarwoodtree_tapped"),
}

local prefabs =
{
	-- "log",
    -- "twigs",
    -- -- "quagmire_sap",
    -- -- "quagmire_sap_spoiled",
    -- "sugarwood_leaf_fx",
    -- "sugarwood_leaf_fx_chop",
    -- "sugarwood_leaf_withered_fx",
    -- "sugarwood_leaf_withered_fx_chop",
}

local DEFAULT_TREE_DEF = 2
local TREE_DEFS =
{
    {
        prefab_name = "cottontree_small",
        anim_file = "quagmire_tree_cotton_short",
        loot = {
            "log"
        },
    },
    {
        prefab_name = "cottontree_normal",
        anim_file = "quagmire_tree_cotton_normal",
        loot = {
            "log",
            "log",
			"pinecone",
        },
    },
    {
        prefab_name = "cottontree_tall",
        anim_file = "quagmire_tree_cotton_tall",
        loot = {
            "log",
            "log",
            "log",
			"pinecone",
			"pinecone",
        },
    },
}

local function PushSway(inst, skippre)
    inst.AnimState:PushAnimation(math.random() < .5 and "sway1_loop" or "sway2_loop", true)
end

local function ChangeSizeFn(inst)
    if inst.components.growable ~= nil then
        local anim = TREE_DEFS[inst.components.growable.stage].anim_file
        inst.AnimState:SetBank(anim)
        inst.AnimState:SetBuild("quagmire_tree_cotton_build")
    end
    PushSway(inst)
end

local function SetShort(inst)
    if not inst.monster then
        if inst.components.workable ~= nil then
           inst.components.workable:SetWorkLeft(TUNING.DECIDUOUS_CHOPS_SMALL)
        end
        inst.components.lootdropper:SetLoot(TREE_DEFS[1].loot)
    end
end

local function GrowShort(inst)
	inst.AnimState:SetBank("quagmire_tree_cotton_short")
	inst.AnimState:PlayAnimation("idle")
	inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
	PushSway(inst)
end

local function SetNormal(inst)
    if inst.components.workable ~= nil then
        inst.components.workable:SetWorkLeft(TUNING.DECIDUOUS_CHOPS_NORMAL)
    end
    inst.components.lootdropper:SetLoot(TREE_DEFS[2].loot)
end

local function GrowNormal(inst)
	inst.AnimState:SetBank("quagmire_tree_cotton_normal")
	inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
	PushSway(inst)
end

local function SetTall(inst)
    if inst.components.workable ~= nil then
        inst.components.workable:SetWorkLeft(TUNING.DECIDUOUS_CHOPS_TALL)
    end
    inst.components.lootdropper:SetLoot(TREE_DEFS[3].loot)
end

local function GrowTall(inst)
	inst.AnimState:SetBank("quagmire_tree_cotton_tall")
	inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
	PushSway(inst)
end

local growth_stages =
{
	{name="short", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[1].base, TUNING.EVERGREEN_GROW_TIME[1].random) end, fn = function(inst) SetShort(inst) end,  growfn = function(inst) GrowShort(inst) end , leifscale=.7 },
	{name="normal", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[2].base, TUNING.EVERGREEN_GROW_TIME[2].random) end, fn = function(inst) SetNormal(inst) end, growfn = function(inst) GrowNormal(inst) end, leifscale=1 },
	{name="tall", time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[3].base, TUNING.EVERGREEN_GROW_TIME[3].random) end, fn = function(inst) SetTall(inst) end, growfn = function(inst) GrowTall(inst) end, leifscale=1.25 },
}
--[[
{
    {
        name = "short",
        time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[1].base,
        TUNING.EVERGREEN_GROW_TIME[1].random) end,
        fn = function(inst) SetShort end,
        growfn = function(inst) GrowShort end,
    },
    {
        name = "normal",
        time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[2].base,
        TUNING.EVERGREEN_GROW_TIME[2].random) end,
        fn = SetNormal,
        growfn = GrowNormal
    },
    {
        name = "tall",
        time = function(inst) return GetRandomWithVariance(TUNING.EVERGREEN_GROW_TIME[3].base,
        TUNING.EVERGREEN_GROW_TIME[3].random) end,
        fn = SetTall,
        growfn = GrowTall
    },
}
]]--

for i, v in ipairs(TREE_DEFS) do
    table.insert(assets, Asset("ANIM", "anim/"..v.anim_file..".zip"))
end

local function SetStage(inst, stage)
    stage = stage or DEFAULT_TREE_DEF
    inst.stage = stage
    inst.AnimState:SetBank(TREE_DEFS[stage].anim_file)
    inst.AnimState:SetBuild("quagmire_tree_cotton_build")
    inst.components.lootdropper:SetLoot(TREE_DEFS[stage].loot)
end

local function DigUpStump(inst)
    inst.components.lootdropper:SpawnLootPrefab("log")
    inst:Remove()
end

local function ChopDownTreeShake(inst)
    ShakeAllCameras(
        CAMERASHAKE.FULL,
        .25,
        .03,
        inst.components.growable ~= nil and inst.components.growable.stage > 2 and .5 or .25,
        inst,
        6
    )
end

local function ChopTree(inst, chopper, chops)
    if not (chopper ~= nil and chopper:HasTag("playerghost")) then
        inst.SoundEmitter:PlaySound(
            chopper ~= nil and chopper:HasTag("beaver") and
            "dontstarve/characters/woodie/beaver_chop_tree" or
            "dontstarve/wilson/use_axe_tree"
        )
    end
    inst.AnimState:PlayAnimation("chop")

    PushSway(inst)
end

local function MakeStump(inst)
    inst:RemoveComponent("burnable")
    MakeSmallBurnable(inst)
    inst:RemoveComponent("propagator")
    MakeSmallPropagator(inst)
    inst:RemoveComponent("workable")
    inst:RemoveTag("shelter")
    inst:RemoveTag("cattoyairborne")
    inst:AddTag("stump")
	
    RemovePhysicsColliders(inst)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
    inst.components.workable:SetOnFinishCallback(DigUpStump)
    inst.components.workable:SetWorkLeft(1)

    if inst.components.growable ~= nil then
        inst.components.growable:StopGrowing()
    end
end

local function GetStatus(inst)
    return "NORMAL"
end

local function ChopDownTree(inst, chopper)
    local days_survived = TheWorld.state.cycles

    inst.SoundEmitter:PlaySound("dontstarve/forest/treefall")

    local pt = inst:GetPosition()
    local hispos = chopper:GetPosition()
    local he_right = (hispos - pt):Dot(TheCamera:GetRightVec()) > 0
    if he_right then
        inst.AnimState:PlayAnimation("fallleft")
        if inst.components.growable ~= nil and inst.components.growable.stage == 3 then
            inst.components.lootdropper:SpawnLootPrefab("pinecone", pt - TheCamera:GetRightVec())
        end
        inst.components.lootdropper:DropLoot(pt - TheCamera:GetRightVec())
    else
        inst.AnimState:PlayAnimation("fallright")
        if inst.components.growable ~= nil and inst.components.growable.stage == 3 then
            inst.components.lootdropper:SpawnLootPrefab("pinecone", pt - TheCamera:GetRightVec())
        end
        inst.components.lootdropper:DropLoot(pt + TheCamera:GetRightVec())
    end

    inst:DoTaskInTime(.4, ChopDownTreeShake)

    inst.AnimState:PushAnimation("stump")

    MakeStump(inst)
end

local function OnGrow(inst, stage)
    inst.AnimState:PlayAnimation("sap_leak_pre")
    inst.AnimState:PushAnimation("sap_leak_pst")
    inst.AnimState:PushAnimation("idle")
    -- OnBucketStageChange(inst, stage)
end

--[[
local function OnBucketStageChange(inst, stage)
    local name = "swap_sapbucket_" .. BUCKET_STAGES[stage + 1]
    inst.AnimState:OverrideSymbol("swap_sapbucket", "quagmire_sapbucket", name)
    -- inst.AnimState:OverrideSymbol("swap_sapbucket_0", "quagmire_sapbucket", name)
    -- inst.AnimState:OverrideSymbol("swap_sapbucket_1", "quagmire_sapbucket", name)
end

local function OnHarvest(inst, picker, produce)
    OnBucketStageChange(inst, 0)
end

local function SetHarvestable(inst)
    inst:AddComponent("harvestable")
    inst.components.harvestable:SetUp(
        "sap",
        (#BUCKET_STAGES) - 1,
        100 / (math.min(1, inst.stage)),
        OnHarvest,
        OnGrow
    )
    inst:AddTag("tapped_harvestable")
end

local function SetNonHarvestable(inst)
    inst.components.harvestable:StopGrowing()
    inst:RemoveComponent("harvestable")
    inst:RemoveTag("tapped_harvestable")
end

local function OnInstall(inst)
    inst.AnimState:Show("swap_tapper")
    inst.AnimState:Show("swap_sapbucket")
    OnBucketStageChange(inst, 0)
    SetHarvestable(inst)
end

local function OnUninstall(inst)
    inst.AnimState:Hide("swap_tapper")
    inst.AnimState:Hide("swap_sapbucket")
    SetNonHarvestable(inst)
end
]]--

local function OnLoad(inst, data)
    if not data then
        return
    end
    if data.stage then
        SetStage(inst, data.stage)
    end
	--[[
    if data.tapper then
        local sapbucket = SpawnPrefab("sapbucket")
        inst.components.tappable:InstallTap(nil, sapbucket)
        SetHarvestable(inst)
        inst.components.harvestable:StopGrowing()
        inst.components.harvestable:OnLoad(data.tapper)
        OnBucketStageChange(inst, data.tapper.produce)
    end
	]]--
end

local function OnSave(inst, data)
    if not data then
        return
    end
    if inst.stage then
        data.stage = inst.stage
    end
	--[[
    if inst.components.tappable:IsTapped() then
        data.tapper = inst.components.harvestable:OnSave()
    end
	]]--
end

local function OnGrowFromSeed(inst)
    inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
end

local function fn(tree_def)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.AnimState:SetScale(1, 1, 1)

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("quagmire_sugarwoodtree.png")
    minimap:SetPriority(1)

	MakeObstaclePhysics(inst, .25)
	
    inst.AnimState:SetBank(TREE_DEFS[tree_def or DEFAULT_TREE_DEF].anim_file)
    inst.AnimState:SetBuild("quagmire_tree_cotton_build")
    inst.AnimState:AddOverrideBuild("quagmire_sapbucket")
    inst.AnimState:AddOverrideBuild("quagmire_tree_cotton_trunk_build")
    inst.AnimState:Hide("swap_tapper")
    inst.AnimState:Hide("sap")
    inst.AnimState:PlayAnimation("sway1_loop", true)
	
	inst:AddTag("tree")
    inst:AddTag("shelter")
    inst:AddTag("cottontree")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    MakeLargeBurnable(inst, TUNING.TREE_BURN_TIME)
    inst.components.burnable:SetFXLevel(5)

    inst:AddComponent("inspectable")
    inst.components.inspectable.getstatus = GetStatus

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.CHOP)
    inst.components.workable:SetOnWorkCallback(ChopTree)
    inst.components.workable:SetOnFinishCallback(ChopDownTree)

    inst:AddComponent("lootdropper")

    inst:AddComponent("growable")
    inst.components.growable.stages = growth_stages
    inst.components.growable:SetStage(tree_def == nil and math.random(1, 3) or tree_def)
    inst.components.growable.loopstages = true
    inst.components.growable.springgrowth = true
    inst.components.growable:StartGrowing()
	
    inst.monster = false
    inst.growfromseed = OnGrowFromSeed

    inst.OnSave = OnSave
    inst.OnLoad = OnLoad

    -- event_server_data("quagmire", "prefabs/quagmire_sugarwoodtree").master_postinit(inst, tree_def, TREE_DEFS)

    return inst
end

local function MakeTree(i, name, _assets, _prefabs)
    local function _fn()
        local inst = fn(i)
        if not TheWorld.ismastersim then
            return inst
        end
        SetStage(inst, i)
        inst:SetPrefabName("cottontree")
        return inst
    end

    return Prefab(name, _fn, _assets, _prefabs)
end

local tree_prefabs = {}
for i, v in ipairs(TREE_DEFS) do
    table.insert(tree_prefabs, MakeTree(i, v.prefab_name))
    table.insert(prefabs, v.prefab_name)
end

table.insert(tree_prefabs, MakeTree(nil, "cottontree", assets, prefabs))

return unpack(tree_prefabs)