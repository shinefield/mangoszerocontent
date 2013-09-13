-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Add initial data to world database
--
-- We will add player creation information.
--

-- Provide variables for races, and classes
SET @RACE_HUMAN                                 = 1;
SET @RACE_ORC                                   = 2;
SET @RACE_DWARF                                 = 3;
SET @RACE_NIGHT_ELF                             = 4;
SET @RACE_UNDEAD                                = 5;
SET @RACE_TAUREN                                = 6;
SET @RACE_GNOME                                 = 7;
SET @RACE_TROLL                                 = 8;
SET @RACE_GOBLIN                                = 9;

SET @CLASS_WARRIOR                              = 1;
SET @CLASS_PALADIN                              = 2;
SET @CLASS_HUNTER                               = 3;
SET @CLASS_ROGUE                                = 4;
SET @CLASS_PRIEST                               = 5;
SET @CLASS_SHAMAN                               = 7;
SET @CLASS_MAGE                                 = 8;
SET @CLASS_WARLOCK                              = 9;
SET @CLASS_DRUID                                = 11;

-- Insert creation information for player characters
INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_HUMAN, @CLASS_WARRIOR,      0, 12, -8949.95, -132.493, 83.5312, 0)
    ,(@RACE_HUMAN, @CLASS_PALADIN,      0, 12, -8949.95, -132.493, 83.5312, 0)
    ,(@RACE_HUMAN, @CLASS_ROGUE,        0, 12, -8949.95, -132.493, 83.5312, 0)
    ,(@RACE_HUMAN, @CLASS_PRIEST,       0, 12, -8949.95, -132.493, 83.5312, 0)
    ,(@RACE_HUMAN, @CLASS_MAGE,         0, 12, -8949.95, -132.493, 83.5312, 0)
    ,(@RACE_HUMAN, @CLASS_WARLOCK,      0, 12, -8949.95, -132.493, 83.5312, 0)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_ORC, @CLASS_WARRIOR,        1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_ORC, @CLASS_HUNTER,         1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_ORC, @CLASS_ROGUE,          1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_ORC, @CLASS_SHAMAN,         1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_ORC, @CLASS_WARLOCK,        1, 14, -618.518, -4251.67, 38.718, 0)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_DWARF, @CLASS_WARRIOR,      0, 1, -6240.32, 331.033, 382.758, 6.17716)
    ,(@RACE_DWARF, @CLASS_PALADIN,      0, 1, -6240.32, 331.033, 382.758, 6.17716)
    ,(@RACE_DWARF, @CLASS_HUNTER,       0, 1, -6240.32, 331.033, 382.758, 6.17716)
    ,(@RACE_DWARF, @CLASS_ROGUE,        0, 1, -6240.32, 331.033, 382.758, 6.17716)
    ,(@RACE_DWARF, @CLASS_PRIEST,       0, 1, -6240.32, 331.033, 382.758, 6.17716)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_WARRIOR,  1, 141, 10311.3, 832.463, 1326.41, 5.69632)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER,   1, 141, 10311.3, 832.463, 1326.41, 5.69632)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE,    1, 141, 10311.3, 832.463, 1326.41, 5.69632)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST,   1, 141, 10311.3, 832.463, 1326.41, 5.69632)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID,    1, 141, 10311.3, 832.463, 1326.41, 5.69632)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_UNDEAD, @CLASS_WARRIOR,     0, 85, 1676.71, 1678.31, 121.67, 2.70526)
    ,(@RACE_UNDEAD, @CLASS_ROGUE,       0, 85, 1676.71, 1678.31, 121.67, 2.70526)
    ,(@RACE_UNDEAD, @CLASS_PRIEST,      0, 85, 1676.71, 1678.31, 121.67, 2.70526)
    ,(@RACE_UNDEAD, @CLASS_MAGE,        0, 85, 1676.71, 1678.31, 121.67, 2.70526)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK,     0, 85, 1676.71, 1678.31, 121.67, 2.70526)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_TAUREN, @CLASS_WARRIOR,     1, 215, -2917.58, -257.98, 52.9968, 0)
    ,(@RACE_TAUREN, @CLASS_HUNTER,      1, 215, -2917.58, -257.98, 52.9968, 0)
    ,(@RACE_TAUREN, @CLASS_SHAMAN,      1, 215, -2917.58, -257.98, 52.9968, 0)
    ,(@RACE_TAUREN, @CLASS_DRUID,       1, 215, -2917.58, -257.98, 52.9968, 0)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_GNOME, @CLASS_WARRIOR,      0, 1, -6240.32, 331.033, 382.758, 0)
    ,(@RACE_GNOME, @CLASS_ROGUE,        0, 1, -6240.32, 331.033, 382.758, 0)
    ,(@RACE_GNOME, @CLASS_MAGE,         0, 1, -6240.32, 331.033, 382.758, 0)
    ,(@RACE_GNOME, @CLASS_WARLOCK,      0, 1, -6240.32, 331.033, 382.758, 0)
;

INSERT INTO `playercreateinfo`
    (`race`, `class`, `map`, `zone`, `position_x`, `position_y`, `position_z`, `orientation`)
VALUES
     (@RACE_TROLL, @CLASS_WARRIOR,      1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_TROLL, @CLASS_HUNTER,       1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_TROLL, @CLASS_ROGUE,        1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_TROLL, @CLASS_PRIEST,       1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_TROLL, @CLASS_SHAMAN,       1, 14, -618.518, -4251.67, 38.718, 0)
    ,(@RACE_TROLL, @CLASS_MAGE,         1, 14, -618.518, -4251.67, 38.718, 0)
;