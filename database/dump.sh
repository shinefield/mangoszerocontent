#!/bin/bash
#
# This script will dump the structure for the mangos databases for characters,
# realm list, world content and scripts.
# After dumps are created, the generated files will be modified to a more
# readable format.

# - Include settings ---------------------------------------------------------
if [[ ! -r "settings.sh" ]]; then
    echo "Could not open database configuration." >&2
    echo "Copy settings.sh.template to settings.sh and adapt it to your needs." >&2
    exit 2
else
    . "settings.sh"
fi

# - Prepare required variables -----------------------------------------------
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
TMP_FOLDER=${TMPDIR-/tmp}
# ----------------------------------------------------------------------------

function dump_data ()
{
    echo -n "Dumping contents of $1:$3 to $2..."
    [ ! -d ${DIR}/$2 ] && mkdir -p ${DIR}/_init/$2
    mysqldump${OPTS} -Q --skip-comments --skip-dump-date --add-drop-table $1 $3 >${DIR}/_init/$2/$3.sql
    echo " done"
}

function dump_struc ()
{
    echo -n "Dumping structure of $1:$3 to $2..."
    [ ! -d ${DIR}/$2 ] && mkdir -p ${DIR}/_init/$2
    mysqldump${OPTS} -Q --skip-comments --skip-dump-date --add-drop-table --no-data $1 $3 >${DIR}/_init/$2/$3.sql
    echo " done"
}

# Replace "VALUES (" by "VALUES\n("
# Split single line inserts into multi line inserts
function dump_cleanup ()
{
    find ${DIR}/_init/ -name '*.sql' -type f -exec perl -pi -e 's/VALUES \(/VALUES\n\(/g' {} \;
    find ${DIR}/_init/ -name '*.sql' -type f -exec perl -pi -e 's/\),\(/\),\n\(/g' {} \;
}

# ------------------------------------------------------------------------------
# Application tables with no data
# ------------------------------------------------------------------------------
dump_struc ${CHARACTER_DATABASE} character  auction
dump_struc ${CHARACTER_DATABASE} character  bugreport
dump_struc ${CHARACTER_DATABASE} character  characters
dump_struc ${CHARACTER_DATABASE} character  character_action
dump_struc ${CHARACTER_DATABASE} character  character_aura
dump_struc ${CHARACTER_DATABASE} character  character_battleground_data
dump_struc ${CHARACTER_DATABASE} character  character_db_version
dump_struc ${CHARACTER_DATABASE} character  character_gifts
dump_struc ${CHARACTER_DATABASE} character  character_homebind
dump_struc ${CHARACTER_DATABASE} character  character_honor_cp
dump_struc ${CHARACTER_DATABASE} character  character_instance
dump_struc ${CHARACTER_DATABASE} character  character_inventory
dump_struc ${CHARACTER_DATABASE} character  character_pet
dump_struc ${CHARACTER_DATABASE} character  character_queststatus
dump_struc ${CHARACTER_DATABASE} character  character_reputation
dump_struc ${CHARACTER_DATABASE} character  character_skills
dump_struc ${CHARACTER_DATABASE} character  character_social
dump_struc ${CHARACTER_DATABASE} character  character_spell
dump_struc ${CHARACTER_DATABASE} character  character_spell_cooldown
dump_struc ${CHARACTER_DATABASE} character  character_stats
dump_struc ${CHARACTER_DATABASE} character  character_ticket
dump_struc ${CHARACTER_DATABASE} character  character_tutorial
dump_struc ${CHARACTER_DATABASE} character  corpse
dump_struc ${CHARACTER_DATABASE} character  creature_respawn
dump_struc ${CHARACTER_DATABASE} character  gameobject_respawn
dump_struc ${CHARACTER_DATABASE} character  game_event_status
dump_struc ${CHARACTER_DATABASE} character  groups
dump_struc ${CHARACTER_DATABASE} character  group_instance
dump_struc ${CHARACTER_DATABASE} character  group_member
dump_struc ${CHARACTER_DATABASE} character  guild
dump_struc ${CHARACTER_DATABASE} character  guild_eventlog
dump_struc ${CHARACTER_DATABASE} character  guild_member
dump_struc ${CHARACTER_DATABASE} character  guild_rank
dump_struc ${CHARACTER_DATABASE} character  instance
dump_struc ${CHARACTER_DATABASE} character  instance_reset
dump_struc ${CHARACTER_DATABASE} character  item_instance
dump_struc ${CHARACTER_DATABASE} character  item_loot
dump_struc ${CHARACTER_DATABASE} character  item_text
dump_struc ${CHARACTER_DATABASE} character  mail
dump_struc ${CHARACTER_DATABASE} character  mail_items
dump_struc ${CHARACTER_DATABASE} character  petition
dump_struc ${CHARACTER_DATABASE} character  petition_sign
dump_struc ${CHARACTER_DATABASE} character  pet_aura
dump_struc ${CHARACTER_DATABASE} character  pet_spell
dump_struc ${CHARACTER_DATABASE} character  pet_spell_cooldown
dump_struc ${CHARACTER_DATABASE} character  pvpstats_battlegrounds
dump_struc ${CHARACTER_DATABASE} character  pvpstats_players
dump_struc ${CHARACTER_DATABASE} character  saved_variables
dump_struc ${CHARACTER_DATABASE} character  world

dump_struc ${REALM_DATABASE}     realm      account_banned
dump_struc ${REALM_DATABASE}     realm      ip_banned
dump_struc ${REALM_DATABASE}     realm      realmcharacters
dump_struc ${REALM_DATABASE}     realm      uptime

dump_struc ${SCRIPT_DATABASE}    script     custom_texts

dump_struc ${WORLD_DATABASE}     world      locales_creature
dump_struc ${WORLD_DATABASE}     world      locales_gameobject
dump_struc ${WORLD_DATABASE}     world      locales_gossip_menu_option
dump_struc ${WORLD_DATABASE}     world      locales_item
dump_struc ${WORLD_DATABASE}     world      locales_npc_text
dump_struc ${WORLD_DATABASE}     world      locales_page_text
dump_struc ${WORLD_DATABASE}     world      locales_points_of_interest
dump_struc ${WORLD_DATABASE}     world      locales_quest

# ------------------------------------------------------------------------------
# Application tables containing required data
# ------------------------------------------------------------------------------
dump_struc ${CHARACTER_DATABASE} character  character_db_version

dump_struc ${REALM_DATABASE}     realm      account
dump_struc ${REALM_DATABASE}     realm      realmd_db_version
dump_struc ${REALM_DATABASE}     realm      realmlist

dump_struc ${SCRIPT_DATABASE}    script     gossip_texts
dump_struc ${SCRIPT_DATABASE}    script     script_texts
dump_struc ${SCRIPT_DATABASE}    script     script_waypoint
dump_struc ${SCRIPT_DATABASE}    script     sd2_db_version

dump_struc ${WORLD_DATABASE}     world      areatrigger_involvedrelation
dump_struc ${WORLD_DATABASE}     world      areatrigger_tavern
dump_struc ${WORLD_DATABASE}     world      areatrigger_teleport
dump_struc ${WORLD_DATABASE}     world      battleground_events
dump_struc ${WORLD_DATABASE}     world      battleground_template
dump_struc ${WORLD_DATABASE}     world      battlemaster_entry
dump_struc ${WORLD_DATABASE}     world      command
dump_struc ${WORLD_DATABASE}     world      conditions
dump_struc ${WORLD_DATABASE}     world      creature
dump_struc ${WORLD_DATABASE}     world      creature_addon
dump_struc ${WORLD_DATABASE}     world      creature_ai_scripts
dump_struc ${WORLD_DATABASE}     world      creature_ai_summons
dump_struc ${WORLD_DATABASE}     world      creature_ai_texts
dump_struc ${WORLD_DATABASE}     world      creature_battleground
dump_struc ${WORLD_DATABASE}     world      creature_equip_template
dump_struc ${WORLD_DATABASE}     world      creature_equip_template_raw
dump_struc ${WORLD_DATABASE}     world      creature_involvedrelation
dump_struc ${WORLD_DATABASE}     world      creature_linking
dump_struc ${WORLD_DATABASE}     world      creature_linking_template
dump_struc ${WORLD_DATABASE}     world      creature_loot_template
dump_struc ${WORLD_DATABASE}     world      creature_model_info
dump_struc ${WORLD_DATABASE}     world      creature_movement
dump_struc ${WORLD_DATABASE}     world      creature_movement_template
dump_struc ${WORLD_DATABASE}     world      creature_onkill_reputation
dump_struc ${WORLD_DATABASE}     world      creature_questrelation
dump_struc ${WORLD_DATABASE}     world      creature_template
dump_struc ${WORLD_DATABASE}     world      creature_template_addon
dump_struc ${WORLD_DATABASE}     world      creature_template_classlevelstats
dump_struc ${WORLD_DATABASE}     world      creature_template_spells
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_creature_death
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_creature_movement
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_event
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_gossip
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_go_template_use
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_go_use
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_quest_end
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_quest_start
dump_struc ${WORLD_DATABASE}     world      dbscripts_on_spell
dump_struc ${WORLD_DATABASE}     world      db_script_string
dump_struc ${WORLD_DATABASE}     world      db_version
dump_struc ${WORLD_DATABASE}     world      disenchant_loot_template
dump_struc ${WORLD_DATABASE}     world      exploration_basexp
dump_struc ${WORLD_DATABASE}     world      fishing_loot_template
dump_struc ${WORLD_DATABASE}     world      gameobject
dump_struc ${WORLD_DATABASE}     world      gameobject_battleground
dump_struc ${WORLD_DATABASE}     world      gameobject_involvedrelation
dump_struc ${WORLD_DATABASE}     world      gameobject_loot_template
dump_struc ${WORLD_DATABASE}     world      gameobject_questrelation
dump_struc ${WORLD_DATABASE}     world      gameobject_template
dump_struc ${WORLD_DATABASE}     world      game_event
dump_struc ${WORLD_DATABASE}     world      game_event_creature
dump_struc ${WORLD_DATABASE}     world      game_event_creature_data
dump_struc ${WORLD_DATABASE}     world      game_event_gameobject
dump_struc ${WORLD_DATABASE}     world      game_event_mail
dump_struc ${WORLD_DATABASE}     world      game_event_quest
dump_struc ${WORLD_DATABASE}     world      game_graveyard_zone
dump_struc ${WORLD_DATABASE}     world      game_tele
dump_struc ${WORLD_DATABASE}     world      game_weather
dump_struc ${WORLD_DATABASE}     world      gossip_menu
dump_struc ${WORLD_DATABASE}     world      gossip_menu_option
dump_struc ${WORLD_DATABASE}     world      instance_template
dump_struc ${WORLD_DATABASE}     world      item_enchantment_template
dump_struc ${WORLD_DATABASE}     world      item_loot_template
dump_struc ${WORLD_DATABASE}     world      item_required_target
dump_struc ${WORLD_DATABASE}     world      item_template
dump_struc ${WORLD_DATABASE}     world      mail_loot_template
dump_struc ${WORLD_DATABASE}     world      mangos_string
dump_struc ${WORLD_DATABASE}     world      npc_gossip
dump_struc ${WORLD_DATABASE}     world      npc_text
dump_struc ${WORLD_DATABASE}     world      npc_trainer
dump_struc ${WORLD_DATABASE}     world      npc_trainer_template
dump_struc ${WORLD_DATABASE}     world      npc_vendor
dump_struc ${WORLD_DATABASE}     world      npc_vendor_template
dump_struc ${WORLD_DATABASE}     world      page_text
dump_struc ${WORLD_DATABASE}     world      petcreateinfo_spell
dump_struc ${WORLD_DATABASE}     world      pet_levelstats
dump_struc ${WORLD_DATABASE}     world      pet_name_generation
dump_struc ${WORLD_DATABASE}     world      pickpocketing_loot_template
dump_struc ${WORLD_DATABASE}     world      playercreateinfo
dump_struc ${WORLD_DATABASE}     world      playercreateinfo_action
dump_struc ${WORLD_DATABASE}     world      playercreateinfo_item
dump_struc ${WORLD_DATABASE}     world      playercreateinfo_spell
dump_struc ${WORLD_DATABASE}     world      player_classlevelstats
dump_struc ${WORLD_DATABASE}     world      player_levelstats
dump_struc ${WORLD_DATABASE}     world      player_xp_for_level
dump_struc ${WORLD_DATABASE}     world      points_of_interest
dump_struc ${WORLD_DATABASE}     world      pool_creature
dump_struc ${WORLD_DATABASE}     world      pool_creature_template
dump_struc ${WORLD_DATABASE}     world      pool_gameobject
dump_struc ${WORLD_DATABASE}     world      pool_gameobject_template
dump_struc ${WORLD_DATABASE}     world      pool_pool
dump_struc ${WORLD_DATABASE}     world      pool_template
dump_struc ${WORLD_DATABASE}     world      quest_template
dump_struc ${WORLD_DATABASE}     world      reference_loot_template
dump_struc ${WORLD_DATABASE}     world      reputation_reward_rate
dump_struc ${WORLD_DATABASE}     world      reputation_spillover_template
dump_struc ${WORLD_DATABASE}     world      reserved_name
dump_struc ${WORLD_DATABASE}     world      scripted_areatrigger
dump_struc ${WORLD_DATABASE}     world      scripted_event
dump_struc ${WORLD_DATABASE}     world      skill_fishing_base_level
dump_struc ${WORLD_DATABASE}     world      skinning_loot_template
dump_struc ${WORLD_DATABASE}     world      spell_affect
dump_struc ${WORLD_DATABASE}     world      spell_area
dump_struc ${WORLD_DATABASE}     world      spell_bonus_data
dump_struc ${WORLD_DATABASE}     world      spell_chain
dump_struc ${WORLD_DATABASE}     world      spell_elixir
dump_struc ${WORLD_DATABASE}     world      spell_facing
dump_struc ${WORLD_DATABASE}     world      spell_learn_spell
dump_struc ${WORLD_DATABASE}     world      spell_pet_auras
dump_struc ${WORLD_DATABASE}     world      spell_proc_event
dump_struc ${WORLD_DATABASE}     world      spell_proc_item_enchant
dump_struc ${WORLD_DATABASE}     world      spell_script_target
dump_struc ${WORLD_DATABASE}     world      spell_target_position
dump_struc ${WORLD_DATABASE}     world      spell_threat
dump_struc ${WORLD_DATABASE}     world      transports
dump_struc ${WORLD_DATABASE}     world      world_template

# ------------------------------------------------------------------------------
# Clean up generated SQL files
# ------------------------------------------------------------------------------
dump_cleanup
