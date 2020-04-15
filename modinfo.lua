name = " The Architect Pack"
version = "1.5-B-Alpha-4"

description = "This mod contains huge amount of decorative structures for Base Building! Remember: They're just replicas, static structures or not?...\n\nThis Mod Includes some Special Items, gotta craft 'em all! (Mostly decorative/utility items)\n\nThis includes content from: Shipwrecked, Hamlet, The Forge, The Gorge and exclusive DS/DST content!\n\nMod Version: "..version.."\n\nCredits on the mod page!"
author = "The Building Society"

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
            {description = "Enabled", data = 0},
            {description = "Disabled", data = 1},
        },
        default = 1,
    },
	{
		name = "aged_hedges",
		label = "Aged Hedges Recipes",
		hover = "Hedges will have their aged version as craftable.",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 1,
	},
	{
		name = "tweak_recipes",
		label = "Tweaked Recipes",
		hover = "Some recipes from the game will be tweaked for building means.",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 1,
	},
	{
		name = "hamlet_yotp",
		label = "Pig Fiesta Decorations",
		hover = "Some Hamlet Structures will have Pig Fiesta decorations!",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 1,
	},
	{
		name = "ant_queen",
		label = "Queen Womant",
		hover = "Queen Womant will be in her throne.",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 0,
	},
	Title("Extras", "Note: Some options below may affect your gameplay if enabled."),
	{
		name = "coffee_hack",
		label = "Coffee",
		hover = "Enables Coffee now fully working with Warly's spices!",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 1,
	},
	{
		name = "packim_baggims",
		label = "Packim Baggims",
		hover = "Enables Packim Baggims as special drop of Malbatross.",
		options =
		{
			{description = "Enabled (100%)", data = 1.00},
			{description = "90% Chance", data = 0.10},
			{description = "80% Chance", data = 0.20},
			{description = "70% Chance", data = 0.10},
			{description = "60% Chance", data = 0.10},
			{description = "50% Chance", data = 0.10},
			{description = "40% Chance", data = 0.10},
			{description = "30% Chance", data = 0.10},
			{description = "20% Chance", data = 0.10},
			{description = "10% Chance", data = 0.10},
			{description = "Disabled", 	data = 0.00},
		},
		default = 0.00,
	},
	{
		name = "colourcubes",
		label = "Colour Cubes",
		hover = "Enables CC from Hamlet or Shipwrecked.",
		options =
		{
			{description = "Disabled", 		data =   0},
			{description = "Hamlet", 		data =   1},
			{description = "Shipwrecked", data =   2},
			{description = "Glermz Edition", data = 3},
		},
		default = 0,
	},
	{
		name = "ocean_structures",
		label = "Unimplemented Mode",
		hover = "Enable structures that are not supported at this moment! Test by your own risk.",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 1,
	},
	{
		name = "shit",
		label = "Shit Lord Mode",
		hover = "GLERMZ SHIT CREW APPROACHES",
		options =
		{
			{description = "Enabled", data = 0},
			{description = "Disabled", data = 1},
		},
		default = 0,
	},
}