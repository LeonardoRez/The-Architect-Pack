require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/sandbag_small.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_sw.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_sw.xml"),
}

local prefabs =
{
	"gridplacer",
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
				-- get a stable animation, by basing it on world position
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

local function makeobstacle(inst)
	inst.Physics:SetCollisionGroup(COLLISION.OBSTACLES)	
    inst.Physics:ClearCollisionMask()
	inst.Physics:SetMass(0)
	inst.Physics:CollidesWith(COLLISION.ITEMS)
	inst.Physics:CollidesWith(COLLISION.CHARACTERS)
	inst.Physics:CollidesWith(COLLISION.WAVES)
	inst.Physics:SetActive(true)
	
	local ground = TheWorld()
	if ground then
		local pt = Point(inst.Transform:GetWorldPosition())
		ground.Pathfinder:AddWall(pt.x + 0.5, pt.y, pt.z + 0.5)
		ground.Pathfinder:AddWall(pt.x + 0.5, pt.y, pt.z - 0.5)
		ground.Pathfinder:AddWall(pt.x - 0.5, pt.y, pt.z + 0.5)
		ground.Pathfinder:AddWall(pt.x - 0.5, pt.y, pt.z - 0.5)
	end
end

local function quantizepos(pt)
	local x, y, z = pt:Get()
	y = 0
	
	if TheWorld().Flooding then
		local px,py,pz = TheWorld().Flooding:GetTileCenterPoint(x,y,z)
		return Vector3(px,py,pz)
	else
		return Vector3(x,y,z)
	end
end

local function ondeploy(inst, pt, deployer)
	local wall = SpawnPrefab("kyno_sandbagsmall") 
	local ground = TheWorld()
	
	if wall then
		
		pt = quantizepos(pt)

		wall.Physics:SetCollides(false)
		wall.Physics:Teleport(pt.x, pt.y, pt.z) 
		wall.Physics:SetCollides(true)
		-- wall.SoundEmitter:PlaySound("dontstarve_DLC002/common/sandbag")
		inst.components.stackable:Get():Remove()
		makeobstacle(wall)
	end
end

local function clearobstacle(inst)
	inst:DoTaskInTime(2*FRAMES, function() inst.Physics:SetActive(false) end)

	local ground = TheWorld()
	if ground then
		local pt = Point(inst.Transform:GetWorldPosition())
		ground.Pathfinder:RemoveWall(pt.x + 0.5, pt.y, pt.z + 0.5)
		ground.Pathfinder:RemoveWall(pt.x + 0.5, pt.y, pt.z - 0.5)
		ground.Pathfinder:RemoveWall(pt.x - 0.5, pt.y, pt.z + 0.5)
		ground.Pathfinder:RemoveWall(pt.x - 0.5, pt.y, pt.z - 0.5)
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
	-- inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/sandbag")		
	local healthpercent = inst.components.health:GetPercent()
	local anim_to_play = resolveanimtoplay(inst, healthpercent)
	inst.AnimState:PlayAnimation(anim_to_play)		
end

local function onrepaired(inst)
	-- inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/sandbag")		
	makeobstacle(inst)
end

local function test_wall(inst, pt)
	local map = TheWorld().Map
	local tiletype = GetGroundTypeAtPosition(pt)
	local ground_OK = tiletype ~= GROUND.IMPASSABLE and not map:IsWater(tiletype)
	if ground_OK then
		local ents = TheSim:FindEntities(pt.x,pt.y,pt.z, 2, nil, {"NOBLOCK", "player", "FX", "INLIMBO", "DECOR"}) -- or we could include a flag to the search?

		for k, v in pairs(ents) do
			if v ~= inst and v:IsValid() and v.entity:IsVisible() and not v.components.placer and v.parent == nil then
				local dsq = distsq( Vector3(v.Transform:GetWorldPosition()), pt)
				if v:HasTag("sandbag") then
					if dsq < .1 then 
						return false 
					end
				else
					if  dsq< 1 then 
						return false 
					end
				end
			end
		end

		local playerPos = GetPlayer():GetPosition()
		local xDiff = playerPos.x - pt.x 
		local zDiff = playerPos.z - pt.z 
		local dsq = xDiff * xDiff + zDiff * zDiff
		if dsq < 1 then 
			return false 
		end 
		return true
	end
	return false	
end

local function onremoveentity(inst)
	clearobstacle(inst)
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
	inst.entity:SetEightFaced()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("sandbag_small")
	inst.AnimState:SetBuild("sandbag_small")
	inst.AnimState:PlayAnimation("full", false)
	
	MakeObstaclePhysics(inst, 1) 
	
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

	inst.OnLoad = onload
	inst.OnRemoveEntity = onremoveentity

	return inst
end

return Prefab("kyno_sandbagsmall", fn, assets, prefabs),
MakePlacer("kyno_sandbagsmall_placer", "sandbag_small", "sandbag_small", "full")