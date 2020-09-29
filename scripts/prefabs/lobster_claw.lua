local assets=
{ 
    Asset("ANIM", "anim/lobster_claw.zip"),

    Asset("IMAGE", "images/inventoryimages/lobster_claw.tex"),
	Asset("ATLAS", "images/inventoryimages/lobster_claw.xml"),
	Asset("ATLAS_BUILD", "images/inventoryimages/lobster_claw.xml", 256),
}

local function fn()

    local inst = CreateEntity()
        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddNetwork()
        MakeInventoryPhysics(inst)

        inst.AnimState:SetBank("lobster_claw")
        inst.AnimState:SetBuild("lobster_claw")
        inst.AnimState:PlayAnimation("idle")
				
	if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_LARGEITEM

	inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/lobster_claw.xml"
	inst.components.inventoryitem.imagename = "lobster_claw"

    return inst
end

return Prefab("common/inventory/lobster_claw", fn, assets, prefabs)