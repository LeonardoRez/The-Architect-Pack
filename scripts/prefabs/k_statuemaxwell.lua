local assets =
{
    Asset("ANIM", "anim/statue_maxwell.zip"),
    
	Asset("IMAGE", "images/inventoryimages/kyno_statuemaxwell.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_statuemaxwell.xml"),
}

local prefabs =
{
    "marble",
    "rock_break_fx",
}

local function onwork(inst, worker, workleft)
    if workleft <= 0 then
        local pos = inst:GetPosition()
        SpawnPrefab("rock_break_fx").Transform:SetPosition(pos:Get())
        inst.components.lootdropper:DropLoot(pos)
        inst:Remove()
    elseif workleft < TUNING.MARBLEPILLAR_MINE / 3 then
        inst.AnimState:PlayAnimation("hit_low")
        inst.AnimState:PushAnimation("idle_low")
    elseif workleft < TUNING.MARBLEPILLAR_MINE * 2 / 3 then
        inst.AnimState:PlayAnimation("hit_med")
        inst.AnimState:PushAnimation("idle_med")
    else
        inst.AnimState:PlayAnimation("hit_full")
        inst.AnimState:PushAnimation("idle_full")
    end
end

local function onbuilt(inst)
	inst.AnimState:PushAnimation("idle_full")
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("statue.png")

    MakeObstaclePhysics(inst, 0.66)

    inst.AnimState:SetBank("statue_maxwell")
    inst.AnimState:SetBuild("statue_maxwell")
    inst.AnimState:PlayAnimation("idle_full")
	
	inst.entity:AddTag("maxwell")
	inst.entity:AddTag("statue")
	inst.entity:AddTag("structure")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.MINE)
	inst.components.workable:SetWorkLeft(TUNING.MARBLEPILLAR_MINE)
	inst.components.workable:SetOnWorkCallback(onwork)
	
	inst:ListenForEvent("onbuilt", onbuilt)

    return inst
end

return Prefab("kyno_statuemaxwell", fn, assets, prefabs),
MakePlacer("kyno_statuemaxwell_placer", "statue_maxwell", "statue_maxwell", "idle_full")