-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_gossip_menu_option` (`menu_id`, `id`) SELECT `menu_id`, `id` FROM `gossip_menu_option`;

-- - Insert localized gossip menu entry strings ------------------------------
UPDATE `locales_gossip_menu_option` SET `option_text_loc3` = 'Bringt mich ins Leben zurück.' WHERE `menu_id` = 83 AND `id` =0;
