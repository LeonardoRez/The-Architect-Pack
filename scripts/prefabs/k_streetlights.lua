require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_lamp_post.zip"),
	Asset("ANIM", "anim/quagmire_lamp_short.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_streetlight1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_streetlight1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_streetlight2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_streetlight2.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("idle")
    inst.AnimState:PushAnimation("idle")
end

local function onbuilt(inst)
    inst.AnimState:PushAnimation("idle")
end

local function tallfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddLight()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.8)
    inst.Light:SetRadius(7)
    inst.Light:Enable(true)
    inst.Light:SetColour(197/255, 197/255, 10/255)
	
    MakeObstaclePhysics(inst, .2)
	
    inst.AnimState:SetBank("quagmire_lamp_post")
    inst.AnimState:SetBuild("quagmire_lamp_post")
    inst.AnimState:PlayAnimation("idle")
    
	inst:AddTag("structure")
	inst:AddTag("streetlamp")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

local function shortfn()
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddLight()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.7)
    inst.Light:SetRadius(3)
    inst.Light:Enable(true)
    inst.Light:SetColour(197/255, 197/255, 10/255)
	
    MakeObstaclePhysics(inst, .2)
	
    inst.AnimState:SetBank("quagmire_lamp_short")
    inst.AnimState:SetBuild("quagmire_lamp_short")
    inst.AnimState:PlayAnimation("idle")
    
	inst:AddTag("structure")
	inst:AddTag("streetlamp_short")
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:ListenForEvent("onbuilt", onbuilt)
	
	MakeHauntableWork(inst)
	
    return inst
end

return Prefab("kyno_streetlight1", tallfn, assets),
Prefab("kyno_streetlight2", shortfn, assets),
MakePlacer("kyno_streetlight1_placer", "quagmire_lamp_post", "quagmire_lamp_post", "idle"),
MakePlacer("kyno_streetlight2_placer", "quagmire_lamp_short", "quagmire_lamp_short", "idle")