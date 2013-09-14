-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature templates used by character
-- spell or in game systems.
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
SET @CREATURE_TRAINER_TYPE_CLASS                = 0;
SET @CREATURE_TRAINER_TYPE_MOUNTS               = 1;
SET @CREATURE_TRAINER_TYPE_TRADESKILLS          = 2;
SET @CREATURE_TRAINER_TYPE_PETS                 = 3;

-- Provide variables for creature movement types
SET @CREATURE_MOVEMENT_IDLE                     = 0;
SET @CREATURE_MOVEMENT_RANDOM                   = 1;
SET @CREATURE_MOVEMENT_WAYPOINT                 = 2;

-- Provide variables for creature inhabit types
SET @CREATURE_INHABIT_GROUND                    = 1;
SET @CREATURE_INHABIT_WATER                     = 2;
SET @CREATURE_INHABIT_GROUND_WATER              = @CREATURE_INHABIT_GROUND | @CREATURE_INHABIT_WATER;
SET @CREATURE_INHABIT_AIR                       = 4;
SET @CREATURE_INHABIT_ANY                       = @CREATURE_INHABIT_GROUND_WATER | @CREATURE_INHABIT_AIR;

-- Provide varbiables for creature immunity masks
SET @CREATURE_IMMUNITY_NONE                     = 0;
SET @CREATURE_IMMUNITY_CHARM                    = 1;
SET @CREATURE_IMMUNITY_CONFUSED                 = 2;
SET @CREATURE_IMMUNITY_DISARM                   = 4;
SET @CREATURE_IMMUNITY_DISTRACT                 = 8;
SET @CREATURE_IMMUNITY_FEAR                     = 16;
SET @CREATURE_IMMUNITY_FUMBLE                   = 32;
SET @CREATURE_IMMUNITY_ROOT                     = 64;
SET @CREATURE_IMMUNITY_PACIFY                   = 128;
SET @CREATURE_IMMUNITY_SILENCE                  = 256;
SET @CREATURE_IMMUNITY_SLEEP                    = 512;
SET @CREATURE_IMMUNITY_SNARE                    = 1024;
SET @CREATURE_IMMUNITY_STUN                     = 2048;
SET @CREATURE_IMMUNITY_FREEZE                   = 4096;
SET @CREATURE_IMMUNITY_KNOCKOUT                 = 8192;
SET @CREATURE_IMMUNITY_BLEED                    = 16384;
SET @CREATURE_IMMUNITY_BANDAGE                  = 32768;
SET @CREATURE_IMMUNITY_POLYMORPH                = 65536;
SET @CREATURE_IMMUNITY_BANISH                   = 131072;
SET @CREATURE_IMMUNITY_SHIELD                   = 262144;
SET @CREATURE_IMMUNITY_SHACKLE                  = 524288;
SET @CREATURE_IMMUNITY_MOUNT                    = 1048576;
SET @CREATURE_IMMUNITY_PERSUADE                 = 2097152;
SET @CREATURE_IMMUNITY_TURN                     = 4194304;
SET @CREATURE_IMMUNITY_HORROR                   = 8388608;
SET @CREATURE_IMMUNITY_INVULNERABILITY          = 16777216;
SET @CREATURE_IMMUNITY_INTERRUPT                = 33554432;
SET @CREATURE_IMMUNITY_DAZE                     = 67108864;
SET @CREATURE_IMMUNITY_DISCOVERY                = 134217728;
SET @CREATURE_IMMUNITY_IMMUNE_SHIELD            = 268435456;
SET @CREATURE_IMMUNITY_SAPPED                   = 536870912;

-- Provide variables for creature extra flags
SET @CREATURE_FLAG_EXTRA_NONE                   = 0;
SET @CREATURE_FLAG_EXTRA_INSTANCE_BIND          = 1;
SET @CREATURE_FLAG_EXTRA_CIVILIAN               = 2;
SET @CREATURE_FLAG_EXTRA_NO_PARRY               = 4;
SET @CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN        = 8;
SET @CREATURE_FLAG_EXTRA_NO_BLOCK               = 16;
SET @CREATURE_FLAG_EXTRA_NO_CRUSH               = 32;
SET @CREATURE_FLAG_EXTRA_NO_XP_AT_KILL          = 64;
SET @CREATURE_FLAG_EXTRA_INVISIBLE              = 128;
SET @CREATURE_FLAG_EXTRA_NOT_TAUNTABLE          = 256;
SET @CREATURE_FLAG_EXTRA_AGGRO_ZONE             = 512;
SET @CREATURE_FLAG_EXTRA_GUARD                  = 1024;
SET @CREATURE_FLAG_EXTRA_NO_TALKTO_CREDIT       = 2048;

-- Damage schools
SET @DMG_PHYSICAL                               = 0;
SET @DMG_HOLY                                   = 1;
SET @DMG_FIRE                                   = 2;
SET @DMG_NATURE                                 = 3;
SET @DMG_FROST                                  = 4;
SET @DMG_SHADOW                                 = 5;
SET @DMG_ARCANE                                 = 6;

-- Provide variables for gender
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Insert creature templates: these are creatures used by game systems
INSERT INTO `creature_template` (`entry`, `modelid_1`, `modelid_2`, `name`, `subname`, `faction_A`, `faction_H`, `type`, `family`, `unit_class`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`) VALUES
    (541, 6852, 0, 'Riding Gryphon', NULL, 35, 35, 1, 0, 0, 0, 29, 29, 1528, 1528, 1126, 1126, 0, 4, 1720, 9, 10, 43.8944, 60.3548, 1892, 100, 1, 1.14286),
    (2224, 6851, 0, 'Wind Rider', NULL, 35, 35, 1, 0, 0, 0, 29, 29, 1528, 1528, 1126, 1126, 0, 4, 1720, 9, 10, 43.8944, 60.3548, 1892, 100, 1, 1.14286),
    (3574, 1566, 0, 'Riding Bat', NULL, 35, 35, 1, 0, 0, 0, 29, 29, 1528, 1528, 1126, 1126, 0, 4, 1720, 9, 10, 43.8944, 60.3548, 1892, 100, 1, 1.14286),
    (3837, 1936, 0, 'Riding Hippogryph', NULL, 35, 35, 1, 0, 0, 0, 29, 29, 1528, 1528, 1126, 1126, 0, 4, 1720, 9, 10, 43.8944, 60.3548, 1892, 100, 1, 1.14286),
    (12861, 1825, 0, 'Wisp', 'Ghost Visual', 35, 35, 8, 0, 0, 0, 1, 1, 8, 8, 0, 0, 0, 1, 0, 2, 2, 0, 0, 0, 0, 1, 1.14286);

-- Insert creature templates: these are creatures summoned by Warlocks
INSERT INTO `creature_template` (`entry`, `modelid_1`, `modelid_2`, `name`, `subname`, `faction_A`, `faction_H`, `type`, `family`, `unit_class`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`) VALUES
    (89, 169, 0, 'Infernal', NULL, 954, 954, 3, 0, 0, 0, 50, 50, 3517, 3517, 3460, 3460, 0, 93, 1510, 183, 220, 66.44, 91.355, 1661, 100, 1.4, 1.14286),
    (416, 4449, 0, 'Imp', NULL, 14, 14, 3, 23, 0, 0, 5, 5, 166, 166, 85, 85, 0, 3, 2000, 6, 8, 8.624, 11.858, 0, 100, 1, 1.14286),
    (417, 850, 0, 'Felhunter', NULL, 115, 115, 3, 15, 0, 0, 60, 60, 3857, 3857, 1666, 3195, 0, 58, 2000, 110, 142, 74.448, 102.366, 0, 100, 1, 1.14286),
    (1860, 1132, 0, 'Voidwalker', NULL, 14, 14, 3, 16, 0, 0, 17, 17, 548, 548, 300, 300, 0, 8, 2000, 15, 19, 23.0384, 31.6778, 0, 100, 1.1, 1.14286),
    (1863, 4162, 0, 'Succubus', NULL, 14, 14, 3, 17, 0, 0, 20, 20, 919, 919, 436, 436, 0, 13, 2000, 24, 31, 31.856, 43.802, 0, 100, 1.1, 1.14286),
    (4277, 2421, 0, 'Eye of Kilrogg', NULL, 35, 35, 3, 3, 0, 0, 22, 22, 1042, 1042, 0, 0, 0, 22, 1790, 44, 52, 34.6544, 47.6498, 1969, 100, 1.03, 1.14286),
    (11859, 1912, 0, 'Doomguard', NULL, 954, 954, 3, 0, 0, 0, 60, 60, 4802, 4802, 2783, 2783, 0, 120, 1410, 236, 284, 74.448, 102.366, 1551, 100, 1.51, 1.14286);

-- Insert creature templates: these are forms assumed by Druids
INSERT INTO `creature_template` (`entry`, `modelid_1`, `modelid_2`, `name`, `subname`, `faction_A`, `faction_H`, `type`, `family`, `unit_class`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`) VALUES
    (4253, 2281, 0, 'Bear Form', 'Night Elf Druid', 35, 35, 1, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (4261, 2289, 0, 'Bear Form', 'Tauren Druid', 35, 35, 1, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (4408, 2428, 0, 'Aquatic Form', 'Night Elf Druid', 35, 35, 1, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (4410, 2428, 0, 'Aquatic Form', 'Tauren Druid', 35, 35, 1, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (6571, 892, 0, 'Cat Form', 'Night Elf Druid', 35, 35, 1, 4, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (6572, 1058, 0, 'Cat Form', 'Tauren Druid', 35, 35, 1, 4, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (6573, 918, 0, 'Travel Form', 'Druid', 35, 35, 1, 4, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (15313, 15374, 0, 'Moonkin', 'Night Elf Druid', 35, 35, 7, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286),
    (15314, 15375, 0, 'Moonkin', 'Tauren Druid', 35, 35, 7, 0, 1, 0, 1, 1, 5000, 5000, 0, 0, 0, 24, 2000, 2, 2, 1, 1, 0, 0, 1.2, 1.14286);

-- Set flags and other setttings for creatures: these are creatures used by game systems
UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 541;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 2224;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 3574;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 3837;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 12861;

-- Set flags and other setttings for creatures: these are creatures summoned by Warlocks
UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 89;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 416;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE
    `entry` = 417;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE
    `entry` = 1860;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE
    `entry` = 1863;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND
WHERE
    `entry` = 4277;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 11859;

-- Set flags and other setttings for creatures: these are forms assumed by Druids
UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 4253;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 4261;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 4408;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 4410;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 6571;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 6572;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_CIVILIAN, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 6573;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 15313;

UPDATE `creature_template`
SET
    `npcflag` = @CREATURE_FLAG_NPC_NONE, `dynamicflags` = @CREATURE_FLAG_DYN_NONE, `unit_flags` = 0,
    `flags_extra` = @CREATURE_FLAG_EXTRA_NONE, `type_flags` = @CREATURE_TYPE_FLAG_NONE, `mechanic_immune_mask` = @CREATURE_IMMUNITY_NONE,
    `RegenHealth` = 1, `MovementType` = @CREATURE_MOVEMENT_IDLE, `InhabitType` = @CREATURE_INHABIT_GROUND_WATER
WHERE
    `entry` = 15314;
