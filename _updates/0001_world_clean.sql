-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Temporary disable foreign key checks
SET foreign_key_checks = 0;

-- Drop content and reset any auto incremented keys
TRUNCATE `areatrigger_involvedrelation`;
TRUNCATE `areatrigger_tavern`;
TRUNCATE `areatrigger_teleport`;
TRUNCATE `battleground_events`;
TRUNCATE `battleground_template`;
TRUNCATE `battlemaster_entry`;
TRUNCATE `command`;
TRUNCATE `conditions`;
TRUNCATE `creature`;
TRUNCATE `creature_addon`;
TRUNCATE `creature_ai_scripts`;
TRUNCATE `creature_ai_summons`;
TRUNCATE `creature_ai_texts`;
TRUNCATE `creature_battleground`;
TRUNCATE `creature_equip_template`;
TRUNCATE `creature_equip_template_raw`;
TRUNCATE `creature_involvedrelation`;
TRUNCATE `creature_linking`;
TRUNCATE `creature_linking_template`;
TRUNCATE `creature_loot_template`;
TRUNCATE `creature_model_info`;
TRUNCATE `creature_movement`;
TRUNCATE `creature_movement_template`;
TRUNCATE `creature_onkill_reputation`;
TRUNCATE `creature_questrelation`;
TRUNCATE `creature_template`;
TRUNCATE `creature_template_addon`;
TRUNCATE `creature_template_spells`;
TRUNCATE `dbscripts_on_creature_death`;
TRUNCATE `dbscripts_on_creature_movement`;
TRUNCATE `dbscripts_on_event`;
TRUNCATE `dbscripts_on_gossip`;
TRUNCATE `dbscripts_on_go_template_use`;
TRUNCATE `dbscripts_on_go_use`;
TRUNCATE `dbscripts_on_quest_end`;
TRUNCATE `dbscripts_on_quest_start`;
TRUNCATE `dbscripts_on_spell`;
TRUNCATE `db_script_string`;
TRUNCATE `db_version`;
TRUNCATE `disenchant_loot_template`;
TRUNCATE `exploration_basexp`;
TRUNCATE `fishing_loot_template`;
TRUNCATE `gameobject`;
TRUNCATE `gameobject_battleground`;
TRUNCATE `gameobject_involvedrelation`;
TRUNCATE `gameobject_loot_template`;
TRUNCATE `gameobject_questrelation`;
TRUNCATE `gameobject_template`;
TRUNCATE `game_event`;
TRUNCATE `game_event_creature`;
TRUNCATE `game_event_creature_data`;
TRUNCATE `game_event_gameobject`;
TRUNCATE `game_event_mail`;
TRUNCATE `game_event_quest`;
TRUNCATE `game_graveyard_zone`;
TRUNCATE `game_tele`;
TRUNCATE `game_weather`;
TRUNCATE `gossip_menu`;
TRUNCATE `gossip_menu_option`;
TRUNCATE `instance_template`;
TRUNCATE `item_enchantment_template`;
TRUNCATE `item_loot_template`;
TRUNCATE `item_required_target`;
TRUNCATE `item_template`;
TRUNCATE `locales_creature`;
TRUNCATE `locales_gameobject`;
TRUNCATE `locales_gossip_menu_option`;
TRUNCATE `locales_item`;
TRUNCATE `locales_npc_text`;
TRUNCATE `locales_page_text`;
TRUNCATE `locales_points_of_interest`;
TRUNCATE `locales_quest`;
TRUNCATE `mail_loot_template`;
TRUNCATE `mangos_string`;
TRUNCATE `npc_gossip`;
TRUNCATE `npc_text`;
TRUNCATE `npc_trainer`;
TRUNCATE `npc_trainer_template`;
TRUNCATE `npc_vendor`;
TRUNCATE `npc_vendor_template`;
TRUNCATE `page_text`;
TRUNCATE `petcreateinfo_spell`;
TRUNCATE `pet_levelstats`;
TRUNCATE `pet_name_generation`;
TRUNCATE `pickpocketing_loot_template`;
TRUNCATE `playercreateinfo`;
TRUNCATE `playercreateinfo_action`;
TRUNCATE `playercreateinfo_item`;
TRUNCATE `playercreateinfo_spell`;
TRUNCATE `player_classlevelstats`;
TRUNCATE `player_levelstats`;
TRUNCATE `player_xp_for_level`;
TRUNCATE `points_of_interest`;
TRUNCATE `pool_creature`;
TRUNCATE `pool_creature_template`;
TRUNCATE `pool_gameobject`;
TRUNCATE `pool_gameobject_template`;
TRUNCATE `pool_pool`;
TRUNCATE `pool_template`;
TRUNCATE `quest_template`;
TRUNCATE `reference_loot_template`;
TRUNCATE `reputation_reward_rate`;
TRUNCATE `reputation_spillover_template`;
TRUNCATE `reserved_name`;
TRUNCATE `scripted_areatrigger`;
TRUNCATE `scripted_event_id`;
TRUNCATE `skill_fishing_base_level`;
TRUNCATE `skinning_loot_template`;
TRUNCATE `spell_affect`;
TRUNCATE `spell_area`;
TRUNCATE `spell_bonus_data`;
TRUNCATE `spell_chain`;
TRUNCATE `spell_elixir`;
TRUNCATE `spell_facing`;
TRUNCATE `spell_learn_spell`;
TRUNCATE `spell_linked`;
TRUNCATE `spell_pet_auras`;
TRUNCATE `spell_proc_event`;
TRUNCATE `spell_proc_item_enchant`;
TRUNCATE `spell_script_target`;
TRUNCATE `spell_target_position`;
TRUNCATE `spell_threat`;
TRUNCATE `transports`;
TRUNCATE `world_template`;

-- Enable foreign key checks
SET foreign_key_checks = 1;

-- Insert world database version
INSERT INTO `db_version` VALUES
    ('mangos-zero - Version 0.1.0 (Community Rebuild)','mangos-zero Artificial Creature Intelligence - Version 0.1.0 (Community Rebuild)',NULL);
