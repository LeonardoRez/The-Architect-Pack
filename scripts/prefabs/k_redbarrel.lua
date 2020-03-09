require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/gunpowder_barrel.zip"),
	Asset("ANIM", "anim/explode.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_redbarrel.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_redbarrel.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local prefabs =
{
	"explode_small"
}

local function onhammered(inst, worker)
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.components.lootdropper:DropLoot()
	inst:Remove()
end

local function onhit(inst)
	inst.AnimState:PlayAnimation("idle_water")
	inst.AnimState:PushAnimation("idle_water", true)
end

local function OnIgniteFn(inst)
    inst.SoundEmitter:PlaySound("dontstarve/common/blackpowder_fuse_LP", "hiss")
    DefaultBurnFn(inst)
end

local function OnExtinguishFn(inst)
    inst.SoundEmitter:KillSound("hiss")
    DefaultExtinguishFn(inst)
end

local function OnExplodeFn(inst)
    inst.SoundEmitter:KillSound("hiss")
    SpawnPrefab("explode_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
end

local function OnHitFn(inst)
	if inst.components.burnable then
		inst.components.burnable:Ignite()
	end
	if inst.components.freezable then
		inst.components.freezable:Unfreeze()
	end
	if inst.components.health then
		inst.components.health:DoFireDamage(0)
	end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("gunpowder_barrel.png")
	
	inst.AnimState:SetBank("gunpowder_barrel")
	inst.AnimState:SetBuild("gunpowder_barrel")
	inst.AnimState:PlayAnimation("idle_water", true)
	
	inst:SetPhysicsRadiusOverride(1)
	MakeWaterObstaclePhysics(inst, 0.80, 2, 1.25)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("explosive")

	inst:AddComponent("inspectable")
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(99999)

	inst:AddComponent("combat")
	inst.components.combat:SetOnHit(OnHitFn)

	MakeSmallBurnable(inst, 3 + math.random() * 3)
	MakeSmallPropagator(inst)

	inst.components.burnable:SetOnBurntFn(nil)
    inst.components.burnable:SetOnIgniteFn(OnIgniteFn)
    inst.components.burnable:SetOnExtinguishFn(OnExtinguishFn)
	
	inst:AddComponent("explosive")
    inst.components.explosive:SetOnExplodeFn(OnExplodeFn)
    inst.components.explosive.explosivedamage = TUNING.GUNPOWDER_DAMAGE
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(2)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	MakeHauntableLaunchAndIgnite(inst)

	return inst
end

return Prefab("kyno_redbarrel", fn, assets, prefabs),
MakePlacer("kyno_redbarrel_placer", "gunpowder_barrel", "gunpowder_barrel", "idle_water")  