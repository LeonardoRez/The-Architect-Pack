require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/trap_teeth.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_trapteeth.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_trapteeth.xml"),
}

local assets_maxwell =
{
    Asset("ANIM", "anim/trap_teeth_maxwell.zip"),
    
	Asset("IMAGE", "images/inventoryimages/kyno_trapteeth.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_trapteeth.xml"),
}

local function onfinished_normal(inst)
    inst:RemoveComponent("inventoryitem")
    inst:RemoveComponent("mine")
    inst.persists = false
    inst.Physics:SetActive(false)
    inst.AnimState:PushAnimation("used", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    inst:DoTaskInTime(3, inst.Remove)
end

local function onused_maxwell(inst)
    inst.AnimState:PlayAnimation("used", false)
    inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    inst:DoTaskInTime(3, inst.Remove)
end

local function onfinished_maxwell(inst)
    inst:RemoveComponent("mine")
    inst.persists = false
    inst.Physics:SetActive(false)
    inst:DoTaskInTime(1.25, onused_maxwell)
end

local function OnExplode(inst, target)
    inst.AnimState:PlayAnimation("trap")
    if target then
        inst.SoundEmitter:PlaySound("dontstarve/common/trap_teeth_trigger")
        target.components.combat:GetAttacked(inst, TUNING.TRAP_TEETH_DAMAGE)
    end
    if inst.components.finiteuses then
        inst.components.finiteuses:Use(1)
    end
end

local function OnReset(inst)
    if inst.components.inventoryitem ~= nil then
        inst.components.inventoryitem.nobounce = true
    end
    if not inst:IsInLimbo() then
        inst.MiniMapEntity:SetEnabled(true)
    end
    if not inst.AnimState:IsCurrentAnimation("idle") then
        inst.SoundEmitter:PlaySound("dontstarve/common/trap_teeth_reset")
        inst.AnimState:PlayAnimation("reset")
        inst.AnimState:PushAnimation("idle", false)
    end
end

local function OnResetMax(inst)
    if not inst:IsInLimbo() then
        inst.MiniMapEntity:SetEnabled(true)
    end
    if not inst.AnimState:IsCurrentAnimation("idle") then
        inst.SoundEmitter:PlaySound("dontstarve/common/trap_teeth_reset")
        inst.AnimState:PlayAnimation("idle")
    end
end

local function SetSprung(inst)
    if inst.components.inventoryitem ~= nil then
        inst.components.inventoryitem.nobounce = true
    end
    if not inst:IsInLimbo() then
        inst.MiniMapEntity:SetEnabled(true)
    end
    inst.AnimState:PlayAnimation("trap_idle")
end

local function SetInactive(inst)
    if inst.components.inventoryitem ~= nil then
        inst.components.inventoryitem.nobounce = false
    end
    inst.MiniMapEntity:SetEnabled(false)
    inst.AnimState:PlayAnimation("inactive")
end

local function OnDropped(inst)
    inst.components.mine:Deactivate()
end

local function ondeploy(inst, pt, deployer)
    inst.components.mine:Reset()
    inst.Physics:Stop()
    inst.Physics:Teleport(pt:Get())
end

local function OnHaunt(inst, haunter)
    if inst.components.mine == nil or inst.components.mine.inactive then
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_TINY
        Launch(inst, haunter, TUNING.LAUNCH_SPEED_SMALL)
        return true
    elseif not inst.components.mine.issprung then
        return false
    elseif math.random() <= TUNING.HAUNT_CHANCE_OFTEN then
        inst.components.hauntable.hauntvalue = TUNING.HAUNT_SMALL
        inst.components.mine:Reset()
        return true
    end
    return false
end

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function common_fn(bank, build, isinventoryitem)
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddMiniMapEntity()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.MiniMapEntity:SetIcon("trap_teeth.png")

    inst.AnimState:SetBank(bank)
    inst.AnimState:SetBuild(build)
    inst.AnimState:PlayAnimation("idle")

    inst:AddTag("trap")

    if isinventoryitem then
        MakeInventoryFloatable(inst)
    end

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")

    if isinventoryitem then
        inst:AddComponent("inventoryitem")
        inst.components.inventoryitem:SetOnDroppedFn(OnDropped)
    end

    inst:AddComponent("mine")
    inst.components.mine:SetRadius(TUNING.TRAP_TEETH_RADIUS)
    inst.components.mine:SetAlignment("player")
    inst.components.mine:SetOnExplodeFn(OnExplode)
    inst.components.mine:SetOnResetFn(OnReset)
    inst.components.mine:SetOnSprungFn(SetSprung)
    inst.components.mine:SetOnDeactivateFn(SetInactive)

    inst:AddComponent("finiteuses")
    inst.components.finiteuses:SetMaxUses(TUNING.TRAP_TEETH_USES)
    inst.components.finiteuses:SetUses(TUNING.TRAP_TEETH_USES)
    inst.components.finiteuses:SetOnFinished(onfinished_normal)

    inst:AddComponent("deployable")
    inst.components.deployable.ondeploy = ondeploy
    inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.LESS)

    inst:AddComponent("hauntable")
    inst.components.hauntable:SetOnHauntFn(OnHaunt)
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetWorkLeft(2)

    return inst
end

local function MakeTeethTrapNormal()
    local inst = common_fn("trap_teeth", "trap_teeth", true)

    if not TheWorld.ismastersim then
        return inst
    end

    inst.components.mine:Reset()

    return inst
end

local function MakeTeethTrapMaxwell()
    local inst = common_fn("trap_teeth_maxwell", "trap_teeth_maxwell")

    if not TheWorld.ismastersim then
        return inst
    end

    inst.components.finiteuses:SetMaxUses(10)
    inst.components.finiteuses:SetUses(10)
    inst.components.finiteuses:SetOnFinished(onfinished_maxwell)

    inst.components.mine:SetAlignment("player")
    inst.components.mine:SetOnResetFn(OnResetMax)
    inst.components.mine:Reset()

    return inst
end

return Prefab("kyno_trap_teeth_maxwell", MakeTeethTrapMaxwell, assets_maxwell),
MakePlacer("kyno_trap_teeth_maxwell_placer", "trap_teeth_maxwell", "trap_teeth_maxwell", "idle")