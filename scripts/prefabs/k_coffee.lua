local assets =
{
	Asset("ANIM", "anim/coffee.zip"),
    Asset("ANIM", "anim/spices.zip"),
    Asset("ANIM", "anim/plate_food.zip"),
	
    Asset("INV_IMAGE", "spice_chili_over"),
    Asset("INV_IMAGE", "spice_garlic_over"),
    Asset("INV_IMAGE", "spice_sugar_over"),
	Asset("INV_IMAGE", "spice_salt_over"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_coffee.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_coffee.xml")
}

local prefabs = 
{
	"buff_attack",
    "buff_playerabsorption",
    "buff_workeffectiveness",
	"spoiled_food",
	"kyno_coffeebuff",
}

local spiced_buffs = {SPICE_CHILI = "buff_attack", SPICE_GARLIC = "buff_playerabsorption", SPICE_SUGAR = "buff_workeffectiveness"}
local function OnEatCoffee(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.coffeebuff_duration = 480
        eater.components.debuffable:AddDebuff("kyno_coffeebuff", "kyno_coffeebuff")
        local spiced_buff = spiced_buffs[inst.components.edible.spice]
        if spiced_buff then
            eater.components.debuffable:AddDebuff(spiced_buff, spiced_buff)
        end
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "kyno_coffeebuff", 1.83)
        eater:DoTaskInTime(480, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "kyno_coffeebuff")
        end)
    end
end

local function fn(spicename)
    return function()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
        MakeInventoryFloatable(inst)

        if spicename then
            inst.AnimState:SetBank("plate_food")
            inst.AnimState:SetBuild("plate_food")
            inst.AnimState:OverrideSymbol("swap_garnish", "spices", spicename)

            inst:AddTag("spicedfood")

            inst.nameoverride = "coffee"
            inst.inv_image_bg = {
                image = "coffee.tex",
                atlas = resolvefilepath("images/inventoryimages/kyno_coffee.xml")
            }
            local spiced_foodname = subfmt(STRINGS.NAMES[spicename:upper().."_FOOD"], {food = STRINGS.NAMES.COFFEE})
            inst.displaynamefn = function(inst)
                return spiced_foodname
            end
        else
            inst.AnimState:SetBank("coffee")
            inst.AnimState:SetBuild("coffee")
        end
        inst.AnimState:PlayAnimation("idle")
        inst.AnimState:OverrideSymbol("swap_food", "coffee", "coffee")

        inst:AddTag("preparedfood")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("edible")
        inst.components.edible.healthvalue = TUNING.HEALING_SMALL
        inst.components.edible.hungervalue = TUNING.CALORIES_TINY
        inst.components.edible.sanityvalue = -TUNING.SANITY_TINY
        inst.components.edible.foodtype = FOODTYPE.GOODIES
        inst.components.edible:SetOnEatenFn(OnEatCoffee)

        inst:AddComponent("perishable")
        inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
        inst.components.perishable:StartPerishing()
        inst.components.perishable.onperishreplacement = "spoiled_food"

        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        inst:AddComponent("inspectable")
        inst:AddComponent("inventoryitem")

        inst:AddComponent("bait")
        inst:AddComponent("tradable")

        if spicename then
            inst.components.edible.spice = spicename:upper()
            if spicename == "spice_chili" then
                inst.components.edible.temperature = TUNING.HOT_FOOD_BONUS_TEMP
                inst.components.edible.temperatureduration = TUNING.FOOD_TEMP_LONG
                inst.components.edible.nochill = true
            end
            inst.components.inventoryitem:ChangeImageName(spicename.."_over")
        else
            inst.components.inventoryitem.atlasname = resolvefilepath("images/inventoryimages/kyno_coffee.xml")
        end

        MakeSmallBurnable(inst)
        MakeSmallPropagator(inst)
        MakeHauntableLaunch(inst)

        return inst
    end
end

return Prefab("coffee", fn(false), assets, prefabs),
Prefab("coffee_spice_chili", fn("spice_chili"), assets, prefabs),
Prefab("coffee_spice_garlic", fn("spice_garlic"), assets, prefabs),
Prefab("coffee_spice_sugar", fn("spice_sugar"), assets, prefabs),
Prefab("coffee_spice_salt", fn("spice_salt"), assets, prefabs)