require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/luggage.zip"),
    Asset("ANIM", "anim/ui_chest_3x3.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_luggagechest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_luggagechest.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
    "collapse_small",
}

local function onopen(inst)
    if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("open")
        inst.AnimState:PushAnimation("opened")
        inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
    end
end 

local function onclose(inst)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("close")
        inst.AnimState:PushAnimation("closed", true)
        inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
    end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    inst.components.lootdropper:DropLoot()
    if inst.components.container ~= nil then
        inst.components.container:DropEverything()
    end
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
        inst.AnimState:PlayAnimation("hit")
        inst.AnimState:PushAnimation("closed", false)
        if inst.components.container ~= nil then
            inst.components.container:DropEverything()
            inst.components.container:Close()
        end
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("close")
	inst.AnimState:PushAnimation("closed", true)
    inst.SoundEmitter:PlaySound("dontstarve/common/chest_craft")
end

local function onsave(inst, data)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() or inst:HasTag("burnt") then
        data.burnt = true
    end
end

local function onload(inst, data)
    if data ~= nil and data.burnt and inst.components.burnable ~= nil then
        inst.components.burnable.onburnt(inst)
    end
end

local DAMAGE_SCALE = 0.5
local function OnCollide(inst, data)
    local boat_physics = data.other.components.boatphysics
    if boat_physics ~= nil then
        local hit_velocity = math.floor(math.abs(boat_physics:GetVelocity() * data.hit_dot_velocity) * DAMAGE_SCALE / boat_physics.max_velocity + 0.5)
        inst.components.workable:WorkedBy(data.other, hit_velocity * TUNING.EVERGREEN_CHOPS_SMALL)
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("luggage_chest.png")

    inst.AnimState:SetBank("luggage")
    inst.AnimState:SetBuild("luggage")
    inst.AnimState:PlayAnimation("closed", true)
	
	inst:SetPhysicsRadiusOverride(.5)
	MakeWaterObstaclePhysics(inst, .5, .5, .5)
	inst.Physics:SetDontRemoveOnSleep(true)

	inst:AddTag("structure")
    inst:AddTag("chest")
	inst:AddTag("wet")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
	inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("container")
    inst.components.container:WidgetSetup("treasurechest")

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(2)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)
	
    inst:ListenForEvent("onbuilt", onbuilt)
	inst:ListenForEvent("on_collide", OnCollide)

    AddHauntableDropItemOrWork(inst)
	
    return inst
end

return Prefab("kyno_luggagechest", fn, assets),
MakePlacer("kyno_luggagechest_placer", "luggage", "luggage", "closed")