require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/maxwell_torch.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_waxwelltorch.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_waxwelltorch.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
    "kyno_waxwelllight_flame",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_metal").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, dist)
	inst.AnimState:PlayAnimation("hit")
	inst.AnimState:PushAnimation("idle", true)
end

local function changelevels(inst, order)
    for i=1, #order do
        inst.components.burnable:SetFXLevel(order[i])
        Sleep(0.05)
    end
end

local function light(inst)    
    inst.task = inst:StartThread(function() changelevels(inst, inst.lightorder) end)    
end

local function extinguish(inst)
    if inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("maxwelltorch.png")
	
	MakeObstaclePhysics(inst, .1)
	
	inst.AnimState:SetBank("maxwell_torch")
	inst.AnimState:SetBuild("maxwell_torch")
	inst.AnimState:PlayAnimation("idle")
	
	inst:AddTag("structure")
	inst:AddTag("maxwelltorch")
	
	inst:SetPrefabNameOverride("maxwelllight")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)

	inst:AddComponent("burnable")
	inst.components.burnable.canlight = false
    inst.components.burnable:AddBurnFX("kyno_waxwelllight_flame", Vector3(0,0,0), "fire_marker")
    inst.components.burnable:SetOnIgniteFn(light)
	inst.components.burnable:Ignite()
	
	inst.lightorder = {5,6,7,8,7}
	
    inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(11, 12)
    inst.components.playerprox:SetOnPlayerNear(function() if not inst.components.burnable:IsBurning() then inst.components.burnable:Ignite() end end)
    inst.components.playerprox:SetOnPlayerFar(extinguish)

	return inst
end

return Prefab("kyno_waxwelltorch", fn, assets, prefabs),
MakePlacer("kyno_waxwelltorch_placer", "maxwell_torch", "maxwell_torch", "idle")