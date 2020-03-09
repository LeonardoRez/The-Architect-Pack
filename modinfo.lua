name = " Kyno's Decorations Pack"
version = "1.0-A"

description = "This mod contains huge amount of decorative structures for Base Building! Remember: They're just replicas, static structures or not?...\n\nThis Mod Includes some Special Items, gotta craft 'em all! (Mostly decorative/utility items)\n\nThis includes content from: Shipwrecked, Hamlet, The Forge, The Gorge and exclusive DS/DST structures!\n\nMod Version: "..version..""
author = "Kynoox_"

api_version = 10

dst_compatible = true
all_clients_require_mod = true
client_only_mod = false

server_filter_tags = {"Kyno", "Decorations"}

icon_atlas = "KynosDecorationsPack.xml"
icon = "KynosDecorationsPack.tex"

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
        default = 0,
    },
	{
		name = "ocean_structures",
		label = "Ocean Structures",
		hover = "Ocean Structures is not supported at this moment! Test by your own risk.",
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
}