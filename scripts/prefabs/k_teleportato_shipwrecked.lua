require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/teleportato_shipwrecked.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_potatosw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_potatosw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("idle_off")
    inst.AnimState:PushAnimation("idle_off")
end

local function DoLaugh(inst)
if inst:HasTag("teleporter_hamlet") then
	inst:DoTaskInTime(8+math.random()*5, function() DoLaugh(inst) end)
		inst.AnimState:PlayAnimation("laugh")
		inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_maxwelllaugh", "teleportato_laugh")
		inst.AnimState:PushAnimation("active_idle")
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("activate")
	inst.AnimState:PushAnimation("active_idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	MakeObstaclePhysics(inst, 1.1)

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("teleportato_sw_base.png")
	minimap:SetPriority(5)
	
	inst.AnimState:SetBank("teleporter")
	inst.AnimState:SetBuild("teleportato_shipwrecked")
	inst.AnimState:PlayAnimation("active_idle", true)
	
	inst:AddTag("structure")
	inst:AddTag("teleporter_hamlet")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.SoundEmitter:PlaySound("dontstarve/common/teleportato/teleportato_activeidle_LP", "teleportato_active_idle")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

	inst:ListenForEvent("onbuilt", onbuilt)
	
	DoLaugh(inst)

	return inst
end

return Prefab("kyno_teleporter_sw", fn, assets, prefabs),
MakePlacer("kyno_teleporter_sw_placer", "teleporter", "teleportato_shipwrecked", "active_idle")