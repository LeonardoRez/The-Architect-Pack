require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/kyno_treeclump.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_treeclump.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_treeclump.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_treeclump.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_treeclump.xml"),
}

local prefabs =
{
	"log",
	"pinecone",
}

local function onworked(inst, chopper, workleft)
	if chopper and chopper.components.beaverness and chopper.components.beaverness:IsBeaver() then
		inst.SoundEmitter:PlaySound("dontstarve/characters/woodie/beaver_chop_tree")          
	else
		inst.SoundEmitter:PlaySound("dontstarve/wilson/use_axe_tree")          
	end
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:PushAnimation("idle", true)
end

local function onworkfinish(inst, chopper)
	inst.SoundEmitter:PlaySound("dontstarve/forest/treefall")
    local pt = Vector3(inst.Transform:GetWorldPosition())
    local hispos = Vector3(chopper.Transform:GetWorldPosition())
    local he_right = (hispos - pt):Dot(TheCamera:GetRightVec()) > 0
    if he_right then
        -- inst.AnimState:PlayAnimation("fallleft")
        inst.components.lootdropper:DropLoot(pt - TheCamera:GetRightVec())
    else
        -- inst.AnimState:PlayAnimation("fallright")
        inst.components.lootdropper:DropLoot(pt + TheCamera:GetRightVec())
    end
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    MakeObstaclePhysics(inst, 1)

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_treeclump.tex")

	inst.AnimState:SetBank("kyno_treeclump")
	inst.AnimState:SetBuild("kyno_treeclump")
	inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("plant")
	inst:AddTag("tree")
	inst:AddTag("structure")
	
	inst:SetPrefabNameOverride("treeclump")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")

	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.CHOP)
	inst.components.workable:SetWorkLeft(15)
	inst.components.workable:SetOnWorkCallback(onworked)
	inst.components.workable:SetOnFinishCallback(onworkfinish)

	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)

	return inst
end

return Prefab("kyno_treeclump", fn, assets, prefabs),
MakePlacer("kyno_treeclump_placer", "kyno_treeclump", "kyno_treeclump", "idle")