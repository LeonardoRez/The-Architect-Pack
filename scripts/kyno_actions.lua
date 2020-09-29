AddComponentAction("USEITEM", "fertilizer", function(inst, doer, target, actions)
    if actions[1] == ACTIONS.FERTILIZE and inst:HasTag("coffeefertilizer") ~= target:HasTag("coffeebush") then
        actions[1] = nil
    end
end)