require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/phonograph.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_gramaphone.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_gramaphone.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
	
	Asset("SOUND", "sound/maxwell.fsb"),
	Asset("SOUND", "sound/music.fsb"),
	Asset("SOUND", "sound/gramaphone.fsb"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function TurnOn(inst)
	inst.AnimState:PlayAnimation("play_loop", true)
	inst.SoundEmitter:PlaySound("dontstarve/maxwell/ragtime", "ragtime")
end

local function TurnOff(inst)
	inst.AnimState:PlayAnimation("idle")
    inst.SoundEmitter:KillSound("ragtime")
    inst.SoundEmitter:PlaySound("dontstarve/music/gramaphone_end")
end

local function onfar(inst)
if inst.components.machine.ison then
	inst.SoundEmitter:SetVolume("ragtime", 0)
    inst.SoundEmitter:PlaySound("dontstarve/music/gramaphone_end")
	end
end

local function onnear(inst)
if inst.components.machine.ison then
    inst.SoundEmitter:PlaySound("dontstarve/music/gramaphone_end")
	inst.SoundEmitter:SetVolume("ragtime", 1)
	inst.SoundEmitter:PlaySound("dontstarve/maxwell/ragtime", "ragtime")
	end
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

local function onhit(inst, dist)
	inst.AnimState:PlayAnimation("open")
	inst.AnimState:PushAnimation("idle", true)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("phonograph.png")
	
	MakeObstaclePhysics(inst, 0.1)
	
	inst.AnimState:SetBank("phonograph")
	inst.AnimState:SetBuild("phonograph")
	inst.AnimState:PlayAnimation("idle")
	inst.on = false
	
	inst:AddTag("structure")
	inst:AddTag("maxwellphonograph")
	
	inst:SetPrefabNameOverride("maxwellphonograph")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("machine")
	inst.components.machine.turnonfn = TurnOn
	inst.components.machine.turnofffn = TurnOff
	inst.components.machine.caninteractfn = CanInteract
	inst.components.machine.cooldowntime = 0.5
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	inst:AddComponent("playerprox")
	inst.components.playerprox:SetDist(49, 50)
	inst.components.playerprox:SetOnPlayerFar(onfar)
	inst.components.playerprox:SetOnPlayerNear(onnear)

	return inst
end

return Prefab("kyno_gramaphone", fn, assets, prefabs),
MakePlacer("kyno_gramaphone_placer", "phonograph", "phonograph", "idle")