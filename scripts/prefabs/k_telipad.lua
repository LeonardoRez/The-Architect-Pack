require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/teleport_pad.zip"),
	Asset("ANIM", "anim/teleport_pad_beacon.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs = {
	"kyno_telipad_beacon",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle", true)
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("idle", true)
end

local rock_front = 1

local decor_defs = {
	beacon = { { -1.28, 0, 1.14 } },
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("telipad.png")
	
	inst.Transform:SetRotation(0)

    inst.AnimState:SetBank("teleport_pad")
    inst.AnimState:SetBuild("teleport_pad")
    inst.AnimState:PlayAnimation("idle")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	
	inst:AddTag("structure")
	inst:AddTag("telipad")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	--[[
	local function createBeacon(inst)
	inst.telipadbeacon =  SpawnPrefab("kyno_telipad_beacon")
	inst.telipadbeacon.entity:SetParent(inst.entity)
	end
	]]--
	
	local decor_items = decor_defs
		inst.decor = {}
		for item_name, data in pairs(decor_items) do
			for l, offset in pairs(data) do
				local item_inst = SpawnPrefab("kyno_telipad_beacon")
				item_inst.AnimState:PlayAnimation("place")
				item_inst.AnimState:PushAnimation("on")
				item_inst.entity:SetParent(inst.entity)
				item_inst.Transform:SetPosition(offset[1], offset[2], offset[3])
				table.insert(inst.decor, item_inst)
			end
		end

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	-- inst:DoTaskInTime(FRAMES * 1, createBeacon)
	
    return inst
end

local function beaconfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("teleport_pad_beacon")
    inst.AnimState:SetBuild("teleport_pad_beacon")
    inst.AnimState:PlayAnimation("on")
	
	inst.persists = false
	
	inst:AddTag("telipad_beacon")
	inst:AddTag("NOCLICK")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	return inst
end

return Prefab("kyno_telipad", fn, assets, prefabs),
Prefab("kyno_telipad_beacon", beaconfn, assets, prefabs),
MakePlacer("kyno_telipad_placer", "teleport_pad", "teleport_pad", "idle", true)