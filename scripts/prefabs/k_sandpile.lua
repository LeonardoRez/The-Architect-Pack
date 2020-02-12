require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sand_dune.zip"),
	
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
	
	inst.AnimState:SetBank("sand_dune")
	inst.AnimState:SetBuild("sand_dune")
	inst.AnimState:PlayAnimation(anims[#anims])
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddTag("structure")
	inst:AddTag("sand")
	
    inst:AddComponent("lootdropper")
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnWorkCallback(dig_up)
	inst.components.workable:SetWorkLeft(#anims)

	return inst
end

return Prefab("kyno_sandhill", fn, assets, prefabs),
MakePlacer("kyno_sandhill_placer", "sand_dune", "sand_dune", "full")