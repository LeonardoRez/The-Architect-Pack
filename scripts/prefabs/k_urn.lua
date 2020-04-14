require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_cemetery.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_urn.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_urn.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_urn.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_urn.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("urn")
    inst.AnimState:PushAnimation("urn")
end

local function onbuilt(inst)
    inst.AnimState:PushAnimation("urn")
end

local function fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_urn.tex")
	
    MakeObstaclePhysics(inst, .2)
	
    inst.AnimState:SetBank("quagmire_cemetery")
    inst.AnimState:SetBuild("quagmire_cemetery")
    inst.AnimState:PlayAnimation("urn")
    
	inst:AddTag("structure")
	inst:AddTag("cemetery_urn")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

return Prefab("kyno_urn", fn, assets),
MakePlacer("kyno_urn_placer", "quagmire_cemetery", "quagmire_cemetery", "urn")