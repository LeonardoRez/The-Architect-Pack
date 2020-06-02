require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/ant_chest.zip"),
	Asset("ANIM", "anim/ant_chest_honey_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_antchest.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_antchest.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local prefabs = {
	"honey",
}

local function testitem_honeychest(inst, item, slot)
	return item.prefab == "honey"
end

local function onopen(inst) 
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("open")
		inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/honey_chest/open")
	end
end

local function onclose(inst)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("close")
		inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/honey_chest/open")
	end
end

local function onhammered(inst, worker)
    if inst:HasTag("fire") and inst.components.burnable then
        inst.components.burnable:Extinguish()
    end
	inst.components.lootdropper:DropLoot()
	if inst.components.container then inst.components.container:DropEverything() end
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
	if not inst:HasTag("burnt") then
		inst.AnimState:PlayAnimation("hit")
		inst.AnimState:PushAnimation("closed", true)
		if inst.components.container then 
			inst.components.container:DropEverything() 
			inst.components.container:Close()
		end
	end
end

local function onbuilt(inst)
	inst.AnimState:PlayAnimation("close")
	inst.AnimState:PushAnimation("closed", true)
	inst.SoundEmitter:PlaySound("dontstarve/common/craftable/chest")
end	

local function onsave(inst, data)
	if inst:HasTag("burnt") or inst:HasTag("fire") then
		data.burnt = true
	end
end

local function onload(inst, data)
	if data and data.burnt then
		inst.components.burnable.onburnt(inst)
	end
end

local function RefreshAntChestBuild(inst, minimap)
    local containsHoney = inst.components.container:Has("honey", 1)
    if containsHoney then
        inst.AnimState:SetBuild("ant_chest_honey_build")
        minimap:SetIcon("ant_chest_honey.png")
        local items = inst.components.container:FindItems(function(v) return v.prefab=="honey" end)
        for k, v in pairs(items) do
          v.components.perishable:StopPerishing()
        end
    else
        inst.AnimState:SetBuild("ant_chest")
        minimap:SetIcon("ant_chest.png")
    end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("ant_chest.png")
	
	inst.AnimState:SetBank("ant_chest")
	inst.AnimState:SetBuild("ant_chest")
	inst.AnimState:PlayAnimation("closed", true)
	
	inst:AddTag("structure")
	inst:AddTag("antchest")
	inst:AddTag("chest")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("container")
    inst.components.container:WidgetSetup("treasurechest")

    inst.components.container.onopenfn = onopen
    inst.components.container.onclosefn = onclose
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(2)
	
	-- MakeMediumBurnable(inst, nil, nil, true)
    -- MakeLargePropagator(inst)
   
	MakeSnowCovered(inst, 0.01)
   
	inst:ListenForEvent("onbuilt", onbuilt)
	
	-- inst.components.container.itemtestfn = testitem_honeychest
    inst:ListenForEvent("itemget", function() RefreshAntChestBuild(inst, minimap) end)
	inst:ListenForEvent("itemlose", function() RefreshAntChestBuild(inst, minimap) end)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

return Prefab("kyno_antchest", fn, assets, prefabs),
MakePlacer("kyno_antchest_placer", "ant_chest", "ant_chest", "closed")