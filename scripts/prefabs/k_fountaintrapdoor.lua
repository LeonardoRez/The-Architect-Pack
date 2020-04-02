require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/python_trap_door.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_trapdoor.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_trapdoor.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local STATES = {
   CLOSED = 1,
   OPENING = 2,
   OPEN = 3,
   CLOSNG = 4,
}

local function setart(inst)
    if inst.state == STATES.CLOSED then
        inst.AnimState:PlayAnimation("closed",true)
    elseif inst.state == STATES.OPENING then
        inst.AnimState:PlayAnimation("opening")
    elseif inst.state == STATES.OPEN then
        inst.AnimState:PlayAnimation("open",true)
    elseif inst.state == STATES.CLOSNG then
        inst.AnimState:PlayAnimation("closing")
    end
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("opening")
	inst.AnimState:PushAnimation("closed")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("python_trap_door")
	inst.AnimState:SetBuild("python_trap_door")
	inst.AnimState:PlayAnimation("closed", true)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("pugalisk_trap_door")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(2)

	return inst
end

return Prefab("kyno_trapdoor", fn, assets, prefabs),
MakePlacer("kyno_trapdoor_placer", "python_trap_door", "python_trap_door", "closed")