require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pandoras_chest.zip"),
	Asset("ANIM", "anim/pandoras_chest_large.zip"),
	Asset("ANIM", "anim/ui_chest_3x2.zip"),
	Asset("ANIM", "anim/ui_chester_shadow_3x4.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ornatechest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ornatechest.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_ornatechest_large.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_ornatechest_large.xml"),
}

local function onopen(inst) 
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("open")
		inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_open")
	end
end

local function onclose(inst)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("close")
		inst.SoundEmitter:PlaySound("dontstarve/wilson/chest_close")
	end
end

local function onhammered(inst, worker)
    if inst:HasTag("fire") and inst.components.burnable then
        inst.components.burnable:Extinguish()
    end
	inst.components.lootdropper:DropLoot()
	if inst.components.container then inst.components.container:DropEverything() end
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit")
		inst.AnimState:PushAnimation("closed", true)
		if inst.components.container then 
			inst.components.container:DropEverything() 
			inst.components.container:Close()
		end
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("close")
	inst.AnimState:PushAnimation("closed", true)
	inst.SoundEmitter:PlaySound("dontstarve/common/chest_craft")
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

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pandoraschest.png")
	
	inst.AnimState:SetBank("pandoras_chest")
	inst.AnimState:SetBuild("pandoras_chest")
	inst.AnimState:PlayAnimation("closed", true)
	
	inst:AddTag("structure")
	inst:AddTag("ruinschest")
	inst:AddTag("chest")
	
	inst:SetPrefabNameOverride("pandoraschest")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("treasurechest")

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(2)
	
	-- MakeMediumBurnable(inst, nil, nil, true)
    -- MakeLargePropagator(inst)
   
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

local function largefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pandoraschest.png")
	
	inst.AnimState:SetBank("pandoras_chest_large")
	inst.AnimState:SetBuild("pandoras_chest_large")
	inst.AnimState:PlayAnimation("closed", true)
	
	inst:AddTag("structure")
	inst:AddTag("ruinschest")
	inst:AddTag("chest")
	
	inst:SetPrefabNameOverride("minotaurchest")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("dragonflychest")

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(3)
	
	-- MakeMediumBurnable(inst, nil, nil, true)
    -- MakeLargePropagator(inst)
   
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

return Prefab("kyno_ornatechest", fn, assets, prefabs),
Prefab("kyno_ornatechest_large", largefn, assets, prefabs),
MakePlacer("kyno_ornatechest_placer", "pandoras_chest", "pandoras_chest", "closed"),
MakePlacer("kyno_ornatechest_large_placer", "pandoras_chest_large", "pandoras_chest_large", "closed")