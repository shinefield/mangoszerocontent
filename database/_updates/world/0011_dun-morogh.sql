-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add Dun Morogh to world database
--
-- This update will populate the world database with data required to play
-- in the Dun Morogh zone.
--
-- Global Unique Identifier ranges used:
--
-- - Creatures, Dun Morogh, Azeroth: 501-

-- Provide variables for gender ----------------------------------------------
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Provide variables for races, and classes ----------------------------------
SET @RACE_HUMAN                                 = 1;
SET @RACE_ORC                                   = 2;
SET @RACE_DWARF                                 = 3;
SET @RACE_NIGHT_ELF                             = 4;
SET @RACE_UNDEAD                                = 5;
SET @RACE_TAUREN                                = 6;
SET @RACE_GNOME                                 = 7;
SET @RACE_TROLL                                 = 8;
SET @RACE_GOBLIN                                = 9;

SET @CLASS_WARRIOR                              = 1;
SET @CLASS_PALADIN                              = 2;
SET @CLASS_HUNTER                               = 3;
SET @CLASS_ROGUE                                = 4;
SET @CLASS_PRIEST                               = 5;
SET @CLASS_SHAMAN                               = 7;
SET @CLASS_MAGE                                 = 8;
SET @CLASS_WARLOCK                              = 9;
SET @CLASS_DRUID                                = 11;

-- Provide variables for NPC flags -------------------------------------------
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

-- Provide variables for NPC rank --------------------------------------------
SET @CREATURE_RANK_NORMAL                       = 0; -- Default rank
SET @CREATURE_RANK_ELITE                        = 1; -- Higher damage, more health, better loot
SET @CREATURE_RANK_RARE_ELITE                   = 2; -- Rare mob but with elite damage and health
SET @CREATURE_RANK_WORLD_BOSS                   = 3; -- Highest rank, best loot, longest respawn time
SET @CREATURE_RANK_RARE                         = 4; -- Somewhat better loot, longer respawn time

-- Provide variables for NPC classes -----------------------------------------
SET @CREATURE_CLASS_WARRIOR                     = 1;
SET @CREATURE_CLASS_PALADIN                     = 2;
SET @CREATURE_CLASS_ROGUE                       = 4;
SET @CREATURE_CLASS_MAGE                        = 8;

-- Provide variables for creature type ---------------------------------------
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

-- Provide variables for creature of type 1 (Beast) --------------------------
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

-- Provide variables for creature type flags ---------------------------------
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

-- Provide variables for creatures flagged as trainer ------------------------
SET @CREATURE_TRAINER_TYPE_CLASS                = 0;
SET @CREATURE_TRAINER_TYPE_MOUNTS               = 1;
SET @CREATURE_TRAINER_TYPE_TRADESKILLS          = 2;
SET @CREATURE_TRAINER_TYPE_PETS                 = 3;

-- Provide variables for creature movement types -----------------------------
SET @CREATURE_MOVEMENT_IDLE                     = 0;
SET @CREATURE_MOVEMENT_RANDOM                   = 1;
SET @CREATURE_MOVEMENT_WAYPOINT                 = 2;

-- Provide variables for creature inhabit types ------------------------------
SET @CREATURE_INHABIT_GROUND                    = 1;
SET @CREATURE_INHABIT_WATER                     = 2;
SET @CREATURE_INHABIT_GROUND_WATER              = @CREATURE_INHABIT_GROUND | @CREATURE_INHABIT_WATER;
SET @CREATURE_INHABIT_AIR                       = 4;
SET @CREATURE_INHABIT_ANY                       = @CREATURE_INHABIT_GROUND_WATER | @CREATURE_INHABIT_AIR;

-- Provide variables for creature power regeneration -------------------------
SET @CREATURE_REGENERATE_HEALTH                 = 1;
SET @CREATURE_REGENERATE_POWER                  = 2;
SET @CREATURE_REGENERATE_ALL                    = @CREATURE_REGENERATE_HEALTH | @CREATURE_REGENERATE_POWER;

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.2.0 (dev-0011)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.2.0 (dev-0011)'
WHERE
    `version`             = 'mangos-zero - version 0.1.3 (dev-0010)'
;

-- Insert game object templates for 'Dun Morogh' -----------------------------

-- Insert creature models for 'Dun Morogh' -----------------------------------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`)
VALUES
     (193,      1.176,              1,              @MODEL_GENDER_NONE,         0,          0)
    ,(381,      0.882,              0.75,           @MODEL_GENDER_NONE,         0,          0)
    ,(606,      0.44275,            0.825,          @MODEL_GENDER_NONE,         0,          0)
    ,(607,      0.737492,           0.627119,       @MODEL_GENDER_NONE,         0,          0)
    ,(611,      0.5635,             1.05,           @MODEL_GENDER_NONE,         0,          0)
    ,(719,      0.51935,            1.275,          @MODEL_GENDER_NONE,         0,          0)
    ,(723,      0.7245,             1.35,           @MODEL_GENDER_NONE,         0,          0)
    ,(726,      0.68425,            1.275,          @MODEL_GENDER_NONE,         0,          0)
    ,(730,      0.5635,             1.05,           @MODEL_GENDER_NONE,         0,          0)
    ,(744,      1.176,              1,              @MODEL_GENDER_NONE,         0,          0)
    ,(748,      0.583449,           1.10085,        @MODEL_GENDER_NONE,         0,          0)
    ,(785,      1.09576,            0.913136,       @MODEL_GENDER_NONE,         0,          0)
    ,(830,      0.92575,            1.725,          @MODEL_GENDER_NONE,         0,          0)
    ,(855,      0.6,                0.5,            @MODEL_GENDER_NONE,         0,          0)
    ,(913,      0.611,              1.5,            @MODEL_GENDER_NONE,         0,          0)
    ,(929,      0.55,               0.825,          @MODEL_GENDER_NONE,         0,          0)
    ,(931,      0.85,               1.275,          @MODEL_GENDER_NONE,         0,          0)
    ,(950,      0.7,                1.05,           @MODEL_GENDER_NONE,         0,          0)
    ,(954,      0.67575,            1.275,          @MODEL_GENDER_NONE,         0,          0)
    ,(1050,     1,                  1.5,            @MODEL_GENDER_NONE,         0,          0)
    ,(1354,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1355,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1362,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1363,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1376,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1396,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1567,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1569,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1570,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1598,     0.347,              1.5,            @MODEL_GENDER_MALE,         1608,       0)
    ,(1608,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       1598,       0)
    ,(1616,     2,                  2.31,           @MODEL_GENDER_MALE,         0,          0)
    ,(1622,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1623,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1651,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(1683,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1684,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(1891,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1930,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(1981,     0.2082,             0.9,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(2786,     0.35,               2,              @MODEL_GENDER_NONE,         0,          0)
    ,(2790,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3388,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3389,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3391,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3392,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3393,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3394,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3395,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3396,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3397,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3398,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3399,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3400,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3401,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(3405,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(3406,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(3407,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3408,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3409,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3410,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3411,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3412,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3413,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3414,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3415,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3416,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3417,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3418,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3419,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3420,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3421,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3422,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3423,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3424,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(3425,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3426,     2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(3427,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3429,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3430,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3431,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3433,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3434,     0.3817,             1.65,           @MODEL_GENDER_MALE,         0,          0)
    ,(3435,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3436,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3438,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3440,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(3441,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(3513,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3524,     0.347,              1.5,            @MODEL_GENDER_MALE,         3525,       0)
    ,(3525,     0.347,              1.5,            @MODEL_GENDER_MALE,         3524,       0)
    ,(3558,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(3607,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(4864,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(4890,     2,                  2.56,           @MODEL_GENDER_MALE,         0,          0)
    ,(4893,     0.306,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(4956,     2,                  2.56,           @MODEL_GENDER_MALE,         0,          0)
    ,(4957,     2,                  2.56,           @MODEL_GENDER_MALE,         0,          0)
    ,(5040,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(5042,     0.3519,             1.725,          @MODEL_GENDER_FEMALE,       0,          0)
    ,(5105,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(5106,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(5131,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(5525,     0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(5605,     0.2295,             1.125,          @MODEL_GENDER_MALE,         0,          0)
    ,(5606,     0.2295,             1.125,          @MODEL_GENDER_MALE,         0,          0)
    ,(5607,     0.2448,             1.2,            @MODEL_GENDER_MALE,         0,          0)
    ,(5608,     0.2448,             1.2,            @MODEL_GENDER_MALE,         0,          0)
    ,(5609,     2,                  2.28,           @MODEL_GENDER_MALE,         0,          0)
    ,(5610,     0.2448,             1.2,            @MODEL_GENDER_MALE,         0,          0)
    ,(5611,     2,                  2.37,           @MODEL_GENDER_MALE,         0,          0)
    ,(5612,     0.2754,             1.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(5613,     0.2754,             1.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(5625,     2,                  3.57,           @MODEL_GENDER_MALE,         0,          0)
    ,(5626,     0.2448,             1.2,            @MODEL_GENDER_MALE,         0,          0)
    ,(5648,     2,                  2.56,           @MODEL_GENDER_MALE,         0,          0)
    ,(6921,     2,                  2.35,           @MODEL_GENDER_MALE,         6922,       0)
    ,(6922,     2,                  2.35,           @MODEL_GENDER_MALE,         6921,       0)
    ,(6926,     2,                  2.35,           @MODEL_GENDER_MALE,         6927,       0)
    ,(6927,     0.3519,             1.725,          @MODEL_GENDER_MALE,         6926,       0)
    ,(6973,     0.3519,             1.725,          @MODEL_GENDER_MALE,         6974,       0)
    ,(6974,     0,                  0,              @MODEL_GENDER_MALE,         6973,       0)
    ,(7038,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(7039,     0.3519,             1.725,          @MODEL_GENDER_FEMALE,       0,          0)
    ,(7807,     2,                  3.55,           @MODEL_GENDER_MALE,         0,          0)
    ,(7808,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(7852,     0.334305,           1.63875,        @MODEL_GENDER_MALE,         0,          0)
    ,(8840,     0.51935,            1.275,          @MODEL_GENDER_NONE,         0,          0)
    ,(8843,     0.38317,            0.940678,       @MODEL_GENDER_NONE,         0,          0)
    ,(9211,     0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(9253,     0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(9946,     0.4164,             1.8,            @MODEL_GENDER_MALE,         0,          0)
    ,(9947,     0.2776,             1.2,            @MODEL_GENDER_MALE,         0,          0)
    ,(10109,    0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(10110,    0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(10111,    0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(10215,    0.3519,             1.725,          @MODEL_GENDER_MALE,         0,          0)
    ,(10216,    2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)
    ,(11416,    1.11102,            0.925847,       @MODEL_GENDER_NONE,         0,          0)
    ,(11422,    0.745763,           0.932203,       @MODEL_GENDER_NONE,         0,          0)
    ,(11752,    0.347,              1.5,            @MODEL_GENDER_FEMALE,       0,          0)
    ,(11899,    0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(12065,    2,                  2.35,           @MODEL_GENDER_MALE,         12066,      0)
    ,(12066,    0,                  0,              @MODEL_GENDER_FEMALE,       12065,      0)
    ,(12474,    0.347,              1.5,            @MODEL_GENDER_MALE,         0,          0)
    ,(12940,    0.3519,             1.725,          @MODEL_GENDER_FEMALE,       12942,      0)
    ,(12942,    0.3519,             1.725,          @MODEL_GENDER_MALE,         12940,      0)
    ,(12967,    2,                  2.35,           @MODEL_GENDER_MALE,         0,          0)

;

-- Insert creature templates for 'Dun Morogh' --------------------------------
INSERT INTO `creature_template`
    (`Entry`,  `ModelId1`,  `ModelId2`, `Name`,                         `SubName`)
VALUES
     (460,      1930,       0,          'Alamar Grimm',                 'Warlock Trainer')
    ,(658,      1362,       0,          'Sten Stoutarm',                NULL)
    ,(704,      11416,      0,          'Ragged Timber Wolf',           NULL)
    ,(705,      855,        0,          'Ragged Young Wolf',            NULL)
    ,(706,      5606,       0,          'Frostmane Troll Whelp',        NULL)
    ,(707,      606,        0,          'Rockjaw Trogg',                NULL)
    ,(708,      607,        0,          'Small Crag Boar',              NULL)
    ,(713,      1355,       0,          'Balir Frosthammer',            NULL)
    ,(714,      1363,       0,          'Talin Keeneye',                NULL)
    ,(724,      611,        0,          'Burly Rockjaw Trogg',          NULL)
    ,(727,      1598,       1608,       'Ironforge Mountaineer',        NULL)
    ,(786,      1354,       0,          'Grelin Whitebeard',            NULL)
    ,(808,      5609,       0,          'Grik\'nir the Cold',           NULL)
    ,(829,      3388,       0,          'Adlin Pridedrift',             'General Supplies')
    ,(836,      3406,       0,          'Durnan Furcutter',             'Cloth & Leather Armor Merchant')
    ,(837,      3401,       0,          'Branstock Khalder',            'Priest Trainer')
    ,(853,      1598,       1608,       'Coldridge Mountaineer',        NULL)
    ,(895,      3395,       0,          'Thorgas Grimson',              'Hunter Trainer')
    ,(912,      3399,       0,          'Thran Khorman',                'Warrior Trainer')
    ,(916,      3407,       0,          'Solm Hargrin',                 'Rogue Trainer')
    ,(926,      3393,       0,          'Bromos Grummner',              'Paladin Trainer')
    ,(944,      10216,      0,          'Marryk Nurribit',              'Mage Trainer')
    ,(945,      3391,       0,          'Rybrad Coldbank',              'Weaponsmith')
    ,(946,      5605,       0,          'Frostmane Novice',             NULL)
    ,(1104,     3397,       0,          'Grundel Harkin',               'Armorer')
    ,(1115,     726,        0,          'Rockjaw Skullthumper',         NULL)
    ,(1116,     726,        0,          'Rockjaw Ambusher',             NULL)
    ,(1117,     726,        0,          'Rockjaw Bonesnapper',          NULL)
    ,(1118,     723,        0,          'Rockjaw Backbreaker',          NULL)
    ,(1119,     830,        0,          'Hammerspine',                  NULL)
    ,(1120,     5608,       0,          'Frostmane Troll',              NULL)
    ,(1121,     5607,       0,          'Frostmane Snowstrider',        NULL)
    ,(1122,     5612,       0,          'Frostmane Hideskinner',        NULL)
    ,(1123,     5626,       0,          'Frostmane Headhunter',         NULL)
    ,(1124,     5613,       0,          'Frostmane Shadowcaster',       NULL)
    ,(1125,     607,        0,          'Crag Boar',                    NULL)
    ,(1126,     381,        0,          'Large Crag Boar',              NULL)
    ,(1127,     744,        0,          'Elder Crag Boar',              NULL)
    ,(1128,     8843,       0,          'Young Black Bear',             NULL)
    ,(1129,     719,        0,          'Black Bear',                   NULL)
    ,(1130,     913,        0,          'Bjarn',                        NULL)
    ,(1131,     785,        0,          'Winter Wolf',                  NULL)
    ,(1132,     11422,      0,          'Timber',                       NULL)
    ,(1133,     11416,      0,          'Starving Winter Wolf',         NULL)
    ,(1134,     929,        0,          'Young Wendigo',                NULL)
    ,(1135,     950,        0,          'Wendigo',                      NULL)
    ,(1137,     931,        0,          'Edan the Howler',              NULL)
    ,(1196,     8840,       0,          'Ice Claw Bear',                NULL)
    ,(1199,     748,        0,          'Juvenile Snow Leopard',        NULL)
    ,(1201,     954,        0,          'Snow Leopard',                 NULL)
    ,(1211,     6921,       6922,       'Leper Gnome',                  NULL)
    ,(1226,     3429,       0,          'Maxan Anvol',                  'Priest Trainer')
    ,(1228,     10215,      0,          'Magis Sparkmantle',            'Mage Trainer')
    ,(1229,     3431,       0,          'Granis Swiftaxe',              'Warrior Trainer')
    ,(1231,     3558,       0,          'Grif Wildheart',               'Hunter Trainer')
    ,(1232,     1622,       0,          'Azar Stronghammer',            'Paladin Trainer')
    ,(1234,     3436,       0,          'Hogral Bakkan',                'Rogue Trainer')
    ,(1237,     3418,       0,          'Kazan Mogosh',                 'Food & Drink Merchant')
    ,(1238,     3420,       0,          'Gamili Frosthide',             'Cloth & Leather Armor Merchant')
    ,(1240,     3425,       0,          'Boran Ironclink',              'Armorer')
    ,(1241,     3422,       0,          'Tognus Flintfire',             'Journeyman Blacksmith')
    ,(1243,     3412,       0,          'Hegnar Rumbleshot',            'Gunsmith')
    ,(1245,     3513,       0,          'Kogan Forgestone',             NULL)
    ,(1247,     3434,       0,          'Innkeeper Belm',               'Innkeeper')
    ,(1252,     1376,       0,          'Senir Whitebeard',             NULL)
    ,(1253,     1616,       0,          'Father Gavin',                 'The Argent Dawn')
    ,(1254,     1569,       0,          'Foreman Stonebrow',            'Miners\' League')
    ,(1255,     1623,       0,          'Prospector Gehn',              'Explorers\' League')
    ,(1256,     3423,       0,          'Quarrymaster Thesten',         'Miners\' League')
    ,(1260,     5625,       0,          'Great Father Arctikus',        NULL)
    ,(1261,     2790,       0,          'Veron Amberstill',             'Ram Breeder')
    ,(1263,     1981,       0,          'Yarlyn Amberstill',            NULL)
    ,(1265,     1651,       0,          'Rudra Amberstill',             NULL)
    ,(1266,     1683,       0,          'Tundra MacGrann',              NULL)
    ,(1267,     1684,       0,          'Ragnar Thunderbrew',           NULL)
    ,(1268,     3441,       0,          'Ozzie Togglevolt',             NULL)
    ,(1269,     3440,       0,          'Razzle Sprysprocket',          NULL)
    ,(1271,     1050,       0,          'Old Icebeard',                 NULL)
    ,(1273,     3417,       0,          'Grawn Thromwyn',               'Weaponsmith')
    ,(1354,     1396,       0,          'Apprentice Soren',             NULL)
    ,(1355,     3416,       0,          'Cook Ghilm',                   'Cooking Trainer')
    ,(1358,     3419,       0,          'Miner Grothor',                NULL)
    ,(1360,     3421,       0,          'Miner Grumnal',                NULL)
    ,(1373,     3438,       0,          'Jarven Thunderbrew',           NULL)
    ,(1374,     3398,       0,          'Rejold Barleybrew',            NULL)
    ,(1375,     3405,       0,          'Marleth Barleybrew',           NULL)
    ,(1376,     3389,       0,          'Beldin Steelgrill',            NULL)
    ,(1377,     5106,       0,          'Pilot Stonegear',              NULL)
    ,(1378,     5105,       0,          'Pilot Bellowfiz',              NULL)
    ,(1388,     1050,       0,          'Vagash',                       NULL)
    ,(1397,     5610,       0,          'Frostmane Seer',               NULL)
    ,(1679,     3413,       0,          'Avarus Kharag',                NULL)
    ,(1689,     193,        0,          'Scarred Crag Boar',            NULL)
    ,(1690,     3427,       0,          'Thrawn Boltar',                'Blacksmithing Supplies')
    ,(1691,     3430,       0,          'Kreg Bilmn',                   'General Supplies')
    ,(1692,     3414,       0,          'Golorn Frostbeard',            'Tradesman')
    ,(1694,     3392,       0,          'Loslor Rudge',                 'Engineering Supplies')
    ,(1697,     3409,       0,          'Keeg Gibn',                    'Ale & Wine')
    ,(1698,     3426,       0,          'Frast Dokner',                 'Apprentice Weaponsmith')
    ,(1699,     3435,       0,          'Gremlock Pilsnor',             'Cooking Trainer')
    ,(1700,     3400,       0,          'Paxton Ganter',                'Fishing Trainer')
    ,(1701,     3424,       0,          'Dank Drizzlecut',              'Mining Trainer')
    ,(1702,     3394,       0,          'Bronk Guzzlegear',             'Journeyman Engineer')
    ,(1718,     730,        0,          'Rockjaw Raider',               NULL)
    ,(1872,     3415,       0,          'Tharek Blackstone',            NULL)
    ,(1959,     1891,       0,          'Mountaineer Barleybrew',       NULL)
    ,(1960,     5131,       0,          'Pilot Hammerfoot',             NULL)
    ,(1961,     913,        0,          'Mangeclaw',                    NULL)
    ,(1965,     1567,       0,          'Mountaineer Thalos',           NULL)
    ,(1977,     1570,       0,          'Senator Mehr Stonehallow',     NULL)
    ,(2326,     3433,       0,          'Thamner Pol',                  'Physician')
    ,(2878,     5040,       0,          'Peria Lamenur',                'Pet Trainer')
    ,(3162,     3408,       0,          'Burdrak Harglhelm',            'Leather Armor Merchant')
    ,(3177,     3411,       0,          'Turuk Amberstill',             'Dwarven Weaponsmith')
    ,(4772,     3410,       0,          'Ultham Ironhorn',              'Riding Trainer')
    ,(5392,     3396,       0,          'Yarr Hammerstone',             'Mining Trainer')
    ,(5568,     6926,       6927,       'Captured Leper Gnome',         NULL)
    ,(5595,     3524,       3525,       'Ironforge Guard',              NULL)
    ,(5612,     3607,       0,          'Gimrizz Shadowcog',            'Warlock Trainer')
    ,(6113,     5611,       0,          'Vejrek',                       NULL)
    ,(6119,     4864,       0,          'Tog Rustsprocket',             NULL)
    ,(6123,     4956,       0,          'Dark Iron Spy',                NULL)
    ,(6124,     4957,       0,          'Captain Beld',                 'Dark Iron Captain')
    ,(6177,     4890,       0,          'Narm Faulk',                   NULL)
    ,(6181,     4893,       0,          'Jordan Stilwell',              NULL)
    ,(6328,     5042,       0,          'Dannie Fizzwizzle',            'Demon Trainer')
    ,(6782,     9211,       0,          'Hands Springsprocket',         NULL)
    ,(6806,     5525,       0,          'Tannok Frosthammer',           'Innkeeper Assistant')
    ,(6886,     5648,       0,          'Onin MacHammar',               NULL)
    ,(7843,     6973,       6974,       'Gnomeregan Evacuee',           NULL)
    ,(7954,     7038,       0,          'Binjy Featherwhistle',         'Mechanostrider Pilot')
    ,(7955,     7039,       0,          'Milli Featherwhistle',         'Mechanostrider Merchant')
    ,(8416,     7852,       0,          'Felix Whindlebolt',            NULL)
    ,(8503,     7807,       0,          'Gibblewilt',                   NULL)
    ,(8508,     7808,       0,          'Gretta Ganter',                'Fishing Supplies')
    ,(9980,     9253,       0,          'Shelby Stoneflint',            'Stable Master')
    ,(10610,    9946,       0,          'Angus',                        'Dwarven Mortar Team')
    ,(10611,    9947,       0,          'Shorty',                       'Dwarven Mortar Team')
    ,(10803,    10111,      0,          'Rifleman Wheeler',             NULL)
    ,(10804,    10110,      0,          'Rifleman Middlecamp',          NULL)
    ,(10805,    10109,      0,          'Spotter Klemmy',               NULL)
    ,(11807,    11752,      0,          'Tristane Shadowstone',         NULL)
    ,(11941,    11899,      0,          'Yori Crackhelm',               NULL)
    ,(12047,    12065,      12066,      'Stormpike Mountaineer',        NULL)
    ,(12427,    12474,      0,          'Mountaineer Dolf',             NULL)
    ,(12738,    12967,      0,          'Nori Pridedrift',              NULL)
    ,(12996,    1598,       1608,       'Mounted Ironforge Mountaineer',NULL)
    ,(13000,    12940,      12942,      'Gnome Engineer',               NULL)
    ,(13076,    1598,       0,          'Dun Morogh Mountaineer',       NULL)
;

-- Insert creature template addons for 'Dun Morogh' --------------------------
INSERT INTO `creature_template_addon`
    (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`)
VALUES
     (460,      0,      0,       1,             16,            0,       0,          NULL)
    ,(658,      0,      0,       1,             16,            0,       0,          NULL)
    ,(704,      0,      0,       1,             16,            0,       0,          NULL)
    ,(705,      0,      0,       1,             16,            0,       0,          NULL)
    ,(706,      0,      0,       1,             16,            0,       0,          NULL)
    ,(707,      0,      0,       1,             16,            0,       0,          NULL)
    ,(708,      0,      0,       1,             16,            0,       0,          NULL)
    ,(713,      0,      0,       1,             16,            0,       0,          NULL)
    ,(714,      0,      0,       1,             16,            0,       0,          NULL)
    ,(724,      0,      0,       1,             16,            0,       0,          NULL)
    ,(727,      0,      0,       1,             16,            0,       0,          NULL)
    ,(786,      0,      0,       1,             16,            0,       0,          NULL)
    ,(808,      0,      0,       1,             16,            0,       0,          NULL)
    ,(829,      0,      0,       1,             16,            0,       0,          NULL)
    ,(836,      0,      0,       1,             16,            0,       0,          NULL)
    ,(837,      0,      0,       1,             16,            0,       0,          NULL)
    ,(853,      0,      0,       1,             16,            0,       0,          '18950')
    ,(895,      0,      0,       2,             16,            0,       0,          NULL)
    ,(912,      0,      0,       1,             16,            0,       0,          NULL)
    ,(916,      0,      0,       1,             16,            0,       0,          NULL)
    ,(926,      0,      0,       1,             16,            0,       0,          NULL)
    ,(944,      0,      0,       1,             16,            0,       0,          NULL)
    ,(945,      0,      0,       1,             16,            0,       0,          NULL)
    ,(946,      0,      0,       1,             16,            0,       0,          NULL)
    ,(1104,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1115,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1116,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1117,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1118,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1120,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1121,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1122,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1123,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1124,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1125,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1126,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1127,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1128,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1131,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1132,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1133,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1134,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1135,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1137,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1196,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1199,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1201,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1211,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1226,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1228,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1229,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1231,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1232,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1234,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1237,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1238,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1240,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1241,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1243,     0,      0,       2,             16,            0,       0,          NULL)
    ,(1245,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1247,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1252,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1253,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1254,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1255,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1256,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1260,     0,      0,       1,             16,            0,       0,          '465')
    ,(1261,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1263,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1265,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1266,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1267,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1268,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1269,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1271,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1273,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1354,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1355,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1358,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1360,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1373,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1374,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1375,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1376,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1377,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1378,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1388,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1397,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1679,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1689,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1690,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1691,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1692,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1694,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1697,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1698,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1699,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1700,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1701,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1702,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1718,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1872,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1959,     0,      0,       2,             16,            0,       0,          NULL)
    ,(1960,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1961,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1965,     0,      0,       1,             16,            0,       0,          NULL)
    ,(1977,     0,      0,       1,             16,            0,       0,          NULL)
    ,(2326,     0,      0,       1,             16,            0,       0,          NULL)
    ,(2878,     0,      0,       1,             16,            0,       0,          NULL)
    ,(3162,     0,      0,       1,             16,            0,       0,          NULL)
    ,(3177,     0,      0,       1,             16,            0,       0,          NULL)
    ,(4772,     0,      0,       1,             16,            0,       0,          NULL)
    ,(5392,     0,      0,       1,             16,            0,       0,          NULL)
    ,(5568,     0,      0,       1,             16,            0,       0,          NULL)
    ,(5595,     0,      0,       1,             16,            0,       0,          NULL)
    ,(5612,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6119,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6123,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6124,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6181,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6328,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6782,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6806,     0,      0,       1,             16,            0,       0,          NULL)
    ,(6886,     0,      33554432,1,             16,            0,       0,          '6408')
    ,(7843,     0,      1114112, 1,             16,            0,       0,          '7165')
    ,(7954,     0,      0,      1,              16,            0,       0,          NULL)
    ,(7955,     0,      0,      1,              16,            0,       0,          NULL)
    ,(8416,     0,      0,      1,              16,            0,       0,          NULL)
    ,(8503,     0,      0,      1,              16,            0,       0,          NULL)
    ,(8508,     0,      0,      1,              16,            0,       0,          NULL)
    ,(9980,     0,      0,      1,              16,            0,       0,          NULL)
    ,(10610,    0,      0,      1,              16,            0,       0,          NULL)
    ,(10611,    0,      0,      1,              16,            0,       0,          NULL)
    ,(10803,    0,      0,      0,              16,            0,       0,          NULL)
    ,(10804,    0,      0,      0,              16,            0,       0,          NULL)
    ,(10805,    0,      0,      1,              16,            0,       0,          NULL)
    ,(11807,    0,      0,      1,              16,            0,       0,          NULL)
    ,(11941,    0,      0,      1,              16,            0,       0,          NULL)
    ,(12427,    0,      8,      1,              16,            0,       0,          NULL)
    ,(12738,    0,      0,      1,              16,            0,       0,          NULL)
    ,(12996,    2786,   0,      0,              0,             0,       0,          NULL)
    ,(13076,    0,      0,      1,              16,            0,       0,          NULL)
;

-- Insert creature template spells for 'Dun Morogh' --------------------------
INSERT INTO `creature_template_spells`
    (`entry`, `spell1`, `spell2`, `spell3`, `spell4`)
VALUES
     (946,  6949,       0,          0,      0)
    ,(1115, 3148,       0,          0,      0)
    ,(1116, 7159,       0,          0,      0)
    ,(1117, 5164,       0,          0,      0)
    ,(1118, 3019,       0,          0,      0)
    ,(1119, 3391,       0,          0,      0)
    ,(1121, 467,        6950,       0,      0)
    ,(1122, 7159,       0,          0,      0)
    ,(1123, 10277,      0,          0,      0)
    ,(1124, 20791,      20798,      11980,  0)
    ,(1125, 6268,       0,          0,      0)
    ,(1126, 6268,       0,          0,      0)
    ,(1127, 6268,       0,          0,      0)
    ,(1130, 3130,       3147,       0,      0)
    ,(1132, 3150,       0,          0,      0)
    ,(1133, 3151,       0,          0,      0)
    ,(1134, 3131,       0,          0,      0)
    ,(1135, 3131,       0,          0,      0)
    ,(1137, 3129,       0,          0,      0)
    ,(1196, 3130,       0,          0,      0)
    ,(1388, 3143,       0,          0,      0)
    ,(1397, 9532,       324,        0,      0)
    ,(1689, 6268,       0,          0,      0)
    ,(1961, 3242,       0,          0,      0)
    ,(6113, 7386,       7164,       0,      0)
;

-- Insert trainer templates for 'Dun Morogh' ---------------------------------
INSERT INTO `npc_trainer_template`
    (`entry`,             `spell`,`spellcost`,`reqskill`,`reqskillvalue`,`reqlevel`)
VALUES
     (@CLASS_WARLOCK *  1,   1374,   10,         0,         0,              1)
    ,(@CLASS_WARLOCK *  1,   1393,   100,        0,         0,              4)
    ,(@CLASS_WARLOCK *  1,   6221,   100,        0,         0,              4)
    ,(@CLASS_WARLOCK *  1,   1381,   100,        0,         0,              6)
    ,(@CLASS_WARLOCK *  1,   1476,   100,        0,         0,              6)
;

-- Configure creature templates ----------------------------------------------
UPDATE `creature_template`
SET
    `FactionAlliance`    = 12,
    `FactionHorde`       = 12
WHERE `Entry` IN (6181);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 14,
    `FactionHorde`       = 14
WHERE `Entry` IN (6123);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 16,
    `FactionHorde`       = 16
WHERE `Entry` IN (1271);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 24,
    `FactionHorde`       = 24
WHERE `Entry` IN (1134, 1135, 1137, 1388);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 32,
    `FactionHorde`       = 32
WHERE `Entry` IN (704, 705);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,
    `FactionHorde`       = 35
WHERE `Entry` IN (5568, 6177);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 36,
    `FactionHorde`       = 36
WHERE `Entry` IN (707, 724);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 37,
    `FactionHorde`       = 37
WHERE `Entry` IN (808, 1120, 1121, 1122, 1123, 1124, 1260, 1397, 6113);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 38,
    `FactionHorde`       = 38
WHERE `Entry` IN (1131, 1132, 1133);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 44,
    `FactionHorde`       = 44
WHERE `Entry` IN (1128, 1129, 1130, 1196, 1961);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 54,
    `FactionHorde`       = 54
WHERE `Entry` IN (6124);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 55,
    `FactionHorde`       = 55
WHERE `Entry` IN (
    658, 713, 714, 786, 829, 836, 837, 895, 912, 916, 926, 945, 1104, 1226,
    1229, 1231, 1232, 1234, 1237, 1238, 1240, 1241, 1243, 1247, 1252, 1254,
    1255, 1256, 1261, 1263, 1265, 1267, 1273, 1354, 1355, 1373, 1374, 1375,
    1376, 1377, 1378, 1690, 1691, 1692, 1694, 1697, 1698, 1699, 1700, 1701,
    1702, 1872, 1960, 1965, 1977, 2326, 2878, 3162, 3177, 4772, 5392, 6806,
    6886, 8508, 9980, 10610, 10611, 10803, 10804, 10805, 11807, 11941, 12738
);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 57,
    `FactionHorde`       = 57
WHERE `Entry` IN (
    727, 853, 1245, 1266, 1358, 1360, 1679, 1959, 5595, 12427, 12996, 13076
);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 59,
    `FactionHorde`       = 59
WHERE `Entry` IN (1115, 1116, 1117, 1118, 1119, 1718);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 63,
    `FactionHorde`       = 63
WHERE `Entry` IN (1211, 8503);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 64,
    `FactionHorde`       = 64
WHERE `Entry` IN (6782, 7843);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 66,
    `FactionHorde`       = 66
WHERE `Entry` IN (1199, 1201);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 107,
    `FactionHorde`       = 107
WHERE `Entry` IN (706, 946);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 189,
    `FactionHorde`       = 189
WHERE `Entry` IN (1125, 1126, 1127);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 794,
    `FactionHorde`       = 794
WHERE `Entry` IN (1253);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 875,
    `FactionHorde`       = 875
WHERE `Entry` IN (460, 944, 1228, 1268, 1269, 5612, 6119, 6328, 7954, 7955, 8416, 13000);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 1094,
    `FactionHorde`       = 1094
WHERE `Entry` IN (708, 1689);

UPDATE `creature_template`
SET
    `FactionAlliance`    = 1216,
    `FactionHorde`       = 1216
WHERE `Entry` IN (12047);

UPDATE `creature_template`
SET
    `UnitClass`          = @CREATURE_CLASS_WARRIOR
WHERE `Entry` IN (
    460, 658, 704, 705, 706, 707, 708, 713, 714, 724, 727, 786, 829, 836, 837,
    853, 895, 912, 916, 926, 944, 945, 1104, 1115, 1116, 1117, 1118, 1119, 1120,
    1122, 1123, 1125, 1126, 1127, 1128, 1129, 1130, 1131, 1132, 1133, 1134, 1135,
    1137, 1196, 1199, 1201, 1211, 1226, 1228, 1229, 1231, 1232, 1234, 1237, 1238,
    1240, 1241, 1243, 1245, 1247, 1252, 1253, 1254, 1255, 1256, 1261, 1263, 1265,
    1266, 1267, 1268, 1269, 1271, 1273, 1354, 1355, 1358, 1360, 1373, 1374, 1375,
    1376, 1377, 1378, 1388, 1689, 1690, 1691, 1692, 1694, 1697, 1698, 1699, 1700,
    1701, 1702, 1718, 1872, 1959, 1960, 1961, 1965, 1977, 2326, 2878, 3162, 3177,
    4772, 5392, 5568, 5595, 5612, 6113, 6123, 6124, 6181, 6782, 6806, 6886, 7954,
    7955, 8416, 8508, 9980, 10610, 10611, 10803, 10804, 10805, 11941, 12047, 12427,
    12738, 13000, 13076
);

UPDATE `creature_template`
SET
    `UnitClass`          = @CREATURE_CLASS_PALADIN
WHERE `Entry` IN (
    808, 946, 1121, 1260, 1397, 1679, 6177, 7843, 11807, 12996
);

UPDATE `creature_template`
SET
    `UnitClass`          = @CREATURE_CLASS_MAGE
WHERE `Entry` IN (
    1124, 6119, 6328, 8503
);

-- Configure individual templates --------------------------------------------
UPDATE `creature_template`
SET
    `MinLevel`           = 5,       `MaxLevel`              = 5,
    `MinLevelHealth`     = 166,     `MaxLevelHealth`        = 166,
    `MinLevelMana`       = 190,     `MaxLevelHealth`        = 190,
    `MinMeleeDmg`        = 6,       `MaxMeleeDmg`           = 8,
    `MinRangedDmg`       = 8.624,   `MaxRangedDmg`          = 11.858,
    `Armor`              = 20,
    `MeleeAttackPower`   = 3,       `MeleeBaseAttackTime`   = 1960,
    `RangedAttackPower`  = 100,     `RangedBaseAttackTime`  = 2156,
    `Scale`              = 1.15,
    `rank`               = @CREATURE_RANK_NORMAL,
    `InhabitType`        = @CREATURE_INHABIT_GROUND_WATER,
    `NpcFlags`           = @CREATURE_FLAG_NPC_TRAINER,
    `TrainerClass`       = @CLASS_WARLOCK,
    `TrainerTemplateId`  = @CLASS_WARLOCK *  1,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_HUMANOID
WHERE `Entry` = 460;

-- Insert spawns for creatures -----------------------------------------------
INSERT INTO `creature`
    (`guid`,`id`,`modelid`,`map`,`position_x`,`position_y`,`position_z`,`orientation`,`spawndist`,`spawntimesecs`)
VALUES
    (1024,  460,  1930,     0,    -6048.79,    391.078,     398.958,     3.63029,      0,          180)
;
