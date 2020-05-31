local assets =
{
    Asset("ANIM", "anim/backpack.zip"),
    Asset("ANIM", "anim/swap_pirate_booty_bag.zip"),
    Asset("ANIM", "anim/ui_krampusbag_2x5.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_minisign_icons.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_minisign_icons.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
}

local function SpawnGoldNugget(inst, owner)
    local goldnugget = SpawnPrefab("goldnugget")
    local pt = Vector3(inst.Transform:GetWorldPosition()) + Vector3(0,2,0)

    goldnugget.Transform:SetPosition(pt:Get())
    local angle = owner.Transform:GetRotation()*(PI/180)
    local sp = (math.random()+1) * -1
    goldnugget.Physics:SetVel(sp*math.cos(angle), math.random()*2+8, -sp*math.sin(angle))
    -- goldnugget.components.inventoryitem:OnStartFalling()
end

local function onequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("equipskinneditem", inst:GetSkinName())
        owner.AnimState:OverrideItemSkinSymbol("backpack", skin_build, "backpack", inst.GUID, "swap_pirate_booty_bag" )
        owner.AnimState:OverrideItemSkinSymbol("swap_body", skin_build, "swap_body", inst.GUID, "swap_pirate_booty_bag" )
    else
        owner.AnimState:OverrideSymbol("backpack", "swap_pirate_booty_bag", "backpack")
        owner.AnimState:OverrideSymbol("swap_body", "swap_pirate_booty_bag", "swap_body")
    end
    inst.components.container:Open(owner)
	-- inst.goldnugget_task = inst:DoPeriodicTask(TUNING.TOTAL_DAY_TIME, function() SpawnGoldNugget(inst, owner) end)
end

local function onunequip(inst, owner)
    local skin_build = inst:GetSkinBuild()
    if skin_build ~= nil then
        owner:PushEvent("unequipskinneditem", inst:GetSkinName())
    end
    owner.AnimState:ClearOverrideSymbol("swap_body")
    owner.AnimState:ClearOverrideSymbol("backpack")
    inst.components.container:Close(owner)
	-- inst.goldnugget_task:Cancel()
    -- inst.goldnugget_task = nil
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("piratepack.png")

    inst.AnimState:SetBank("pirate_booty_bag")
    inst.AnimState:SetBuild("swap_pirate_booty_bag")
    inst.AnimState:PlayAnimation("anim")

    inst.foleysound = "dontstarve_DLC002/common/foley/pirate_booty_pack"

    inst:AddTag("backpack")
	inst:AddTag("piratebackpack")
    inst:AddTag("waterproofer")

    MakeInventoryFloatable(inst, "med", 0.1, 0.65)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("krampus_sack") end
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons.xml"
	inst.components.inventoryitem.imagename = "piratepack"
	inst.components.inventoryitem:ChangeImageName("piratepack")
    inst.components.inventoryitem.cangoincontainer = false

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY
    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    inst:AddComponent("waterproofer")
    inst.components.waterproofer:SetEffectiveness(0)

    inst:AddComponent("container")
    inst.components.container:WidgetSetup("krampus_sack")

    MakeHauntableLaunchAndDropFirstItem(inst)

    return inst
end

return Prefab("piratepack", fn, assets)