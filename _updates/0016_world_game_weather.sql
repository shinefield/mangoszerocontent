-- Add initial data to world database
--
-- We will add weather data
--

-- Select world database
USE `zp_world`;

-- Insert weather data for each zone
-- Dun_Morogh
INSERT INTO `game_weather` VALUES
    (1, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0);

-- Badlands
INSERT INTO `game_weather` VALUES
    (3, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 15);

-- Duskwood
INSERT INTO `game_weather` VALUES
    (10, 15, 0, 0, 15, 0, 0, 20, 0, 0, 15, 0, 0);

-- Wetlands
INSERT INTO `game_weather` VALUES
    (11, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, 0);

-- Elwynn_Forest
INSERT INTO `game_weather` VALUES
    (12, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0);

-- Dustwallow_Marsh
INSERT INTO `game_weather` VALUES
    (15, 25, 0, 0, 20, 0, 0, 25, 0, 0, 25, 0, 0);

-- Western_Plaguelands
INSERT INTO `game_weather` VALUES
    (28, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0);

-- Stranglethorn_Vale
INSERT INTO `game_weather` VALUES
    (33, 20, 0, 0, 25, 0, 0, 25, 0, 0, 20, 0, 0);

-- Alterac_Mountains
INSERT INTO `game_weather` VALUES
    (36, 0, 20, 0, 0, 20, 0, 0, 25, 0, 0, 30, 0);

-- Loch_Modan
INSERT INTO `game_weather` VALUES
    (38, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0);

-- Deadwind_Pass
INSERT INTO `game_weather` VALUES
    (41, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0);

-- Redridge_Mountains
INSERT INTO `game_weather` VALUES
    (44, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0);

-- Arathi_Highlands
INSERT INTO `game_weather` VALUES
    (45, 23, 0, 0, 15, 0, 0, 23, 0, 0, 23, 0, 0);

-- The_Hinterlands
INSERT INTO `game_weather` VALUES
    (47, 10, 0, 0, 10, 0, 0, 15, 0, 0, 10, 0, 0);

-- Tirisfal_Glades
INSERT INTO `game_weather` VALUES
    (85, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0);

-- Eastern_Plaguelands
INSERT INTO `game_weather` VALUES
    (139, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0);

-- Teldrassil
INSERT INTO `game_weather` VALUES
    (141, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0);

-- Darkshore
INSERT INTO `game_weather` VALUES
    (148, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0);

-- Mulgore
INSERT INTO `game_weather` VALUES
    (215, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0);

-- Hillsbrad_Foothills
INSERT INTO `game_weather` VALUES
    (267, 15, 0, 0, 10, 0, 0, 15, 0, 0, 15, 0, 0);

-- Feralas
INSERT INTO `game_weather` VALUES
    (357, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0);

-- Desolace
INSERT INTO `game_weather` VALUES
    (405, 10, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0);

-- Tanaris
INSERT INTO `game_weather` VALUES
    (440, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15);

-- UnGoro_Crater
INSERT INTO `game_weather` VALUES
    (490, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0);

-- Winterspring
INSERT INTO `game_weather` VALUES
    (618, 0, 25, 0, 0, 20, 0, 0, 20, 0, 0, 25, 0);

-- Scarlet_Monastery
INSERT INTO `game_weather` VALUES
    (796, 5, 0, 0, 10, 0, 0, 25, 0, 0, 5, 0, 0);

-- Silithus
INSERT INTO `game_weather` VALUES
    (1377, 0, 0, 20, 0, 0, 25, 0, 0, 20, 0, 0, 15);

-- ZulGurub
INSERT INTO `game_weather` VALUES
    (1977, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0);

-- Stratholme
INSERT INTO `game_weather` VALUES
    (2017, 5, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0);

-- Alterac_Valley
INSERT INTO `game_weather` VALUES
    (2597, 0, 15, 0, 0, 15, 0, 0, 20, 0, 0, 25, 0);

-- Arathi_Basin
INSERT INTO `game_weather` VALUES
    (3358, 10, 0, 0, 10, 0, 0, 10, 0, 0, 10, 0, 0);

-- AhnQiraj
INSERT INTO `game_weather` VALUES
    (3428, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20);

-- Ruins_of_AhnQiraj
INSERT INTO `game_weather` VALUES
    (3429, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20);
