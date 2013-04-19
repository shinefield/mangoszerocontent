-- Add initial data to world database
--
-- We will add player information for default action buttons.
--

-- Select world database
USE `zp_world`;

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

-- Provide variables for actions, and buttons
SET @ACTION_TYPE_SPELL                          = 0;
SET @ACTION_TYPE_MACRO                          = 64;
SET @ACTION_TYPE_ITEM                           = 128;

-- Provide variables for items
SET @ITEM_TOUGH_JERKY                           = 117;
SET @ITEM_REFRESHING_SPRING_WATER               = 159;
SET @ITEM_DARNASSIAN_BLEU                       = 2070;
SET @ITEM_SHINY_RED_APPLE                       = 4536;
SET @ITEM_TOUGH_HUNK_OF_BREAD                   = 4540;
SET @ITEM_FOREST_MUSHROOM_CAP                   = 4604;

-- Provide variables for spells
SET @SPELL_AUTO_SHOT                            = 75;
SET @SPELL_HEROIC_STRIKE                        = 78;
SET @SPELL_FIREBALL                             = 133;
SET @SPELL_FROST_ARMOR                          = 168;
SET @SPELL_HEALING_WAVE                         = 331;
SET @SPELL_LIGHTNING_BOLT                       = 403;
SET @SPELL_SMITE                                = 585;
SET @SPELL_HOLY_LIGHT                           = 635;
SET @SPELL_SHADOW_BOLT                          = 686;
SET @SPELL_DEMON_SKIN                           = 687;
SET @SPELL_SINISTER_STRIKE                      = 1752;
SET @SPELL_LESSER_HEAL                          = 2050;
SET @SPELL_EVISCERATE                           = 2098;
SET @SPELL_THROW                                = 2764;
SET @SPELL_RAPTOR_STRIKE                        = 2973;
SET @SPELL_WRATH                                = 5176;
SET @SPELL_HEALING_TOUCH                        = 5185;
SET @SPELL_ATTACK                               = 6603;
SET @SPELL_SEAL_OF_RIGHTEOUSNESS                = 21084;

-- Provide variables for racial spells
SET @SPELL_FIND_TREASURE                        = 2481;
SET @SPELL_WAR_STOMP                            = 20549;
SET @SPELL_BLOOD_FURY                           = 20572;
SET @SPELL_CANNIBALIZE                          = 20577;
SET @SPELL_SHADOWMELD                           = 20580;
SET @SPELL_STONEFORM                            = 20594;
SET @SPELL_BERSERKING_MANA                      = 20554;
SET @SPELL_BERSERKING_RAGE                      = 26296;
SET @SPELL_BERSERKING_ENERGY                    = 26297;

-- Insert information for player characters and their default action buttons
INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_PALADIN, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PALADIN, 1,      @SPELL_SEAL_OF_RIGHTEOUSNESS,   @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PALADIN, 2,      @SPELL_HOLY_LIGHT,              @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PALADIN, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_HUMAN,       @CLASS_PALADIN, 11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_ROGUE,   11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_HUMAN,       @CLASS_PRIEST,  11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_HUMAN,       @CLASS_MAGE,    11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_HUMAN,       @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL),
    (@RACE_HUMAN,       @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_HUMAN,       @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_ORC,         @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARRIOR, 74,     @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_ORC,         @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_HUNTER,  4,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_ORC,         @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_ORC,         @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_ROGUE,   4,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_ORC,         @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_SHAMAN,  3,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_ORC,         @CLASS_SHAMAN,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_ORC,         @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARLOCK, 3,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL),
    (@RACE_ORC,         @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_ORC,         @CLASS_WARLOCK, 11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_DWARF,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_WARRIOR, 74,     @SPELL_STONEFORM,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_WARRIOR, 75,     @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_DWARF,       @CLASS_PALADIN, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PALADIN, 1,      @SPELL_SEAL_OF_RIGHTEOUSNESS,   @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PALADIN, 2,      @SPELL_HOLY_LIGHT,              @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PALADIN, 3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PALADIN, 4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PALADIN, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_DWARF,       @CLASS_PALADIN, 11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_DWARF,       @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_HUNTER,  3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_HUNTER,  4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_DWARF,       @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_DWARF,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   4,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   5,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_DWARF,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PRIEST,  3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PRIEST,  4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL),
    (@RACE_DWARF,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_DWARF,       @CLASS_PRIEST,  11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 74,     @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   1,      @SPELL_WRATH,                   @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   2,      @SPELL_HEALING_TOUCH,           @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL),
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_NIGHT_ELF,   @CLASS_DRUID,   11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_UNDEAD,      @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARRIOR, 74,     @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARRIOR, 83,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_UNDEAD,      @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_ROGUE,   4,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_ROGUE,   11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_UNDEAD,      @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_PRIEST,  3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_UNDEAD,      @CLASS_PRIEST,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_UNDEAD,      @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_MAGE,    3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_UNDEAD,      @CLASS_MAGE,    11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL),
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_UNDEAD,      @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TAUREN,      @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_WARRIOR, 74,     @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_WARRIOR, 83,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TAUREN,      @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_HUNTER,  3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TAUREN,      @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TAUREN,      @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_SHAMAN,  3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TAUREN,      @CLASS_SHAMAN,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TAUREN,      @CLASS_DRUID,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_DRUID,   1,      @SPELL_WRATH,                   @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_DRUID,   2,      @SPELL_HEALING_TOUCH,           @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_DRUID,   3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL),
    (@RACE_TAUREN,      @CLASS_DRUID,   10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TAUREN,      @CLASS_DRUID,   11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_GNOME,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_GNOME,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_GNOME,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_GNOME,       @CLASS_MAGE,    11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_GNOME,       @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL),
    (@RACE_GNOME,       @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_GNOME,       @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_WARRIOR, 74,     @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_WARRIOR, 75,     @SPELL_BERSERKING_RAGE,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_HUNTER,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TROLL,       @CLASS_HUNTER,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_ROGUE,   4,      @SPELL_BERSERKING_ENERGY,       @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_PRIEST,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TROLL,       @CLASS_PRIEST,  11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_SHAMAN,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TROLL,       @CLASS_SHAMAN,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);

INSERT INTO `playercreateinfo_action` VALUES
    (@RACE_TROLL,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_MAGE,    3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL),
    (@RACE_TROLL,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM),
    (@RACE_TROLL,       @CLASS_MAGE,    11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM);
