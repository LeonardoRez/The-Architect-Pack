require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/geyser.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_krissure.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_krissure.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function StartBurning(inst)
	inst.AnimState:PlayAnimation("active_pre")
	inst.AnimState:PushAnimation("active_loop")
    inst.Light:Enable(true)
	inst:AddComponent("cooker")
end

local function StopBurning(inst)
	inst.AnimState:PlayAnimation("active_pst")
	inst.AnimState:PushAnimation("idle_dormant")
	inst.Light:Enable(true)
	inst:RemoveComponent("cooker")
end

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("charcoal")
	inst.components.lootdropper:SpawnLootPrefab("charcoal")
	inst.components.lootdropper:SpawnLootPrefab("redgem")
	inst:Remove()
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.entity:AddLight()
	inst.Light:Enable(true)
	inst.Light:SetColour(223/255,246/255,255/255)
    inst.Light:Enable(true)
    inst.Light:SetIntensity(.75)
    inst.Light:SetFalloff(0.5)
	inst.Light:SetRadius(1)
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("geyser.png")
	
	inst.AnimState:SetBank("geyser")
	inst.AnimState:SetBuild("geyser")
	inst.AnimState:PlayAnimation("idle_dormant", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("cooker")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.no_wet_prefix = true
	
	inst:AddTag("structure")
	inst:AddTag("geyser")
	
	inst:AddComponent("heater")
    inst.components.heater.heat = 100
	
	inst:AddComponent("propagator")
    inst.components.propagator.damages = true
    inst.components.propagator.propagaterange = 2
    inst.components.propagator.damagerange = 2
    inst.components.propagator:StartSpreading()
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 6)
    inst.components.playerprox:SetOnPlayerNear(StartBurning)
    inst.components.playerprox:SetOnPlayerFar(StopBurning)
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)

	MakeSmallPropagator(inst)	
	
	return inst
end

return Prefab("kyno_geyser", fn, assets, prefabs),
MakePlacer("kyno_geyser_placer", "geyser", "geyser", "active_loop")