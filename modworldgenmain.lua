
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
)

AddTile(71, "volcano_rock", "mod_turfs", nil,
    {
        name = "rocky",
        noise_texture = "levels/textures/ground_volcano_noise.tex",
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
)

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
)

AddTile(75, "volcano", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_lava_rock.tex",
    },
	{
        noise_texture = "levels/textures/mini_ground_lava_rock.tex"
    }
, true)

AddTile(76, "ash", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_ash.tex",
    },
	{
        noise_texture = "levels/textures/mini_ash.tex"
    }
, true)

AddTile(77, "magmafield", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/Ground_noise_magmafield.tex",
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

--[[
AddTile(78, "forge", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/lavaarena_floor_noise.tex",
        runsound = run_marble,
        walksound = walk_marble,
        snowsound = run_snow,
    },{
        noise_texture = "levels/textures/lavaarena_floor_mini.tex"
    }
, true)
]]--

AddTile(79, "cobbleroad", "mod_turfs", nil,
    {
        name = "stoneroad",
        noise_texture = "levels/textures/Ground_noise_cobbleroad.tex",
    },{
        noise_texture = "levels/textures/mini_brickroad_noise.tex"
    }
, true)

AddTile(80, "pigruins", "mod_turfs", nil,
    {
        name = "blocky",
        noise_texture = "levels/textures/ground_ruins_slab.tex",
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
)

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
)

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
)
	
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
)

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
)

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
)
	
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
)

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
)	
	
ChangeTileTypeRenderOrder(GROUND.BEACH, GROUND.ROAD, true)
ChangeTileTypeRenderOrder(GROUND.VOLCANO_ROCK, GROUND.BEACH, true)
ChangeTileTypeRenderOrder(GROUND.TIDALMARSH, GROUND.MARSH, true)
ChangeTileTypeRenderOrder(GROUND.MEADOW, GROUND.DIRT, true)
ChangeTileTypeRenderOrder(GROUND.JUNGLE, GROUND.MEADOW, true)
ChangeTileTypeRenderOrder(GROUND.VOLCANO, GROUND.DESERT_DIRT, true)
ChangeTileTypeRenderOrder(GROUND.ASH, GROUND.VOLCANO, true)
ChangeTileTypeRenderOrder(GROUND.MAGMAFIELD, GROUND.ASH, true)
ChangeTileTypeRenderOrder(GROUND.SNAKESKINFLOOR, GROUND.LAWN, true)
ChangeTileTypeRenderOrder(GROUND.PIGRUINS, GROUND.VOLCANO, true)
ChangeTileTypeRenderOrder(GROUND.BOG, GROUND.PIGRUINS, true)
ChangeTileTypeRenderOrder(GROUND.PLAINS, GROUND.BOG, true)
ChangeTileTypeRenderOrder(GROUND.RAINFOREST, GROUND.PLAINS, true)
ChangeTileTypeRenderOrder(GROUND.FIELDS, GROUND.RAINFOREST, true)
ChangeTileTypeRenderOrder(GROUND.MOSSY_BLOSSOM, GROUND.FIELDS, true)
ChangeTileTypeRenderOrder(GROUND.DEEPJUNGLE, GROUND.MOSSY_BLOSSOM, true)
ChangeTileTypeRenderOrder(GROUND.GASJUNGLE, GROUND.DEEPJUNGLE, true)
ChangeTileTypeRenderOrder(GROUND.FOUNDATION, GROUND.GASJUNGLE, true)
ChangeTileTypeRenderOrder(GROUND.BEARD_HAIR, GROUND.SNAKESKINFLOOR, true)
ChangeTileTypeRenderOrder(GROUND.LAWN, GROUND.CARPET, true)
ChangeTileTypeRenderOrder(GROUND.COBBLEROAD, GROUND.BEARD_HAIR, true)