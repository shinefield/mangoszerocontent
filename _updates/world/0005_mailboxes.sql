-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add mailboxes to the world database
--
-- This update will populate the world database with data required to test the
-- Azeroth Postal Service.
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

-- Insert fishing bobber templates -------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
     (35591,  @GO_TYPE_FISHING_NODE,   668,       "Fishing Bobber"                  )
;

-- Configure meeting stones --------------------------------------------------
UPDATE `gameobject_template`
SET
    `faction`   = 35, -- friendly
    `size`      = 1
WHERE
    `entry` IN (35591)
;

-- Insert fishing pole template ----------------------------------------------
INSERT INTO `item_template`
    (`entry`, `class`, `subclass`, `Quality`, `displayid`, `name`)
VALUES
     (6256,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_FISHING_POLE,         @ITEM_QUALITY_COMMON,    20730,  "Fishing Pole")
;
