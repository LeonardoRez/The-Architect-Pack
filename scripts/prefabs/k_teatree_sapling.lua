--require "prefabutil"
local pinecone_assets =
{
    Asset("ANIM", "anim/teatree_nut.zip"),
}

local pinecone_prefabs =
{
    "teatree_short",
}

local function growtree(inst)
	local tree = SpawnPrefab(inst.growprefab) 
    if tree then 
		tree.Transform:SetPosition(inst.Transform:GetWorldPosition() ) 
        inst:Remove()
	end
end

local function stopgrowing(inst)
    inst.components.timer:StopTimer("grow")
end

startgrowing = function(inst)
    if not inst.components.timer:TimerExists("grow") then
        local growtime = GetRandomWithVariance(TUNING.PINECONE_GROWTIME.base, TUNING.PINECONE_GROWTIME.random)
        inst.components.timer:StartTimer("grow", growtime)
    end
end

local function ontimerdone(inst, data)
    if data.name == "grow" then
        growtree(inst)
	inst.SoundEmitter:PlaySound("dontstarve/forest/treeGrow")
    end
end

local function digup(inst, digger)
	inst.components.lootdropper:DropLoot()
    inst:Remove()
end

local function sapling_fn(build, anim, growprefab, tag, fireproof, overrideloot)
    local function fn()
        local inst = CreateEntity()

        inst.entity:AddTransform()
        inst.entity:AddAnimState()
        inst.entity:AddSoundEmitter()
        inst.entity:AddNetwork()

        inst.AnimState:SetBank("teatree_nut")
        inst.AnimState:SetBuild("teatree_nut")
        inst.AnimState:PlayAnimation("idle_planted")

        inst:AddTag("cattoy")
		
        inst.entity:SetPristine()

        if not TheWorld.ismastersim then
            return inst
        end
		
        inst.growprefab = "teatree_short"
        inst.StartGrowing = startgrowing

        inst:AddComponent("timer")
        inst:ListenForEvent("timerdone", ontimerdone)
        startgrowing(inst)

        inst:AddComponent("inspectable")

        inst:AddComponent("lootdropper")
        inst.components.lootdropper:SetLoot(overrideloot or {"twigs"})

        inst:AddComponent("workable")
        inst.components.workable:SetWorkAction(ACTIONS.DIG)
        inst.components.workable:SetOnFinishCallback(digup)
        inst.components.workable:SetWorkLeft(1)

        if not fireproof then
            MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
            inst:ListenForEvent("onignite", stopgrowing)
            inst:ListenForEvent("onextinguish", startgrowing)
            MakeSmallPropagator(inst)

            MakeHauntableIgnite(inst)
        else
            MakeHauntableWork(inst)
        end

        return inst
    end
    return fn
end

return Prefab("kyno_teatree_sapling", sapling_fn("teatree_nut", "idle_planted", "teatree_short", "teatree", true), pinecone_assets, pinecone_prefabs)