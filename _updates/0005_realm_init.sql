-- Add initial data to realm list server
--
-- We will add a test realm, along with accounts for each available
-- account type.
--

-- Select realm list database
USE `zp_realm`;

-- Create a default realm, set to PvE, and allowing access to
-- client builds 5875 (1.12.1), and 6005 (1.12.2).
INSERT INTO `realmlist` VALUES
    (1, 'mangos-zero', '127.0.0.1', 8085, 0, 2, 0, 0, 0, '5875 6005');

-- Create an administrator account
INSERT INTO `account` VALUES
    (1,'ADMINISTRATOR','a34b29541b87b7e4823683ce6c7bf6ae68beaaac',3,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);

-- Create a game master account
INSERT INTO `account` VALUES
    (2,'GAMEMASTER','7841e21831d7c6bc0b57fbe7151eb82bd65ea1f9',2,'','0','0','','2006-04-25 10:18:56','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);

-- Create a moderator account
INSERT INTO `account` VALUES
    (3,'MODERATOR','a7f5fbff0b4eec2d6b6e78e38e8312e64d700008',1,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);

-- Create a player account
INSERT INTO `account` VALUES
    (4,'PLAYER','3ce8a96d17c5ae88a30681024e86279f1a38c041',0,'','0','0','','2006-04-25 10:19:35','127.0.0.1',0,0,'0000-00-00 00:00:00',0,0,0,0);
