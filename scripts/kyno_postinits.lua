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
------------------------------------------------------------------------------------------------------------
modimport "scripts/kyno_assets"
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("coconut", function(inst)	
	if inst.components.perishable ~= nil then
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
	end 
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("teatree_nut", function(inst)	
	if inst.components.perishable ~= nil then
	inst.components.perishable:SetPerishTime(TUNING.PERISH_PRESERVED)
    inst.components.perishable:StartPerishing()
    inst.components.perishable.onperishreplacement = "spoiled_food"
	end 
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_limestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_enforcedlimestone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_sw.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("wall_pig_ruins_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/wall_pig_ruins_item.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_lamppost", function(inst)
	local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 0 then
    inst.AnimState:AddOverrideBuild("lamp_post2_yotp_build")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_spa", function(inst)
	local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_flower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_general", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_deli", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_produce", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_antiquities", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_arcane", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_weapons", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_hatshop", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_bank", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_tinker", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_academy", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigshop_cityhall", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigpalacetower", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower2", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pigtower3", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("kyno_pighouse_city", function(inst)
    local YOTP = GetModConfigData("hamlet_yotp")
	if YOTP == 1 then
    inst.AnimState:Hide("YOTP")
	end
end)
------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_block_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_cone_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_layered_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/kyno_inventoryimages_ham.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_block_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_block_aged_item.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_cone_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_cone_aged_item.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
AddPrefabPostInit("hedge_layered_aged_item", function(inst)
	if inst.components.inventoryitem ~= nil then
	inst.components.inventoryitem.atlasname = "images/inventoryimages/hedge_layered_aged_item.xml"
	end
end)
------------------------------------------------------------------------------------------------------------
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
------------------------------------------------------------------------------------------------------------
packim_chance = GetModConfigData("packim_baggims")
GLOBAL.SetSharedLootTable("malbatross_packim",
{
	{'meat',                                						1.00},
    {'meat',                                						1.00},
    {'meat',                                						1.00},
    {'meat',                                						1.00},
    {'meat',                                						1.00},
    {'meat',                                						1.00},
    {'meat',                                						1.00},
    {'malbatross_beak',                     					1.00},
    {'mast_malbatross_item_blueprint',      			1.00},
    {'malbatross_feathered_weave_blueprint',		1.00},
    {'bluegem',                             						1},
    {'bluegem',                             						1},
    {'bluegem',                                                   0.3},
    {'yellowgem',                           				    0.05},
	{'oceanfishingbobber_malbatross_tacklesketch', 1.00},
	{"packim_fishbone",						  packim_chance},
})

AddPrefabPostInit("malbatross", function(inst)
	if GLOBAL.TheWorld.ismastersim and not TheSim:FindFirstEntityWithTag("packim_fishbone") then
		inst.components.lootdropper:SetChanceLootTable("malbatross_packim")
	end
end)
------------------------------------------------------------------------------------------------------------