require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/crates.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_crate.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_crate.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function setanim(inst, anim)
	inst.anim = anim
	inst.AnimState:PlayAnimation("idle" .. anim)
end

local function onsave(inst, data)
	data.anim = inst.anim
end

local function onload(inst, data)
	if data and data.anim then
		setanim(inst, data.anim)
	end
end


local function onhammered(inst)
	if inst:HasTag("fire") and inst.components.burnable then
		inst.components.burnable:Extinguish()
	end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("crate.png")
	
	inst.AnimState:SetBank("crates")
	inst.AnimState:SetBuild("crates")
	-- inst.AnimState:PlayAnimation("idle", true)
	setanim(inst, math.random(1, 10))
	
	MakeObstaclePhysics(inst, 0.1)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(1)

	MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
	
	inst.OnSave = onsave
	inst.OnLoad = onload

	return inst
end

return Prefab("kyno_crate", fn, assets, prefabs),
MakePlacer("kyno_crate_placer", "crate", "crate", "idle6")  
