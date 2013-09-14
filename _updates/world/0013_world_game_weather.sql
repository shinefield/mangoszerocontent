-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- We will add weather data
--

-- Insert weather data for each zone -----------------------------------------
INSERT INTO `game_weather`
    (`zone`, `spring_rain_chance`, `spring_snow_chance`, `spring_storm_chance`, `summer_rain_chance`, `summer_snow_chance`, `summer_storm_chance`, `fall_rain_chance`, `fall_snow_chance`, `fall_storm_chance`, `winter_rain_chance`, `winter_snow_chance`, `winter_storm_chance`)
VALUES
     (1, 0, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0)        -- Dun_Morogh
    ,(3, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 15)        -- Badlands
    ,(10, 15, 0, 0, 15, 0, 0, 20, 0, 0, 15, 0, 0)       -- Duskwood
    ,(11, 25, 0, 0, 15, 0, 0, 25, 0, 0, 25, 0, 0)       -- Wetlands
    ,(12, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0)       -- Elwynn_Forest
    ,(15, 25, 0, 0, 20, 0, 0, 25, 0, 0, 25, 0, 0)       -- Dustwallow_Marsh
    ,(28, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0)       -- Western_Plaguelands
    ,(33, 20, 0, 0, 25, 0, 0, 25, 0, 0, 20, 0, 0)       -- Stranglethorn_Vale
    ,(36, 0, 20, 0, 0, 20, 0, 0, 25, 0, 0, 30, 0)       -- Alterac_Mountains
    ,(38, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0)       -- Loch_Modan
    ,(41, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0)        -- Deadwind_Pass
    ,(44, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0)       -- Redridge_Mountains
    ,(45, 23, 0, 0, 15, 0, 0, 23, 0, 0, 23, 0, 0)       -- Arathi_Highlands
    ,(47, 10, 0, 0, 10, 0, 0, 15, 0, 0, 10, 0, 0)       -- The_Hinterlands
    ,(85, 20, 0, 0, 15, 0, 0, 20, 0, 0, 20, 0, 0)       -- Tirisfal_Glades
    ,(139, 10, 0, 0, 15, 0, 0, 15, 0, 0, 10, 0, 0)      -- Eastern_Plaguelands
    ,(141, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0)       -- Teldrassil
    ,(148, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0)      -- Darkshore
    ,(215, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0)      -- Mulgore
    ,(267, 15, 0, 0, 10, 0, 0, 15, 0, 0, 15, 0, 0)      -- Hillsbrad_Foothills
    ,(357, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0)      -- Feralas
    ,(405, 10, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0)         -- Desolace
    ,(440, 0, 0, 15, 0, 0, 15, 0, 0, 15, 0, 0, 15)      -- Tanaris
    ,(490, 15, 0, 0, 10, 0, 0, 20, 0, 0, 15, 0, 0)      -- UnGoro_Crater
    ,(618, 0, 25, 0, 0, 20, 0, 0, 20, 0, 0, 25, 0)      -- Winterspring
    ,(796, 5, 0, 0, 10, 0, 0, 25, 0, 0, 5, 0, 0)        -- Scarlet_Monastery
    ,(1377, 0, 0, 20, 0, 0, 25, 0, 0, 20, 0, 0, 15)     -- Silithus
    ,(1977, 15, 0, 0, 5, 0, 0, 15, 0, 0, 15, 0, 0)      -- ZulGurub
    ,(2017, 5, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0)         -- Stratholme
    ,(2597, 0, 15, 0, 0, 15, 0, 0, 20, 0, 0, 25, 0)     -- Alterac_Valley
    ,(3358, 10, 0, 0, 10, 0, 0, 10, 0, 0, 10, 0, 0)     -- Arathi_Basin
    ,(3428, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20)     -- AhnQiraj
    ,(3429, 0, 0, 20, 0, 0, 20, 0, 0, 20, 0, 0, 20)     -- Ruins_of_AhnQiraj
;
