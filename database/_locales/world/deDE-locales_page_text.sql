-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_page_text` (`entry`) SELECT `entry` FROM `page_text`;

-- - Insert localized item page strings --------------------------------------
