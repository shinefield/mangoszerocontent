-- @author Daniel S. Reichenbach <daniel@kogitoapp.com>
-- @copyright (c) 2014 MaNGOS project <http://getmangos.com>

--[[
    -= Script Information =-
    * Zone:         Dun Morogh
    * Quest(s):
    * Creature(s):  Avarus Kharag <1679>
    * Script Type:
    * Status:       NYI
    * Tasks:        Cast Hammer of Justice <5588>
                    Cast Devotion Aura
                    Cast Holy Light <1026> below 30% health

    -= References =-
    * Allakhazam:   http://web.archive.org/web/20060527091725/http://wow.allakhazam.com/db/mob.html?wmob=1679
    * Wowhead:      http://www.wowhead.com/npc=1679
    * Wowpedia:     http://wowpedia.org/Avarus_Kharag
--]]

-- [[ Prepare variables and objects                                      ]] --
local NPC_AVARUS_KHARAG = 1679
local Avarus_Kharag     = {}

-- [[ Creature functions                                                 ]] --

-- [[ Register creature events                                           ]] --
