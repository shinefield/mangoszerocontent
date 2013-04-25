-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature templates used in zone 1, also
-- known as Dun Morogh.
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

-- Insert creature templates: these are creatures from zone 1
INSERT INTO `creature_template` (`entry`, `modelid_1`, `modelid_2`, `name`, `subname`, `faction_A`, `faction_H`, `type`, `family`, `unit_class`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`) VALUES
    (460, 1930, 0, 'Alamar Grimm', 'Warlock Trainer', 875, 875, 7, 0, 1, 0, 5, 5, 166, 166, 190, 190, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (658, 1362, 0, 'Sten Stoutarm', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (704, 11416, 0, 'Ragged Timber Wolf', NULL, 32, 32, 1, 1, 1, 0, 2, 2, 62, 62, 0, 0, 0, 1, 1990, 2, 2, 3.5024, 4.8158, 2189, 100, 1, 0.857143),
    (705, 855, 0, 'Ragged Young Wolf', NULL, 32, 32, 1, 1, 1, 0, 1, 1, 44, 44, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 0.857143),
    (706, 5606, 0, 'Frostmane Troll Whelp', NULL, 107, 107, 7, 0, 1, 0, 3, 4, 74, 94, 0, 0, 0, 2, 1970, 3, 5, 6.9344, 9.5348, 2167, 100, 1, 0.857143),
    (707, 606, 0, 'Rockjaw Trogg', NULL, 36, 36, 7, 0, 1, 0, 1, 2, 55, 57, 0, 0, 0, 0, 1990, 0, 1, 3.5024, 4.8158, 2189, 100, 1, 0.857143),
    (708, 607, 0, 'Small Crag Boar', NULL, 1094, 1094, 1, 5, 1, 0, 3, 3, 74, 74, 0, 0, 0, 2, 1980, 3, 4, 5.2272, 7.1874, 2178, 100, 1, 0.857143),
    (713, 1355, 0, 'Balir Frosthammer', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (714, 1363, 0, 'Talin Keeneye', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (721, 328, 4626, 'Rabbit', NULL, 31, 31, 8, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 0.857143),
    (724, 611, 0, 'Burly Rockjaw Trogg', NULL, 36, 36, 7, 0, 1, 0, 2, 2, 53, 53, 0, 0, 0, 1, 1990, 2, 2, 3.5024, 4.8158, 2189, 100, 1, 0.857143),
    (727, 1598, 1608, 'Ironforge Mountaineer', NULL, 57, 57, 7, 0, 1, 0, 30, 30, 1918, 1918, 0, 0, 0, 22, 2000, 42, 53, 42.1344, 57.9348, 0, 100, 1, 1.14286),
    (786, 1354, 0, 'Grelin Whitebeard', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (808, 5609, 0, 'Grik''nir the Cold', NULL, 37, 37, 7, 0, 2, 0, 5, 5, 99, 99, 115, 115, 0, 2, 1960, 4, 5, 8.624, 11.858, 2156, 100, 1, 0.857143),
    (829, 3388, 0, 'Adlin Pridedrift', 'General Supplies', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (836, 3406, 0, 'Durnan Furcutter', 'Cloth & Leather Armor Merchant', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (837, 3401, 0, 'Branstock Khalder', 'Priest Trainer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 190, 190, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (853, 1598, 1608, 'Coldridge Mountaineer', NULL, 57, 57, 7, 0, 1, 0, 55, 55, 5121, 5121, 0, 0, 0, 127, 2000, 253, 296, 301.34, 422.17, 0, 100, 1, 1.14286),
    (895, 3395, 0, 'Thorgas Grimson', 'Hunter Trainer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 190, 190, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (912, 3399, 0, 'Thran Khorman', 'Warrior Trainer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (916, 3407, 0, 'Solm Hargrin', 'Rogue Trainer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (926, 3393, 0, 'Bromos Grummner', 'Paladin Trainer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 190, 190, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (944, 10216, 0, 'Marryk Nurribit', 'Mage Trainer', 875, 875, 7, 0, 1, 0, 5, 5, 166, 166, 190, 190, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (945, 3391, 0, 'Rybrad Coldbank', 'Weaponsmith', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (946, 5605, 0, 'Frostmane Novice', NULL, 107, 107, 7, 0, 2, 0, 3, 4, 68, 90, 79, 104, 0, 2, 2000, 3, 5, 6.9344, 9.5348, 0, 100, 1, 0.857143),
    (1104, 3397, 0, 'Grundel Harkin', 'Armorer', 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (1115, 726, 0, 'Rockjaw Skullthumper', NULL, 59, 59, 7, 0, 1, 0, 8, 9, 164, 183, 0, 0, 0, 6, 1910, 11, 15, 13.4464, 18.4888, 2101, 100, 1, 0.857143),
    (1116, 726, 0, 'Rockjaw Ambusher', NULL, 59, 59, 7, 0, 1, 0, 9, 10, 174, 205, 0, 0, 0, 7, 1910, 13, 17, 13.4464, 18.4888, 2101, 100, 1, 0.857143),
    (1117, 726, 0, 'Rockjaw Bonesnapper', NULL, 59, 59, 7, 0, 1, 0, 9, 10, 195, 205, 0, 0, 0, 7, 1910, 13, 17, 13.4464, 18.4888, 2101, 100, 1, 1.14286),
    (1118, 723, 0, 'Rockjaw Backbreaker', NULL, 59, 59, 7, 0, 1, 0, 11, 12, 214, 259, 0, 0, 0, 10, 1860, 19, 25, 21.2784, 29.2578, 2046, 100, 1, 1.14286),
    (1119, 830, 0, 'Hammerspine', NULL, 59, 59, 7, 0, 0, 2, 12, 12, 327, 327, 0, 0, 0, 26, 1550, 50, 64, 17.732, 24.3815, 1705, 100, 1, 1.14286),
    (1120, 5608, 0, 'Frostmane Troll', NULL, 37, 37, 7, 0, 1, 0, 7, 8, 136, 156, 0, 0, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1121, 5607, 0, 'Frostmane Snowstrider', NULL, 37, 37, 7, 0, 2, 0, 8, 9, 146, 164, 165, 178, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1122, 5612, 0, 'Frostmane Hideskinner', NULL, 37, 37, 7, 0, 1, 0, 9, 10, 175, 197, 0, 0, 0, 7, 2000, 13, 17, 15.048, 20.691, 0, 100, 1, 0.857143),
    (1123, 5626, 0, 'Frostmane Headhunter', NULL, 37, 37, 7, 0, 1, 0, 8, 9, 155, 175, 0, 0, 0, 6, 2000, 11, 15, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1124, 5613, 0, 'Frostmane Shadowcaster', NULL, 37, 37, 7, 0, 8, 0, 9, 10, 159, 177, 350, 382, 0, 6, 2000, 11, 14, 15.048, 20.691, 0, 100, 1, 0.857143),
    (1125, 607, 0, 'Crag Boar', NULL, 189, 189, 1, 5, 1, 0, 5, 6, 98, 119, 0, 0, 0, 4, 2000, 7, 10, 8.624, 11.858, 0, 100, 1, 0.857143),
    (1126, 381, 0, 'Large Crag Boar', NULL, 189, 189, 1, 5, 1, 0, 6, 7, 138, 174, 0, 0, 0, 4, 2000, 7, 10, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1127, 744, 0, 'Elder Crag Boar', NULL, 189, 189, 1, 5, 1, 0, 7, 8, 139, 155, 0, 0, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1128, 8843, 0, 'Young Black Bear', NULL, 44, 44, 1, 4, 1, 0, 5, 6, 120, 145, 0, 0, 0, 4, 2000, 7, 10, 10.296, 14.157, 0, 100, 1, 0.857143),
    (1129, 719, 0, 'Black Bear', NULL, 44, 44, 1, 4, 0, 0, 6, 6, 196, 196, 0, 0, 0, 8, 1950, 16, 18, 10.296, 14.157, 2145, 100, 1, 0.857143),
    (1130, 913, 0, 'Bjarn', NULL, 44, 44, 1, 4, 0, 2, 12, 12, 247, 247, 0, 0, 0, 9, 1550, 17, 22, 17.732, 24.3815, 1705, 100, 1.39, 1.14286),
    (1131, 785, 0, 'Winter Wolf', NULL, 38, 38, 1, 1, 1, 0, 7, 8, 141, 161, 0, 0, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1132, 11422, 0, 'Timber', NULL, 38, 38, 1, 1, 1, 2, 10, 10, 198, 198, 0, 0, 0, 7, 1566, 14, 17, 15.1624, 20.8483, 1723, 100, 1.02, 1.14286),
    (1133, 11416, 0, 'Starving Winter Wolf', NULL, 38, 38, 1, 1, 1, 0, 8, 9, 156, 179, 0, 0, 0, 6, 1900, 11, 15, 15.048, 20.691, 2090, 100, 0.72, 1.14286),
    (1134, 929, 0, 'Young Wendigo', NULL, 24, 24, 7, 0, 1, 0, 5, 6, 102, 126, 0, 0, 0, 2, 1910, 4, 6, 13.4464, 18.4888, 2101, 100, 1, 0.857143),
    (1135, 950, 0, 'Wendigo', NULL, 24, 24, 7, 0, 1, 0, 6, 7, 139, 173, 0, 0, 0, 4, 1910, 7, 10, 13.4464, 18.4888, 2101, 100, 1, 0.857143),
    (1137, 931, 0, 'Edan the Howler', NULL, 24, 24, 7, 0, 1, 2, 9, 9, 176, 176, 0, 0, 0, 10, 1575, 17, 28, 13.856, 19.052, 1732, 100, 1, 0.857143),
    (1138, 604, 0, 'Snow Tracker Wolf', NULL, 38, 38, 1, 1, 1, 0, 6, 7, 119, 138, 0, 0, 0, 4, 2000, 7, 10, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1196, 8840, 0, 'Ice Claw Bear', NULL, 44, 44, 1, 4, 1, 0, 7, 8, 163, 187, 0, 0, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1199, 748, 0, 'Juvenile Snow Leopard', NULL, 66, 66, 1, 2, 1, 0, 5, 6, 101, 120, 0, 0, 0, 2, 2000, 3, 6, 8.624, 11.858, 0, 100, 1, 0.857143),
    (1201, 954, 0, 'Snow Leopard', NULL, 66, 66, 1, 2, 1, 0, 7, 8, 138, 204, 0, 0, 0, 5, 2000, 9, 13, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1211, 6921, 6922, 'Leper Gnome', NULL, 63, 63, 7, 0, 1, 0, 8, 10, 152, 197, 0, 0, 0, 6, 1910, 10, 15, 13.4464, 18.4888, 2101, 100, 1, 0.857143),
    (1226, 3429, 0, 'Maxan Anvol', 'Priest Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 370, 370, 0, 5, 1500, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1228, 10215, 0, 'Magis Sparkmantle', 'Mage Trainer', 875, 875, 7, 0, 1, 0, 10, 10, 413, 413, 370, 370, 0, 5, 1500, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1229, 3431, 0, 'Granis Swiftaxe', 'Warrior Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1500, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1231, 3558, 0, 'Grif Wildheart', 'Hunter Trainer', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 444, 444, 0, 6, 1500, 12, 14, 19.9584, 27.4428, 0, 100, 1, 1.14286),
    (1232, 1622, 0, 'Azar Stronghammer', 'Paladin Trainer', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 444, 444, 0, 6, 1500, 12, 14, 19.9584, 27.4428, 0, 100, 1, 1.14286),
    (1234, 3436, 0, 'Hogral Bakkan', 'Rogue Trainer', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 2000, 12, 14, 19.9584, 27.4428, 0, 100, 1, 1.14286),
    (1237, 3418, 0, 'Kazan Mogosh', 'Food & Drink Merchant', 55, 55, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 4, 1930, 7, 10, 13.5872, 18.6824, 2123, 100, 1, 1.14286),
    (1238, 3420, 0, 'Gamili Frosthide', 'Cloth & Leather Armor Merchant', 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 5, 2000, 9, 13, 15.2064, 20.9088, 0, 100, 1, 1.14286),
    (1240, 3425, 0, 'Boran Ironclink', 'Armorer', 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 4, 2000, 7, 10, 15.048, 20.691, 0, 100, 1, 1.14286),
    (1241, 3422, 0, 'Tognus Flintfire', 'Journeyman Blacksmith', 55, 55, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.14286),
    (1243, 3412, 0, 'Hegnar Rumbleshot', 'Gunsmith', 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 3, 1920, 6, 7, 15.2064, 20.9088, 2112, 100, 1, 1.14286),
    (1245, 3513, 0, 'Kogan Forgestone', NULL, 57, 57, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1247, 3434, 0, 'Innkeeper Belm', 'Innkeeper', 55, 55, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.14286),
    (1252, 1376, 0, 'Senir Whitebeard', NULL, 55, 55, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 3, 1500, 6, 7, 13.5872, 18.6824, 0, 100, 1, 1.14286),
    (1253, 1616, 0, 'Father Gavin', 'The Argent Dawn', 794, 794, 7, 0, 1, 0, 15, 15, 644, 644, 0, 0, 0, 9, 1860, 17, 22, 24.552, 33.759, 2046, 100, 1, 1.14286),
    (1254, 1569, 0, 'Foreman Stonebrow', 'Miners'' League', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 0.97, 1.14286),
    (1255, 1623, 0, 'Prospector Gehn', 'Explorers'' League', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 1, 1.14286),
    (1256, 3423, 0, 'Quarrymaster Thesten', 'Miners'' League', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1260, 5625, 0, 'Great Father Arctikus', NULL, 37, 37, 7, 0, 2, 2, 11, 11, 191, 191, 205, 205, 0, 36, 1516, 68, 88, 22.6848, 31.1916, 1668, 100, 1.7, 1.14286),
    (1261, 2790, 0, 'Veron Amberstill', 'Ram Breeder', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1263, 1981, 0, 'Yarlyn Amberstill', NULL, 55, 55, 7, 0, 1, 0, 1, 1, 64, 64, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.14286),
    (1265, 1651, 0, 'Rudra Amberstill', NULL, 55, 55, 7, 0, 1, 0, 10, 10, 197, 197, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1266, 1683, 0, 'Tundra MacGrann', NULL, 57, 57, 7, 0, 1, 0, 20, 20, 919, 919, 0, 0, 0, 13, 1810, 24, 31, 31.856, 43.802, 1991, 100, 1, 1.14286),
    (1267, 1684, 0, 'Ragnar Thunderbrew', NULL, 55, 55, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.14286),
    (1268, 3441, 0, 'Ozzie Togglevolt', NULL, 875, 875, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1269, 3440, 0, 'Razzle Sprysprocket', NULL, 875, 875, 7, 0, 1, 0, 20, 20, 919, 919, 0, 0, 0, 13, 2000, 24, 31, 31.856, 43.802, 0, 100, 1, 1.14286),
    (1271, 1050, 0, 'Old Icebeard', NULL, 16, 16, 7, 0, 1, 1, 11, 11, 663, 663, 0, 0, 0, 18, 1550, 32, 47, 17.732, 24.3815, 1705, 100, 1.39, 1.14286),
    (1273, 3417, 0, 'Grawn Thromwyn', 'Weaponsmith', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1352, 328, 0, 'Fluffy', NULL, 55, 55, 8, 0, 1, 0, 1, 1, 64, 64, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 0.857143),
    (1354, 1396, 0, 'Apprentice Soren', NULL, 55, 55, 7, 0, 1, 0, 3, 3, 112, 112, 0, 0, 0, 2, 1980, 3, 5, 5.2272, 7.1874, 2178, 100, 1, 1.14286),
    (1355, 3416, 0, 'Cook Ghilm', 'Cooking Trainer', 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 5, 1920, 9, 13, 15.2064, 20.9088, 2112, 100, 1, 1.14286),
    (1358, 3419, 0, 'Miner Grothor', NULL, 57, 57, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 4, 1930, 7, 10, 13.5872, 18.6824, 2123, 100, 0.95, 1.14286),
    (1360, 3421, 0, 'Miner Grumnal', NULL, 57, 57, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 5, 1920, 9, 13, 15.2064, 20.9088, 2112, 100, 0.95, 1.14286),
    (1373, 3438, 0, 'Jarven Thunderbrew', NULL, 55, 55, 7, 0, 1, 0, 15, 15, 644, 644, 0, 0, 0, 9, 2000, 17, 22, 24.552, 33.759, 0, 100, 1, 1.14286),
    (1374, 3398, 0, 'Rejold Barleybrew', NULL, 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1375, 3405, 0, 'Marleth Barleybrew', NULL, 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 1, 1.14286),
    (1376, 3389, 0, 'Beldin Steelgrill', NULL, 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 1, 1.14286),
    (1377, 5106, 0, 'Pilot Stonegear', NULL, 55, 55, 7, 0, 1, 0, 20, 20, 919, 919, 0, 0, 0, 13, 1810, 24, 31, 31.856, 43.802, 1991, 100, 1, 1.14286),
    (1378, 5105, 0, 'Pilot Bellowfiz', NULL, 55, 55, 7, 0, 1, 0, 18, 18, 804, 804, 0, 0, 0, 11, 1830, 21, 26, 28.9872, 39.8574, 2013, 100, 1, 1.14286),
    (1388, 1050, 0, 'Vagash', NULL, 24, 24, 7, 0, 1, 1, 11, 11, 697, 697, 0, 0, 0, 28, 1550, 52, 68, 17.732, 24.3815, 1705, 100, 1.39, 1.14286),
    (1397, 5610, 0, 'Frostmane Seer', NULL, 37, 37, 7, 0, 2, 0, 8, 9, 147, 165, 165, 178, 0, 6, 2000, 11, 14, 13.4464, 18.4888, 0, 100, 1, 0.857143),
    (1679, 3413, 0, 'Avarus Kharag', NULL, 57, 57, 7, 0, 2, 0, 23, 23, 1106, 1106, 655, 655, 0, 18, 1760, 36, 42, 35.6224, 48.9808, 1936, 100, 1.05, 1.14286),
    (1689, 193, 0, 'Scarred Crag Boar', NULL, 1094, 1094, 1, 5, 1, 0, 9, 10, 175, 197, 0, 0, 0, 7, 1900, 13, 17, 15.048, 20.691, 2090, 100, 1, 0.857143),
    (1690, 3427, 0, 'Thrawn Boltar', 'Blacksmithing Supplies', 55, 55, 7, 0, 1, 0, 29, 29, 1528, 1528, 0, 0, 0, 20, 2000, 38, 49, 43.8944, 60.3548, 0, 100, 1, 1.14286),
    (1691, 3430, 0, 'Kreg Bilmn', 'General Supplies', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1692, 3414, 0, 'Golorn Frostbeard', 'Tradesman', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1694, 3392, 0, 'Loslor Rudge', 'Engineering Supplies', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1697, 3409, 0, 'Keeg Gibn', 'Ale & Wine', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1698, 3426, 0, 'Frast Dokner', 'Apprentice Weaponsmith', 55, 55, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 4, 1910, 7, 10, 13.4464, 18.4888, 2101, 100, 0.96, 1.14286),
    (1699, 3435, 0, 'Gremlock Pilsnor', 'Cooking Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (1700, 3400, 0, 'Paxton Ganter', 'Fishing Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (1701, 3424, 0, 'Dank Drizzlecut', 'Mining Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 79, 1910, 136, 206, 16.808, 23.111, 2101, 100, 0.96, 1.14286),
    (1702, 3394, 0, 'Bronk Guzzlegear', 'Journeyman Engineer', 55, 55, 7, 0, 1, 0, 24, 24, 1172, 1172, 0, 0, 0, 16, 1770, 30, 39, 37.3824, 51.4008, 1947, 100, 1, 1.14286),
    (1718, 730, 0, 'Rockjaw Raider', NULL, 59, 59, 7, 0, 1, 0, 3, 4, 100, 107, 0, 0, 0, 2, 1980, 3, 5, 5.2272, 7.1874, 2178, 100, 1, 0.857143),
    (1872, 3415, 0, 'Tharek Blackstone', NULL, 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 2000, 12, 14, 19.9584, 27.4428, 0, 100, 1, 1.14286),
    (1959, 1891, 0, 'Mountaineer Barleybrew', NULL, 57, 57, 7, 0, 1, 0, 20, 20, 919, 919, 0, 0, 0, 13, 1810, 24, 31, 31.856, 43.802, 1991, 100, 1, 1.14286),
    (1960, 5131, 0, 'Pilot Hammerfoot', NULL, 55, 55, 7, 0, 1, 0, 17, 17, 748, 748, 0, 0, 0, 9, 1840, 17, 22, 27.5264, 37.8488, 2024, 100, 1, 1.14286),
    (1961, 913, 0, 'Mangeclaw', NULL, 44, 44, 1, 4, 1, 0, 11, 11, 219, 219, 0, 0, 0, 8, 1860, 15, 18, 21.2784, 29.2578, 2046, 100, 0.99, 1.14286),
    (1965, 1567, 0, 'Mountaineer Thalos', NULL, 55, 55, 7, 0, 1, 0, 15, 15, 644, 644, 0, 0, 0, 9, 1860, 17, 22, 24.552, 33.759, 2046, 100, 1, 1.14286),
    (1977, 1570, 0, 'Senator Mehr Stonehallow', NULL, 55, 55, 7, 0, 1, 0, 50, 50, 3517, 3517, 0, 0, 0, 45, 1510, 85, 109, 66.44, 91.355, 1661, 100, 1.2, 1.14286),
    (2326, 3433, 0, 'Thamner Pol', 'Physician', 55, 55, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 2, 2000, 4, 5, 13.5872, 18.6824, 0, 100, 1, 1.14286),
    (2878, 5040, 0, 'Peria Lamenur', 'Pet Trainer', 55, 55, 7, 0, 1, 0, 40, 40, 2471, 2471, 1620, 1620, 0, 32, 2000, 61, 78, 56.672, 77.924, 0, 100, 1, 1.14286),
    (3162, 3408, 0, 'Burdrak Harglhelm', 'Leather Armor Merchant', 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 1, 1.14286),
    (3177, 3411, 0, 'Turuk Amberstill', 'Dwarven Weaponsmith', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (4772, 3410, 0, 'Ultham Ironhorn', 'Riding Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 100, 100, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (5392, 3396, 0, 'Yarr Hammerstone', 'Mining Trainer', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (5568, 6926, 6927, 'Captured Leper Gnome', NULL, 35, 35, 7, 0, 1, 0, 8, 8, 334, 334, 0, 0, 0, 4, 2000, 7, 10, 13.5872, 18.6824, 0, 100, 1, 1.14286),
    (5595, 3524, 3525, 'Ironforge Guard', NULL, 57, 57, 7, 0, 1, 0, 55, 55, 5194, 5194, 0, 0, 0, 293, 2000, 605, 665, 301.34, 422.17, 0, 100, 1, 1.14286),
    (5612, 3607, 0, 'Gimrizz Shadowcog', 'Warlock Trainer', 875, 875, 7, 0, 1, 0, 15, 15, 644, 644, 557, 557, 0, 9, 1500, 17, 22, 24.552, 33.759, 0, 100, 1, 1.14286),
    (6113, 5611, 0, 'Vejrek', NULL, 37, 37, 7, 0, 0, 0, 11, 11, 253, 253, 0, 0, 0, 8, 1860, 15, 18, 21.2784, 29.2578, 2046, 100, 1.19, 1.14286),
    (6119, 4864, 0, 'Tog Rustsprocket', NULL, 875, 875, 7, 0, 8, 0, 10, 10, 413, 413, 382, 382, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (6123, 4956, 0, 'Dark Iron Spy', NULL, 14, 14, 7, 0, 1, 0, 9, 10, 167, 301, 0, 0, 0, 7, 1900, 13, 17, 15.048, 20.691, 2090, 100, 0.97, 1.14286),
    (6124, 4957, 0, 'Captain Beld', 'Dark Iron Captain', 54, 54, 7, 0, 1, 0, 11, 11, 208, 208, 0, 0, 0, 9, 1860, 17, 22, 21.2784, 29.2578, 2046, 100, 0.99, 1.14286),
    (6177, 4890, 0, 'Narm Faulk', NULL, 35, 35, 7, 0, 0, 0, 8, 8, 334, 334, 165, 165, 0, 4, 1930, 7, 10, 13.5872, 18.6824, 2123, 100, 0.95, 1.14286),
    (6181, 4893, 0, 'Jordan Stilwell', NULL, 12, 12, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.14286),
    (6328, 5042, 0, 'Dannie Fizzwizzle', 'Demon Trainer', 875, 875, 7, 0, 8, 0, 14, 14, 594, 594, 710, 710, 0, 8, 1500, 15, 19, 23.0384, 31.6778, 0, 100, 1, 1.14286),
    (6376, 5093, 0, 'Wren Darkspring', 'Demon Trainer', 875, 875, 7, 0, 8, 0, 5, 5, 166, 166, 230, 230, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (6782, 9211, 0, 'Hands Springsprocket', NULL, 64, 64, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (6806, 5525, 0, 'Tannok Frosthammer', 'Innkeeper Assistant', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 2000, 9, 13, 16.808, 23.111, 0, 100, 1, 1.14286),
    (6886, 5648, 0, 'Onin MacHammar', NULL, 55, 55, 7, 0, 1, 0, 12, 12, 500, 500, 0, 0, 0, 6, 1890, 12, 14, 19.9584, 27.4428, 2079, 100, 0.97, 1.14286),
    (7560, 328, 0, 'Snowshoe Rabbit', NULL, 1, 1, 1, 0, 0, 0, 20, 20, 42, 42, 0, 0, 0, 5, 1810, 11, 12, 1, 2, 1991, 100, 1, 1.14286),
    (7843, 6973, 6974, 'Gnomeregan Evacuee', NULL, 64, 64, 7, 0, 2, 0, 24, 24, 1172, 1172, 0, 0, 0, 18, 2000, 34, 43, 36.96, 50.82, 0, 100, 1, 1.14286),
    (7954, 7038, 0, 'Binjy Featherwhistle', 'Mechanostrider Pilot', 875, 875, 7, 0, 1, 0, 50, 50, 3517, 3517, 0, 0, 0, 45, 1510, 85, 109, 66.44, 91.355, 1661, 100, 1, 1.14286),
    (7955, 7039, 0, 'Milli Featherwhistle', 'Mechanostrider Merchant', 875, 875, 7, 0, 1, 0, 50, 50, 3517, 3517, 0, 0, 0, 45, 1510, 85, 109, 66.44, 91.355, 1661, 100, 1, 1.14286),
    (8416, 7852, 0, 'Felix Whindlebolt', NULL, 875, 875, 7, 0, 1, 0, 2, 2, 87, 87, 0, 0, 0, 2, 1990, 3, 5, 3.5024, 4.8158, 2189, 100, 1, 1.14286),
    (8503, 7807, 0, 'Gibblewilt', NULL, 63, 63, 7, 0, 8, 2, 11, 11, 199, 199, 459, 459, 0, 26, 1550, 50, 64, 17.732, 24.3815, 1705, 100, 1, 0.857143),
    (8508, 7808, 0, 'Gretta Ganter', 'Fishing Supplies', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (9980, 9253, 0, 'Shelby Stoneflint', 'Stable Master', 55, 55, 7, 0, 1, 0, 30, 30, 1605, 1605, 0, 0, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.14286),
    (10610, 9946, 0, 'Angus', 'Dwarven Mortar Team', 55, 55, 7, 0, 1, 0, 11, 11, 456, 456, 0, 0, 0, 6, 1900, 12, 14, 18.392, 25.289, 2090, 100, 1, 1.14286),
    (10611, 9947, 0, 'Shorty', 'Dwarven Mortar Team', 55, 55, 7, 0, 1, 0, 10, 10, 413, 413, 0, 0, 0, 5, 1910, 9, 13, 16.808, 23.111, 2101, 100, 1, 1.14286),
    (10803, 10111, 0, 'Rifleman Wheeler', NULL, 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 5, 1920, 9, 13, 15.2064, 20.9088, 2112, 100, 1, 1.14286),
    (10804, 10110, 0, 'Rifleman Middlecamp', NULL, 55, 55, 7, 0, 1, 0, 9, 9, 372, 372, 0, 0, 0, 5, 1920, 9, 13, 15.2064, 20.9088, 2112, 100, 1, 1.14286),
    (10805, 10109, 0, 'Spotter Klemmy', NULL, 55, 55, 7, 0, 1, 0, 6, 6, 196, 196, 0, 0, 0, 3, 1950, 6, 8, 10.296, 14.157, 2145, 100, 1, 1.14286),
    (11807, 11752, 0, 'Tristane Shadowstone', NULL, 55, 55, 7, 0, 2, 0, 15, 15, 644, 644, 326, 326, 0, 9, 1860, 17, 22, 24.552, 33.759, 2046, 100, 1, 1.14286),
    (11875, 1555, 0, 'Mortar Team Target Dummy', NULL, 914, 914, 9, 0, 0, 0, 1, 1, 64, 64, 0, 0, 0, 5, 2000, 10, 11, 1.76, 2.42, 2200, 100, 1, 1),
    (11941, 11899, 0, 'Yori Crackhelm', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (12363, 6569, 0, 'Blue Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 1, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 1.38571),
    (12365, 9473, 0, 'Red Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 1, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (12366, 9476, 0, 'Unpainted Mechanostrider X', NULL, 35, 35, 9, 0, 1, 0, 1, 1, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 1.38571),
    (12367, 10661, 0, 'Green Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 1, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 1.38571),
    (12372, 2785, 0, 'Brown Ram', NULL, 35, 35, 1, 0, 1, 0, 1, 1, 64, 64, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (12373, 2736, 0, 'Gray Ram', NULL, 35, 35, 1, 0, 1, 0, 1, 1, 64, 64, 0, 0, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (12374, 2786, 0, 'White Riding Ram Mount', NULL, 35, 35, 1, 0, 1, 0, 1, 1, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (12385, 12434, 0, 'Mortar Team Advanced Target Dummy', NULL, 914, 914, 9, 0, 0, 0, 1, 1, 64, 64, 0, 0, 0, 5, 2000, 10, 11, 1.76, 2.42, 2200, 100, 1, 1),
    (12427, 12474, 0, 'Mountaineer Dolf', NULL, 57, 57, 7, 0, 1, 0, 7, 7, 228, 228, 0, 0, 0, 36, 2000, 9, 12, 11.9504, 16.4318, 0, 100, 1, 1.14286),
    (12738, 12967, 0, 'Nori Pridedrift', NULL, 55, 55, 7, 0, 1, 0, 5, 5, 166, 166, 0, 0, 0, 3, 1960, 6, 8, 8.624, 11.858, 2156, 100, 1, 1.14286),
    (12996, 1598, 1608, 'Mounted Ironforge Mountaineer', NULL, 57, 57, 7, 0, 0, 0, 30, 30, 1605, 1605, 686, 686, 0, 22, 2000, 42, 53, 45.144, 62.073, 0, 100, 1, 1.38571),
    (13000, 12940, 12942, 'Gnome Engineer', NULL, 875, 875, 7, 0, 0, 0, 15, 15, 644, 644, 0, 0, 0, 9, 2000, 17, 22, 24.552, 33.759, 0, 100, 1, 1.14286),
    (13076, 1598, 0, 'Dun Morogh Mountaineer', NULL, 57, 57, 7, 0, 1, 0, 30, 30, 1903, 1903, 0, 0, 0, 22, 1710, 42, 53, 42.1344, 57.9348, 1881, 100, 1, 1.14286),
    (14546, 14347, 0, 'Swift Brown Ram', NULL, 35, 35, 1, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (14547, 14346, 0, 'Swift White Ram', NULL, 35, 35, 1, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (14548, 14576, 0, 'Swift Gray Ram', NULL, 35, 35, 1, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (14551, 14377, 0, 'Swift Yellow Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 2200, 100, 1, 1.38571),
    (14552, 14376, 0, 'Swift White Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 1.38571),
    (14553, 14374, 0, 'Swift Green Mechanostrider', NULL, 35, 35, 9, 0, 1, 0, 1, 2, 64, 64, 53, 53, 0, 1, 2000, 2, 2, 1.76, 2.42, 0, 100, 1, 1.38571),
    (15011, 15134, 0, 'Wagner Hammerstrike', NULL, 55, 55, 7, 0, 1, 0, 55, 55, 4108, 4108, 0, 0, 0, 51, 1460, 96, 125, 70.664, 97.163, 1606, 100, 1, 1.14286),
    (15113, 15222, 0, 'Honored Hero', NULL, 35, 35, 10, 0, 1, 0, 60, 60, 3857, 3857, 0, 0, 0, 87, 1410, 164, 212, 74.448, 102.366, 1551, 100, 1, 1.14286),
    (15569, 15611, 0, 'Elder Goldwell', NULL, 35, 35, 7, 0, 8, 0, 60, 60, 3857, 3857, 5751, 5751, 0, 92, 1390, 174, 224, 112, 210, 1590, 100, 1, 1.14286),
    (15906, 15887, 0, 'Ironforge Reveler', NULL, 35, 35, 7, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 1, 2000, 2, 2, 0, 0, 0, 0, 1, 1.14286),
    (16781, 16412, 16431, 'Midsummer Celebrant', NULL, 35, 35, 7, 0, 1, 0, 2, 4, 19, 42, 0, 0, 0, 2, 2000, 3, 6, 0, 0, 0, 100, 1, 1.14286);

-- Set flags and other setttings for creatures: these are creatures from zone 1
UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 460;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 658;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 704;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 705;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 706;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 707;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 708;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 713;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 714;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 721;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 724;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = 1024, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 727;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 786;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 808;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 829;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6391, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 836;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 837;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 853;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 895;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 912;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 916;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 926;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 944;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 945;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 946;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1104;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1115;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1116;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1117;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1118;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1119;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1120;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1121;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1122;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1123;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1124;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1125;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1126;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1127;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1128;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1129;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1130;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1131;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1132;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1133;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1134;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1135;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1137;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1138;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1196;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1199;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1201;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1211;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1226;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1228;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1229;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE8, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1231;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1232;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1234;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1237;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1238;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1240;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1241;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1243;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1245;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE35, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1247;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1252;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1253;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1254;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1255;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1256;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1260;

UPDATE `creature_template`
SET
    `npcflag` = 7, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1261;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1263;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1265;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1266;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1267;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1268;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1269;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1271;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1273;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1352;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1354;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1355;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1358;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1360;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1373;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1374;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1375;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1376;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1377;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1378;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1388;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 32768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1397;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1679;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1689;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6390, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1690;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1691;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1692;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1694;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1697;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1698;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = 1026, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1699;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1700;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1701;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1702;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1718;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1872;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1959;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1960;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_TAMEABLE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 1961;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1965;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 1977;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = 1026, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2326;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE8, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 2878;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 3162;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE6388, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 3177;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE7, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 4772;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 5392;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 768,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 5568;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 36864,
    `flags_extra` = 1024, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 5595;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE7, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 5612;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6113;

UPDATE `creature_template`
SET
    `npcflag` = 3, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6119;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6123;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6124;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6177;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6181;

UPDATE `creature_template`
SET
    `npcflag` = 4, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6328;

UPDATE `creature_template`
SET
    `npcflag` = 4, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6376;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6782;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6806;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 6886;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 7560;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 7843;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 7954;

UPDATE `creature_template`
SET
    `npcflag` = 7, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 7955;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 8416;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 8503;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 8508;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 9980;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10610;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10611;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10803;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10804;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 10805;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 11807;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 11875;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 11941;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12363;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12365;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12366;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12367;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12372;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12373;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12374;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12385;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 0, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12427;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12738;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4096,
    `flags_extra` = 1024, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 12996;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 4608,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 13000;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = 1024, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 13076;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14546;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14547;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14548;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14551;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14552;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = 16384,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 14553;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 15011;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 15113;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 15569;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 36864,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE `entry` = 15906;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 36864,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_RANDOM, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE `entry` = 16781;
