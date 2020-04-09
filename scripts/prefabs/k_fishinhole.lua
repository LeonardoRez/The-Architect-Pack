require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/fishschool.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fishinhole.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fishinhole.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function onhit(inst)
	inst.AnimState:PlayAnimation("idle_loop_full")
	inst.AnimState:PushAnimation("idle_loop_full", true)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("fish2.png")
	
	inst.AnimState:SetBank("fishschool")
	inst.AnimState:SetBuild("fishschool")
	inst.AnimState:PlayAnimation("idle_loop_full", true)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)
	
	inst:SetPhysicsRadiusOverride(.1)
	MakeWaterObstaclePhysics(inst, .1, .1, .1)
	
	inst:AddTag("structure")
	inst:AddTag("aquatic")
	inst:AddTag("fishschool")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst.no_wet_prefix = true
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(100)

	inst:AddComponent("combat")
	
	inst:AddComponent("fishable")
	inst.components.fishable:AddFish("pondfish")
	inst.components.fishable:SetRespawnTime(TUNING.FISH_RESPAWN_TIME)

	return inst
end

return Prefab("kyno_fishinhole", fn, assets, prefabs),
MakePlacer("kyno_fishinhole_placer", "fishschool", "fishschool", "idle_loop_full")  