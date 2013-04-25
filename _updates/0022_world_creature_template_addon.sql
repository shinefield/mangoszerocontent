-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature template addons used by character
-- spell or in game systems.
--

-- Insert addon information: these are creatures summoned by Warlocks
INSERT INTO `creature_template_addon` VALUES
    (89, 0, 0, 0, 0, 0, 0, '19483'),
    (4277, 0, 0, 1, 40, 0, 0, NULL);
