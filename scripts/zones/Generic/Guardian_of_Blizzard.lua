-- @author Daniel S. Reichenbach <daniel@kogitoapp.com>
-- @copyright (c) 2014 MaNGOS project <http://getmangos.com>

--[[
-= Script Information =-
* Creature(s):  Guardian of Blizzard <5764>
* Script Type:  CreatureAI
* Status:       90% complete
* Tasks:        String localization

-= References =-
* Allakhazam:   http://web.archive.org/web/20060527091725/http://wow.allakhazam.com/db/mob.html?wmob=5764
* Wowhead:      http://www.wowhead.com/npc=5764
* Wowpedia:     http://wowpedia.org/Guardian_of_Blizzard
* YouTube:      http://www.youtube.com/watch?v=dArUSu7wFxM
                http://www.youtube.com/watch?v=G4P5737625A
--]]

-- [[ Prepare variables and objects                                      ]] --
local NPC_GUARDIAN_OF_BLIZZARD  = 5764
local Guardian_of_Blizzard      = {}
local TextYells                     = {
    -- [[ "enUS", "koKR", "frFR", "deDE", "zhCN", "zhTW", "esES", "esMX" ]] --
    {"$N! THIS AREA IS OFF LIMITS!", nil, nil, "$N! DIESES GEBIET IST TABU!", nil, nil, nil, nil, nil},
}

-- [[ Helper functions                                                   ]] --
local function LocText(id, p) -- "%s":format("test")
    if(TextYells[id]) then
        local s = TextYells[id][p:GetDbcLocale()+1] or TextYells[id][1]
        if(s) then
            return s
        end
    end
    return "Text not found: "..(id or 0)
end

-- [[ Creature functions                                                 ]] --
function Guardian_of_Blizzard.OnEnterCombat(event, creature, target)
    local YellChance = math.random(1, 1)

    creature:SendUnitYell("THIS AREA IS OFF LIMITS!", 0)
    creature:RegisterEvent(Guardian_of_Blizzard.Death_Touch, math.random(4000, 14100), 0)
end

function Guardian_of_Blizzard.Death_Touch(event, delay, pCall, creature)
    if (math.random(1, 100) <= 75) then
        creature:CastSpell(creature:GetVictim(), 5)
    end
end

function Guardian_of_Blizzard.OnLeaveCombat(event, creature)
    creature:RemoveEvents()
end

function Guardian_of_Blizzard.OnDied(event, creature)
    creature:RemoveEvents()
end

function Guardian_of_Blizzard.OnSpawn(event, creature)
    creature:SetAggroEnabled(true)
end

-- [[ Register creature events                                           ]] --
RegisterCreatureEvent(NPC_GUARDIAN_OF_BLIZZARD, 1, Guardian_of_Blizzard.OnEnterCombat)
RegisterCreatureEvent(NPC_GUARDIAN_OF_BLIZZARD, 2, Guardian_of_Blizzard.OnLeaveCombat)
RegisterCreatureEvent(NPC_GUARDIAN_OF_BLIZZARD, 4, Guardian_of_Blizzard.OnDied)
RegisterCreatureEvent(NPC_GUARDIAN_OF_BLIZZARD, 5, Guardian_of_Blizzard.OnSpawn)
