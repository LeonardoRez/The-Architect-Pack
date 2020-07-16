require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/quagmire_syrup_hanger.zip"),
	
	Asset("IMAGE", "images/minimapimages/kyno_pothanger.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_pothanger.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_metal")
	inst:Remove()
end

local function onhit(inst, worker)
    inst.AnimState:PlayAnimation("cooking_loop")
    inst.AnimState:PushAnimation("cooking_loop", true)
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
	inst.AnimState:PushAnimation("cooking_loop", true)
	inst.SoundEmitter:PlaySound("dontstarve/common/cook_pot_craft")
end

local function onnear(inst)
	inst.AnimState:PushAnimation("cooking_loop", true)
	-- inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
end

local function onfar(inst)
	inst.AnimState:PushAnimation("cooking_loop", true)
	-- inst.SoundEmitter:PlaySound("dontstarve/common/cookingpot_rattle", "snd")
end

local function potfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_pothanger.tex")
	
	MakeObstaclePhysics(inst, .3)
	
	inst.AnimState:SetBank("quagmire_syrup_hanger")
	inst.AnimState:SetBuild("quagmire_syrup_hanger")
	inst.AnimState:PlayAnimation("cooking_loop", true)
	inst.AnimState:Hide("mouseover")
    inst.AnimState:Hide("goop")
    inst.AnimState:Hide("goop_small")
    inst.AnimState:Hide("goop_syrup")
	inst.AnimState:SetFinalOffset(3)
	
	inst:AddTag("structure")
	inst:AddTag("pot_hanger")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "QUAGMIRE_POT_SYRUP"
	
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)
	
	inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(4, 6)
    inst.components.playerprox.onnear = onnear
    inst.components.playerprox.onfar = onfar

	return inst
end

local function potplacetestfn(inst)
	inst.AnimState:Hide("mouseover")
    inst.AnimState:Hide("goop")
    inst.AnimState:Hide("goop_small")
    inst.AnimState:Hide("goop_syrup")
end

return Prefab("kyno_pothanger_syrup", potfn, assets, prefabs),
MakePlacer("kyno_pothanger_syrup_placer", "quagmire_syrup_hanger", "quagmire_syrup_hanger", "idle_loop", false, nil, nil, nil, nil, nil, potplacetestfn)