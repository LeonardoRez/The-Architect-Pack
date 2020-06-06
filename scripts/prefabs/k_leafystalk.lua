require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pillar_tree.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_leafystalk.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_leafystalk.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs = {
	"kyno_canopy_shadow",
}

local function chop_tree(inst, chopper, chops)

	if chopper and chopper.components.beaverness and chopper.components.beaverness:IsBeaver() then
		inst.SoundEmitter:PlaySound("dontstarve/characters/woodie/beaver_chop_tree")
	else
		inst.SoundEmitter:PlaySound("dontstarve/wilson/use_axe_tree")
	end
	inst.AnimState:PlayAnimation("idle", true)
end

local function chop_down_tree(inst, chopper)
	inst.SoundEmitter:PlaySound("dontstarve/forest/treefall")
	local pt = Vector3(inst.Transform:GetWorldPosition())
	local hispos = Vector3(chopper.Transform:GetWorldPosition())

	local he_right = (hispos - pt):Dot(TheCamera:GetRightVec()) > 0
	if he_right then
		inst.components.lootdropper:DropLoot(pt - TheCamera:GetRightVec())
	else
		inst.components.lootdropper:DropLoot(pt + TheCamera:GetRightVec())
	end
	RemovePhysicsColliders(inst)
	inst:Remove()
end

local shadow_front = 1

local shadow_defs = {
	shadow = { { -0, 0, 0 } },
}

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("tree_pillar")
	
	inst.AnimState:SetBank("pillar_tree")
	inst.AnimState:SetBuild("pillar_tree")
	inst.AnimState:PlayAnimation("idle", true)
	
	MakeObstaclePhysics(inst, 3, 24)
	
	inst:AddTag("structure")
	inst:AddTag("tree_pillar")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	local decor_items = shadow_defs
		inst.decor = {}
		for item_name, data in pairs(decor_items) do
			for l, offset in pairs(data) do
				local item_inst = SpawnPrefab("kyno_canopy_shadow")
				item_inst.AnimState:PushAnimation("idle", true)
				item_inst.entity:SetParent(inst.entity)
				item_inst.Transform:SetPosition(offset[1], offset[2], offset[3])
				table.insert(inst.decor, item_inst)
			end
		end
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("inspectable")
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.CHOP)
	inst.components.workable:SetOnWorkCallback(chop_tree)
	inst.components.workable:SetOnFinishCallback(chop_down_tree)
	inst.components.workable:SetWorkLeft(15)

	return inst
end

return Prefab("kyno_leafystalk", fn, assets, prefabs),
MakePlacer("kyno_leafystalk_placer", "pillar_tree", "pillar_tree", "idle")