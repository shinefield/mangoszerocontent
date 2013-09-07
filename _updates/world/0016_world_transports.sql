-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Add initial data to world database
--
-- We will add basic gameobject templates and transports which are required
-- to either manage or play the game.
--

-- Insert transport game objects
INSERT INTO `gameobject_template` VALUES
    (20808,  15, 3015, "Booty Bay Ship", 0, 40, 1, 241, 30, 1, 0, 0, 1, 593, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (164871, 15, 3031, "Orgrimmar - Undercity", 0, 40, 1, 302, 30, 1, 0, 0, 0, 591, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (175080, 15, 3031, "Grom'Gol Base Camp - Orgrimmar", 0, 40, 1, 285, 30, 1, 0, 0, 0, 589, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (176231, 15, 3015, "Proudmore's Treasure", 0, 40, 1, 292, 30, 1, 0, 0, 0, 584, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (176244, 15, 3015, "Moonspray", 0, 40, 1, 293, 30, 1, 0, 0, 0, 582, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (176310, 15, 3015, "Serenity's Shore", 0, 40, 1, 295, 30, 1, 0, 0, 0, 588, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (176495, 15, 3031, "Grom'Gol Base Camp - Undercity", 0, 40, 1, 301, 30, 1, 0, 0, 0, 590, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ''),
    (177233, 15, 3015, "Feathermoon Ferry", 0, 40, 1, 303, 30, 1, 0, 0, 0, 587, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '');

-- Insert transports
INSERT INTO `transports` VALUES
    (20808,     "Ratchet and Booty Bay",                        350818),
    (164871,    "Orgrimmar and Undercity",                      356284),
    (175080,    "Grom'Gol Base Camp and Orgrimmar",             303463),
    (176231,    "Menethil Harbor and Theramore Isle",           329313),
    (176244,    "Teldrassil and Auberdine",                     316251),
    (176310,    "Menethil Harbor and Auberdine",                295579),
    (176495,    "Grom'Gol Base Camp and Undercity",             333044),
    (177233,    "Forgotton Coast and Feathermoon Stronghold",   317038);
