local assets =
{
    Asset("ANIM", "anim/gravestones.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mound.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mound.xml"),
}

local prefabs = {
	"kyno_mound_dug",
}

local function dig_up_mound(inst, chopper)
	inst:Remove()
	inst.components.lootdropper:SpawnLootPrefab("boneshard")
	inst.components.lootdropper:SpawnLootPrefab("boneshard")
	SpawnPrefab("kyno_mound_dug").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function dig_up(inst, chopper)
	inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("gravedirt")

    inst:AddTag("grave")
	inst:AddTag("structure")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up_mound)
    inst.components.workable:SetWorkLeft(1)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)

    return inst
end

local function dugfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("gravestone")
    inst.AnimState:SetBuild("gravestones")
    inst.AnimState:PlayAnimation("dug")

    inst:AddTag("grave")
	inst:AddTag("structure")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
    inst.components.workable:SetWorkLeft(1)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_SMALL)

    return inst
end

return Prefab("kyno_mound", fn, assets, prefabs),
Prefab("kyno_mound_dug", dugfn, assets, prefabs),
MakePlacer("kyno_mound_placer", "gravestone", "gravestones", "gravedirt")