require "prefabutil"

local assets =
{
    Asset("ANIM", "anim/room_shelves.zip"),
	
	Asset("IMAGE", "images/inventoryimages/kyno_inventoryimages_ham.tex"),
	Asset("ATLAS", "images/inventoryimages/kyno_inventoryimages_ham.xml"),
	
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_sw_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_ham.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_gorge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_turfs_forge.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_coffee.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_2.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_minisign_icons_3.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_irongate_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/wall_pig_ruins_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_moltenfence_item.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_legacy_inventoryimages.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_redflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_orangeflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_yellowflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_greenflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_blueflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_cyanflies.xml", 256),
	Asset("ATLAS_BUILD", "images/inventoryimages/kyno_purpleflies.xml", 256),
	
	Asset("SOUNDPACKAGE", "sound/dontstarve_DLC003.fev"),
	Asset("SOUND", "sound/DLC003_AMB_stream.fsb"),
	Asset("SOUND", "sound/DLC003_music_stream.fsb"),
	Asset("SOUND", "sound/DLC003_sfx.fsb"),
}

local prefabs =
{
    "kyno_shelves_slot",
}

local function smash(inst)
	inst.components.lootdropper:DropLoot()
    SpawnPrefab("collapse_small").Transform:SetPosition(inst.Transform:GetWorldPosition())
    if inst.SoundEmitter then
        inst.SoundEmitter:PlaySound("dontstarve/common/destroy_wood")
    end

    if inst.shelves and #inst.shelves > 0 then
        for i, v in ipairs(inst.shelves)do           
            v.empty(v)
            v:Remove()
        end
    end
    inst:Remove()
end    

local function setPlayerUncraftable(inst)
	inst.entity:AddSoundEmitter()
	
	inst:AddTag("playercrafted") 
    inst:RemoveTag("NOCLICK")
	
    inst:AddComponent("lootdropper")
   
    inst:AddComponent("workable")
    inst.components.workable:SetWorkAction(ACTIONS.HAMMER)
    inst.components.workable:SetWorkLeft(4)
    inst.components.workable:SetOnWorkCallback(
        function(inst, worker, workleft)
            if workleft <= 0 then
                smash(inst)
            end
	  end)
end

local function onBuilt(inst)
    setPlayerUncraftable(inst)
    inst.onbuilt = true         
end

local function SetImage(inst, ent, slot)

    local src = ent 
    local image = nil 

    if src ~= nil and src.components.inventoryitem ~= nil then
        image = #(ent.components.inventoryitem.imagename or "") > 0 and
            ent.components.inventoryitem.imagename or
            ent.prefab
    end 

    if image ~= nil then 	
        local texname = image..".tex"

	local atlas = src.replica.inventoryitem:GetAtlas()
	if inst:HasTag("shelf_fridge") then
	if ent.components.perishable then ent.components.perishable:StopPerishing() end	
	end

	if ent.caminho then atlas = ent.caminho
	elseif atlas and atlas == "images/inventoryimages1.xml" then atlas = "images/inventoryimages1.xml"
	elseif atlas and atlas == "images/inventoryimages2.xml" then atlas = "images/inventoryimages2.xml"
	else atlas = "images/inventoryimages/kyno_inventoryimages_ham.xml" end

    inst.AnimState:OverrideSymbol(slot, resolvefilepath(atlas), texname)
	
        inst.imagename = src ~=nil or ""
    else
        inst.imagename = ""
        inst.AnimState:ClearOverrideSymbol(slot)
    end
end 

local function SetImageFromName(inst, name, slot)
    local image = name

    if image ~= nil then 
        local texname = image..".tex"
		
        inst.AnimState:OverrideSymbol(slot, resolvefilepath("images/inventoryimages/kyno_inventoryimages_ham.xml"), texname)
        inst.imagename = image
    else
        inst.imagename = ""
        inst.AnimState:ClearOverrideSymbol(slot)
    end
end 

local function displaynamefn(inst)
    return "whatever"
end

local function spawnchildren(inst)
    if not inst.childrenspawned then
        inst.shelves = {}
        for i = 1, inst.size do
            local object = SpawnPrefab("kyno_shelves_slot")   

            if inst.swp_img_list and object.components.inventoryitem and object.components.shelfer then
                object.components.inventoryitem:PutOnShelf(inst, inst.swp_img_list[i])
                object.components.shelfer:SetShelf(inst, inst.swp_img_list[i])            
            else 
				if object.components.inventoryitem and object.components.shelfer then
                object.components.inventoryitem:PutOnShelf(inst,"SWAP_img"..i)
                object.components.shelfer:SetShelf(inst, "SWAP_img"..i)  
				end
            end
            table.insert(inst.shelves, object)
            if inst.shelfitems then

                for index,set in pairs(inst.shelfitems)do
                    if set[1] == i then
                        local item = SpawnPrefab(set[2])
                        if item and object.components.shelfer then
                            object.components.shelfer:AcceptGift(nil, item)
                        end
                    end
                end
            end
        end
        inst.childrenspawned = true
    end
end

local function unlock(inst, key, doer)
    inst.AnimState:Hide("LOCK")
	inst.SoundEmitter:PlaySound("dontstarve_DLC003/common/objects/royal_gallery/unlock") 
    if inst.shelves then
        for i,object in ipairs(inst.shelves) do 
			local item  = object.components.shelfer:GetGift()
			if item ~= nil then
            object.components.shelfer:Enable()
			end
        end 
    end
    -- inst:AddTag("NOCLICK")
	inst.destrancado = true
end

local function lock(inst)
    inst.AnimState:Show("LOCK") 
    if inst.shelves then
        for i,object in ipairs(inst.shelves) do  
			if object.components.shelfer then
            object.components.shelfer:Disable()
			end
        end    
    end
end

local function onsave(inst, data)    
    if inst.childrenspawned then
        data.childrenspawned = inst.childrenspawned
    end
    data.rotation = inst.Transform:GetRotation()    
    if inst.onbuilt then
        data.onbuilt = inst.onbuilt
    end     
    if inst:HasTag("playercrafted") then
        data.playercrafted = true
    end    

    data.shelves = {}
    if inst.shelves then
        for i, v in ipairs(inst.shelves)do
            table.insert(data.shelves, v.GUID)
        end
    end	

    data.destrancado = inst.destrancado
	data.textura = inst.textura	
end

local function onload(inst, data)
	if data == nil then return end
    if data.rotation then
        inst.Transform:SetRotation(data.rotation)
    end    
    if data.childrenspawned then
        inst.childrenspawned = data.childrenspawned
    end
    if data.onbuilt then
        setPlayerUncraftable(inst)
        inst.onbuilt = data.onbuilt
    end     
    if data.playercrafted then
        inst:AddTag("playercrafted")
    end    
    if data.destrancado then
        inst.destrancado = data.destrancado
    end
    if not inst.destrancado then
        lock(inst)
    else
        unlock(inst,nil)
    end
	
	if data.textura then 
	inst.textura = data.textura 
	
    inst.AnimState:PlayAnimation(data.textura, true)
	end	

end

local function onloadpostpass(inst, ents, data)

end  

local function common(setsize,swp_img_list, locked, physics_round)

    local size = setsize or 6
    local inst = CreateEntity()
	inst.entity:AddNetwork()
    inst.entity:AddTransform()
    local anim = inst.entity:AddAnimState()
    inst.entity:AddSoundEmitter()
	inst.entity:AddPhysics()		
		
    if physics_round then
        MakeObstaclePhysics(inst, .5)
    else
		MakeInventoryPhysics(inst, 1.6, 1, 0.2)
    end 

	inst.Transform:SetTwoFaced()

    -- inst:AddTag("NOCLICK")
    inst:AddTag("wallsection")
    inst:AddTag("furniture")    

    anim:SetBuild("room_shelves")
    anim:SetBank("bookcase")
    anim:PlayAnimation("wood", false)

    inst.Transform:SetRotation(-90)

    inst.imagename = nil 

    inst.SetImage = SetImage
    inst.SetImageFromName = SetImageFromName

    inst.swp_img_list = swp_img_list
    inst.size = setsize or 6
    if swp_img_list then
        for i=1,size do
            SetImageFromName(inst, nil, swp_img_list[i])
        end
    else
        for i=1,size do
            SetImageFromName(inst, nil, "SWAP_img"..i)
        end
    end
   
    inst:ListenForEvent( "onbuilt", function()
        onBuilt(inst)
    end)          

    inst.OnSave = onsave 
    inst.OnLoad = onload
    inst.OnLoadPostPass = onloadpostpass

    inst:DoTaskInTime(0, function() 
        if inst:HasTag("playercrafted") then
            setPlayerUncraftable(inst)
        end

        spawnchildren(inst,locked) 
        if locked and not inst.destrancado then
                lock(inst)
            else
                unlock(inst)
        end
    end)

    return inst
end

local function wood()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("wood", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function wood2()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("wood", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function wood3()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("wood", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function basic()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("basic", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function marble()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("marble", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function marble2()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("marble", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function glass()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("glass", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function ladder()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("ladder", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function hutch()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("hutch", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function industrial()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("industrial", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function adjustable()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("adjustable", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function fridge()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("fridge", false)
	inst:AddTag("playercrafted")
	inst:AddTag("shelf_fridge")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function cinderblocks()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("cinderblocks", false) 
	inst:AddTag("playercrafted")
	inst:AddTag("estante")	
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function midcentury2()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("midcentury", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function midcentury()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("midcentury", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function wallmount()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("wallmount", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function aframe()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("aframe", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function crates()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("crates", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function hooks()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("hooks", false)
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function pipe()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("pipe", false) 
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function hattree()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("hattree", false) 
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function pallet()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("pallet", false) 
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function floating()
    local inst = common()
    local anim = inst.AnimState
    anim:PlayAnimation("floating", false) 
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function display()
    local inst = common(3,nil,nil,true)
    local anim = inst.AnimState
    anim:SetBuild("room_shelves")
    anim:SetBank("bookcase")    
    anim:PlayAnimation("displayshelf_wood", false) 
	inst:AddTag("playercrafted")
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function display_metal()
    local inst = display()
    local anim = inst.AnimState
    anim:PlayAnimation("displayshelf_metal", false) 
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function ruins()
    local inst = common(1,nil,nil,true)
    local anim = inst.AnimState
    local minimap = inst.entity:AddMiniMapEntity()
    inst.MiniMapEntity:SetIcon("shelf_ruins.png")
    anim:SetBuild("room_shelves")
    anim:SetBank("bookcase")    
    anim:PlayAnimation("ruins", false) 
	inst:AddTag("playercrafted")
    return inst
end

local function queen_display_common(size,list)
    local inst = common(size,list,true,true)
    local anim = inst.AnimState
    anim:SetBuild("pedestal_crate")
    anim:SetBank("pedestal")    
	MakeObstaclePhysics(inst, 1.3)
    return inst
end

local function queen_display1()
    local inst = queen_display_common(1,{"SWAP_SIGN"})
    local anim = inst.AnimState
    anim:PlayAnimation("lock19_east", false)
	
    return inst
end

local function queen_display2()
    local inst = queen_display_common(1,{"SWAP_SIGN"})
    local anim = inst.AnimState
    anim:PlayAnimation("lock17_east", false) 
	
    return inst
end

local function queen_display3()
    local inst = queen_display_common(1,{"SWAP_SIGN"})
    local anim = inst.AnimState
    anim:PlayAnimation("lock12_west", false) 
	
    return inst
end

local function queen_display4()
    local inst = queen_display_common(1,{"SWAP_SIGN"})
    local anim = inst.AnimState
    anim:PlayAnimation("lock12_west", false) 
	
    return inst
end

return Prefab("kyno_shelves_wood", wood, assets, prefabs),
Prefab("kyno_shelves_basic", basic, assets, prefabs),
Prefab("kyno_shelves_marble", marble, assets, prefabs),
Prefab("kyno_shelves_glass", glass, assets, prefabs),
Prefab("kyno_shelves_ladder", ladder, assets, prefabs),
Prefab("kyno_shelves_hutch", hutch, assets, prefabs),
Prefab("kyno_shelves_industrial", industrial, assets, prefabs),
Prefab("kyno_shelves_adjustable", adjustable, assets, prefabs),
Prefab("kyno_shelves_fridge", fridge, assets, prefabs), 
Prefab("kyno_shelves_cinderblocks", cinderblocks, assets, prefabs),
Prefab("kyno_shelves_midcentury", midcentury, assets, prefabs),
Prefab("kyno_shelves_wallmount", wallmount, assets, prefabs),
Prefab("kyno_shelves_aframe", aframe, assets, prefabs),
Prefab("kyno_shelves_crates", crates, assets, prefabs),
Prefab("kyno_shelves_pipe", pipe, assets, prefabs),
Prefab("kyno_shelves_hattree", hattree, assets, prefabs),
Prefab("kyno_shelves_pallet", pallet, assets, prefabs),
Prefab("kyno_shelves_floating", floating, assets, prefabs),
Prefab("kyno_shelves_displaycase", display, assets, prefabs),
Prefab("kyno_shelves_displaycase_metal", display_metal, assets, prefabs),
Prefab("kyno_shelves_queen_display_1", queen_display1, assets, prefabs),
Prefab("kyno_shelves_queen_display_2", queen_display2, assets, prefabs),
Prefab("kyno_shelves_queen_display_3", queen_display3, assets, prefabs),
Prefab("kyno_shelves_queen_display_4", queen_display4, assets, prefabs),
Prefab("kyno_shelves_ruins", ruins, assets, prefabs),
MakePlacer("kyno_shelves_adjustable_placer", "bookcase", "room_shelves", "adjustable")