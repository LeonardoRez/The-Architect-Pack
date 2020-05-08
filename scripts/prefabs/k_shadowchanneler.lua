local assets =
{
    Asset("ANIM", "anim/shadow_channeler.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_shadowhand.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_shadowhand.xml"),
}

local function CalcSanityAura(inst, observer)
    return -TUNING.SANITYAURA_MED  
end

local function KeepTargetFn()
    return false
end

local function OnAppear(inst)
    inst:RemoveEventCallback("animover", OnAppear)
    if not inst.killed then
        inst.components.health:SetInvincible(false)
        inst.AnimState:PlayAnimation("idle", true)
    end
end

local function OnDeath(inst)
    if not inst.killed then
        inst.killed = true
        inst.persists = false

        inst:RemoveEventCallback("animover", OnAppear)
        inst:RemoveEventCallback("death", OnDeath)

        inst:ListenForEvent("animover", inst.Remove)
        inst.AnimState:PlayAnimation("disappear")

        inst:DoTaskInTime(inst.AnimState:GetCurrentAnimationLength() + FRAMES, inst.Remove, inst.components.lootdropper:DropLoot())
    end
end

local function nodebrisdmg(inst, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
    return afflicter ~= nil and afflicter:HasTag("quakedebris")
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("appear")
	inst.AnimState:PushAnimation("idle", true)
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()

    inst.Transform:SetTwoFaced()

    inst.AnimState:SetBank("shadow_channeler")
    inst.AnimState:SetBuild("shadow_channeler")
    inst.AnimState:PlayAnimation("idle", true)
	
	inst:AddTag("shadowcreature")
	inst:AddTag("structure")
    inst:AddTag("notraptrigger")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aurafn = CalcSanityAura

    inst:AddComponent("health")
    inst.components.health:SetMaxHealth(100)
    inst.components.health:SetInvincible(false)
    inst.components.health.nofadeout = false
    inst.components.health.redirect = nodebrisdmg

    inst:AddComponent("combat")
    inst.components.combat:SetKeepTargetFunction(KeepTargetFn)

    inst:AddComponent("savedrotation")
	
	inst:ListenForEvent("onbuilt", onbuilt)

    return inst
end

return Prefab("kyno_shadowchanneler", fn, assets),
MakePlacer("kyno_shadowchanneler_placer", "shadow_channeler", "shadow_channeler", "idle", false, nil, nil, nil, 90, nil)