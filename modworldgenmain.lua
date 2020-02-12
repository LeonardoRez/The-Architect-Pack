
modimport("tile_adder.lua")

local run_carpet = "dontstarve/movement/run_carpet"
local run_grass = "dontstarve/movement/run_grass"
local run_marble = "dontstarve/movement/run_marble"
local run_sand = "dontstarve/movement/run_sand"
local run_tallgrass = "dontstarve/movement/run_tallgrass"
local run_woods = "dontstarve/movement/run_woods"

local walk_carpet = "dontstarve/movement/walk_carpet"
local walk_grass = "dontstarve/movement/walk_grass"
local walk_marble = "dontstarve/movement/walk_marble"
local walk_sand = "dontstarve/movement/walk_sand"
local walk_tallgrass = "dontstarve/movement/walk_tallgrass"
local walk_woods = "dontstarve/movement/walk_woods"

local run_snow = "dontstarve/movement/run_snow"

AddTile(70, "volcano_rock", "mod_turfs", nil,
    {
        name = "rocky",
        noise_texture = "levels/textures/ground_volcano_noise.tex",
    },
	{
        noise_texture = "levels/textures/mini_ground_volcano_noise.tex"
    }
, true)

AddTile(71, "volcano", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_lava_rock.tex",
    },
	{
        noise_texture = "levels/textures/mini_ground_lava_rock.tex"
    }
, true)

AddTile(72, "ash", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/ground_ash.tex",
    },
	{
        noise_texture = "levels/textures/mini_ash.tex"
    }
, true)

AddTile(73, "magmafield", "mod_turfs", nil,
    {
        name = "cave",
        noise_texture = "levels/textures/Ground_noise_magmafield.tex",
    },
	{
        noise_texture = "levels/textures/mini_magmafield_noise.tex"
    }
, true)

--[[
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

AddTile(76, "meadow", "mod_turfs", nil,
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

AddTile(77, "snakeskinfloor", "mod_turfs", "snakeskin",
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
)
]]--

ChangeTileTypeRenderOrder(GROUND.VOLCANO_ROCK, GROUND.DIRT, true)
ChangeTileTypeRenderOrder(GROUND.VOLCANO, GROUND.VOLCANO_ROCK, true)
ChangeTileTypeRenderOrder(GROUND.ASH, GROUND.VOLCANO, true)
ChangeTileTypeRenderOrder(GROUND.MAGMAFIELD, GROUND.ASH, true)