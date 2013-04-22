-- Host: localhost    Database: zp_scripts
-- ------------------------------------------------------
-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

TRUNCATE `custom_texts`;
TRUNCATE `gossip_texts`;
TRUNCATE `script_texts`;
TRUNCATE `script_waypoint`;
TRUNCATE `sd2_db_version`;

-- Insert script library database version
INSERT INTO `sd2_db_version` VALUES
    ('ScriptDev2 - Version 1.0.0 (Community Rebuild)');

