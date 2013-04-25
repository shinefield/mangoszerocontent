-- Host: localhost    Database: zp_world
-- ------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add raw creature equipment templates used in
-- zone 3, also known as Badlands.
--

-- Insert raw equipment templates: these are creatures from zone 3
INSERT INTO `creature_equip_template_raw` VALUES
    (92, 1705, 0, 0, 234948100, 0, 0, 4, 0, 0),
    (1068, 22378, 22378, 0, 33490690, 33490690, 0, 781, 781, 0),
    (1407, 28804, 0, 0, 0, 0, 0, 0, 0, 0);
