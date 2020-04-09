require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sand_castle.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_sw.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_sw.xml"),
}

local anims = {"low", "med", "full"}

local function dig_up(inst, worker, workleft)
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
        print("PlayAnimation", workleft, anims[workleft])
        inst.AnimState:PlayAnimation(anims[workleft])
    end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("sand_castle")
	inst.AnimState:SetBuild("sand_castle")
	inst.AnimState:PlayAnimation(anims[#anims])
	
	MakeObstaclePhysics(inst, .4)
	
	inst:AddTag("structure")
	inst:AddTag("sandcastle")
	inst:AddTag("sand")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnWorkCallback(dig_up)
	inst.components.workable:SetWorkLeft(#anims)

	return inst
end

return Prefab("kyno_sandcastle", fn, assets, prefabs),
MakePlacer("kyno_sandcastle_placer", "sand_castle", "sand_castle", "full")