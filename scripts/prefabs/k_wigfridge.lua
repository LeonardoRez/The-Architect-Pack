require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/kyno_wigfridge.zip"),
    Asset("ANIM", "anim/ui_chest_3x3.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_wigfridge.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wigfridge.xml"),
}

local prefabs =
{
    "collapse_small",
}

local function onopen(inst)
    inst.AnimState:PlayAnimation("open")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_open")
end

local function onclose(inst)
    inst.AnimState:PlayAnimation("close")
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_close")
end

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    inst.components.container:DropEverything()
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("metal")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.components.container:DropEverything()
    inst.AnimState:PushAnimation("closed", false)
    inst.components.container:Close()
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("closed", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/icebox_craft")
end

local function RefreshMeat(inst)
    local containsMeat = inst.components.container:Has("batwing", 1 or "batwing_cooked", 1 or "drumstick", 1 or "drumstick_cooked", 1
	or "pondeel", 1 or "pondfish", 1 or "froglegs", 1 or "froglegs_cooked", 1 or "trunk_summer", 1 or "trunk_winter", 1 or "trunk_cooked", 1
	or "plantmeat", 1 or "plantmeat_cooked", 1 or "meat", 1 or "cookedmeat", 1 or "monstermeat", 1 or "cookedmonstermeat", 1 or "smallmeat", 1
	or "cookedsmallmeat", 1 or "fishmeat_small", 1 or "fishmeat_small_cooked", 1 or "fishmeat", 1 or "fishmeat_cooked", 1 or "meat_dried", 1 or "smallmeat_dried", 1)
    if containsMeat then
        local items = inst.components.container:FindItems(function(v) return v.prefab=="batwing" or "batwing_cooked" or "drumstick" or "drumstick_cooked" or
		"pondeel" or "pondfish" or "froglegs" or "froglegs_cooked" or "trunk_summer" or "trunk_winter" or "trunk_cooked" or "plantmeat" or "plantmeat_cooked" or
		"meat" or "cookedmeat" or "monstermeat" or "cookedmonstermeat" or "smallmeat" or "cookedsmallmeat" or "fishmeat_small" or "fishmeat_small_cooked" or
		"fishmeat" or "fishmeat_cooked" or "meat_dried" or "smallmeat_dried" end)
        for k, v in pairs(items) do
			v.components.perishable:StopPerishing()
        end
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("icebox.png")

    inst:AddTag("icebox")
    inst:AddTag("structure")

    inst.AnimState:SetBank("wigfridge")
    inst.AnimState:SetBuild("wigfridge")
    inst.AnimState:PlayAnimation("closed")

    inst.SoundEmitter:PlaySound("dontstarve/common/ice_box_LP", "idlesound")

    MakeSnowCoveredPristine(inst)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
		inst.OnEntityReplicated = function(inst) inst.replica.container:WidgetSetup("icebox") end
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("preserver")
	inst.components.preserver:SetPerishRateMultiplier(TUNING.PERISH_SALTBOX_MULT)
	
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("icebox")
    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit) 

    inst:ListenForEvent("onbuilt", onbuilt)
    MakeSnowCovered(inst)

    AddHauntableDropItemOrWork(inst)
	
	-- inst:ListenForEvent("itemget", function() RefreshMeat(inst) end)
	-- inst:ListenForEvent("itemlose", function() RefreshMeat(inst) end)

    return inst
end

return Prefab("kyno_wigfridge", fn, assets, prefabs),
MakePlacer("kyno_wigfridge_placer", "wigfridge", "wigfridge", "closed")