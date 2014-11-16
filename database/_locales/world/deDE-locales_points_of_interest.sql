-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_points_of_interest` (`entry`) SELECT `entry` FROM `points_of_interest`;

-- - Insert localized points of interest strings -----------------------------
