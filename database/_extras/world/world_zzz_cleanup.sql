-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- World clean up script
--
-- This script will runs a few queries to ensure world content is
-- correct and fix a few common data issues.
--

SET @CREATURE_REGENERATE_HEALTH = 1;
SET @CREATURE_REGENERATE_POWER = 2;

-- reset spawn health if regeneration is active
UPDATE `creature`, `creature_template`
SET
    `creature`.`curhealth`  = `creature_template`.`MinLevelHealth`
WHERE
    `creature`.`id`         = `creature_template`.`entry`
AND `creature_template`.`RegenerateStats` & @CREATURE_REGENERATE_HEALTH = @CREATURE_REGENERATE_HEALTH;

-- reset spawn health if regeneration is active
UPDATE `creature`, `creature_template`
SET
    `creature`.`curmana`    = `creature_template`.`MinLevelMana`
WHERE
    `creature`.`id`         = `creature_template`.`entry`
AND `creature_template`.`RegenerateStats` & @CREATURE_REGENERATE_POWER = @CREATURE_REGENERATE_POWER;
