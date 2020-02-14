require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sandbag_small.zip"),
	Asset("ANIM", "anim/sandbag.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_sandbagsmall_item.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_sandbagsmall_item.xml"),
}

local prefabs =
{
	"gridplacer",
	"kyno_sandbagsmall_item",
}

local anims =
{
    { threshold = 0, anim = "rubble" },
    { threshold = 0.4, anim = "heavy_damage" },
    { threshold = 0.5, anim = "half" },
    { threshold = 0.99, anim = "light_damage" },
    { threshold = 1, anim = { "full", "full", "full" } },
}

local function resolveanimtoplay(inst, percent)
	for i, v in ipairs(anims) do
		if percent <= v.threshold then
			if type(v.anim) == "table" then
				local x, y, z = inst.Transform:GetWorldPosition()
				local x = math.floor(x)
				local z = math.floor(z)
				local q1 = #v.anim + 1
				local q2 = #v.anim + 4
				local t = ( ((x%q1)*(x+3)%q2) + ((z%q1)*(z+3)%q2) )% #v.anim + 1
				return v.anim[t]
			else
				return v.anim
			end
		end
	end
end

local function OnIsPathFindingDirty(inst)    
    local wall_x, wall_y, wall_z = inst.Transform:GetWorldPosition()
    if TheWorld.Map:GetPlatformAtPoint(wall_x, wall_z) == nil then        
        if inst._ispathfinding:value() then
            if inst._pfpos == nil then
                inst._pfpos = Point(wall_x, wall_y, wall_z)
                TheWorld.Pathfinder:AddWall(wall_x, wall_y, wall_z)
            end
        elseif inst._pfpos ~= nil then
            TheWorld.Pathfinder:RemoveWall(wall_x, wall_y, wall_z)
            inst._pfpos = nil
        end
    end
end

local function InitializePathFinding(inst)
    inst:ListenForEvent("onispathfindingdirty", OnIsPathFindingDirty)
    OnIsPathFindingDirty(inst)
end

local function makeobstacle(inst)
    inst.Physics:SetActive(true)
    inst._ispathfinding:set(true)
end

local function clearobstacle(inst)
    inst.Physics:SetActive(false)
    inst._ispathfinding:set(false)
end

local function ondeploy(inst, pt, deployer)
	local wall = SpawnPrefab("kyno_sandbagsmall") 
	-- local ground = TheWorld.Map:GetTileAtPoint(x,y,z)
	if wall ~= nil then 
		local x = math.floor(pt.x) + .5
		local z = math.floor(pt.z) + .5
		wall.Physics:SetCollides(false)
		wall.Physics:Teleport(x, 0, z)
		wall.Physics:SetCollides(true)
		wall.SoundEmitter:PlaySound("dontstarve/common/place_structure_straw")
		inst.components.stackable:Get():Remove()
        makeobstacle(wall)    
	end
end

local function onhammered(inst, worker)
	local max_loots = 2
	local num_loots = math.max(1, math.floor(max_loots*inst.components.health:GetPercent()))
	for k = 1, num_loots do
		inst.components.lootdropper:SpawnLootPrefab("turf_desertdirt")
	end
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst:Remove()
end

local function onhealthchange(inst, old_percent, new_percent)
	if old_percent <= 0 and new_percent > 0 then makeobstacle(inst) end
	if old_percent > 0 and new_percent <= 0 then clearobstacle(inst) end
	local anim_to_play = resolveanimtoplay(inst, new_percent)
	inst.AnimState:PlayAnimation(anim_to_play)
end

local function onhit(inst)
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_straw")
	local healthpercent = inst.components.health:GetPercent()
	local anim_to_play = resolveanimtoplay(inst, healthpercent)
	inst.AnimState:PlayAnimation(anim_to_play)		
end

local function onrepaired(inst)
	inst.SoundEmitter:PlaySound("dontstarve/common/place_structure_straw")		
	makeobstacle(inst)
end

local function onremoveentity(inst)
	clearobstacle(inst)
	inst._ispathfinding:set_local(false)
end

local function onload(inst, data)
	makeobstacle(inst)
	if inst.components.health:GetPercent() <= 0 then
		clearobstacle(inst)
	end
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.Transform:SetEightFaced()
	
	inst.AnimState:SetBank("sandbag_small")
	inst.AnimState:SetBuild("sandbag_small")
	inst.AnimState:PlayAnimation("full", false)
	
	MakeObstaclePhysics(inst, 1)
	inst.Physics:SetDontRemoveOnSleep(true)
	
	inst._pfpos = nil
	inst._ispathfinding = net_bool(inst.GUID, "_ispathfinding", "onispathfindingdirty")
	makeobstacle(inst)
	--Delay this because makeobstacle sets pathfinding on by default
	--but we don't to handle it until after our position is set
	inst:DoTaskInTime(0, InitializePathFinding)
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("structure")
	inst:AddTag("floodblocker")
	inst:AddTag("sandbag")
	inst:AddTag("wall")
	inst:AddTag("noauradamage")

	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("repairable")
	inst.components.repairable.repairmaterial = "kyno_sandbagsmall"
	inst.components.repairable.onrepaired = onrepaired
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	inst:AddComponent("combat")
	inst.components.combat.onhitfn = onhit
	
	inst:AddComponent("health")
	inst.components.health:SetMaxHealth(300)
	inst.components.health.currenthealth = 300
	inst.components.health.ondelta = onhealthchange
	inst.components.health.nofadeout = true
	inst.components.health.canheal = false

    inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetWorkLeft(3)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)

	MakeMediumBurnable(inst)
	MakeLargePropagator(inst)
	inst.components.burnable.flammability = .5
	inst.components.burnable.nocharring = true
	inst.components.propagator.flashpoint = 30 + math.random() * 10
	
	inst.OnLoad = onload
	inst.OnRemoveEntity = onremoveentity

	return inst
end

local function itemfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	MakeInventoryPhysics(inst)
	
	inst.AnimState:SetBank("sandbag")
	inst.AnimState:SetBuild("sandbag")
	inst.AnimState:PlayAnimation("idle")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddTag("wallbuilder")
	
	inst:AddComponent("repairer")
	inst.components.repairer.repairmaterial = "kyno_sandbagsmall"
	inst.components.repairer.healthrepairvalue = 300 / 2
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_MEDITEM
	
	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_sandbagsmall_item.xml"
	
	inst:AddComponent("deployable")
	inst.components.deployable:SetDeployMode(DEPLOYMODE.WALL)
	-- inst.components.deployable:SetDeploySpacing(DEPLOYSPACING.MEDIUM)
	-- inst._custom_candeploy_fn = candeploy
	inst.components.deployable.ondeploy = ondeploy
	
	return inst
end

return Prefab("kyno_sandbagsmall", fn, assets, prefabs),
Prefab("kyno_sandbagsmall_item", itemfn, assets, prefabs),
MakePlacer("kyno_sandbagsmall_item_placer", "sandbag_small", "sandbag_small", "full") -- false, false, false, 1.0, true, nil, "eight")