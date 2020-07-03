
modimport("tile_adder.lua")

local run_carpet = "dontstarve/movement/run_carpet"
local run_grass = "dontstarve/movement/run_grass"
local run_marble = "dontstarve/movement/run_marble"
local run_sand = "dontstarve/movement/run_sand"
local run_tallgrass = "dontstarve/movement/run_tallgrass"
local run_woods = "dontstarve/movement/run_woods"
local run_marsh = "dontstarve/movement/run_marsh"

local walk_carpet = "dontstarve/movement/walk_carpet"
local walk_grass = "dontstarve/movement/walk_grass"
local walk_marble = "dontstarve/movement/walk_marble"
local walk_sand = "dontstarve/movement/walk_sand"
local walk_tallgrass = "dontstarve/movement/walk_tallgrass"
local walk_woods = "dontstarve/movement/walk_woods"
local walk_marsh = "dontstarve/movement/walk_marsh"
local run_snow = "dontstarve/movement/run_snow"

AddTile(64, "sticky", "stickyturf", nil,
	{
	name = "snowfall",
	noise_texture = "levels/textures/noise_sticky.tex",
	runsound = "dontstarve/movement/run_marsh",
	walksound = "dontstarve/movement/walk_marsh",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_sticky",
	}
, true)

AddTile(65, "whitecarpet", "kyno_turfs6", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/noise_whitecarpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_whitecarpet",
	}
, true)

AddTile(66, "snowfall", "kyno_turfs6", nil,
    {
        name = "snowfall",
        noise_texture = "levels/textures/noise_snowfall.tex",
        runsound = run_sand,
        walksound = walk_sand,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_noise_snowfall.tex"
    }
, true)

AddTile(67, "modern_cobblestones", "kyno_turfs6", nil,
	{
	name = "moderncobblestones",
	-- noise_texture = "levels/textures/noise_moderncobblestones.tex", -- Actually using the "forge_floor_ms" texture itself.
	},{
		noise_texture = "levels/textures/mini_noise_moderncobblestones",
	}
, true)

AddTile(68, "pinkstone", "kyno_turfs3", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/quagmire_parkstone_noise.tex",
	},{
		noise_texture = "levels/textures/quagmire_parkstone_mini.tex",
	}
, true)

AddTile(69, "stonecity", "kyno_turfs3", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/quagmire_citystone_noise.tex",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/quagmire_citystone_mini.tex",
	}
, true)

AddTile(70, "beach", "mod_turfs", nil,
    {
        name = "beach",
        noise_texture = "levels/textures/Ground_noise_sand.tex",
        runsound = run_sand,
        walksound = walk_sand,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_beach_noise.tex"
    }
, true)

AddTile(71, "volcano_rock", "mod_turfs", nil,
    {
        name = "rocky",
        noise_texture = "levels/textures/ground_volcano_noise.tex",
		snowsound = run_snow,
    },
	{
        noise_texture = "levels/textures/mini_ground_volcano_noise.tex"
    }
, true)

AddTile(72, "tidalmarsh", "kyno_turfs2", nil,
    {
        name = "tidalmarsh",
        noise_texture = "levels/textures/Ground_noise_tidalmarsh.tex",
        runsound = run_marsh,
        walksound = walk_marsh,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_tidalmarsh_noise.tex"
    }
, true)

AddTile(73, "meadow", "mod_turfs", nil,
    {
        name = "jungle",
        noise_texture = "levels/textures/Ground_noise_savannah_detail.tex",
        runsound = run_tallgrass,
        walksound = walk_tallgrass,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_savannah_noise.tex"
    }
, true)

AddTile(74, "jungle", "mod_turfs", nil,
    {
        name = "jungle",
        noise_texture = "levels/textures/Ground_noise_jungle.tex",
        runsound = run_woods,
        walksound = walk_woods,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_jungle_noise.tex"
    }
, true)

AddTile(75, "volcano", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_lava_rock.tex",
		snowsound = run_snow,
    },
	{
        noise_texture = "levels/textures/mini_ground_lava_rock.tex"
    }
, true)

AddTile(76, "ash", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_ash.tex",
		snowsound = run_snow,
    },
	{
        noise_texture = "levels/textures/mini_ash.tex"
    }
, true)

AddTile(77, "magmafield", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/Ground_noise_magmafield.tex",
		snowsound = run_snow,
    },
	{
        noise_texture = "levels/textures/mini_magmafield_noise.tex"
    }
, true)

AddTile(78, "snakeskinfloor", "mod_turfs", "snakeskin",
    {
        name = "carpet",
        noise_texture = "levels/textures/noise_snakeskinfloor.tex",
        runsound = run_carpet,
        walksound = walk_carpet,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/noise_snakeskinfloor.tex"
    }
, true)

AddTile(79, "cobbleroad", "mod_turfs", nil,
    {
        name = "stoneroad",
        noise_texture = "levels/textures/Ground_noise_cobbleroad.tex",
		snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_brickroad_noise.tex"
    }
, true)

AddTile(80, "pigruins", "mod_turfs", nil,
    {
        name = "blocky",
        noise_texture = "levels/textures/ground_ruins_slab.tex",
		snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_ruins_slab.tex"
    }
, true)

AddTile(81, "fields", "mod_turfs", nil,
    {
        name = "jungle",
        noise_texture = "levels/textures/noise_farmland.tex",
        runsound = run_woods,
        walksound = walk_woods,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_noise_farmland.tex"
    }
, true)

AddTile(82, "foundation", "mod_turfs", nil,
    {
        name = "blocky",
        noise_texture = "levels/textures/noise_ruinsbrick_scaled.tex",
        runsound = run_marble,
        walksound = walk_marble,
    },{
        noise_texture = "levels/textures/mini_fanstone_noise.tex"
    }
, true)

AddTile(83, "lawn", "mod_turfs", nil,
    {
        name = "pebble",
        noise_texture = "levels/textures/ground_noise_checkeredlawn.tex",
        runsound = run_grass,
        walksound = walk_grass,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_grasslawn_noise.tex"
    }
, true)

AddTile(84, "rainforest", "kyno_turfs2", nil,
	{
        name = "rain_forest",
        noise_texture = "levels/textures/Ground_noise_rainforest.tex",
        runsound = run_grass,
        walksound = walk_grass,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/mini_noise_rainforest.tex"
    }
, true)

AddTile(85, "plains", "kyno_turfs2", nil,
	{
		name = "jungle",
		noise_texture = "levels/textures/Ground_plains.tex",
		runsound = run_grass,
		walksound = walk_grass,
		snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_plains_noise.tex",
	}
, true)
	
AddTile(86, "deepjungle", "kyno_turfs2", nil,
	{
	name = "jungle_deep",
	noise_texture = "levels/textures/Ground_noise_jungle_deep.tex",
	runsound = run_grass,
	walksound = walk_grass,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_jungle_deep.tex",
	}
, true)

AddTile(87, "bog", "kyno_turfs2", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/Ground_bog.tex",
	runsound = run_sand,
	walksound = walk_sand,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_bog.tex",
	}
, true)

AddTile(88, "mossy_blossom", "kyno_turfs2", nil,
	{
	name = "desert_dirt",
	noise_texture = "levels/textures/noise_mossy_blossom.tex",
	runsound = run_marsh,
	walksound = walk_marsh,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_mossy_blossom.tex",
	}
, true)
	
AddTile(89, "gasjungle", "kyno_turfs2", nil,
	{
	name = "jungle_deep",
	noise_texture = "levels/textures/Ground_noise_gasbiome.tex",
	runsound = run_grass,
	walksound = walk_grass,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_gasbiome_noise.tex",
	}
, true)

AddTile(90, "beard_hair", "kyno_turfs2", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/Ground_beard_hair.tex",
	runsound = run_carpet,
	walksound = walk_carpet,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_battlegrounds_noise.tex",
	}
, true)

AddTile(91, "pinkpark", "kyno_turfs3", nil,
	{
	name = "deciduous",
	noise_texture = "levels/textures/quagmire_parkfield_noise.tex",
	runsound = run_grass,
	walksound = walk_grass,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/quagmire_parkfield_mini.tex",
	}
, true)

AddTile(92, "greyforest", "kyno_turfs3", nil,
	{
	name = "grass3",
	noise_texture = "levels/textures/quagmire_gateway_noise.tex",
	runsound = run_grass,
	walksound = walk_grass,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/quagmire_gateway_mini.tex",
	}
, true)

AddTile(93, "browncarpet", "kyno_turfs3", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/quagmire_soil_noise.tex",
	runsound = run_carpet,
	walksound = walk_carpet,
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/quagmire_soil_mini.tex",
	}
, true)

AddTile(94, "forgerock", "kyno_turfs4", nil,
	{
	name = "forge_trim_ms",
	noise_texture = "levels/textures/forge_trim_noise.tex",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/forge_trim_mini.tex",
	}
, true)

AddTile(95, "forgeroad", "kyno_turfs4", nil,
	{
	name = "forge_floor_ms",
	noise_texture = "levels/textures/forge_floor_noise.tex",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/forge_floor_mini.tex",
	}
, true)

AddTile(96, "antcave", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/antcave_noise.tex",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/antcave_mini.tex",
	}
, true)

AddTile(97, "batcave", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/batcave_noise.tex",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/batcave_mini.tex",
	}
, true)

AddTile(98, "ruinsbricktrim", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinsbrickglow.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinsbrick_noise",
	}
, true)

AddTile(99, "ruinsbrick", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinsbrick.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinsbrick_noise",
	}
, true)

AddTile(100, "ruinstiletrim", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinstileglow.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinstile_noise",
	}
, true)

AddTile(101, "ruinstile", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinstile.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinstile_noise",
	}
, true)

AddTile(102, "ruinstrimtrim", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinstrimglow.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinstrim_noise",
	}
, true)

AddTile(103, "ruinstrim", "kyno_turfs4", nil,
	{
	name = "cave",
	noise_texture = "levels/textures/noise_ruinstrim.tex",
	runsound = "dontstarve/movement/run_moss",
	walksound = "dontstarve/movement/walk_moss",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_ruinstrim_noise",
	}
, true)

AddTile(104, "woodpanel", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_woodpanel.tex",
	runsound = "dontstarve/movement/run_woods",
	walksound = "dontstarve/movement/walk_woods",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_woodpanel",
	}
, true)

AddTile(105, "marbletile", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_marble.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_marble",
	}
, true)

AddTile(106, "chess", "kyno_turfs5", nil,
	{
	name = "pebble",
	noise_texture = "levels/textures/interior/shop_floor_checker.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_checker",
	}
, true)

AddTile(107, "slate", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_slate.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_slate",
	}
, true)

AddTile(108, "metalsheet", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_sheetmetal.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_sheetmetal",
	}
, true)

AddTile(109, "garden", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_gardenstone.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_gardenstone",
	}
, true)

AddTile(110, "geometric", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_geometric.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_geometric",
	}
, true)

AddTile(111, "shagcarpet", "kyno_turfs5", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/interior/shop_floor_carpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_carpet",
	}
, true)

AddTile(112, "transitional", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_transitional.tex",
	runsound = "dontstarve/movement/run_woods",
	walksound = "dontstarve/movement/walk_woods",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_transitional",
	}
, true)

AddTile(113, "herring", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_herringbone.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_herringbone",
	}
, true)

AddTile(114, "hexagon", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_hexagon.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_hexagon",
	}
, true)

AddTile(115, "hoof", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_hoof_curvy.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_hoof_curvy",
	}
, true)

AddTile(116, "octagon", "kyno_turfs5", nil,
	{
	name = "blocky",
	noise_texture = "levels/textures/interior/shop_floor_octagon.tex",
	runsound = "dontstarve/movement/run_marble",
	walksound = "dontstarve/movement/walk_marble",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/interior/mini_shop_floor_octagon",
	}
, true)

AddTile(117, "redcarpet", "kyno_turfs6", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/noise_redcarpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_redcarpet",
	}
, true)

AddTile(118, "pinkcarpet", "kyno_turfs6", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/noise_pinkcarpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_pinkcarpet",
	}
, true)

AddTile(119, "orangecarpet", "kyno_turfs6", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/noise_orangecarpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_orangecarpet",
	}
, true)

AddTile(120, "cyancarpet", "kyno_turfs6", nil,
	{
	name = "carpet",
	noise_texture = "levels/textures/noise_cyancarpet.tex",
	runsound = "dontstarve/movement/run_carpet",
	walksound = "dontstarve/movement/walk_carpet",
	snowsound = run_snow,
	},{
		noise_texture = "levels/textures/mini_noise_cyancarpet",
	}
, true)

-- NOTE: ID 120 Is the limit!!! 121 and higher IDs already in use by the game. --

ChangeTileTypeRenderOrder(GROUND.PINKSTONE, GROUND.ROAD, true)
ChangeTileTypeRenderOrder(GROUND.STONECITY, GROUND.PINKSTONE, true)
ChangeTileTypeRenderOrder(GROUND.BEACH, GROUND.PINKSTONE, true)
ChangeTileTypeRenderOrder(GROUND.VOLCANO_ROCK, GROUND.BEACH, true)
ChangeTileTypeRenderOrder(GROUND.TIDALMARSH, GROUND.MARSH, true)
ChangeTileTypeRenderOrder(GROUND.MEADOW, GROUND.DIRT, true)
ChangeTileTypeRenderOrder(GROUND.JUNGLE, GROUND.MEADOW, true)
ChangeTileTypeRenderOrder(GROUND.VOLCANO, GROUND.DESERT_DIRT, true)
ChangeTileTypeRenderOrder(GROUND.ASH, GROUND.VOLCANO, true)
ChangeTileTypeRenderOrder(GROUND.MAGMAFIELD, GROUND.ASH, true)
ChangeTileTypeRenderOrder(GROUND.SNAKESKINFLOOR, GROUND.LAWN, true)
ChangeTileTypeRenderOrder(GROUND.ANTCAVE, GROUND.VOLCANO, true)
ChangeTileTypeRenderOrder(GROUND.BATCAVE, GROUND.ANTCAVE, true)
ChangeTileTypeRenderOrder(GROUND.PIGRUINS, GROUND.BATCAVE, true)
ChangeTileTypeRenderOrder(GROUND.BOG, GROUND.PIGRUINS, true)
ChangeTileTypeRenderOrder(GROUND.PLAINS, GROUND.BOG, true)
ChangeTileTypeRenderOrder(GROUND.RAINFOREST, GROUND.PLAINS, true)
ChangeTileTypeRenderOrder(GROUND.FIELDS, GROUND.RAINFOREST, true)
ChangeTileTypeRenderOrder(GROUND.PINKPARK, GROUND.FIELDS, true)
ChangeTileTypeRenderOrder(GROUND.GREYFOREST, GROUND.PINKPARK, true)
ChangeTileTypeRenderOrder(GROUND.MOSSY_BLOSSOM, GROUND.GREYFOREST, true)
ChangeTileTypeRenderOrder(GROUND.DEEPJUNGLE, GROUND.MOSSY_BLOSSOM, true)
ChangeTileTypeRenderOrder(GROUND.GASJUNGLE, GROUND.DEEPJUNGLE, true)
ChangeTileTypeRenderOrder(GROUND.FOUNDATION, GROUND.GASJUNGLE, true)
ChangeTileTypeRenderOrder(GROUND.WOODPANEL, GROUND.FOUNDATION, true)
ChangeTileTypeRenderOrder(GROUND.MARBLETILE, GROUND.WOODPANEL, true)
ChangeTileTypeRenderOrder(GROUND.CHESS, GROUND.MARBLETILE, true)
ChangeTileTypeRenderOrder(GROUND.SLATE, GROUND.CHESS, true)
ChangeTileTypeRenderOrder(GROUND.METALSHEET, GROUND.SLATE, true)
ChangeTileTypeRenderOrder(GROUND.GARDEN, GROUND.METALSHEET, true)
ChangeTileTypeRenderOrder(GROUND.GEOMETRIC, GROUND.GARDEN, true)
ChangeTileTypeRenderOrder(GROUND.TRANSITIONAL, GROUND.GEOMETRIC, true)
ChangeTileTypeRenderOrder(GROUND.HERRING, GROUND.TRANSITIONAL, true)
ChangeTileTypeRenderOrder(GROUND.HEXAGON, GROUND.TRANSITIONAL, true)
ChangeTileTypeRenderOrder(GROUND.HOOF, GROUND.HEXAGON, true)
ChangeTileTypeRenderOrder(GROUND.OCTAGON, GROUND.HOOF, true)
ChangeTileTypeRenderOrder(GROUND.SHAGCARPET, GROUND.OCTAGON, true)
ChangeTileTypeRenderOrder(GROUND.STICKY, GROUND.OCTAGON, true)
ChangeTileTypeRenderOrder(GROUND.BEARD_HAIR, GROUND.SNAKESKINFLOOR, true)
ChangeTileTypeRenderOrder(GROUND.BROWNCARPET, GROUND.BEARD_HAIR, true)
ChangeTileTypeRenderOrder(GROUND.LAWN, GROUND.CARPET, true)
ChangeTileTypeRenderOrder(GROUND.REDCARPET, GROUND.LAWN, true)
ChangeTileTypeRenderOrder(GROUND.PINKCARPET, GROUND.REDCARPET, true)
ChangeTileTypeRenderOrder(GROUND.ORANGECARPET, GROUND.PINKCARPET, true)
ChangeTileTypeRenderOrder(GROUND.CYANCARPET, GROUND.ORANGECARPET, true)
ChangeTileTypeRenderOrder(GROUND.WHITECARPET, GROUND.CYANCARPET, true)
ChangeTileTypeRenderOrder(GROUND.FORGEROAD, GROUND.BROWNCARPET, true)
ChangeTileTypeRenderOrder(GROUND.COBBLEROAD, GROUND.FORGEROAD, true)
ChangeTileTypeRenderOrder(GROUND.MODERN_COBBLESTONES, GROUND.COBBLEROAD, true)
ChangeTileTypeRenderOrder(GROUND.SNOWFALL, GROUND.WHITECARPET, true)
ChangeTileTypeRenderOrder(GROUND.FORGEROCK, GROUND.UNDERROCK, true)
ChangeTileTypeRenderOrder(GROUND.RUINSBRICK, GROUND.FORGEROCK, true)
ChangeTileTypeRenderOrder(GROUND.RUINSBRICKTRIM, GROUND.RUINSBRICK, true)
ChangeTileTypeRenderOrder(GROUND.RUINSTILE, GROUND.RUINSBRICKTRIM, true)
ChangeTileTypeRenderOrder(GROUND.RUINSTILETRIM, GROUND.RUINSTILE, true)
ChangeTileTypeRenderOrder(GROUND.RUINSTRIM, GROUND.RUINSTILETRIM, true)
ChangeTileTypeRenderOrder(GROUND.RUINSTRIMTRIM, GROUND.RUINSTRIM, true)