local assets =
{
    Asset("ANIM", "anim/kyno_glass_pitchfork.zip"),
    Asset("ANIM", "anim/kyno_swap_glass_pitchfork.zip"),
    Asset("ANIM", "anim/floating_items.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_glass_pitchfork.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_glass_pitchfork.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_glass_pitchfork.xml", 256),
}

local prefabs =
{
    "sinkhole_spawn_fx_1",
    "sinkhole_spawn_fx_2",
    "sinkhole_spawn_fx_3",
}

local function onequip(inst, owner)
    owner.AnimState:OverrideSymbol("swap_object", "kyno_swap_glass_pitchfork", "swap_pitchfork")
    owner.AnimState:Show("ARM_carry")
    owner.AnimState:Hide("ARM_normal")
end

local function onunequip(inst, owner)
    owner.AnimState:Hide("ARM_carry")
    owner.AnimState:Show("ARM_normal")
end

local function normal()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("kyno_glass_pitchfork")
    inst.AnimState:SetBuild("kyno_glass_pitchfork")
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("sharp")
    inst:AddTag("weapon")

    MakeInventoryFloatable(inst, "med", 0.05, {0.78, 0.4, 0.78}, true, 7, {sym_build = "kyno_swap_glass_pitchfork"})

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end


    inst:AddComponent("weapon")
    inst.components.weapon:SetDamage(TUNING.PITCHFORK_DAMAGE)
    inst:AddInherentAction(ACTIONS.TERRAFORM)

    inst:AddComponent("inspectable")
	inst:AddComponent("terraformer")
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasimage = "images/inventoryimages/kyno_glass_pitchfork.xml"
	inst.components.inventoryitem.imagename = "kyno_glass_pitchfork"

    inst:AddComponent("equippable")
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    MakeHauntableLaunch(inst)

    return inst
end


return Prefab("kyno_glass_pitchfork", normal, assets, prefabs)