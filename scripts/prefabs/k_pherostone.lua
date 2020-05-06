require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pheromone_stone.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
}
	
local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)
	MakeInventoryFloatable(inst, "small", 0.05)

    inst.AnimState:SetBank("pheromone_stone")
    inst.AnimState:SetBuild("pheromone_stone")
    inst.AnimState:PlayAnimation("pherostone")

    inst:AddTag("cattoy")
	inst:AddTag("ant_translator")
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
	inst.components.inventoryitem.foleysound = "dontstarve/movement/foley/jewlery"
	
    inst:AddComponent("stackable")
	inst.components.stackable.maxsize = 10

	return inst
end 

return Prefab("kyno_pherostone", fn, assets, prefabs)