require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/dragoonegg.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_dragoonegg.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dragoonegg.xml"),
}

local function onwork(inst, worker, workleft)
	if workleft < TUNING.ROCKS_MINE*(1/3) then
		inst.AnimState:PlayAnimation("crack_big_idle")
	elseif workleft < TUNING.ROCKS_MINE*(2/3) then
		inst.AnimState:PlayAnimation("crack_med_idle")
	else
		inst.AnimState:PlayAnimation("crack_small_idle")
	end
end

local function onfinish_obsidian(inst, worker)
	local pt = Point(inst.Transform:GetWorldPosition())
	--SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst.components.lootdropper:DropLoot(pt)
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("meteor")
	inst.AnimState:SetBuild("dragoonegg")
	inst.AnimState:PlayAnimation("egg_idle")
	
	MakeObstaclePhysics(inst, 1.)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("egg")
	inst:AddTag("dragoon")

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.ROCKS_MINE)
	inst.components.workable:SetOnWorkCallback(onwork)
	inst.components.workable:SetOnFinishCallback(onfinish_obsidian)

	return inst
end

return Prefab("kyno_dragoonegg", fn, assets, prefabs),
MakePlacer("kyno_dragoonegg_placer", "meteor", "dragoonegg", "egg_idle")