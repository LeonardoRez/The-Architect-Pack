name = " The Architect Pack"
version = "1.0-B"

description = "This mod contains huge amount of decorative structures for Base Building! Remember: They're just replicas, static structures or not?...\n\nThis Mod Includes some Special Items, gotta craft 'em all! (Mostly decorative/utility items)\n\nThis includes content from: Shipwrecked, Hamlet, The Forge, The Gorge and exclusive DS/DST content!\n\nMod Version: "..version.."\n\nCredits on the mod page!"
author = "The Building Society"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"TBS", "TAP", "Decorations", "Base Building", "Mega Base"}

icon_atlas = "ModiconTAP.xml"
icon = "ModiconTAP.tex"

configuration_options =
{
    {
        name = "keep_food_on_cookpot",
        label = "Keep Food on Crock Pot",
        hover = "Finished cooked food will not turn to spoiled food before harvested from crock pot.",
        options =
        {
            {description = "Yes", data = 0},
            {description = "No", data = 1},
        },
        default = 1,
    },
	{
		name = "coffee_hack",
		label = "Coffee",
		hover = "Yay Coffee! Now Fully working with Warly's Spices!",
		options =
		{
			{description = "Yes", data = 0},
			{description = "No", data = 1},
		},
		default = 1,
	},
	{
		name = "hamlet_yotp",
		label = "YOTP",
		hover = "Some Hamlet Structures will have YOTP decorations!",
		options =
		{
			{description = "Yes", data = 0},
			{description = "No", data = 1},
		},
		default = 1,
	},
	{
		name = "aged_hedges",
		label = "Aged Hedges",
		hover = "Hedges will have their aged version as craftable.",
		options =
		{
			{description = "Yes", data = 0},
			{description = "No", data = 1},
		},
		default = 0,
	},
	{
		name = "tweak_recipes",
		label = "Tweaked Recipes",
		hover = "Some recipes from the game will be tweaked for building means.",
		options =
		{
			{description = "Yes", data = 0},
			{description = "No", data = 1},
		},
		default = 0,
	},
	{
		name = "ocean_structures",
		label = "Unimplemented Mode",
		hover = "Enable structures that are not supported at this moment! Test by your own risk.",
		options =
		{
			{description = "Yes", data = 0},
			{description = "No", data = 1},
		},
		default = 1,
	},
}