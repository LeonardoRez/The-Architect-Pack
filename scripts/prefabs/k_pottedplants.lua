require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/potted_mushrooms.zip"),
	Asset("ANIM", "anim/potted_cacti.zip"),
	Asset("ANIM", "anim/potted_flowers.zip"),
	Asset("ANIM", "anim/potted_evilflowers.zip"),
	Asset("ANIM", "anim/potted_roses.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedbluemushroom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedbluemushroom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedredmushroom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedredmushroom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedgreenmushroom.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedgreenmushroom.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedflower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedevilflower.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedevilflower.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedrose.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedrose.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_pottedcactus.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_pottedcactus.xml"),
}

local prefabs =
{
    "collapse_small",
}

local function onsave(inst, data)
    data.anim = inst.animname
end

local function onload(inst, data)
    if data ~= nil and data.anim ~= nil then
        inst.animname = data.anim
        inst.AnimState:PlayAnimation(inst.animname)
    end
end

local function onhammered(inst)
    local fx = SpawnPrefab("collapse_small")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("pot")
    inst.components.lootdropper:DropLoot()
    inst:Remove()
end

local function common()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddSoundEmitter()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetRayTestOnBB(true)
	
	inst:AddTag("structure")
	inst:AddTag("potted_plant")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onhammered)

    MakeHauntableWork(inst)
    MakeHauntableWork(inst)

    inst.OnSave = onsave 
    inst.OnLoad = onload 

    return inst
end

local function blue()
    local inst = common()
	
    inst.AnimState:SetBank("potted_mushrooms")
    inst.AnimState:SetBuild("potted_mushrooms")
	
	inst.animname = "bm" .. tostring(math.random(3))
	inst.AnimState:PlayAnimation(inst.animname)
    return inst
end

local function green()
    local inst = common()
	
    inst.AnimState:SetBank("potted_mushrooms")
    inst.AnimState:SetBuild("potted_mushrooms")
	
	inst.animname = "gm" .. tostring(math.random(3))
	inst.AnimState:PlayAnimation(inst.animname)
	
	inst:SetPrefabNameOverride("kyno_pottedbluemushroom")
	
    return inst
end

local function red()
    local inst = common()
	
    inst.AnimState:SetBank("potted_mushrooms")
    inst.AnimState:SetBuild("potted_mushrooms")
	
	inst.animname = "rm" .. tostring(math.random(3))
	inst.AnimState:PlayAnimation(inst.animname)
	
	inst:SetPrefabNameOverride("kyno_pottedbluemushroom")
	
    return inst
end

local function cactus()
    local inst = common()
	
    inst.AnimState:SetBank("potted_cacti")
    inst.AnimState:SetBuild("potted_cacti")
	
	inst.animname = "c" .. tostring(math.random(5))
	inst.AnimState:PlayAnimation(inst.animname)
	
    return inst
end

local function flower()
    local inst = common()
	
    inst.AnimState:SetBank("potted_flowers")
    inst.AnimState:SetBuild("potted_flowers")
	
	inst.animname = "pf" .. tostring(math.random(9))
	inst.AnimState:PlayAnimation(inst.animname)
	
    return inst
end

local function evilflower()
    local inst = common()
	
    inst.AnimState:SetBank("potted_evilflowers")
    inst.AnimState:SetBuild("potted_evilflowers")
	
	inst.animname = "ef" .. tostring(math.random(8))
	inst.AnimState:PlayAnimation(inst.animname)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.components.inspectable.nameoverride = "KYNO_POTTEDFLOWER"
	
    return inst
end

local function rose()
    local inst = common()
	
    inst.AnimState:SetBank("potted_roses")
    inst.AnimState:SetBuild("potted_roses")
	
	inst.animname = "pr" .. tostring(math.random(7))
	inst.AnimState:PlayAnimation(inst.animname)
	
    return inst
end

return Prefab("kyno_pottedbluemushroom", blue, assets, prefabs),
Prefab("kyno_pottedgreenmushroom", green, assets, prefabs),
Prefab("kyno_pottedredmushroom", red, assets, prefabs),
Prefab("kyno_pottedcactus", cactus, assets, prefabs),
Prefab("kyno_pottedflower", flower, assets, prefabs),
Prefab("kyno_pottedevilflower", evilflower, assets, prefabs),
Prefab("kyno_pottedrose", rose, assets, prefabs),
MakePlacer("kyno_pottedbluemushroom_placer", "potted_mushrooms", "potted_mushrooms", "bm1"),
MakePlacer("kyno_pottedgreenmushroom_placer", "potted_mushrooms", "potted_mushrooms", "gm1"),
MakePlacer("kyno_pottedredmushroom_placer", "potted_mushrooms", "potted_mushrooms", "rm1"),
MakePlacer("kyno_pottedcactus_placer", "potted_cacti", "potted_cacti", "c1"),
MakePlacer("kyno_pottedflower_placer", "potted_flowers", "potted_flowers", "pf1"),
MakePlacer("kyno_pottedevilflower_placer", "potted_evilflowers", "potted_evilflowers", "ef1"),
MakePlacer("kyno_pottedrose_placer", "potted_roses", "potted_roses", "pr1")