require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/grass_tall.zip"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local function dig_up(inst, chopper)
	inst.components.lootdropper:SpawnLootPrefab("dug_grass")
	inst.components.lootdropper:SpawnLootPrefab("poop")
	inst:Remove()
end

local function DoRustle(inst)
if inst:HasTag("tall_grass") then
	inst:DoTaskInTime(4+math.random()*5, function() DoRustle(inst) end)
		inst.AnimState:PlayAnimation("rustle")
		inst.AnimState:PushAnimation("idle")
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("grow")
	inst.AnimState:PushAnimation("idle")
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("grass.png")
	
	inst.AnimState:SetBank("grass_tall")
	inst.AnimState:SetBuild("grass_tall")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("tall_grass")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnFinishCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)

	inst:ListenForEvent("onbuilt", onbuilt)
	
	DoRustle(inst)

	return inst
end

return Prefab("kyno_tallgrass", fn, assets, prefabs),
MakePlacer("kyno_tallgrass_placer", "grass_tall", "grass_tall", "idle")