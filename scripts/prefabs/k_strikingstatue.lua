require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_ruins_dart_statue.zip"),          
	
	Asset("IMAGE", "images/inventoryimages/kyno_dartstatue.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_dartstatue.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
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
		inst.AnimState:PlayAnimation("CCW")
		inst.AnimState:PushAnimation("CCW", true)
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("CCW")
	inst.AnimState:PushAnimation("CCW", true)
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_dart_statue.png")
	
	inst.AnimState:SetBank("pig_ruins_dart_statue")
	inst.AnimState:SetBuild("pig_ruins_dart_statue")
	inst.AnimState:PlayAnimation("CCW", true)
	
	MakeObstaclePhysics(inst, .25)
	
	inst:AddTag("structure")
	inst:AddTag("dartshooter")
	
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

	return inst
end

return Prefab("kyno_strikingstatue", fn, assets, prefabs),
MakePlacer("kyno_strikingstatue_placer", "pig_ruins_dart_statue", "pig_ruins_dart_statue", "CCW")