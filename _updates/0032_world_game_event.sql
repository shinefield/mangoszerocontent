-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add game events used in zone 1, also known as
-- Dun Morogh.
--

-- Insert game events: these are events applicable to zone 1
INSERT INTO `game_event` VALUES
    (1,     '2006-06-21 00:00:00', '2020-12-31 23:59:59', 525600, 20160, 341, 'Midsummer Fire Festival'),
    (7,     '2006-01-27 00:00:00', '2020-12-31 23:59:59', 525600, 27360, 327, 'Lunar Festival'),
    (33,    '2006-10-03 00:00:00', '2020-12-31 23:59:59', 525600, 10080, 321, 'Harvest Festival');
