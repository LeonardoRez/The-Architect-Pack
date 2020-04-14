local function cottontreeplacetestfn(inst)
	inst.AnimState:AddOverrideBuild("quagmire_tree_cotton_trunk_build")
	inst.AnimState:Hide("swap_tapper")
    inst.AnimState:Hide("sap")
end

return
MakePlacer("cottontree_normal_placer", "quagmire_tree_cotton_normal", "quagmire_tree_cotton_build", "sway1_loop", false, nil, nil, nil, nil, nil, cottontreeplacetestfn)