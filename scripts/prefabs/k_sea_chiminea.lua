require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/fire_water_pit.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
    "kyno_chimineafire",
    "collapse_small",
    "ash",
}

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    local x, y, z = inst.Transform:GetWorldPosition()
    SpawnPrefab("ash").Transform:SetPosition(x, y, z)
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(x, y, z)
    fx:SetMaterial("stone")
    inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("hit")
    inst.AnimState:PushAnimation("idle_water", true)
end

local function onextinguish(inst)
    if inst.components.fueled ~= nil then
        inst.components.fueled:InitializeFuelLevel(0)
    end
end

local function ontakefuel(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end

local function updatefuelrate(inst)
    inst.components.fueled.rate = TheWorld.state.israining and 1 + TUNING.FIREPIT_RAIN_RATE * TheWorld.state.precipitationrate or 1
end

local function onupdatefueled(inst)
    if inst.components.burnable ~= nil and inst.components.fueled ~= nil then
        updatefuelrate(inst)
        inst.components.burnable:SetFXLevel(inst.components.fueled:GetCurrentSection(), inst.components.fueled:GetSectionPercent())
    end
end

local function onfuelchange(newsection, oldsection, inst, doer)
    if newsection <= 0 then
        inst.components.burnable:Extinguish()
    else
        if not inst.components.burnable:IsBurning() then
            updatefuelrate(inst)
            inst.components.burnable:Ignite(nil, nil, doer)
        end
        inst.components.burnable:SetFXLevel(newsection, inst.components.fueled:GetSectionPercent())
    end
end

local SECTION_STATUS =
{
    [0] = "OUT",
    [1] = "EMBERS",
    [2] = "LOW",
    [3] = "NORMAL",
    [4] = "HIGH",
}
local function getstatus(inst)
    return SECTION_STATUS[inst.components.fueled:GetCurrentSection()]
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle_water", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/fireAddFuel")
end

local function OnHaunt(inst, haunter)
    if math.random() <= TUNING.HAUNT_CHANCE_RARE and
        inst.components.fueled ~= nil and
        not inst.components.fueled:IsEmpty() then
        inst.components.fueled:DoDelta(TUNING.MED_FUEL)
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_SMALL
        return true
    end
    return false
end

local function OnInit(inst)
    if inst.components.burnable ~= nil then
        inst.components.burnable:FixFX()
    end
end

local function OnPrefabOverrideDirty(inst)
    if inst.prefaboverride:value() ~= nil then
        inst:SetPrefabNameOverride(inst.prefaboverride:value().prefab)
        if not TheWorld.ismastersim and inst.replica.container:CanBeOpened() then
            inst.replica.container:WidgetSetup(inst.prefaboverride:value().prefab)
        end
    end
end

local function OnRadiusDirty(inst)
    inst:SetPhysicsRadiusOverride(inst.radius:value() > 0 and inst.radius:value() / 100 or nil)
end

local function OnSave(inst, data)
	data._has_debuffable = inst.components.debuffable ~= nil 
end

local function OnPreLoad(inst, data)
	if data ~= nil and data._has_debuffable then
		inst:AddComponent("debuffable")
	end
end

local DAMAGE_SCALE = 0.5
local function OnCollide(inst, data)
    local boat_physics = data.other.components.boatphysics
    if boat_physics ~= nil then
        local hit_velocity = math.floor(math.abs(boat_physics:GetVelocity() * data.hit_dot_velocity) * DAMAGE_SCALE / boat_physics.max_velocity + 0.5)
        inst.components.workable:WorkedBy(data.other, hit_velocity * TUNING.SEASTACK_MINE)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("firewater_pit.png")
    minimap:SetPriority(1)

    inst.AnimState:SetBank("fire_water_pit")
    inst.AnimState:SetBuild("fire_water_pit")
    inst.AnimState:PlayAnimation("idle_water", true)
	
	inst:SetPhysicsRadiusOverride(1)
	MakeWaterObstaclePhysics(inst, 1, 1, 1)
	inst.Physics:SetDontRemoveOnSleep(true)

    if TheNet:GetServerGameMode() == "quagmire" then
        inst:AddTag("installations")
        inst:AddTag("quagmire_stewer")
        inst:AddTag("quagmire_cookwaretrader")

        inst.takeitem = net_entity(inst.GUID, "firepit.takeitem")
        inst.prefaboverride = net_entity(inst.GUID, "firepit.prefaboverride", "prefaboverridedirty")
        inst.radius = net_byte(inst.GUID, "firepit.radius", "radiusdirty")

        if not TheWorld.ismastersim then
            inst:ListenForEvent("prefaboverridedirty", OnPrefabOverrideDirty)
            inst:ListenForEvent("radiusdirty", OnRadiusDirty)
        end

        inst.curradius = .6
        MakeObstaclePhysics(inst, inst.curradius)
    else
        MakeObstaclePhysics(inst, 1)
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("campfire")
    inst:AddTag("structure")
	inst:AddTag("aquatic")
    inst:AddTag("wildfireprotected")
    inst:AddTag("cooker")
	inst:AddTag("ignorewalkableplatforms")

    inst:AddComponent("burnable")
    inst.components.burnable:AddBurnFX("kyno_chimineafire", Vector3(0, 0, 0))
    inst:ListenForEvent("onextinguish", onextinguish)

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	inst:AddComponent("cooker")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("fueled")
    inst.components.fueled.maxfuel = TUNING.FIREPIT_FUEL_MAX
    inst.components.fueled.accepting = true

    inst.components.fueled:SetSections(4)
    inst.components.fueled.bonusmult = TUNING.FIREPIT_BONUS_MULT
    inst.components.fueled:SetTakeFuelFn(ontakefuel)
    inst.components.fueled:SetUpdateFn(onupdatefueled)
    inst.components.fueled:SetSectionCallback(onfuelchange)
    inst.components.fueled:InitializeFuelLevel(TUNING.FIREPIT_FUEL_START)

    if TheNet:GetServerGameMode() == "quagmire" then
        event_server_data("quagmire", "prefabs/firepit").master_postinit(inst, OnPrefabOverrideDirty, OnRadiusDirty)
    end

    inst:AddComponent("hauntable")
    inst.components.hauntable.cooldown = TUNING.HAUNT_COOLDOWN_HUGE
    inst.components.hauntable:SetOnHauntFn(OnHaunt)

    inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("on_collide", OnCollide)

    inst:DoTaskInTime(0, OnInit)

	inst.OnSave = OnSave
	inst.OnPreLoad = OnPreLoad

    return inst
end

return Prefab("kyno_sea_chiminea", fn, assets, prefabs),
MakePlacer("kyno_sea_chiminea_placer", "fire_water_pit", "fire_water_pit", "idle_water")