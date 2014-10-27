-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add mailboxes to the world database
--
-- This update will populate the world database with data required to test the
-- Azeroth Postal Service.
--

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_MAILBOX                            = 19;

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.1.5 (development)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.1.5 (development)'
WHERE
    `version`             = 'mangos-zero - version 0.1.4 (development)'
;

-- Insert mailbox templates --------------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
     (35591,  @GO_TYPE_FISHING_NODE,   668,       "Fishing Bobber"                  )
;

-- Configure mailbox templates -----------------------------------------------
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
