require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_shop.zip"),
    Asset("ANIM", "anim/flag_post_duster_build.zip"),
    Asset("ANIM", "anim/flag_post_perdy_build.zip"),
    Asset("ANIM", "anim/flag_post_royal_build.zip"),
    Asset("ANIM", "anim/flag_post_wilson_build.zip"), 
	Asset("ANIM", "anim/pig_tower_build.zip"),
	Asset("ANIM", "anim/pig_tower_royal_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs =
{
    "splash_sink",
}

local function onhammered(inst, worker)
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("stone")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then 
        inst.AnimState:PlayAnimation("hit")
		inst.AnimState:PushAnimation("idle")
	end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle")
end

local function Towerfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_guard_tower.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetBank("pig_shop")
	inst.AnimState:SetBuild("pig_tower_build")
	inst.AnimState:AddOverrideBuild("flag_post_perdy_build")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("pigtower")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function Towerfn2()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_guard_tower.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetBank("pig_shop")
	inst.AnimState:SetBuild("pig_tower_build")
	inst.AnimState:AddOverrideBuild("flag_post_duster_build")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("pigtower")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function Towerfn3()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_guard_tower.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetBank("pig_shop")
	inst.AnimState:SetBuild("pig_tower_build")
	inst.AnimState:AddOverrideBuild("flag_post_wilson_build")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("pigtower")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function PalaceTowerfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_palace.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	inst.AnimState:SetBank("pig_shop")
	inst.AnimState:SetBuild("pig_tower_royal_build")
	inst.AnimState:AddOverrideBuild("flag_post_royal_build")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("pigtower")
	inst:AddTag("palacetower")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)

    MakeHauntableWork(inst)
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)

	return inst
end

local function placetestfn(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
	inst.AnimState:AddOverrideBuild("flag_post_perdy_build")
    return true
end

local function placetestfn2(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
	inst.AnimState:AddOverrideBuild("flag_post_duster_build")
    return true
end

local function placetestfn3(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
	inst.AnimState:AddOverrideBuild("flag_post_wilson_build")
    return true
end

local function palaceplacetestfn(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
	inst.AnimState:AddOverrideBuild("flag_post_royal_build")
    return true
end

return Prefab("kyno_pigtower", Towerfn, assets, prefabs),
MakePlacer("kyno_pigtower_placer", "pig_shop", "pig_tower_build", "idle", false, nil, nil, nil, 90, nil, placetestfn),

Prefab("kyno_pigtower2", Towerfn2, assets, prefabs),
MakePlacer("kyno_pigtower2_placer", "pig_shop", "pig_tower_build", "idle", false, nil, nil, nil, nil, nil, placetestfn2),

Prefab("kyno_pigtower3", Towerfn3, assets, prefabs),
MakePlacer("kyno_pigtower3_placer", "pig_shop", "pig_tower_build", "idle", false, nil, nil, nil, nil, nil, placetestfn3),

Prefab("kyno_pigpalacetower", PalaceTowerfn, assets, prefabs),
MakePlacer("kyno_pigpalacetower_placer", "pig_shop", "pig_tower_royal_build", "idle", false, nil, nil, nil, nil, nil, palaceplacetestfn)