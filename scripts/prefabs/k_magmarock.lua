require "prefabutil"

local assets_magma =
{
	Asset("ANIM", "anim/rock_magma.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magmarock.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magmarock.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local assets_magma_gold =
{
	Asset("ANIM", "anim/rock_magma_gold.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_magmarock_gold.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_magmarock_gold.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local anims_magma = {"low", "med", "full"}
local anims_magma_gold = {"low", "med", "full"}

local function dig_up_magma(inst, worker, workleft)
    print("workleft", workleft)

    if workleft == 0 then
        -- last time
        -- inst.components.lootdropper:SetLoot({"turf_desertdirt"}) Craftable from Tab.

        -- figure out which side to drop the loot
        local pt = Vector3(inst.Transform:GetWorldPosition())
        local hispos = Vector3(worker.Transform:GetWorldPosition())

        local he_right = ((hispos - pt):Dot(TheCamera:GetRightVec()) > 0)
        
        if he_right then
            inst.components.lootdropper:DropLoot(pt - (TheCamera:GetRightVec()*(.5+math.random())))
        else
            inst.components.lootdropper:DropLoot(pt + (TheCamera:GetRightVec()*(.5+math.random())))
        end
        inst:Remove()
    else
        print("PlayAnimation", workleft, anims_magma[workleft])
        inst.AnimState:PlayAnimation(anims_magma[workleft])
    end
end

local function dig_up_magma_gold(inst, worker, workleft)
    print("workleft", workleft)

    if workleft == 0 then
        -- last time
        -- inst.components.lootdropper:SetLoot({"turf_desertdirt"}) Craftable from Tab.

        -- figure out which side to drop the loot
        local pt = Vector3(inst.Transform:GetWorldPosition())
        local hispos = Vector3(worker.Transform:GetWorldPosition())

        local he_right = ((hispos - pt):Dot(TheCamera:GetRightVec()) > 0)
        
        if he_right then
            inst.components.lootdropper:DropLoot(pt - (TheCamera:GetRightVec()*(.5+math.random())))
        else
            inst.components.lootdropper:DropLoot(pt + (TheCamera:GetRightVec()*(.5+math.random())))
        end
        inst:Remove()
    else
        print("PlayAnimation", workleft, anims_magma_gold[workleft])
        inst.AnimState:PlayAnimation(anims_magma_gold[workleft])
    end
end

local function commonfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("rockmagma.png")
	
	MakeObstaclePhysics(inst, 1)
	
	-- inst.AnimState:SetBank("rock_magma")
	-- inst.AnimState:SetBuild("rock_magma")
	-- inst.AnimState:PlayAnimation(anims[#anims])
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	inst:AddTag("rock")
	
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	-- inst.components.workable:SetOnWorkCallback(dig_up)
	-- inst.components.workable:SetWorkLeft(#anims)

	return inst
end

local function MagmaGoldFn()
	local inst = commonfn()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("rockmagma.png")
	
	inst.AnimState:SetBank("rock_magma_gold")
	inst.AnimState:SetBuild("rock_magma_gold")
	inst.AnimState:PlayAnimation(anims_magma_gold[#anims_magma_gold])
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnWorkCallback(dig_up_magma_gold)
	inst.components.workable:SetWorkLeft(#anims_magma_gold)
	
	return inst
end

local function MagmaFn()
	local inst = commonfn()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("rockmagma.png")
	
	inst.AnimState:SetBank("rock_magma")
	inst.AnimState:SetBuild("rock_magma")
	inst.AnimState:PlayAnimation(anims_magma[#anims_magma])
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnWorkCallback(dig_up_magma)
	inst.components.workable:SetWorkLeft(#anims_magma)
	
	return inst
end
	
return Prefab("kyno_magmarock_gold", MagmaGoldFn, assets_magma_gold, prefabs),
Prefab("kyno_magmarock", MagmaFn, assets_magma, prefabs),
MakePlacer("kyno_magmarock_gold_placer", "rock_magma_gold", "rock_magma_gold", "full"),
MakePlacer("kyno_magmarock_placer", "rock_magma", "rock_magma", "full")