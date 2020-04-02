require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_ruins_pot.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_smashingpot.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_smashingpot.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs = 
{
	"kyno_smashedpot",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot_bigger")
	inst:Remove()
	SpawnPrefab("kyno_smashedpot").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function onhammered_smashed(inst, worker)
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_pot_bigger")
	inst:Remove()
end 

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle")
end

local function onhit_smashed(inst, worker)
	inst.AnimState:PlayAnimation("broken")
	inst.AnimState:PushAnimation("broken")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_pot.png")
	
	inst.AnimState:SetBank("pig_ruins_pot")
	inst.AnimState:SetBuild("pig_ruins_pot")
	inst.AnimState:PlayAnimation("idle")
	
	inst.entity:AddPhysics() 
	MakeObstaclePhysics(inst, .25)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("pot")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(2)
	inst.components.workable.savestate = true

	inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function smashedfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_pot.png")
	
	inst.AnimState:SetBank("pig_ruins_pot")
	inst.AnimState:SetBuild("pig_ruins_pot")
	inst.AnimState:PlayAnimation("broken")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("smashedpot")
	
	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered_smashed)
	inst.components.workable:SetOnWorkCallback(onhit_smashed)
	inst.components.workable:SetWorkLeft(1)
	
	return inst
end

return Prefab("kyno_smashingpot", fn, assets, prefabs),
Prefab("kyno_smashedpot", smashedfn, assets, prefabs),
MakePlacer("kyno_smashingpot_placer", "pig_ruins_pot", "pig_ruins_pot", "idle")