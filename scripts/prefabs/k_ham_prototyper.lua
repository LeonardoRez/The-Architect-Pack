require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/portal_hamlet.zip"),
	Asset("ANIM", "anim/portal_hamlet_build.zip"),
    
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("idle_off")
    inst.AnimState:PushAnimation("idle_off")
end

local function onbuilt(inst)
    inst.AnimState:PushAnimation("idle_off")
end

local function Porkfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 1)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("portal_ham.png")
	minimap:SetPriority(5)
	
    inst.AnimState:SetBank("hamportal")
    inst.AnimState:SetBuild("portal_hamlet_build")
    inst.AnimState:PlayAnimation("idle_off")
    
	inst:AddTag("structure")
	inst:AddTag("skyworthy")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	local SHARD = GetModConfigData("SHARD", KnownModIndex:GetModActualName("The Architect Pack"))
	if SHARD == 1 then
	inst:AddComponent("worldmigrator")
	end
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

return Prefab("kyno_ham_prototyper", Porkfn, assets),
MakePlacer("kyno_ham_prototyper_placer", "hamportal", "portal_hamlet_build", "idle_off")