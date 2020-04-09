require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/volcano_shrub.zip"),

	Asset("IMAGE", "images/inventoryimages/kyno_volcano_shrub.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_volcano_shrub.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
	"ash"
}

local function chopfn(inst)
	RemovePhysicsColliders(inst)
	inst.SoundEmitter:PlaySound("dontstarve/forest/treeCrumble")
	inst.SoundEmitter:PlaySound("dontstarve/wilson/use_axe_tree")
	
	inst.AnimState:PlayAnimation("break")
	local task_time = inst.AnimState:PushAnimation("break")
	if task_time ~= nil then
		inst:DoTaskInTime(task_time, function() inst.components.growable:SetStage(1) end)
	end
	
	local pt = Point(inst.Transform:GetWorldPosition())
	
	inst.components.lootdropper:SpawnLootPrefab("ash")
	inst.components.lootdropper:DropLoot(pt)
	
	inst:DoPeriodicTask(0.5, function()
	inst:Remove()
	end)
end

local function SetEmpty(inst)
	inst.components.growable:StartGrowing(TUNING.TOTAL_DAY_TIME)
	inst.Physics:SetCollides(false)
	inst:AddTag("NOCLICK")
	inst:Hide()
	inst.MiniMapEntity:SetEnabled(false)
end

local function SetFull(inst)
	inst.components.workable:SetWorkLeft(1)
	inst.components.growable:StopGrowing()
	inst.AnimState:PlayAnimation("idle", true)
	inst.Physics:SetCollides(true)
	inst:RemoveTag("NOCLICK")
	inst:Show()
	inst.MiniMapEntity:SetEnabled(true)
end

local grow_stages =
{
	{name="empty", fn=SetEmpty},
	{name="full", fn=SetFull},
}

local function fn(Sim)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("volcano_shrub.png")

	inst.AnimState:SetBank("volcano_shrub")
	inst.AnimState:SetBuild("volcano_shrub")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("burnt")
	inst:AddTag("tree")

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.CHOP)
	inst.components.workable:SetWorkLeft(1)
	inst.components.workable:SetOnFinishCallback(chopfn)

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")

	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("growable")
	inst.components.growable.stages = grow_stages
	inst.components.growable:SetStage(2)
	inst.components.growable.loopstages = false
	inst.components.growable.growonly = false
	inst.components.growable.springgrowth = false
	inst.components.growable.growoffscreen = true

	return inst
end

return Prefab("kyno_volcano_shrub", fn, assets, prefabs),
MakePlacer("kyno_volcano_shrub_placer", "volcano_shrub", "volcano_shrub", "idle")
