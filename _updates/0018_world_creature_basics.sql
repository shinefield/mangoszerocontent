-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add initial data to world database
--
-- We will add basic creature templates which are required to either
-- manage or play the game.
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

-- Provide variables for gender
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Insert model information for creatures
INSERT INTO `creature_model_info` VALUES
    (262,   1,      1,   @MODEL_GENDER_NONE, 0, 0),
    (5233,  0.5,    1.5, @MODEL_GENDER_NONE, 0, 0),
    (7029,  1.806,  4,   @MODEL_GENDER_NONE, 0, 0),
    (10045, 1,      1.5, @MODEL_GENDER_NONE, 0, 0);

-- Insert basic creatures
INSERT INTO `creature_template`
    (`entry`,   `modelid_1`,    `name`,                 `subname`,   `faction_A`, `faction_H`, `rank`, `minlevel`, `maxlevel`, `minhealth`, `maxhealth`, `minmana`, `maxmana`, `dmgschool`, `attackpower`, `baseattacktime`, `mindmg`, `maxdmg`, `minrangedmg`, `maxrangedmg`, `rangeattacktime`, `rangedattackpower`, `speed_walk`, `speed_run`, `MovementType`, `InhabitType`, `AIName`, `ScriptName`) VALUES
    (1,         10045,          'Waypoint',             'GM Visual', 35,          35,          3,      63,         63,         9999,        9999,        0,         0,         0,           3,              2000,            7,        7,        1.76,          2.42,           2200,             100,                  0.91,        1.14286,     0,              7,             NULL,      NULL),
    (2,         262,            'Spawnpoint',           'GM Visual', 35,          35,          3,      63,         63,         9999,        9999,        0,         0,         0,           3,              2000,            7,        7,        1.76,          2.42,           2200,             100,                  0.91,        1.14286,     0,              7,             NULL,      NULL),
    (5764,      7029,           'Guardian of Blizzard', NULL,        44,          44,          3,      63,         63,         8832,        8832,        0,         0,         0,           265,            1020,            520,      628,      88.8624,       122.186,        1122,             100,                  1.3,         1.14286,     1,              1,             NULL,      'npc_guardian'),
    (6491,      5233,           'Spirit Healer',        NULL,        35,          35,          0,      60,         60,         7680,        7680,        0,         0,         0,           87,             2000,            164,      212,      74.448,        102.366,        0,                100,                  1,           1,           0,              1,             NULL,      NULL);

-- Modify creature templates with matching flags
-- Modify creature #1
UPDATE `creature_template`
SET
    `npcflag`               = @CREATURE_FLAG_NPC_NONE,
    `dynamicflags`          = @CREATURE_FLAG_DYN_NONE,
    `unit_class`            = @CREATURE_CLASS_NONE,
    `unit_flags`            = 4096,
    `flags_extra`           = @CREATURE_FLAG_EXTRA_CIVILIAN | @CREATURE_FLAG_EXTRA_INVISIBLE,
    `type`                  = @CREATURE_TYPE_CRITTER,
    `type_flags`            = 5242886,
    `mechanic_immune_mask`  = @CREATURE_IMMUNITY_NONE,
    `RegenHealth`           = 1,
    `family`                = @CREATURE_BEAST_FAMILY_NONE
WHERE
    `entry`                 = 1;

-- Modify creature #2
UPDATE `creature_template`
SET
    `npcflag`               = @CREATURE_FLAG_NPC_NONE,
    `dynamicflags`          = @CREATURE_FLAG_DYN_NONE,
    `unit_class`            = @CREATURE_CLASS_NONE,
    `unit_flags`            = 4096,
    `flags_extra`           = @CREATURE_FLAG_EXTRA_CIVILIAN | @CREATURE_FLAG_EXTRA_INVISIBLE,
    `type`                  = @CREATURE_TYPE_CRITTER,
    `type_flags`            = 5242886,
    `mechanic_immune_mask`  = @CREATURE_IMMUNITY_NONE,
    `RegenHealth`           = 1,
    `family`                = @CREATURE_BEAST_FAMILY_NONE
WHERE
    `entry`                 = 2;

-- Modify creature #5764
UPDATE `creature_template`
SET
    `npcflag`               = @CREATURE_FLAG_NPC_NONE,
    `dynamicflags`          = @CREATURE_FLAG_DYN_NONE,
    `unit_class`            = @CREATURE_CLASS_NONE,
    `unit_flags`            = 0,
    `flags_extra`           = @CREATURE_FLAG_EXTRA_NONE,
    `type`                  = @CREATURE_TYPE_DEMON,
    `type_flags`            = @CREATURE_TYPE_FLAG_NONE,
    `mechanic_immune_mask`  = @CREATURE_IMMUNITY_NONE,
    `RegenHealth`           = 1,
    `family`                = @CREATURE_BEAST_FAMILY_NONE
WHERE
    `entry`                 = 5764;

-- Modify creature #6491
UPDATE `creature_template`
SET
    `npcflag`               = @CREATURE_FLAG_NPC_GOSSIP | @CREATURE_FLAG_NPC_SPIRITHEALER,
    `dynamicflags`          = @CREATURE_FLAG_DYN_NONE,
    `unit_class`            = @CREATURE_CLASS_WARRIOR,
    `unit_flags`            = 768,
    `flags_extra`           = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `type`                  = @CREATURE_TYPE_HUMANOID,
    `type_flags`            = @CREATURE_TYPE_FLAG_NOT_ATTACKABLE,
    `mechanic_immune_mask`  = @CREATURE_IMMUNITY_NONE,
    `RegenHealth`           = 1,
    `family`                = @CREATURE_BEAST_FAMILY_NONE
WHERE
    `entry`                 = 6491;

-- Insert template addon for creature #6491 (Spirit Healer)
INSERT INTO `creature_template_addon` VALUES
    (6491, 0, 16777216, 1, 16, 0, 0, NULL);

-- Insert spawns for creature #6491
INSERT INTO `creature` VALUES
    (6491001,    6491, 0, 5233, 0, 1819.41, 219.233, 60.0732, 0.337883, 25, 0, 0, 7680, 0, 0, 0),
    (6491002,    6491, 1, 5233, 0, -8591.09, -3623.91, 13.478, 4.54902, 60, 0, 0, 7680, 0, 0, 0),
    (6491003,    6491, 1, 5233, 0, 466.735, 1466.16, 12.8983, 0.112288, 60, 0, 0, 7680, 0, 0, 0),
    (6491004,    6491, 1, 5233, 0, 2734.82, 1279.54, 295.79, 2.00745, 60, 0, 0, 7680, 0, 0, 0),
    (6491005,    6491, 1, 5233, 0, -8146.14, -4608.99, -125.103, 4.16259, 60, 0, 0, 7680, 0, 0, 0),
    (6491006,    6491, 1, 5233, 0, -4637.91, -3139.22, 34.9469, 0.761173, 60, 0, 0, 7680, 0, 0, 0),
    (6491007,    6491, 1, 5233, 0, -4031.16, -3422.71, 38.8247, 1.69815, 60, 0, 0, 7680, 0, 0, 0),
    (6491008,    6491, 1, 5233, 0, -3973.19, -2017.75, 96.0305, 0.966001, 60, 0, 0, 7680, 0, 0, 0),
    (6491009,    6491, 0, 5233, 0, 790.751, -418.588, 136.861, 5.48565, 60, 0, 0, 7680, 0, 0, 0),
    (6491010,    6491, 0, 5233, 0, -6863.62, -1537.06, 241.746, 3.72703, 60, 0, 0, 7680, 0, 0, 0),
    (6491011,    6491, 1, 5233, 0, -7348.79, -1316.54, -260.86, 2.90753, 60, 0, 0, 7680, 0, 0, 0),
    (6491012,    6491, 1, 5233, 0, 6499.08, -2378.94, 589.681, 4.80547, 60, 0, 0, 7680, 0, 0, 0),
    (6491013,    6491, 1, 5233, 0, -7748.02, -4978.67, 6.00826, 2.27058, 60, 0, 0, 7680, 0, 0, 0),
    (6491014,    6491, 0, 5233, 0, 1840.76, -2149.67, 67.4929, 2.38151, 60, 0, 0, 7680, 0, 0, 0),
    (6491015,    6491, 0, 5233, 0, -7105.79, -3488.52, 242.318, 0.00187445, 60, 0, 0, 7680, 0, 0, 0),
    (6491016,    6491, 1, 5233, 0, 5633.21, -4765.75, 777.907, 1.47459, 60, 0, 0, 7680, 0, 0, 0),
    (6491017,    6491, 1, 5233, 0, -6154.23, -1142.67, -216.588, 2.99628, 60, 0, 0, 7680, 0, 0, 0),
    (6491018,    6491, 1, 5233, 0, -7981.09, 1556.57, 3.64432, 3.17291, 60, 0, 0, 7680, 0, 0, 0),
    (6491019,    6491, 0, 5233, 0, 1989.31, -3650.44, 120.369, 3.70566, 60, 0, 0, 7680, 0, 0, 0),
    (6491021,    6491, 0, 5233, 0, -10602.4, 293.623, 31.7491, 3.09761, 25, 0, 0, 7680, 0, 0, 0),
    (6491022,    6491, 0, 5233, 0, -11103, -1833.2, 71.8642, 3.04545, 60, 0, 0, 7680, 0, 0, 0),
    (6491023,    6491, 0, 5233, 0, -9554.16, -1367.13, 51.202, 4.91271, 60, 0, 0, 7680, 0, 0, 0),
    (6491024,    6491, 0, 5233, 0, -6439, -1115, 312.16, 3.172, 490, 0, 0, 7680, 0, 0, 0),
    (6491025,    6491, 0, 5233, 0, -14286, 283.778, 32.739, 1.543, 490, 0, 0, 7680, 0, 0, 0),
    (6491026,    6491, 0, 5233, 0, -11550, -228, 28.285, 6.161, 490, 0, 0, 7680, 0, 0, 0),
    (6491027,    6491, 0, 5233, 0, -10836, -2953, 13.941, 3.054, 490, 0, 0, 7680, 0, 0, 0),
    (6491028,    6491, 0, 5233, 0, -10779, -1194, 35.275, 0.915, 490, 0, 0, 7680, 0, 0, 0),
    (6491029,    6491, 0, 5233, 0, -10575, -3377, 22.344, 0.017, 490, 0, 0, 7680, 0, 0, 0),
    (6491030,    6491, 0, 5233, 0, -10559, 1206.87, 31.476, 5.616, 490, 0, 0, 7680, 0, 0, 0),
    (6491031,    6491, 0, 5233, 0, -9394, -2022, 58.275, 4.33, 490, 0, 0, 7680, 0, 0, 0),
    (6491032,    6491, 0, 5233, 0, -7501, -2145, 146.088, 0.955, 490, 0, 0, 7680, 0, 0, 0),
    (6491033,    6491, 0, 5233, 0, -6807, -2289, 280.753, 2.587, 490, 0, 0, 7680, 0, 0, 0),
    (6491034,    6491, 0, 5233, 0, -5352, -2892, 341.729, 1.654, 490, 0, 0, 7680, 0, 0, 0),
    (6491035,    6491, 0, 5233, 0, -3355, -845, 1.063, 1.734, 490, 0, 0, 7680, 0, 0, 0),
    (6491036,    6491, 0, 5233, 0, -3299, -2430, 18.597, 5.693, 490, 0, 0, 7680, 0, 0, 0),
    (6491037,    6491, 0, 5233, 0, -1468, -2625, 48.363, 4.617, 490, 0, 0, 7680, 0, 0, 0),
    (6491038,    6491, 0, 5233, 0, -721, -592, 25.011, 3.121, 490, 0, 0, 7680, 0, 0, 0),
    (6491039,    6491, 0, 5233, 0, -285, -4388, 108.627, 2.007, 490, 0, 0, 7680, 0, 0, 0),
    (6491040,    6491, 0, 5233, 0, -20, -996, 55.837, 1.499, 490, 0, 0, 7680, 0, 0, 0),
    (6491041,    6491, 0, 5233, 0, 324.261, -2227, 137.775, 3.107, 490, 0, 0, 7680, 0, 0, 0),
    (6491042,    6491, 0, 5233, 0, 476.229, 1595.9, 126.662, 5.942, 490, 0, 0, 7680, 0, 0, 0),
    (6491043,    6491, 0, 5233, 0, 902.236, -1517, 55.037, 4.744, 490, 0, 0, 7680, 0, 0, 0),
    (6491044,    6491, 0, 5233, 0, 1238.37, -2414, 60.739, 2.359, 490, 0, 0, 7680, 0, 0, 0),
    (6491045,    6491, 0, 5233, 0, 1380.44, -3701, 77.017, 6.271, 490, 0, 0, 7680, 0, 0, 0),
    (6491046,    6491, 0, 5233, 0, 1739.56, -672, 45.062, 6.275, 490, 0, 0, 7680, 0, 0, 0),
    (6491047,    6491, 0, 5233, 0, 1882.3, 1641.52, 93.646, 4.491, 490, 0, 0, 7680, 0, 0, 0),
    (6491048,    6491, 0, 5233, 0, 2115.64, -5299, 82.163, 1.075, 490, 0, 0, 7680, 0, 0, 0),
    (6491049,    6491, 0, 5233, 0, 2348.58, 492.862, 33.358, 4.879, 490, 0, 0, 7680, 0, 0, 0),
    (6491050,    6491, 0, 5233, 0, 2603.09, -535, 89, 5.596, 490, 0, 0, 7680, 0, 0, 0),
    (6491051,    6491, 0, 5233, 0, 2641.28, -4015, 106.292, 6.239, 490, 0, 0, 7680, 0, 0, 0),
    (6491052,    6491, 1, 5233, 0, -7207, -2439, -218, 1.084, 490, 0, 0, 7680, 0, 0, 0),
    (6491053,    6491, 1, 5233, 0, -7200, -3938, 9.204, 4.711, 490, 0, 0, 7680, 0, 0, 0),
    (6491054,    6491, 1, 5233, 0, -6824, 892.716, 33.999, 3.062, 490, 0, 0, 7680, 0, 0, 0),
    (6491055,    6491, 1, 5233, 0, -6442, -290, 3.555, 0.717, 490, 0, 0, 7680, 0, 0, 0),
    (6491056,    6491, 1, 5233, 0, -5530, -3455, -44, 4.603, 490, 0, 0, 7680, 0, 0, 0),
    (6491057,    6491, 1, 5233, 0, -4642, -1778, -41, 2.489, 490, 0, 0, 7680, 0, 0, 0),
    (6491058,    6491, 1, 5233, 0, -4600, 3229.67, 9.006, 0.093, 490, 0, 0, 7680, 0, 0, 0),
    (6491059,    6491, 1, 5233, 0, -4593, 1631.68, 93.968, 6.225, 490, 0, 0, 7680, 0, 0, 0),
    (6491060,    6491, 1, 5233, 0, -4429, 370.415, 51.727, 3.401, 490, 0, 0, 7680, 0, 0, 0),
    (6491061,    6491, 1, 5233, 0, -2949, -142, 67.093, 5.067, 490, 0, 0, 7680, 0, 0, 0),
    (6491062,    6491, 1, 5233, 0, -2506, -1968, 91.784, 2.796, 490, 0, 0, 7680, 0, 0, 0),
    (6491063,    6491, 1, 5233, 0, -2173, -342, -5, 3.594, 490, 0, 0, 7680, 0, 0, 0),
    (6491064,    6491, 1, 5233, 0, -1434, 1967.04, 86.041, 1.71, 490, 0, 0, 7680, 0, 0, 0),
    (6491065,    6491, 1, 5233, 0, -1073, -3479, 63.044, 3.446, 490, 0, 0, 7680, 0, 0, 0),
    (6491066,    6491, 1, 5233, 0, -983, -75, 20.431, 0.033, 490, 0, 0, 7680, 0, 0, 0),
    (6491067,    6491, 1, 5233, 0, -774, -4988, 19.257, 3.291, 490, 0, 0, 7680, 0, 0, 0),
    (6491068,    6491, 1, 5233, 0, -639, -4298, 40.942, 1.082, 490, 0, 0, 7680, 0, 0, 0),
    (6491069,    6491, 1, 5233, 0, -590, -2515, 91.761, 4.549, 490, 0, 0, 7680, 0, 0, 0),
    (6491070,    6491, 1, 5233, 0, 240.765, -4791, 10.256, 3.43, 490, 0, 0, 7680, 0, 0, 0),
    (6491071,    6491, 1, 5233, 0, 919.297, 436.482, 65.128, 3.009, 490, 0, 0, 7680, 0, 0, 0),
    (6491072,    6491, 1, 5233, 0, 1178.15, -4467, 21.323, 1.176, 490, 0, 0, 7680, 0, 0, 0),
    (6491073,    6491, 1, 5233, 0, 2428.47, -2953, 123.513, 0.062, 490, 0, 0, 7680, 0, 0, 0),
    (6491074,    6491, 1, 5233, 0, 2644.78, -635, 107.674, 3.347, 490, 0, 0, 7680, 0, 0, 0),
    (6491075,    6491, 1, 5233, 0, 2683.48, -3988, 108.41, 4.673, 490, 0, 0, 7680, 0, 0, 0),
    (6491076,    6491, 1, 5233, 0, 2924.51, -6031, 4.946, 6.02, 490, 0, 0, 7680, 0, 0, 0),
    (6491077,    6491, 1, 5233, 0, 3796.96, -1622, 219.894, 1.45, 490, 0, 0, 7680, 0, 0, 0),
    (6491078,    6491, 1, 5233, 0, 4299.27, 89.079, 42.752, 2.397, 490, 0, 0, 7680, 0, 0, 0),
    (6491079,    6491, 1, 5233, 0, 4798.35, -6846, 89.817, 3.236, 490, 0, 0, 7680, 0, 0, 0),
    (6491080,    6491, 1, 5233, 0, 5943.01, -1205, 382.952, 5.47, 490, 0, 0, 7680, 0, 0, 0),
    (6491081,    6491, 1, 5233, 0, 6736.36, 202.91, 23.255, 4.121, 490, 0, 0, 7680, 0, 0, 0),
    (6491082,    6491, 1, 5233, 0, 6857.31, -4680, 700.936, 1.527, 490, 0, 0, 7680, 0, 0, 0),
    (6491083,    6491, 1, 5233, 0, 7412.88, -2817, 464.855, 0.253, 490, 0, 0, 7680, 0, 0, 0),
    (6491084,    6491, 1, 5233, 0, 16320.2, 16243.6, 24.4, 2.253, 490, 0, 0, 7680, 0, 0, 0),
    (6491085,    6491, 0, 5233, 0, -6282.51, -3488.48, 252.189, 3.6477, 180, 0, 0, 7680, 0, 0, 0),
    (6491086,    6491, 0, 5233, 0, -9341, 165.021, 61.641, 1.096, 490, 0, 0, 7680, 0, 0, 0),
    (6491087,    6491, 1, 5233, 0, -3518, -4315, 6.77, 3.035, 490, 0, 0, 7680, 0, 0, 0),
    (6491088,    6491, 1, 5233, 0, -3134, -3048, 34.246, 5.711, 490, 0, 0, 7680, 0, 0, 0),
    (6491089,    6491, 0, 5233, 0, -5165, -876, 507.245, 0.929, 60, 0, 0, 7680, 0, 0, 0),
    (6491090,    6491, 0, 5233, 0, -5670, -528, 398.13, 2.381, 60, 0, 0, 7680, 0, 0, 0),
    (6491091,    6491, 0, 5233, 0, -6160, 325.568, 399.968, 1.928, 60, 0, 0, 7680, 0, 0, 0),
    (6491092,    6491, 0, 5233, 0, -8924, -189, 80.555, 2.77, 60, 0, 0, 7680, 0, 0, 0),
    (6491093,    6491, 1, 5233, 0, 9683.39, 952.225, 1291.87, 5.752, 60, 0, 0, 7680, 0, 0, 0),
    (6491094,    6491, 1, 5233, 0, 10055.4, 2116.32, 1329.71, 2.54, 60, 0, 0, 7680, 0, 0, 0),
    (6491095,    6491, 1, 5233, 0, 10394.7, 825.111, 1317.52, 3.753, 60, 0, 0, 7680, 0, 0, 0);

-- Insert gossip dialogue for spawns of creature #6491
INSERT INTO `npc_gossip` VALUES
    (6491001, 580),
    (6491002, 580),
    (6491003, 580),
    (6491004, 580),
    (6491005, 580),
    (6491006, 580),
    (6491007, 580),
    (6491008, 580),
    (6491009, 580),
    (6491010, 580),
    (6491011, 580),
    (6491012, 580),
    (6491013, 580),
    (6491014, 580),
    (6491015, 580),
    (6491016, 580),
    (6491017, 580),
    (6491018, 580),
    (6491019, 580),
    (6491021, 580),
    (6491022, 580),
    (6491023, 580),
    (6491024, 580),
    (6491025, 580),
    (6491026, 580),
    (6491027, 580),
    (6491028, 580),
    (6491029, 580),
    (6491030, 580),
    (6491031, 580),
    (6491032, 580),
    (6491033, 580),
    (6491034, 580),
    (6491035, 580),
    (6491036, 580),
    (6491037, 580),
    (6491038, 580),
    (6491039, 580),
    (6491040, 580),
    (6491041, 580),
    (6491042, 580),
    (6491043, 580),
    (6491044, 580),
    (6491045, 580),
    (6491046, 580),
    (6491047, 580),
    (6491048, 580),
    (6491049, 580),
    (6491050, 580),
    (6491051, 580),
    (6491052, 580),
    (6491053, 580),
    (6491054, 580),
    (6491055, 580),
    (6491056, 580),
    (6491057, 580),
    (6491058, 580),
    (6491059, 580),
    (6491060, 580),
    (6491061, 580),
    (6491062, 580),
    (6491063, 580),
    (6491064, 580),
    (6491065, 580),
    (6491066, 580),
    (6491067, 580),
    (6491068, 580),
    (6491069, 580),
    (6491070, 580),
    (6491071, 580),
    (6491072, 580),
    (6491073, 580),
    (6491074, 580),
    (6491075, 580),
    (6491076, 580),
    (6491077, 580),
    (6491078, 580),
    (6491079, 580),
    (6491080, 580),
    (6491081, 580),
    (6491082, 580),
    (6491083, 580),
    (6491084, 580),
    (6491085, 580),
    (6491086, 580),
    (6491087, 580),
    (6491088, 580),
    (6491089, 580),
    (6491090, 580),
    (6491091, 580),
    (6491092, 580),
    (6491093, 580),
    (6491094, 580),
    (6491095, 580);

-- Insert gossip text
INSERT INTO `npc_text` VALUES
    (580, 'It is not yet your time. I shall aid your journey back to the realm of the living... for a price.', '', 0, 100, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0);

-- Turn dialogue into a menu
INSERT INTO `gossip_menu` VALUES
    (83, 580, 0, 0);

-- ... and add the spirit healer option
INSERT INTO `gossip_menu_option` VALUES
    (83, 0, 4, 'Return me to life.', 6, 32, 0, 0, 0, 0, 0, '', 0);

-- Finally add gossip menu to creature #6491
UPDATE `creature_template`
SET
    `gossip_menu_id` = 83
WHERE `entry` = 6491;
