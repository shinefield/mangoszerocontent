-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Select script library database
USE `zp_scripts`;

TRUNCATE `custom_texts`;
TRUNCATE `gossip_texts`;
TRUNCATE `script_texts`;
TRUNCATE `script_waypoint`;

UPDATE
    `sd2_db_version`
SET
    `version` = 'ScriptDev2 - Version 1.0.0 (Community Rebuild)';
