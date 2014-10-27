-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- This update will populate the world database with initial data required to
-- run the server.
--
--
-- Global Unique Identifier ranges used:
--
-- - Meeting Stones, Azeroth: 101-200

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_MEETING_STONE                      = 23;

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
    ,(178825, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Razorfen Kraul
    ,(178826, @GO_TYPE_MEETING_STONE, 5492,       "Meeting Stone"                   ) -- Dire Maul
    ,(178827, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Maraudon
    ,(178828, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- Blackfathom Deeps
    ,(178829, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Zul'Farrak
    ,(178831, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Stratholme
    ,(178832, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- Scholomance
    ,(178833, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Uldaman
    ,(178834, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- The Deadmines
    ,(178844, @GO_TYPE_MEETING_STONE, 5492,       "Meeting Stone"                   ) -- Scarlet Monastery
    ,(178845, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- Shadowfang Keep
    ,(178884, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Wailing Caverns
    ,(179554, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- The Temple of Atal'Hakkar
    ,(179555, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Gnomeregan
    ,(179584, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Depths
    ,(179585, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Spire
    ,(179586, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Depths
    ,(179587, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Blackrock Spire
    ,(179595, @GO_TYPE_MEETING_STONE, 5494,       "Meeting Stone"                   ) -- The Stockade
    ,(179596, @GO_TYPE_MEETING_STONE, 5498,       "Meeting Stone"                   ) -- Ragefire Chasm
    ,(185321, @GO_TYPE_MEETING_STONE, 5495,       "Meeting Stone"                   ) -- Onyxia's Lair
    ,(185433, @GO_TYPE_MEETING_STONE, 5491,       "Meeting Stone"                   ) -- Zul'Gurub
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
    `data0`     = 33,
    `data1`     = 47,
    `data2`     = 722
WHERE
    `entry`     = 178824;

UPDATE `gameobject_template`
SET
    `data0`     = 24,
    `data1`     = 40,
    `data2`     = 133
WHERE
    `entry`     = 179555;

UPDATE `gameobject_template`
SET
    `data0`     = 15,
    `data1`     = 28,
    `data2`     = 718
WHERE
    `entry`     = 178884;

UPDATE `gameobject_template`
SET
    `data0`     = 56,
    `data1`     = 60,
    `data2`     = 1977
WHERE
    `entry`     = 185433;

UPDATE `gameobject_template`
SET
    `data0`     = 38,
    `data1`     = 53,
    `data2`     = 1517
WHERE
    `entry`     = 178833;

UPDATE `gameobject_template`
SET
    `data0`     = 43,
    `data1`     = 54,
    `data2`     = 978
WHERE
    `entry`     = 178829;

UPDATE `gameobject_template`
SET
    `data0`     = 24,
    `data1`     = 40,
    `data2`     = 491
WHERE
    `entry`     = 178825;

UPDATE `gameobject_template`
SET
    `data0`     = 40,
    `data1`     = 58,
    `data2`     = 2100
WHERE
    `entry`     = 178827;

UPDATE `gameobject_template`
SET
    `data0`     = 29,
    `data1`     = 48,
    `data2`     = 796
WHERE
    `entry`     = 178844;

UPDATE `gameobject_template`
SET
    `data0`     = 54,
    `data1`     = 60,
    `data2`     = 2557
WHERE
    `entry`     = 178826;

UPDATE `gameobject_template`
SET
    `data0`     = 20,
    `data1`     = 34,
    `data2`     = 719
WHERE
    `entry`     = 178828;

UPDATE `gameobject_template`
SET
    `data0`     = 15,
    `data1`     = 28,
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
    `data0`     = 22,
    `data1`     = 34,
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
    `data0`     = 48,
    `data1`     = 60,
    `data2`     = 1584
WHERE
    `entry`     = 179584;

UPDATE `gameobject_template`
SET
    `data0`     = 56,
    `data1`     = 60,
    `data2`     = 2017
WHERE
    `entry`     = 178831;

UPDATE `gameobject_template`
SET
    `data0`     = 13,
    `data1`     = 22,
    `data2`     = 2437
WHERE
    `entry`     = 179596;

UPDATE `gameobject_template`
SET
    `data0`     = 44,
    `data1`     = 60,
    `data2`     = 1477
WHERE
    `entry`     = 179554;

UPDATE `gameobject_template`
SET
    `data0`     = 18,
    `data1`     = 32,
    `data2`     = 209
WHERE
    `entry`     = 178845;

-- Spawn meeting stones ------------------------------------------------------
INSERT INTO `gameobject`
    (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
     (101,       178824,   1,    -4374.19,    -1953.61,      89.6649,     2.71399,        0,           0,                   0,           0,    900,             100,           1)
    ,(102,       178825,   1,    -4465.69,    -1807.09,      86.6898,    -3.00197,        0,           0,                   0,           0,    900,             100,           1)
    ,(103,       178826,   1,     -4427.5,     1412.92,      132.459,    -2.60054,        0,           0,                   0,           0,    900,             100,           1)
    ,(104,       178827,   1,    -1417.55,     2817.21,      112.341,     2.93215,        0,           0,                   0,           0,    900,             100,           1)
    ,(105,       178828,   1,     4075.15,     814.207,        2.121,      1.5708,        0,           0,                   0,           0,    900,             100,           1)
    ,(106,       178829,   1,    -6829.23,    -2874.29,      9.19099,    -1.18682,        0,           0,                   0,           0,    900,             100,           1)
    ,(107,       178831,   0,     3372.45,    -3379.63,      144.855,     3.03687,        0,           0,                   0,           0,    900,             100,           1)
    ,(108,       178832,   0,     1232.23,    -2571.76,      90.4589,    -1.71042,        0,           0,                   0,           0,   1200,             100,           1)
    ,(109,       178833,   0,    -6116.46,    -3299.53,      257.655,     2.87107,        0,           0,                   0,           0,    900,             100,           1)
    ,(110,       178834,   0,    -11089.3,     1561.09,      49.4401,     2.31256,        0,           0,                   0,           0,   3600,             100,           1)
    ,(111,       178844,   0,     2655.95,    -678.247,      111.193,    0.427606,        0,           0,                   0,           0,    900,             100,           1)
    ,(112,       178845,   0,    -247.137,     1509.01,      75.8482,    -2.68781,        0,           0,                   0,           0,   7200,             100,           1)
    ,(113,       178884,   1,    -793.299,    -2135.61,      92.3452,     2.98451,        0,           0,                   0,           0,    900,             100,           1)
    ,(114,       179554,   0,    -10457.8,    -3807.79,      18.0667,     1.98095,        0,           0,                   0,           0,    600,             100,           1)
    ,(115,       179555,   0,     -5203.7,       606.7,      411.465,      1.9984,        0,           0,                   0,           0,    900,             100,           1)
    ,(116,       179584,   0,    -7590.69,    -1139.77,      260.681,    -2.76635,        0,           0,                   0,           0,   7200,             100,           1)
    ,(117,       179585,   0,    -7625.35,    -1226.51,      231.776,    -2.77262,        0,           0,                   0,           0,   7200,             100,           1)
--  ,(118,       179586,   0,           0,           0,            0,           0,        0,           0,                   0,           0,    900,             100,           1)
--  ,(119,       179587,   0,           0,           0,            0,           0,        0,           0,                   0,           0,    900,             100,           1)
    ,(120,       179595,   0,     -8810.5,     798.038,      98.1829,     -3.0456,        0,           0,                   0,           0,    900,             100,           1)
    ,(121,       179596,   1,      1818.3,    -4402.07,     -17.8275,     2.68781,        0,           0,                   0,           0,    900,             100,           1)
    ,(122,       185321,   1,    -4753.15,    -3652.78,      46.3757,     -2.3911,        0,           0,                   0,           0,    900,             100,           1)
    ,(123,       185433,   0,    -11888.1,    -873.104,      35.8599,     2.05076,        0,           0,                   0,           0,    900,             100,           1)
;
