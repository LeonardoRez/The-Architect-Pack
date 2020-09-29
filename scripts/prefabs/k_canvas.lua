require "prefabutil"

local assets =
{
	Asset("ANIM", "anim/canvas1.zip"),
	Asset("ANIM", "anim/canvas2.zip"),
	Asset("ANIM", "anim/canvas3.zip"),
	Asset("ANIM", "anim/canvas4.zip"),
	Asset("ANIM", "anim/canvas5.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_canvas_blank.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas_blank.xml"),
	
	Asset("IMAGE", "images/minimapimages/kyno_canvas_blank.tex"),
	Asset("ATLAS", "images/minimapimages/kyno_canvas_blank.xml"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_canvas1.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas1.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas2.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas2.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas3.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas3.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas4.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas4.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas5.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas5.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas6.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas6.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas7.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas7.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas8.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas8.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas9.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas9.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas10.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas10.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas11.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas11.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas12.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas12.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas13.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas13.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas14.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas14.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas15.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas15.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas16.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas16.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas17.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas17.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas18.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas18.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas19.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas19.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas20.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas20.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas21.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas21.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas22.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas22.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas23.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas23.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas24.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas24.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas25.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas25.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas26.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas26.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas27.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas27.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas28.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas28.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas29.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas29.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas30.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas30.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas31.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas31.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas32.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas32.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas33.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas33.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas34.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas34.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas35.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas35.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas36.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas36.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas37.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas37.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas38.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas38.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas39.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas39.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas40.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas40.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas41.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas41.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas42.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas42.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas43.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas43.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas44.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas44.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas45.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas45.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas46.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas46.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas47.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas47.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas48.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas48.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas49.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas49.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas50.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas50.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas51.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas51.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas52.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas52.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas53.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas53.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas54.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas54.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas55.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas55.xml"),
	Asset("IMAGE", "images/inventoryimages/kyno_canvas56.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_canvas56.xml"),
}

local function onhammered(inst, worker)
	inst.components.lootdropper:DropLoot()
	SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
	inst:Remove()
end

local function onhit(inst, worker)
    local rotation = inst.Transform:GetRotation()
    inst.Transform:SetRotation((rotation + 180) % 360)
end

local function common(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas")
    inst.AnimState:SetBuild("canvas1")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
    inst:AddComponent("inspectable")
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function common1(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas")
    inst.AnimState:SetBuild("canvas1")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "KYNO_CANVAS"
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function common2(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas2")
    inst.AnimState:SetBuild("canvas2")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "KYNO_CANVAS"
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function common3(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas3")
    inst.AnimState:SetBuild("canvas3")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "KYNO_CANVAS"
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function common4(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas4")
    inst.AnimState:SetBuild("canvas4")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "KYNO_CANVAS"
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function common5(burnable, radius_long, save_rotation)
	local inst = CreateEntity()
	
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
	
	local minimap = inst.entity:AddMiniMapEntity()
	minimap:SetIcon("kyno_canvas_blank.tex")

    if radius_long then
		MakeObstaclePhysics(inst, 1)
	else
		MakeObstaclePhysics(inst, .4)
	end
	
    inst.AnimState:SetBank("canvas5")
    inst.AnimState:SetBuild("canvas5")
    
	inst:AddTag("structure")
	inst:AddTag("canvas_painting")
	
	if save_rotation then
		inst.Transform:SetTwoFaced()
	end
	
	inst.entity:SetPristine()
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("sanityaura")
	inst.components.sanityaura.aura = TUNING.SANITYAURA_SMALL
	
	inst:AddComponent("lootdropper")
	
    inst:AddComponent("inspectable")
	inst.components.inspectable.nameoverride = "KYNO_CANVAS"
	
	inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
	inst.components.workable:SetOnFinishCallback(onhammered)
	inst.components.workable:SetOnWorkCallback(onhit)
	
	inst:AddComponent("hauntable")
    inst.components.hauntable:SetHauntValue(TUNING.HAUNT_TINY)
	
	if save_rotation then
		inst:AddComponent("savedrotation")
	end
	
	MakeHauntableWork(inst)
	
	if burnable then
		MakeLargeBurnable(inst)
		MakeLargePropagator(inst)
	end
	
    return inst
end

local function canvas_blank()
    local inst = common(true, false, true)
    inst.AnimState:PlayAnimation("blank")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas1()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("1")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas2()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("2")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas3()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("3")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas4()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("4")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas5()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("5")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas6()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("6")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas7()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("7")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas8()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("8")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas9()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("9")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas10()
    local inst = common1(true, false, true)
    inst.AnimState:PlayAnimation("10")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas11()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("11")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas12()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("12")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas13()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("13")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas14()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("14")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas15()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("15")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas16()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("16")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas17()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("17")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas18()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("18")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas19()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("19")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas20()
    local inst = common2(true, false, true)
    inst.AnimState:PlayAnimation("20")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas21()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("21")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas22()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("22")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas23()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("23")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas24()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("24")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas25()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("25")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas26()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("26")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas27()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("27")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas28()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("28")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas29()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("29")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas30()
    local inst = common3(true, false, true)
    inst.AnimState:PlayAnimation("30")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas31()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("31")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas32()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("32")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas33()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("33")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas34()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("34")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas35()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("35")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas36()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("36")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas37()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("37")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas38()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("38")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas39()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("39")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas40()
    local inst = common4(true, false, true)
    inst.AnimState:PlayAnimation("40")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas41()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("41")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas42()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("42")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas43()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("43")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas44()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("44")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas45()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("45")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas46()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("46")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas47()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("47")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas48()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("48")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas49()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("49")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas50()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("50")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas51()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("51")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas52()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("52")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas53()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("53")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas54()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("54")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas55()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("55")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvas56()
    local inst = common5(true, false, true)
    inst.AnimState:PlayAnimation("56")
	inst.AnimState:SetScale(1, 1, 1)
    return inst
end

local function canvasplacefn(inst)
	inst.AnimState:SetScale(1, 1, 1)
end

return Prefab("kyno_canvas_blank", canvas_blank, assets),
Prefab("kyno_canvas1", canvas1, assets),
Prefab("kyno_canvas2", canvas2, assets),
Prefab("kyno_canvas3", canvas3, assets),
Prefab("kyno_canvas4", canvas4, assets),
Prefab("kyno_canvas5", canvas5, assets),
Prefab("kyno_canvas6", canvas6, assets),
Prefab("kyno_canvas7", canvas7, assets),
Prefab("kyno_canvas8", canvas8, assets),
Prefab("kyno_canvas9", canvas9, assets),
Prefab("kyno_canvas10", canvas10, assets),
Prefab("kyno_canvas11", canvas11, assets),
Prefab("kyno_canvas12", canvas12, assets),
Prefab("kyno_canvas13", canvas13, assets),
Prefab("kyno_canvas14", canvas14, assets),
Prefab("kyno_canvas15", canvas15, assets),
Prefab("kyno_canvas16", canvas16, assets),
Prefab("kyno_canvas17", canvas17, assets),
Prefab("kyno_canvas18", canvas18, assets),
Prefab("kyno_canvas19", canvas19, assets),
Prefab("kyno_canvas20", canvas20, assets),
Prefab("kyno_canvas21", canvas21, assets),
Prefab("kyno_canvas22", canvas22, assets),
Prefab("kyno_canvas23", canvas23, assets),
Prefab("kyno_canvas24", canvas24, assets),
Prefab("kyno_canvas25", canvas25, assets),
Prefab("kyno_canvas26", canvas26, assets),
Prefab("kyno_canvas27", canvas27, assets),
Prefab("kyno_canvas28", canvas28, assets),
Prefab("kyno_canvas29", canvas29, assets),
Prefab("kyno_canvas30", canvas30, assets),
Prefab("kyno_canvas31", canvas31, assets),
Prefab("kyno_canvas32", canvas32, assets),
Prefab("kyno_canvas33", canvas33, assets),
Prefab("kyno_canvas34", canvas34, assets),
Prefab("kyno_canvas35", canvas35, assets),
Prefab("kyno_canvas36", canvas36, assets),
Prefab("kyno_canvas37", canvas37, assets),
Prefab("kyno_canvas38", canvas38, assets),
Prefab("kyno_canvas39", canvas39, assets),
Prefab("kyno_canvas40", canvas40, assets),
Prefab("kyno_canvas41", canvas41, assets),
Prefab("kyno_canvas42", canvas42, assets),
Prefab("kyno_canvas43", canvas43, assets),
Prefab("kyno_canvas44", canvas44, assets),
Prefab("kyno_canvas45", canvas45, assets),
Prefab("kyno_canvas46", canvas46, assets),
Prefab("kyno_canvas47", canvas47, assets),
Prefab("kyno_canvas48", canvas48, assets),
Prefab("kyno_canvas49", canvas49, assets),
Prefab("kyno_canvas50", canvas50, assets),
Prefab("kyno_canvas51", canvas51, assets),
Prefab("kyno_canvas52", canvas52, assets),
Prefab("kyno_canvas53", canvas53, assets),
Prefab("kyno_canvas54", canvas54, assets),
Prefab("kyno_canvas55", canvas55, assets),
Prefab("kyno_canvas56", canvas56, assets),
MakePlacer("kyno_canvas_blank_placer", "canvas", "canvas1", "blank", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas1_placer", "canvas", "canvas1", "1", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas2_placer", "canvas", "canvas1", "2", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas3_placer", "canvas", "canvas1", "3", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas4_placer", "canvas", "canvas1", "4", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas5_placer", "canvas", "canvas1", "5", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas6_placer", "canvas", "canvas1", "6", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas7_placer", "canvas", "canvas1", "7", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas8_placer", "canvas", "canvas1", "8", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas9_placer", "canvas", "canvas1", "9", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas10_placer", "canvas", "canvas1", "10", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas11_placer", "canvas2", "canvas2", "11", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas12_placer", "canvas2", "canvas2", "12", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas13_placer", "canvas2", "canvas2", "13", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas14_placer", "canvas2", "canvas2", "14", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas15_placer", "canvas2", "canvas2", "15", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas16_placer", "canvas2", "canvas2", "16", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas17_placer", "canvas2", "canvas2", "17", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas18_placer", "canvas2", "canvas2", "18", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas19_placer", "canvas2", "canvas2", "19", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas20_placer", "canvas2", "canvas2", "20", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas21_placer", "canvas3", "canvas3", "21", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas22_placer", "canvas3", "canvas3", "22", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas23_placer", "canvas3", "canvas3", "23", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas24_placer", "canvas3", "canvas3", "24", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas25_placer", "canvas3", "canvas3", "25", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas26_placer", "canvas3", "canvas3", "26", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas27_placer", "canvas3", "canvas3", "27", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas28_placer", "canvas3", "canvas3", "28", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas29_placer", "canvas3", "canvas3", "29", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas30_placer", "canvas3", "canvas3", "30", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas31_placer", "canvas4", "canvas4", "31", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas32_placer", "canvas4", "canvas4", "32", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas33_placer", "canvas4", "canvas4", "33", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas34_placer", "canvas4", "canvas4", "34", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas35_placer", "canvas4", "canvas4", "35", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas36_placer", "canvas4", "canvas4", "36", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas37_placer", "canvas4", "canvas4", "37", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas38_placer", "canvas4", "canvas4", "38", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas39_placer", "canvas4", "canvas4", "39", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas40_placer", "canvas4", "canvas4", "40", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas41_placer", "canvas5", "canvas5", "41", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas42_placer", "canvas5", "canvas5", "42", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas43_placer", "canvas5", "canvas5", "43", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas44_placer", "canvas5", "canvas5", "44", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas45_placer", "canvas5", "canvas5", "45", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas46_placer", "canvas5", "canvas5", "46", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas47_placer", "canvas5", "canvas5", "47", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas48_placer", "canvas5", "canvas5", "48", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas49_placer", "canvas5", "canvas5", "49", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas50_placer", "canvas5", "canvas5", "50", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas51_placer", "canvas5", "canvas5", "51", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas52_placer", "canvas5", "canvas5", "52", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas53_placer", "canvas5", "canvas5", "53", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas54_placer", "canvas5", "canvas5", "54", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas55_placer", "canvas5", "canvas5", "55", nil, true, nil, nil, nil, "two", canvasplacefn),
MakePlacer("kyno_canvas56_placer", "canvas5", "canvas5", "56", nil, true, nil, nil, nil, "two", canvasplacefn)