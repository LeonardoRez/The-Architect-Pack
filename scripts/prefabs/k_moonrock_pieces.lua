local assets =
{
    Asset("ANIM", "anim/moonrock_pieces.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_moonrubble.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_moonrubble.xml"),
}

local prefabs =
{
    "rock_break_fx",
}

local NUM_MOONROCK_PIECES = 8

local function setpiecetype(inst, piece)
    if inst.piece == nil or (piece ~= nil and inst.piece ~= piece) then
        inst.piece = piece or math.random(NUM_MOONROCK_PIECES)
        inst.AnimState:PlayAnimation("s"..inst.piece)
    end
end

local function onsave(inst, data)
    data.piece = inst.piece
end

local function onload(inst, data)
    setpiecetype(inst, data ~= nil and data.piece or nil)
end

local function onworkfinished(inst)
    SpawnPrefab("rock_break_fx").Transform:SetPosition(inst.Transform:GetWorldPosition())
	inst.components.lootdropper:DropLoot()
    inst:Remove()
end

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    inst.AnimState:SetBank("moonrock_pieces")
    inst.AnimState:SetBuild("moonrock_pieces")
	
	inst:SetPrefabNameOverride("moonrock_pieces")

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
	inst:AddComponent("lootdropper")

    MakeHauntableWork(inst)

    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.MINE)
    inst.components.workable:SetWorkLeft(1)
    inst.components.workable:SetOnFinishCallback(onworkfinished)

    if not POPULATING then
        setpiecetype(inst)
    end

    --------SaveLoad
    inst.OnSave = onsave
    inst.OnLoad = onload

    return inst
end

return Prefab("kyno_moonrock_pieces", fn, assets, prefabs),
MakePlacer("kyno_moonrubble_placer", "moonrock_pieces", "moonrock_pieces", "s3")