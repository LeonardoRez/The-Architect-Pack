local assets =
{
    Asset("ANIM", "anim/atrium_overgrowth.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_atriumobelisk.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_atriumobelisk.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("atrium_overgrowth.png")
	
	MakeObstaclePhysics(inst, 1.5)

    inst.AnimState:SetBuild("atrium_overgrowth")
    inst.AnimState:SetBank("atrium_overgrowth")
    inst.AnimState:PlayAnimation("idle")

	inst:AddTag("structure")
	inst:AddTag("atrium_obelisk")

    inst:SetPrefabNameOverride("atrium_overgrowth")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")

    inst:AddComponent("sanityaura")
    inst.components.sanityaura.aura = -TUNING.SANITYAURA_SUPERHUGE

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)

    return inst
end

return Prefab("kyno_atriumobelisk", fn, assets, prefabs),
MakePlacer("kyno_atriumobelisk_placer", "atrium_overgrowth", "atrium_overgrowth", "idle")