local assets =
{
    Asset("ANIM", "anim/cactus.zip"),
    Asset("ANIM", "anim/oasis_cactus.zip"),
    Asset("ANIM", "anim/cactus_flower.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_cactus.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_cactus.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_oasis_cactus.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_oasis_cactus.xml"),
}

local prefabs =
{
    "cactus_meat",
    "cactus_flower",
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("cactus_meat")
	inst:Remove()
end

local function ontransplantfn(inst)
    inst.components.pickable:MakeEmpty()
end

local function onpickedfn(inst, picker)
    inst.Physics:SetActive(false)
    inst.AnimState:PlayAnimation(inst.has_flower and "picked_flower" or "picked")
    inst.AnimState:PushAnimation("empty", true)

    if picker ~= nil then
        if picker.components.combat ~= nil and not (picker.components.inventory ~= nil and picker.components.inventory:EquipHasTag("bramble_resistant")) then
            picker.components.combat:GetAttacked(inst, TUNING.CACTUS_DAMAGE)
            picker:PushEvent("thorns")
        end

        if inst.has_flower then
            -- You get a cactus flower, yay.
            local loot = SpawnPrefab("cactus_flower")
            loot.components.inventoryitem:InheritMoisture(TheWorld.state.wetness, TheWorld.state.iswet)
            if picker.components.inventory ~= nil then
                picker.components.inventory:GiveItem(loot, nil, inst:GetPosition())
            else
                local x, y, z = inst.Transform:GetWorldPosition()
                loot.components.inventoryitem:DoDropPhysics(x, y, z, true)
            end
        end
    end

    inst.has_flower = false
end

local function onregenfn(inst)
    if TheWorld.state.issummer then
        inst.AnimState:PlayAnimation("grow_flower") 
        inst.AnimState:PushAnimation("idle_flower", true)
        inst.has_flower = true
    else
        inst.AnimState:PlayAnimation("grow") 
        inst.AnimState:PushAnimation("idle", true)
        inst.has_flower = false
    end
    inst.Physics:SetActive(true)
end

local function makeemptyfn(inst)
    inst.Physics:SetActive(false)
    inst.AnimState:PlayAnimation("empty", true)
    inst.has_flower = false
end

local function OnEntityWake(inst)
    if inst.components.pickable ~= nil and inst.components.pickable.canbepicked then
        inst.has_flower = TheWorld.state.issummer
        inst.AnimState:PlayAnimation(inst.has_flower and "idle_flower" or "idle", true)
    else
        inst.AnimState:PlayAnimation("empty", true)
        inst.has_flower = false
    end
end

local function c1fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("cactus.png")
	
    inst.AnimState:SetBuild("cactus")
	inst.AnimState:SetBank("cactus")
	inst.AnimState:PlayAnimation("idle", true)

	inst:AddTag("plant")
	inst:AddTag("thorny")

	MakeObstaclePhysics(inst, .3)

	inst:SetPrefabNameOverride("cactus")
	
	MakeSnowCoveredPristine(inst)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.AnimState:SetTime(math.random() * 2)

	inst:AddComponent("pickable")
	inst.components.pickable.picksound = "dontstarve/wilson/harvest_sticks"

	inst.components.pickable:SetUp("cactus_meat", TUNING.CACTUS_REGROW_TIME)
	inst.components.pickable.onregenfn = onregenfn
	inst.components.pickable.onpickedfn = onpickedfn
	inst.components.pickable.makeemptyfn = makeemptyfn
	inst.components.pickable.ontransplantfn = ontransplantfn

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
		
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)

	MakeLargeBurnable(inst)
	MakeMediumPropagator(inst)

	inst.OnEntityWake = OnEntityWake

	MakeHauntableIgnite(inst)
	MakeSnowCovered(inst, .01)
	
    return inst
end

local function c2fn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddMiniMapEntity()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("oasis_cactus.png")
	
    inst.AnimState:SetBuild("oasis_cactus")
	inst.AnimState:SetBank("oasis_cactus")
	inst.AnimState:PlayAnimation("idle", true)

	inst:AddTag("plant")
	inst:AddTag("thorny")

	MakeObstaclePhysics(inst, .3)

	inst:SetPrefabNameOverride("cactus")
	
	MakeSnowCoveredPristine(inst)

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst.AnimState:SetTime(math.random() * 2)

	inst:AddComponent("pickable")
	inst.components.pickable.picksound = "dontstarve/wilson/harvest_sticks"

	inst.components.pickable:SetUp("cactus_meat", TUNING.CACTUS_REGROW_TIME)
	inst.components.pickable.onregenfn = onregenfn
	inst.components.pickable.onpickedfn = onpickedfn
	inst.components.pickable.makeemptyfn = makeemptyfn
	inst.components.pickable.ontransplantfn = ontransplantfn

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
		
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)

	MakeLargeBurnable(inst)
	MakeMediumPropagator(inst)

	inst.OnEntityWake = OnEntityWake

	MakeHauntableIgnite(inst)
	MakeSnowCovered(inst, .01)
	
    return inst
end

return Prefab("kyno_cactus", c1fn, assets, prefabs),
Prefab("kyno_oasis_cactus", c2fn, assets, prefabs),
MakePlacer("kyno_cactus_placer", "cactus", "cactus", "idle"),
MakePlacer("kyno_oasis_cactus_placer", "oasis_cactus", "oasis_cactus", "idle")