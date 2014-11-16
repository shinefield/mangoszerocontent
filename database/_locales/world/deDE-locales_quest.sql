-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_quest` (`entry`) SELECT `entry` FROM `quest_template`;

-- - Insert localized quest text strings -------------------------------------
