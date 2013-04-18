-- Add initial data to world database
--
-- We will add player creation information.
--

-- Select world database
USE `zp_world`;

-- Provide variables for races, and classes
SET @RACE_HUMAN     = 1;
SET @RACE_ORC       = 2;
SET @RACE_DWARF     = 3;
SET @RACE_NIGHT_ELF = 4;
SET @RACE_UNDEAD    = 5;
SET @RACE_TAUREN    = 6;
SET @RACE_GNOME     = 7;
SET @RACE_TROLL     = 8;
SET @RACE_GOBLIN    = 9;

SET @CLASS_WARRIOR  = 1;
SET @CLASS_PALADIN  = 2;
SET @CLASS_HUNTER   = 3;
SET @CLASS_ROGUE    = 4;
SET @CLASS_PRIEST   = 5;
SET @CLASS_SHAMAN   = 7;
SET @CLASS_MAGE     = 8;
SET @CLASS_WARLOCK  = 9;
SET @CLASS_DRUID    = 11;

-- Insert creation information for player characters
INSERT INTO `playercreateinfo` VALUES
    -- Insert Human Warrior
    (@RACE_HUMAN, @CLASS_WARRIOR, 0, 12, -8949.95, -132.493, 83.5312, 0),
    -- Insert Human Paladin
    (@RACE_HUMAN, @CLASS_PALADIN, 0, 12, -8949.95, -132.493, 83.5312, 0),
    -- Insert Human Rogue
    (@RACE_HUMAN, @CLASS_ROGUE, 0, 12, -8949.95, -132.493, 83.5312, 0),
    -- Insert Human Priest
    (@RACE_HUMAN, @CLASS_PRIEST, 0, 12, -8949.95, -132.493, 83.5312, 0),
    -- Insert Human Mage
    (@RACE_HUMAN, @CLASS_MAGE, 0, 12, -8949.95, -132.493, 83.5312, 0),
    -- Insert Human Warlock
    (@RACE_HUMAN, @CLASS_WARLOCK, 0, 12, -8949.95, -132.493, 83.5312, 0),

    -- Insert Orc Warrior
    (@RACE_ORC, @CLASS_WARRIOR, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Orc Hunter
    (@RACE_ORC, @CLASS_HUNTER, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Orc Rogue
    (@RACE_ORC, @CLASS_ROGUE, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Orc Shaman
    (@RACE_ORC, @CLASS_SHAMAN, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Orc Warlock
    (@RACE_ORC, @CLASS_WARLOCK, 1, 14, -618.518, -4251.67, 38.718, 0),

    -- Insert Dwarf Warrior
    (@RACE_DWARF, @CLASS_WARRIOR, 0, 1, -6240.32, 331.033, 382.758, 6.17716),
    -- Insert Dwarf Paladin
    (@RACE_DWARF, @CLASS_PALADIN, 0, 1, -6240.32, 331.033, 382.758, 6.17716),
    -- Insert Dwarf Hunter
    (@RACE_DWARF, @CLASS_HUNTER, 0, 1, -6240.32, 331.033, 382.758, 6.17716),
    -- Insert Dwarf Rogue
    (@RACE_DWARF, @CLASS_ROGUE, 0, 1, -6240.32, 331.033, 382.758, 6.17716),
    -- Insert Dwarf Priest
    (@RACE_DWARF, @CLASS_PRIEST, 0, 1, -6240.32, 331.033, 382.758, 6.17716),

    -- Insert Night Elf Warrior
    (@RACE_NIGHT_ELF, @CLASS_WARRIOR, 1, 141, 10311.3, 832.463, 1326.41, 5.69632),
    -- Insert Night Elf Hunter
    (@RACE_NIGHT_ELF, @CLASS_HUNTER, 1, 141, 10311.3, 832.463, 1326.41, 5.69632),
    -- Insert Night Elf Rogue
    (@RACE_NIGHT_ELF, @CLASS_ROGUE, 1, 141, 10311.3, 832.463, 1326.41, 5.69632),
    -- Insert Night Elf Priest
    (@RACE_NIGHT_ELF, @CLASS_PRIEST, 1, 141, 10311.3, 832.463, 1326.41, 5.69632),
    -- Insert Night Elf Druid
    (@RACE_NIGHT_ELF, @CLASS_DRUID, 1, 141, 10311.3, 832.463, 1326.41, 5.69632),

    -- Insert Undead Warrior
    (@RACE_UNDEAD, @CLASS_WARRIOR, 0, 85, 1676.71, 1678.31, 121.67, 2.70526),
    -- Insert Undead Rogue
    (@RACE_UNDEAD, @CLASS_ROGUE, 0, 85, 1676.71, 1678.31, 121.67, 2.70526),
    -- Insert Undead Priest
    (@RACE_UNDEAD, @CLASS_PRIEST, 0, 85, 1676.71, 1678.31, 121.67, 2.70526),
    -- Insert Undead Mage
    (@RACE_UNDEAD, @CLASS_MAGE, 0, 85, 1676.71, 1678.31, 121.67, 2.70526),
    -- Insert Undead Warlock
    (@RACE_UNDEAD, @CLASS_WARLOCK, 0, 85, 1676.71, 1678.31, 121.67, 2.70526),

    -- Insert Tauren Warrior
    (@RACE_TAUREN, @CLASS_WARRIOR, 1, 215, -2917.58, -257.98, 52.9968, 0),
    -- Insert Tauren Hunter
    (@RACE_TAUREN, @CLASS_HUNTER, 1, 215, -2917.58, -257.98, 52.9968, 0),
    -- Insert Tauren Shaman
    (@RACE_TAUREN, @CLASS_SHAMAN, 1, 215, -2917.58, -257.98, 52.9968, 0),
    -- Insert Tauren Druid
    (@RACE_TAUREN, @CLASS_DRUID, 1, 215, -2917.58, -257.98, 52.9968, 0),

    -- Insert Gnome Warrior
    (@RACE_GNOME, @CLASS_WARRIOR, 0, 1, -6240.32, 331.033, 382.758, 0),
    -- Insert Gnome Rogue
    (@RACE_GNOME, @CLASS_ROGUE, 0, 1, -6240.32, 331.033, 382.758, 0),
    -- Insert Gnome Mage
    (@RACE_GNOME, @CLASS_MAGE, 0, 1, -6240.32, 331.033, 382.758, 0),
    -- Insert Gnome Warlock
    (@RACE_GNOME, @CLASS_WARLOCK, 0, 1, -6240.32, 331.033, 382.758, 0),

    -- Insert Troll Warrior
    (@RACE_TROLL, @CLASS_WARRIOR, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Troll Hunter
    (@RACE_TROLL, @CLASS_HUNTER, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Troll Rogue
    (@RACE_TROLL, @CLASS_ROGUE, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Troll Priest
    (@RACE_TROLL, @CLASS_PRIEST, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Troll Shaman
    (@RACE_TROLL, @CLASS_SHAMAN, 1, 14, -618.518, -4251.67, 38.718, 0),
    -- Insert Troll Mage
    (@RACE_TROLL, @CLASS_MAGE, 1, 14, -618.518, -4251.67, 38.718, 0);
