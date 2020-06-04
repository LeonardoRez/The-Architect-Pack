local assets =
{
    Asset("ANIM", "anim/koi.zip"),
	Asset("ANIM", "anim/koi02.zip"),
	Asset("ANIM", "anim/tropicalfish.zip"),
	Asset("ANIM", "anim/tropicalfish02.zip"),
	Asset("ANIM", "anim/neonfish.zip"),
	Asset("ANIM", "anim/neonfish02.zip"),
	Asset("ANIM", "anim/grouper.zip"),
	Asset("ANIM", "anim/grouper02.zip"),
	Asset("ANIM", "anim/pierrotfish.zip"),
	Asset("ANIM", "anim/pierrotfish02.zip"),
	Asset("ANIM", "anim/salmonfish.zip"),
	Asset("ANIM", "anim/salmonfish02.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
}

local fish_prefabs =
{
	"fishmeat_small",
    "fishmeat_small_cooked",
	"fishmeat",
	"fishmeat_cooked",
	"spoiled_fish_small",
    "spoiled_fish",
}

local function CalcNewSize()
	local p = 2 * math.random() - 1
	return (p*p*p + 1) * 0.5
end

local function flop(inst)
	local num = math.random(2)
	for i = 1, num do
		inst.AnimState:PushAnimation("idle", false)
	end

	inst.flop_task = inst:DoTaskInTime(math.random() * 2 + num * 2, flop)
end

local function ondropped(inst)
    if inst.flop_task ~= nil then
        inst.flop_task:Cancel()
    end
	inst.AnimState:PlayAnimation("idle", false)
    inst.flop_task = inst:DoTaskInTime(math.random() * 3, flop)
end

local function ondroppedasloot(inst, data)
	if data ~= nil and data.dropper ~= nil then
		inst.components.weighable.prefab_override_owner = data.dropper.prefab
	end
end

local function onpickup(inst)
    if inst.flop_task ~= nil then
        inst.flop_task:Cancel()
        inst.flop_task = nil
    end
end

local function commonfn(bank, build, char_anim_build, data)
    local inst = CreateEntity()

	data = data or {}

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("idle", false)

	inst:AddTag("fish")
	inst:AddTag("pondfish")
    inst:AddTag("meat")
    inst:AddTag("catfood")
	inst:AddTag("smallcreature")

	if data.weight_min ~= nil and data.weight_max ~= nil then
		--weighable_fish (from weighable component) added to pristine state for optimization
		inst:AddTag("weighable_fish")
	end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst.build = char_anim_build --This is used within SGwilson, sent from an event in fishingrod.lua

    inst:AddComponent("bait")

    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(data.perish_time)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = data.perish_product

    inst:AddComponent("cookable")
    inst.components.cookable.product = data.cookable_product

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem:SetOnDroppedFn(ondropped)
    inst.components.inventoryitem:SetOnPutInInventoryFn(onpickup)
	inst.components.inventoryitem:SetSinks(true)

	inst:AddComponent("murderable")

	inst:AddComponent("lootdropper")
	inst.components.lootdropper:SetLoot(data.loot)

    inst:AddComponent("edible")
    inst.components.edible.ismeat = true
	inst.components.edible.healthvalue = data.healthvalue
	inst.components.edible.hungervalue = data.hungervalue
	inst.components.edible.sanityvalue = 0
    inst.components.edible.foodtype = FOODTYPE.MEAT

    MakeHauntableLaunchAndPerish(inst)

    inst:AddComponent("tradable")
    inst.components.tradable.goldvalue = data.goldvalue or TUNING.GOLD_VALUES.MEAT
    inst.data = {}--

	if data.weight_min ~= nil and data.weight_max ~= nil then
		inst:AddComponent("weighable")
		inst.components.weighable.type = TROPHYSCALE_TYPES.FISH
		inst.components.weighable:Initialize(data.weight_min, data.weight_max)
		inst.components.weighable:SetWeight(Lerp(data.weight_min, data.weight_max, CalcNewSize()))
	end

	inst:ListenForEvent("on_loot_dropped", ondroppedasloot)

	inst.flop_task = inst:DoTaskInTime(math.random() * 2 + 1, flop)

    return inst
end

-- Large Fishes.
local koi_data =
{
    weight_min = 154.32,
    weight_max = 420.69,
    perish_product = "spoiled_fish",
    loot = { "fishmeat" },
    cookable_product = "fishmeat_cooked",
    healthvalue = 8,
    hungervalue = 25,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

local neon_data =
{
    weight_min = 121.02,
    weight_max = 243.74,
    perish_product = "spoiled_fish",
    loot = { "fishmeat" },
    cookable_product = "fishmeat_cooked",
    healthvalue = 8,
    hungervalue = 25,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

local purple_data =
{
    weight_min = 205.15,
    weight_max = 362.87,
    perish_product = "spoiled_fish",
    loot = { "fishmeat" },
    cookable_product = "fishmeat_cooked",
    healthvalue = 8,
    hungervalue = 25,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

-- Small Fishes.
local tropical_data =
{
    weight_min = 20.89,
    weight_max = 47.32,
    perish_product = "spoiled_fish_small",
    loot = { "fishmeat_small" },
    cookable_product = "fishmeat_small_cooked",
    healthvalue = 1,
    hungervalue = 12.5,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

local pierrot_data =
{
    weight_min = 60.23,
    weight_max = 97.55,
    perish_product = "spoiled_fish_small",
    loot = { "fishmeat_small" },
    cookable_product = "fishmeat_small_cooked",
    healthvalue = 1,
    hungervalue = 12.5,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

local salmon_data =
{
    weight_min = 52.43,
    weight_max = 110.85,
    perish_product = "spoiled_fish_small",
    loot = { "fishmeat_small" },
    cookable_product = "fishmeat_small_cooked",
    healthvalue = 1,
    hungervalue = 12.5,
    perish_time = TUNING.PERISH_SUPERFAST,
	goldvalue = TUNING.GOLD_VALUES.MEAT,
}

local function koifn()
	return commonfn("koi", "koi", "koi02", koi_data)
end

local function tropicalfn()
	return commonfn("tropicalfish", "tropicalfish", "tropicalfish02", tropical_data)
end

local function neonfn()
	return commonfn("neonfish", "neonfish", "neonfish02", neon_data)
end

local function grouperfn()
	return commonfn("grouper", "grouper", "grouper02", purple_data)
end

local function pierrotfn()
	return commonfn("pierrotfish", "pierrotfish", "pierrotfish02", pierrot_data)
end

local function salmonfn()
	return commonfn("salmonfish", "salmonfish", "salmonfish02", salmon_data)
end

return Prefab("kyno_koi", koifn, assets, fish_prefabs),
Prefab("kyno_tropicalfish", tropicalfn, assets, fish_prefabs),
Prefab("kyno_neonfish", neonfn, assets, fish_prefabs),
Prefab("kyno_grouper", grouperfn, assets, fish_prefabs),
Prefab("kyno_pierrotfish", pierrotfn, assets, fish_prefabs),
Prefab("kyno_salmonfish", salmonfn, assets, fish_prefabs)