local assets =
{
    --Asset("ANIM", "anim/store_items.zip"),
    Asset("ANIM", "anim/shelf_slot.zip"),
}

local prefabs =
{

}

local function empty(inst)     
    local item = inst.components.pocket:RemoveItem("shelfitem")  
    if item then    
        inst.components.shelfer:GiveGift()
        local pt = Point(inst.Transform:GetWorldPosition())
        -- if inst.components.shelfer.shelf then
        --     pt = Point(inst.components.shelfer.shelf.Transform:GetWorldPosition())
        -- end

        -- local angle = math.random() * math.pi
        -- inst.components.lootdropper:FlingItem(item, pt + Vector3(math.cos(angle), 2, math.sin(angle)))
		inst.components.lootdropper:FlingItem(item)
    end
end

local function common()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
	inst.entity:AddNetwork()

    inst.AnimState:SetBuild("shelf_slot")
    inst.AnimState:SetBank("shelf_slot")
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:Hide("mouseclick")

    inst:AddTag("NOBLOCK")
	
    inst:AddComponent("pocket")
    inst:AddComponent("shelfer")
   
	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end
   
    inst:AddComponent("lootdropper")

    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.canbepickedup = false
    inst.empty = empty
	
    return inst
end

return Prefab("kyno_shelves_slot", common, assets, prefabs)       