-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature templates used in zone 3, also
-- known as Badlands.
--

-- Provide variables for NPC flags
SET @CREATURE_FLAG_NPC_NONE                     = 0;
SET @CREATURE_FLAG_NPC_GOSSIP                   = 1;
SET @CREATURE_FLAG_NPC_QUESTGIVER               = 2;
SET @CREATURE_FLAG_NPC_VENDOR                   = 4;
SET @CREATURE_FLAG_NPC_FLIGHTMASTER             = 8;
SET @CREATURE_FLAG_NPC_TRAINER                  = 16;
SET @CREATURE_FLAG_NPC_SPIRITHEALER             = 32;
SET @CREATURE_FLAG_NPC_SPIRITGUIDE              = 64;
SET @CREATURE_FLAG_NPC_INNKEEPER                = 128;
SET @CREATURE_FLAG_NPC_BANKER                   = 256;
SET @CREATURE_FLAG_NPC_PETITIONER               = 512;
SET @CREATURE_FLAG_NPC_TABARDDESIGNER           = 1024;
SET @CREATURE_FLAG_NPC_BATTLEMASTER             = 2048;
SET @CREATURE_FLAG_NPC_AUCTIONEER               = 4096;
SET @CREATURE_FLAG_NPC_STABLEMASTER             = 8192;
SET @CREATURE_FLAG_NPC_REPAIR                   = 16384;
SET @CREATURE_FLAG_NPC_OUTDOORPVP               = 536870912;

-- Provide variables for NPC rank
SET @CREATURE_RANK_NORMAL                       = 0; -- Default rank
SET @CREATURE_RANK_ELITE                        = 1; -- Higher damage, more health, better loot
SET @CREATURE_RANK_RARE_ELITE                   = 2; -- Rare mob but with elite damage and health
SET @CREATURE_RANK_WORLD_BOSS                   = 3; -- Highest rank, best loot, longest respawn time
SET @CREATURE_RANK_RARE                         = 4; -- Somewhat better loot, longer respawn time

-- Provide variables for spell schools
SET @SPELL_SCHOOL_NORMAL                        = 0;
SET @SPELL_SCHOOL_HOLY                          = 1;
SET @SPELL_SCHOOL_FIRE                          = 2;
SET @SPELL_SCHOOL_NATURE                        = 3;
SET @SPELL_SCHOOL_FROST                         = 4;
SET @SPELL_SCHOOL_SHADOW                        = 5;
SET @SPELL_SCHOOL_ARCANE                        = 6;

-- Provide variables for NPC classes
SET @CREATURE_CLASS_NONE                        = 0;
SET @CREATURE_CLASS_WARRIOR                     = 1;
SET @CREATURE_CLASS_PALADIN                     = 2;
SET @CREATURE_CLASS_ROGUE                       = 4;
SET @CREATURE_CLASS_MAGE                        = 8;

-- Provide variables for dynamic flags
SET @CREATURE_FLAG_DYN_NONE                         = 0;
SET @CREATURE_FLAG_DYN_LOOTABLE                     = 1;
SET @CREATURE_FLAG_DYN_TRACK_UNIT                   = 2;
SET @CREATURE_FLAG_DYN_OTHER_TAGGER                 = 4;
SET @CREATURE_FLAG_DYN_ROOTED                       = 8;
SET @CREATURE_FLAG_DYN_SPECIALINFO                  = 16;
SET @CREATURE_FLAG_DYN_DEAD                         = 32;
SET @CREATURE_FLAG_DYN_TAPPED_BY_ALL_THREAT_LIST    = 64;

-- Provide variables for creature type
SET @CREATURE_TYPE_NONE                         = 0;
SET @CREATURE_TYPE_BEAST                        = 1;
SET @CREATURE_TYPE_DRAGONKIN                    = 2;
SET @CREATURE_TYPE_DEMON                        = 3;
SET @CREATURE_TYPE_ELEMENTAL                    = 4;
SET @CREATURE_TYPE_GIANT                        = 5;
SET @CREATURE_TYPE_UNDEAD                       = 6;
SET @CREATURE_TYPE_HUMANOID                     = 7;
SET @CREATURE_TYPE_CRITTER                      = 8;
SET @CREATURE_TYPE_MECHANICAL                   = 9;
SET @CREATURE_TYPE_NOT_SPECIFIED                = 10;
SET @CREATURE_TYPE_TOTEM                        = 11;
SET @CREATURE_TYPE_NONCOMBAT_PET                = 12;
SET @CREATURE_TYPE_GAS_CLOUD                    = 13;

-- Provide variables for creature of type 1 (Beast)
SET @CREATURE_BEAST_FAMILY_NONE                 = 0;
SET @CREATURE_BEAST_FAMILY_WOLF                 = 1;
SET @CREATURE_BEAST_FAMILY_CAT                  = 2;
SET @CREATURE_BEAST_FAMILY_SPIDER               = 3;
SET @CREATURE_BEAST_FAMILY_BEAR                 = 4;
SET @CREATURE_BEAST_FAMILY_BOAR                 = 5;
SET @CREATURE_BEAST_FAMILY_CROCOLISK            = 6;
SET @CREATURE_BEAST_FAMILY_CARRION_BIRD         = 7;
SET @CREATURE_BEAST_FAMILY_CRAB                 = 8;
SET @CREATURE_BEAST_FAMILY_GORILLA              = 9;
SET @CREATURE_BEAST_FAMILY_RAPTOR               = 10;
SET @CREATURE_BEAST_FAMILY_TALLSTRIDER          = 11;
SET @CREATURE_BEAST_FAMILY_FELHUNTER            = 12;
SET @CREATURE_BEAST_FAMILY_VOIDWALKER           = 13;
SET @CREATURE_BEAST_FAMILY_SUCCUBUS             = 14;
SET @CREATURE_BEAST_FAMILY_DOOMGUARD            = 15;
SET @CREATURE_BEAST_FAMILY_SCORPID              = 16;
SET @CREATURE_BEAST_FAMILY_TURTLE               = 17;
SET @CREATURE_BEAST_FAMILY_IMP                  = 18;
SET @CREATURE_BEAST_FAMILY_BAT                  = 19;
SET @CREATURE_BEAST_FAMILY_HYENA                = 20;
SET @CREATURE_BEAST_FAMILY_BIRD_OF_PREY         = 21;
SET @CREATURE_BEAST_FAMILY_WIND_SERPENT         = 22;
SET @CREATURE_BEAST_FAMILY_REMOTE_CONTROL       = 23;
SET @CREATURE_BEAST_FAMILY_FELGUARD             = 24;
SET @CREATURE_BEAST_FAMILY_DRAGONHAWK           = 25;
SET @CREATURE_BEAST_FAMILY_RAVAGER              = 26;
SET @CREATURE_BEAST_FAMILY_WARP_STALKER         = 27;
SET @CREATURE_BEAST_FAMILY_SPOREBAT             = 28;
SET @CREATURE_BEAST_FAMILY_NETHER_RAY           = 29;
SET @CREATURE_BEAST_FAMILY_SERPENT              = 30;
SET @CREATURE_BEAST_FAMILY_MOTH                 = 31;
SET @CREATURE_BEAST_FAMILY_CHIMAERA             = 32;
SET @CREATURE_BEAST_FAMILY_DEVILSAUR            = 33;
SET @CREATURE_BEAST_FAMILY_GHOUL                = 34;
SET @CREATURE_BEAST_FAMILY_SILITHID             = 35;
SET @CREATURE_BEAST_FAMILY_WORM                 = 36;
SET @CREATURE_BEAST_FAMILY_RHINO                = 37;
SET @CREATURE_BEAST_FAMILY_WASP                 = 38;
SET @CREATURE_BEAST_FAMILY_CORE_HOUND           = 39;
SET @CREATURE_BEAST_FAMILY_SPIRIT_BEAST         = 40;

-- Provide variables for creature type flags
SET @CREATURE_TYPE_FLAG_NONE                    = 0;
SET @CREATURE_TYPE_FLAG_TAMEABLE                = 1;
SET @CREATURE_TYPE_FLAG_NOT_ATTACKABLE          = 2;
SET @CREATURE_TYPE_FLAG_ATTACKABLE              = 8;
SET @CREATURE_TYPE_FLAG_NOT_ATTACKABLE_2        = 128;
SET @CREATURE_TYPE_FLAG_NON_PVP_PLAYER          = 136;
SET @CREATURE_TYPE_FLAG_HERBABLE                = 256;
SET @CREATURE_TYPE_FLAG_MINEABLE                = 512;
SET @CREATURE_TYPE_FLAG_ANIMATION_FROZEN        = 1024;
SET @CREATURE_TYPE_FLAG_WAR_PLAYER              = 4096;

-- Provide variables for creatures flagged as trainer
SET @CREATURE_TRAINER_TYPE_CLASS            = 0;
SET @CREATURE_TRAINER_TYPE_MOUNTS           = 1;
SET @CREATURE_TRAINER_TYPE_TRADESKILLS      = 2;
SET @CREATURE_TRAINER_TYPE_PETS             = 3;

-- Provide variables for creature movement types
SET @CREATURE_MOVEMENT_IDLE                 = 0;
SET @CREATURE_MOVEMENT_RANDOM               = 1;
SET @CREATURE_MOVEMENT_WAYPOINT             = 2;

-- Provide variables for creature inhabit types
SET @CREATURE_INHABIT_GROUND                = 1;
SET @CREATURE_INHABIT_WATER                 = 2;
SET @CREATURE_INHABIT_GROUND_WATER          = @CREATURE_INHABIT_GROUND | @CREATURE_INHABIT_WATER;
SET @CREATURE_INHABIT_AIR                   = 4;
SET @CREATURE_INHABIT_ANY                   = @CREATURE_INHABIT_GROUND_WATER | @CREATURE_INHABIT_AIR;

-- Provide varbiables for creature immunity masks
SET @CREATURE_IMMUNITY_NONE                 = 0;
SET @CREATURE_IMMUNITY_CHARM                = 1;
SET @CREATURE_IMMUNITY_CONFUSED             = 2;
SET @CREATURE_IMMUNITY_DISARM               = 4;
SET @CREATURE_IMMUNITY_DISTRACT             = 8;
SET @CREATURE_IMMUNITY_FEAR                 = 16;
SET @CREATURE_IMMUNITY_FUMBLE               = 32;
SET @CREATURE_IMMUNITY_ROOT                 = 64;
SET @CREATURE_IMMUNITY_PACIFY               = 128;
SET @CREATURE_IMMUNITY_SILENCE              = 256;
SET @CREATURE_IMMUNITY_SLEEP                = 512;
SET @CREATURE_IMMUNITY_SNARE                = 1024;
SET @CREATURE_IMMUNITY_STUN                 = 2048;
SET @CREATURE_IMMUNITY_FREEZE               = 4096;
SET @CREATURE_IMMUNITY_KNOCKOUT             = 8192;
SET @CREATURE_IMMUNITY_BLEED                = 16384;
SET @CREATURE_IMMUNITY_BANDAGE              = 32768;
SET @CREATURE_IMMUNITY_POLYMORPH            = 65536;
SET @CREATURE_IMMUNITY_BANISH               = 131072;
SET @CREATURE_IMMUNITY_SHIELD               = 262144;
SET @CREATURE_IMMUNITY_SHACKLE              = 524288;
SET @CREATURE_IMMUNITY_MOUNT                = 1048576;
SET @CREATURE_IMMUNITY_PERSUADE             = 2097152;
SET @CREATURE_IMMUNITY_TURN                 = 4194304;
SET @CREATURE_IMMUNITY_HORROR               = 8388608;
SET @CREATURE_IMMUNITY_INVULNERABILITY      = 16777216;
SET @CREATURE_IMMUNITY_INTERRUPT            = 33554432;
SET @CREATURE_IMMUNITY_DAZE                 = 67108864;
SET @CREATURE_IMMUNITY_DISCOVERY            = 134217728;
SET @CREATURE_IMMUNITY_IMMUNE_SHIELD        = 268435456;
SET @CREATURE_IMMUNITY_SAPPED               = 536870912;

-- Provide variables for creature extra flags
SET @CREATURE_FLAG_EXTRA_NONE               = 0;
SET @CREATURE_FLAG_EXTRA_INSTANCE_BIND      = 1;
SET @CREATURE_FLAG_EXTRA_CIVILIAN           = 2;
SET @CREATURE_FLAG_EXTRA_NO_PARRY           = 4;
SET @CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN    = 8;
SET @CREATURE_FLAG_EXTRA_NO_BLOCK           = 16;
SET @CREATURE_FLAG_EXTRA_NO_CRUSH           = 32;
SET @CREATURE_FLAG_EXTRA_NO_XP_AT_KILL      = 64;
SET @CREATURE_FLAG_EXTRA_INVISIBLE          = 128;
SET @CREATURE_FLAG_EXTRA_NOT_TAUNTABLE      = 256;
SET @CREATURE_FLAG_EXTRA_AGGRO_ZONE         = 512;
SET @CREATURE_FLAG_EXTRA_GUARD              = 1024;
SET @CREATURE_FLAG_EXTRA_NO_TALKTO_CREDIT   = 2048;

-- Insert creature templates: these are creatures from zone 3
INSERT INTO `creature_template` (`entry`, `modelid_1`, `modelid_2`, `name`, `subname`, `faction_A`, `faction_H`, `type`, `family`, `unit_class`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`) VALUES
    (92, 171, 0, 'Rock Elemental', NULL, 91, 91, 4, 0, 1, 0, 39, 40, 1751, 1817, 0, 0, 0, 29, 2000, 56, 70, 53.8384, 74.0278, 0, 100, 1.55556, 1.14286),
    (1068, 2740, 0, 'Gorn', NULL, 29, 29, 7, 0, 1, 0, 40, 40, 2471, 2471, 0, 0, 0, 32, 2000, 61, 78, 56.672, 77.924, 0, 100, 1.05, 1.14286),
    (1407, 4385, 0, 'Sranda', 'Light Armor & Weapons Merchant', 29, 29, 7, 0, 1, 0, 40, 40, 2471, 2471, 0, 0, 0, 32, 2000, 61, 78, 56.672, 77.924, 0, 100, 1.05, 1.14286),
    (2701, 10704, 0, 'Dustbelcher Ogre', NULL, 45, 45, 7, 0, 1, 0, 38, 39, 1516, 1669, 0, 0, 0, 28, 2000, 55, 68, 53.8384, 74.0278, 0, 100, 1.05, 1.14286),
    (2715, 10714, 0, 'Dustbelcher Brute', NULL, 45, 45, 7, 0, 1, 0, 39, 40, 1686, 1717, 0, 0, 0, 47, 2600, 90, 113, 53.8384, 74.0278, 0, 100, 1.05, 1.14286),
    (2716, 11548, 0, 'Dustbelcher Wyrmhunter', NULL, 45, 45, 7, 0, 1, 0, 40, 41, 2091, 2156, 0, 0, 0, 31, 2000, 59, 74, 57.728, 79.376, 0, 100, 1.05, 1.14286),
    (2717, 1120, 0, 'Dustbelcher Mauler', NULL, 45, 45, 7, 0, 1, 0, 41, 42, 1887, 1970, 0, 0, 0, 27, 1700, 51, 65, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (2718, 11545, 0, 'Dustbelcher Shaman', NULL, 45, 45, 7, 0, 2, 0, 42, 43, 1592, 1933, 1381, 1432, 0, 31, 2000, 59, 76, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (2719, 1120, 0, 'Dustbelcher Lord', NULL, 45, 45, 7, 0, 1, 0, 44, 45, 2124, 2235, 0, 0, 0, 38, 2000, 73, 93, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (2720, 11546, 0, 'Dustbelcher Ogre Mage', NULL, 45, 45, 7, 0, 8, 0, 43, 44, 1434, 1492, 3575, 3680, 0, 31, 2000, 58, 76, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (2723, 10804, 0, 'Stone Golem', NULL, 54, 54, 4, 0, 1, 0, 38, 39, 1658, 1727, 0, 0, 0, 28, 2000, 55, 68, 52.7472, 72.5274, 0, 100, 1.05, 1.14286),
    (2725, 715, 0, 'Scalding Whelp', NULL, 16, 16, 2, 0, 2, 0, 41, 43, 1571, 1726, 1332, 1432, 0, 31, 2000, 58, 77, 59.0304, 81.1668, 0, 100, 1.05, 1.14286),
    (2726, 9586, 0, 'Scorched Guardian', NULL, 16, 16, 2, 0, 1, 1, 43, 45, 5195, 5881, 0, 0, 0, 121, 1300, 229, 295, 49.192, 67.639, 0, 100, 1.05, 1.14286),
    (2727, 161, 0, 'Crag Coyote', NULL, 38, 38, 1, 1, 1, 0, 35, 36, 1402, 1567, 0, 0, 0, 26, 2000, 50, 62, 52.272, 71.874, 0, 100, 1, 1.14286),
    (2728, 557, 0, 'Feral Crag Coyote', NULL, 38, 38, 1, 1, 1, 0, 37, 38, 1530, 1597, 0, 0, 0, 27, 2000, 52, 65, 54.5072, 74.9474, 0, 100, 1.05, 1.14286),
    (2729, 1164, 0, 'Elder Crag Coyote', NULL, 38, 38, 1, 1, 1, 0, 38, 40, 1711, 1776, 0, 0, 0, 29, 2000, 56, 70, 56.672, 77.924, 0, 100, 1, 1.14286),
    (2730, 161, 0, 'Rabid Crag Coyote', NULL, 38, 38, 1, 1, 1, 0, 42, 43, 1969, 2047, 0, 0, 0, 34, 2000, 65, 83, 54.912, 75.504, 0, 100, 1.05, 1.14286),
    (2731, 632, 0, 'Ridge Stalker', NULL, 16, 16, 1, 2, 1, 0, 36, 37, 1457, 1521, 0, 0, 0, 17, 1300, 32, 41, 49.368, 67.881, 0, 100, 1, 1.42857),
    (2732, 1055, 0, 'Ridge Huntress', NULL, 16, 16, 1, 2, 1, 0, 38, 39, 1591, 1746, 0, 0, 0, 28, 2000, 55, 68, 55.5984, 76.4478, 0, 100, 1, 1.14286),
    (2734, 917, 0, 'Ridge Stalker Patriarch', NULL, 16, 16, 1, 2, 1, 0, 40, 41, 1950, 2005, 0, 0, 0, 20, 1300, 38, 48, 56.672, 77.924, 0, 100, 1, 1.42857),
    (2735, 1161, 0, 'Lesser Rock Elemental', NULL, 91, 91, 4, 0, 1, 0, 37, 39, 1608, 1755, 0, 0, 0, 27, 2000, 51, 66, 50.512, 69.454, 0, 100, 1.55556, 1.14286),
    (2736, 14328, 0, 'Greater Rock Elemental', NULL, 91, 91, 4, 0, 1, 0, 42, 44, 2074, 2236, 0, 0, 0, 36, 2000, 66, 90, 59.0304, 81.1668, 0, 100, 1.05, 1.14286),
    (2739, 4932, 0, 'Shadowforge Tunneler', NULL, 54, 54, 7, 0, 1, 0, 35, 36, 1379, 1464, 0, 0, 0, 26, 2000, 50, 62, 53.8384, 74.0278, 0, 100, 1, 1.14286),
    (2740, 4933, 0, 'Shadowforge Darkweaver', NULL, 54, 54, 7, 0, 8, 0, 36, 37, 1062, 1108, 2763, 2861, 0, 20, 2000, 38, 48, 53.8384, 74.0278, 0, 100, 1, 1.14286),
    (2742, 4935, 0, 'Shadowforge Chanter', NULL, 54, 54, 7, 0, 2, 0, 37, 39, 1292, 1614, 1189, 1236, 0, 26, 2000, 50, 62, 52.7472, 72.5274, 0, 100, 1, 1.14286),
    (2743, 4936, 0, 'Shadowforge Warrior', NULL, 54, 54, 7, 0, 1, 0, 38, 39, 1591, 1686, 0, 0, 0, 28, 2000, 55, 68, 53.8384, 74.0278, 0, 100, 1, 1.14286),
    (2744, 4937, 0, 'Shadowforge Commander', NULL, 14, 14, 7, 0, 0, 2, 40, 40, 1744, 1744, 0, 0, 0, 108, 1316, 204, 263, 47.4944, 65.3048, 1448, 100, 1.62, 1.14286),
    (2745, 5488, 0, 'Ambassador Infernus', NULL, 54, 54, 4, 0, 2, 1, 41, 42, 3645, 3953, 1381, 1381, 0, 121, 1300, 229, 295, 49.192, 67.639, 0, 100, 1.05, 1.14286),
    (2749, 13869, 0, 'Siege Golem', NULL, 91, 91, 4, 0, 0, 1, 40, 40, 5527, 5527, 0, 0, 0, 113, 1316, 215, 276, 47.4944, 65.3048, 1448, 100, 2.27, 1.14286),
    (2751, 5747, 0, 'War Golem', NULL, 91, 91, 4, 0, 0, 2, 36, 36, 1452, 1452, 0, 0, 0, 94, 1350, 178, 230, 43.956, 60.4395, 1485, 100, 1.59, 1.14286),
    (2752, 8550, 0, 'Rumbler', NULL, 91, 91, 4, 0, 1, 2, 45, 45, 2345, 2345, 0, 0, 0, 127, 1275, 240, 310, 51.5936, 70.9412, 0, 100, 1.05, 1.14286),
    (2753, 9372, 0, 'Barnabus', NULL, 38, 38, 1, 1, 0, 4, 39, 39, 2376, 2376, 0, 0, 0, 47, 1600, 92, 112, 54.912, 75.504, 1760, 100, 1.49, 1.14286),
    (2754, 10040, 0, 'Anathemus', NULL, 778, 778, 5, 0, 0, 1, 45, 45, 8190, 8190, 0, 0, 0, 137, 1266, 259, 334, 52.3768, 72.0181, 1393, 100, 2.17, 1.14286),
    (2757, 6369, 0, 'Blacklash', NULL, 103, 103, 2, 0, 0, 1, 50, 50, 11275, 11275, 7071, 7071, 0, 164, 1216, 310, 400, 56.7312, 78.0054, 1338, 100, 1.05, 1.14286),
    (2759, 6377, 0, 'Hematus', NULL, 103, 103, 2, 0, 0, 1, 50, 50, 13611, 13611, 6612, 6612, 0, 150, 1241, 284, 366, 54.6, 75.075, 1365, 100, 1.05, 1.14286),
    (2785, 4903, 0, 'Theldurin the Lost', NULL, 35, 35, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1.05, 1.14286),
    (2791, 8550, 0, 'Enraged Rock Elemental', NULL, 91, 91, 4, 0, 1, 0, 42, 43, 1967, 2049, 0, 0, 0, 34, 2000, 65, 83, 59.0304, 81.1668, 0, 100, 1.05, 1.14286),
    (2817, 7033, 0, 'Rigglefuzz', NULL, 120, 120, 7, 0, 1, 0, 37, 37, 2192, 2192, 0, 0, 0, 29, 2000, 55, 70, 53.3984, 73.4228, 0, 100, 1.05, 1.14286),
    (2829, 10824, 0, 'Starving Buzzard', NULL, 73, 73, 1, 7, 1, 0, 35, 37, 1399, 1621, 0, 0, 0, 27, 2000, 51, 65, 49.368, 67.881, 0, 100, 1, 1.14286),
    (2830, 1105, 0, 'Buzzard', NULL, 73, 73, 1, 7, 1, 0, 37, 39, 1529, 1661, 0, 0, 0, 27, 2000, 51, 66, 50.512, 69.454, 0, 100, 1.05, 1.14286),
    (2831, 1106, 0, 'Giant Buzzard', NULL, 73, 73, 1, 7, 1, 0, 39, 41, 1813, 1974, 0, 0, 0, 30, 2000, 57, 73, 54.912, 75.504, 0, 100, 1, 1.14286),
    (2850, 6082, 0, 'Broken Tooth', NULL, 66, 66, 1, 2, 0, 4, 37, 37, 1073, 1073, 0, 0, 0, 16, 1000, 16, 20, 44.84, 61.655, 0, 100, 1.6, 1.14286),
    (2860, 1568, 0, 'Sigrun Ironhew', NULL, 55, 55, 7, 0, 1, 0, 40, 40, 2471, 2471, 0, 0, 0, 32, 1500, 61, 78, 56.672, 77.924, 0, 100, 1.05, 1.14286),
    (2861, 4148, 0, 'Gorrik', 'Wind Rider Master', 29, 29, 7, 0, 1, 1, 55, 55, 7693, 7693, 7071, 7071, 0, 164, 1216, 310, 400, 58.872, 80.949, 0, 100, 1.05, 1.14286),
    (2888, 9752, 0, 'Garek', NULL, 35, 35, 7, 0, 1, 0, 50, 50, 3517, 3517, 0, 0, 0, 45, 1500, 85, 109, 66.44, 91.355, 0, 100, 1.05, 1.14286),
    (2892, 722, 0, 'Stonevault Seer', NULL, 59, 59, 7, 0, 2, 1, 39, 40, 3520, 3664, 1142, 1189, 0, 102, 1341, 193, 249, 44.84, 61.655, 0, 100, 1.05, 1.14286),
    (2893, 1194, 0, 'Stonevault Bonesnapper', NULL, 59, 59, 7, 0, 1, 0, 39, 40, 1673, 1744, 0, 0, 0, 29, 2000, 56, 70, 53.8384, 74.0278, 0, 100, 1.05, 1.14286),
    (2894, 721, 0, 'Stonevault Shaman', NULL, 59, 59, 7, 0, 2, 0, 40, 41, 1441, 1515, 1283, 1332, 0, 28, 2000, 53, 67, 56.672, 77.924, 0, 100, 1.05, 1.14286),
    (2906, 5782, 0, 'Dustbelcher Warrior', NULL, 45, 45, 7, 0, 1, 0, 36, 37, 1451, 2544, 0, 0, 0, 27, 2000, 51, 65, 53.8384, 74.0278, 0, 100, 1.05, 1.14286),
    (2907, 1122, 0, 'Dustbelcher Mystic', NULL, 45, 45, 7, 0, 2, 0, 36, 37, 1201, 1244, 1097, 1142, 0, 25, 2000, 48, 60, 53.8384, 74.0278, 0, 100, 1.05, 1.14286),
    (2908, 4902, 0, 'Grawl', 'General Goods', 29, 29, 7, 0, 1, 0, 44, 44, 2868, 2868, 0, 0, 0, 36, 2000, 68, 88, 60.7904, 83.5868, 0, 100, 1.05, 1.14286),
    (2910, 4900, 0, 'Prospector Ryedol', 'Explorers'' League', 55, 55, 7, 0, 1, 0, 35, 35, 2016, 2016, 0, 0, 0, 27, 2000, 51, 65, 51.128, 70.301, 0, 100, 1.05, 1.14286),
    (2919, 1162, 0, 'Fam''retor Guardian', NULL, 91, 91, 4, 0, 0, 0, 45, 45, 2191, 2191, 0, 0, 0, 55, 1560, 108, 129, 59.0304, 81.1668, 1716, 100, 1.17, 1.14286),
    (2920, 4895, 0, 'Lucien Tosselwrench', NULL, 35, 35, 7, 0, 1, 0, 31, 31, 1684, 1684, 0, 0, 0, 22, 2000, 42, 53, 46.376, 63.767, 0, 100, 1, 1.14286),
    (2921, 4896, 0, 'Lotwil Veriatus', NULL, 35, 35, 7, 0, 1, 0, 36, 36, 2100, 2100, 0, 0, 0, 27, 2000, 51, 66, 52.272, 71.874, 0, 100, 1, 1.14286),
    (2922, 1150, 0, 'Servo', NULL, 42, 42, 9, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 2000, 6, 7, 8.624, 11.858, 0, 100, 1, 1.14286),
    (2931, 1210, 0, 'Zaricotl', NULL, 14, 14, 1, 7, 1, 1, 55, 55, 8596, 8596, 0, 0, 0, 177, 2000, 335, 432, 58.688, 80.696, 0, 100, 1.05, 1.14286),
    (2944, 10170, 0, 'Boss Tho''grun', NULL, 45, 45, 7, 0, 1, 0, 41, 42, 1895, 2060, 0, 0, 0, 32, 2000, 61, 78, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (2945, 1194, 0, 'Murdaloc', NULL, 59, 59, 7, 0, 1, 0, 42, 42, 1952, 1952, 0, 0, 0, 33, 2000, 64, 79, 63.7824, 87.7008, 0, 100, 1.05, 1.14286),
    (4618, 4898, 0, 'Martek the Exiled', NULL, 35, 35, 7, 0, 1, 0, 42, 42, 2666, 2666, 0, 0, 0, 34, 2000, 64, 83, 58.7664, 80.8038, 0, 100, 1.05, 1.14286),
    (4844, 6051, 0, 'Shadowforge Surveyor', NULL, 54, 54, 7, 0, 2, 1, 35, 36, 2878, 3002, 1940, 1940, 0, 102, 1341, 193, 249, 44.84, 61.655, 0, 100, 1, 1.14286),
    (4845, 6053, 0, 'Shadowforge Ruffian', NULL, 54, 54, 7, 0, 1, 1, 36, 37, 4293, 4533, 0, 0, 0, 102, 1341, 193, 249, 44.84, 61.655, 0, 100, 1.05, 1.14286),
    (4846, 6052, 0, 'Shadowforge Digger', NULL, 54, 54, 7, 0, 1, 1, 35, 36, 3872, 4001, 0, 0, 0, 102, 1341, 193, 249, 44.84, 61.655, 0, 100, 1, 1.14286),
    (5394, 4897, 0, 'Neeka Bloodscar', NULL, 125, 125, 7, 0, 1, 0, 45, 45, 2972, 2972, 0, 0, 0, 38, 2000, 72, 93, 61.776, 84.942, 0, 100, 1.05, 1.14286),
    (6013, 1105, 0, 'Wayward Buzzard', NULL, 73, 73, 1, 7, 0, 0, 37, 37, 1388, 1388, 0, 0, 0, 39, 1660, 77, 92, 51.128, 70.301, 1826, 100, 1.28, 1.14286),
    (6733, 721, 0, 'Stonevault Basher', NULL, 59, 59, 7, 0, 1, 1, 39, 40, 3733, 4591, 0, 0, 0, 102, 1341, 193, 249, 44.84, 61.655, 0, 100, 1.05, 1.14286),
    (6868, 5646, 0, 'Jarkal Mossmeld', NULL, 126, 126, 7, 0, 8, 0, 35, 35, 2016, 2016, 2680, 2680, 0, 27, 2000, 51, 65, 51.128, 70.301, 0, 100, 1.05, 1.14286),
    (7867, 6916, 0, 'Thorkaf Dragoneye', 'Dragonscale Leatherworking Trainer', 29, 29, 7, 0, 1, 0, 50, 50, 3517, 3517, 0, 0, 0, 45, 2000, 85, 109, 66.44, 91.355, 0, 100, 1.05, 1.14286),
    (8155, 7373, 7375, 'Kargath Grunt', NULL, 85, 85, 7, 0, 1, 0, 55, 55, 5182, 5182, 0, 0, 0, 293, 2000, 605, 665, 71.2272, 97.9374, 0, 100, 1.05, 1.14286),
    (9077, 8331, 0, 'Warlord Goretooth', 'Kargath Expeditionary Force', 83, 83, 7, 0, 1, 0, 60, 60, 3857, 3857, 0, 0, 0, 87, 2000, 164, 212, 74.448, 102.366, 0, 100, 1.05, 1.14286),
    (9078, 8330, 0, 'Shadowmage Vivian Lagrave', 'Kargath Expeditionary Force', 83, 83, 7, 0, 2, 0, 58, 58, 4484, 4484, 2289, 2289, 0, 56, 2000, 106, 136, 72.9872, 100.357, 0, 100, 1.05, 1.14286),
    (9079, 8332, 0, 'Hierophant Theodora Mulvadania', 'Kargath Expeditionary Force', 118, 118, 7, 0, 2, 0, 58, 58, 4484, 4484, 2289, 2289, 0, 56, 2000, 106, 136, 72.9872, 100.357, 0, 100, 1.05, 1.14286),
    (9080, 8333, 0, 'Lexlort', 'Kargath Expeditionary Force', 125, 125, 7, 0, 1, 0, 58, 58, 4484, 4484, 0, 0, 0, 56, 2000, 106, 136, 72.9872, 100.357, 0, 100, 1.05, 1.14286),
    (9081, 8334, 0, 'Galamav the Marksman', 'Kargath Expeditionary Force', 125, 125, 7, 0, 2, 0, 58, 58, 4484, 4484, 2289, 2289, 0, 56, 2000, 106, 136, 72.9872, 100.357, 0, 100, 1.05, 1.14286),
    (9082, 8335, 0, 'Thal''trak Proudtusk', 'Kargath Expeditionary Force', 29, 29, 7, 0, 1, 0, 55, 55, 4108, 4108, 0, 0, 0, 51, 2000, 96, 125, 70.664, 97.163, 0, 100, 1.05, 1.14286),
    (9083, 8349, 0, 'Razal''blade', 'Kargath Expeditionary Force', 83, 83, 7, 0, 1, 0, 52, 52, 3748, 3748, 0, 0, 0, 46, 2000, 90, 110, 68.1824, 93.7508, 0, 100, 1.05, 1.14286),
    (9084, 8350, 0, 'Thunderheart', 'Kargath Expeditionary Force', 83, 83, 7, 0, 2, 0, 52, 52, 2754, 2754, 1923, 1923, 0, 203, 2000, 416, 464, 68.1824, 93.7508, 0, 100, 1.05, 1.14286),
    (9085, 8351, 0, 'Initiate Amakkar', 'Kargath Expeditionary Force', 83, 83, 7, 0, 2, 0, 52, 52, 3748, 3748, 1923, 1923, 0, 43, 2000, 84, 102, 68.1824, 93.7508, 0, 100, 1.05, 1.14286),
    (9086, 8352, 0, 'Grunt Gargal', 'Kargath Expeditionary Force', 83, 83, 7, 0, 1, 0, 52, 52, 3748, 3748, 0, 0, 0, 46, 2000, 87, 113, 68.1824, 93.7508, 0, 100, 1.05, 1.14286),
    (9179, 13050, 0, 'Jazzrik', 'Blacksmithing Supplies', 120, 120, 7, 0, 1, 0, 38, 38, 2284, 2284, 0, 0, 0, 29, 2000, 55, 71, 54.5072, 74.9474, 0, 100, 1.05, 1.14286),
    (9356, 8633, 0, 'Innkeeper Shul''kar', 'Innkeeper', 29, 29, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1.05, 1.14286),
    (10058, 9281, 0, 'Greth', 'Stable Master', 29, 29, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1.05, 1.14286),
    (14224, 6889, 0, '7:XT', 'Long Distance Recovery Unit', 32, 32, 9, 0, 0, 2, 41, 41, 1564, 1564, 0, 0, 0, 116, 1300, 220, 283, 49.192, 67.639, 1430, 100, 1.64, 1.14286);

-- Set flags and other setttings for creatures: these are creatures from zone
UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 92;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1068;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1407;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2701;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2715;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2716;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2717;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2718;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2719;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2720;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2723;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2725;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 64,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2726;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2727;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2728;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2729;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2730;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2731;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2732;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2734;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2735;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2736;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2739;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2740;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2742;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2743;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2744;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 64,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2745;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2749;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2751;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2752;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2753;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2754;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2757;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2759;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2785;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2791;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2817;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2829;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2830;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2831;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 2850;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2860;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2861;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2888;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2892;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2893;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2894;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2906;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2907;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2908;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2910;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2919;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2920;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2921;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2922;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 64,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2931;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2944;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2945;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 4618;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 4844;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 4845;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 4846;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 5394;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6013;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6733;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6868;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 7867;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 8155;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9077;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 37376,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9078;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 37376,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9079;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9080;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9081;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9082;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9083;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9084;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9085;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9086;

UPDATE `creature_template`
SET
    `npcflag` = 16390, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9179;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9356;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10058;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14224;
