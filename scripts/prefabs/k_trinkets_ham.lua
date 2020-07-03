local assets =
{
    Asset("ANIM", "anim/trinkets_ham.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham_2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham_2.xml"),
}

local SMALLFLOATS =
{
    [3]    = {0.7, 0.1},
    [3]    = {0.7, 0.1},
}

local function MakeTrinket(num)
    local prefabs = {}
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        MakeInventoryPhysics(inst)
		MakeInventoryFloatable(inst)

        inst.AnimState:SetBank("trinkets_ham")
        inst.AnimState:SetBuild("trinkets_ham")
        inst.AnimState:PlayAnimation(tostring(num))

        inst:AddTag("molebait")
        inst:AddTag("cattoy")

        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end

        inst:AddComponent("inspectable")
        inst:AddComponent("stackable")
        inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

        inst:AddComponent("inventoryitem")
		inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham_2.xml"

        if SMALLFLOATS[num] ~= nil then
            inst.components.floater:SetScale(SMALLFLOATS[num][1])
            inst.components.floater:SetVerticalOffset(SMALLFLOATS[num][2])
        end

        inst:AddComponent("tradable")
        inst.components.tradable.goldvalue = TUNING.GOLD_VALUES.TRINKETS[num] or 3
		inst.components.tradable.rocktribute = math.ceil(inst.components.tradable.goldvalue / 3)

        MakeHauntableLaunchAndSmash(inst)

        return inst
    end

    return Prefab("trinket_ham_"..tostring(num), fn, assets, prefabs)
end

local ret = {}
for k = 1, NUM_TRINKETS do
    table.insert(ret, MakeTrinket(k))
end

return unpack(ret)