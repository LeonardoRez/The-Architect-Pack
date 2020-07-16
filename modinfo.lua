name = "The Architect Pack"
version = "2.5-B"
local myupdate = "The End of the Beginning"

description = "󰀂 This mod contains huge amount of decorative structures for Base Building!\n\Remember: They're just replicas, static structures or not?\n\n󰀅 Also includes some special structures and easter eggs, go find em' all!\n\n󰀏 Includes contents from: Shipwrecked, Hamlet, The Forge, The Gorge and exclusive contents!\n\n󰀖 Credits on the mod page!\n\󰀌 Mod Version: "..version.."\n\󰀧 Update: "..myupdate..""
author = "The Builders Society"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"TBS", "TAP", "Decorations", "Base Building", "Mega Base"}

icon_atlas = "ModiconTAP.xml"
icon = "ModiconTAP.tex"

-- From The Gorge Extender --
local emptyoptions = {{description="", data=false}}
local function Title(title, hover)
	return {
		name=title,
		hover=hover, --hover does not work, as this item cannot be hovered
		options={{description = "", data = 0}},
		default=0,
	}
end

configuration_options =
{
	Title("Tweaks", "Note: Some options below may affect your gameplay if enabled."),
    {
        name = "keep_food_on_cookpot",
        label = "Keep Food on Crock Pot",
        hover = "Finished cooked food will not turn to spoiled food before harvested from crock pot.",
        options =
        {
            {description = "Enabled", 
			hover = "Food WILL NOT spoil if you leave them on crock pot.",
			data = 0},
            {description = "Disabled", 
			hover = "Food WILL spoil if you leave them on crock pot.",
			data = 1},
        },
        default = 1,
    },
	{
		name = "aged_hedges",
		label = "Aged Hedges Recipes",
		hover = "Hedges will have their aged version as craftable.",
		options =
		{
			{description = "Enabled", 
			hover = "Extra crafting for bushier version of Hedges.",
			data = 0},
			{description = "Disabled", 
			hover = "Only normal version of Hedges.",
			data = 1},
		},
		default = 1,
	},
	{
		name = "tweak_recipes",
		label = "Tweaked Recipes",
		hover = "Some recipes from the game will be tweaked for building means.",
		options =
		{
			{description = "Enabled", 
			hover = "Tweak turfs, gates, fences and wall recipes.",
			data = 0},
			{description = "Disabled", 
			hover = "Default recipes from Don't Starve Together.",
			data = 1},
		},
		default = 1,
	},
	{
		name = "hamlet_yotp",
		label = "Pig Fiesta Decorations",
		hover = "Some Hamlet Structures will have Pig Fiesta decorations!",
		options =
		{
			{description = "Enabled", 
			hover = "Structures from Hamlet WILL have Aporkalypse Festival decorations.",
			data = 0},
			{description = "Disabled", 
			hover = "Structures from Hamlet WILL NOT have Aporkalypse Festival decorations.",
			data = 1},
		},
		default = 1,
	},
	--[[ Currently disabled, because I need at least 50 iq to do this and I have 3 atm. ]]--
	{
		name = "ocean_structures",
		label = "Ocean Structures",
		hover = "Choose if ocean structures can be craftable or not.",
		options =
		{
			{description = "Enabled",
			hover = "Ocean structures can be crafted. (WORK IN PROGRESS!)",
			data = 0},
			{description = "Disabled",
			hover = "Ocean structures can't be crafted.",
			data = 1},
		},
		default = 1,
	},
	Title("End Table", "Options for the End Table."),
	{
        name = "permanent_light",
        label = "Infinite Light",
        hover = "Choose if End Tables can have infinite light or not.",
        options =
        {
            {description = "Disabled", 
			hover = "Light Bulbs and Glow Berries WILL NOT last forever.",
			data = 0},
            {description = "Enabled",  
			hover = "Light Bulbs and Glow Berries WILL last forever.",
			data = 1},
        },
        default = 0,
    },
    {
        name = "eternal_flower",
        label = "Infinite Flower",
        hover = "Choose if End Tables can have infinite flowers or not.",
        options =
        {
            {description = "Disabled", 
			hover = "Flowers WILL NOT last forever.",
			data = 0}, 
            {description = "Enabled", 
			hover = "Flowers WILL last forever.",
			data = 1}, 
        },
        default = 0,
    },
	Title("Infinite Light", "Options for the Glowcap, Mushlight and Festive Tree."),
	{
        name = "winter_tree",
        label = "Festive Tree",
		hover = "Choose if Festive Tree can have infinite light or not.",
        options =
        {
            {description = "Disabled", 
			hover = "Festive Light WILL NOT last forever inside Festive Tree.",
			data = 0},
            {description = "Enabled", 
			hover = "Festive Light WILL last forever inside Festive Tree.",
			data = 1}, 
        },
        default = 0,
    },
    {
        name = "glowcap",
        label = "Glowcap",
        hover = "Choose if Glowcap can have infinite light or not.",
        options =
        {
            {description = "Disabled", 
			hover = "Light Bulbs, Festive Lights, etc. WILL NOT last forever inside Glowcap.",
			data = 0}, 
            {description = "Enabled", 
			hover = "Light Bulbs, Festive Lights, etc. WILL last forever inside Glowcap.",
			data = 1}, 
        },
        default = 0,
    },
    {
        name = "mushlight",
        label = "Mushlight",
        hover = "Choose if Mushlight can have infinite light or not.",
        options =
        {
            {description = "Disabled", 
			hover = "Light Bulbs, Festive Lights, etc. WILL NOT last forever inside Mushlight.",
			data = 0}, 
            {description = "Enabled", 
			hover = "Light Bulbs, Festive Lights, etc. WILL last forever inside Mushlight.",
			data = 1}, 
        },
        default = 0,
    },
	Title("Extras", "Note: Some options below may affect your gameplay if enabled."),
	{
		name = "vanity_items",
		label = "Vanity Items",
		hover = "Enable vanity items to increase your decoration power!",
		options =
		{
			{description = "Enabled", 
			hover = "Enable vanity items such as oincs, relics etc.",
			data = 0},
			{description = "Disabled", 
			hover = "Disable vanity items such as oincs, relics etc.",
			data = 1},
		},
		default = 1,
	},
	{
		name = "coffee_hack",
		label = "Coffee",
		hover = "Enables Coffee now fully working with Warly's spices!",
		options =
		{
			{description = "Enabled", 
			hover = "Coffee Bush, Coffee Beans, Coffee and Speed!",
			data = 0},
			{description = "Disabled", 
			hover = "Craftable replica of Coffee Bush but without coffee.",
			data = 1},
		},
		default = 1,
	},
	{
		name = "honeyed",
		label = "Honey Turf Slowdown",
		hover = "How much it will slow you?",
		options =	
		{
			{description = "Normal (100%)", data = 1},
			{description = "A Bit (50%)", data = 0.5},
			{description = "Classic (30%)", data = 0.30},
			{description = "Sticky (20%)", data = 0.2},
			{description = "Super Sticky (10%)", data = 0.1},
		},
		default = 0.30,
	},
	{
		name = "packim_baggims",
		label = "Packim Baggims",
		hover = "Enables Packim Baggims as special drop of Malbatross.",
		options =
		{
			{description = "Enabled", 
			hover = "100% Drop rate from Malbatross.",
			data = 1.00},
			{description = "90% Chance", 
			hover = "90% Drop rate from Malbatross.",
			data = 0.90},
			{description = "80% Chance", 
			hover = "80% Drop rate from Malbatross.",
			data = 0.80},
			{description = "70% Chance", 
			hover = "70% Drop rate from Malbatross.",
			data = 0.70},
			{description = "60% Chance", 
			hover = "60% Drop rate from Malbatross.",
			data = 0.60},
			{description = "50% Chance", 
			hover = "50% Drop rate from Malbatross.",
			data = 0.50},
			{description = "40% Chance", 
			hover = "40% Drop rate from Malbatross.",
			data = 0.40},
			{description = "30% Chance", 
			hover = "30% Drop rate from Malbatross.",
			data = 0.30},
			{description = "20% Chance", 
			hover = "20% Drop rate from Malbatross.",
			data = 0.20},
			{description = "10% Chance", 
			hover = "10% Drop rate from Malbatross.",
			data = 0.10},
			{description = "Disabled", 	
			hover = "Default Malbatross loot.",
			data = 0.00},
		},
		default = 0.00,
	},
	{
		name = "ro_bin",
		label = "Ro Bin",
		hover = "Enables Ro Bin as special drop of Ancient Guardian.",
		options =
		{
			{description = "Enabled", 
			hover = "100% Drop rate from Ancient Guardian.",
			data = 1.00},
			{description = "90% Chance", 
			hover = "90% Drop rate from Ancient Guardian.",
			data = 0.90},
			{description = "80% Chance", 
			hover = "80% Drop rate from Ancient Guardian.",
			data = 0.80},
			{description = "70% Chance", 
			hover = "70% Drop rate from Ancient Guardian.",
			data = 0.70},
			{description = "60% Chance", 
			hover = "60% Drop rate from Ancient Guardian.",
			data = 0.60},
			{description = "50% Chance", 
			hover = "50% Drop rate from Ancient Guardian.",
			data = 0.50},
			{description = "40% Chance", 
			hover = "40% Drop rate from Ancient Guardian.",
			data = 0.40},
			{description = "30% Chance", 
			hover = "30% Drop rate from Ancient Guardian.",
			data = 0.30},
			{description = "20% Chance", 
			hover = "20% Drop rate from Ancient Guardian.",
			data = 0.20},
			{description = "10% Chance", 
			hover = "10% Drop rate from Ancient Guardian.",
			data = 0.10},
			{description = "Disabled", 	
			hover = "Default Ancient Guardian loot.",
			data = 0.00},
		},
		default = 0.00,
	},
	{
		name = "colourcubes",
		label = "Colour Cubes",
		hover = "Enables Filters for each season.",
		options =
		{
			{description = "Disabled", 		
			hover = "Default colors of Don't Starve Together.",
			data =   0},
			{description = "Hamlet", 		
			hover = "Colors from Hamlet DLC. | Temperate | Humid | Lush | Barren",
			data =   1},
			{description = "Shipwrecked", 
			hover = "Colors from Shipwrecked DLC. | Mild | Hurricane | Monsoon | Dry",
			data =   2},
			{description = "Glermz Edition", 
			hover = "Colors of Glermz's choices. | Mild | Winter | Humid | Lush",
			data = 3},
			{description = "Thalz Edition",
			hover=  "Colors of Thalz's choices. | Autumn | Humid | Lush | Dry",
			data = 4},
			{description = "Soko Edition",
			hover=  "Colors of Sokoteur's choices. | Mild | Hurricane | Lush | Barren",
			data = 5},
			{description = "The Forge", 
			hover = "Colors from The Forge Event. | Lava Arena",
			data = 6},
			{description = "The Gorge", 
			hover = "Colors from The Gorge Event. | Quagmire",
			data = 7},
		},
		default = 0,
	},
}