local KENV = env

local function onnotags(self, notags)
    self.inst.replica.combat.notags = notags
end

local _CanAttack
local function CanAttack(self, target, ...)
    local canattack, idk = _CanAttack(self, target, ...)
    if canattack then
        for i, v in ipairs(self.notags or {}) do
            if target:HasTag(v) then
                return false, nil
            end
        end
        return canattack, idk
    end
    return canattack, idk
end

KENV.AddComponentPostInit("combat", function(cmp)

addsetter(cmp, "notags", onnotags)
_CanAttack = cmp.CanAttack
cmp.CanAttack = CanAttack

end)