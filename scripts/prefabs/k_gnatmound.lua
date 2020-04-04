require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/gnat_mound.zip"),
	Asset("ANIM", "anim/gnat.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gnatmound.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gnatmound.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs =
{
	"kyno_gnat",
}

local function onwork(inst, worker, workleft)
	if workleft < TUNING.ROCKS_MINE*(1/3) then
		inst.AnimState:PlayAnimation("low", true)
	elseif workleft < TUNING.ROCKS_MINE*(2/3) then
		inst.AnimState:PlayAnimation("med", true)
	else
		inst.AnimState:PlayAnimation("full", true)
	end
end

local function onfinish(inst, worker)
	local pt = Point(inst.Transform:GetWorldPosition())
	inst.components.lootdropper:DropLoot(pt)
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("full")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gnat_mound.png")
	
	inst.AnimState:SetBank("gnat_mound")
	inst.AnimState:SetBuild("gnat_mound")
	inst.AnimState:PlayAnimation("full", true)
	
	MakeObstaclePhysics(inst, .5)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("boulder")
	inst:AddTag("gnat_mound")
	
	local function createGnat(inst)
	inst.gnatprefab =  SpawnPrefab("kyno_gnat")
	inst.gnatprefab.entity:SetParent(inst.entity)
	end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.ROCKS_MINE)
	inst.components.workable:SetOnWorkCallback(onwork)
	inst.components.workable:SetOnFinishCallback(onfinish)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst:DoTaskInTime(FRAMES * 1, createGnat)

	return inst
end

local function gnatfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	inst.DynamicShadow:SetSize(2, .6)
	inst.Transform:SetFourFaced()
	
	inst.AnimState:SetBank("gnat")
	inst.AnimState:SetBuild("gnat")
	inst.AnimState:PlayAnimation("idle_loop", true)
	inst.persists = false
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("gnat")
	inst:AddTag("flying")
	inst:AddTag("insect")
	inst:AddTag("animal")	
	inst:AddTag("smallcreature")
	inst:AddTag("notarget")
	inst:AddTag("NOCLICK")

	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	return inst
end

return Prefab("kyno_gnatmound", fn, assets, prefabs),
Prefab("kyno_gnat", gnatfn, assets, prefabs),
MakePlacer("kyno_gnatmound_placer", "gnat_mound", "gnat_mound", "full")