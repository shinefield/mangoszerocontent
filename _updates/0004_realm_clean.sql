-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Select character database
USE `zp_realm`;

TRUNCATE `account`;
TRUNCATE `account_banned`;
TRUNCATE `ip_banned`;
TRUNCATE `realmcharacters`;
TRUNCATE `realmd_db_version`;
TRUNCATE `realmlist`;
TRUNCATE `uptime`;
