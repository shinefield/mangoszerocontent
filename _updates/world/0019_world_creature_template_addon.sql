-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature template addons used by character
-- spell or in game systems.
--

-- Insert addon information: these are creatures summoned by Warlocks --------
INSERT INTO `creature_template_addon`
    (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`)
VALUES
     (89, 0, 0, 0, 0, 0, 0, '19483')
    ,(4277, 0, 0, 1, 40, 0, 0, NULL)
;
