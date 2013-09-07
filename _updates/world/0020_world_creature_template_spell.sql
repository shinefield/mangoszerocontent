-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature template spells used by character
-- spell or in game systems.
--

-- Insert spell information: these are creatures summoned by Warlocks
INSERT INTO `creature_template_spells` VALUES
    (416, 3110, 0, 0, 0),
    (11859, 4629, 20549, 20812, 21949);
