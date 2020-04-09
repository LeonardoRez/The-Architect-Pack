require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/fish_farm.zip"),	
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function onhammered(inst, worker)
	if inst:HasTag("fire") and inst.components.burnable then
		inst.components.burnable:Extinguish()
	end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:PushAnimation("idle", true)
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:PushAnimation("idle", true)
end

local function onsave(inst, data)
	if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end
end

local function onload(inst, data)
	if data and data.burnt then
        inst.components.burnable.onburnt(inst)
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
    minimap:SetIcon("fish_farm.png")
	
    inst.AnimState:SetBank("fish_farm")
    inst.AnimState:SetBuild("fish_farm")
    inst.AnimState:PlayAnimation("idle", true)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	
	inst:SetPhysicsRadiusOverride(1.2)
	MakeWaterObstaclePhysics(inst, 1.2, 1.2, 1.2)
	inst.Physics:SetDontRemoveOnSleep(true)

	inst:AddTag("structure")
	inst:AddTag("aquatic")
	inst:AddTag("ignorewalkableplatforms")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(onhit)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	inst:ListenForEvent("on_collide", OnCollide)
	inst:ListenForEvent("onbuilt", onbuilt)

	inst.OnSave = onsave 
    inst.OnLoad = onload

    return inst
end

return Prefab("kyno_fishfarm", fn, assets, prefabs),
MakePlacer("kyno_fishfarm_placer", "fish_farm", "fish_farm", "idle")