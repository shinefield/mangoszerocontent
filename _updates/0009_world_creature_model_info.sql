-- Add initial data to world database
--
-- We will add model information used to display player characters.
--

-- Select world database
USE `zp_world`;

-- Insert creature model information for player characters
INSERT INTO `creature_model_info` VALUES
    (49, 0.306, 1.5, 0, 50, 0),
    (50, 0.208, 1.5, 1, 49, 0),
    (51, 0.372, 1.5, 0, 52, 0),
    (52, 0.236, 1.5, 1, 51, 0),
    (53, 0.347, 1.5, 0, 54, 0),
    (54, 0.347, 1.5, 1, 53, 0),
    (55, 0.389, 1.5, 0, 56, 0),
    (56, 0.306, 1.5, 1, 55, 0),
    (57, 0.383, 1.5, 0, 58, 0),
    (58, 0.383, 1.5, 1, 57, 0),
    (59, 0.9747, 1.5, 0, 60, 0),
    (60, 0.8725, 1.5, 1, 59, 0),
    (1478, 0.306, 1.5, 0, 1479, 0),
    (1479, 0.306, 1.5, 1, 1478, 0),
    (1563, 0.3519, 1.5, 0, 1564, 0),
    (1564, 0.3519, 1.5, 1, 1563, 0);
