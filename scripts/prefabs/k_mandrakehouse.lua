require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/elderdrake_house.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_mandrakehouse.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_mandrakehouse.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhammered(inst, worker)
    if inst:HasTag("fire") and inst.components.burnable then
        inst.components.burnable:Extinguish()
    end
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then
    	inst.AnimState:PlayAnimation("hit")
    	inst.AnimState:PushAnimation("idle")
    end
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

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("open")
	inst.AnimState:PushAnimation("idle")
    inst.SoundEmitter:PlaySound("dontstarve/common/craftable/rabbit_hutch")
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
	minimap:SetIcon("elderdrake_house.png")
	
	inst.AnimState:SetBank("elderdrake_house")
	inst.AnimState:SetBuild("elderdrake_house")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("mandrake_shelter")
	
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
   
	MakeSnowCovered(inst, 0.01)
   
	inst:ListenForEvent("onbuilt", onbuilt)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

return Prefab("kyno_mandrakehouse", fn, assets, prefabs),
MakePlacer("kyno_mandrakehouse_placer", "elderdrake_house", "elderdrake_house", "idle")