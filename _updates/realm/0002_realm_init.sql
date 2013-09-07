-- Host: localhost    Database: realm
-- ------------------------------------------------------
-- Add initial data to realm list server
--
-- We will add a test realm, along with accounts for each available
-- account type.
--

-- Create a default realm, set to PvE, and allowing access to
-- client builds 5875 (1.12.1), and 6005 (1.12.2).
INSERT INTO `realmlist` VALUES
    (1, 'mangos-zero', '127.0.0.1', 8085, 0, 2, 0, 0, 0, '5875 6005');

-- Insert default accounts
INSERT INTO `account` VALUES
-- Create an administrator account
    (1,'ADMINISTRATOR','a34b29541b87b7e4823683ce6c7bf6ae68beaaac',3,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),
-- Create a game master account
    (2,'GAMEMASTER','7841e21831d7c6bc0b57fbe7151eb82bd65ea1f9',2,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),
-- Create a moderator account
    (3,'MODERATOR','a7f5fbff0b4eec2d6b6e78e38e8312e64d700008',1,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0),
-- Create a player account
    (4,'PLAYER','3ce8a96d17c5ae88a30681024e86279f1a38c041',0,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);

-- Insert realm list database version
INSERT INTO `realmd_db_version` VALUES
    (NULL);
