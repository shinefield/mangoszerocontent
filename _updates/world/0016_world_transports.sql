-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- We will add basic gameobject templates and transports which are required
-- to travel through the game.
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

-- Insert transport game objects ---------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
    -- Fixed location transport objects --------------------------------------
     (4170,   @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, left entrance
    ,(4171,   @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, left entrance
    ,(11898,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thousand Needles, Barrens + Freewind Post
    ,(11899,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thousand Needles, Barrens + Freewind Post
    ,(20649,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, left entrance
    ,(20650,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, left entrance upper doors
    ,(20651,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, left entrance lower doors
    ,(20652,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, right entrance
    ,(20653,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, right entrance upper doors
    ,(20654,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, right entrance lower doors
    ,(20655,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, middle entrance
    ,(20656,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, middle entrance upper doors
    ,(20657,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, middle entrance lower doors
    ,(47296,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, upper entrance
    ,(47297,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, upper entrance
    ,(80022,  @GO_TYPE_TRANSPORT,     808,        "Plunger"                         ) -- Gnomeregan above ground,elevator
    ,(80023,  @GO_TYPE_TRANSPORT,     807,        "Vator"                           ) -- Gnomeregan above ground,elevator
    ,(85556,  @GO_TYPE_TRANSPORT,     852,        "Vator2"                          ) -- Gnomeregan instance, elevator
    ,(149045, @GO_TYPE_TRANSPORT,    2454,        "Scaffold Cars"                   ) -- Burning Steps elevator, The Cauldron
    ,(149046, @GO_TYPE_TRANSPORT,    2454,        "Scaffold Cars"                   ) -- Burning Steps elevator, The Cauldron
    ,(152614, @GO_TYPE_TRANSPORT,    1587,        "Elevator"                        ) -- Gnomish inhouse elevator
    ,(176080, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176081, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176082, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176083, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176084, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176085, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176086, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts

    -- Mobile transports following a taxi path -------------------------------
    ,(20808,  @GO_TYPE_MO_TRANSPORT, 3015,        "Booty Bay Ship"                  ) -- Booty Bay <-> Ratchet
    ,(164871, @GO_TYPE_MO_TRANSPORT, 3031,        "Orgrimmar - Undercity"           ) -- Orgrimmar <-> Undercity
    ,(175080, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Orgrimmar"  ) -- Grom'Gol <-> Orgrimmar
    ,(176231, @GO_TYPE_MO_TRANSPORT, 3015,        "Proudmore's Treasure"            ) -- Menethil Harbor <-> Theramore Isle
    ,(176244, @GO_TYPE_MO_TRANSPORT, 3015,        "Moonspray"                       ) -- Teldrassil <-> Auberdine
    ,(176310, @GO_TYPE_MO_TRANSPORT, 3015,        "Serenity's Shore"                ) -- Menethil Harbor <-> Auberdine
    ,(176495, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Undercity"  ) -- Grom'Gol <-> Undercity
    ,(177233, @GO_TYPE_MO_TRANSPORT, 3015,        "Feathermoon Ferry"               ) -- Feathermoon <-> Forgotten Coast
    ,(181056, @GO_TYPE_MO_TRANSPORT, 6637,        "Naxxramas"                       ) -- Naxxramas Citadel roaming over the Eastern Plaguelands
;

-- Configure fixed location transport game objects ---------------------------
UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT
WHERE `entry` IN (21653, 21654, 21655, 21656, 32056, 32057, 80024);

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN
WHERE
    `entry` IN (4170, 4171, 11898, 11899, 20649, 20650, 20651, 20652, 20653, 20654, 20655, 20656, 20657, 47296, 47297, 80022, 80023, 85556, 149045, 149046, 152614);

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN
WHERE `entry` IN (176080, 176081, 176082, 176083, 176084, 176085, 176086);

-- Configure mobile transport game objects -----------------------------------
UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 241, `data1` = 30, `data2` = 1,
    `data5` = 1,
    `data6` = 593
WHERE `entry` = 20808;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 302, `data1` = 30, `data2` = 1,
    `data6` = 591
WHERE `entry` = 164871;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 285, `data1` = 30, `data2` = 1,
    `data6` = 589
WHERE `entry` = 175080;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 292, `data1` = 30, `data2` = 1,
    `data6` = 584
WHERE `entry` = 176231;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 293, `data1` = 30, `data2` = 1,
    `data6` = 582
WHERE `entry` = 176244;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 295, `data1` = 30, `data2` = 1,
    `data6` = 588
WHERE `entry` = 176310;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 301, `data1` = 30, `data2` = 1,
    `data6` = 590
WHERE `entry` = 176495;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 303, `data1` = 30, `data2` = 1,
    `data6` = 587
WHERE `entry` = 177233;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 436
WHERE `entry` = 181056;

-- Insert stationery transports ----------------------------------------------
INSERT INTO `gameobject`
    (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
     (1,          4170,   1,    -1286.24,      189.72,       130.08,    -1.07338,        0,           0,           -0.511294,    0.859406,    900,             100,           1)
    ,(2,          4171,   1,    -1308.38,      185.29,      68.5858,   -0.270525,        0,           0,            -0.13485,    0.990866,    900,             100,           1)
    ,(3,         11898,   1,    -4665.43,    -1827.67,      85.4053,    0.061086,        0,           0,            0.030538,    0.999534,    180,             100,           1)
    ,(4,         11898,   1,    -5399.19,    -2504.62,      89.0211,     2.60927,        0,           0,            0.964787,    0.263032,    180,             100,           1)
    ,(5,         11898,  47,     1734.57,     1372.33,      85.4053,    0.061086,        0,           0,            0.030538,    0.999534,   3600,             100,           1)
    ,(6,         11899,   1,    -4670.77,    -1849.61,     -44.1442,    -0.18326,        0,           0,           -0.091502,    0.995805,    180,             100,           1)
    ,(7,         11899,   1,     -5382.5,    -2489.42,     -40.5284,     2.36492,        0,           0,             0.92554,    0.378649,    180,             100,           1)
    ,(8,         11899,  47,     1729.23,     1350.39,     -44.1443,    -0.18326,        0,           0,           -0.091502,    0.995805,   3600,             100,           1)
    ,(9,         20649,   0,     1596.15,       291.8,      14.6822,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(10,        20650,   0,     1596.04,     282.738,      55.3952,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(11,        20651,   0,     1596.21,     302.401,     -40.6645,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(12,        20652,   0,     1595.26,     188.644,     -40.7835,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(13,        20653,   0,     1595.38,     197.706,      55.3952,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(14,        20654,   0,     1595.21,     178.693,     -40.5223,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(15,        20655,   0,     1544.24,     240.773,     -40.7835,   -0.008727,        0,           0,           -0.004363,     0.99999,    900,             100,           1)
    ,(16,        20656,   0,      1553.3,     240.656,      55.3952,   -0.008727,        0,           0,           -0.004363,     0.99999,    900,             100,           1)
    ,(17,        20657,   0,     1533.88,     240.826,     -32.3473,     3.13287,        0,           0,             0.99999,    0.004363,    900,             100,           1)
    ,(18,        47296,   1,    -1028.04,    -28.3568,      69.0226,      2.9147,        0,           0,            0.993572,    0.113203,    900,             100,           1)
    ,(19,        47297,   1,    -1037.27,    -49.2355,      140.495,     3.07178,        0,           0,            0.999391,    0.034899,    900,             100,           1)
    ,(20,        80022,   0,    -5164.47,     648.442,      362.099,     1.49226,        0,           0,            0.678801,    0.734323,    900,             100,           1)
    ,(21,        80023,   0,    -5164.24,     650.354,       349.52,     1.49226,        0,           0,            0.678801,    0.734323,    900,             100,           1)
    ,(22,        85556,  90,    -806.887,     323.963,     -271.656,     2.21308,        0,           0,            0.894154,    0.447759,   3600,             100,           1)
    ,(23,       149045,   0,    -6904.81,    -1206.78,      178.512,     2.98451,        0,           0,            0.996917,    0.078459,   7200,             100,           1)
    ,(24,       149045, 469,    -6904.81,    -1206.78,      178.512,      2.9845,        0,           0,            0.996917,   0.0784656,    180,             255,           1)
    ,(25,       149046,   0,    -6900.42,    -1339.33,      239.652,    -2.88852,        0,           0,            0.992005,   -0.126199,   7200,             100,           1)
    ,(26,       149046, 469,    -6900.42,    -1339.33,      239.652,    -2.88851,        0,           0,           -0.992004,    0.126204,    180,             255,           1)
    ,(27,       152614,   0,    -5067.46,     438.984,      423.758,     2.53945,        0,           0,             0.95502,    0.296542,    900,             100,           1)
    ,(28,       152614,   1,      2263.7,    -5565.56,      33.9385,    -1.09956,        0,           0,           -0.522498,     0.85264,    180,             100,           1)
;

-- Insert mobile transports ----------------------------------------------
INSERT INTO `gameobject`
    (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
     (29,       176080, 369,    -45.3934,     2472.93,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(30,       176081, 369,     4.52807,     8.43529,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(31,       176082, 369,    -45.4005,     2492.79,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(32,       176083, 369,    -45.4007,     2512.15,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(33,       176084, 369,     4.58065,     28.2097,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(34,       176085, 369,     4.49883,    -11.3475,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(35,       181056,   0,     3157.28,    -3743.47,      236.951,     2.76712,        0,           0,            0.982523,    0.186143,     25,             100,           1)
;

-- Insert mobile transports --------------------------------------------------
INSERT INTO `transports`
    (`entry`,   `name`,                                         `period`)
VALUES
     (20808,     "Ratchet and Booty Bay",                        350818)
    ,(164871,    "Orgrimmar and Undercity",                      356284)
    ,(175080,    "Grom'Gol Base Camp and Orgrimmar",             303463)
    ,(176231,    "Menethil Harbor and Theramore Isle",           329313)
    ,(176244,    "Teldrassil and Auberdine",                     316251)
    ,(176310,    "Menethil Harbor and Auberdine",                295579)
    ,(176495,    "Grom'Gol Base Camp and Undercity",             333044)
    ,(177233,    "Forgotton Coast and Feathermoon Stronghold",   317038)
;

-- Insert area trigger for Deeprun train -------------------------------------
INSERT INTO `areatrigger_teleport`
    (`id`,  `name`,                                         `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`)
VALUES
     (2166, 'Deeprun Tram - Ironforge Instance (Inside)',   0,            -4838.95,            -1318.46,             501.868,            1.42372)
    ,(2171, 'Deeprun Tram - Stormwind Instance (Inside)',   0,            -8364.57,             535.981,             91.7969,            2.24619)
    ,(2173, 'Deeprun Tram - Stormwind Instance',            369,           68.3006,             2490.91,            -4.29647,            3.12192)
    ,(2175, 'Deeprun Tram - Ironforge Instance',            369,           69.2542,              10.257,            -4.29664,            3.09832)
;
