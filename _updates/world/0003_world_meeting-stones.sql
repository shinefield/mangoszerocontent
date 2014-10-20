-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- This update will populate the world database with initial data required to
-- run the server.
--

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_DOOR                               = 0;
SET @GO_TYPE_BUTTON                             = 1;
SET @GO_TYPE_QUESTGIVER                         = 2;
SET @GO_TYPE_CHEST                              = 3;
SET @GO_TYPE_BINDER                             = 4;
SET @GO_TYPE_GENERIC                            = 5;
SET @GO_TYPE_TRAP                               = 6;
SET @GO_TYPE_CHAIR                              = 7;
SET @GO_TYPE_SPELL_FOCUS                        = 8;
SET @GO_TYPE_TEXT                               = 9;
SET @GO_TYPE_GOOBER                             = 10;
SET @GO_TYPE_TRANSPORT                          = 11;
SET @GO_TYPE_AREA_DAMAGE                        = 12;
SET @GO_TYPE_CAMERA                             = 13;
SET @GO_TYPE_MAP_OBJECT                         = 14;
SET @GO_TYPE_MO_TRANSPORT                       = 15;
SET @GO_TYPE_DUEL_ARBITER                       = 16;
SET @GO_TYPE_FISHING_NODE                       = 17;
SET @GO_TYPE_SUMMONING_RITUAL                   = 18;
SET @GO_TYPE_MAILBOX                            = 19;
SET @GO_TYPE_AUCTION_HOUSE                      = 20;
SET @GO_TYPE_GUARD_POST                         = 21;
SET @GO_TYPE_SPELL_CASTER                       = 22;
SET @GO_TYPE_MEETING_STONE                      = 23;
SET @GO_TYPE_FLAG_STAND                         = 24;
SET @GO_TYPE_FISHING_HOLE                       = 25;
SET @GO_TYPE_FLAG_DROP                          = 26;
SET @GO_TYPE_MINI_GAME                          = 27;
SET @GO_TYPE_LOTTERY_KIOSK                      = 28;
SET @GO_TYPE_CAPTURE_POINT                      = 29;
SET @GO_TYPE_AURA_GENERATOR                     = 30;

-- -> Game object flags ------------------------------------------------------
SET @GO_FLAG_IN_USE                             = 1;
SET @GO_FLAG_LOCKED                             = 2;
SET @GO_FLAG_INTERACT_COND                      = 4;
SET @GO_FLAG_TRANSPORT                          = 8;
SET @GO_FLAG_NO_INTERACT                        = 16;
SET @GO_FLAG_NODESPAWN                          = 32;
SET @GO_FLAG_TRIGGERED                          = 64;

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.1.3 (development)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.1.3 (development)'
WHERE
    `version`             = 'mangos-zero - version 0.1.2 (development)'
;


-- Insert meeting stone templates --------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
     (178824, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Razorfen Downs
    ,(179555, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Gnomeregan
    ,(178884, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Wailing Caverns
    ,(185433, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Zul'Gurub
    ,(178833, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Uldaman
    ,(178829, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Zul'Farrak
    ,(178825, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Razorfen Kraul
    ,(178827, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Maraudon
    ,(178844, @GO_TYPE_MEETING_STONE, 5492,       "Meeting Stone"                   ) -- Scarlet Monastery
    ,(178826, @GO_TYPE_MEETING_STONE, 5492,       "Meeting Stone"                   ) -- Dire Maul
    ,(178828, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- Blackfathom Deeps
    ,(178834, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- The Deadmines
    ,(178832, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- Scholomance
    ,(179595, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- The Stockade
    ,(185321, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Onyxia's Lair
    ,(179587, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Spire
    ,(179586, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Depths
    ,(179585, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Spire
    ,(179584, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Depths
    ,(178831, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Stratholme
    ,(179596, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- Ragefire Chasm
    ,(179554, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- The Temple of Atal'Hakkar
    ,(178845, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- Shadowfang Keep
;

-- Configure meeting stones --------------------------------------------------
UPDATE `gameobject_template`
SET
    `faction`   = 35, -- friendly
    `size`      = 1
WHERE
    `entry` IN (178824, 179555, 178884, 185433, 178833, 178829, 178825,
                178827, 178844, 178826, 178828, 178834, 178832, 179595,
                185321, 179587, 179586, 179585, 179584, 178831, 179596,
                179554, 178845)
;

UPDATE `gameobject_template`
SET
    `size`      = 0.94
WHERE
    `entry` IN (178826) -- Dire Maul meeting stone has reduced size
;

-- Configure levels and attached zones ---------------------------------------
UPDATE `gameobject_template`
SET
    `data0`     = 37,
    `data1`     = 46,
    `data2`     = 722
WHERE
    `entry`     = 178824;

UPDATE `gameobject_template`
SET
    `data0`     = 29,
    `data1`     = 38,
    `data2`     = 133
WHERE
    `entry`     = 179555;

UPDATE `gameobject_template`
SET
    `data0`     = 17,
    `data1`     = 24,
    `data2`     = 718
WHERE
    `entry`     = 178884;

UPDATE `gameobject_template`
SET
    `data0`     = 60,
    `data1`     = 60,
    `data2`     = 1977
WHERE
    `entry`     = 185433;

UPDATE `gameobject_template`
SET
    `data0`     = 41,
    `data1`     = 51,
    `data2`     = 1517
WHERE
    `entry`     = 178833;

UPDATE `gameobject_template`
SET
    `data0`     = 44,
    `data1`     = 54,
    `data2`     = 978
WHERE
    `entry`     = 178829;

UPDATE `gameobject_template`
SET
    `data0`     = 29,
    `data1`     = 38,
    `data2`     = 491
WHERE
    `entry`     = 178825;

UPDATE `gameobject_template`
SET
    `data0`     = 40,
    `data1`     = 52,
    `data2`     = 2100
WHERE
    `entry`     = 178827;

UPDATE `gameobject_template`
SET
    `data0`     = 34,
    `data1`     = 45,
    `data2`     = 796
WHERE
    `entry`     = 178844;

UPDATE `gameobject_template`
SET
    `data0`     = 56,
    `data1`     = 60,
    `data2`     = 2557
WHERE
    `entry`     = 178826;

UPDATE `gameobject_template`
SET
    `data0`     = 24,
    `data1`     = 32,
    `data2`     = 719
WHERE
    `entry`     = 178828;

UPDATE `gameobject_template`
SET
    `data0`     = 17,
    `data1`     = 26,
    `data2`     = 1581
WHERE
    `entry`     = 178834;

UPDATE `gameobject_template`
SET
    `data0`     = 58,
    `data1`     = 60,
    `data2`     = 2057
WHERE
    `entry`     = 178832;

UPDATE `gameobject_template`
SET
    `data0`     = 24,
    `data1`     = 32,
    `data2`     = 717
WHERE
    `entry`     = 179595;

UPDATE `gameobject_template`
SET
    `data0`     = 60,
    `data1`     = 60,
    `data2`     = 2159
WHERE
    `entry`     = 185321;

UPDATE `gameobject_template`
SET
    `data0`     = 55,
    `data1`     = 60,
    `data2`     = 1583
WHERE
    `entry`     = 179587;

UPDATE `gameobject_template`
SET
    `data0`     = 48,
    `data1`     = 60,
    `data2`     = 1584
WHERE
    `entry`     = 179586;

UPDATE `gameobject_template`
SET
    `data0`     = 55,
    `data1`     = 60,
    `data2`     = 1583
WHERE
    `entry`     = 179585;

UPDATE `gameobject_template`
SET
    `data0`     = 52,
    `data1`     = 60,
    `data2`     = 1584
WHERE
    `entry`     = 179584;

UPDATE `gameobject_template`
SET
    `data0`     = 58,
    `data1`     = 60,
    `data2`     = 2017
WHERE
    `entry`     = 178831;

UPDATE `gameobject_template`
SET
    `data0`     = 13,
    `data1`     = 20,
    `data2`     = 2437
WHERE
    `entry`     = 179596;

UPDATE `gameobject_template`
SET
    `data0`     = 50,
    `data1`     = 60,
    `data2`     = 1477
WHERE
    `entry`     = 179554;

UPDATE `gameobject_template`
SET
    `data0`     = 22,
    `data1`     = 30,
    `data2`     = 209
WHERE
    `entry`     = 178845;

-- Spawn meeting stones ------------------------------------------------------
-- INSERT INTO `gameobject`
--     (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
-- VALUES
--      (36,          4170,   1,    -1286.24,      189.72,       130.08,    -1.07338,        0,           0,           -0.511294,    0.859406,    900,             100,           1)
-- ;
