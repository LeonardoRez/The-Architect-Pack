require "tuning"

local assets = {
    Asset("ANIM", "anim/kyno_coffeebeans.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_coffee.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_coffee.xml"),
}

local prefabs = {
    "kyno_coffeebeans_cooked",
    "kyno_coffeebuff",
    "spoiled_food",
}

local function OnEatBeans(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.speedbuff_duration = 30
        eater.components.debuffable:AddDebuff("kyno_coffeebuff", "kyno_coffeebuff")
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "kyno_coffeebuff", 1.83)
        eater:DoTaskInTime(30, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "kyno_coffeebuff")
        end)
    end
end

local function fn(cooked)
    return function()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
        MakeInventoryFloatable(inst)

        inst.Transform:SetScale(.9, .9, .9)
		
        inst.AnimState:SetBank("coffeebeans")
        inst.AnimState:SetBuild("coffeebeans")

        if cooked then
            inst.AnimState:PlayAnimation("cooked")
        else
            inst.AnimState:PlayAnimation("idle")
            inst:AddTag("cookable")
        end

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = 0
        inst.components.edible.hungervalue = TUNING.CALORIES_TINY
        inst.components.edible.foodtype = FOODTYPE.VEGGIE

        inst:AddComponent("perishable")
        inst.components.perishable.onperishreplacement = "spoiled_food"

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem.atlasname = resolvefilepath("images/inventoryimages/kyno_coffee.xml")

        inst:AddComponent("bait")
        inst:AddComponent("tradable")

        if cooked then
            inst.components.edible.sanityvalue = -TUNING.SANITY_TINY
            inst.components.edible:SetOnEatenFn(OnEatBeans)
            inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
        else
            inst.components.edible.sanityvalue = 0
            inst.components.perishable:SetPerishTime(TUNING.PERISH_FAST)
            inst:AddComponent("cookable")
            inst.components.cookable.product = "kyno_coffeebeans_cooked"
        end
        inst.components.perishable:StartPerishing()

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
        MakeHauntableLaunch(inst)

        return inst
    end
end

return Prefab("kyno_coffeebeans", fn(false), assets, prefabs),
Prefab("kyno_coffeebeans_cooked", fn(true), assets, prefabs)	