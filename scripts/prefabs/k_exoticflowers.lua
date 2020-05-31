local assets =
{
    Asset("ANIM", "anim/flowers_rainforest.zip"), 
	
	Asset("IMAGE", "images/inventoryimages/kyno_exoticflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_exoticflower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_exoticflower2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_exoticflower2.xml"),
}

local prefabs =
{
    "petals",
    "kyno_exoticflower",
}

local DAYLIGHT_SEARCH_RANGE = 30

local names = {"f1","f2","f3","f4","f5","f6","f7","f8","f9","f10","f11","f12","f13","f14","f15","f16","f17"}

local function setflowertype(inst, name)
    if inst.animname == nil or (name ~= nil and inst.animname ~= name) then
        inst.animname = name or (math.random() or names[math.random(#names)])
        inst.AnimState:PlayAnimation(inst.animname)
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

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

	inst.animname = names[math.random(#names)]
	
    inst.AnimState:SetBank("flowers_rainforest")
    inst.AnimState:SetBuild("flowers_rainforest")
	inst.AnimState:PlayAnimation(inst.animname)
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("structure")
	inst:AddTag("flower")
	inst:AddTag("exoticflower")
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
	
    inst.AnimState:SetBank("flowers_rainforest")
    inst.AnimState:SetBuild("flowers_rainforest")
	inst.AnimState:PlayAnimation(inst.animname)
    inst.AnimState:SetRayTestOnBB(true)

    inst:AddTag("structure")
	inst:AddTag("exoticflower")
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

	inst.planted = true
    
    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("kyno_exoticflower", fn, assets, prefabs),
Prefab("kyno_artificial_exoticflower", artificialfn, assets, prefabs),
MakePlacer("kyno_exoticflower_placer", "flowers_rainforest", "flowers_rainforest", "f6"),
MakePlacer("kyno_artificial_exoticflower_placer", "flowers_rainforest", "flowers_rainforest", "f5")