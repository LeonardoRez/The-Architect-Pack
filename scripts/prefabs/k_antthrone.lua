require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/throne.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antthrone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antthrone.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
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
	minimap:SetIcon("ruins_artichoke.png")
	
	inst.Transform:SetScale(0.7, 0.7, 0.7)
	
	inst.AnimState:SetBank("throne")
	inst.AnimState:SetBuild("throne")
	inst.AnimState:PlayAnimation("full", true)
	
	MakeObstaclePhysics(inst, 6)
	
	inst:AddTag("structure")
	inst:AddTag("boulder")
	inst:AddTag("antthrone")
	inst:AddTag("birdblocker")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
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

	return inst
end

local function throneplacetestfn(inst)
	inst.Transform:SetScale(0.7, 0.7, 0.7)
end

return Prefab("kyno_antthrone", fn, assets, prefabs),
MakePlacer("kyno_antthrone_placer", "throne", "throne", "full", false, nil, nil, nil, nil, nil, throneplacetestfn)