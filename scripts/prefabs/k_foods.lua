--require "kyno_strings"

local assets =
{
	Asset("ANIM", "anim/coffee.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml")
}

local prefabs = 
{
	"spoiled_food",
	"coffeebuff",
}

local spiced_buffs = {SPICE_CHILI = "buff_attack", SPICE_GARLIC = "buff_playerabsorption", SPICE_SUGAR = "buff_workeffectiveness"}
local function OnEatCoffee(inst, eater)
    if not eater.components.health or eater.components.health:IsDead() or eater:HasTag("playerghost") then
        return
    elseif eater.components.debuffable and eater.components.debuffable:IsEnabled() then
        eater.coffeebuff_duration = 480
        eater.components.debuffable:AddDebuff("coffeebuff", "coffeebuff")
        local spiced_buff = spiced_buffs[inst.components.edible.spice]
        if spiced_buff then
            eater.components.debuffable:AddDebuff(spiced_buff, spiced_buff)
        end
    else
        eater.components.locomotor:SetExternalSpeedMultiplier(eater, "coffeebuff", 1.83)
        eater:DoTaskInTime(480, function()
            eater.components.locomotor:RemoveExternalSpeedMultiplier(eater, "coffeebuff")
        end)
    end
end

local function MakePreparedFood(data)
	local foodname = data.basename or data.name
	local foodassets = assets
	table.insert(foodassets, Asset("ANIM", "anim/"..foodname..".zip"))
	local spicename = data.spice ~= nil and string.lower(data.spice) or nil
	if spicename ~= nil then
		foodassets = shallowcopy(assets)
		table.insert(foodassets, Asset("ANIM", "anim/spices.zip"))
		table.insert(foodassets, Asset("ANIM", "anim/plate_food.zip"))
		table.insert(foodassets, Asset("INV_IMAGE", spicename.."_over"))
	end

	local function DisplayNameFn(inst)
		return subfmt(STRINGS.NAMES[data.spice.."_FOOD"], { food = STRINGS.NAMES[string.upper(data.basename)] })
	end
	
		local function fn()
		local inst = CreateEntity()

		inst.entity:AddTransform()
		inst.entity:AddAnimState()
		inst.entity:AddNetwork()

		MakeInventoryPhysics(inst)

		if spicename ~= nil then
			inst.AnimState:SetBuild("plate_food")
			inst.AnimState:SetBank("plate_food")
			inst.AnimState:OverrideSymbol("swap_garnish", "spices", spicename)

			inst:AddTag("spicedfood")
			inst.inv_image_bg = { atlas = "images/inventoryimages/kyno_inventoryimages_sw.xml", image = foodname..".tex" }
		else
			inst.AnimState:SetBuild(data.name)
			inst.AnimState:SetBank(data.name)
		end
		
		inst.AnimState:PlayAnimation("idle", false)
		inst.AnimState:OverrideSymbol("swap_food", foodname, foodname)

		inst:AddTag("preparedfood")
		
		if data.tags ~= nil then
			for i,v in pairs(data.tags) do
				inst:AddTag(v)
			end
		end

		if data.basename ~= nil then
			inst:SetPrefabNameOverride(data.basename)
			if data.spice ~= nil then
				inst.displaynamefn = DisplayNameFn
			end
		end
	
		if CurrentRelease.GreaterOrEqualTo("R08_ROT_TURNOFTIDES") then
			MakeInventoryFloatable(inst)
		end

		inst.entity:SetPristine()

		if not TheWorld.ismastersim then
			return inst
		end

		inst:AddComponent("edible")
		inst.components.edible.healthvalue = data.health
		inst.components.edible.hungervalue = data.hunger
		inst.components.edible.foodtype = data.foodtype or FOODTYPE.GENERIC
		inst.components.edible.sanityvalue = data.sanity or 0
		inst.components.edible.temperaturedelta = data.temperature or 0
		inst.components.edible.temperatureduration = data.temperatureduration or 0
		inst.components.edible.nochill = data.nochill or nil
		inst.components.edible.spice = data.spice
		inst.components.edible:SetOnEatenFn(OnEatCoffee)

		inst:AddComponent("inspectable")
		inst.wet_prefix = data.wet_prefix

		inst:AddComponent("inventoryitem")

		if spicename ~= nil then
			inst.components.inventoryitem:ChangeImageName(spicename.."_over")
		elseif data.basename ~= nil then
			inst.components.inventoryitem:ChangeImageName(data.basename)
		else
			inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
			inst.components.inventoryitem.imagename = data.name
		end

		inst:AddComponent("stackable")
		inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

		if data.perishtime ~= nil and data.perishtime > 0 then
			inst:AddComponent("perishable")
			inst.components.perishable:SetPerishTime(data.perishtime)
			inst.components.perishable:StartPerishing()
			inst.components.perishable.onperishreplacement = "spoiled_food"
		end

		MakeSmallBurnable(inst)
		MakeSmallPropagator(inst)
		MakeHauntableLaunchAndPerish(inst)

		inst:AddComponent("bait")

		inst:AddComponent("tradable")

		return inst
	end

	return Prefab(data.name, fn, foodassets, prefabs)
end

local prefs = {}

for k, v in pairs(require("kyno_foods")) do
	table.insert(prefs, MakePreparedFood(v))
end

for k, v in pairs(require("kyno_food_spicer")) do
	table.insert(prefs, MakePreparedFood(v))
end

return unpack(prefs)