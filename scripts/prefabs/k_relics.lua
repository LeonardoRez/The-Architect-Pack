require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/relics.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
}
	
local function relic1()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("relic")
    inst.AnimState:SetBuild("relics")
    inst.AnimState:PlayAnimation("1")

    inst:AddTag("cattoy")
	inst:AddTag("lostrelic")
	inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 3

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10

	return inst
end 

local function relic2()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("relic")
    inst.AnimState:SetBuild("relics")
    inst.AnimState:PlayAnimation("2")

    inst:AddTag("cattoy")
	inst:AddTag("lostrelic")
	inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 3

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10

	return inst
end

local function relic3()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("relic")
    inst.AnimState:SetBuild("relics")
    inst.AnimState:PlayAnimation("3")

    inst:AddTag("cattoy")
	inst:AddTag("lostrelic")
	inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 3

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10

	return inst
end

local function relic4()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("relic")
    inst.AnimState:SetBuild("relics")
    inst.AnimState:PlayAnimation("4")

    inst:AddTag("cattoy")
	inst:AddTag("lostrelic")
	inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 3

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10
	
	return inst
end

local function relic5()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("relic")
    inst.AnimState:SetBuild("relics")
    inst.AnimState:PlayAnimation("5")

    inst:AddTag("cattoy")
	inst:AddTag("lostrelic")
	inst:AddTag("molebait")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("bait")
	
	inst:AddComponent("tradable")
	inst.components.tradable.goldvalue = 3

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10

	return inst
end

return Prefab("kyno_relic_1", relic1, assets, prefabs),
Prefab("kyno_relic_2", relic2, assets, prefabs),
Prefab("kyno_relic_3", relic3, assets, prefabs),
Prefab("kyno_relic_4", relic4, assets, prefabs),
Prefab("kyno_relic_5", relic5, assets, prefabs)