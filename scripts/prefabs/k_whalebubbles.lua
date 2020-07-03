require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/whale_tracks.zip"),
	Asset("ANIM", "anim/whale_bubbles.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_whalebubbles.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_whalebubbles.xml"),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC002.fev"),
	Asset("SOUND", "sound/dontstarve_shipwreckedSFX.fsb"),
}

local prefabs =
{
	"kyno_whalebubbles_fx",
}

local function dig_up(inst, chopper)
	inst:Remove()
end

local function addbubblefx(inst)
	local fx = SpawnPrefab("kyno_whalebubbles_fx")
	fx.entity:SetParent(inst.entity)
    fx.AnimState:SetTime(math.random())
	local offset = Vector3(math.random(-1, 1) * math.random(), 0, math.random(-1, 1) * math.random())
	fx.Transform:SetPosition(offset:Get())
end

local function fn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()
	
	inst.AnimState:SetBank("whaletrack")
	inst.AnimState:SetBuild("whale_tracks")
	inst.AnimState:PlayAnimation("bubble_loop", true)
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
    inst.AnimState:SetLayer(LAYER_BACKGROUND)
    inst.AnimState:SetSortOrder(3)
	
	inst:AddTag("structure")
	inst:AddTag("whale_bubbles")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end
	
	local numbubbles = math.random(2, 4)
	for i = 0, numbubbles do
		addbubblefx(inst)
	end
	
	inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
    
	inst:AddComponent("workable")
	inst.components.workable:SetWorkAction(ACTIONS.DIG)
	inst.components.workable:SetOnWorkCallback(dig_up)
	inst.components.workable:SetWorkLeft(1)
	
	return inst
end

local function fxfn()
	local inst = CreateEntity()
    
	inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("whalebubbles")
	inst.AnimState:SetBuild("whale_bubbles")
	inst.AnimState:PlayAnimation("bubble_loop", true)
	
	inst:AddTag("FX")
	inst:AddTag("NOCLICK")
	
	inst.SoundEmitter:PlaySound("dontstarve_DLC002/common/whale_bubble_trail/whale_trail_discovery_LP", "whale_trail_discovery_LP")
	
	inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

	inst.persists = false

	return inst
end

return Prefab("kyno_whalebubbles", fn, assets, prefabs),
Prefab("kyno_whalebubbles_fx", fxfn, assets, prefabs),
MakePlacer("kyno_whalebubbles_placer", "whaletrack", "whale_tracks", "bubble_loop", true)