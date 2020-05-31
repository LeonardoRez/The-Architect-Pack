local kyno_fx = {
	{
	    name = "firework_fx", 
	    bank = "firework", 
	    build = "accomplishment_fireworks", 
	    anim = "single_firework",
	    sound = "dontstarve/common/shrine/sadwork_fire",
	    sound2 = "dontstarve/common/shrine/sadwork_explo",
	    sounddelay2 = 26/30,
	    tint = nil,
	    tintalpha = nil,
	    -- fn = function() TheWorld:PushEvent("screenflash", .1) end,
	    fntime = 26/30
    },    
    {
	    name = "multifirework_fx", 
	    bank = "firework", 
	    build = "accomplishment_fireworks", 
	    anim = "multi_firework",
	    sound = "dontstarve/common/shrine/sadwork_fire",
	    sound2 = "dontstarve/common/shrine/firework_explo",
	    sounddelay2 = 26/30,
	    tint = nil,
	    tintalpha = nil,
	    -- fn = function() TheWorld:PushEvent("screenflash", .1) end,
	    fntime = 26/30
    }, 
}

GLOBAL.require("fx")

if GLOBAL.package.loaded.fx then
	for k,v in pairs(kyno_fx) do
		table.insert(GLOBAL.package.loaded.fx, v)
		table.insert(Assets, Asset("ANIM", "anim/".. v.build ..".zip"))
	end
end