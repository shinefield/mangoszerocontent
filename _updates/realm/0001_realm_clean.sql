-- Host: localhost    Database: realm
-- ---------------------------------------------------------------------------
-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Temporary disable foreign key checks --------------------------------------
SET foreign_key_checks = 0;

-- Drop content and reset any auto incremented keys --------------------------
TRUNCATE `account`;
TRUNCATE `account_banned`;
TRUNCATE `ip_banned`;
TRUNCATE `realmcharacters`;
TRUNCATE `realmd_db_version`;
TRUNCATE `realmlist`;
TRUNCATE `uptime`;

-- Enable foreign key checks -------------------------------------------------
SET foreign_key_checks = 1;
