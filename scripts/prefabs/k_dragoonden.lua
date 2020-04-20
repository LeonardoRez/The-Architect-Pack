require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/dragoon_den.zip"),
	Asset("ANIM", "anim/dragoon_build.zip"),
	Asset("ANIM", "anim/dragoon_actions.zip"),
	Asset("ANIM", "anim/dragoon_basic.zip"),
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
}

local prefabs =
{
	"kyno_dragoon",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle")
end

local function Spit(inst)
if inst:HasTag("dragoon") then
	inst:DoTaskInTime(4+math.random()*5, function() Spit(inst) end)
		inst.AnimState:PlayAnimation("spit")
		inst:DoTaskInTime(1.2, function() inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/dragoon/spit") 
		SpawnPrefab("fishingnetvisualizerfx").Transform:SetPosition(inst.Transform:GetWorldPosition()) end)
		inst.AnimState:PushAnimation("anim", true)
	end
end

local dragoon_front = 1

local dragoon_defs = {
	dragoon = { { -1.28, 0, 2.14 } },
}

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("dragoon_den.png")
	
	inst.AnimState:SetBank("dragoon_den")
	inst.AnimState:SetBuild("dragoon_den")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1.5)
	
	inst:AddTag("structure")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	local decor_items = dragoon_defs
		inst.decor = {}
		for item_name, data in pairs(decor_items) do
			for l, offset in pairs(data) do
				local item_inst = SpawnPrefab("kyno_dragoon")
				item_inst.AnimState:PushAnimation("anim", true)
				item_inst.entity:SetParent(inst.entity)
				item_inst.Transform:SetPosition(offset[1], offset[2], offset[3])
				table.insert(inst.decor, item_inst)
			end
		end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)

	inst:AddComponent("savedrotation")
	
	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function dragoonfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddDynamicShadow()
	inst.entity:AddNetwork()
	
	inst.DynamicShadow:SetSize(3, 1.25)
	inst.Transform:SetFourFaced()
	
	MakeObstaclePhysics(inst, .5)
	
	inst.SoundEmitter:PlaySound("dontstarve_DLC002/creatures/dragoon/idle")
	
	inst.AnimState:SetBank("dragoon")
	inst.AnimState:SetBuild("dragoon_build")
	inst.AnimState:PlayAnimation("anim", true)
	inst.persists = false
		
	inst:AddTag("dragoon")
	inst:AddTag("animal")	
	inst:AddTag("smallcreature")	
		
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("lootdropper")
	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	Spit(inst)

	return inst
end

return Prefab("kyno_dragoonden", fn, assets, prefabs),
Prefab("kyno_dragoon", dragoonfn, assets, prefabs),
MakePlacer("kyno_dragoonden_placer", "dragoon_den", "dragoon_den", "idle", false, nil, nil, nil, 90, nil)  
