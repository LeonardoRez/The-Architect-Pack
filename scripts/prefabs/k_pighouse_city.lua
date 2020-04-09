require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/pig_farmhouse_build.zip"),

	Asset("ANIM", "anim/pig_townhouse1.zip"),
    Asset("ANIM", "anim/pig_townhouse5.zip"),
    Asset("ANIM", "anim/pig_townhouse6.zip"),    

    Asset("ANIM", "anim/pig_townhouse1_pink_build.zip"),
    Asset("ANIM", "anim/pig_townhouse1_green_build.zip"),

    Asset("ANIM", "anim/pig_townhouse1_brown_build.zip"),
    Asset("ANIM", "anim/pig_townhouse1_white_build.zip"),

    Asset("ANIM", "anim/pig_townhouse5_beige_build.zip"),
    Asset("ANIM", "anim/pig_townhouse6_red_build.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_farmhouse.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_farmhouse.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_minimap_atlas_ham.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_minimap_atlas_ham.xml"),
	
	Asset("SOUND", "sound/pig.fsb"),
}

local prefabs =
{
    "pigman",
    "splash_sink",
}

local SCALEBUILD ={}
SCALEBUILD["pig_townhouse1_pink_build"] = true
SCALEBUILD["pig_townhouse1_green_build"] = true
SCALEBUILD["pig_townhouse1_white_build"] = true
SCALEBUILD["pig_townhouse1_brown_build"] = true

local SETBANK ={}
SETBANK["pig_townhouse1_pink_build"] = "pig_townhouse"
SETBANK["pig_townhouse1_green_build"] = "pig_townhouse"
SETBANK["pig_townhouse1_white_build"] = "pig_townhouse"
SETBANK["pig_townhouse1_brown_build"] = "pig_townhouse"
SETBANK["pig_townhouse5_beige_build"] = "pig_townhouse5"
SETBANK["pig_townhouse6_red_build"] = "pig_townhouse6"

local house_builds = {
   "pig_townhouse1_pink_build",
   "pig_townhouse1_green_build",
   "pig_townhouse1_white_build",
   "pig_townhouse1_brown_build",
   "pig_townhouse5_beige_build",
   "pig_townhouse6_red_build",   
}

local function setScale(inst,build)
    if SCALEBUILD[build] then
        inst.AnimState:SetScale(0.75,0.75,0.75)
    else
        inst.AnimState:SetScale(1,1,1)
    end
end

local function getScale(inst,build)
    if SCALEBUILD[build] then
        return {0.75,0.75,0.75}
    else
        return {1,1,1}
    end
end

local function LightsOn(inst)
    if not inst:HasTag("burnt") then
        inst.Light:Enable(true)
        inst.AnimState:PlayAnimation("lit", true)
        inst.SoundEmitter:PlaySound("dontstarve/pig/pighut_lighton")
        inst.lightson = true
    end
end

local function LightsOff(inst)
    if not inst:HasTag("burnt") then
        inst.Light:Enable(false)
        inst.AnimState:PlayAnimation("idle", true)
        inst.SoundEmitter:PlaySound("dontstarve/pig/pighut_lightoff")
        inst.lightson = false
    end
end

local function onfar(inst) 
    if not inst:HasTag("burnt") then
        if inst.components.spawner and inst.components.spawner:IsOccupied() then
            LightsOn(inst)
        end
    end
end

local function getstatus(inst)
    if inst:HasTag("burnt") then
        return "BURNT"
    elseif inst.components.spawner and inst.components.spawner:IsOccupied() then
        if inst.lightson then
            return "FULL"
        else
            return "LIGHTSOUT"
        end
    end
end

local function onnear(inst) 
    if not inst:HasTag("burnt") then
        if inst.components.spawner and inst.components.spawner:IsOccupied() then
            LightsOff(inst)
        end
    end
end

local function onwere(child)
    if child.parent ~= nil and not child.parent:HasTag("burnt") then
        child.parent.SoundEmitter:KillSound("pigsound")
        child.parent.SoundEmitter:PlaySound("dontstarve/pig/werepig_in_hut", "pigsound")
    end
end

local function onnormal(child)
    if child.parent ~= nil and not child.parent:HasTag("burnt") then
        child.parent.SoundEmitter:KillSound("pigsound")
        child.parent.SoundEmitter:PlaySound("dontstarve/pig/pig_in_hut", "pigsound")
    end
end

local function onoccupieddoortask(inst)
    inst.doortask = nil
    if not inst.components.playerprox:IsPlayerClose() then
        LightsOn(inst)
    end
end

local function onoccupied(inst, child)
    if not inst:HasTag("burnt") then 
        inst.SoundEmitter:PlaySound("dontstarve/pig/pig_in_hut", "pigsound")
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")

        if inst.doortask ~= nil then
            inst.doortask:Cancel()
        end
        inst.doortask = inst:DoTaskInTime(1, onoccupieddoortask)
        if child ~= nil then
            inst:ListenForEvent("transformwere", onwere, child)
            inst:ListenForEvent("transformnormal", onnormal, child)
        end
    end
end

local function onvacate(inst, child)
    if not inst:HasTag("burnt") then
        if inst.doortask ~= nil then
            inst.doortask:Cancel()
            inst.doortask = nil
        end
        inst.SoundEmitter:PlaySound("dontstarve/common/pighouse_door")
        inst.SoundEmitter:KillSound("pigsound")
        LightsOff(inst)

        if child ~= nil then
            inst:RemoveEventCallback("transformwere", onwere, child)
            inst:RemoveEventCallback("transformnormal", onnormal, child)
            if child.components.werebeast ~= nil then
                child.components.werebeast:ResetTriggers()
            end

            local child_platform = child:GetCurrentPlatform()
            if (child_platform == nil and not child:IsOnValidGround()) then
                local fx = SpawnPrefab("splash_sink")
                fx.Transform:SetPosition(child.Transform:GetWorldPosition())

                child:Remove()
            else
                if child.components.health ~= nil then
                    child.components.health:SetPercent(1)
                end
			    child:PushEvent("onvacatehome")
            end
        end
    end
end

local function onhammered(inst, worker)
    if inst.components.burnable ~= nil and inst.components.burnable:IsBurning() then
        inst.components.burnable:Extinguish()
    end
    if inst.doortask ~= nil then
        inst.doortask:Cancel()
        inst.doortask = nil
    end
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        inst.components.spawner:ReleaseChild()
    end
    inst.components.lootdropper:DropLoot()
    local fx = SpawnPrefab("collapse_big")
    fx.Transform:SetPosition(inst.Transform:GetWorldPosition())
    fx:SetMaterial("wood")
    inst:Remove()
end

local function onhit(inst, worker)
    if not inst:HasTag("burnt") then 
        inst.AnimState:PlayAnimation("hit")
        if inst.lightson then
            inst.AnimState:PushAnimation("lit")
            if inst._window ~= nil then
                inst._window.AnimState:PlayAnimation("windowlight_hit")
                inst._window.AnimState:PushAnimation("windowlight_idle")
            end
            if inst._windowsnow ~= nil then
                inst._windowsnow.AnimState:PlayAnimation("windowsnow_hit")
                inst._windowsnow.AnimState:PushAnimation("windowsnow_idle")
            end
        else
            inst.AnimState:PushAnimation("idle")
        end
    end
end

local function onstartdaydoortask(inst)
    inst.doortask = nil
    if not inst:HasTag("burnt") then
        inst.components.spawner:ReleaseChild()
    end
end

local function onstartdaylighttask(inst)
    if inst.LightWatcher:GetLightValue() > 0.8 then -- they have their own light! make sure it's brighter than that out.
        LightsOff(inst)
        inst.doortask = inst:DoTaskInTime(1 + math.random() * 2, onstartdaydoortask)
    elseif TheWorld.state.iscaveday then
        inst.doortask = inst:DoTaskInTime(1 + math.random() * 2, onstartdaylighttask)
    else
        inst.doortask = nil
    end
end

local function OnStartDay(inst)
    --print(inst, "OnStartDay")
    if not inst:HasTag("burnt")
        and inst.components.spawner:IsOccupied() then

        if inst.doortask ~= nil then
            inst.doortask:Cancel()
        end
        inst.doortask = inst:DoTaskInTime(1 + math.random() * 2, onstartdaylighttask)
    end
end

local function onbuilt(inst)
    inst.AnimState:PlayAnimation("place")
    inst.AnimState:PushAnimation("idle")
end

local function onburntup(inst)
    if inst.doortask ~= nil then
        inst.doortask:Cancel()
        inst.doortask = nil
    end
    if inst.inittask ~= nil then
        inst.inittask:Cancel()
        inst.inittask = nil
    end
    if inst._window ~= nil then
        inst._window:Remove()
        inst._window = nil
    end
    if inst._windowsnow ~= nil then
        inst._windowsnow:Remove()
        inst._windowsnow = nil
    end
end

local function onignite(inst)
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        inst.components.spawner:ReleaseChild()
    end
end

local function setcolor(inst,num)
    if not num then
        num = math.random()
    end
    local color = 0.5 + num * 0.5
    inst.AnimState:SetMultColour(color, color, color, 1)
    return num
end

local function onsave(inst, data)
    if inst:HasTag("burnt") or inst:HasTag("fire") then
        data.burnt = true
    end
    data.build = inst.build
    data.animset = inst.animset
    data.colornum = inst.colornum
end

local function onload(inst, data)
    if data then
        if data.build then
            inst.build = data.build
            inst.AnimState:SetBuild(inst.build) 
            setScale(inst,inst.build)
        end
        if data.animset then
            inst.animset = data.animset
            inst.AnimState:SetBank( inst.animset )
        end    
        if data.colornum then
            inst.colornum = setcolor(inst, data.colornum)
        end
        if data.burnt then
            inst.components.burnable.onburnt(inst)
        end
    end
end

local function spawncheckday(inst)
    inst.inittask = nil
    inst:WatchWorldState("startcaveday", OnStartDay)
    if inst.components.spawner ~= nil and inst.components.spawner:IsOccupied() then
        if TheWorld.state.iscaveday or
            (inst.components.burnable ~= nil and inst.components.burnable:IsBurning()) then
            inst.components.spawner:ReleaseChild()
        else
            inst.components.playerprox:ForceUpdate()
            onoccupieddoortask(inst)
        end
    end
end

local function oninit(inst)
    inst.inittask = inst:DoTaskInTime(math.random(), spawncheckday)
    if inst.components.spawner ~= nil and
        inst.components.spawner.child == nil and
        inst.components.spawner.childname ~= nil and
        not inst.components.spawner:IsSpawnPending() then
        local child = SpawnPrefab(inst.components.spawner.childname)
        if child ~= nil then
            inst.components.spawner:TakeOwnership(child)
            inst.components.spawner:GoHome(child)
        end
    end
end

local function makefn(animset, setbuild)
	local function fn(Sim)
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddLight()
	inst.entity:AddLightWatcher()
	inst.entity:AddNetwork()

	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("pig_townhouse.png")
	
	inst.Light:SetFalloff(1)
    inst.Light:SetIntensity(.5)
    inst.Light:SetRadius(1)
    inst.Light:Enable(false)
    inst.Light:SetColour(180/255, 195/255, 50/255)
	
	local build = house_builds[math.random(1,#house_builds)]        
        if setbuild then
            build = setbuild
        end
        inst.build = build
        inst.AnimState:SetBuild(build) 
        inst.animset = nil
        if animset then
            inst.AnimState:SetBank(animset)
            inst.animset = animset
        else            
            inst.AnimState:SetBank(SETBANK[build])            
            inst.animset = SETBANK[build]
        end
        setScale(inst,build)
	inst.AnimState:PlayAnimation("idle", true)
	
	inst.colornum = setcolor(inst)
    local color = 0.5 + math.random() * 0.5
    inst.AnimState:SetMultColour(color, color, color, 1)
	
	MakeObstaclePhysics(inst, 1)
	
	inst:AddTag("structure")
	inst:AddTag("pighouse")
	inst:AddTag("pigtownhouse")

	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst:AddComponent("inspectable")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
    inst:AddComponent("lootdropper")
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	inst.components.workable:SetWorkLeft(4)
	
	inst:AddComponent("spawner")
    inst.components.spawner:Configure("pigman", TUNING.TOTAL_DAY_TIME*4)
    inst.components.spawner.onoccupied = onoccupied
    inst.components.spawner.onvacate = onvacate
    inst.components.spawner:SetWaterSpawning(false, true)
    inst.components.spawner:CancelSpawning()

    inst:AddComponent("playerprox")
    inst.components.playerprox:SetDist(10, 13)
    inst.components.playerprox:SetOnPlayerNear(onnear)
    inst.components.playerprox:SetOnPlayerFar(onfar)
	
	MakeMediumBurnable(inst, nil, nil, true)
	MakeLargePropagator(inst)
	inst:ListenForEvent("burntup", function(inst)
		if inst.doortask then
			inst.doortask:Cancel()
			inst.doortask = nil
		end
		inst:Remove()
	end)
		inst:ListenForEvent("onignite", function(inst)
            if inst.components.spawner and inst.components.spawner:IsOccupied() then
				inst.components.spawner:ReleaseChild()
            end
	end)
	
    inst.OnSave = onsave 
    inst.OnLoad = onload

    MakeHauntableWork(inst)
	
	MakeSnowCovered(inst, .01)

    inst:ListenForEvent("onbuilt", onbuilt)
    inst.inittask = inst:DoTaskInTime(0, oninit)

		return inst
	end
	return fn
end

local function townhouseplacetestfn(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
	inst.AnimState:SetScale(0.75,0.75,0.75)
    return true
end

local function farmhouseplacetestfn(inst)
    inst.AnimState:Hide("YOTP")
    inst.AnimState:Hide("SNOW")
    return true
end

local function house(name, anim, build)
    return Prefab("kyno_"..name, makefn(anim, build), assets, prefabs)
end

return house("pighouse_city",nil,nil),
house("pighouse_farm","pig_shop","pig_farmhouse_build"),
MakePlacer("kyno_pighouse_city_placer", "pig_shop", "pig_townhouse1_green_build", "idle", false, nil, nil, nil, nil, nil, townhouseplacetestfn),
MakePlacer("kyno_pighouse_farm_placer", "pig_shop", "pig_farmhouse_build", "idle", false, nil, nil, nil, nil, nil, farmhouseplacetestfn)