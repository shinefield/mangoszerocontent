-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_npc_text` (`entry`) SELECT `ID` FROM `npc_text`;

-- - Insert localized NPC text strings ---------------------------------------
UPDATE `locales_npc_text` SET `Text0_1_loc3` = 'Für Euch ist die Zeit noch nicht reif. Ich werde Euch bei der Reise zurück in die Welt der Lebenden behilflich sein... gegen Bezahlung.' WHERE `entry` = 580;
