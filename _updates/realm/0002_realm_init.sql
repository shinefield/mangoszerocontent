-- Host: localhost    Database: realm
-- ---------------------------------------------------------------------------
-- Add initial data to realm list server
--
-- We will add a test realm, along with accounts for each available
-- account type.
--

-- Provide variables
SET @REALM_ICON_PVP                             = 1;
SET @REALM_ICON_NORMAL                          = 4;
SET @REALM_ICON_RP                              = 6;
SET @REALM_ICON_RP_PVP                          = 8;

SET @REALM_TZ_DEVELOPMENT                       = 1;
SET @REALM_TZ_UNITED_STATES                     = 2;
SET @REALM_TZ_OCEANIC                           = 3;
SET @REALM_TZ_LATIN_AMERICA                     = 4;
SET @REALM_TZ_TOURNAMENT                        = 5;
SET @REALM_TZ_KOREA                             = 6;
SET @REALM_TZ_TOURNAMENT                        = 7;
SET @REALM_TZ_EUROPE_ENGLISH                    = 8;
SET @REALM_TZ_EUROPE_GERMAN                     = 9;
SET @REALM_TZ_EUROPE_FRENCH                     = 10;
SET @REALM_TZ_EUROPE_SPANISH                    = 11;

-- Create a default realm, set to PvE, and allowing access to
-- client builds 5875 (1.12.1), and 6005 (1.12.2).
INSERT INTO `realmlist`
    (`id`,  `name`,             `address`,      `port`, `icon`,             `realmflags`,   `timezone`,                 `allowedSecurityLevel`, `population`,   `realmbuilds`)
VALUES
    (1,     'Bronzebeard',      '127.0.0.1',    8085,   @REALM_ICON_NORMAL, 2,              @REALM_TZ_EUROPE_ENGLISH,   0,                      0,              '5875 6005')
;

-- Insert default accounts ---------------------------------------------------
INSERT INTO `account`
    (`id`, `username`, `sha_pass_hash`, `gmlevel`, `sessionkey`, `v`, `s`, `email`, `joindate`, `last_ip`, `failed_logins`, `locked`, `last_login`, `active_realm_id`, `expansion`, `mutetime`, `locale`)
VALUES
-- Create an administrator account
     (1,'ADMINISTRATOR','a34b29541b87b7e4823683ce6c7bf6ae68beaaac',3,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0)
-- Create a game master account
    ,(2,'GAMEMASTER','7841e21831d7c6bc0b57fbe7151eb82bd65ea1f9',2,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0)
-- Create a moderator account
    ,(3,'MODERATOR','a7f5fbff0b4eec2d6b6e78e38e8312e64d700008',1,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0)
-- Create a player account
    ,(4,'PLAYER','3ce8a96d17c5ae88a30681024e86279f1a38c041',0,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0)
;

-- Insert realm list database version
INSERT INTO `realmd_db_version`
VALUES
    (NULL)
;
