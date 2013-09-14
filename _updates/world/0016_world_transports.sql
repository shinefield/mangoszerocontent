-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- We will add basic gameobject templates and transports which are required
-- to either manage or play the game.
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
    (`entry`, `type`,                `displayId`, `name`,                           `ScriptName`)
VALUES
     (20808,  @GO_TYPE_MO_TRANSPORT, 3015,        "Booty Bay Ship",                 NULL)
    ,(164871, @GO_TYPE_MO_TRANSPORT, 3031,        "Orgrimmar - Undercity",          NULL)
    ,(175080, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Orgrimmar", NULL)
    ,(176231, @GO_TYPE_MO_TRANSPORT, 3015,        "Proudmore's Treasure",           NULL)
    ,(176244, @GO_TYPE_MO_TRANSPORT, 3015,        "Moonspray",                      NULL)
    ,(176310, @GO_TYPE_MO_TRANSPORT, 3015,        "Serenity's Shore",               NULL)
    ,(176495, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Undercity", NULL)
    ,(177233, @GO_TYPE_MO_TRANSPORT, 3015,        "Feathermoon Ferry",              NULL)
;

-- Configure transport game objects ------------------------------------------
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

-- Insert transports ---------------------------------------------------------
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
