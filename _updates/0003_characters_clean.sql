-- Host: localhost    Database: zp_characters
-- ------------------------------------------------------
-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Temporary disable foreign key checks
SET foreign_key_checks = 0;

-- Drop content and reset any auto incremented keys
TRUNCATE `auction`;
TRUNCATE `bugreport`;
TRUNCATE `characters`;
TRUNCATE `character_action`;
TRUNCATE `character_aura`;
TRUNCATE `character_battleground_data`;
TRUNCATE `character_db_version`;
TRUNCATE `character_gifts`;
TRUNCATE `character_homebind`;
TRUNCATE `character_honor_cp`;
TRUNCATE `character_instance`;
TRUNCATE `character_inventory`;
TRUNCATE `character_pet`;
TRUNCATE `character_queststatus`;
TRUNCATE `character_reputation`;
TRUNCATE `character_skills`;
TRUNCATE `character_social`;
TRUNCATE `character_spell`;
TRUNCATE `character_spell_cooldown`;
TRUNCATE `character_stats`;
TRUNCATE `character_ticket`;
TRUNCATE `character_tutorial`;
TRUNCATE `corpse`;
TRUNCATE `creature_respawn`;
TRUNCATE `gameobject_respawn`;
TRUNCATE `game_event_status`;
TRUNCATE `groups`;
TRUNCATE `group_instance`;
TRUNCATE `group_member`;
TRUNCATE `guild`;
TRUNCATE `guild_eventlog`;
TRUNCATE `guild_member`;
TRUNCATE `guild_rank`;
TRUNCATE `instance`;
TRUNCATE `instance_reset`;
TRUNCATE `item_instance`;
TRUNCATE `item_loot`;
TRUNCATE `item_text`;
TRUNCATE `mail`;
TRUNCATE `mail_items`;
TRUNCATE `petition`;
TRUNCATE `petition_sign`;
TRUNCATE `pet_aura`;
TRUNCATE `pet_spell`;
TRUNCATE `pet_spell_cooldown`;
TRUNCATE `saved_variables`;
TRUNCATE `world`;

-- Enable foreign key checks
SET foreign_key_checks = 1;

-- Insert character database version
INSERT INTO `character_db_version` VALUES
    (NULL);
