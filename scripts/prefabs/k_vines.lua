require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/cave_exit_rope.zip"),
	Asset("ANIM", "anim/copycreep_build.zip"),
	Asset("ANIM", "anim/vine01_build.zip"),
	Asset("ANIM", "anim/vine02_build.zip"),	
	
	Asset("IMAGE", "images/inventoryimages/kyno_vine1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_vine1.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_vine2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_vine2.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local function onhealthchange(inst)
	if inst.components.health:IsDead() then
		inst.AnimState:PlayAnimation("wither")
		inst:Remove()
	end
end

local function keeptargetfn()
    return false
end

local function onload(inst)
    if inst.components.health:IsDead() then
		inst.AnimState:PlayAnimation("death")
        inst:Remove()
    end
end

local function onhit(inst)
	local healthpercent = inst.components.health:GetPercent()
        if healthpercent > 0 then
		inst.AnimState:PlayAnimation("hit")
	end
end

local function vinefn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize( 1.5, .75 )
	
	inst.AnimState:SetBank("exitrope")
	inst.AnimState:SetBuild("copycreep_build")
	inst.AnimState:PlayAnimation("idle_loop")
	
	MakeCharacterPhysics(inst, 1, .3)
	inst.Physics:SetDontRemoveOnSleep(true)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("hangingvine")

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(100)
	inst.components.health.ondelta = onhealthchange
	inst.components.health.nofadeout = false
	inst.components.health.canheal = false

	inst:AddComponent("combat")
	inst.components.combat:SetKeepTargetFunction(keeptargetfn)
	inst.components.combat.onhitfn = onhit
	
	
	inst.OnLoad = onload
	
	return inst
end

local function hangingfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local shadow = inst.entity:AddDynamicShadow()
	shadow:SetSize( 1.5, .75 )
	
	inst.AnimState:SetBank("exitrope")
	if math.random() < 0.5 then
		inst.AnimState:SetBuild("vine01_build")
	else
		inst.AnimState:SetBuild("vine02_build")
	end
	inst.AnimState:PlayAnimation("idle_loop")
	
	MakeCharacterPhysics(inst, 1, .3)
	inst.Physics:SetDontRemoveOnSleep(true)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("hangingvine")

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(100)
	inst.components.health.ondelta = onhealthchange
	inst.components.health.nofadeout = false
	inst.components.health.canheal = false

	inst:AddComponent("combat")
	inst.components.combat:SetKeepTargetFunction(keeptargetfn)
	inst.components.combat.onhitfn = onhit
	
	inst.OnLoad = onload
	
	return inst
end

return Prefab("kyno_vine1", vinefn, assets, prefabs),
MakePlacer("kyno_vine1_placer", "exitrope", "copycreep_build", "idle"),

Prefab("kyno_vine2", hangingfn, assets, prefabs),
MakePlacer("kyno_vine2_placer", "exitrope", "vine01_build", "idle")