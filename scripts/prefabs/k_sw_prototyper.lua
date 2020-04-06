require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/portal_shipwrecked.zip"),
	Asset("ANIM", "anim/portal_shipwrecked_build.zip"),
    
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
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

local function onbuilt(inst)
    inst.AnimState:PushAnimation("idle_off")
end

local function Boatfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
    MakeObstaclePhysics(inst, 1)
	
	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("shipwrecked_exit.png")
	minimap:SetPriority(5)
	
    inst.AnimState:SetBank("boatportal")
    inst.AnimState:SetBuild("portal_shipwrecked_build")
    inst.AnimState:PlayAnimation("idle_off")
    
	inst:AddTag("structure")
	inst:AddTag("seaworthy")
	
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
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)

    return inst
end

return Prefab("kyno_sw_prototyper", Boatfn, assets),
MakePlacer("kyno_sw_prototyper_placer", "boatportal", "portal_shipwrecked_build", "idle_off")