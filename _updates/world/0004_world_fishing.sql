-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add fishing data to world database
--
-- This update will populate the world database with data required to test
-- fishing.
--

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_FISHING_NODE                       = 17;

-- Provide variables for various item stats ----------------------------------
SET @ITEM_QUALITY_COMMON                        = 1;
SET @ITEM_CLASS_WEAPON                          = 2;
SET @ITEM_SUBCLASS_WEAPON_FISHING_POLE          = 20;
SET @INVTYPE_2HWEAPON                           = 17;
SET @MATERIAL_WOOD                              = 2;
SET @SHEATHETYPE_MAINHAND                       = 1;

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.1.4 (development)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.1.4 (development)'
WHERE
    `version`             = 'mangos-zero - version 0.1.3 (development)'
;

-- Insert fishing bobber templates -------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
     (35591,  @GO_TYPE_FISHING_NODE,   668,       "Fishing Bobber"                  )
;

-- Configure the fishing bobber ----------------------------------------------
UPDATE `gameobject_template`
SET
    `faction`   = 35 -- friendly
WHERE
    `entry` IN (35591)
;

-- Insert fishing pole template ----------------------------------------------
INSERT INTO `item_template`
    (`entry`, `class`, `subclass`, `Quality`, `displayid`, `name`)
VALUES
     (6256,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_FISHING_POLE,         @ITEM_QUALITY_COMMON,    20730,  "Fishing Pole")
;

-- Configure fishing pole template -------------------------------------------
UPDATE `item_template`
SET
    `BuyCount`          = 1,
    `BuyPrice`          = 23,
    `SellPrice`         = 4,
    `InventoryType`     = @INVTYPE_2HWEAPON,
    `ItemLevel`         = 1,
    `stackable`         = 1,
    `dmg_min1`          = 2,
    `dmg_max1`          = 4,
    `delay`             = 3000,
    `Material`          = @MATERIAL_WOOD,
    `sheath`            = @SHEATHETYPE_MAINHAND,
    `MaxDurability`     = 16
WHERE
    `entry` = 6256;
