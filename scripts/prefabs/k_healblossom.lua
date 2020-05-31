local assets =
{
    Asset("ANIM", "anim/lavaarena_heal_flowers_fx.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_healblossom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_healblossom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_healblossom2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_healblossom2.xml"),
}

local prefabs =
{
    "petals",
	"nightmarefuel",
    "kyno_healblossom",
}

local DAYLIGHT_SEARCH_RANGE = 30

local names_grow = {"in_1", "in_2", "in_3", "in_4", "in_5", "in_6"}
local names = {"idle_1", "idle_2", "idle_3", "idle_4", "idle_5", "idle_6"}

local function setflowertype(inst, name)
    if inst.animname == nil or (name ~= nil and inst.animname ~= name) then
        inst.animname = name or (math.random() or names[math.random(#names)])
        inst.AnimState:PlayAnimation(inst.animname, true)
    end
end

local function onsave(inst, data)
    data.anim = inst.animname
    data.planted = inst.planted
end

local function onload(inst, data)
    setflowertype(inst, data ~= nil and data.anim or nil) -- Was data.anim that when unload and load again changes the animate.
    inst.planted = data ~= nil and data.planted or nil
end

local function onpickedfn(inst, picker)
    local pos = inst:GetPosition()
    if picker ~= nil then
        if picker.components.sanity ~= nil and not picker:HasTag("plantkin") then
            picker.components.sanity:DoDelta(TUNING.SANITY_TINY)
        end
    end
    inst:Remove()
end

local function testfortransformonload(inst)
    return TheWorld.state.isfullmoon
end

local function DieInDarkness(inst)
    local x,y,z = inst.Transform:GetWorldPosition()
    local ents = TheSim:FindEntities(x,0,z, DAYLIGHT_SEARCH_RANGE, { "daylight", "lightsource" })
    for i,v in ipairs(ents) do
        local lightrad = v.Light:GetCalculatedRadius() * .7
        if v:GetDistanceSqToPoint(x,y,z) < lightrad * lightrad then
            return
        end
    end
    inst:Remove()
    SpawnPrefab("flower_withered").Transform:SetPosition(x,y,z)
end

local function OnIsCaveDay(inst, isday)
    if isday then
        inst:DoTaskInTime(5.0 + math.random()*5.0, DieInDarkness)
    end
end

local function OnBurnt(inst)
    DefaultBurntFn(inst)
end

local function onbuilt(inst)
	inst.animnamegrow = names_grow[math.random(#names_grow)]
	inst.AnimState:PlayAnimation(inst.animnamegrow)
	inst.AnimState:PushAnimation(inst.animname, true)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst.animname = names[math.random(#names)]
	
    inst.AnimState:SetBank("lavaarena_heal_flowers")
    inst.AnimState:SetBuild("lavaarena_heal_flowers_fx")
	inst.AnimState:PlayAnimation(inst.animname, true)
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("structure")
	inst:AddTag("flower")
	inst:AddTag("healflower")
    inst:AddTag("cattoy")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/pickup_plants"
    inst.components.pickable:SetUp("petals", 10)
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.quickpick = true
    inst.components.pickable.wildfirestarter = true

    MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
    inst.components.burnable:SetOnBurntFn(OnBurnt)

    if TheWorld:HasTag("cave") then
        inst:WatchWorldState("iscaveday", OnIsCaveDay)
    end

    MakeHauntableChangePrefab(inst, "flower_evil")
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.planted = true
    
    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

local function artificialfn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst.animname = names[math.random(#names)]
	
    inst.AnimState:SetBank("lavaarena_heal_flowers")
    inst.AnimState:SetBuild("lavaarena_heal_flowers_fx")
	inst.AnimState:PlayAnimation(inst.animname, true)
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("structure")
	inst:AddTag("flowerheal")
    inst:AddTag("cattoy")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("pickable")
    inst.components.pickable.picksound = "dontstarve/wilson/pickup_plants"
    inst.components.pickable:SetUp("petals", 10)
    inst.components.pickable.onpickedfn = onpickedfn
    inst.components.pickable.quickpick = true
    inst.components.pickable.wildfirestarter = true

    MakeSmallBurnable(inst)
	MakeSmallPropagator(inst)
    inst.components.burnable:SetOnBurntFn(OnBurnt)

    if TheWorld:HasTag("cave") then
        inst:WatchWorldState("iscaveday", OnIsCaveDay)
    end

    MakeHauntableChangePrefab(inst, "flower_evil")
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.planted = true
    
    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

local function healflowerplacetestfn(inst)
	inst.AnimState:Hide("drop")
end

return Prefab("kyno_healflower", fn, assets, prefabs),
Prefab("kyno_artificial_healflower", artificialfn, assets, prefabs),
MakePlacer("kyno_healflower_placer", "lavaarena_heal_flowers", "lavaarena_heal_flowers_fx", "idle_1", false, nil, nil, nil, nil, nil, healflowerplacetestfn),
MakePlacer("kyno_artificial_healflower_placer", "lavaarena_heal_flowers", "lavaarena_heal_flowers_fx", "idle_4", false, nil, nil, nil, nil, nil, healflowerplacetestfn)