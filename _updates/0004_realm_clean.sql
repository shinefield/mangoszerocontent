-- Wipe clean all data tables.
--
-- Do not get scared, we will be rebuilding all game data from scratch with
-- the following updates.
--

-- Select realm list database
USE `zp_realm`;

-- Drop content and reset any auto incremented keys
TRUNCATE `account`;
TRUNCATE `account_banned`;
TRUNCATE `ip_banned`;
TRUNCATE `realmcharacters`;
TRUNCATE `realmd_db_version`;
TRUNCATE `realmlist`;
TRUNCATE `uptime`;

-- Insert realm list database version
INSERT INTO `realmd_db_version` VALUES
    (NULL);
