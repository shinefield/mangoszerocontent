-- Host: localhost    Database: script
-- ------------------------------------------------------
-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Temporary disable foreign key checks
SET foreign_key_checks = 0;

-- Drop content and reset any auto incremented keys
TRUNCATE `custom_texts`;
TRUNCATE `gossip_texts`;
TRUNCATE `script_texts`;
TRUNCATE `script_waypoint`;
TRUNCATE `sd2_db_version`;

-- Enable foreign key checks
SET foreign_key_checks = 1;
