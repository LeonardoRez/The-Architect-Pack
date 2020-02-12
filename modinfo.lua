name = " Kyno's Decorations Pack"
version = "1.0-A"

description = "This mod contains huge amount of decorative structures for Base Building! Remember: They're just replicas, static structures.\n\nThis Mod Includes: Coffee. Yay Speed! Works with Warly's spices too!\n\nThis includes content from: Shipwrecked, Hamlet, The Forge, The Gorge and exclusive DST structures!\n\nMod Version: "..version..""
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
}