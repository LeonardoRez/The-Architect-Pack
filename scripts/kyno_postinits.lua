local _G = GLOBAL
local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local TECH = GLOBAL.TECH
local Ingredient = GLOBAL.Ingredient
local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local resolvefilepath = GLOBAL.resolvefilepath
local ACTIONS = GLOBAL.ACTIONS
local ActionHandler = GLOBAL.ActionHandler
local SpawnPrefab = GLOBAL.SpawnPrefab
local KENV = env
local TheSim = GLOBAL.TheSim

TUNING.BIRD_PERISH_TIME = 999999
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
modimport "scripts/kyno_assets"
modimport "libs/env"
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("coconut", function(inst)	
	if inst.components.perishable ~= nil then
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("teatree_nut", function(inst)	
	if inst.components.perishable ~= nil then
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_limestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_enforcedlimestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_enforcedlimestone_land_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_turfs_sw_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_pig_ruins_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/wall_pig_ruins_item.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_lamppost", function(inst)
	local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 0 then
    inst.AnimState:AddOverrideBuild("lamp_post2_yotp_build")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_spa", function(inst)
	local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_flower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_general", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_deli", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_produce", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_antiquities", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_arcane", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_weapons", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_hatshop", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_bank", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_tinker", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_academy", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_cityhall", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_mycityhall", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigpalacetower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower2", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower3", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pighouse_city", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function new_DoDelta(self, amount)
    local oldsection = self:GetCurrentSection()
    local newsection = (self:GetCurrentSection() + 1) % 5

	self.currentfuel = math.max(0, math.min(self.maxfuel, self.maxfuel * (newsection-0.5)/4.0) )

    if oldsection ~= newsection then
        if self.sectionfn then
            self.sectionfn(newsection, oldsection, self.inst, doer)
        end
        self.inst:PushEvent("onfueldsectionchanged", { newsection = newsection, oldsection = oldsection, doer = doer })
        if self.currentfuel <= 0 and self.depleted then
            self.depleted(self.inst)
        end
    end

    self:StopConsuming()
    self.inst:PushEvent("percentusedchange", { percent = self:GetPercent() })
end

local function InfiniteLight(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end

	inst:AddTag('eternal')
	local fueled = inst.components.fueled
	if fueled then
		fueled:StopConsuming()
		fueled.DoDelta = new_DoDelta
	end
end

AddPrefabPostInit("kyno_brazier", InfiniteLight)
AddPrefabPostInit("nightlight", InfiniteLight)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_block_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_cone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_layered_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_block_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_block_aged_item.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_cone_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_cone_aged_item.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_layered_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_layered_aged_item.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddComponentPostInit(
    "locomotor",
    function(inst)
        local old = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.COBBLEROAD
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old2 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old2(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.PINKSTONE
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old3 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old3(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.STONECITY
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old4 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old4(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.FORGEROAD
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old5 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old5(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.HERRING
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old6 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old6(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.CHESS
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
    "locomotor",
    function(inst)
        local old7 = inst.UpdateGroundSpeedMultiplier
        inst.UpdateGroundSpeedMultiplier = function(self)
            old7(self)
            if
                self.wasoncreep == false and self:FasterOnRoad() and
                    GLOBAL.TheWorld.Map:GetTileAtPoint(self.inst.Transform:GetWorldPosition()) == GROUND.MODERN_COBBLESTONES
             then
                self.groundspeedmultiplier = self.fastmultiplier
            end
        end
    end
)

AddComponentPostInit(
	"locomotor", 
	function(self)
	if not self.inst:HasTag("flying") then
		local _UGSM = self.UpdateGroundSpeedMultiplier
		self.UpdateGroundSpeedMultiplier = function(self)
			_UGSM(self)
			local tile, data = self.inst:GetCurrentTileType()
			if tile == GLOBAL.GROUND.STICKY then
				if self.carpetfast == nil then
					self:SetExternalSpeedMultiplier(self.inst, "CarpetSpeed", GetModConfigData("honeyed"))
					self.carpetfast = true
				end
			else
				if self.carpetfast == true then
					self:RemoveExternalSpeedMultiplier(self.inst, "CarpetSpeed")
					self.carpetfast = nil
				end
			end
		end
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
packim_chance = GetModConfigData("packim_baggims")
GLOBAL.SetSharedLootTable("malbatross_packim",
{
	{'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'meat',                                1.00},
    {'malbatross_beak',                     1.00},
    {'mast_malbatross_item_blueprint',      1.00},
    {'malbatross_feathered_weave_blueprint',1.00},
    {'bluegem',                             1},
    {'bluegem',                             1},
    {'bluegem',                             0.3},
    {'yellowgem',                           0.05},
	{'oceanfishingbobber_malbatross_tacklesketch',1.00},
	{'chesspiece_malbatross_sketch',		1.00},
	{"packim_fishbone",						  packim_chance},
})

AddPrefabPostInit("malbatross", function(inst)
	if GLOBAL.TheWorld.ismastersim and not GLOBAL.TheSim:FindFirstEntityWithTag("packim_fishbone") then
		inst.components.lootdropper:SetChanceLootTable("malbatross_packim")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_irongate_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_irongate_item.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function PugaliskTrapdoor(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst:AddTag("PUGALISK_CANT_EAT")
end

local function TagMe(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst:AddTag("KeyReplica")
end

AddPrefabPostInit("chester_eyebone", PugaliskTrapdoor)
AddPrefabPostInit("packim_fishbone", PugaliskTrapdoor)
AddPrefabPostInit("glommerflower", PugaliskTrapdoor)
AddPrefabPostInit("moonrockseed", PugaliskTrapdoor)
AddPrefabPostInit("hutch_fishbowl", PugaliskTrapdoor)
AddPrefabPostInit("atrium_key", PugaliskTrapdoor)
AddPrefabPostInit("atrium_key", TagMe)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
    if inst.components.inventoryitem ~= nil and not inst.components.tradable and not inst:HasTag("PUGALISK_CANT_EAT") then 
	inst:AddComponent("tradable")
	inst:AddTag("PUGALISK_TEST")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
GLOBAL.DEPLOYSPACING.MIN = 6
GLOBAL.DEPLOYSPACING_RADIUS[GLOBAL.DEPLOYSPACING.MIN] = .5

AddPrefabPostInit("butterfly", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst.components.deployable:SetDeployMode(GLOBAL.DEPLOYMODE.PLANT)
		inst.components.deployable:SetDeploySpacing(GLOBAL.DEPLOYSPACING.MIN)
	end
end
)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
robin_chance = GetModConfigData("ro_bin")
GLOBAL.SetSharedLootTable("minotaur_robin",
{
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"meat",        1.00},
    {"minotaurhorn",1.00},
	{"kyno_ornatechest_large_blueprint", 1.00},
	{"ro_bin_gizzard_stone", robin_chance},
	{"chesspiece_minotaur_sketch", 1.00},
})

AddPrefabPostInit("minotaur", function(inst)
	if GLOBAL.TheWorld.ismastersim and not GLOBAL.TheSim:FindFirstEntityWithTag("ro_bin_gizzard_stone") and not GLOBAL.TheSim:FindFirstEntityWithTag("ro_bin") then
		inst.components.lootdropper:SetChanceLootTable("minotaur_robin")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function InfiniteFestiveLight(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	inst:AddTag("festive_infinite")
	if inst.components.fueled then
		if inst.components.inventoryitem then
			local old_ondropfn = inst.components.inventoryitem.ondropfn
			inst.components.inventoryitem:SetOnDroppedFn(function(inst)
				old_ondropfn(inst)
				inst.components.fueled:StopConsuming()
			end)
		end
		inst.components.fueled:StopConsuming()
	end
end

AddPrefabPostInit("winter_ornament_light1", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light2", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light3", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light4", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light5", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light6", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light7", InfiniteFestiveLight)
AddPrefabPostInit("winter_ornament_light8", InfiniteFestiveLight)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kingfisher", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("pigeon", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("parrot_blue", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("toucan_hamlet", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/toucan_hamlet.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("toucan", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("parrot", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("parrot_pirate", function(inst)
	inst.AnimState:SetBank("crow_pirate") 
	inst.AnimState:SetBuild("parrot_pirate_build")
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("seagull", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("cormorant", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("quagmire_pigeon", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("seagull_water", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local COFFEE = GetModConfigData("coffee_hack")
if COFFEE == 0 then
GLOBAL.SetSharedLootTable("dragonfly_coffee_winter",
{
    {"dragon_scales",             1.00},
	{"dragonflyfurnace_blueprint", 1.00},
    {"kyno_frozenfurnace_blueprint", 1.00},
    {"chesspiece_dragonfly_sketch", 1.00},
    {"lavae_egg",                 0.33},

    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},

    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},

    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        1.00},
    {"orangegem",        1.00},
    {"yellowgem",        1.00},
    {"greengem",         1.00},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        0.50},
    {"orangegem",        0.50},
    {"yellowgem",        0.50},
    {"greengem",         0.50},
	
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
})

GLOBAL.SetSharedLootTable("dragonfly_coffee",
{
    {"dragon_scales",             1.00},
    {"dragonflyfurnace_blueprint", 1.00},
    {"chesspiece_dragonfly_sketch", 1.00},
    {"lavae_egg",                 0.33},

    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},

    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},

    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        1.00},
    {"orangegem",        1.00},
    {"yellowgem",        1.00},
    {"greengem",         1.00},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        0.50},
    {"orangegem",        0.50},
    {"yellowgem",        0.50},
    {"greengem",         0.50},
	
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
	{"dug_coffeebush", 1.00},
})
	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			if GLOBAL.TheWorld.state.iswinter then
				inst.components.lootdropper:SetChanceLootTable("dragonfly_coffee_winter")
			else
				inst.components.lootdropper:SetChanceLootTable("dragonfly_coffee")
			end
		end
	end)
end

if COFFEE == 1 then
GLOBAL.SetSharedLootTable("dragonfly_winter",
{
    {"dragon_scales",             1.00},
	{"dragonflyfurnace_blueprint", 1.00},
    {"kyno_frozenfurnace_blueprint", 1.00},
    {"chesspiece_dragonfly_sketch", 1.00},
    {"lavae_egg",                 0.33},

    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},

    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},

    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        1.00},
    {"orangegem",        1.00},
    {"yellowgem",        1.00},
    {"greengem",         1.00},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        0.50},
    {"orangegem",        0.50},
    {"yellowgem",        0.50},
    {"greengem",         0.50},
})

GLOBAL.SetSharedLootTable("dragonfly",
{
    {"dragon_scales",             1.00},
    {"dragonflyfurnace_blueprint", 1.00},
    {"chesspiece_dragonfly_sketch", 1.00},
    {"lavae_egg",                 0.33},

    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},
    {"meat",             1.00},

    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},
    {"goldnugget",       1.00},

    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},
    {"goldnugget",       0.50},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        1.00},
    {"orangegem",        1.00},
    {"yellowgem",        1.00},
    {"greengem",         1.00},

    {"redgem",           1.00},
    {"bluegem",          1.00},
    {"purplegem",        0.50},
    {"orangegem",        0.50},
    {"yellowgem",        0.50},
    {"greengem",         0.50},
})

	AddPrefabPostInit("dragonfly", function(inst)
		if GLOBAL.TheWorld.ismastersim then
			if GLOBAL.TheWorld.state.iswinter then
				inst.components.lootdropper:SetChanceLootTable("dragonfly_winter")
			else
				inst.components.lootdropper:SetChanceLootTable("dragonfly")
			end
		end
	end)
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function rename_it(inst)
    inst.components.named:PickNewName()
end

AddPrefabPostInit("mandrake_planted", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Green Carrot", "Talking Carrot", "Mandrake" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_altar_seed", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Celestial Altar Orb", "They will save you" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_altar_idol", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Celestial Altar Idol", "Impending doom approaches" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_altar_glass", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Celestial Altar Base", "You don't know them" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_altar_crown", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Celestial Tribute", "They are coming" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("critterlab", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Devil's Den", "Demons Crew", "Rock Den", "Waste Your Food Here" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_relic_1", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_relic_2", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_relic_3", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_relic_4", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_relic_5", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pherostone", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_oinc1", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_oinc10", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_oinc100", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("cavein_boulder", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "Boulder", "Antlion's Boulder", "Forever Alone Boulder" }
		inst.components.named:PickNewName()
		inst:DoPeriodicTask(5, rename_it)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("moose", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_goosenestegg_blueprint", 1.00)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("beequeen", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_antchest_blueprint", 1.00)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("leif", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_treeclump_blueprint", 0.10) -- 10% Drop Chance
	end
end)

AddPrefabPostInit("leif_sparse", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_treeclump_blueprint", 0.10) -- 10% Drop Chance
	end
end)

AddPrefabPostInit("livingtree", function(inst)
if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_truerootchest_blueprint", 0.25) -- 25% Drop Chance
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("spiderqueen", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("cocoonedtree_short_blueprint", 0.33) -- 33% Drop Chance
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("deerclops", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("kyno_snowman_blueprint", 1.00)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("piratepack", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons.xml"
	inst.components.inventoryitem.imagename = "piratepack"
	inst.components.inventoryitem:ChangeImageName("piratepack")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local _onequipfn
local function onequipfn(self, owner)
	owner:AddTag("bramble_resistant")
	return _onequipfn(self, owner)
end

local _onunequipfn
local function onunequipfn(self, owner)
	owner:RemoveTag("bramble_resistant")
	return _onunequipfn(self, owner)
end 

KENV.AddPrefabPostInit("armor_bramble", function(inst)
	if TheWorld.ismastersim then
	_onequipfn = inst.components.equippable.onequipfn
	inst.components.equippable.onequipfn = onequipfn
	
	_onunequipfn = inst.components.equippable.onunequipfn
	inst.components.equippable.onunequipfn = onunequipfn	
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_redflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_redflies.xml"
	end
end)

AddPrefabPostInit("kyno_orangeflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_orangeflies.xml"
	end
end)

AddPrefabPostInit("kyno_yellowflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_yellowflies.xml"
	end
end)

AddPrefabPostInit("kyno_greenflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_greenflies.xml"
	end
end)

AddPrefabPostInit("kyno_blueflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_blueflies.xml"
	end
end)

AddPrefabPostInit("kyno_cyanflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_cyanflies.xml"
	end
end)

AddPrefabPostInit("kyno_purpleflies", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_purpleflies.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- THIS IS GOING DOWN THE ROAD YOLOOOOOOOOOOOOOO
AddPrefabPostInit("forest", function(inst)
	if GLOBAL.TheWorld.ismastersim then  
		inst:AddComponent("roottrunkinventory")
	end
end)

AddPrefabPostInit("cave", function(inst)
	if GLOBAL.TheWorld.ismastersim then  
		inst:AddComponent("roottrunkinventory")
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_lotus_flower", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "lotus_flower"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)

AddPrefabPostInit("kyno_lotus_flower_cooked", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "lotus_flower_cooked"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Cursed Structure!!!
local function ondeathnew(inst)
	if math.random()<0.1 then
		GLOBAL.SpawnPrefab("kyno_wigfridge_blueprint").Transform:SetPosition(inst.Transform:GetWorldPosition())
	end
	inst.battleborn = 0
end

AddPrefabPostInit("wathgrithr", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst:ListenForEvent("death", ondeathnew)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function onhitrug(inst, worker, workleft)
	local workable = inst.components.workable
	if inst.lastworktime == nil then
		inst.lastworktime = _G.GetTime()
	end

	if _G.GetTime() - inst.lastworktime > 2 then
		workable:SetWorkLeft(4) 
		inst.lastworktime = _G.GetTime()
	end
	local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 90) % 360)
end

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("rugs") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrug)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function onhitholder(inst, worker, workleft)
	local workable = inst.components.workable
	if inst.lastworktime == nil then
		inst.lastworktime = _G.GetTime()
	end

	if _G.GetTime() - inst.lastworktime > 2 then
		workable:SetWorkLeft(4) 
		inst.lastworktime = _G.GetTime()
	end
	local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("plantholder") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitholder)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function onhitlamp(inst, worker, workleft)
	local workable = inst.components.workable
	if inst.lastworktime == nil then
		inst.lastworktime = _G.GetTime()
	end

	if _G.GetTime() - inst.lastworktime > 2 then
		workable:SetWorkLeft(4) 
		inst.lastworktime = _G.GetTime()
	end
	local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("groundlamp") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitlamp)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function onhitaccademia(inst, worker, workleft)
	local workable = inst.components.workable
	if inst.lastworktime == nil then
		inst.lastworktime = _G.GetTime()
	end

	if _G.GetTime() - inst.lastworktime > 2 then
		workable:SetWorkLeft(4) 
		inst.lastworktime = _G.GetTime()
	end
	local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("accademia_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("arcane_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("containers_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("deli_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("florist_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("interior_floor_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("mayoroffice_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("millinery_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)

AddPrefabPostInitAny(function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst:HasTag("palace_decor") and inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitaccademia)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local function onhitrotate(inst, worker, workleft)
	local workable = inst.components.workable
	if inst.lastworktime == nil then
		inst.lastworktime = _G.GetTime()
	end

	if _G.GetTime() - inst.lastworktime > 2 then
		workable:SetWorkLeft(4) 
		inst.lastworktime = _G.GetTime()
	end
	local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

AddPrefabPostInit("kyno_beaststatue", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_beaststatue2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_worshipper2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_topiary_2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_topiary_3", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_topiary_4", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_lawnornament_2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_lawnornament_4", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_hound_gargoyle_1", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_hound_gargoyle_2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_hound_gargoyle_3", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_hound_gargoyle_4", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_1", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_2", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_3", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_4", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_5", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)

AddPrefabPostInit("kyno_werepig_gargoyle_6", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
	if inst.components.workable then
		inst.components.workable:SetOnWorkCallback(onhitrotate)
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_koi", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "coi"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)

AddPrefabPostInit("kyno_tropicalfish", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "tropical_fish"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)

AddPrefabPostInit("kyno_grouper", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "fish3"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)

AddPrefabPostInit("kyno_pierrotfish", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "fish4"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)

AddPrefabPostInit("kyno_neonfish", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "fish5"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)

AddPrefabPostInit("kyno_salmonfish", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "quagmire_salmon"
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_gorgecoin1", function(inst)
	inst:SetPrefabNameOverride("quagmire_coin1")
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "quagmire_coin1"
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)

AddPrefabPostInit("kyno_gorgecoin2", function(inst)
	inst:SetPrefabNameOverride("quagmire_coin2")
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "quagmire_coin2"
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)

AddPrefabPostInit("kyno_gorgecoin3", function(inst)
	inst:SetPrefabNameOverride("quagmire_coin3")
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "quagmire_coin3"
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)

AddPrefabPostInit("kyno_gorgecoin4", function(inst)
	inst:SetPrefabNameOverride("quagmire_coin4")
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.imagename = "quagmire_coin4"
	inst.components.inventoryitem.atlasname = "images/inventoryimages.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("parrot_pirate", function(inst)
	inst:AddTag("_named")
	if GLOBAL.TheWorld.ismastersim then
		inst:RemoveTag("_named")
		inst:AddComponent("named")
		inst.components.named.possiblenames = { "reD", "Sokoteur", "Glermz", "Kiss-Shot Acerola-Orion Heart-Under-Blade", "Nicky", "Orfeu", "Thalz", "Kyno", "Jazzy", "Ogait", "Harry", "Murdoc", "John", "Jack Sparrow", "Davy Jones", "Cornelius", "Frida", "Dan Van 3000", "Sammy", "Jahzus", "Lakhish", "Pollygon", "Loro", "Vegetable", "Dr Hook", "Donny Jepp", "Octoparrot", "Pequi", "Oilo", "Freddo", "James Bucket", "Gabriel", "Glommer Slayer", "The Destroyer", "Lunatic Parrot" }
		inst.components.named:PickNewName()
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("dragonfly", function(inst)
	if GLOBAL.TheWorld.ismastersim then
	inst.components.lootdropper:AddChanceLoot("saladfurnace_blueprint", 0.01) -- 1% Drop Chance
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_earring", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	inst.components.inventoryitem.imagename = "kyno_earring"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("turf_redcarpet", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_pinkcarpet", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_orangecarpet", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_cyancarpet", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_whitecarpet", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_modern_cobblestones", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROAD"
	end 
end)

AddPrefabPostInit("turf_magma", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROCKY"
	end 
end)

AddPrefabPostInit("turf_volcano", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROCKY"
	end 
end)

AddPrefabPostInit("turf_ash", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROCKY"
	end 
end)

AddPrefabPostInit("turf_beach", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_DESERTDIRT"
	end 
end)

AddPrefabPostInit("turf_meadow", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_GRASS"
	end 
end)

AddPrefabPostInit("turf_jungle", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_FOREST"
	end 
end)

AddPrefabPostInit("turf_tidalmarsh", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_MARSH"
	end 
end)

AddPrefabPostInit("turf_snakeskinfloor", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CARPETFLOOR"
	end 
end)

AddPrefabPostInit("turf_cultivated", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_GRASS"
	end 
end)

AddPrefabPostInit("turf_rainforest", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_FOREST"
	end 
end)

AddPrefabPostInit("turf_plains", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_SAVANNA"
	end 
end)

AddPrefabPostInit("turf_deepjungle", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_FOREST"
	end 
end)

AddPrefabPostInit("turf_bog", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_DESERTDIRT"
	end 
end)

AddPrefabPostInit("turf_mossy_blossom", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_GRASS"
	end 
end)

AddPrefabPostInit("turf_gasjungle", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_FOREST"
	end 
end)

AddPrefabPostInit("turf_cultivated", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_GRASS"
	end 
end)

AddPrefabPostInit("turf_stonecity", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROCKY"
	end 
end)

AddPrefabPostInit("turf_forgeroad", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROAD"
	end 
end)

AddPrefabPostInit("turf_forgerock", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_ROCKY"
	end 
end)

AddPrefabPostInit("turf_batcave", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_CAVE"
	end 
end)

AddPrefabPostInit("turf_antcave", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TURF_UNDERROCK"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_telebrella", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_minisign_icons_2.xml"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_rubble_bike", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_BIKE"
	end 
end)

AddPrefabPostInit("kyno_rubble_carriage", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CARRIAGE"
	end 
end)

AddPrefabPostInit("kyno_rubble_clock", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CLOCK"
	end 
end)

AddPrefabPostInit("kyno_rubble_cathedral", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CATHEDRAL"
	end 
end)

AddPrefabPostInit("kyno_rubble_pubdoor", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_PUBDOOR"
	end 
end)

AddPrefabPostInit("kyno_rubble_door", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_PUBDOOR"
	end 
end)

AddPrefabPostInit("kyno_rubble_roof", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_ROOF"
	end 
end)

AddPrefabPostInit("kyno_rubble_clocktower", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CLOCKTOWER"
	end 
end)

AddPrefabPostInit("kyno_rubble_house", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_HOUSE"
	end 
end)

AddPrefabPostInit("kyno_rubble_chimney", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CHIMNEY"
	end 
end)

AddPrefabPostInit("kyno_rubble_chimney2", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_RUBBLE_CHIMNEY2"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_carrot_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "CARROT"
	end 
end)

AddPrefabPostInit("kyno_potato_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "POTATO"
	end 
end)

AddPrefabPostInit("kyno_turnip_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_TURNIP"
	end 
end)

AddPrefabPostInit("kyno_onion_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ONION"
	end 
end)

AddPrefabPostInit("kyno_wheat_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "QUAGMIRE_WHEAT"
	end 
end)

AddPrefabPostInit("kyno_garlic_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "GARLIC"
	end 
end)

AddPrefabPostInit("kyno_tomato_planted", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TOMATO"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_sculpture_knighthead", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "SCULPTURE_KNIGHTHEAD"
	end 
end)

AddPrefabPostInit("kyno_sculpture_bishophead", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "SCULPTURE_BISHOPHEAD"
	end 
end)

AddPrefabPostInit("kyno_sculpture_rooknose", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "SCULPTURE_ROOKNOSE"
	end 
end)

AddPrefabPostInit("kyno_altar_glass", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MOON_ALTAR_GLASS"
	end 
end)

AddPrefabPostInit("kyno_altar_seed", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MOON_ALTAR_SEED"
	end 
end)

AddPrefabPostInit("kyno_altar_crown", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MOON_ALTAR_CROWN"
	end 
end)

AddPrefabPostInit("kyno_altar_idol", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MOON_ALTAR_IDOL"
	end 
end)

AddPrefabPostInit("kyno_pighead", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "PIGHEAD"
	end 
end)

AddPrefabPostInit("kyno_mermhead", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MERMHEAD"
	end 
end)

AddPrefabPostInit("kyno_pond", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "POND"
	end 
end)

AddPrefabPostInit("kyno_pondmarsh", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "POND"
	end 
end)

AddPrefabPostInit("kyno_pondlava", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "LAVA_POND"
	end 
end)

AddPrefabPostInit("kyno_pondrock", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ROCK"
	end 
end)

AddPrefabPostInit("kyno_pond_rock", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ROCK"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_mast_01", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_01", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_01", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_01.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_01"
	end
end)

AddPrefabPostInit("kyno_mast_02", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_02", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_02", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_02.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_02"
	end
end)

AddPrefabPostInit("kyno_mast_03", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_03", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_03", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_03.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_03"
	end
end)

AddPrefabPostInit("kyno_mast_04", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_04", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_04", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_04.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_04"
	end
end)

AddPrefabPostInit("kyno_mast_05", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_05", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_05", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_05.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_05"
	end
end)

AddPrefabPostInit("kyno_mast_06", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_06", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_06", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_06.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_06"
	end
end)

AddPrefabPostInit("kyno_mast_07", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_07", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_07", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_07.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_07"
	end
end)

AddPrefabPostInit("kyno_mast_08", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_08", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_08", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_08.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_08"
	end
end)

AddPrefabPostInit("kyno_mast_09", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST"
	end 
end)

AddPrefabPostInit("kyno_mast_item_09", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "MAST_ITEM"
	end 
end)

AddPrefabPostInit("kyno_mast_item_09", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_mast_09.xml"
	inst.components.inventoryitem.imagename = "kyno_mast_09"
	end
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- I Took the turfs code from eXiGe's mod. I hope he doesn't get mad at me xd
if GLOBAL.TheNet:GetIsMasterSimulation() then
    local turf_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw.xml"
    for _, turf in pairs({"ash", "magmafield", "volcano", "volcano_rock", "jungle", "meadow", "snakeskinfloor", "beach", "foundation", "fields", "cobbleroad", "pigruins", "lawn"}) do
        local turf_name = "turf_"..turf
        AddPrefabPostInit(turf_name, function(inst)
            inst.components.inventoryitem.imagename = turf_name
            inst.components.inventoryitem.atlasname = turf_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw_2.xml"
    for _, turf in pairs({"tidalmarsh"}) do
        local kyno_turf_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_name
            inst.components.inventoryitem.atlasname = kyno_turf_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_ham_atlas = MODROOT.."images/inventoryimages/kyno_turfs_ham.xml"
    for _, turf in pairs({"rainforest", "plains", "deepjungle", "bog", "mossy_blossom", "gasjungle", "beard_hair", "antcave", "batcave"}) do
        local kyno_turf_ham_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_ham_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_ham_name
            inst.components.inventoryitem.atlasname = kyno_turf_ham_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_gorge_atlas = MODROOT.."images/inventoryimages/kyno_turfs_gorge.xml"
    for _, turf in pairs({"pinkpark", "pinkstone", "greyforest", "stonecity", "browncarpet"}) do
        local kyno_turf_gorge_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_gorge_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_gorge_name
            inst.components.inventoryitem.atlasname = kyno_turf_gorge_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_forge_atlas = MODROOT.."images/inventoryimages/kyno_turfs_forge.xml"
    for _, turf in pairs({"forgeroad", "forgerock", "ruinsbrick", "ruinsbricktrim", "ruinstile", "ruinstiletrim", "ruinstrim", "ruinstrimtrim"}) do
        local kyno_turf_forge_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_forge_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_forge_name
            inst.components.inventoryitem.atlasname = kyno_turf_forge_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_interior_atlas = MODROOT.."images/inventoryimages/kyno_inventoryimages_ham.xml"
    for _, turf in pairs({"chess", "hoof", "herring", "octagon", "shagcarpet", "marbletile", "hexagon", "garden", "geometric", "woodpanel", "transitional", "slate", "metalsheet", "trinket_ham_1", "trinket_ham_3"}) do
        local kyno_turf_interior_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_interior_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_interior_name
            inst.components.inventoryitem.atlasname = kyno_turf_interior_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons.xml"
    for _, item in pairs({"coconut", "wall_enforcedlimestone_item", "wall_limestone_item", "jungletreeseed", "seashell", "kyno_sandbagsmall_item", "dug_coffeebush", "coffee", "kyno_coffeebeans", "kyno_coffeebeans_cooked", "packim_fishbone", "piratepack", 
	"trinket_sw_13", "trinket_sw_14", "trinket_sw_15", "trinket_sw_16", "trinket_sw_17", "trinket_sw_18", "trinket_sw_19", "trinket_sw_20", "trinket_sw_21", "trinket_sw_22", "trinket_sw_23", "kyno_earring"}) do
        local item_name = item
        AddPrefabPostInit(item_name, function(inst)
            inst.components.inventoryitem.imagename = item_name
            inst.components.inventoryitem.atlasname = item_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item2_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons_2.xml"
    for _, item2 in pairs({"teatree_nut", "burr", "hedge_block_item", "hedge_cone_item", "hedge_layered_item", "ro_bin_gizzard_stone", "kyno_relic_1", "kyno_relic_2", "kyno_relic_3", "kyno_relic_4", "kyno_relic_5", "kyno_pherostone", "kyno_oinc1", "kyno_oinc10", "kyno_oinc100", "kyno_telebrella"}) do
        local item2_name = item2
        AddPrefabPostInit(item2_name, function(inst)
            inst.components.inventoryitem.imagename = item2_name
            inst.components.inventoryitem.atlasname = item2_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item3_atlas = MODROOT.."images/inventoryimages/wall_pig_ruins_item.xml"
    for _, item3 in pairs({"wall_pig_ruins_item"}) do
        local item3_name = item3
        AddPrefabPostInit(item3_name, function(inst)
            inst.components.inventoryitem.imagename = item3_name
            inst.components.inventoryitem.atlasname = item3_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item4_atlas = MODROOT.."images/inventoryimages/kyno_minisign_icons_3.xml"
    for _, item4 in pairs({"hedge_block_aged_item", "hedge_cone_aged_item", "hedge_layered_aged_item"}) do
        local item4_name = item4
        AddPrefabPostInit(item4_name, function(inst)
            inst.components.inventoryitem.imagename = item4_name
            inst.components.inventoryitem.atlasname = item4_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item5_atlas = MODROOT.."images/inventoryimages/kyno_irongate_item.xml"
    for _, item5 in pairs({"kyno_irongate_item"}) do
        local item5_name = item5
        AddPrefabPostInit(item5_name, function(inst)
            inst.components.inventoryitem.imagename = item5_name
            inst.components.inventoryitem.atlasname = item5_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item6_atlas = MODROOT.."images/inventoryimages/kyno_turfs_sw_2.xml"
    for _, item6 in pairs({"wall_enforcedlimestone_land_item"}) do
        local item6_name = item6
        AddPrefabPostInit(item6_name, function(inst)
            inst.components.inventoryitem.imagename = item6_name
            inst.components.inventoryitem.atlasname = item6_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item7_atlas = MODROOT.."images/inventoryimages/kyno_moltenfence_item.xml"
    for _, item7 in pairs({"kyno_moltenfence_item"}) do
        local item7_name = item7
        AddPrefabPostInit(item7_name, function(inst)
            inst.components.inventoryitem.imagename = item7_name
            inst.components.inventoryitem.atlasname = item7_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local item8_atlas = MODROOT.."images/inventoryimages/kyno_legacy_inventoryimages.xml"
    for _, item8 in pairs({"wall_legacy_moonrock_item", "wall_legacyruins_item"}) do
        local item8_name = item8
        AddPrefabPostInit(item8_name, function(inst)
            inst.components.inventoryitem.imagename = item8_name
            inst.components.inventoryitem.atlasname = item8_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_new_atlas = MODROOT.."images/inventoryimages/kyno_turfs_new.xml"
    for _, turf in pairs({"redcarpet", "pinkcarpet", "orangecarpet", "cyancarpet", "whitecarpet", "snowfall", "modern_cobblestones"}) do
        local kyno_turf_new_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_new_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_new_name
            inst.components.inventoryitem.atlasname = kyno_turf_new_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_turf_honey_atlas = MODROOT.."images/inventoryimages/turf_sticky.xml"
    for _, turf in pairs({"sticky"}) do
        local kyno_turf_honey_name = "turf_"..turf
        AddPrefabPostInit(kyno_turf_honey_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_turf_honey_name
            inst.components.inventoryitem.atlasname = kyno_turf_honey_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_wall_reed_atlas = MODROOT.."images/inventoryimages/kyno_wall_reed.xml"
    for _, wall_reed in pairs({"wall_reed_item"}) do
        local kyno_wall_reed_name = wall_reed
        AddPrefabPostInit(kyno_wall_reed_name, function(inst)
            inst.components.inventoryitem.imagename = kyno_wall_reed_name
            inst.components.inventoryitem.atlasname = kyno_wall_reed_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_fork_atlas = MODROOT.."images/inventoryimages/kyno_glass_pitchfork.xml"
    for _, fork in pairs({"kyno_glass_pitchfork"}) do
        local fork_name = fork
        AddPrefabPostInit(fork_name, function(inst)
            inst.components.inventoryitem.imagename = fork_name
            inst.components.inventoryitem.atlasname = kyno_fork_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local kyno_claw_atlas = MODROOT.."images/inventoryimages/lobster_claw.xml"
    for _, claw in pairs({"lobster_claw"}) do
        local claw_name = claw
        AddPrefabPostInit(claw_name, function(inst)
            inst.components.inventoryitem.imagename = claw_name
            inst.components.inventoryitem.atlasname = kyno_claw_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local wall_bone_atlas = MODROOT.."images/inventoryimages/wall_bone_item.xml"
    for _, wall_bone in pairs({"wall_bone_item"}) do
        local wall_bone_name = wall_bone
        AddPrefabPostInit(wall_bone_name, function(inst)
            inst.components.inventoryitem.imagename = wall_bone_name
            inst.components.inventoryitem.atlasname = wall_bone_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local wall_living_atlas = MODROOT.."images/inventoryimages/wall_living_item.xml"
    for _, wall_living in pairs({"wall_living_item"}) do
        local wall_living_name = wall_living
        AddPrefabPostInit(wall_living_name, function(inst)
            inst.components.inventoryitem.imagename = wall_living_name
            inst.components.inventoryitem.atlasname = wall_living_atlas
        end)
    end
end

if GLOBAL.TheNet:GetIsMasterSimulation() then
    local wall_mud_atlas = MODROOT.."images/inventoryimages/wall_mud_item.xml"
    for _, wall_mud in pairs({"wall_mud_item"}) do
        local wall_mud_name = wall_mud
        AddPrefabPostInit(wall_mud_name, function(inst)
            inst.components.inventoryitem.imagename = wall_mud_name
            inst.components.inventoryitem.atlasname = wall_mud_atlas
        end)
    end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("ash", function(inst)
	if not GLOBAL.TheWorld.ismastersim then
		return inst
	end
    inst:AddTag("coffeefertilizer")
    inst:AddComponent("fertilizer")
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_p_farmrock", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ROCKS"
	end 
end)

AddPrefabPostInit("kyno_p_farmrocktall", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ROCKS"
	end 
end)

AddPrefabPostInit("kyno_p_farmrockflat", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "ROCKS"
	end 
end)

AddPrefabPostInit("kyno_p_stick", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_stickright", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_stickleft", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_signleft", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "HOMESIGN"
	end 
end)

AddPrefabPostInit("kyno_p_signright", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "HOMESIGN"
	end 
end)

AddPrefabPostInit("kyno_p_fencepost", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "FENCE"
	end 
end)

AddPrefabPostInit("kyno_p_fencepostright", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "FENCE"
	end 
end)

AddPrefabPostInit("kyno_p_burntstickright", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_burntstickleft", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_burntstick", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "TWIGS"
	end 
end)

AddPrefabPostInit("kyno_p_burntfencepost", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "FENCE"
	end 
end)

AddPrefabPostInit("kyno_p_burntfencepostright", function(inst)	
	if inst.components.inspectable ~= nil then
	inst.components.inspectable.nameoverride = "FENCE"
	end 
end)
-------------------------------------------------------------------------------------------------------------------------------------------------------------------