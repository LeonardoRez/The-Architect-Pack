require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/python_fountain.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_fountainyouth.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_fountainyouth.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
}

local prefabs =
{
	"cutgrass",
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_big").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_stone")
	inst:Remove()
end

local function onhit(inst, worker)
	inst.AnimState:PlayAnimation("flow_loop")
	inst.AnimState:PushAnimation("flow_loop")
end

local function ontransplantfn(inst)
	inst.components.pickable:MakeBarren()
end

local function onpickedfn(inst, picker)
	inst.AnimState:PlayAnimation("flow_pst")
	inst.AnimState:PushAnimation("off")
	inst.dry = true
	inst:AddTag("IsDry")
end

local function getregentimefn(inst)
	if inst.components.pickable == nil then
        return TUNING.TOTAL_DAY_TIME
    end
	--[[
    local max_cycles = inst.components.pickable.max_cycles
    local cycles_left = inst.components.pickable.cycles_left or max_cycles
    local num_cycles_passed = math.max(0, max_cycles - cycles_left)
    return TUNING.BERRY_REGROW_TIME
        + TUNING.BERRY_REGROW_INCREASE * num_cycles_passed
        + TUNING.BERRY_REGROW_VARIANCE * math.random() ]]--
end

local function makefullfn(inst)
	inst.AnimState:PlayAnimation("flow_pre")
	inst.AnimState:PushAnimation("flow_loop")
	inst.dry = false
	inst:RemoveTag("IsDry")
	inst:AddTag("IsFull")
end

local function onsave(inst, data)
	if inst.dry and inst:HasTag("IsDry") then
		data.dry = true
	else
		data.dry = false
	end
end

local function onload(inst, data)
	if data and data.makebarren then
		makebarrenfn(inst)
		inst.components.pickable:MakeBarren()
	end
	if data and data.dry and inst:HasTag("IsDry") then
		inst.dry = true
		inst.AnimState:PlayAnimation("off", true)
		else
		inst.dry = false
		inst.AnimState:PlayAnimation("flow_loop", true)
	end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.AnimState:SetScale(0.90, 0.90, 0.90)
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_ruins_well.png")
	
	inst.AnimState:SetBank("fountain")
	inst.AnimState:SetBuild("python_fountain")
	inst.AnimState:PlayAnimation("flow_loop", true)
	
	MakeObstaclePhysics(inst, 2)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddTag("structure")
	inst:AddTag("pugalisk_fountain")
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	--[[
	inst:AddComponent("pickable")
	inst.components.pickable:SetUp(nil, nil)	
	inst.components.pickable.onpickedfn = onpickedfn
	inst.components.pickable.makefullfn = makefullfn
	inst.components.pickable.ontransplantfn = ontransplantfn
	inst.components.pickable.getregentimefn = getregentimefn
	inst.components.pickable.max_cycles = TUNING.BERRYBUSH_CYCLES + math.random(2)
    inst.components.pickable.cycles_left = inst.components.pickable.max_cycles
	inst.components.pickable.quickpick = false
	]]--
	
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	inst.OnSave = onsave 
    inst.OnLoad = onload

	return inst
end

local function fountainplacetestfn(inst)
	inst.AnimState:SetScale(0.90, 0.90, 0.90)
end

return Prefab("kyno_pugaliskfountain", fn, assets, prefabs),
MakePlacer("kyno_pugaliskfountain_placer", "fountain", "python_fountain", "flow_loop", false, nil, nil, nil, nil, nil, fountainplacetestfn)