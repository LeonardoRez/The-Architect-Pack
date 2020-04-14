require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_ruins_well.zip"),      
	
	Asset("IMAGE", "images/inventoryimages/kyno_wishingwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_wishingwell.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_endwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_endwell.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local function onhammered(inst, worker)
    if inst:HasTag("fire") and inst.components.burnable then
        inst.components.burnable:Extinguish()
    end
	inst.components.lootdropper:DropLoot()
	if inst.components.container then inst.components.container:DropEverything() end
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("idle_full")
		inst.AnimState:PushAnimation("idle_full", true)
	end
end

local function onhit_vortex(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("vortex_idle_full")
		inst.AnimState:PushAnimation("vortex_idle_full", true)
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("fill")
	inst.AnimState:PushAnimation("idle_full", true)
end	

local function onbuilt_vortex(inst)
	inst.AnimState:PlayAnimation("vortex_fill")
	inst.AnimState:PushAnimation("vortex_idle_full", true)
end

local function onfar(inst)
	inst.SoundEmitter:KillSound("doom")
end

local function onnear(inst)
	inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/endswell/hum_LP","doom")
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

local function wellfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_well.png")
	
	inst.AnimState:SetBank("pig_ruins_well")
	inst.AnimState:SetBuild("pig_ruins_well")
	inst.AnimState:PlayAnimation("idle_full", true)
	
	MakeObstaclePhysics(inst, 2)
	
	inst:AddTag("structure")
	inst:AddTag("well")
	
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
	inst.components.workable:SetWorkLeft(3)
   
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

local function endfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_well_vortex.png")
	
	inst.AnimState:SetBank("pig_ruins_well")
	inst.AnimState:SetBuild("pig_ruins_well")
	inst.AnimState:PlayAnimation("vortex_idle_full", true)
	
	MakeObstaclePhysics(inst, 2)
	
	inst:AddTag("structure")
	inst:AddTag("endwell")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(5, 7)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit_vortex)
	inst.components.workable:SetWorkLeft(3)
   
	inst:ListenForEvent("onbuilt", onbuilt_vortex)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

return Prefab("kyno_wishingwell", wellfn, assets, prefabs),
MakePlacer("kyno_wishingwell_placer", "pig_ruins_well", "pig_ruins_well", "idle_full"),

Prefab("kyno_endwell", endfn, assets, prefabs),
MakePlacer("kyno_endwell_placer", "pig_ruins_well", "pig_ruins_well", "vortex_idle_full")