require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/wagstaff_thumper.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_wagstaff.fev"),
	Asset("SOUND", "sound/dontstarve_wagstaff.fsb"),
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local function TurnOn(inst)
	inst.sg:GoToState("raise")
end

local function TurnOff(inst)
	--inst.sg:GoToState("idle")
end

local function CanInteract(inst)
	if inst.components.machine.ison then
		return false
	end
	return true
end

local function GetStatus(inst, viewer)
	if inst.on then
		return "ON"
	else
		return "OFF"
	end
end

local function OnBuilt(inst)
	inst.sg:GoToState("place")
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function OnHit(inst, dist)
	if inst.sg:HasStateTag("idle") then
		inst.sg:GoToState("hit_low")
	end
end

local function OnSave(inst, data)
    local refs = {}
    return refs
end

local function OnLoad(inst, data)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
    minimap:SetIcon("wagstaff_thumper.png")

    inst.AnimState:SetBank("wagstaff_thumper")
    inst.AnimState:SetBuild("wagstaff_thumper")
    inst.AnimState:PlayAnimation("idle")
	inst.on = false
	
	MakeObstaclePhysics(inst, 1)

	inst:AddTag("structure")
	inst:AddTag("groundpoundimmune")
	inst:AddTag("THE_THUMPER")
	
    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
	
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = TurnOn
	inst.components.machine.turnofffn = TurnOff
	inst.components.machine.caninteractfn = CanInteract
	inst.components.machine.cooldowntime = 0.5
	
	inst:AddComponent("groundpounder")
  	inst.components.groundpounder.destroyer = true
    inst.components.groundpounder.damageRings = 2
    inst.components.groundpounder.destructionRings = 3
    inst.components.groundpounder.numRings = 3

	inst:AddComponent("combat")
    inst.components.combat.defaultdamage = 50
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetOnFinishCallback(onhammered)
    inst.components.workable:SetOnWorkCallback(OnHit)
	inst.components.workable:SetWorkLeft(2)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst.OnSave = OnSave 
    inst.OnLoad = OnLoad

	MakeSnowCovered(inst, .01)
	
	inst:SetStateGraph("SGthumper")
	
	inst:ListenForEvent("onbuilt", OnBuilt)
	
    return inst
end

return Prefab("kyno_thumper", fn, assets, prefabs),
MakePlacer("kyno_thumper_placer", "wagstaff_thumper", "wagstaff_thumper", "idle")