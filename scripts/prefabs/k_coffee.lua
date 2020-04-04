require "prefabutil"

local Assets=
{
	Asset("ANIM", "anim/coffee.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
}

local function turnoffspeed(inst)
	inst.components.locomotor.groundspeedmultiplier = 1
	inst.components.locomotor.externalspeedmultiplier = 1
	print("COFFEE SPEEDBOOST ENDED", turnoffspeed)
end

local function OnEaten(inst, eater)
	eater.components.locomotor.isrunning = true
	eater.components.locomotor.groundspeedmultiplier = 1.85
	eater.components.locomotor.externalspeedmultiplier = 1.85
	eater:DoTaskInTime(480, turnoffspeed)
	print("COFFEE SPEEDBOOST STARTED", OnEaten)
end

local function cooked(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddNetwork()

	MakeInventoryPhysics(inst)
	inst.AnimState:SetBank("coffee")
	inst.AnimState:SetBuild("coffee")
	inst.AnimState:PlayAnimation("idle")

    inst.entity:SetPristine()
    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("edible")
	inst.components.edible.foodtype = "GOODIES"
	inst.components.edible.healthvalue = 3
	inst.components.edible.hungervalue = 9.5
	inst.components.edible.sanityvalue = -5
	inst.components.edible:SetOnEatenFn(OnEaten)

	MakeHauntableLaunch(inst)

	inst:AddComponent("inspectable")
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_MED)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "spoiled_food"

	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"

	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
  
	return inst
end

return Prefab("coffee", cooked, Assets, prefabs)