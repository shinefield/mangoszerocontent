-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- This update will populate the world database with initial data required to
-- run the server.
--

-- Provide variables for various item stats ----------------------------------
-- -> classes and subclasses -------------------------------------------------
SET @ITEM_CLASS_CONSUMABLE                      = 0;
SET @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE        = 0;

SET @ITEM_CLASS_CONTAINER                       = 1;
SET @ITEM_SUBCLASS_CONTAINER_BAG                = 0;
SET @ITEM_SUBCLASS_CONTAINER_SOUL_BAG           = 1;
SET @ITEM_SUBCLASS_CONTAINER_HERB_BAG           = 2;
SET @ITEM_SUBCLASS_CONTAINER_ENCHANTING_BAG     = 3;
SET @ITEM_SUBCLASS_CONTAINER_ENGINEERING_BAG    = 4;

SET @ITEM_CLASS_WEAPON                          = 2;
SET @ITEM_SUBCLASS_WEAPON_AXE_1H                = 0;
SET @ITEM_SUBCLASS_WEAPON_AXE_2H                = 1;
SET @ITEM_SUBCLASS_WEAPON_BOW                   = 2;
SET @ITEM_SUBCLASS_WEAPON_GUN                   = 3;
SET @ITEM_SUBCLASS_WEAPON_MACE_1H               = 4;
SET @ITEM_SUBCLASS_WEAPON_MACE_2H               = 5;
SET @ITEM_SUBCLASS_WEAPON_POLEARM               = 6;
SET @ITEM_SUBCLASS_WEAPON_SWORD_1H              = 7;
SET @ITEM_SUBCLASS_WEAPON_SWORD_2H              = 8;
SET @ITEM_SUBCLASS_WEAPON_STAFF                 = 10;
SET @ITEM_SUBCLASS_WEAPON_FIST_WEAPON           = 13;
SET @ITEM_SUBCLASS_WEAPON_MISCELLANEOUS         = 14;
SET @ITEM_SUBCLASS_WEAPON_DAGGER                = 15;
SET @ITEM_SUBCLASS_WEAPON_THROWN                = 16;
SET @ITEM_SUBCLASS_WEAPON_SPEAR                 = 17;
SET @ITEM_SUBCLASS_WEAPON_CROSSBOW              = 18;
SET @ITEM_SUBCLASS_WEAPON_WAND                  = 19;
SET @ITEM_SUBCLASS_WEAPON_FISHING_POLE          = 20;

SET @ITEM_CLASS_ARMOR                           = 4;
SET @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS          = 0;
SET @ITEM_SUBCLASS_ARMOR_CLOTH                  = 1;
SET @ITEM_SUBCLASS_ARMOR_LEATHER                = 2;
SET @ITEM_SUBCLASS_ARMOR_MAIL                   = 3;
SET @ITEM_SUBCLASS_ARMOR_PLATE                  = 4;
SET @ITEM_SUBCLASS_ARMOR_SHIELD                 = 6;
SET @ITEM_SUBCLASS_ARMOR_LIBRAM                 = 7;
SET @ITEM_SUBCLASS_ARMOR_IDOL                   = 8;
SET @ITEM_SUBCLASS_ARMOR_TOTEM                  = 9;

SET @ITEM_CLASS_REAGENT                         = 5;
SET @ITEM_SUBCLASS_REAGENT_REAGENT              = 0;

SET @ITEM_CLASS_PROJECTILE                      = 6;
SET @ITEM_SUBCLASS_PROJECTILE_ARROW             = 2;
SET @ITEM_SUBCLASS_PROJECTILE_BULLET            = 3;

SET @ITEM_CLASS_TRADE_GOODS                     = 7;
SET @ITEM_SUBCLASS_TRADE_GOODS_TRADE_GOODS      = 0;
SET @ITEM_SUBCLASS_TRADE_GOODS_PARTS            = 1;
SET @ITEM_SUBCLASS_TRADE_GOODS_EXPLOSIVES       = 2;
SET @ITEM_SUBCLASS_TRADE_GOODS_DEVICES          = 3;

SET @ITEM_CLASS_RECIPE                          = 9;
SET @ITEM_SUBCLASS_RECIPE_BOOK                  = 0;
SET @ITEM_SUBCLASS_RECIPE_LEATHERWORKING        = 1;
SET @ITEM_SUBCLASS_RECIPE_TAILORING             = 2;
SET @ITEM_SUBCLASS_RECIPE_ENGINEERING           = 3;
SET @ITEM_SUBCLASS_RECIPE_BLACKSMITHING         = 4;
SET @ITEM_SUBCLASS_RECIPE_COOKING               = 5;
SET @ITEM_SUBCLASS_RECIPE_ALCHEMY               = 6;
SET @ITEM_SUBCLASS_RECIPE_FIRST_AID             = 7;
SET @ITEM_SUBCLASS_RECIPE_ENCHANTING            = 8;
SET @ITEM_SUBCLASS_RECIPE_FISHING               = 9;

SET @ITEM_CLASS_QUIVER                          = 11;
SET @ITEM_SUBCLASS_QUIVER_QUIVER                = 2;
SET @ITEM_SUBCLASS_QUIVER_AMMO_POUCH            = 3;

SET @ITEM_CLASS_QUEST                           = 12;
SET @ITEM_SUBCLASS_QUEST_QUEST                  = 0;

SET @ITEM_CLASS_KEY                             = 13;
SET @ITEM_SUBCLASS_KEY_KEY                      = 0;
SET @ITEM_SUBCLASS_KEY_LOCKPICK                 = 1;

SET @ITEM_CLASS_MISCELLANEOUS                   = 15;
SET @ITEM_SUBCLASS_MISCELLANEOUS_JUNK           = 0;

-- -> item quality -----------------------------------------------------------
SET @ITEM_QUALITY_POOR                          = 0;        -- Colour: Grey
SET @ITEM_QUALITY_COMMON                        = 1;        -- Colour: White
SET @ITEM_QUALITY_UNCOMMON                      = 2;        -- Colour: Green
SET @ITEM_QUALITY_RARE                          = 3;        -- Colour: Blue
SET @ITEM_QUALITY_EPIC                          = 4;        -- Colour: Purple
SET @ITEM_QUALITY_LEGENDARY                     = 5;        -- Colour: Orange
SET @ITEM_QUALITY_ARTIFACT                      = 6;        -- Colour: Red

-- -> Flags ------------------------------------------------------------------
SET @ITEM_FLAG_NONE                             = 0;        -- No flag
SET @ITEM_FLAG_CONJURED                         = 2;        -- Items created by spells having a SPELL_EFFECT_CREATE_ITEM
SET @ITEM_FLAG_LOOTABLE                         = 4;        -- Used on items of any class != 1 (containers), allows for looting an item
SET @ITEM_FLAG_DEPRECATED                       = 16;       -- Item is deprecated and can not be equipped or used
SET @ITEM_FLAG_INDESTRUCTIBLE                   = 32;       -- Item can not be destroyed, except by using spell
SET @ITEM_FLAG_USABLE                           = 64;       -- Item can be used via right-click
SET @ITEM_FLAG_NO_EQUIP_COOLDOWN                = 128;      -- Item has no equip cooldown (and usually a _USABLE flag)
SET @ITEM_FLAG_WRAPPER                          = 512;      -- used or not used wrapper
SET @ITEM_FLAG_STACKABLE                        = 1024;     -- Item can be stacked
SET @ITEM_FLAG_PARTY_LOOT                       = 2048;     -- Item is party loot
SET @ITEM_FLAG_CHARTER                          = 8192;     -- Item is guild charter
SET @ITEM_FLAG_LETTER                           = 16384;    -- Item is readable letter
SET @ITEM_FLAG_PVP_REWARD                       = 32768;    -- Item is PvP reward
SET @ITEM_FLAG_UNK16                            = 65536;    -- Item is unique or allows for only one stack
SET @ITEM_FLAG_UNK17                            = 131072;   -- Item is related to world event

-- -> Extra flags ------------------------------------------------------------
SET @ITEM_EXTRA_FLAG_NONE                       = 0;        -- No flag
SET @ITEM_EXTRA_FLAG_NOT_CONSUMABLE             = 1;        -- Item is not consumable
SET @ITEM_EXTRA_FLAG_REALTIME_DURATION          = 2;        -- Item expires with real time instead of game time

-- -> Inventory types --------------------------------------------------------
SET @INVTYPE_NON_EQUIP                          = 0;
SET @INVTYPE_HEAD                               = 1;
SET @INVTYPE_NECK                               = 2;
SET @INVTYPE_SHOULDERS                          = 3;
SET @INVTYPE_BODY                               = 4;
SET @INVTYPE_CHEST                              = 5;
SET @INVTYPE_WAIST                              = 6;
SET @INVTYPE_LEGS                               = 7;
SET @INVTYPE_FEET                               = 8;
SET @INVTYPE_WRISTS                             = 9;
SET @INVTYPE_HANDS                              = 10;
SET @INVTYPE_FINGER                             = 11;
SET @INVTYPE_TRINKET                            = 12;
SET @INVTYPE_WEAPON                             = 13;
SET @INVTYPE_SHIELD                             = 14;
SET @INVTYPE_RANGED                             = 15;
SET @INVTYPE_CLOAK                              = 16;
SET @INVTYPE_2HWEAPON                           = 17;
SET @INVTYPE_BAG                                = 18;
SET @INVTYPE_TABARD                             = 19;
SET @INVTYPE_ROBE                               = 20;
SET @INVTYPE_WEAPONMAINHAND                     = 21;
SET @INVTYPE_WEAPONOFFHAND                      = 22;
SET @INVTYPE_HOLDABLE                           = 23;
SET @INVTYPE_AMMO                               = 24;
SET @INVTYPE_THROWN                             = 25;
SET @INVTYPE_RANGEDRIGHT                        = 26;
SET @INVTYPE_QUIVER                             = 27;
SET @INVTYPE_RELIC                              = 28;

-- -> Materials --------------------------------------------------------------
SET @MATERIAL_METAL                             = 1;
SET @MATERIAL_WOOD                              = 2;
SET @MATERIAL_LIQUID                            = 3;
SET @MATERIAL_JEWELRY                           = 4;
SET @MATERIAL_CHAIN                             = 5;
SET @MATERIAL_PLATE                             = 6;
SET @MATERIAL_CLOTH                             = 7;
SET @MATERIAL_LEATHER                           = 8;

-- -> Page materials ---------------------------------------------------------
SET @PAGEMAT_PARCHMENT                          = 1;
SET @PAGEMAT_STONE                              = 2;
SET @PAGEMAT_MARBLE                             = 3;
SET @PAGEMAT_SILVER                             = 4;
SET @PAGEMAT_BRONZE                             = 5;
SET @PAGEMAT_VALENTINE                          = 6;

-- -> Item bonding -----------------------------------------------------------
SET @BIND_NONE                                  = 0;
SET @BIND_WHEN_PICKED_UP                        = 1;
SET @BIND_WHEN_EQUIPPED                         = 2;
SET @BIND_WHEN_USE                              = 3;
SET @BIND_QUEST_ITEM                            = 4;

-- -> Spell trigger variations -----------------------------------------------
SET @SPELLTRIGGER_ON_USE                        = 0;
SET @SPELLTRIGGER_ON_EQUIP                      = 1;
SET @SPELLTRIGGER_CHANCE_ON_HIT                 = 2;
SET @SPELLTRIGGER_SOULSTONE                     = 4;
SET @SPELLTRIGGER_ON_NO_DELAY_USE               = 5;

-- -> Item stat modifier types -----------------------------------------------
SET @ITEM_MOD_NONE                              = 0;
SET @ITEM_MOD_HEALTH                            = 1;
SET @ITEM_MOD_AGILITY                           = 3;
SET @ITEM_MOD_STRENGTH                          = 4;
SET @ITEM_MOD_INTELLECT                         = 5;
SET @ITEM_MOD_SPIRIT                            = 6;
SET @ITEM_MOD_STAMINA                           = 7;

-- -> Sheath type ------------------------------------------------------------
SET @SHEATHETYPE_NONE                           = 0;
SET @SHEATHETYPE_MAINHAND                       = 1;
SET @SHEATHETYPE_OFFHAND                        = 2;
SET @SHEATHETYPE_LARGEWEAPONLEFT                = 3;
SET @SHEATHETYPE_LARGEWEAPONRIGHT               = 4;
SET @SHEATHETYPE_HIPWEAPONLEFT                  = 5;
SET @SHEATHETYPE_HIPWEAPONRIGHT                 = 6;
SET @SHEATHETYPE_SHIELD                         = 7;

-- Provide variables for gender ----------------------------------------------
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Provide variables for factions --------------------------------------------
SET @FACTION_ANY                                = 0;
SET @FACTION_ALLIANCE                           = 469;
SET @FACTION_HORDE                              = 67;

-- Provide variables for races, and classes ----------------------------------
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

-- Provide variables for actions, and buttons --------------------------------
SET @ACTION_TYPE_SPELL                          = 0;
SET @ACTION_TYPE_MACRO                          = 64;
SET @ACTION_TYPE_ITEM                           = 128;

-- Provide variables for warlock pets ----------------------------------------
SET @PLAYER_PET_IMP                             = 416;
SET @PLAYER_PET_FELHUNTER                       = 417;
SET @PLAYER_PET_VOIDWALKER                      = 1860;
SET @PLAYER_PET_SUCCUBUS                        = 1863;

-- Provide variables for items -----------------------------------------------
SET @ITEM_TOUGH_JERKY                           = 117;
SET @ITEM_REFRESHING_SPRING_WATER               = 159;
SET @ITEM_DARNASSIAN_BLEU                       = 2070;
SET @ITEM_SHINY_RED_APPLE                       = 4536;
SET @ITEM_TOUGH_HUNK_OF_BREAD                   = 4540;
SET @ITEM_FOREST_MUSHROOM_CAP                   = 4604;

-- Provide variables for spells ----------------------------------------------
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

-- Provide variables for active racial spells --------------------------------
SET @SPELL_FIND_TREASURE                        = 2481;  -- Racial: Dwarf
SET @SPELL_STONEFORM                            = 20594; -- Racial: Dwarf
SET @SPELL_WAR_STOMP                            = 20549; -- Racial: Tauren
SET @SPELL_BLOOD_FURY                           = 20572; -- Racial: Orc
SET @SPELL_CANNIBALIZE                          = 20577; -- Racial: Undead
SET @SPELL_SHADOWMELD                           = 20580; -- Racial: Night Elf
SET @SPELL_BERSERKING_MANA                      = 20554; -- Racial: Troll
SET @SPELL_BERSERKING_RAGE                      = 26296; -- Racial: Troll
SET @SPELL_BERSERKING_ENERGY                    = 26297; -- Racial: Troll

-- Provide variables for zones -----------------------------------------------
SET @ZONE_DUN_MOROGH                            = 1;
SET @ZONE_BADLANDS                              = 3;
SET @ZONE_BLASTED_LANDS                         = 4;
SET @ZONE_SWAMP_OF_SORROWS                      = 8;
SET @ZONE_DUSKWOOD                              = 10;
SET @ZONE_WETLANDS                              = 11;
SET @ZONE_ELWYNN_FOREST                         = 12;
SET @ZONE_DUROTAR                               = 14;
SET @ZONE_DUSTWALLOW_MARSH                      = 15;
SET @ZONE_AZSHARA                               = 16;
SET @ZONE_THE_BARRENS                           = 17;
SET @ZONE_PROGRAMMER_ISLE                       = 22;
SET @ZONE_BLACKROCK_MOUNTAIN                    = 25;
SET @ZONE_WESTERN_PLAGUELANDS                   = 28;
SET @ZONE_STRANGLETHORN_VALE                    = 33;
SET @ZONE_ALTERAC_MOUNTAINS                     = 36;
SET @ZONE_LOCH_MODAN                            = 38;
SET @ZONE_WESTFALL                              = 40;
SET @ZONE_DEADWIND_PASS                         = 41;
SET @ZONE_REDRIDGE_MOUNTAINS                    = 44;
SET @ZONE_ARATHI_HIGHLANDS                      = 45;
SET @ZONE_BURNING_STEPPES                       = 46;
SET @ZONE_THE_HINTERLANDS                       = 47;
SET @ZONE_SEARING_GORGE                         = 51;
SET @ZONE_TIRISFAL_GLADES                       = 85;
SET @ZONE_SILVERPINE_FOREST                     = 130;
SET @ZONE_EASTERN_PLAGUELANDS                   = 139;
SET @ZONE_TELDRASSIL                            = 141;
SET @ZONE_DARKSHORE                             = 148;
SET @ZONE_SHADOWFANG_KEEP                       = 209;
SET @ZONE_MULGORE                               = 215;
SET @ZONE_HILLSBRAD_FOOTHILLS                   = 267;
SET @ZONE_ASHENVALE                             = 331;
SET @ZONE_FERALAS                               = 357;
SET @ZONE_FELWOOD                               = 361;
SET @ZONE_THOUSAND_NEEDLES                      = 400;
SET @ZONE_DESOLACE                              = 405;
SET @ZONE_STONETALON_MOUNTAINS                  = 406;
SET @ZONE_TANARIS                               = 440;
SET @ZONE_UNGORO_CRATER                         = 490;
SET @ZONE_RAZORFEN_KRAUL                        = 491;
SET @ZONE_MOONGLADE                             = 493;
SET @ZONE_WINTERSPRING                          = 618;
SET @ZONE_THE_STOCKADE                          = 717;
SET @ZONE_WAILING_CAVERNS                       = 718;
SET @ZONE_BLACKFATHOM_DEEPS                     = 719;
SET @ZONE_GNOMEREGAN                            = 721;
SET @ZONE_RAZORFEN_DOWNS                        = 722;
SET @ZONE_SCARLET_MONASTERY                     = 796;
SET @ZONE_ZULFARRAK                             = 1176;
SET @ZONE_ULDAMAN                               = 1337;
SET @ZONE_SILITHUS                              = 1377;
SET @ZONE_SUNKEN_TEMPLE                         = 1417;
SET @ZONE_THE_TEMPLE_OF_ATALHAKKAR              = 1477;
SET @ZONE_STORMWIND_CITY                        = 1519;
SET @ZONE_THE_DEADMINES                         = 1581;
SET @ZONE_BLACKROCK_SPIRE                       = 1583;
SET @ZONE_BLACKROCK_DEPTHS                      = 1584;
SET @ZONE_ORGRIMMAR                             = 1637;
SET @ZONE_THUNDER_BLUFF                         = 1638;
SET @ZONE_DARNASSUS                             = 1657;
SET @ZONE_CAVERNS_OF_TIME                       = 1941;
SET @ZONE_ZULGURUB                              = 1977;
SET @ZONE_STRATHOLME                            = 2017;
SET @ZONE_SCHOLOMANCE                           = 2057;
SET @ZONE_MARAUDON                              = 2100;
SET @ZONE_ONYXIAS_LAIR                          = 2159;
SET @ZONE_DEEPRUN_TRAM                          = 2257;
SET @ZONE_RAGEFIRE_CHASM                        = 2437;
SET @ZONE_DIRE_MAUL                             = 2557;
SET @ZONE_ALTERAC_VALLEY                        = 2597;
SET @ZONE_BLACKWING_LAIR                        = 2677;
SET @ZONE_MOLTEN_CORE                           = 2717;
SET @ZONE_HALL_OF_LEGENDS                       = 2917;
SET @ZONE_CHAMPIONS_HALL                        = 2918;
SET @ZONE_WARSONG_GULCH                         = 3277;
SET @ZONE_ARATHI_BASIN                          = 3358;
SET @ZONE_AHNQIRAJ                              = 3428;
SET @ZONE_NAXXRAMAS                             = 3456;
SET @ZONE_GATES_OF_AHNQIRAJ                     = 3478;

-- Provide variables for NPC flags -------------------------------------------
SET @CREATURE_FLAG_NPC_NONE                     = 0;
SET @CREATURE_FLAG_NPC_GOSSIP                   = 1;
SET @CREATURE_FLAG_NPC_QUESTGIVER               = 2;
SET @CREATURE_FLAG_NPC_VENDOR                   = 4;
SET @CREATURE_FLAG_NPC_FLIGHTMASTER             = 8;
SET @CREATURE_FLAG_NPC_TRAINER                  = 16;
SET @CREATURE_FLAG_NPC_SPIRITHEALER             = 32;
SET @CREATURE_FLAG_NPC_SPIRITGUIDE              = 64;
SET @CREATURE_FLAG_NPC_INNKEEPER                = 128;
SET @CREATURE_FLAG_NPC_BANKER                   = 256;
SET @CREATURE_FLAG_NPC_PETITIONER               = 512;
SET @CREATURE_FLAG_NPC_TABARDDESIGNER           = 1024;
SET @CREATURE_FLAG_NPC_BATTLEMASTER             = 2048;
SET @CREATURE_FLAG_NPC_AUCTIONEER               = 4096;
SET @CREATURE_FLAG_NPC_STABLEMASTER             = 8192;
SET @CREATURE_FLAG_NPC_REPAIR                   = 16384;
SET @CREATURE_FLAG_NPC_OUTDOORPVP               = 536870912;

-- Provide variables for NPC rank --------------------------------------------
SET @CREATURE_RANK_NORMAL                       = 0; -- Default rank
SET @CREATURE_RANK_ELITE                        = 1; -- Higher damage, more health, better loot
SET @CREATURE_RANK_RARE_ELITE                   = 2; -- Rare mob but with elite damage and health
SET @CREATURE_RANK_WORLD_BOSS                   = 3; -- Highest rank, best loot, longest respawn time
SET @CREATURE_RANK_RARE                         = 4; -- Somewhat better loot, longer respawn time

-- Provide variables for spell schools ---------------------------------------
SET @SPELL_SCHOOL_NORMAL                        = 0;
SET @SPELL_SCHOOL_HOLY                          = 1;
SET @SPELL_SCHOOL_FIRE                          = 2;
SET @SPELL_SCHOOL_NATURE                        = 3;
SET @SPELL_SCHOOL_FROST                         = 4;
SET @SPELL_SCHOOL_SHADOW                        = 5;
SET @SPELL_SCHOOL_ARCANE                        = 6;

-- Provide variables for NPC classes -----------------------------------------
SET @CREATURE_CLASS_WARRIOR                     = 1;
SET @CREATURE_CLASS_PALADIN                     = 2;
SET @CREATURE_CLASS_ROGUE                       = 4;
SET @CREATURE_CLASS_MAGE                        = 8;

-- Provide variables for dynamic flags ---------------------------------------
SET @CREATURE_FLAG_DYN_NONE                         = 0;
SET @CREATURE_FLAG_DYN_LOOTABLE                     = 1;
SET @CREATURE_FLAG_DYN_TRACK_UNIT                   = 2;
SET @CREATURE_FLAG_DYN_OTHER_TAGGER                 = 4;
SET @CREATURE_FLAG_DYN_ROOTED                       = 8;
SET @CREATURE_FLAG_DYN_SPECIALINFO                  = 16;
SET @CREATURE_FLAG_DYN_DEAD                         = 32;
SET @CREATURE_FLAG_DYN_TAPPED_BY_ALL_THREAT_LIST    = 64;

-- Provide variables for creature type ---------------------------------------
SET @CREATURE_TYPE_NONE                         = 0;
SET @CREATURE_TYPE_BEAST                        = 1;
SET @CREATURE_TYPE_DRAGONKIN                    = 2;
SET @CREATURE_TYPE_DEMON                        = 3;
SET @CREATURE_TYPE_ELEMENTAL                    = 4;
SET @CREATURE_TYPE_GIANT                        = 5;
SET @CREATURE_TYPE_UNDEAD                       = 6;
SET @CREATURE_TYPE_HUMANOID                     = 7;
SET @CREATURE_TYPE_CRITTER                      = 8;
SET @CREATURE_TYPE_MECHANICAL                   = 9;
SET @CREATURE_TYPE_NOT_SPECIFIED                = 10;
SET @CREATURE_TYPE_TOTEM                        = 11;

-- Provide variables for creature of type 1 (Beast) --------------------------
SET @CREATURE_BEAST_FAMILY_NONE                 = 0;
SET @CREATURE_BEAST_FAMILY_WOLF                 = 1;
SET @CREATURE_BEAST_FAMILY_CAT                  = 2;
SET @CREATURE_BEAST_FAMILY_SPIDER               = 3;
SET @CREATURE_BEAST_FAMILY_BEAR                 = 4;
SET @CREATURE_BEAST_FAMILY_BOAR                 = 5;
SET @CREATURE_BEAST_FAMILY_CROCOLISK            = 6;
SET @CREATURE_BEAST_FAMILY_CARRION_BIRD         = 7;
SET @CREATURE_BEAST_FAMILY_CRAB                 = 8;
SET @CREATURE_BEAST_FAMILY_GORILLA              = 9;
SET @CREATURE_BEAST_FAMILY_RAPTOR               = 10;
SET @CREATURE_BEAST_FAMILY_TALLSTRIDER          = 11;
SET @CREATURE_BEAST_FAMILY_FELHUNTER            = 12;
SET @CREATURE_BEAST_FAMILY_VOIDWALKER           = 13;
SET @CREATURE_BEAST_FAMILY_SUCCUBUS             = 14;
SET @CREATURE_BEAST_FAMILY_DOOMGUARD            = 15;
SET @CREATURE_BEAST_FAMILY_SCORPID              = 16;
SET @CREATURE_BEAST_FAMILY_TURTLE               = 17;
SET @CREATURE_BEAST_FAMILY_IMP                  = 18;
SET @CREATURE_BEAST_FAMILY_BAT                  = 19;
SET @CREATURE_BEAST_FAMILY_HYENA                = 20;
SET @CREATURE_BEAST_FAMILY_BIRD_OF_PREY         = 21;
SET @CREATURE_BEAST_FAMILY_WIND_SERPENT         = 22;
SET @CREATURE_BEAST_FAMILY_REMOTE_CONTROL       = 23;
SET @CREATURE_BEAST_FAMILY_FELGUARD             = 24;
SET @CREATURE_BEAST_FAMILY_DRAGONHAWK           = 25;
SET @CREATURE_BEAST_FAMILY_RAVAGER              = 26;
SET @CREATURE_BEAST_FAMILY_WARP_STALKER         = 27;
SET @CREATURE_BEAST_FAMILY_SPOREBAT             = 28;
SET @CREATURE_BEAST_FAMILY_NETHER_RAY           = 29;
SET @CREATURE_BEAST_FAMILY_SERPENT              = 30;
SET @CREATURE_BEAST_FAMILY_MOTH                 = 31;
SET @CREATURE_BEAST_FAMILY_CHIMAERA             = 32;
SET @CREATURE_BEAST_FAMILY_DEVILSAUR            = 33;
SET @CREATURE_BEAST_FAMILY_GHOUL                = 34;
SET @CREATURE_BEAST_FAMILY_SILITHID             = 35;
SET @CREATURE_BEAST_FAMILY_WORM                 = 36;
SET @CREATURE_BEAST_FAMILY_RHINO                = 37;
SET @CREATURE_BEAST_FAMILY_WASP                 = 38;
SET @CREATURE_BEAST_FAMILY_CORE_HOUND           = 39;
SET @CREATURE_BEAST_FAMILY_SPIRIT_BEAST         = 40;

-- Provide variables for creature type flags ---------------------------------
SET @CREATURE_TYPE_FLAG_NONE                    = 0;
SET @CREATURE_TYPE_FLAG_TAMEABLE                = 1;
SET @CREATURE_TYPE_FLAG_NOT_ATTACKABLE          = 2;
SET @CREATURE_TYPE_FLAG_ATTACKABLE              = 8;
SET @CREATURE_TYPE_FLAG_NOT_ATTACKABLE_2        = 128;
SET @CREATURE_TYPE_FLAG_NON_PVP_PLAYER          = 136;
SET @CREATURE_TYPE_FLAG_HERBABLE                = 256;
SET @CREATURE_TYPE_FLAG_MINEABLE                = 512;
SET @CREATURE_TYPE_FLAG_ANIMATION_FROZEN        = 1024;
SET @CREATURE_TYPE_FLAG_WAR_PLAYER              = 4096;

-- Provide variables for creatures flagged as trainer ------------------------
SET @CREATURE_TRAINER_TYPE_CLASS                = 0;
SET @CREATURE_TRAINER_TYPE_MOUNTS               = 1;
SET @CREATURE_TRAINER_TYPE_TRADESKILLS          = 2;
SET @CREATURE_TRAINER_TYPE_PETS                 = 3;

-- Provide variables for creature movement types -----------------------------
SET @CREATURE_MOVEMENT_IDLE                     = 0;
SET @CREATURE_MOVEMENT_RANDOM                   = 1;
SET @CREATURE_MOVEMENT_WAYPOINT                 = 2;

-- Provide variables for creature inhabit types ------------------------------
SET @CREATURE_INHABIT_GROUND                    = 1;
SET @CREATURE_INHABIT_WATER                     = 2;
SET @CREATURE_INHABIT_GROUND_WATER              = @CREATURE_INHABIT_GROUND | @CREATURE_INHABIT_WATER;
SET @CREATURE_INHABIT_AIR                       = 4;
SET @CREATURE_INHABIT_ANY                       = @CREATURE_INHABIT_GROUND_WATER | @CREATURE_INHABIT_AIR;

-- Provide variables for creature immunity masks ----------------------------
SET @CREATURE_IMMUNITY_NONE                     = 0;
SET @CREATURE_IMMUNITY_CHARM                    = 1;
SET @CREATURE_IMMUNITY_CONFUSED                 = 2;
SET @CREATURE_IMMUNITY_DISARM                   = 4;
SET @CREATURE_IMMUNITY_DISTRACT                 = 8;
SET @CREATURE_IMMUNITY_FEAR                     = 16;
SET @CREATURE_IMMUNITY_FUMBLE                   = 32;
SET @CREATURE_IMMUNITY_ROOT                     = 64;
SET @CREATURE_IMMUNITY_PACIFY                   = 128;
SET @CREATURE_IMMUNITY_SILENCE                  = 256;
SET @CREATURE_IMMUNITY_SLEEP                    = 512;
SET @CREATURE_IMMUNITY_SNARE                    = 1024;
SET @CREATURE_IMMUNITY_STUN                     = 2048;
SET @CREATURE_IMMUNITY_FREEZE                   = 4096;
SET @CREATURE_IMMUNITY_KNOCKOUT                 = 8192;
SET @CREATURE_IMMUNITY_BLEED                    = 16384;
SET @CREATURE_IMMUNITY_BANDAGE                  = 32768;
SET @CREATURE_IMMUNITY_POLYMORPH                = 65536;
SET @CREATURE_IMMUNITY_BANISH                   = 131072;
SET @CREATURE_IMMUNITY_SHIELD                   = 262144;
SET @CREATURE_IMMUNITY_SHACKLE                  = 524288;
SET @CREATURE_IMMUNITY_MOUNT                    = 1048576;
SET @CREATURE_IMMUNITY_PERSUADE                 = 2097152;
SET @CREATURE_IMMUNITY_TURN                     = 4194304;
SET @CREATURE_IMMUNITY_HORROR                   = 8388608;
SET @CREATURE_IMMUNITY_INVULNERABILITY          = 16777216;
SET @CREATURE_IMMUNITY_INTERRUPT                = 33554432;
SET @CREATURE_IMMUNITY_DAZE                     = 67108864;
SET @CREATURE_IMMUNITY_DISCOVERY                = 134217728;
SET @CREATURE_IMMUNITY_IMMUNE_SHIELD            = 268435456;
SET @CREATURE_IMMUNITY_SAPPED                   = 536870912;

-- Provide variables for creature extra flags --------------------------------
SET @CREATURE_FLAG_EXTRA_NONE                   = 0;
SET @CREATURE_FLAG_EXTRA_INSTANCE_BIND          = 1;
SET @CREATURE_FLAG_EXTRA_CIVILIAN               = 2;
SET @CREATURE_FLAG_EXTRA_NO_PARRY               = 4;
SET @CREATURE_FLAG_EXTRA_NO_PARRY_HASTEN        = 8;
SET @CREATURE_FLAG_EXTRA_NO_BLOCK               = 16;
SET @CREATURE_FLAG_EXTRA_NO_CRUSH               = 32;
SET @CREATURE_FLAG_EXTRA_NO_XP_AT_KILL          = 64;
SET @CREATURE_FLAG_EXTRA_INVISIBLE              = 128;
SET @CREATURE_FLAG_EXTRA_NOT_TAUNTABLE          = 256;
SET @CREATURE_FLAG_EXTRA_AGGRO_ZONE             = 512;
SET @CREATURE_FLAG_EXTRA_GUARD                  = 1024;
SET @CREATURE_FLAG_EXTRA_NO_TALKTO_CREDIT       = 2048;

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_DOOR                               = 0;
SET @GO_TYPE_BUTTON                             = 1;
SET @GO_TYPE_QUESTGIVER                         = 2;
SET @GO_TYPE_CHEST                              = 3;
SET @GO_TYPE_BINDER                             = 4;
SET @GO_TYPE_GENERIC                            = 5;
SET @GO_TYPE_TRAP                               = 6;
SET @GO_TYPE_CHAIR                              = 7;
SET @GO_TYPE_SPELL_FOCUS                        = 8;
SET @GO_TYPE_TEXT                               = 9;
SET @GO_TYPE_GOOBER                             = 10;
SET @GO_TYPE_TRANSPORT                          = 11;
SET @GO_TYPE_AREA_DAMAGE                        = 12;
SET @GO_TYPE_CAMERA                             = 13;
SET @GO_TYPE_MAP_OBJECT                         = 14;
SET @GO_TYPE_MO_TRANSPORT                       = 15;
SET @GO_TYPE_DUEL_ARBITER                       = 16;
SET @GO_TYPE_FISHING_NODE                       = 17;
SET @GO_TYPE_SUMMONING_RITUAL                   = 18;
SET @GO_TYPE_MAILBOX                            = 19;
SET @GO_TYPE_AUCTION_HOUSE                      = 20;
SET @GO_TYPE_GUARD_POST                         = 21;
SET @GO_TYPE_SPELL_CASTER                       = 22;
SET @GO_TYPE_MEETING_STONE                      = 23;
SET @GO_TYPE_FLAG_STAND                         = 24;
SET @GO_TYPE_FISHING_HOLE                       = 25;
SET @GO_TYPE_FLAG_DROP                          = 26;
SET @GO_TYPE_MINI_GAME                          = 27;
SET @GO_TYPE_LOTTERY_KIOSK                      = 28;
SET @GO_TYPE_CAPTURE_POINT                      = 29;
SET @GO_TYPE_AURA_GENERATOR                     = 30;

-- -> Game object flags ------------------------------------------------------
SET @GO_FLAG_IN_USE                             = 1;
SET @GO_FLAG_LOCKED                             = 2;
SET @GO_FLAG_INTERACT_COND                      = 4;
SET @GO_FLAG_TRANSPORT                          = 8;
SET @GO_FLAG_NO_INTERACT                        = 16;
SET @GO_FLAG_NODESPAWN                          = 32;
SET @GO_FLAG_TRIGGERED                          = 64;

-- Insert world database version ---------------------------------------------
INSERT INTO `db_version`
VALUES
    ('mangos-zero - version 0.1.2 (development)',
     'mangos-zero Artificial Creature Intelligence - version 0.1.2 (development)',
     NULL)
;

-- Insert internal world server string into `mangos_string` table ------------
INSERT INTO `mangos_string`
    (`entry`, `content_default`)
VALUES
     (1,    'You should select a character or a creature.')
    ,(2,    'You should select a creature.')
    ,(3,    '|cffff0000[System Message]: %s|r')
    ,(4,    '|cffff0000[Event Message]: %s|r')
    ,(5,    'There is no help for this command')
    ,(6,    'There is no such command')
    ,(7,    'There is no such subcommand')
    ,(8,    'Command %s has subcommands:')
    ,(9,    'Commands available to you:')
    ,(10,   'Incorrect syntax.')
    ,(11,   'Your account level is: %i')
    ,(12,   'Players online: %u (max: %u), players queued: %u (max: %u)')
    ,(13,   'Server uptime: %s')
    ,(14,   'Player saved.')
    ,(15,   'All players saved.')
    ,(16,   'The following gamemasters are currently active:')
    ,(17,   'There are no gamemasters currently active.')
    ,(18,   'Can not do that while flying.')
    ,(19,   'Can not do that in battlegrounds.')
    ,(20,   'Target is flying, you can\'t do that.')
    ,(21,   '%s is flying. Command failed.')
    ,(22,   'You are not mounted, you can\'t dismount.')
    ,(23,   'Can not do that while fighting.')
    ,(24,   'You used it recently.')
    ,(25,   'Password not changed (unknown error)!')
    ,(26,   'The password was changed')
    ,(27,   'The old password is wrong')
    ,(28,   'Your account is now locked.')
    ,(29,   'Your account is now unlocked.')
    ,(30,   ', rank ')
    ,(31,   ' [known]')
    ,(32,   ' [learn]')
    ,(33,   ' [passive]')
    ,(34,   ' [talent]')
    ,(35,   ' [active]')
    ,(36,   ' [complete]')
    ,(37,   ' (offline)')
    ,(38,   'on')
    ,(39,   'off')
    ,(40,   'You are: %s')
    ,(41,   'visible')
    ,(42,   'invisible')
    ,(43,   'done')
    ,(44,   'You')
    ,(45,   ' <unknown> ')
    ,(46,   '<error>')
    ,(47,   '<non-existing character>')
    ,(48,   'UNKNOWN')
    ,(49,   'You must be at least level %u to enter.')
    ,(50,   'You must be at least level %u and have item %s to enter.')
    ,(51,   'Hello! Ready for some training?')
    ,(52,   'Invalid item count (%u) for item %u')
    ,(53,   'Mail can\'t have more %u item stacks')
    ,(54,   'The new passwords do not match')
    ,(55,   'Your password can\'t be longer than 16 characters (client limit), password not changed!')
    ,(56,   'Current Message of the day: %s')
    ,(57,   'Using World DB: %s')
    ,(58,   'Using script library: %s')
    ,(59,   'Using creature EventAI: %s')
    ,(61,   'Username: ')
    ,(62,   'Password: ')
    ,(63,   'Accepts whispers')
    ,(64,   'Doesn\'t accept whispers')
    ,(65,   'Using script library: <Unknown Script Library>')
    ,(66,   'Using script library: <No Script Library Loaded>')
    ,(100,  'Global notify: ')
    ,(101,  'Map: %u (%s) Zone: %u (%s) Area: %u (%s)X: %f Y: %f Z: %f Orientation: %fgrid[%u,%u]cell[%u,%u] InstanceID: %u ZoneX: %f ZoneY: %fGroundZ: %f FloorZ: %f Have height data (Map: %u VMap: %u)')
    ,(102,  '%s is already being teleported.')
    ,(103,  'You can summon a player to your instance only if he is in your party with you as leader.')
    ,(104,  'You can not go to the player\'s instance because you are in a party now.')
    ,(105,  'You can go to the player\'s instance while not being in his party only if your GM mode is on.')
    ,(106,  'You can not go to player %s from instance to instance.')
    ,(107,  'You can not summon player %s from instance to instance.')
    ,(108,  'You are summoning %s%s.')
    ,(109,  'You are being summoned by %s.')
    ,(110,  'You are teleporting %s%s to %s.')
    ,(111,  'You are being teleported by %s.')
    ,(112,  'Player (%s) does not exist.')
    ,(113,  'Appearing at %s\'s location.')
    ,(114,  '%s is appearing at your location.')
    ,(115,  'Incorrect values.')
    ,(116,  'No character selected.')
    ,(117,  '%s is not in a group.')
    ,(118,  'You changed HP of %s to %i/%i.')
    ,(119,  '%s changed your HP to %i/%i.')
    ,(120,  'You changed MANA of %s to %i/%i.')
    ,(121,  '%s changed your MANA to %i/%i.')
    ,(122,  'You changed ENERGY of %s to %i/%i.')
    ,(123,  '%s changed your ENERGY to %i/%i.')
    ,(124,  'Current energy: %u')
    ,(125,  'You changed rage of %s to %i/%i.')
    ,(126,  '%s changed your rage to %i/%i.')
    ,(127,  'You changed level of %s to %i.')
    ,(128,  'GUID %i, faction is %i, flags is %i, npcflag is %i, DY flag is %i')
    ,(129,  'Wrong faction: %u (not found in factiontemplate.dbc).')
    ,(130,  'You changed GUID=%i \'s Faction to %i, flags to %i, npcflag to %i, dyflag to %i.')
    ,(131,  'You changed the %s spellmod %u to value %i for spell with family bit %u for %s.')
    ,(132,  '%s changed your spellmod %u to value %i for spell with family bit %u.')
    ,(133,  '%s has access to all taxi nodes now (until logout).')
    ,(134,  '%s has no more access to all taxi nodes now (only visited accessible).')
    ,(135,  '%s has given you access to all taxi nodes (until logout).')
    ,(136,  '%s has removed access to all taxi nodes (only visited still accessible).')
    ,(137,  'You set all speeds to %2.2f from normal of %s.')
    ,(138,  '%s set all your speeds to %2.2f from normal.')
    ,(139,  'You set the speed to %2.2f from normal of %s.')
    ,(140,  '%s set your speed to %2.2f from normal.')
    ,(141,  'You set the swim speed to %2.2f from normal of %s.')
    ,(142,  '%s set your swim speed to %2.2f from normal.')
    ,(143,  'You set the backwards run speed to %2.2f from normal of %s.')
    ,(144,  '%s set your backwards run speed to %2.2f from normal.')
    ,(147,  'You set the size %2.2f of %s.')
    ,(148,  '%s set your size to %2.2f.')
    ,(149,  'There is no such mount.')
    ,(150,  'You give a mount to %s.')
    ,(151,  '%s gave you a mount.')
    ,(152,  'USER1: %i, ADD: %i, DIF: %i')
    ,(153,  'You take all copper of %s.')
    ,(154,  '%s took you all of your copper.')
    ,(155,  'You take %i copper from %s.')
    ,(156,  '%s took %i copper from you.')
    ,(157,  'You give %i copper to %s.')
    ,(158,  '%s gave you %i copper.')
    ,(159,  'You hear sound %u.')
    ,(160,  'USER2: %i, ADD: %i, RESULT: %i')
    ,(161,  'Removed bit %i in field %i.')
    ,(162,  'Set bit %i in field %i.')
    ,(163,  'Teleport location table is empty!')
    ,(164,  'Teleport location not found!')
    ,(165,  'Requires search parameter.')
    ,(166,  'There are no teleport locations matching your request.')
    ,(168,  'Locations found are: %s')
    ,(169,  'Mail sent to %s')
    ,(170,  'You try to hear sound %u but it doesn\'t exist.')
    ,(171,  'You can\'t teleport self to self!')
    ,(172,  'server console command')
    ,(175,  'Liquid level: %f, ground: %f, type flags %u, status: %d.')
    ,(200,  'No selection.')
    ,(201,  'Object GUID is: %s')
    ,(202,  'The name was too long by %i characters.')
    ,(203,  'Error, name can only contain characters A-Z and a-z.')
    ,(204,  'The subname was too long by %i characters.')
    ,(205,  'Not yet implemented')
    ,(206,  'Item \'%i\' \'%s\' added to list with maxcount \'%i\' and incrtime \'%i\'')
    ,(207,  'Item \'%i\' not found in database.')
    ,(208,  'Item \'%i\' \'%s\' deleted from vendor list')
    ,(209,  'Item \'%i\' not found in vendor list.')
    ,(210,  'Item \'%i\' already in vendor list.')
    ,(211,  'Spells of %s reset.')
    ,(212,  'Spells of %s will reset at next login.')
    ,(213,  'Talents of %s reset.')
    ,(214,  'Talents of %s will reset at next login.')
    ,(215,  'Your spells have been reset.')
    ,(216,  'Your talents have been reset.')
    ,(217,  'Unknown case \'%s\' for .resetall command. Type full correct case name.')
    ,(218,  'Spells will reset for all players at login. Strongly recommend re-login!')
    ,(219,  'Talents will reset for all players at login. Strongly recommend re-login!')
    ,(220,  'Creature (GUID: %u) No waypoint found.')
    ,(221,  'Creature (GUID: %u) Last waypoint not found.')
    ,(222,  'Creature (GUID: %u) No waypoint found - used \'wpguid\'. Now trying to find it by its position...')
    ,(223,  'Creature (GUID: %u) No waypoints found - This is a database problem (single float).')
    ,(224,  'Selected creature is ignored - provided GUID is used')
    ,(225,  'Creature (GUID: %u) not found')
    ,(226,  'You must select a visual waypoint.')
    ,(227,  'No visual waypoints found')
    ,(228,  'Could not create visual waypoint with creatureID: %d')
    ,(229,  'All visual waypoints removed')
    ,(230,  'Could not create waypoint-creature with ID: %d')
    ,(231,  'No GUID provided.')
    ,(232,  'No waypoint number provided.')
    ,(233,  'Argument required for \'%s\'.')
    ,(234,  'Waypoint %i added to GUID: %d')
    ,(235,  'Waypoint %d added.')
    ,(236,  'Waypoint changed.')
    ,(237,  'Waypoint %s modified.')
    ,(238,  'Waypoint export successful.')
    ,(239,  'No waypoints found inside the database.')
    ,(240,  'File imported.')
    ,(241,  'Waypoint removed.')
    ,(242,  'Warning: Could not delete waypoint from the world with ID: %d')
    ,(243,  'This happens if the waypoint is too far away from your char.')
    ,(244,  'The waypoint is deleted from the database, but not from the world here.')
    ,(245,  'They will disappear after a server restart.')
    ,(246,  'Waypoint %d: Info for creature: %s, GUID: %d')
    ,(247,  'Waittime: %d')
    ,(248,  'Model %d: %d')
    ,(249,  'Emote: %d')
    ,(250,  'Spell: %d')
    ,(251,  'Text%d (ID: %i): %s')
    ,(252,  'AIScript: %s')
    ,(253,  'Forced rename for player %s will be requested at next login.')
    ,(254,  'Forced rename for player %s (GUID #%u) will be requested at next login.')
    ,(255,  'Waypoint-Creature (GUID: %u) Not found')
    ,(256,  'Could not find NPC...')
    ,(257,  'Creature movement type set to \'%s\', waypoints removed (if any).')
    ,(258,  'Creature movement type set to \'%s\', waypoints were not removed.')
    ,(259,  'Incorrect value, use on or off')
    ,(260,  'Value saved.')
    ,(261,  'Value saved, you may need to rejoin or clean your client cache.')
    ,(262,  'Areatrigger ID %u not found!')
    ,(263,  'Target map or coordinates is invalid (X: %f Y: %f MapId: %u)')
    ,(264,  'Zone coordinates is invalid (X: %f Y: %f AreaId: %u)')
    ,(265,  'Zone %u (%s) is part of instanceable map %u (%s)')
    ,(266,  'Nothing found!')
    ,(267,  'Object not found!')
    ,(268,  'Creature not found!')
    ,(270,  'Creature removed')
    ,(271,  'Creature moved.')
    ,(272,  'Creature (GUID:%u) must be on the same map as player!')
    ,(273,  'Game Object (GUID: %u) not found')
    ,(274,  'Game Object (GUID: %u) has references in not found owner %s GO list, can\'t be deleted.')
    ,(275,  'Game Object (GUID: %u) removed')
    ,(276,  'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) turned')
    ,(277,  'Game Object |cffffffff|Hgameobject:%d|h[%s]|h|r (GUID: %u) moved')
    ,(278,  'You must select a vendor')
    ,(279,  'You must send id for item')
    ,(280,  'Vendor has too many items (max 128)')
    ,(281,  'You can\'t kick self, logout instead')
    ,(282,  'Player %s kicked.')
    ,(284,  'Accepting Whisper: %s')
    ,(285,  'Accepting Whisper: ON')
    ,(286,  'Accepting Whisper: OFF')
    ,(287,  'Creature (GUID: %u) not found')
    ,(288,  'Tickets count: %i show new tickets: %s')
    ,(289,  'New ticket from %s')
    ,(290,  'Ticket of %s (Last updated: %s):%s ')
    ,(291,  'New ticket show: ON')
    ,(292,  'New ticket show: OFF')
    ,(293,  'Ticket %i doesn\'t exist')
    ,(294,  'All tickets deleted.')
    ,(295,  'Character %s ticket deleted.')
    ,(296,  'Ticket deleted.')
    ,(297,  'Spawn distance changed to: %f')
    ,(298,  'Spawn time changed to: %i')
    ,(299,  'The %s field of %s was set to %u')
    ,(300,  'Your chat has been disabled for %u minutes.')
    ,(301,  'You have disabled %s\'s chat for %u minutes.')
    ,(302,  'Player\'s chat is already enabled.')
    ,(303,  'Your chat has been enabled.')
    ,(304,  'You have enabled %s\'s chat.')
    ,(305,  'Faction %s (%u) reputation of %s was set to %5d!')
    ,(307,  'No faction found!')
    ,(308,  'Faction %i unknown!')
    ,(309,  'Invalid parameter %s')
    ,(310,  'delta must be between 0 and %d (inclusive)')
    ,(311,  '%d - |cffffffff|Hfaction:%d|h[%s]|h|r')
    ,(312,  ' [visible]')
    ,(313,  ' [at war]')
    ,(314,  ' [peace forced]')
    ,(315,  ' [hidden]')
    ,(316,  ' [invisible forced]')
    ,(317,  ' [inactive]')
    ,(318,  'Hated')
    ,(319,  'Hostile')
    ,(320,  'Unfriendly')
    ,(321,  'Neutral')
    ,(322,  'Friendly')
    ,(323,  'Honored')
    ,(324,  'Revered')
    ,(325,  'Exalted')
    ,(326,  'Faction %s (%u) can\'not have reputation.')
    ,(327,  ' [no reputation]')
    ,(328,  'Characters at account %s (Id: %u)')
    ,(329,  '  %s (GUID %u)')
    ,(330,  'No players found!')
    ,(331,  'Extended item cost %u not exist')
    ,(332,  'GM mode is ON')
    ,(333,  'GM mode is OFF')
    ,(334,  'GM Chat Badge is ON')
    ,(335,  'GM Chat Badge is OFF')
    ,(336,  'You repair all %s\'s items.')
    ,(337,  'All your items repaired by %s.')
    ,(338,  'You set waterwalk mode %s for %s.')
    ,(339,  'Your waterwalk mode %s by %s.')
    ,(340,  '%s is now following you.')
    ,(341,  '%s is not following you.')
    ,(342,  '%s is now not following you.')
    ,(343,  'Creature (Entry: %u) can not be tamed.')
    ,(344,  'You already have pet.')
    ,(347,  'TaxiNode ID %u not found!')
    ,(348,  'Game Object (Entry: %u) have invalid data and can\'t be spawned')
    ,(357,  'Areatrigger %u not has target coordinates')
    ,(358,  'No areatriggers found!')
    ,(359,  '%s|cffffffff|Hareatrigger_target:%u|h[Trigger target %u]|h|r Map %u X:%f Y:%f Z:%f%s')
    ,(360,  '%s[Trigger target %u] Map %u X:%f Y:%f Z:%f')
    ,(361,  '|cffffffff|Hareatrigger:%u|h[Trigger %u]|h|r Map %u X:%f Y:%f Z:%f%s%s%s')
    ,(362,  '[Trigger %u] Map %u X:%f Y:%f Z:%f%s%s')
    ,(363,  ' (Dist %f)')
    ,(364,  ' [Tavern]')
    ,(365,  ' [Quest]')
    ,(366,  'Explore quest:')
    ,(367,  'Required level %u')
    ,(368,  'Required Items:')
    ,(369,  'Required quest:')
    ,(373,  'Response:\n%s ')
    ,(374,  'Tickets count: %i\n')
    ,(375,  'Player %s not have tickets.')
    ,(376,  '%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u')
    ,(377,  'No pools found for map \'%s\' (Id:%u)')
    ,(378,  'You can\'t use this command at non-instanceable map \'%s\' (Id:%u). Use .lookup pool command instead.')
    ,(379,  'You can\'t use this command without args at non-instanceable map \'%s\' (Id:%u).')
    ,(380,  '%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r Chance:%f %s')
    ,(381,  '%d%s - [%s] X:%f Y:%f Z:%f MapId:%d Chance:%f %s')
    ,(382,  '%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r %s')
    ,(383,  '%d%s - [%s] X:%f Y:%f Z:%f MapId:%d %s')
    ,(384,  '%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r Chance:%f %s')
    ,(385,  '%d%s - [%s] X:%f Y:%f Z:%f MapId:%d Chance:%f %s')
    ,(386,  '%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r %s')
    ,(387,  '%d%s - [%s] X:%f Y:%f Z:%f MapId:%d %s')
    ,(388,  'Creatures with explicitly chance:')
    ,(389,  'Creatures with equal chance:')
    ,(390,  'Gameobjects with explicitly chance:')
    ,(391,  'Gameobjects with equal chance:')
    ,(392,  'Pool %u - Mother pool: %u |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u')
    ,(393,  'Pool %u - Mother pool: %u [%s] AutoSpawn: %u MaxLimit: %u')
    ,(394,  'Pool %u - Mother pool: none AutoSpawn: %u MaxLimit: %u')
    ,(395,  'No pools found')
    ,(396,  '%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u')
    ,(397,  'Pools with explicitly chance:')
    ,(398,  'Pools with equal chance:')
    ,(399,  '%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u Chance: %f %s')
    ,(400,  '|cffff0000[System Message]:|rScripts reloaded')
    ,(401,  'You change security level of account %s to %i.')
    ,(402,  '%s changed your security level to %i.')
    ,(403,  'You have low security level for this.')
    ,(404,  'Creature movement disabled.')
    ,(405,  'Creature movement enabled.')
    ,(406,  'Weather can\'t be changed for this zone.')
    ,(407,  'Weather system disabled at server.')
    ,(408,  '%s is banned for %s. Reason: %s.')
    ,(409,  '%s is banned permanently for %s.')
    ,(410,  '%s %s not found')
    ,(411,  '%s unbanned.')
    ,(412,  'There was an error removing the ban on %s.')
    ,(413,  'Account not exist: %s')
    ,(414,  'There is no such character.')
    ,(415,  'There is no such IP in banlist.')
    ,(416,  'Account %s has never been banned')
    ,(417,  'Ban history for account %s:')
    ,(418,  'Ban Date: %s Bantime: %s Still active: %s  Reason: %s Set by: %s')
    ,(419,  'Inf.')
    ,(420,  'Never')
    ,(421,  'Yes')
    ,(422,  'No')
    ,(423,  'IP: %sBan Date: %sUnban Date: %sRemaining: %sReason: %sSet by: %s')
    ,(424,  'There is no matching IPban.')
    ,(425,  'There is no matching account.')
    ,(426,  'There is no banned account owning a character matching this part.')
    ,(427,  'The following IPs match your pattern:')
    ,(428,  'The following accounts match your query:')
    ,(429,  'You learned many spells/skills.')
    ,(430,  'You learned all spells for class.')
    ,(431,  'You learned all talents for class.')
    ,(432,  'You learned all languages.')
    ,(433,  'You learned all craft skills and recipes.')
    ,(434,  'Could not find \'%s\'')
    ,(435,  'Invalid item id: %u')
    ,(436,  'No items found!')
    ,(437,  'Invalid gameobject id: %u')
    ,(438,  'Found items %u: %u ( inventory %u mail %u auction %u guild %u)')
    ,(439,  'Found gameobjects %u: %u ')
    ,(440,  'Invalid creature id: %u')
    ,(441,  'Found creatures %u: %u ')
    ,(442,  'No area found!')
    ,(443,  'No item sets found!')
    ,(444,  'No skills found!')
    ,(445,  'No spells found!')
    ,(446,  'No quests found!')
    ,(447,  'No creatures found!')
    ,(448,  'No gameobjects found!')
    ,(449,  'Graveyard #%u doesn\'t exist.')
    ,(450,  'Graveyard #%u already linked to zone #%u (current).')
    ,(451,  'Graveyard #%u linked to zone #%u (current).')
    ,(452,  'Graveyard #%u can\'t be linked to subzone or not existed zone #%u (internal error).')
    ,(454,  'No faction in Graveyard with id= #%u , fix your DB')
    ,(455,  'invalid team, please fix database')
    ,(456,  'any')
    ,(457,  'alliance')
    ,(458,  'horde')
    ,(459,  'Graveyard #%u (faction: %s) is nearest from linked to zone #%u.')
    ,(460,  'Zone #%u doesn\'t have linked graveyards.')
    ,(461,  'Zone #%u doesn\'t have linked graveyards for faction: %s.')
    ,(462,  'Teleport location already exists!')
    ,(463,  'Teleport location added.')
    ,(464,  'Teleport location NOT added: database error.')
    ,(465,  'Teleport location deleted.')
    ,(466,  'No taxinodes found!')
    ,(467,  'Target unit has %d auras:')
    ,(468,  'id: %d eff: %d type: %d duration: %d maxduration: %d name: %s%s%s caster: %s')
    ,(469,  'Target unit has %d auras of type %d:')
    ,(470,  'id: %d eff: %d name: %s%s%s caster: %s')
    ,(471,  'Quest %u not found.')
    ,(472,  'Quest %u started from item. For correct work, please, add item to inventory and start quest in normal way: .additem %u')
    ,(473,  'Quest removed.')
    ,(474,  ' [rewarded]')
    ,(475,  ' [complete]')
    ,(476,  ' [active]')
    ,(477,  '%s\'s Fly Mode %s')
    ,(478,  'Opcode %u sent to %s')
    ,(479,  'Character loaded successfully!')
    ,(480,  'Failed to load the character!')
    ,(481,  'Character dumped successfully!')
    ,(482,  'Character dump failed!')
    ,(483,  'Spell %u broken and not allowed to cast or learn!')
    ,(484,  'Skill %u (%s) for player %s set to %u and current maximum set to %u (without permanent (talent) bonuses).')
    ,(485,  'Player %s must have skill %u (%s) before using this command.')
    ,(486,  'Invalid skill id (%u)')
    ,(487,  'You learned default GM spells/skills.')
    ,(488,  'You already know that spell.')
    ,(489,  'Target(%s) already know that spell.')
    ,(490,  '%s doesn\'t know that spell.')
    ,(491,  'You already forgot that spell.')
    ,(492,  'All spell cooldowns removed for %s.')
    ,(493,  'Spell %u cooldown removed for %s.')
    ,(494,  'Command : Additem, itemId = %i, amount = %i')
    ,(495,  'Command : Additemset, itemsetId = %i')
    ,(496,  'Removed itemID = %i, amount = %i from %s')
    ,(497,  'can not create item \'%i\' (amount: %i)')
    ,(498,  'You need to provide a guild name!')
    ,(499,  'Player not found!')
    ,(500,  'Player already has a guild!')
    ,(501,  'Guild not created! (already exists?)')
    ,(502,  'No items from itemset \'%u\' found.')
    ,(503,  'The distance is: (3D) %f (2D) %f - (3D, point-to-point) %f yards.')
    ,(504,  'Item \'%i\' \'%s\' Item Slot %i')
    ,(505,  'Item \'%i\' doesn\'t exist.')
    ,(506,  'Item \'%i\' \'%s\' Added to Slot %i')
    ,(507,  'Item save failed!')
    ,(508,  '%d - owner: %s (GUID: %u account: %u ) %s')
    ,(509,  '%d - sender: %s (GUID: %u account: %u ) receiver: %s (GUID: %u account: %u ) %s')
    ,(510,  '%d - owner: %s (GUID: %u account: %u ) %s')
    ,(511,  'Wrong link type!')
    ,(512,  '%d - |cffffffff|Hitem:%d:0:0:0:0:0:0:0|h[%s]|h|r %s')
    ,(513,  '%d - |cffffffff|Hquest:%d:%d|h[%s]|h|r %s')
    ,(514,  '%d - |cffffffff|Hcreature_entry:%d|h[%s]|h|r ')
    ,(515,  '%d%s - |cffffffff|Hcreature:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ')
    ,(516,  '%d - |cffffffff|Hgameobject_entry:%d|h[%s]|h|r ')
    ,(517,  '%d%s, Entry %d - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r')
    ,(518,  '%d - |cffffffff|Hitemset:%d|h[%s %s]|h|r ')
    ,(519,  '|cffffffff|Htele:%s|h[%s]|h|r ')
    ,(520,  '%d - |cffffffff|Hspell:%d|h[%s]|h|r ')
    ,(521,  '%d - |cffffffff|Hskill:%d|h[%s %s]|h|r %s %s')
    ,(522,  'Game Object (Entry: %u) not found')
    ,(523,  '>> Game Object %s (GUID: %u) at %f %f %f. Orientation %f.')
    ,(524,  'Selected object:|cffffffff|Hgameobject:%d|h[%s]|h|r GUID: %u ID: %uX: %f Y: %f Z: %f MapId: %uOrientation: %f')
    ,(525,  '>> Add Game Object \'%i\' (%s) (GUID: %i) added at \'%f %f %f\'.')
    ,(526,  '%s (lowguid: %u) movement generators stack:')
    ,(527,  '   Idle')
    ,(528,  '   Random')
    ,(529,  '   Waypoint')
    ,(530,  '   Animal random')
    ,(531,  '   Confused')
    ,(532,  '   Targeted to player %s (lowguid %u)')
    ,(533,  '   Targeted to creature %s (lowguid %u)')
    ,(534,  '   Targeted to <NULL>')
    ,(535,  '   Home movement to (X:%f Y:%f Z:%f)')
    ,(536,  '   Home movement used for player?!?')
    ,(537,  '   Taxi flight')
    ,(538,  '   Unknown movement generator (%u)')
    ,(539,  'Player selected: %s.\nFaction: %u.\nnpcFlags: %u.\nEntry: %u.\nDisplayID: %u (Native: %u).')
    ,(540,  'Level: %u.')
    ,(541,  'Health (base): %u. (max): %u. (current): %u.')
    ,(542,  'Unit Flags: %u.\nDynamic Flags: %u.\nFaction Template: %u.')
    ,(543,  'Loot: %u Pickpocket: %u Skinning: %u')
    ,(544,  'Position: %f %f %f.')
    ,(545,  '*** Is a vendor!')
    ,(546,  '*** Is a trainer!')
    ,(547,  'InstanceID: %u')
    ,(548,  'Player%s %s (GUID: %u) Account: %s (id: %u) GMLevel: %u E-mail: %s Last IP: %s Last login: %s Latency: %ums')
    ,(549,  'Played time: %s Level: %u Money: %ug%us%uc')
    ,(550,  'Command .pinfo doesn\'t support \'rep\' option for offline players.')
    ,(551,  '%s has explored all zones now.')
    ,(552,  '%s has no more explored zones.')
    ,(553,  '%s has explored all zones for you.')
    ,(554,  '%s has hidden all zones from you.')
    ,(557,  '%s level up you to (%i)')
    ,(558,  '%s level down you to (%i)')
    ,(559,  '%s reset your level progress.')
    ,(560,  'The area has been set as explored.')
    ,(561,  'The area has been set as not explored.')
    ,(564,  'The value index %u is too big to %s (count: %u).')
    ,(565,  'Set for %s field:%u to uint32 value:%u')
    ,(566,  'You set for %s field:%u to uint32 value: %u')
    ,(567,  'Set for %s field:%u to to float value:%f')
    ,(568,  'You set for %s field:%u to float value: %f')
    ,(569,  'Get %s uint32 value:[FIELD]:%u [VALUE]:%u')
    ,(570,  '%s has uint32 value:[FIELD]:%u [VALUE]:%u')
    ,(571,  'Get %s float value:[FIELD]:%u [VALUE]:%f')
    ,(572,  '%s has float value:[FIELD]:%u [VALUE]:%f')
    ,(575,  'Modify %s uint32 field:%u to sum with:%i = %u (%i)')
    ,(576,  'You modify for %s uint32 field:%u to sum with:%i = %u (%i)')
    ,(577,  'You are now invisible.')
    ,(578,  'You are now visible.')
    ,(579,  'Selected player or creature not have victim.')
    ,(580,  'You learned all default spells for race/class and completed quests rewarded spells.')
    ,(581,  'Found near gameobjects (distance %f): %u ')
    ,(582,  'SpawnTime: Full:%s Remain:%s')
    ,(583,  '%d - |cffffffff|Hgameevent:%d|h[%s]|h|r%s')
    ,(584,  'No event found!')
    ,(585,  'Event not exist!')
    ,(586,  'Event %u: %s%sStart: %s End: %s Occurrence: %s Length: %sNext state change: %s')
    ,(587,  'Event %u already active!')
    ,(588,  'Event %u not active!')
    ,(589,  '   Point movement to (X:%f Y:%f Z:%f)')
    ,(590,  '   Fear movement')
    ,(591,  '   Distract movement')
    ,(592,  'You have learned all spells in craft: %s')
    ,(593,  'Currently Banned Accounts:')
    ,(594,  '|    Account    |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |')
    ,(595,  'Currently Banned IPs:')
    ,(596,  '|      IP       |   BanDate    |   UnbanDate  |  Banned By    |   Ban Reason  |')
    ,(597,  'Current gamemasters:')
    ,(598,  '|    Account    |  GM  |')
    ,(599,  'No gamemasters.')
    ,(600,  'The Alliance wins!')
    ,(601,  'The Horde wins!')
    ,(602,  'The battle for Warsong Gulch begins in 1 minute.')
    ,(603,  'The battle for Warsong Gulch begins in 30 seconds. Prepare yourselves!')
    ,(604,  'Let the battle for Warsong Gulch begin!')
    ,(605,  '$n captured the Horde flag!')
    ,(606,  '$n captured the Alliance flag!')
    ,(607,  'The Horde flag was dropped by $n!')
    ,(608,  'The Alliance Flag was dropped by $n!')
    ,(609,  'The Alliance Flag was returned to its base by $n!')
    ,(610,  'The Horde flag was returned to its base by $n!')
    ,(611,  'The Horde flag was picked up by $n!')
    ,(612,  'The Alliance Flag was picked up by $n!')
    ,(613,  'The flags are now placed at their bases.')
    ,(614,  'The Alliance flag is now placed at its base.')
    ,(615,  'The Horde flag is now placed at its base.')
    ,(650,  'Alliance')
    ,(651,  'Horde')
    ,(652,  'stables')
    ,(653,  'blacksmith')
    ,(654,  'farm')
    ,(655,  'lumber mill')
    ,(656,  'mine')
    ,(657,  'The %s has taken the %s')
    ,(658,  '$n has defended the %s')
    ,(659,  '$n has assaulted the %s')
    ,(660,  '$n claims the %s! If left unchallenged, the %s will control it in 1 minute!')
    ,(661,  'The Battle for Arathi Basin begins in 1 minute.')
    ,(662,  'The Battle for Arathi Basin begins in 30 seconds. Prepare yourselves!')
    ,(663,  'The Battle for Arathi Basin has begun!')
    ,(664,  'The Alliance has gathered $1776W resources, and is near victory!')
    ,(665,  'The Horde has gathered $1777W resources, and is near victory!')
    ,(666,  'After your recent battle in %s our best attempts to award you a Mark of Honor failed. Enclosed you will find the Mark of Honor we were not able to deliver to you at the time. Thanks for fighting in %s!')
    ,(705,  'You must wait %s before speaking again.')
    ,(706,  'This item(s) has problems with equipping/storing to inventory.')
    ,(707,  '%s does not wish to be disturbed: %s')
    ,(708,  '%s is Away from Keyboard: %s')
    ,(709,  'Do not Disturb')
    ,(710,  'Away from Keyboard')
    ,(711,  'Queue status for %s (Lvl: %u to %u)Queued alliances: %u (Need at least %u more)Queued hordes: %u (Need at least %u more)')
    ,(712,  '|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] A: %u/%u, H: %u/%u|r')
    ,(715,  'You don\'t meet Battleground level requirements')
    ,(717,  '|cffff0000[BG Queue Announcer]:|r %s -- [%u-%u] Started!|r')
    ,(720,  'Your group is too large for this battleground. Please regroup to join.')
    ,(727,  'Your group has an offline member. Please remove him before joining.')
    ,(728,  'Your group has players from the opposing faction. You can\'t join the battleground as a group.')
    ,(729,  'Your group has players from different battleground brackets. You can\'t join as group.')
    ,(730,  'Someone in your party is already in this battleground queue. (S)he must leave it before joining as group.')
    ,(731,  'Someone in your party is Deserter. You can\'t join as group.')
    ,(732,  'Someone in your party is already in three battleground queues. You can not join as group.')
    ,(733,  'You can not teleport to a battleground map.')
    ,(734,  'You can not summon players to a battleground or arena map.')
    ,(735,  'You must be in GM mode to teleport to a player in a battleground.')
    ,(736,  'You can not teleport to a battleground from another battleground. Please leave the current battleground first.')
    ,(739,  'Battlegrounds are set to 1v0 for debugging.')
    ,(740,  'Battlegrounds are set to normal playercount.')
    ,(750,  'Not enough players. This game will close in %u mins.')
    ,(751,  'Not enough players. This game will close in %u seconds.')
    ,(752,  'Only the Alliance can use that portal')
    ,(753,  'Only the Horde can use that portal')
    ,(759,  '%s was destroyed by the %s!')
    ,(760,  'The %s is under attack! If left unchecked, the %s will destroy it!')
    ,(761,  'The %s was taken by the %s!')
    ,(762,  'The %s was taken by the %s!')
    ,(763,  'The %s was taken by the %s!')
    ,(764,  'The %s is under attack! If left unchecked, the %s will capture it!')
    ,(765,  'The %s has taken the %s! Its supplies will now be used for reinforcements!')
    ,(766,  'Irondeep Mine')
    ,(767,  'Coldtooth Mine')
    ,(768,  'Stormpike Aid Station')
    ,(769,  'Dun Baldar South Bunker')
    ,(770,  'Dun Baldar North Bunker')
    ,(771,  'Stormpike Graveyard')
    ,(772,  'Icewing Bunker')
    ,(773,  'Stonehearth Graveyard')
    ,(774,  'Stonehearth Bunker')
    ,(775,  'Snowfall Graveyard')
    ,(776,  'Iceblood Tower')
    ,(777,  'Iceblood Graveyard')
    ,(778,  'Tower Point')
    ,(779,  'Frostwolf Graveyard')
    ,(780,  'East Frostwolf Tower')
    ,(781,  'West Frostwolf Tower')
    ,(782,  'Frostwolf Relief Hut')
    ,(784,  '1 minute until the battle for Alterac Valley begins.')
    ,(785,  '30 seconds until the battle for Alterac Valley begins. Prepare yourselves!')
    ,(786,  'The battle for Alterac Valley has begun!')
    ,(787,  'The Alliance Team is running out of reinforcements!')
    ,(788,  'The Horde Team is running out of reinforcements!')
    ,(789,  'The Frostwolf General is Dead!')
    ,(790,  'The Stormpike General is Dead!')
    ,(801,  'You do not have enough gold')
    ,(802,  'You do not have enough free slots')
    ,(803,  'Your partner does not have enough free bag slots')
    ,(804,  'You do not have permission to perform that function')
    ,(805,  'Unknown language')
    ,(806,  'You don\'t know that language')
    ,(807,  'Please provide character name')
    ,(808,  'Player %s not found or offline')
    ,(809,  'Account for character %s not found')
    ,(811,  'Guild Master')
    ,(812,  'Officer')
    ,(813,  'Veteran')
    ,(814,  'Member')
    ,(815,  'Initiate')
    ,(1000, 'Exiting daemon...')
    ,(1001, 'Account deleted: %s')
    ,(1002, 'Account %s NOT deleted (probably database format was updated)')
    ,(1003, 'Account %s NOT deleted (unknown error)')
    ,(1004, 'Account created: %s')
    ,(1005, 'Account name can not be longer than 16 characters (client limit), account not created!')
    ,(1006, 'Account with this name already exist!')
    ,(1007, 'Account %s NOT created (probably database format was updated)')
    ,(1008, 'Account %s NOT created (unknown error)')
    ,(1009, 'Player %s (Guid: %u) Account %s (Id: %u) deleted.')
    ,(1010, '| ID         |    Account    |       Character      |       IP        | GM | Expansion |')
    ,(1012, '========================================================================================')
    ,(1013, '| %10u |%15s| %20s | %15s |%4d| %9d |')
    ,(1014, 'No online players.')
    ,(1015, 'Can only quit from a Remote Admin console or the quit command was not entered in full (quit).')
    ,(1016, '| GUID       | Name                 | Account                      | Delete Date         |')
    ,(1017, '| %10u | %20s | %15s (%10u) | %19s |')
    ,(1018, '==========================================================================================')
    ,(1019, 'No characters found.')
    ,(1020, 'Restoring the following characters:')
    ,(1021, 'Deleting the following characters:')
    ,(1022, 'ERROR: You can only assign a new name for a single selected character!')
    ,(1023, 'Character \'%s\' (GUID: %u Account %u) can\'t be restored: account doesn\'t exist!')
    ,(1024, 'Character \'%s\' (GUID: %u Account %u) can\'t be restored: account character list full!')
    ,(1025, 'Character \'%s\' (GUID: %u Account %u) can\'t be restored: name already in use!')
    ,(1026, 'GUID: %u Name: %s Account: %s (%u) Date: %s')
    ,(1027, 'Log filters state:')
    ,(1028, 'All log filters set to: %s')
    ,(1029, 'Command can only be called from a Remote Admin console.')
    ,(1100, 'Account %s (Id: %u) has been granted %u expansion rights.')
    ,(1101, 'Message of the day changed to:%s')
    ,(1102, 'Message sent to %s: %s')
    ,(1103, '%d - %s %s')
    ,(1104, '%d - %s')
    ,(1105, '%d - %s %s')
    ,(1106, '%d - %s %s')
    ,(1107, '%d - %s')
    ,(1108, '%d - %s %s')
    ,(1109, '%d - %s %s %s %s')
    ,(1110, '%d%s - %s X:%f Y:%f Z:%f MapId:%d')
    ,(1111, '%d%s - %s X:%f Y:%f Z:%f MapId:%d')
    ,(1112, 'Failed to open file: %s')
    ,(1113, 'Account %s (%u) have max amount allowed characters (client limit)')
    ,(1114, 'Dump file have broken data!')
    ,(1115, 'Invalid character name!')
    ,(1116, 'Invalid character GUID!')
    ,(1117, 'Character GUID %u in use!')
    ,(1118, '%d - guild: %s (GUID: %u) %s')
    ,(1119, 'You must use male or female as gender.')
    ,(1120, 'You change gender of %s to %s.')
    ,(1121, 'Your gender changed to %s by %s.')
    ,(1122, '(%u/%u +perm %u +temp %u)')
    ,(1128, '%d - |cffffffff|Htaxinode:%u|h[%s %s]|h|r (Map:%u X:%f Y:%f Z:%f)')
    ,(1129, '%d - %s %s (Map:%u X:%f Y:%f Z:%f)')
    ,(1130, 'event started %u \"%s\"')
    ,(1131, 'event stopped %u \"%s\"')
    ,(1132, '   Follow player %s (lowguid %u)')
    ,(1133, '   Follow creature %s (lowguid %u)')
    ,(1134, '   Follow <NULL>')
    ,(1135, 'List known talents:')
    ,(1136, '   (Found talents: %u used talent points: %u)')
    ,(1137, '%d%s - |cffffffff|Hgameobject:%d|h[%s X:%f Y:%f Z:%f MapId:%d]|h|r ')
    ,(1138, '=================================================================================')
    ,(1139, '| GUID       | Name                 | Race            | Class           | Level |')
    ,(1140, '| %10u | %20s | %15s | %15s | %5u |')
    ,(1141, '%u - |cffffffff|Hplayer:%s|h[%s]|h|r %s %s %u')
    ,(1142, '%u - %s (Online:%s IP:%s GM:%u Expansion:%u)')
    ,(1143, 'Spawned by event %u (%s)')
    ,(1144, 'Despawned by event %u (%s)')
    ,(1145, 'Part of pool %u')
    ,(1146, 'Part of pool %u, top pool %u')
    ,(1147, 'The (top)pool %u is spawned by event %u (%s)')
    ,(1148, 'The (top)pool %u is despawned by event %u (%s)')
    ,(1149, ' (Pool %u)')
    ,(1150, ' (Event %i)')
    ,(1151, ' (Pool %u Event %i)')
    ,(1152, '[usable]')
    ,(1153, 'Get %s bitstr value:[FIELD]:%u [VALUE]:%s')
    ,(1154, '%s has bitstr value:[FIELD]:%u [VALUE]:%s')
    ,(1155, 'Get %s hex value:[FIELD]:%u [VALUE]:%x')
    ,(1156, '%s has hex value:[FIELD]:%u [VALUE]:%x')
    ,(1157, 'Modify %s hex field:%u %s %x = %x (hex)')
    ,(1158, 'You modify for %s hex field:%u %s %x = %x (hex)')
    ,(1159, 'Modify %s float field:%u to sum with:%f = %f')
    ,(1160, 'You modify for %s float field:%u to sum with:%f = %f')
    ,(1165, 'Spell %u not have auras.')
    ,(1166, 'Scripting library not found or not accessible.')
    ,(1167, 'Scripting library has wrong list functions (outdated?).')
    ,(1168, 'Scripting library reloaded.')
    ,(1169, 'Scripting library build for different server revision.')
    ,(1171, 'Auction house bot configuration reloaded.')
    ,(1172, 'Error while trying to reload auction house bot configuration.')
    ,(1173, '==========================================================')
    ,(1174, '|--------------------------------------------------------|')
    ,(1175, '|            | Alliance |  Horde   | Neutral  |  Total   |')
    ,(1176, '          Alliance/Horde/Neutral/Total')
    ,(1177, '| %-10s | %8u | %8u | %8u | %8u |')
    ,(1178, '%-10s = %6u / %6u / %6u / %6u')
    ,(1179, 'Count')
    ,(1180, 'Item Ratio')
    ,(1181, '|            | Alliance |   Horde  | Neutral  |  Amount  |')
    ,(1182, '          Alliance/Horde/Neutral/Amount')
    ,(1183, 'Grey')
    ,(1184, 'White')
    ,(1185, 'Green')
    ,(1186, 'Blue')
    ,(1187, 'Purple')
    ,(1188, 'Orange')
    ,(1189, 'Yellow')
    ,(1190, 'Amount of %s items is set to %u.')
    ,(1191, 'Items ratio for %s is set to %u.')
    ,(1192, 'Effect movement')
    ,(1194, 'Current State Information: GOState %u, LootState %u. Collision %s')
    ,(1195, 'Current State Information: GOState %u, LootState %u. Collision %s, (door %s by default)')
    ,(1200, 'You try to view cinematic %u but it doesn\'t exist.')
    ,(1202, 'Spell %u %s = %f (*1.88 = %f) DB = %f AP = %f')
    ,(1203, 'direct heal')
    ,(1204, 'direct damage')
    ,(1205, 'dot heal')
    ,(1206, 'dot damage')
    ,(1400, 'Private ')
    ,(1401, 'Corporal ')
    ,(1402, 'Sergeant ')
    ,(1403, 'Master Sergeant ')
    ,(1404, 'Sergeant Major ')
    ,(1405, 'Knight ')
    ,(1406, 'Knight-Lieutenant ')
    ,(1407, 'Knight-Captain ')
    ,(1408, 'Knight-Champion ')
    ,(1409, 'Lieutenant Commander ')
    ,(1410, 'Commander ')
    ,(1411, 'Marshal ')
    ,(1412, 'Field Marshal ')
    ,(1413, 'Grand Marshal ')
    ,(1414, 'Scout ')
    ,(1415, 'Grunt ')
    ,(1416, 'Sergeant ')
    ,(1417, 'Senior Sergeant ')
    ,(1418, 'First Sergeant ')
    ,(1419, 'Stone Guard ')
    ,(1420, 'Blood Guard ')
    ,(1421, 'Legionnaire ')
    ,(1422, 'Centurion ')
    ,(1423, 'Champion ')
    ,(1424, 'Lieutenant General ')
    ,(1425, 'General ')
    ,(1426, 'Warlord ')
    ,(1427, 'High Warlord ')
    ,(1428, 'Game Master ')
    ,(1429, 'No Rank ')
    ,(1430, 'Dishonored ')
    ,(1431, 'Exiled ')
    ,(1432, 'Outlaw ')
    ,(1433, 'Pariah ')
    ,(1434, 'Player: %s - %s (Rank %u)')
    ,(1435, 'Today: [Honorable Kills: |c0000ff00%u|r] [Dishonorable Kills: |c00ff0000%u|r]')
    ,(1436, 'Yesterday: [Kills: |c0000ff00%u|r] [Honor: %u]')
    ,(1437, 'This Week: [Kills: |c0000ff00%u|r] [Honor: %u]')
    ,(1438, 'Last Week: [Kills: |c0000ff00%u|r] [Honor: %u] [Standing: %u]')
    ,(1439, 'Life Time: [Rank Points: |c0000ff00%f|r] [Honorable Kills: |c0000ff00%u|r] [Dishonorable Kills: |c00ff0000%u|r] [Highest Rank %u: %s]')
    ,(1500, '%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u Chance: %f %s')
    ,(1501, '%u - |cffffffff|Hpool:%u|h[%s]|h|r AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u %s')
    ,(1502, '%u - [%s] AutoSpawn: %u MaxLimit: %u Creatures: %u GameObjecs: %u Pools %u %s')
    ,(1503, 'can not add spawn because no free GUIDs for static spawn in reserved GUIDs range. Server restart is required before command can be used. Also look GuidReserveSize.* config options.')
    ,(1504, 'AI-Information for NPC Entry %u')
    ,(1505, 'AIName: %s (%s) ScriptName: %s')
    ,(1506, 'Current phase = %u')
    ,(1507, 'Combat-Movement is %s')
    ,(1508, 'Melee attacking is %s')
    ,(1509, 'Pool %u not found (Maximal pool entry is %u)')
    ,(1600, '|cffffff00Northpass Tower has been taken by the Horde!|r')
    ,(1601, '|cffffff00Northpass Tower has been taken by the Alliance!|r')
    ,(1602, '|cffffff00Crown Guard Tower has been taken by the Horde!|r')
    ,(1603, '|cffffff00Crown Guard Tower has been taken by the Alliance!|r')
    ,(1604, '|cffffff00Eastwall Tower has been taken by the Horde!|r')
    ,(1605, '|cffffff00Eastwall Tower has been taken by the Alliance!|r')
    ,(1606, '|cffffff00The Plaguewood Tower has been taken by the Horde!|r')
    ,(1607, '|cffffff00The Plaguewood Tower has been taken by the Alliance!|r')
    ,(1635, '|cffffff00The Horde has collected 200 silithyst!|r')
    ,(1636, '|cffffff00The Alliance has collected 200 silithyst!|r')
;

-- Insert world server commands into `commands` table ------------------------
INSERT INTO `command`
    (`name`,`security`,`help`)
VALUES
     ('account',0,'Syntax: .account\n\nDisplay the access level of your account.')
    ,('account characters',3,'Syntax: .account characters [#accountId|$accountName]\n\nShow list all characters for account selected by provided #accountId or $accountName, or for selected player in game.')
    ,('account create',4,'Syntax: .account create $account $password\n\nCreate account and set password to it.')
    ,('account delete',4,'Syntax: .account delete $account\n\nDelete account with all characters.')
    ,('account lock',0,'Syntax: .account lock [on|off]\n\nAllow login from account only from current used IP or remove this requirement.')
    ,('account onlinelist',4,'Syntax: .account onlinelist\n\nShow list of online accounts.')
    ,('account password',0,'Syntax: .account password $old_password $new_password $new_password\n\nChange your account password.')
    ,('account set addon',3,'Syntax: .account set addon [#accountId|$accountName] #addon\n\nSet user (possible targeted) expansion addon level allowed. Addon values: 0 - normal, 1 - tbc, 2 - wotlk.')
    ,('account set gmlevel',4,'Syntax: .account set gmlevel [#accountId|$accountName] #level\n\nSet the security level for targeted player (can\'t be used at self) or for #accountId or $accountName to a level of #level.\n\n#level may range from 0 to 3.')
    ,('account set password',4,'Syntax: .account set password (#accountId|$accountName) $password $password\n\nSet password for account.')
    ,('additem',3,'Syntax: .additem #itemid/[#itemname]/#shift-click-item-link #itemcount\n\nAdds the specified number of items of id #itemid (or exact (!) name $itemname in brackets, or link created by shift-click at item in inventory or recipe) to your or selected character inventory. If #itemcount is omitted, only one item will be added.\n.')
    ,('additemset',3,'Syntax: .additemset #itemsetid\n\nAdd items from itemset of id #itemsetid to your or selected character inventory. Will add by one example each item from itemset.')
    ,('ahbot items amount blue',3,'Syntax: .ahbot items amount blue $BlueItems\n\nSet amount of Blue color items be selled on auction.')
    ,('ahbot items amount green',3,'Syntax: .ahbot items amount green $GreenItems\n\nSet amount of Green color items be selled on auction.')
    ,('ahbot items amount grey',3,'Syntax: .ahbot items amount grey $GreyItems\n\nSet amount of Grey color items be selled on auction.')
    ,('ahbot items amount orange',3,'Syntax: .ahbot items amount orange $OrangeItems\n\nSet amount of Orange color items be selled on auction.')
    ,('ahbot items amount purple',3,'Syntax: .ahbot items amount purple $PurpleItems\n\nSet amount of Purple color items be selled on auction.')
    ,('ahbot items amount white',3,'Syntax: .ahbot items amount white $WhiteItems\n\nSet amount of White color items be selled on auction.')
    ,('ahbot items amount yellow',3,'Syntax: .ahbot items amount yellow $YellowItems\n\nSet amount of Yellow color items be selled on auction.')
    ,('ahbot items amount',3,'Syntax: .ahbot items amount $GreyItems $WhiteItems $GreenItems $BlueItems $PurpleItems $OrangeItems $YellowItems\n\nSet amount of each items color be selled on auction.')
    ,('ahbot items ratio alliance',3,'Syntax: .ahbot items ratio alliance $allianceratio\n\nSet ratio of items in alliance auction house.')
    ,('ahbot items ratio horde',3,'Syntax: .ahbot items ratio horde $horderatio\n\nSet ratio of items in horde auction house.')
    ,('ahbot items ratio neutral',3,'Syntax: .ahbot items ratio neutral $neutralratio\n\nSet ratio of items in $neutral auction house.')
    ,('ahbot items ratio',3,'Syntax: .ahbot items ratio $allianceratio $horderatio $neutralratio\n\nSet ratio of items in 3 auctions house.')
    ,('ahbot rebuild',3,'Syntax: .ahbot rebuild [all]\n\nExpire all actual auction of ahbot except bided by player. Binded auctions included to expire if \"all\" option used. Ahbot re-fill auctions base at current settings then.')
    ,('ahbot reload',3,'Syntax: .ahbot reload\n\nReload AHBot settings from configuration file.')
    ,('ahbot status',3,'Syntax: .ahbot status [all]\n\nShow current ahbot state data in short form, and with \"all\" with details.')
    ,('announce',1,'Syntax: .announce $MessageToBroadcast\n\nSend a global message to all players online in chat log.')
    ,('appear',1,'Syntax: .appear [$charactername]\n\nTeleport to the given character. Either specify the character name or click on the character\'s portrait, e.g. when you are in a group. Character can be offline.')
    ,('auction alliance',3,'Syntax: .auction alliance\n\nShow alliance auction store independent from your team.')
    ,('auction goblin',3,'Syntax: .auction goblin\n\nShow goblin auction store common for all teams.')
    ,('auction horde',3,'Syntax: .auction horde\n\nShow horde auction store independent from your team.')
    ,('auction item',3,'Syntax: .auction item (alliance|horde|goblin) #itemid[:#itemcount] [[[#minbid] #buyout] [short|long|verylong]\n\nAdd new item (in many stackes if amount grater stack size) to specific auction house at short|long|verylogn perios similar same settings in auction in game dialog. Created auction not have owner.')
    ,('auction',3,'Syntax: .auction\n\nShow your team auction store.')
    ,('aura',3,'Syntax: .aura #spellid\n\nAdd the aura from spell #spellid to the selected Unit.')
    ,('ban account',3,'Syntax: .ban account $Name $bantime $reason\nBan account kick player.\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".')
    ,('ban character',3,'Syntax: .ban character $Name $bantime $reason\nBan account and kick player.\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".')
    ,('ban ip',3,'Syntax: .ban ip $Ip $bantime $reason\nBan IP.\n$bantime: negative value leads to permban, otherwise use a timestring like \"4d20h3s\".')
    ,('baninfo account',3,'Syntax: .baninfo account $accountid\nWatch full information about a specific ban.')
    ,('baninfo character',3,'Syntax: .baninfo character $charactername \nWatch full information about a specific ban.')
    ,('baninfo ip',3,'Syntax: .baninfo ip $ip\nWatch full information about a specific ban.')
    ,('bank',3,'Syntax: .bank\n\nShow your bank inventory.')
    ,('banlist account',3,'Syntax: .banlist account [$Name]\nSearches the banlist for a account name pattern or show full list account bans.')
    ,('banlist character',3,'Syntax: .banlist character $Name\nSearches the banlist for a character name pattern. Pattern required.')
    ,('banlist ip',3,'Syntax: .banlist ip [$Ip]\nSearches the banlist for a IP pattern or show full list of IP bans.')
    ,('cast back',3,'Syntax: .cast back #spellid [triggered]\n  Selected target will cast #spellid to your character. If \'trigered\' or part provided then spell casted with triggered flag.')
    ,('cast dist',3,'Syntax: .cast dist #spellid [#dist [triggered]]\n  You will cast spell to pint at distance #dist. If \'trigered\' or part provided then spell casted with triggered flag. Not all spells can be casted as area spells.')
    ,('cast self',3,'Syntax: .cast self #spellid [triggered]\nCast #spellid by target at target itself. If \'trigered\' or part provided then spell casted with triggered flag.')
    ,('cast target',3,'Syntax: .cast target #spellid [triggered]\n  Selected target will cast #spellid to his victim. If \'trigered\' or part provided then spell casted with triggered flag.')
    ,('cast',3,'Syntax: .cast #spellid [triggered]\n  Cast #spellid to selected target. If no target selected cast to self. If \'trigered\' or part provided then spell casted with triggered flag.')
    ,('character deleted delete',4,'Syntax: .character deleted delete #guid|$name\n\nCompletely deletes the selected characters.\nIf $name is supplied, only characters with that string in their name will be deleted, if #guid is supplied, only the character with that GUID will be deleted.')
    ,('character deleted list',3,'Syntax: .character deleted list [#guid|$name]\n\nShows a list with all deleted characters.\nIf $name is supplied, only characters with that string in their name will be selected, if #guid is supplied, only the character with that GUID will be selected.')
    ,('character deleted old',4,'Syntax: .character deleted old [#keepDays]\n\nCompletely deletes all characters with deleted time longer #keepDays. If #keepDays not provided the  used value from mangosd.conf option \'CharDelete.KeepDays\'. If referenced config option disabled (use 0 value) then command can\'t be used without #keepDays.')
    ,('character deleted restore',3,'Syntax: .character deleted restore #guid|$name [$newname] [#new account]\n\nRestores deleted characters.\nIf $name is supplied, only characters with that string in their name will be restored, if $guid is supplied, only the character with that GUID will be restored.\nIf $newname is set, the character will be restored with that name instead of the original one. If #newaccount is set, the character will be restored to specific account character list. This works only with one character!')
    ,('character erase',4,'Syntax: .character erase $name\n\nDelete character $name. Character finally deleted in case any deleting options.')
    ,('character level',3,'Syntax: .character level [$playername] [#level]\n\nSet the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent values recalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.')
    ,('character rename',2,'Syntax: .character rename [$name]\n\nMark selected in game or by $name in command character for rename at next login.')
    ,('character reputation',2,'Syntax: .character reputation [$player_name]\n\nShow reputation information for selected player or player find by $player_name.')
    ,('combatstop',2,'Syntax: .combatstop [$playername]\nStop combat for selected character. If selected non-player then command applied to self. If $playername provided then attempt applied to online player $playername.')
    ,('commands',0,'Syntax: .commands\n\nDisplay a list of available commands for your account level.')
    ,('cooldown',3,'Syntax: .cooldown [#spell_id]\n\nRemove all (if spell_id not provided) or #spel_id spell cooldown from selected character or you (if no selection).')
    ,('damage',3,'Syntax: .damage $damage_amount [$school [$spellid]]\n\nApply $damage to target. If not $school and $spellid provided then this flat clean melee damage without any modifiers. If $school provided then damage modified by armor reduction (if school physical), and target absorbing modifiers and result applied as melee damage to target. If spell provided then damage modified and applied as spell damage. $spellid can be shift-link.')
    ,('debug anim',2,'Syntax: .debug anim #emoteid\n\nPlay emote #emoteid for your character.')
    ,('debug bg',3,'Syntax: .debug bg\n\nToggle debug mode for battlegrounds. In debug mode GM can start battleground with single player.')
    ,('debug getitemvalue',3,'Syntax: .debug getitemvalue #itemguid #field [int|hex|bit|float]\n\nGet the field #field of the item #itemguid in your inventroy.\n\nUse type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.')
    ,('debug getvalue',3,'Syntax: .debug getvalue #field [int|hex|bit|float]\n\nGet the field #field of the selected target. If no target is selected, get the content of your field.\n\nUse type arg for set output format: int (decimal number), hex (hex value), bit (bitstring), float. By default use integer output.')
    ,('debug moditemvalue',3,'Syntax: .debug moditemvalue #guid #field [int|float| &= | |= | &=~ ] #value\n\nModify the field #field of the item #itemguid in your inventroy by value #value. \n\nUse type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.')
    ,('debug modvalue',3,'Syntax: .debug modvalue #field [int|float| &= | |= | &=~ ] #value\n\nModify the field #field of the selected target by value #value. If no target is selected, set the content of your field.\n\nUse type arg for set mode of modification: int (normal add/subtract #value as decimal number), float (add/subtract #value as float number), &= (bit and, set to 0 all bits in value if it not set to 1 in #value as hex number), |= (bit or, set to 1 all bits in value if it set to 1 in #value as hex number), &=~ (bit and not, set to 0 all bits in value if it set to 1 in #value as hex number). By default expect integer add/subtract.')
    ,('debug play cinematic',1,'Syntax: .debug play cinematic #cinematicid\n\nPlay cinematic #cinematicid for you. You stay at place while your mind fly.\n')
    ,('debug play sound',1,'Syntax: .debug play sound #soundid\n\nPlay sound with #soundid.\nSound will be play only for you. Other players do not hear this.\nWarning: client may have more 5000 sounds...')
    ,('debug setitemvalue',3,'Syntax: .debug setitemvalue #guid #field [int|hex|bit|float] #value\n\nSet the field #field of the item #itemguid in your inventroy to value #value.\n\nUse type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.')
    ,('debug setvalue',3,'Syntax: .debug setvalue #field [int|hex|bit|float] #value\n\nSet the field #field of the selected target to value #value. If no target is selected, set the content of your field.\n\nUse type arg for set input format: int (decimal number), hex (hex value), bit (bitstring), float. By default expect integer input format.')
    ,('debug spellcoefs',3,'Syntax: .debug spellcoefs #spellid\n\nShow default calculated and DB stored coefficients for direct/dot heal/damage.')
    ,('debug spellmods',3,'Syntax: .debug spellmods (flat|pct) #spellMaskBitIndex #spellModOp #value\n\nSet at client side spellmod affect for spell that have bit set with index #spellMaskBitIndex in spell family mask for values dependent from spellmod #spellModOp to #value.')
    ,('delticket',2,'Syntax: .delticket all\n        .delticket #num\n        .delticket $character_name\n\rall to dalete all tickets at server, $character_name to delete ticket of this character, #num to delete ticket #num.')
    ,('demorph',2,'Syntax: .demorph\n\nDemorph the selected player.')
    ,('die',3,'Syntax: .die\n\nKill the selected player. If no player is selected, it will kill you.')
    ,('dismount',0,'Syntax: .dismount\n\nDismount you, if you are mounted.')
    ,('distance',3,'Syntax: .distance [$name/$link]\n\nDisplay the distance from your character to the selected creature/player, or player with name $name, or player/creature/gameobject pointed to shift-link with guid.')
    ,('event list',2,'Syntax: .event list\nShow list of currently active events.\nShow list of all events')
    ,('event start',2,'Syntax: .event start #event_id\nStart event #event_id. Set start time for event to current moment (change not saved in DB).')
    ,('event stop',2,'Syntax: .event stop #event_id\nStop event #event_id. Set start time for event to time in past that make current moment is event stop time (change not saved in DB).')
    ,('event',2,'Syntax: .event #event_id\nShow details about event with #event_id.')
    ,('explorecheat',3,'Syntax: .explorecheat #flag\n\nReveal  or hide all maps for the selected player. If no player is selected, hide or reveal maps to you.\n\nUse a #flag of value 1 to reveal, use a #flag value of 0 to hide all maps.')
    ,('gm chat',1,'Syntax: .gm chat [on/off]\n\nEnable or disable chat GM MODE (show gm badge in messages) or show current state of on/off not provided.')
    ,('gm fly',3,'Syntax: .gm fly [on/off]\nEnable/disable gm fly mode.')
    ,('gm ingame',0,'Syntax: .gm ingame\n\nDisplay a list of available in game Game Masters.')
    ,('gm list',3,'Syntax: .gm list\n\nDisplay a list of all Game Masters accounts and security levels.')
    ,('gm setview',1,'Syntax: .gm setview\n\nSet farsight view on selected unit. Select yourself to set view back.')
    ,('gm visible',1,'Syntax: .gm visible on/off\n\nOutput current visibility state or make GM visible(on) and invisible(off) for other players.')
    ,('gm',1,'Syntax: .gm [on/off]\n\nEnable or Disable in game GM MODE or show current state of on/off not provided.')
    ,('go creature',1,'Syntax: .go creature (#creature_guid|$creature_name|id #creature_id)\nTeleport your character to creature with guid #creature_guid, or teleport your character to creature with name including as part $creature_name substring, or teleport your character to a creature that was spawned from the template with this entry #creature_id.')
    ,('go graveyard',1,'Syntax: .go graveyard #graveyardId\n Teleport to graveyard with the graveyardId specified.')
    ,('go grid',1,'Syntax: .go grid #gridX #gridY [#mapId]\n\nTeleport the gm to center of grid with provided indexes at map #mapId (or current map if it not provided).')
    ,('go object',1,'Syntax: .go object (#gameobject_guid|$gameobject_name|id #gameobject_id)\nTeleport your character to gameobject with guid #gameobject_guid, or teleport your character to gameobject with name including as part $gameobject_name substring, or teleport your character to a gameobject that was spawned from the template with this entry #gameobject_id.')
    ,('go taxinode',1,'Syntax: .go taxinode #taxinode\n\nTeleport player to taxinode coordinates. You can look up zone using .lookup taxinode $namepart')
    ,('go trigger',1,'Syntax: .go trigger (#trigger_id|$trigger_shift-link|$trigger_target_shift-link) [target]\n\nTeleport your character to areatrigger with id #trigger_id or trigger id associated with shift-link. If additional arg \"target\" provided then character will teleported to areatrigger target point.')
    ,('go xy',1,'Syntax: .go xy #x #y [#mapid]\n\nTeleport player to point with (#x,#y) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.')
    ,('go xyz',1,'Syntax: .go xyz #x #y #z [#mapid]\n\nTeleport player to point with (#x,#y,#z) coordinates at ground(water) level at map #mapid or same map if #mapid not provided.')
    ,('go zonexy',1,'Syntax: .go zonexy #x #y [#zone]\n\nTeleport player to point with (#x,#y) client coordinates at ground(water) level in zone #zoneid or current zone if #zoneid not provided. You can look up zone using .lookup area $namepart')
    ,('go',1,'Syntax: .go  [$playername|pointlink|#x #y #z [#mapid]]\nTeleport your character to point with coordinates of player $playername, or coordinates of one from shift-link types: player, tele, taxinode, creature/creature_entry, gameobject/gameobject_entry, or explicit #x #y #z #mapid coordinates.')
    ,('gobject add',2,'Syntax: .gobject add #id <spawntimeSecs>\n\nAdd a game object from game object templates to the world at your current location using the #id.\nspawntimesecs sets the spawntime, it is optional.\n\nNote: this is a copy of .gameobject.')
    ,('gobject delete',2,'Syntax: .gobject delete #go_guid\nDelete gameobject with guid #go_guid.')
    ,('gobject move',2,'Syntax: .gobject move #goguid [#x #y #z]\n\nMove gameobject #goguid to character coordinates (or to (#x,#y,#z) coordinates if its provide).')
    ,('gobject near',2,'Syntax: .gobject near  [#distance]\n\nOutput gameobjects at distance #distance from player. Output gameobject guids and coordinates sorted by distance from character. If #distance not provided use 10 as default value.')
    ,('gobject target',2,'Syntax: .gobject target [#go_id|#go_name_part]\n\nLocate and show position nearest gameobject. If #go_id or #go_name_part provide then locate and show position of nearest gameobject with gameobject template id #go_id or name included #go_name_part as part.')
    ,('gobject turn',2,'Syntax: .gobject turn #goguid \n\nSet for gameobject #goguid orientation same as current character orientation.')
    ,('gps',1,'Syntax: .gps [$name|$shift-link]\n\nDisplay the position information for a selected character or creature (also if player name $name provided then for named player, or if creature/gameobject shift-link provided then pointed creature/gameobject if it loaded). Position information includes X, Y, Z, and orientation, map Id and zone Id')
    ,('groupgo',1,'Syntax: .groupgo [$charactername]\n\nTeleport the given character and his group to you. Teleported only online characters but original selected group member can be offline.')
    ,('guid',2,'Syntax: .guid\n\nDisplay the GUID for the selected character.')
    ,('guild create',2,'Syntax: .guild create [$GuildLeaderName] \"$GuildName\"\n\nCreate a guild named $GuildName with the player $GuildLeaderName (or selected) as leader.  Guild name must in quotes.')
    ,('guild delete',2,'Syntax: .guild delete \"$GuildName\"\n\nDelete guild $GuildName. Guild name must in quotes.')
    ,('guild invite',2,'Syntax: .guild invite [$CharacterName] \"$GuildName\"\n\nAdd player $CharacterName (or selected) into a guild $GuildName. Guild name must in quotes.')
    ,('guild rank',2,'Syntax: .guild rank $CharacterName #Rank\n\nSet for $CharacterName rank #Rank in a guild.')
    ,('guild uninvite',2,'Syntax: .guild uninvite [$CharacterName]\n\nRemove player $CharacterName (or selected) from a guild.')
    ,('help',0,'Syntax: .help [$command]\n\nDisplay usage instructions for the given $command. If no $command provided show list available commands.')
    ,('hidearea',3,'Syntax: .hidearea #areaid\n\nHide the area of #areaid to the selected character. If no character is selected, hide this area to you.')
    ,('honor add',2,'Syntax: .honor add $amount\n\nAdd a certain amount of honor (gained in lifetime) to the selected player.')
    ,('honor addkill',2,'Syntax: .honor addkill\n\nAdd the targeted unit as one of your pvp kills today (you only get honor if it\'s a racial leader or a player)')
    ,('honor show',2,'Syntax: .honor show\n\nDisplay the honor stats of the selected player')
    ,('honor update',2,'Syntax: .honor update\n\nForce honor to be update')
    ,('instance listbinds',3,'Syntax: .instance listbinds\n  Lists the binds of the selected player.')
    ,('instance savedata',3,'Syntax: .instance savedata\n  Save the InstanceData for the current player\'s map to the DB.')
    ,('instance stats',3,'Syntax: .instance stats\n  Shows statistics about instances.')
    ,('instance unbind',3,'Syntax: .instance unbind all\n  All of the selected player\'s binds will be cleared.\n.instance unbind #mapid\n Only the specified #mapid instance will be cleared.')
    ,('itemmove',2,'Syntax: .itemmove #sourceslotid #destinationslotid\n\nMove an item from slots #sourceslotid to #destinationslotid in your inventory\n\nNot yet implemented')
    ,('kick',2,'Syntax: .kick [$charactername]\n\nKick the given character name from the world. If no character name is provided then the selected player (except for yourself) will be kicked.')
    ,('learn all',3,'Syntax: .learn all\n\nLearn all big set different spell maybe useful for Administaror.')
    ,('learn all_crafts',2,'Syntax: .learn crafts\n\nLearn all professions and recipes.')
    ,('learn all_default',1,'Syntax: .learn all_default [$playername]\n\nLearn for selected/$playername player all default spells for his race/class and spells rewarded by completed quests.')
    ,('learn all_gm',2,'Syntax: .learn all_gm\n\nLearn all default spells for Game Masters.')
    ,('learn all_lang',1,'Syntax: .learn all_lang\n\nLearn all languages')
    ,('learn all_myclass',3,'Syntax: .learn all_myclass\n\nLearn all spells and talents available for his class.')
    ,('learn all_myspells',3,'Syntax: .learn all_myspells\n\nLearn all spells (except talents and spells with first rank learned as talent) available for his class.')
    ,('learn all_mytalents',3,'Syntax: .learn all_mytalents\n\nLearn all talents (and spells with first rank learned as talent) available for his class.')
    ,('learn all_recipes',2,'Syntax: .learn all_recipes [$profession]\r\rLearns all recipes of specified profession and sets skill level to max.\rExample: .learn all_recipes enchanting')
    ,('learn',3,'Syntax: .learn #spell [all]\n\nSelected character learn a spell of id #spell. If \'all\' provided then all ranks learned.')
    ,('levelup',3,'Syntax: .levelup [$playername] [#numberoflevels]\n\nIncrease/decrease the level of character with $playername (or the selected if not name provided) by #numberoflevels Or +1 if no #numberoflevels provided). If #numberoflevels is omitted, the level will be increase by 1. If #numberoflevels is 0, the same level will be restarted. If no character is selected and name not provided, increase your level. Command can be used for offline character. All stats and dependent VALUESrecalculated. At level decrease talents can be reset if need. Also at level decrease equipped items with greater level requirement can be lost.')
    ,('linkgrave',3,'Syntax: .linkgrave #graveyard_id [alliance|horde]\n\nLink current zone to graveyard for any (or alliance/horde faction ghosts). This let character ghost from zone teleport to graveyard after die if graveyard is nearest from linked to zone and accept ghost of this faction. Add only single graveyard at another map and only if no graveyards linked (or planned linked at same map).')
    ,('list creature',3,'Syntax: .list creature #creature_id [#max_count]\n\nOutput creatures with creature id #creature_id found in world. Output creature guids and coordinates sorted by distance from character. Will be output maximum #max_count creatures. If #max_count not provided use 10 as default value.')
    ,('list item',3,'Syntax: .list item #item_id [#max_count]\n\nOutput items with item id #item_id found in all character inventories, mails, auctions, and guild banks. Output item guids, item owner guid, owner account and owner name (guild name and guid in case guild bank). Will be output maximum #max_count items. If #max_count not provided use 10 as default value.')
    ,('list object',3,'Syntax: .list object #gameobject_id [#max_count]\n\nOutput gameobjects with gameobject id #gameobject_id found in world. Output gameobject guids and coordinates sorted by distance from character. Will be output maximum #max_count gameobject. If #max_count not provided use 10 as default value.')
    ,('list talents',3,'Syntax: .list talents\n\nShow list all really known (as learned spells) talent rank spells for selected player or self.')
    ,('loadscripts',3,'Syntax: .loadscripts $scriptlibraryname\n\nUnload current and load the script library $scriptlibraryname or reload current if $scriptlibraryname omitted, in case you changed it while the server was running.')
    ,('lookup account email',2,'Syntax: .lookup account email $emailpart [#limit] \n\n Searchs accounts, which email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.')
    ,('lookup account ip',2,'Syntax: lookup account ip $ippart [#limit] \n\n Searchs accounts, which last used ip inluding $ippart (textual) with optional parametr #$limit of results. If #limit not provided expected 100.')
    ,('lookup account name',2,'Syntax: .lookup account name $accountpart [#limit] \n\n Searchs accounts, which username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.')
    ,('lookup area',1,'Syntax: .lookup area $namepart\n\nLooks up an area by $namepart, and returns all matches with their area ID\'s.')
    ,('lookup creature',3,'Syntax: .lookup creature $namepart\n\nLooks up a creature by $namepart, and returns all matches with their creature ID\'s.')
    ,('lookup event',2,'Syntax: .lookup event $name\nAttempts to find the ID of the event with the provided $name.')
    ,('lookup faction',3,'Syntax: .lookup faction $name\nAttempts to find the ID of the faction with the provided $name.')
    ,('lookup item',3,'Syntax: .lookup item $itemname\n\nLooks up an item by $itemname, and returns all matches with their Item ID\'s.')
    ,('lookup itemset',3,'Syntax: .lookup itemset $itemname\n\nLooks up an item set by $itemname, and returns all matches with their Item set ID\'s.')
    ,('lookup object',3,'Syntax: .lookup object $objname\n\nLooks up an gameobject by $objname, and returns all matches with their Gameobject ID\'s.')
    ,('lookup player account',2,'Syntax: .lookup player account $accountpart [#limit] \n\n Searchs players, which account username including $accountpart with optional parametr #limit of results. If #limit not provided expected 100.')
    ,('lookup player email',2,'Syntax: .lookup player email $emailpart [#limit] \n\n Searchs players, which account email including $emailpart with optional parametr #limit of results. If #limit not provided expected 100.')
    ,('lookup player ip',2,'Syntax: .lookup player ip $ippart [#limit] \n\n Searchs players, which account last used ip inluding $ippart (textual) with optional parametr #limit of results. If #limit not provided expected 100.')
    ,('lookup pool',2,'Syntax: .lookup pool $pooldescpart\n\nList of pools (anywhere) with substring in description.')
    ,('lookup quest',3,'Syntax: .lookup quest $namepart\n\nLooks up a quest by $namepart, and returns all matches with their quest ID\'s.')
    ,('lookup skill',3,'Syntax: .lookup skill $$namepart\n\nLooks up a skill by $namepart, and returns all matches with their skill ID\'s.')
    ,('lookup spell',3,'Syntax: .lookup spell $namepart\n\nLooks up a spell by $namepart, and returns all matches with their spell ID\'s.')
    ,('lookup taxinode',3,'Syntax: .lookup taxinode $substring\n\nSearch and output all taxinodes with provide $substring in name.')
    ,('lookup tele',1,'Syntax: .lookup tele $substring\n\nSearch and output all .tele command locations with provide $substring in name.')
    ,('maxskill',3,'Syntax: .maxskill\nSets all skills of the targeted player to their maximum VALUESfor its current level.')
    ,('modify aspeed',1,'Syntax: .modify aspeed #rate\n\nModify all speeds -run,swim,run back,swim back- of the selected player to \"normalbase speed for this move type\"*rate. If no player is selected, modify your speed.\n\n #rate may range from 0.1 to 10.')
    ,('modify bwalk',1,'Syntax: .modify bwalk #rate\n\nModify the speed of the selected player while running backwards to \"normal walk back speed\"*rate. If no player is selected, modify your speed.\n\n #rate may range from 0.1 to 10.')
    ,('modify drunk',1,'Syntax: .modify drunk #value\n Set drunk level to #value (0..100). Value 0 remove drunk state, 100 is max drunked state.')
    ,('modify energy',1,'Syntax: .modify energy #energy\n\nModify the energy of the selected player. If no player is selected, modify your energy.')
    ,('modify faction',1,'Syntax: .modify faction #factionid #flagid #npcflagid #dynamicflagid\n\nModify the faction and flags of the selected creature. Without arguments, display the faction and flags of the selected creature.')
    ,('modify gender',2,'Syntax: .modify gender male/female\n\nChange gender of selected player.')
    ,('modify honor',1,'Syntax: .modify honor $field $value\n\nAdd $value to an honor $field (it\'s just for debug , values won\'t be saved at player logout)\nField list: points / rank / todaykills / yesterdaykills / yesterdayhonor /\nthisweekkills / thisweekhonor / lastweekkills / lastweekhonor /\nlastweekstanding / lifetimedishonorablekills / lifetimehonorablekills ')
    ,('modify hp',1,'Syntax: .modify hp #newhp\n\nModify the hp of the selected player. If no player is selected, modify your hp.')
    ,('modify mana',1,'Syntax: .modify mana #newmana\n\nModify the mana of the selected player. If no player is selected, modify your mana.')
    ,('modify money',1,'Syntax: .modify money #money\n.money #money\n\nAdd or remove money to the selected player. If no player is selected, modify your money.\n\n #gold can be negative to remove money.')
    ,('modify morph',2,'Syntax: .modify morph #displayid\n\nChange your current model id to #displayid.')
    ,('modify mount',1,'Syntax: .modify mount #id #speed\nDisplay selected player as mounted at #id creature and set speed to #speed value.')
    ,('modify rage',1,'Syntax: .modify rage #newrage\n\nModify the rage of the selected player. If no player is selected, modify your rage.')
    ,('modify rep',2,'Syntax: .modify rep #repId (#repvalue | $rankname [#delta])\nSets the selected players reputation with faction #repId to #repvalue or to $reprank.\nIf the reputation rank name is provided, the resulting reputation will be the lowest reputation for that rank plus the delta amount, if specified.\nYou can use \'.pinfo rep\' to list all known reputation ids, or use \'.lookup faction $name\' to locate a specific faction id.')
    ,('modify scale',1,'Syntax: .modify scale #scale\n\nChange model scale for targeted player (util relogin) or creature (until respawn).')
    ,('modify speed',1,'Syntax: .modify speed #rate\n.speed #rate\n\nModify the running speed of the selected player to \"normal base run speed\"*rate. If no player is selected, modify your speed.\n\n #rate may range from 0.1 to 10.')
    ,('modify standstate',2,'Syntax: .modify standstate #emoteid\n\nChange the emote of your character while standing to #emoteid.')
    ,('modify swim',1,'Syntax: .modify swim #rate\n\nModify the swim speed of the selected player to \"normal swim speed\"*rate. If no player is selected, modify your speed.\n\n #rate may range from 0.1 to 10.')
    ,('movegens',3,'Syntax: .movegens\n  Show movement generators stack for selected creature or player.')
    ,('mute',1,'Syntax: .mute [$playerName] $timeInMinutes\n\nDisible chat messaging for any character from account of character $playerName (or currently selected) at $timeInMinutes minutes. Player can be offline.')
    ,('neargrave',3,'Syntax: .neargrave [alliance|horde]\n\nFind nearest graveyard linked to zone (or only nearest from accepts alliance or horde faction ghosts).')
    ,('notify',1,'Syntax: .notify $MessageToBroadcast\n\nSend a global message to all players online in screen.')
    ,('npc add',2,'Syntax: .npc add #creatureid\n\nSpawn a creature by the given template id of #creatureid.')
    ,('npc additem',2,'Syntax: .npc additem #itemId <#maxcount><#incrtime>r\n\nAdd item #itemid to item list of selected vendor. Also optionally set max count item in vendor item list and time to item count restoring.')
    ,('npc addmove',2,'Syntax: .npc addmove #creature_guid [#waittime]\n\nAdd your current location as a waypoint for creature with guid #creature_guid. And optional add wait time.')
    ,('npc addweapon',3,'Not yet implemented.')
    ,('npc aiinfo',2,'Syntax: .npc npc aiinfo\n\nShow npc AI and script information.')
    ,('npc allowmove',3,'Syntax: .npc allowmove\n\nEnable or disable movement creatures in world. Not implemented.')
    ,('npc changelevel',2,'Syntax: .npc changelevel #level\n\nChange the level of the selected creature to #level.\n\n#level may range from 1 to 63.')
    ,('npc delete',2,'Syntax: .npc delete [#guid]\n\nDelete creature with guid #guid (or the selected if no guid is provided)')
    ,('npc delitem',2,'Syntax: .npc delitem #itemId\n\nRemove item #itemid from item list of selected vendor.')
    ,('npc factionid',2,'Syntax: .npc factionid #factionid\n\nSet the faction of the selected creature to #factionid.')
    ,('npc flag',2,'Syntax: .npc flag #npcflag\n\nSet the NPC flags of creature template of the selected creature and selected creature to #npcflag. NPC flags will applied to all creatures of selected creature template after server restart or grid unload/load.')
    ,('npc follow',2,'Syntax: .npc follow\n\nSelected creature start follow you until death/fight/etc.')
    ,('npc info',3,'Syntax: .npc info\n\nDisplay a list of details for the selected creature.\n\nThe list includes:\n- GUID, Faction, NPC flags, Entry ID, Model ID,\n- Level,\n- Health (current/maximum),\n\n- Field flags, dynamic flags, faction template, \n- Position information,\n- and the creature type, e.g. if the creature is a vendor.')
    ,('npc move',2,'Syntax: .npc move [#creature_guid]\n\nMove the targeted creature spawn point to your coordinates.')
    ,('npc name',2,'Syntax: .npc name $name\n\nChange the name of the selected creature or character to $name.\n\nCommand disabled.')
    ,('npc playemote',3,'Syntax: .npc playemote #emoteid\n\nMake the selected creature emote with an emote of id #emoteid.')
    ,('npc say',1,'Syntax: .npc say #text\nMake the selected npc says #text.')
    ,('npc setdeathstate',2,'Syntax: .npc setdeathstate on/off\n\nSet default death state (dead/alive) for npc at spawn.')
    ,('npc setmodel',2,'Syntax: .npc setmodel #displayid\n\nChange the model id of the selected creature to #displayid.')
    ,('npc setmovetype',2,'Syntax: .npc setmovetype [#creature_guid] stay/random/way [NODEL]\n\nSet for creature pointed by #creature_guid (or selected if #creature_guid not provided) movement type and move it to respawn position (if creature alive). Any existing waypoints for creature will be removed from the database if you do not use NODEL. If the creature is dead then movement type will applied at creature respawn.\nMake sure you use NODEL, if you want to keep the waypoints.')
    ,('npc spawndist',2,'Syntax: .npc spawndist #dist\n\nAdjust spawndistance of selected creature to dist.')
    ,('npc spawntime',2,'Syntax: .npc spawntime #time \n\nAdjust spawntime of selected creature to time.')
    ,('npc subname',2,'Syntax: .npc subname $Name\n\nChange the subname of the selected creature or player to $Name.\n\nCommand disabled.')
    ,('npc tame',2,'Syntax: .npc tame\n\nTame selected creature (tameable non pet creature). You don\'t must have pet.')
    ,('npc textemote',1,'Syntax: .npc textemote #emoteid\n\nMake the selected creature to do textemote with an emote of id #emoteid.')
    ,('npc unfollow',2,'Syntax: .npc unfollow\n\nSelected creature (non pet) stop follow you.')
    ,('npc whisper',1,'Syntax: .npc whisper #playerguid #text\nMake the selected npc whisper #text to  #playerguid.')
    ,('npc yell',1,'Syntax: .npc yell #text\nMake the selected npc yells #text.')
    ,('pdump load',3,'Syntax: .pdump load $filename $account [$newname] [$newguid]\nLoad character dump from dump file into character list of $account with saved or $newname, with saved (or first free) or $newguid guid.')
    ,('pdump write',3,'Syntax: .pdump write $filename $playerNameOrGUID\nWrite character dump with name/guid $playerNameOrGUID to file $filename.')
    ,('pinfo',2,'Syntax: .pinfo [$player_name]\n\nOutput account information for selected player or player find by $player_name.')
    ,('pool list',2,'Syntax: .pool list\n\nList of pools with spawn in current map (only work in instances. Non-instanceable maps share pool system state os useless attempt get all pols at all continents.')
    ,('pool spawns',2,'Syntax: .pool spawns #pool_id\n\nList current creatures/objects listed in pools (or in specific #pool_id) and spawned (added to grid data, not meaning show in world.')
    ,('pool',2,'Syntax: .pool #pool_id\n\nPool information and full list creatures/gameobjects included in pool.')
    ,('quest add',3,'Syntax: .quest add #quest_id\n\nAdd to character quest log quest #quest_id. Quest started from item can\'t be added by this command but correct .additem call provided in command output.')
    ,('quest complete',3,'Syntax: .quest complete #questid\nMark all quest objectives as completed for target character active quest. After this target character can go and get quest reward.')
    ,('quest remove',3,'Syntax: .quest remove #quest_id\n\nSet quest #quest_id state to not completed and not active (and remove from active quest list) for selected player.')
    ,('quit',4,'Syntax: quit\n\nClose RA connection. Command must be typed fully (quit).')
    ,('recall',1,'Syntax: .recall [$playername]\n\nTeleport $playername or selected player to the place where he has been before last use of a teleportation command. If no $playername is entered and no player is selected, it will teleport you.')
    ,('reload all',3,'Syntax: .reload all\n\nReload all tables with reload support added and that can be _safe_ reloaded.')
    ,('reload all_area',3,'Syntax: .reload all_area\n\nReload all `areatrigger_*` tables if reload support added for this table and this table can be _safe_ reloaded.')
    ,('reload all_eventai',3,'Syntax: .reload all_eventai\n\nReload `creature_ai_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.')
    ,('reload all_item',3,'Syntax: .reload all_item\n\nReload `item_required_target`, `page_texts` and `item_enchantment_template` tables.')
    ,('reload all_locales',3,'Syntax: .reload all_locales\n\nReload all `locales_*` tables with reload support added and that can be _safe_ reloaded.')
    ,('reload all_loot',3,'Syntax: .reload all_loot\n\nReload all `*_loot_template` tables. This can be slow operation with lags for server run.')
    ,('reload all_npc',3,'Syntax: .reload all_npc\n\nReload `points_of_interest` and `npc_*` tables if reload support added for these tables and these tables can be _safe_ reloaded.')
    ,('reload all_quest',3,'Syntax: .reload all_quest\n\nReload all quest related tables if reload support added for this table and this table can be _safe_ reloaded.')
    ,('reload all_scripts',3,'Syntax: .reload all_scripts\n\nReload `dbscripts_on_*` tables.')
    ,('reload all_spell',3,'Syntax: .reload all_spell\n\nReload all `spell_*` tables with reload support added and that can be _safe_ reloaded.')
    ,('reload config',3,'Syntax: .reload config\n\nReload config settings (by default stored in mangosd.conf). Not all settings can be change at reload: some new setting values will be ignored until restart, some values will applied with delay or only to new objects/maps, some values will explicitly rejected to change at reload.')
    ,('repairitems',2,'Syntax: .repairitems\n\nRepair all selected player\'s items.')
    ,('reset all',3,'Syntax: .reset all spells\n\nSyntax: .reset all talents\n\nRequest reset spells or talents at next login each existed character.')
    ,('reset honor',3,'Syntax: .reset honor [Playername]\n  Reset all honor data for targeted character.')
    ,('reset level',3,'Syntax: .reset level [Playername]\n  Reset level to 1 including reset stats and talents.  Equipped items with greater level requirement can be lost.')
    ,('reset spells',3,'Syntax: .reset spells [Playername]\n  Removes all non-original spells from spellbook.\n. Playername can be name of offline character.')
    ,('reset stats',3,'Syntax: .reset stats [Playername]\n  Resets(recalculate) all stats of the targeted player to their original VALUESat current level.')
    ,('reset talents',3,'Syntax: .reset talents [Playername]\n  Removes all talents of the targeted player. Playername can be name of offline character.')
    ,('respawn',3,'Syntax: .respawn\n\nRespawn selected creature or respawn all nearest creatures (if none selected) and GO without waiting respawn time expiration.')
    ,('revive',3,'Syntax: .revive\n\nRevive the selected player. If no player is selected, it will revive you.')
    ,('save',0,'Syntax: .save\n\nSaves your character.')
    ,('saveall',1,'Syntax: .saveall\n\nSave all characters in game.')
    ,('send items',3,'Syntax: .send items #playername \"#subject\" \"#text\" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\n\nSend a mail to a player. Subject and mail text must be in \"\". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.')
    ,('send mail',1,'Syntax: .send mail #playername \"#subject\" \"#text\"\n\nSend a mail to a player. Subject and mail text must be in \"\".')
    ,('send mass items',3,'Syntax: .send mass items #racemask|$racename|alliance|horde|all \"#subject\" \"#text\" itemid1[:count1] itemid2[:count2] ... itemidN[:countN]\n\nSend a mail to players. Subject and mail text must be in \"\". If for itemid not provided related count values then expected 1, if count > max items in stack then items will be send in required amount stacks. All stacks amount in mail limited to 12.')
    ,('send mass mail',3,'Syntax: .send mass mail #racemask|$racename|alliance|horde|all \"#subject\" \"#text\"\n\nSend a mail to players. Subject and mail text must be in \"\".')
    ,('send mass money',3,'Syntax: .send mass money #racemask|$racename|alliance|horde|all \"#subject\" \"#text\" #money\n\nSend mail with money to players. Subject and mail text must be in \"\".')
    ,('send message',3,'Syntax: .send message $playername $message\n\nSend screen message to player from ADMINISTRATOR.')
    ,('send money',3,'Syntax: .send money #playername \"#subject\" \"#text\" #money\n\nSend mail with money to a player. Subject and mail text must be in \"\".')
    ,('server corpses',2,'Syntax: .server corpses\n\nTriggering corpses expire check in world.')
    ,('server exit',4,'Syntax: .server exit\n\nTerminate mangosd NOW. Exit code 0.')
    ,('server idlerestart cancel',3,'Syntax: .server idlerestart cancel\n\nCancel the restart/shutdown timer if any.')
    ,('server idlerestart',3,'Syntax: .server idlerestart #delay\n\nRestart the server after #delay seconds if no active connections are present (no players). Use #exist_code or 2 as program exist code.')
    ,('server idleshutdown cancel',3,'Syntax: .server idleshutdown cancel\n\nCancel the restart/shutdown timer if any.')
    ,('server idleshutdown',3,'Syntax: .server idleshutdown #delay [#exist_code]\n\nShut the server down after #delay seconds if no active connections are present (no players). Use #exist_code or 0 as program exist code.')
    ,('server info',0,'Syntax: .server info\n\nDisplay server version and the number of connected players.')
    ,('server log filter',4,'Syntax: .server log filter [($filtername|all) (on|off)]\n\nShow or set server log filters. If used \"all\" then all filters will be set to on/off state.')
    ,('server log level',4,'Syntax: .server log level [#level]\n\nShow or set server log level (0 - errors only, 1 - basic, 2 - detail, 3 - debug).')
    ,('server motd',0,'Syntax: .server motd\n\nShow server Message of the day.')
    ,('server plimit',3,'Syntax: .server plimit [#num|-1|-2|-3|reset|player|moderator|gamemaster|administrator]\n\nWithout arg show current player amount and security level limitations for login to server, with arg set player linit ($num > 0) or securiti limitation ($num < 0 or security leme name. With `reset` sets player limit to the one in the config file')
    ,('server restart cancel',3,'Syntax: .server restart cancel\n\nCancel the restart/shutdown timer if any.')
    ,('server restart',3,'Syntax: .server restart #delay\n\nRestart the server after #delay seconds. Use #exist_code or 2 as program exist code.')
    ,('server set motd',3,'Syntax: .server set motd $MOTD\n\nSet server Message of the day.')
    ,('server shutdown cancel',3,'Syntax: .server shutdown cancel\n\nCancel the restart/shutdown timer if any.')
    ,('server shutdown',3,'Syntax: .server shutdown #delay [#exit_code]\n\nShut the server down after #delay seconds. Use #exit_code or 0 as program exit code.')
    ,('setskill',3,'Syntax: .setskill #skill #level [#max]\n\nSet a skill of id #skill with a current skill value of #level and a maximum value of #max (or equal current maximum if not provide) for the selected character. If no character is selected, you learn the skill.')
    ,('showarea',3,'Syntax: .showarea #areaid\n\nReveal the area of #areaid to the selected character. If no character is selected, reveal this area to you.')
    ,('stable',3,'Syntax: .stable\n\nShow your pet stable.')
    ,('start',0,'Syntax: .start\n\nTeleport you to the starting area of your character.')
    ,('summon',1,'Syntax: .summon [$charactername]\n\nTeleport the given character to you. Character can be offline.')
    ,('taxicheat',1,'Syntax: .taxicheat on/off\n\nTemporary grant access or remove to all taxi routes for the selected character. If no character is selected, hide or reveal all routes to you.\n\nVisited taxi nodes sill accessible after removing access.')
    ,('tele add',3,'Syntax: .tele add $name\n\nAdd current your position to .tele command target locations list with name $name.')
    ,('tele del',3,'Syntax: .tele del $name\n\nRemove location with name $name for .tele command locations list.')
    ,('tele group',1,'Syntax: .tele group#location\n\nTeleport a selected player and his group members to a given location.')
    ,('tele name',1,'Syntax: .tele name [#playername] #location\n\nTeleport the given character to a given location. Character can be offline.')
    ,('tele',1,'Syntax: .tele #location\n\nTeleport player to a given location.')
    ,('ticket',2,'Syntax: .ticket on\n        .ticket off\n        .ticket #num\n        .ticket $character_name\n        .ticket respond #num $response\n        .ticket respond $character_name $response\n\non/off for GMs to show or not a new ticket directly, $character_name to show ticket of this character, #num to show ticket #num.')
    ,('trigger active',2,'Syntax: .trigger active\n\nShow list of areatriggers with activation zone including current character position.')
    ,('trigger near',2,'Syntax: .trigger near [#distance]\n\nOutput areatriggers at distance #distance from player. If #distance not provided use 10 as default value.')
    ,('trigger',2,'Syntax: .trigger [#trigger_id|$trigger_shift-link|$trigger_target_shift-link]\n\nShow detail infor about areatrigger with id #trigger_id or trigger id associated with shift-link. If areatrigger id or shift-link not provided then selected nearest areatrigger at current map.')
    ,('unaura',3,'Syntax: .unaura #spellid\n\nRemove aura due to spell #spellid from the selected Unit.')
    ,('unban account',3,'Syntax: .unban account $Name\nUnban accounts for account name pattern.')
    ,('unban character',3,'Syntax: .unban character $Name\nUnban accounts for character name pattern.')
    ,('unban ip',3,'Syntax : .unban ip $Ip\nUnban accounts for IP pattern.')
    ,('unlearn',3,'Syntax: .unlearn #spell [all]\n\nUnlearn for selected player a spell #spell.  If \'all\' provided then all ranks unlearned.')
    ,('unmute',1,'Syntax: .unmute $playerName\n\nRestore chat messaging for any character from account of character $playerName.')
    ,('waterwalk',2,'Syntax: .waterwalk on/off\n\nSet on/off waterwalk state for selected player.')
    ,('wchange',3,'Syntax: .wchange #weathertype #status\n\nSet current weather to #weathertype with an intensity of #status.\n\n#weathertype can be 1 for rain, 2 for snow, and 3 for sand. #status can be 0 for disabled, and 1 for enabled.')
    ,('whispers',1,'Syntax: .whispers on|off\nEnable/disable accepting whispers by GM from players. By default use mangosd.conf setting.')
    ,('wp add',2,'Syntax: .wp add [#creature_guid or Select a Creature]')
    ,('wp export',3,'Syntax: .wp export [#creature_guid or Select a Creature] $filename')
    ,('wp import',3,'Syntax: .wp import $filename')
    ,('wp modify',2,'Syntax: .wp modify [#creature_guid or Select a Creature]\nadd - Add a waypoint after the selected visual\nwaittime $time\nemote ID\nspell ID\ntext1| text2| text3| text4| text5 <text>\nmodel1 ID\nmodel2 ID\nmove(moves wp to player pos)\ndel (deletes the wp)\n\nOnly one parameter per time!')
    ,('wp show',2,'Syntax: .wp show [#creature_guid or Select a Creature]\nwhere command can have one of the following values\non (to show all related wp)\nfirst (to see only first one)\nlast (to see only last one)\noff (to hide all related wp)\ninfo (to get more info about theses wp)\n\nFor using info you have to do first show on and than select a Visual-Waypoint and do the show info!')
;

-- Insert item templates for start outfits -----------------------------------
INSERT INTO `item_template`
    (`entry`, `class`, `subclass`, `Quality`, `displayid`, `name`)
VALUES
     (25,    @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_SWORD_1H,         @ITEM_QUALITY_COMMON,    1542,  "Worn Shortsword")
    ,(35,    @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_STAFF,            @ITEM_QUALITY_COMMON,     472,  "Bent Staff")
    ,(36,    @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_MACE_1H,          @ITEM_QUALITY_COMMON,    5194,  "Worn Mace")
    ,(37,    @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_AXE_1H,           @ITEM_QUALITY_COMMON,   14029,  "Worn Axe")
    ,(38,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9891,  "Recruis Shirt")
    ,(39,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9892,  "Recruit's Pants")
    ,(40,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10141,  "Recruit's Boots")
    ,(43,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10272,  "Squire's Boots")
    ,(44,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9937,  "Squire's Pants")
    ,(45,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    3265,  "Squire's Shirt")
    ,(47,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9915,  "Footpad's Shoes")
    ,(48,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9913,  "Footpad's Pants")
    ,(49,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9906,  "Footpad's Shirt")
    ,(51,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9946,  "Neophyte's Boots")
    ,(52,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9945,  "Neophyte's Pants")
    ,(53,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9944,  "Neophyte's Shirt")
    ,(55,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9929,  "Apprentice's Boots")
    ,(56,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12647,  "Apprentice's Robe")
    ,(57,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12645,  "Acolyte's Robe")
    ,(59,    @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    3261,  "Acolyte's Shoes")
    ,(117,   @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    2473,  "Tough Jerky")
    ,(120,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     10006,  "Thug Pants")
    ,(121,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10008,  "Thug Boots")
    ,(127,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9996,  "Trapper's Shirt")
    ,(129,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9977,  "Rugged Trapper's Boots")
    ,(139,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9988,  "Brawler's Pants")
    ,(140,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9992,  "Brawler's Boots")
    ,(147,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9975,  "Rugged Trapper's Pants")
    ,(148,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9976,  "Rugged Trapper's Shirt")
    ,(153,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_LEATHER,           @ITEM_QUALITY_POOR,     10050,  "Primitive Kilt")
    ,(154,   @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10058,  "Primitive Mantle")
    ,(159,   @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,   18084,  "Refreshing Spring Water")
    ,(1395,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9924,  "Apprentice's Pants")
    ,(1396,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      3260,  "Acolyte's Pants")
    ,(2070,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    6353,  "Darnassian Bleu")
    ,(2092,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_DAGGER,           @ITEM_QUALITY_COMMON,    6442,  "Worn Dagger")
    ,(2101,  @ITEM_CLASS_QUIVER,        @ITEM_SUBCLASS_QUIVER_QUIVER,           @ITEM_QUALITY_COMMON,   21328,  "Light Quiver")
    ,(2102,  @ITEM_CLASS_QUIVER,        @ITEM_SUBCLASS_QUIVER_AMMO_POUCH,       @ITEM_QUALITY_COMMON,    1816,  "Small Ammo Pouch")
    ,(2105,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10005,  "Thug Shirt")
    ,(2361,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_MACE_2H,          @ITEM_QUALITY_COMMON,    8690,  "Battleworn Hammer")
    ,(2362,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_SHIELD,            @ITEM_QUALITY_POOR,     18730,  "Worn Wooden Shield")
    ,(2504,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_BOW,              @ITEM_QUALITY_COMMON,    8106,  "Worn Shortbow")
    ,(2508,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_GUN,              @ITEM_QUALITY_COMMON,    6606,  "Old Blunderbuss")
    ,(2512,  @ITEM_CLASS_PROJECTILE,    @ITEM_SUBCLASS_PROJECTILE_ARROW,        @ITEM_QUALITY_COMMON,    5996,  "Rough Arrow")
    ,(2516,  @ITEM_CLASS_PROJECTILE,    @ITEM_SUBCLASS_PROJECTILE_BULLET,       @ITEM_QUALITY_COMMON,    5998,  "Light Shot")
    ,(2947,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_THROWN,           @ITEM_QUALITY_COMMON,   16754,  "Small Throwing Knife")
    ,(3111,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_THROWN,           @ITEM_QUALITY_COMMON,   20777,  "Crude Throwing Axe")
    ,(3661,  @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_STAFF,            @ITEM_QUALITY_COMMON,   18530,  "Handcrafted Staff")
    ,(4536,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    6410,  "Shiny Red Apple")
    ,(4540,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    6399,  "Tough Hunk of Bread")
    ,(4604,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,   15852,  "Forest Mushroom Cap")
    ,(6096,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    2163,  "Apprentice's Shirt")
    ,(6097,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    2470,  "Acolyte's Shirt")
    ,(6098,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12679,  "Neophyte's Robe")
    ,(6116,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12648,  "Apprentice's Robe")
    ,(6117,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9972,  "Squire's Shirt")
    ,(6118,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9974,  "Squire's Pants")
    ,(6119,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12681,  "Neophyte's Robe")
    ,(6120,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9983,  "Recruit's Shirt")
    ,(6121,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9984,  "Recruit's Pants")
    ,(6122,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9985,  "Recruit's Boots")
    ,(6123,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12683,  "Novice's Robe")
    ,(6124,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,      9987,  "Novice's Pants")
    ,(6125,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,    9995,  "Brawler's Harness")
    ,(6126,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     10002,  "Trapper's Pants")
    ,(6127,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10003,  "Trapper's Boots")
    ,(6129,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12646,  "Acolyte's Robe")
    ,(6134,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10108,  "Primitive Mantle")
    ,(6135,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_LEATHER,           @ITEM_QUALITY_POOR,     10109,  "Primitive Kilt")
    ,(6136,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10112,  "Thug Shirt")
    ,(6137,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     10114,  "Thug Pants")
    ,(6138,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_MISCELLANEOUS,     @ITEM_QUALITY_COMMON,   10115,  "Thug Boots")
    ,(6139,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12684,  "Novice's Robe")
    ,(6140,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12649,  "Apprentice's Robe")
    ,(6144,  @ITEM_CLASS_ARMOR,         @ITEM_SUBCLASS_ARMOR_CLOTH,             @ITEM_QUALITY_POOR,     12680,  "Neophyte's Robe")
    ,(6948,  @ITEM_CLASS_MISCELLANEOUS, @ITEM_SUBCLASS_MISCELLANEOUS_JUNK,      @ITEM_QUALITY_COMMON,    6418,  "Hearthstone")
    ,(12282, @ITEM_CLASS_WEAPON,        @ITEM_SUBCLASS_WEAPON_AXE_2H,           @ITEM_QUALITY_COMMON,   22291,  "Worn Battleaxe")
;

-- Insert item templates for mailbox stationeries ----------------------------
INSERT INTO `item_template`
    (`entry`, `class`, `subclass`, `Quality`, `displayid`, `name`)
VALUES
     (8164,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    1069,  "Test Stationery")
    ,(9311,  @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    7798,  "Default Stationery")
    ,(18154, @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,   30658,  "Blizzard Stationery")
    ,(21140, @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,    1102,  "Auction Stationery")
    ,(22058, @ITEM_CLASS_CONSUMABLE,    @ITEM_SUBCLASS_CONSUMABLE_CONSUMABLE,   @ITEM_QUALITY_COMMON,   34508,  "Valentine's Day Stationery")
;

-- Adjust item properties for mailbox stationeries ---------------------------
UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `BuyPrice` = 10, `SellPrice` = 2, `stackable` = 10
WHERE `entry` = 8164;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP, `PageMaterial` = @PAGEMAT_PARCHMENT
WHERE `entry` = 9311;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP
WHERE `entry` = 18154;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP
WHERE `entry` = 21140;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP, `PageMaterial` = @PAGEMAT_VALENTINE
WHERE `entry` = 22058;

-- Adjust item properties for start outfits ----------------------------------
UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 35, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 1900,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 25;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 47, `SellPrice` = 9,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_OFFHAND
WHERE `entry` = 35;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 38, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 1900,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 36;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 38, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2000,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 37;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 38;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 39;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 40;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 43;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 44;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 45;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 47;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 48;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 49;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 51;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 52;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 53;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 55;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 56;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 57;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 59;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 433,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 11,
    `spellcategorycooldown_1` = 1000,
    `FoodType` = 1
WHERE `entry` = 117;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 120;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 121;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 127;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 129;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 139;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 140;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 147;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 148;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = 8,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 30,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 14
WHERE `entry` = 153;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 154;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 430,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 59,
    `spellcategorycooldown_1` = 1000
WHERE `entry` = 159;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 1395;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 1396;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 433,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 11,
    `spellcategorycooldown_1` = 1000,
    `FoodType` = 3
WHERE `entry` = 2070;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPON, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 16,
    `BuyPrice` = 35, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 1600,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 2092;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BAG,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1,
    `BagFamily` = 0, `ContainerSlots` = 6,
    `spellid_1` = 14824,
    `spelltrigger_1` = 1,
    `spellcharges_1` = 0,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1
WHERE `entry` = 2101;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BAG,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `BuyPrice` = 4,
    `SellPrice` = 1,
    `BagFamily` = 0, `ContainerSlots` = 6,
    `spellid_1` = 14824,
    `spelltrigger_1` = 1,
    `spellcharges_1` = 0,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1
WHERE `entry` = 2102;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 2105;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 45, `SellPrice` = 9,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_MAINHAND
WHERE `entry` = 2361;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_SHIELD, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 7, `SellPrice` = 1,
    `armor` = 5,
    `block` = 1,
    `sheath` = @SHEATHETYPE_LARGEWEAPONRIGHT
WHERE `entry` = 2362;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_RANGED, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 29, `SellPrice` = 5,
    `dmg_min1` = 2, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2300,
    `ammo_type` = 2, `RangedModRange` = 100
WHERE `entry` = 2504;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_RANGEDRIGHT, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 27, `SellPrice` = 5,
    `dmg_min1` = 2, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2300,
    `ammo_type` = 3, `RangedModRange` = 100
WHERE `entry` = 2508;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_AMMO, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 10, `stackable` = 200,
    `BagFamily` = 1, `ContainerSlots` = 0,
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 3000
WHERE `entry` = 2512;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_AMMO, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 10, `stackable` = 200,
    `BagFamily` = 2, `ContainerSlots` = 0,
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 3000
WHERE `entry` = 2516;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_THROWN, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 3, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 15, `stackable` = 200,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2000,
    `ammo_type` = 4, `RangedModRange` = 100
WHERE `entry` = 2947;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_THROWN, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 3, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 15, `stackable` = 200,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2000,
    `ammo_type` = 4, `RangedModRange` = 100
WHERE `entry` = 3111;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 45, `SellPrice` = 9,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_OFFHAND
WHERE `entry` = 3661;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 433,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 11,
    `spellcategorycooldown_1` = 1000,
    `FoodType` = 6
WHERE `entry` = 4536;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 433,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 11,
    `spellcategorycooldown_1` = 1000,
    `FoodType` = 4
WHERE `entry` = 4540;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 5, `BuyPrice` = 25, `SellPrice` = 1, `stackable` = 20,
    `spellid_1` = 433,
    `spelltrigger_1` = 0,
    `spellcharges_1` = -1,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = 0,
    `spellcategory_1` = 11,
    `spellcategorycooldown_1` = 1000,
    `FoodType` = 5
WHERE `entry` = 4604;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6096;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6097;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6098;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6116;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6117;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 6118;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6119;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6120;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 6121;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 6122;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6123;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 6124;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6125;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 6126;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 5, `SellPrice` = 1
WHERE `entry` = 6127;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6129;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 1, `SellPrice` = 1
WHERE `entry` = 6134;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = 8,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 30,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 14
WHERE `entry` = 6135;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_BODY, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 6136;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_LEGS, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 2
WHERE `entry` = 6137;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_FEET, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1,
    `BuyPrice` = 4, `SellPrice` = 1
WHERE `entry` = 6138;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6139;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 4, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6140;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_ROBE, `Material` = @MATERIAL_CLOTH,
    `ItemLevel` = 1, `RequiredLevel` = 1,
    `MaxDurability` = 35,
    `BuyPrice` = 5, `SellPrice` = 1,
    `armor` = 3
WHERE `entry` = 6144;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `ItemLevel` = 1,
    `maxcount` = 1,
    `spellid_1` = 8690,
    `spelltrigger_1` = 0,
    `spellcharges_1` = 0,
    `spellppmRate_1` = 0,
    `spellcooldown_1` = -1,
    `spellcategory_1` = 0,
    `spellcategorycooldown_1` = -1,
    `bonding` = @BIND_WHEN_PICKED_UP,
    `Flags` = @ITEM_FLAG_USABLE
WHERE `entry` = 6948;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 43, `SellPrice` = 8,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @SPELL_SCHOOL_NORMAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_MAINHAND
WHERE `entry` = 12282;

-- Insert creature model information for player characters -------------------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`)
VALUES
     (49,        0.306,             1.5,            @MODEL_GENDER_MALE,         50,         0)
    ,(50,        0.208,             1.5,            @MODEL_GENDER_FEMALE,       49,         0)
    ,(51,        0.372,             1.5,            @MODEL_GENDER_MALE,         52,         0)
    ,(52,        0.236,             1.5,            @MODEL_GENDER_FEMALE,       51,         0)
    ,(53,        0.347,             1.5,            @MODEL_GENDER_MALE,         54,         0)
    ,(54,        0.347,             1.5,            @MODEL_GENDER_FEMALE,       53,         0)
    ,(55,        0.389,             1.5,            @MODEL_GENDER_MALE,         56,         0)
    ,(56,        0.306,             1.5,            @MODEL_GENDER_FEMALE,       55,         0)
    ,(57,        0.383,             1.5,            @MODEL_GENDER_MALE,         58,         0)
    ,(58,        0.383,             1.5,            @MODEL_GENDER_FEMALE,       57,         0)
    ,(59,        0.9747,            1.5,            @MODEL_GENDER_MALE,         60,         0)
    ,(60,        0.8725,            1.5,            @MODEL_GENDER_FEMALE,       59,         0)
    ,(1478,      0.306,             1.5,            @MODEL_GENDER_MALE,         1479,       0)
    ,(1479,      0.306,             1.5,            @MODEL_GENDER_FEMALE,       1478,       0)
    ,(1563,      0.3519,            1.5,            @MODEL_GENDER_MALE,         1564,       0)
    ,(1564,      0.3519,            1.5,            @MODEL_GENDER_FEMALE,       1563,       0)
    -- Insert model information: these are creatures used mostly by game master --
    ,(262,       1,                 1,              @MODEL_GENDER_NONE,         0,          0)
    ,(5233,      0.5,               1.5,            @MODEL_GENDER_NONE,         0,          0)
    ,(7029,      1.806,             4,              @MODEL_GENDER_NONE,         0,          0)
    ,(10045,     1,                 1.5,            @MODEL_GENDER_NONE,         0,          0)
    -- Insert model information: these are creatures used by game systems --------
    ,(1566,      0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    ,(1825,      2,                 2.56,           @MODEL_GENDER_NONE,         0,          0)
    ,(1936,      0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    ,(6851,      0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    ,(6852,      0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    -- Insert model information: these are creatures summoned by Warlocks --------
    ,(169,       0.903,             2,              @MODEL_GENDER_NONE,         0,          0)
    ,(850,       0.2429,            1.05,           @MODEL_GENDER_NONE,         0,          0)
    ,(1132,      0.8,               2,              @MODEL_GENDER_NONE,         0,          0)
    ,(1912,      0.9168,            1.8,            @MODEL_GENDER_NONE,         0,          0)
    ,(2421,      1,                 1,              @MODEL_GENDER_NONE,         0,          0)
    ,(4162,      0.403,             1.5,            @MODEL_GENDER_NONE,         0,          0)
    ,(4449,      0.5,               0.75,           @MODEL_GENDER_NONE,         0,          0)
    -- Insert model information: these are forms assumed by Druids ---------------
    ,(892,       0.315,             1.35,           @MODEL_GENDER_NONE,         0,          0)
    ,(918,       0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    ,(1058,      0.91425,           1.725,          @MODEL_GENDER_NONE,         0,          0)
    ,(2281,      0.35,              1,              @MODEL_GENDER_NONE,         0,          0)
    ,(2289,      0.408,             1.2,            @MODEL_GENDER_NONE,         0,          0)
    ,(2428,      0,                 0,              @MODEL_GENDER_NONE,         0,          0)
    ,(15374,     2,                 1,              @MODEL_GENDER_NONE,         0,          0)
    ,(15375,     0,                 0,              @MODEL_GENDER_NONE,         0,          0)
;

-- Insert creation information for player characters -------------------------
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

-- Insert information for player characters and their spells -----------------
INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 196, 'One-Handed Axes')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 198, 'One-Handed Maces')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 201, 'One-Handed Swords')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_PALADIN, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 107, 'Block')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 198, 'One-Handed Maces')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 199, 'Two-Handed Maces')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 635, 'Holy Light')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 8737, 'Mail')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 9077, 'Leather')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 9116, 'Shield')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 21084, 'Seal of Righteousness')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 22810, 'Opening - No Text')
    ,(@RACE_HUMAN, @CLASS_PALADIN, 27762, 'Libram')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_PRIEST, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 198, 'One-Handed Maces')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 585, 'Smite')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 2050, 'Lesser Heal')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 5009, 'Wands')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 5019, 'Shoot')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_PRIEST, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_MAGE, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_MAGE, 133, 'Fireball')
    ,(@RACE_HUMAN, @CLASS_MAGE, 168, 'Frost Armor')
    ,(@RACE_HUMAN, @CLASS_MAGE, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_MAGE, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_MAGE, 227, 'Staves')
    ,(@RACE_HUMAN, @CLASS_MAGE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_MAGE, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_MAGE, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_MAGE, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_MAGE, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_MAGE, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_MAGE, 5009, 'Wands')
    ,(@RACE_HUMAN, @CLASS_MAGE, 5019, 'Shoot')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_MAGE, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_MAGE, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_MAGE, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_MAGE, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_MAGE, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_MAGE, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_MAGE, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_MAGE, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_MAGE, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_MAGE, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_MAGE, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_MAGE, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_MAGE, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_MAGE, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_MAGE, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_MAGE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_HUMAN, @CLASS_WARLOCK, 81, 'Dodge')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 203, 'Unarmed')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 204, 'Defense')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 668, 'Language Common')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 686, 'Shadow Bolt')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 687, 'Demon Skin')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 1180, 'Daggers')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 2382, 'Generic')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 2479, 'Honorless Target')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 3050, 'Detect')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 3365, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 5009, 'Wands')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 5019, 'Shoot')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6233, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6246, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6247, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6477, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6478, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6603, 'Attack')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 7266, 'Duel')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 7267, 'Grovel')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 7355, 'Stuck')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 8386, 'Attacking')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 9078, 'Cloth')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 9125, 'Generic')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20597, 'Sword Specialization')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20598, 'The Human Spirit')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20599, 'Diplomacy')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20600, 'Perception')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20864, 'Mace Specialization')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 21651, 'Opening')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 21652, 'Closing')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 22027, 'Remove Insignia')
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_ORC, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_ORC, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_ORC, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_ORC, @CLASS_WARRIOR, 196, 'One-Handed Axes')
    ,(@RACE_ORC, @CLASS_WARRIOR, 197, 'Two-Handed Axes')
    ,(@RACE_ORC, @CLASS_WARRIOR, 201, 'One-Handed Swords')
    ,(@RACE_ORC, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_ORC, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_ORC, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_ORC, @CLASS_WARRIOR, 669, 'Language Orcish')
    ,(@RACE_ORC, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_ORC, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_ORC, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_ORC, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_ORC, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_ORC, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_ORC, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_ORC, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_ORC, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_ORC, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_ORC, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_ORC, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_ORC, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_ORC, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_ORC, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_ORC, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_ORC, @CLASS_WARRIOR, 20572, 'Blood Fury')
    ,(@RACE_ORC, @CLASS_WARRIOR, 20573, 'Hardiness')
    ,(@RACE_ORC, @CLASS_WARRIOR, 20574, 'Axe Specialization')
    ,(@RACE_ORC, @CLASS_WARRIOR, 21563, 'Command')
    ,(@RACE_ORC, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_ORC, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_ORC, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_ORC, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_ORC, @CLASS_HUNTER, 75, 'Auto Shot')
    ,(@RACE_ORC, @CLASS_HUNTER, 81, 'Dodge')
    ,(@RACE_ORC, @CLASS_HUNTER, 196, 'One-Handed Axes')
    ,(@RACE_ORC, @CLASS_HUNTER, 203, 'Unarmed')
    ,(@RACE_ORC, @CLASS_HUNTER, 204, 'Defense')
    ,(@RACE_ORC, @CLASS_HUNTER, 264, 'Bows')
    ,(@RACE_ORC, @CLASS_HUNTER, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_ORC, @CLASS_HUNTER, 669, 'Language Orcish')
    ,(@RACE_ORC, @CLASS_HUNTER, 2382, 'Generic')
    ,(@RACE_ORC, @CLASS_HUNTER, 2479, 'Honorless Target')
    ,(@RACE_ORC, @CLASS_HUNTER, 2973, 'Raptor Strike')
    ,(@RACE_ORC, @CLASS_HUNTER, 3050, 'Detect')
    ,(@RACE_ORC, @CLASS_HUNTER, 3365, 'Opening')
    ,(@RACE_ORC, @CLASS_HUNTER, 6233, 'Closing')
    ,(@RACE_ORC, @CLASS_HUNTER, 6246, 'Closing')
    ,(@RACE_ORC, @CLASS_HUNTER, 6247, 'Opening')
    ,(@RACE_ORC, @CLASS_HUNTER, 6477, 'Opening')
    ,(@RACE_ORC, @CLASS_HUNTER, 6478, 'Opening')
    ,(@RACE_ORC, @CLASS_HUNTER, 6603, 'Attack')
    ,(@RACE_ORC, @CLASS_HUNTER, 7266, 'Duel')
    ,(@RACE_ORC, @CLASS_HUNTER, 7267, 'Grovel')
    ,(@RACE_ORC, @CLASS_HUNTER, 7355, 'Stuck')
    ,(@RACE_ORC, @CLASS_HUNTER, 8386, 'Attacking')
    ,(@RACE_ORC, @CLASS_HUNTER, 9077, 'Leather')
    ,(@RACE_ORC, @CLASS_HUNTER, 9078, 'Cloth')
    ,(@RACE_ORC, @CLASS_HUNTER, 9125, 'Generic')
    ,(@RACE_ORC, @CLASS_HUNTER, 13358, 'Defensive State (DND)')
    ,(@RACE_ORC, @CLASS_HUNTER, 20572, 'Blood Fury')
    ,(@RACE_ORC, @CLASS_HUNTER, 20573, 'Hardiness')
    ,(@RACE_ORC, @CLASS_HUNTER, 20574, 'Axe Specialization')
    ,(@RACE_ORC, @CLASS_HUNTER, 20576, 'Command')
    ,(@RACE_ORC, @CLASS_HUNTER, 21651, 'Opening')
    ,(@RACE_ORC, @CLASS_HUNTER, 21652, 'Closing')
    ,(@RACE_ORC, @CLASS_HUNTER, 22027, 'Remove Insignia')
    ,(@RACE_ORC, @CLASS_HUNTER, 22810, 'Opening - No Text')
    ,(@RACE_ORC, @CLASS_HUNTER, 24949, 'Defensive State 2 (DND)')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_ORC, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_ORC, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_ORC, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_ORC, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_ORC, @CLASS_ROGUE, 669, 'Language Orcish')
    ,(@RACE_ORC, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_ORC, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_ORC, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_ORC, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_ORC, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_ORC, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_ORC, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_ORC, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_ORC, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_ORC, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_ORC, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_ORC, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_ORC, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_ORC, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_ORC, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_ORC, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_ORC, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_ORC, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_ORC, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_ORC, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_ORC, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_ORC, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_ORC, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_ORC, @CLASS_ROGUE, 20572, 'Blood Fury')
    ,(@RACE_ORC, @CLASS_ROGUE, 20573, 'Hardiness')
    ,(@RACE_ORC, @CLASS_ROGUE, 20574, 'Axe Specialization')
    ,(@RACE_ORC, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_ORC, @CLASS_ROGUE, 21563, 'Command')
    ,(@RACE_ORC, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_ORC, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_ORC, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_ORC, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_ORC, @CLASS_SHAMAN, 81, 'Dodge')
    ,(@RACE_ORC, @CLASS_SHAMAN, 107, 'Block')
    ,(@RACE_ORC, @CLASS_SHAMAN, 198, 'One-Handed Maces')
    ,(@RACE_ORC, @CLASS_SHAMAN, 203, 'Unarmed')
    ,(@RACE_ORC, @CLASS_SHAMAN, 204, 'Defense')
    ,(@RACE_ORC, @CLASS_SHAMAN, 227, 'Staves')
    ,(@RACE_ORC, @CLASS_SHAMAN, 331, 'Healing Wave')
    ,(@RACE_ORC, @CLASS_SHAMAN, 403, 'Lightning Bolt')
    ,(@RACE_ORC, @CLASS_SHAMAN, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_ORC, @CLASS_SHAMAN, 669, 'Language Orcish')
    ,(@RACE_ORC, @CLASS_SHAMAN, 2382, 'Generic')
    ,(@RACE_ORC, @CLASS_SHAMAN, 2479, 'Honorless Target')
    ,(@RACE_ORC, @CLASS_SHAMAN, 3050, 'Detect')
    ,(@RACE_ORC, @CLASS_SHAMAN, 3365, 'Opening')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6233, 'Closing')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6246, 'Closing')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6247, 'Opening')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6477, 'Opening')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6478, 'Opening')
    ,(@RACE_ORC, @CLASS_SHAMAN, 6603, 'Attack')
    ,(@RACE_ORC, @CLASS_SHAMAN, 7266, 'Duel')
    ,(@RACE_ORC, @CLASS_SHAMAN, 7267, 'Grovel')
    ,(@RACE_ORC, @CLASS_SHAMAN, 7355, 'Stuck')
    ,(@RACE_ORC, @CLASS_SHAMAN, 8386, 'Attacking')
    ,(@RACE_ORC, @CLASS_SHAMAN, 9077, 'Leather')
    ,(@RACE_ORC, @CLASS_SHAMAN, 9078, 'Cloth')
    ,(@RACE_ORC, @CLASS_SHAMAN, 9116, 'Shield')
    ,(@RACE_ORC, @CLASS_SHAMAN, 9125, 'Generic')
    ,(@RACE_ORC, @CLASS_SHAMAN, 20572, 'Blood Fury')
    ,(@RACE_ORC, @CLASS_SHAMAN, 20573, 'Hardiness')
    ,(@RACE_ORC, @CLASS_SHAMAN, 20574, 'Axe Specialization')
    ,(@RACE_ORC, @CLASS_SHAMAN, 21563, 'Command')
    ,(@RACE_ORC, @CLASS_SHAMAN, 21651, 'Opening')
    ,(@RACE_ORC, @CLASS_SHAMAN, 21652, 'Closing')
    ,(@RACE_ORC, @CLASS_SHAMAN, 22027, 'Remove Insignia')
    ,(@RACE_ORC, @CLASS_SHAMAN, 22810, 'Opening - No Text')
    ,(@RACE_ORC, @CLASS_SHAMAN, 27763, 'Totem')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_ORC, @CLASS_WARLOCK, 81, 'Dodge')
    ,(@RACE_ORC, @CLASS_WARLOCK, 203, 'Unarmed')
    ,(@RACE_ORC, @CLASS_WARLOCK, 204, 'Defense')
    ,(@RACE_ORC, @CLASS_WARLOCK, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_ORC, @CLASS_WARLOCK, 669, 'Language Orcish')
    ,(@RACE_ORC, @CLASS_WARLOCK, 686, 'Shadow Bolt')
    ,(@RACE_ORC, @CLASS_WARLOCK, 687, 'Demon Skin')
    ,(@RACE_ORC, @CLASS_WARLOCK, 1180, 'Daggers')
    ,(@RACE_ORC, @CLASS_WARLOCK, 2382, 'Generic')
    ,(@RACE_ORC, @CLASS_WARLOCK, 2479, 'Honorless Target')
    ,(@RACE_ORC, @CLASS_WARLOCK, 3050, 'Detect')
    ,(@RACE_ORC, @CLASS_WARLOCK, 3365, 'Opening')
    ,(@RACE_ORC, @CLASS_WARLOCK, 5009, 'Wands')
    ,(@RACE_ORC, @CLASS_WARLOCK, 5019, 'Shoot')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6233, 'Closing')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6246, 'Closing')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6247, 'Opening')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6477, 'Opening')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6478, 'Opening')
    ,(@RACE_ORC, @CLASS_WARLOCK, 6603, 'Attack')
    ,(@RACE_ORC, @CLASS_WARLOCK, 7266, 'Duel')
    ,(@RACE_ORC, @CLASS_WARLOCK, 7267, 'Grovel')
    ,(@RACE_ORC, @CLASS_WARLOCK, 7355, 'Stuck')
    ,(@RACE_ORC, @CLASS_WARLOCK, 8386, 'Attacking')
    ,(@RACE_ORC, @CLASS_WARLOCK, 9078, 'Cloth')
    ,(@RACE_ORC, @CLASS_WARLOCK, 9125, 'Generic')
    ,(@RACE_ORC, @CLASS_WARLOCK, 20572, 'Blood Fury')
    ,(@RACE_ORC, @CLASS_WARLOCK, 20573, 'Hardiness')
    ,(@RACE_ORC, @CLASS_WARLOCK, 20574, 'Axe Specialization')
    ,(@RACE_ORC, @CLASS_WARLOCK, 20575, 'Command')
    ,(@RACE_ORC, @CLASS_WARLOCK, 21651, 'Opening')
    ,(@RACE_ORC, @CLASS_WARLOCK, 21652, 'Closing')
    ,(@RACE_ORC, @CLASS_WARLOCK, 22027, 'Remove Insignia')
    ,(@RACE_ORC, @CLASS_WARLOCK, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_DWARF, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 196, 'One-Handed Axes')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 197, 'Two-Handed Axes')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 198, 'One-Handed Maces')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 668, 'Language Common')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 672, 'Language Dwarven')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 2481, 'Find Treasure')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 20594, 'Stoneform')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 20595, 'Gun Specialization')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 20596, 'Frost Resistance')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_DWARF, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_DWARF, @CLASS_PALADIN, 81, 'Dodge')
    ,(@RACE_DWARF, @CLASS_PALADIN, 107, 'Block')
    ,(@RACE_DWARF, @CLASS_PALADIN, 198, 'One-Handed Maces')
    ,(@RACE_DWARF, @CLASS_PALADIN, 199, 'Two-Handed Maces')
    ,(@RACE_DWARF, @CLASS_PALADIN, 203, 'Unarmed')
    ,(@RACE_DWARF, @CLASS_PALADIN, 204, 'Defense')
    ,(@RACE_DWARF, @CLASS_PALADIN, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_DWARF, @CLASS_PALADIN, 635, 'Holy Light')
    ,(@RACE_DWARF, @CLASS_PALADIN, 668, 'Language Common')
    ,(@RACE_DWARF, @CLASS_PALADIN, 672, 'Language Dwarven')
    ,(@RACE_DWARF, @CLASS_PALADIN, 2382, 'Generic')
    ,(@RACE_DWARF, @CLASS_PALADIN, 2479, 'Honorless Target')
    ,(@RACE_DWARF, @CLASS_PALADIN, 2481, 'Find Treasure')
    ,(@RACE_DWARF, @CLASS_PALADIN, 3050, 'Detect')
    ,(@RACE_DWARF, @CLASS_PALADIN, 3365, 'Opening')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6233, 'Closing')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6246, 'Closing')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6247, 'Opening')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6477, 'Opening')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6478, 'Opening')
    ,(@RACE_DWARF, @CLASS_PALADIN, 6603, 'Attack')
    ,(@RACE_DWARF, @CLASS_PALADIN, 7266, 'Duel')
    ,(@RACE_DWARF, @CLASS_PALADIN, 7267, 'Grovel')
    ,(@RACE_DWARF, @CLASS_PALADIN, 7355, 'Stuck')
    ,(@RACE_DWARF, @CLASS_PALADIN, 8386, 'Attacking')
    ,(@RACE_DWARF, @CLASS_PALADIN, 8737, 'Mail')
    ,(@RACE_DWARF, @CLASS_PALADIN, 9077, 'Leather')
    ,(@RACE_DWARF, @CLASS_PALADIN, 9078, 'Cloth')
    ,(@RACE_DWARF, @CLASS_PALADIN, 9116, 'Shield')
    ,(@RACE_DWARF, @CLASS_PALADIN, 9125, 'Generic')
    ,(@RACE_DWARF, @CLASS_PALADIN, 20594, 'Stoneform')
    ,(@RACE_DWARF, @CLASS_PALADIN, 20595, 'Gun Specialization')
    ,(@RACE_DWARF, @CLASS_PALADIN, 20596, 'Frost Resistance')
    ,(@RACE_DWARF, @CLASS_PALADIN, 21084, 'Seal of Righteousness')
    ,(@RACE_DWARF, @CLASS_PALADIN, 21651, 'Opening')
    ,(@RACE_DWARF, @CLASS_PALADIN, 21652, 'Closing')
    ,(@RACE_DWARF, @CLASS_PALADIN, 22027, 'Remove Insignia')
    ,(@RACE_DWARF, @CLASS_PALADIN, 22810, 'Opening - No Text')
    ,(@RACE_DWARF, @CLASS_PALADIN, 27762, 'Libram')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_DWARF, @CLASS_HUNTER, 75, 'Auto Shot')
    ,(@RACE_DWARF, @CLASS_HUNTER, 81, 'Dodge')
    ,(@RACE_DWARF, @CLASS_HUNTER, 196, 'One-Handed Axes')
    ,(@RACE_DWARF, @CLASS_HUNTER, 203, 'Unarmed')
    ,(@RACE_DWARF, @CLASS_HUNTER, 204, 'Defense')
    ,(@RACE_DWARF, @CLASS_HUNTER, 266, 'Guns')
    ,(@RACE_DWARF, @CLASS_HUNTER, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_DWARF, @CLASS_HUNTER, 668, 'Language Common')
    ,(@RACE_DWARF, @CLASS_HUNTER, 672, 'Language Dwarven')
    ,(@RACE_DWARF, @CLASS_HUNTER, 2382, 'Generic')
    ,(@RACE_DWARF, @CLASS_HUNTER, 2479, 'Honorless Target')
    ,(@RACE_DWARF, @CLASS_HUNTER, 2481, 'Find Treasure')
    ,(@RACE_DWARF, @CLASS_HUNTER, 2973, 'Raptor Strike')
    ,(@RACE_DWARF, @CLASS_HUNTER, 3050, 'Detect')
    ,(@RACE_DWARF, @CLASS_HUNTER, 3365, 'Opening')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6233, 'Closing')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6246, 'Closing')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6247, 'Opening')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6477, 'Opening')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6478, 'Opening')
    ,(@RACE_DWARF, @CLASS_HUNTER, 6603, 'Attack')
    ,(@RACE_DWARF, @CLASS_HUNTER, 7266, 'Duel')
    ,(@RACE_DWARF, @CLASS_HUNTER, 7267, 'Grovel')
    ,(@RACE_DWARF, @CLASS_HUNTER, 7355, 'Stuck')
    ,(@RACE_DWARF, @CLASS_HUNTER, 8386, 'Attacking')
    ,(@RACE_DWARF, @CLASS_HUNTER, 9077, 'Leather')
    ,(@RACE_DWARF, @CLASS_HUNTER, 9078, 'Cloth')
    ,(@RACE_DWARF, @CLASS_HUNTER, 9125, 'Generic')
    ,(@RACE_DWARF, @CLASS_HUNTER, 13358, 'Defensive State (DND)')
    ,(@RACE_DWARF, @CLASS_HUNTER, 20594, 'Stoneform')
    ,(@RACE_DWARF, @CLASS_HUNTER, 20595, 'Gun Specialization')
    ,(@RACE_DWARF, @CLASS_HUNTER, 20596, 'Frost Resistance')
    ,(@RACE_DWARF, @CLASS_HUNTER, 21651, 'Opening')
    ,(@RACE_DWARF, @CLASS_HUNTER, 21652, 'Closing')
    ,(@RACE_DWARF, @CLASS_HUNTER, 22027, 'Remove Insignia')
    ,(@RACE_DWARF, @CLASS_HUNTER, 22810, 'Opening - No Text')
    ,(@RACE_DWARF, @CLASS_HUNTER, 24949, 'Defensive State 2 (DND)')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_DWARF, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_DWARF, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_DWARF, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_DWARF, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_DWARF, @CLASS_ROGUE, 668, 'Language Common')
    ,(@RACE_DWARF, @CLASS_ROGUE, 672, 'Language Dwarven')
    ,(@RACE_DWARF, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_DWARF, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2481, 'Find Treasure')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_DWARF, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_DWARF, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_DWARF, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_DWARF, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_DWARF, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_DWARF, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_DWARF, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_DWARF, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_DWARF, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_DWARF, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_DWARF, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_DWARF, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_DWARF, @CLASS_ROGUE, 20594, 'Stoneform')
    ,(@RACE_DWARF, @CLASS_ROGUE, 20595, 'Gun Specialization')
    ,(@RACE_DWARF, @CLASS_ROGUE, 20596, 'Frost Resistance')
    ,(@RACE_DWARF, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_DWARF, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_DWARF, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_DWARF, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_DWARF, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_DWARF, @CLASS_PRIEST, 81, 'Dodge')
    ,(@RACE_DWARF, @CLASS_PRIEST, 198, 'One-Handed Maces')
    ,(@RACE_DWARF, @CLASS_PRIEST, 203, 'Unarmed')
    ,(@RACE_DWARF, @CLASS_PRIEST, 204, 'Defense')
    ,(@RACE_DWARF, @CLASS_PRIEST, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_DWARF, @CLASS_PRIEST, 585, 'Smite')
    ,(@RACE_DWARF, @CLASS_PRIEST, 668, 'Language Common')
    ,(@RACE_DWARF, @CLASS_PRIEST, 672, 'Language Dwarven')
    ,(@RACE_DWARF, @CLASS_PRIEST, 2050, 'Lesser Heal')
    ,(@RACE_DWARF, @CLASS_PRIEST, 2382, 'Generic')
    ,(@RACE_DWARF, @CLASS_PRIEST, 2479, 'Honorless Target')
    ,(@RACE_DWARF, @CLASS_PRIEST, 2481, 'Find Treasure')
    ,(@RACE_DWARF, @CLASS_PRIEST, 3050, 'Detect')
    ,(@RACE_DWARF, @CLASS_PRIEST, 3365, 'Opening')
    ,(@RACE_DWARF, @CLASS_PRIEST, 5009, 'Wands')
    ,(@RACE_DWARF, @CLASS_PRIEST, 5019, 'Shoot')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6233, 'Closing')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6246, 'Closing')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6247, 'Opening')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6477, 'Opening')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6478, 'Opening')
    ,(@RACE_DWARF, @CLASS_PRIEST, 6603, 'Attack')
    ,(@RACE_DWARF, @CLASS_PRIEST, 7266, 'Duel')
    ,(@RACE_DWARF, @CLASS_PRIEST, 7267, 'Grovel')
    ,(@RACE_DWARF, @CLASS_PRIEST, 7355, 'Stuck')
    ,(@RACE_DWARF, @CLASS_PRIEST, 8386, 'Attacking')
    ,(@RACE_DWARF, @CLASS_PRIEST, 9078, 'Cloth')
    ,(@RACE_DWARF, @CLASS_PRIEST, 9125, 'Generic')
    ,(@RACE_DWARF, @CLASS_PRIEST, 20594, 'Stoneform')
    ,(@RACE_DWARF, @CLASS_PRIEST, 20595, 'Gun Specialization')
    ,(@RACE_DWARF, @CLASS_PRIEST, 20596, 'Frost Resistance')
    ,(@RACE_DWARF, @CLASS_PRIEST, 21651, 'Opening')
    ,(@RACE_DWARF, @CLASS_PRIEST, 21652, 'Closing')
    ,(@RACE_DWARF, @CLASS_PRIEST, 22027, 'Remove Insignia')
    ,(@RACE_DWARF, @CLASS_PRIEST, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 198, 'One-Handed Maces')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 201, 'One-Handed Swords')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 668, 'Language Common')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 671, 'Language Darnassian')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 1180, 'Daggers')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 20580, 'Shadowmeld')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 20582, 'Quickness')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 20583, 'Nature Resistance')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 20585, 'Wisp Spirit')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 21009, 'Shadowmeld Passive')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_HUNTER, 75, 'Auto Shot')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 81, 'Dodge')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 203, 'Unarmed')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 204, 'Defense')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 264, 'Bows')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 668, 'Language Common')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 671, 'Language Darnassian')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 1180, 'Daggers')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 2382, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 2479, 'Honorless Target')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 2973, 'Raptor Strike')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 3050, 'Detect')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 3365, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6233, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6246, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6247, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6477, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6478, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6603, 'Attack')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 7266, 'Duel')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 7267, 'Grovel')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 7355, 'Stuck')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 8386, 'Attacking')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 9077, 'Leather')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 9078, 'Cloth')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 9125, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 13358, 'Defensive State (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 20580, 'Shadowmeld')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 20582, 'Quickness')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 20583, 'Nature Resistance')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 20585, 'Wisp Spirit')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 21009, 'Shadowmeld Passive')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 21651, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 21652, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 22027, 'Remove Insignia')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 22810, 'Opening - No Text')
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 24949, 'Defensive State 2 (DND)')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 668, 'Language Common')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 671, 'Language Darnassian')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 20580, 'Shadowmeld')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 20582, 'Quickness')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 20583, 'Nature Resistance')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 20585, 'Wisp Spirit')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 21009, 'Shadowmeld Passive')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_PRIEST, 81, 'Dodge')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 198, 'One-Handed Maces')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 203, 'Unarmed')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 204, 'Defense')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 585, 'Smite')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 668, 'Language Common')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 671, 'Language Darnassian')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 2050, 'Lesser Heal')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 2382, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 2479, 'Honorless Target')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 3050, 'Detect')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 3365, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 5009, 'Wands')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 5019, 'Shoot')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6233, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6246, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6247, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6477, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6478, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6603, 'Attack')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 7266, 'Duel')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 7267, 'Grovel')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 7355, 'Stuck')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 8386, 'Attacking')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 9078, 'Cloth')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 9125, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 20580, 'Shadowmeld')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 20582, 'Quickness')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 20583, 'Nature Resistance')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 20585, 'Wisp Spirit')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 21009, 'Shadowmeld Passive')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 21651, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 21652, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 22027, 'Remove Insignia')
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_DRUID, 81, 'Dodge')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 203, 'Unarmed')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 204, 'Defense')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 227, 'Staves')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 668, 'Language Common')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 671, 'Language Darnassian')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 1180, 'Daggers')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 2382, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 2479, 'Honorless Target')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 3050, 'Detect')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 3365, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 5176, 'Wrath')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 5185, 'Healing Touch')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6233, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6246, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6247, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6477, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6478, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6603, 'Attack')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 7266, 'Duel')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 7267, 'Grovel')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 7355, 'Stuck')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 8386, 'Attacking')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 9077, 'Leather')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 9078, 'Cloth')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 9125, 'Generic')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 20580, 'Shadowmeld')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 20582, 'Quickness')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 20583, 'Nature Resistance')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 20585, 'Wisp Spirit')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 21009, 'Shadowmeld Passive')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 21651, 'Opening')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 21652, 'Closing')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 22027, 'Remove Insignia')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 22810, 'Opening - No Text')
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 27764, 'Fetish')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_UNDEAD, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 201, 'One-Handed Swords')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 202, 'Two-Handed Swords')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 669, 'Language Orcish')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 1180, 'Daggers')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 5227, 'Underwater Breathing')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 7744, 'Will of the Forsaken')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 17737, 'Language Gutterspeak')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 20577, 'Cannibalize')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 20579, 'Shadow Resistance')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_UNDEAD, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 669, 'Language Orcish')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 5227, 'Underwater Breathing')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 7744, 'Will of the Forsaken')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 17737, 'Language Gutterspeak')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 20577, 'Cannibalize')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 20579, 'Shadow Resistance')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_UNDEAD, @CLASS_PRIEST, 81, 'Dodge')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 198, 'One-Handed Maces')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 203, 'Unarmed')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 204, 'Defense')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 585, 'Smite')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 669, 'Language Orcish')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 2050, 'Lesser Heal')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 2382, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 2479, 'Honorless Target')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 3050, 'Detect')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 3365, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 5009, 'Wands')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 5019, 'Shoot')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 5227, 'Underwater Breathing')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6233, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6246, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6247, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6477, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6478, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6603, 'Attack')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 7266, 'Duel')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 7267, 'Grovel')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 7355, 'Stuck')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 7744, 'Will of the Forsaken')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 8386, 'Attacking')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 9078, 'Cloth')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 9125, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 17737, 'Language Gutterspeak')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 20577, 'Cannibalize')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 20579, 'Shadow Resistance')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 21651, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 21652, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 22027, 'Remove Insignia')
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_UNDEAD, @CLASS_MAGE, 81, 'Dodge')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 133, 'Fireball')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 168, 'Frost Armor')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 203, 'Unarmed')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 204, 'Defense')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 227, 'Staves')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 669, 'Language Orcish')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 2382, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 2479, 'Honorless Target')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 3050, 'Detect')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 3365, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 5009, 'Wands')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 5019, 'Shoot')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 5227, 'Underwater Breathing')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6233, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6246, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6247, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6477, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6478, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6603, 'Attack')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 7266, 'Duel')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 7267, 'Grovel')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 7355, 'Stuck')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 7744, 'Will of the Forsaken')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 8386, 'Attacking')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 9078, 'Cloth')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 9125, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 17737, 'Language Gutterspeak')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 20577, 'Cannibalize')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 20579, 'Shadow Resistance')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 21651, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 21652, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 22027, 'Remove Insignia')
    ,(@RACE_UNDEAD, @CLASS_MAGE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_UNDEAD, @CLASS_WARLOCK, 81, 'Dodge')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 203, 'Unarmed')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 204, 'Defense')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 669, 'Language Orcish')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 686, 'Shadow Bolt')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 687, 'Demon Skin')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 1180, 'Daggers')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 2382, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 2479, 'Honorless Target')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 3050, 'Detect')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 3365, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 5009, 'Wands')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 5019, 'Shoot')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 5227, 'Underwater Breathing')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6233, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6246, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6247, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6477, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6478, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6603, 'Attack')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 7266, 'Duel')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 7267, 'Grovel')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 7355, 'Stuck')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 7744, 'Will of the Forsaken')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 8386, 'Attacking')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 9078, 'Cloth')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 9125, 'Generic')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 17737, 'Language Gutterspeak')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 20577, 'Cannibalize')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 20579, 'Shadow Resistance')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 21651, 'Opening')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 21652, 'Closing')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 22027, 'Remove Insignia')
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TAUREN, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 196, 'One-Handed Axes')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 198, 'One-Handed Maces')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 199, 'Two-Handed Maces')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 669, 'Language Orcish')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 670, 'Language Taurahe')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 20549, 'War Stomp')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 20550, 'Endurance')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 20551, 'Nature Resistance')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 20552, 'Cultivation')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TAUREN, @CLASS_HUNTER, 75, 'Auto Shot')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 81, 'Dodge')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 196, 'One-Handed Axes')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 203, 'Unarmed')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 204, 'Defense')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 266, 'Guns')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 669, 'Language Orcish')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 670, 'Language Taurahe')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 2382, 'Generic')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 2479, 'Honorless Target')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 2973, 'Raptor Strike')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 3050, 'Detect')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 3365, 'Opening')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6233, 'Closing')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6246, 'Closing')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6247, 'Opening')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6477, 'Opening')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6478, 'Opening')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6603, 'Attack')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 7266, 'Duel')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 7267, 'Grovel')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 7355, 'Stuck')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 8386, 'Attacking')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 9077, 'Leather')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 9078, 'Cloth')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 9125, 'Generic')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 13358, 'Defensive State (DND)')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 20549, 'War Stomp')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 20550, 'Endurance')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 20551, 'Nature Resistance')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 20552, 'Cultivation')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 21651, 'Opening')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 21652, 'Closing')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 22027, 'Remove Insignia')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 22810, 'Opening - No Text')
    ,(@RACE_TAUREN, @CLASS_HUNTER, 24949, 'Defensive State 2 (DND)')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TAUREN, @CLASS_SHAMAN, 81, 'Dodge')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 107, 'Block')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 198, 'One-Handed Maces')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 203, 'Unarmed')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 204, 'Defense')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 227, 'Staves')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 331, 'Healing Wave')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 403, 'Lightning Bolt')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 669, 'Language Orcish')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 670, 'Language Taurahe')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 2382, 'Generic')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 2479, 'Honorless Target')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 3050, 'Detect')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 3365, 'Opening')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6233, 'Closing')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6246, 'Closing')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6247, 'Opening')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6477, 'Opening')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6478, 'Opening')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6603, 'Attack')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 7266, 'Duel')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 7267, 'Grovel')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 7355, 'Stuck')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 8386, 'Attacking')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 9077, 'Leather')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 9078, 'Cloth')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 9116, 'Shield')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 9125, 'Generic')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 20549, 'War Stomp')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 20550, 'Endurance')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 20551, 'Nature Resistance')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 20552, 'Cultivation')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 21651, 'Opening')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 21652, 'Closing')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 22027, 'Remove Insignia')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 22810, 'Opening - No Text')
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 27763, 'Totem')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TAUREN, @CLASS_DRUID, 81, 'Dodge')
    ,(@RACE_TAUREN, @CLASS_DRUID, 198, 'One-Handed Maces')
    ,(@RACE_TAUREN, @CLASS_DRUID, 203, 'Unarmed')
    ,(@RACE_TAUREN, @CLASS_DRUID, 204, 'Defense')
    ,(@RACE_TAUREN, @CLASS_DRUID, 227, 'Staves')
    ,(@RACE_TAUREN, @CLASS_DRUID, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TAUREN, @CLASS_DRUID, 669, 'Language Orcish')
    ,(@RACE_TAUREN, @CLASS_DRUID, 670, 'Language Taurahe')
    ,(@RACE_TAUREN, @CLASS_DRUID, 2382, 'Generic')
    ,(@RACE_TAUREN, @CLASS_DRUID, 2479, 'Honorless Target')
    ,(@RACE_TAUREN, @CLASS_DRUID, 3050, 'Detect')
    ,(@RACE_TAUREN, @CLASS_DRUID, 3365, 'Opening')
    ,(@RACE_TAUREN, @CLASS_DRUID, 5176, 'Wrath')
    ,(@RACE_TAUREN, @CLASS_DRUID, 5185, 'Healing Touch')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6233, 'Closing')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6246, 'Closing')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6247, 'Opening')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6477, 'Opening')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6478, 'Opening')
    ,(@RACE_TAUREN, @CLASS_DRUID, 6603, 'Attack')
    ,(@RACE_TAUREN, @CLASS_DRUID, 7266, 'Duel')
    ,(@RACE_TAUREN, @CLASS_DRUID, 7267, 'Grovel')
    ,(@RACE_TAUREN, @CLASS_DRUID, 7355, 'Stuck')
    ,(@RACE_TAUREN, @CLASS_DRUID, 8386, 'Attacking')
    ,(@RACE_TAUREN, @CLASS_DRUID, 9077, 'Leather')
    ,(@RACE_TAUREN, @CLASS_DRUID, 9078, 'Cloth')
    ,(@RACE_TAUREN, @CLASS_DRUID, 9125, 'Generic')
    ,(@RACE_TAUREN, @CLASS_DRUID, 20549, 'War Stomp')
    ,(@RACE_TAUREN, @CLASS_DRUID, 20550, 'Endurance')
    ,(@RACE_TAUREN, @CLASS_DRUID, 20551, 'Nature Resistance')
    ,(@RACE_TAUREN, @CLASS_DRUID, 20552, 'Cultivation')
    ,(@RACE_TAUREN, @CLASS_DRUID, 21651, 'Opening')
    ,(@RACE_TAUREN, @CLASS_DRUID, 21652, 'Closing')
    ,(@RACE_TAUREN, @CLASS_DRUID, 22027, 'Remove Insignia')
    ,(@RACE_TAUREN, @CLASS_DRUID, 22810, 'Opening - No Text')
    ,(@RACE_TAUREN, @CLASS_DRUID, 27764, 'Fetish')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_GNOME, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 198, 'One-Handed Maces')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 201, 'One-Handed Swords')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 668, 'Language Common')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 1180, 'Daggers')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 7340, 'Language Gnomish')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 20589, 'Escape Artist')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 20591, 'Expansive Mind')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 20592, 'Arcane Resistance')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 20593, 'Engineering Specialization')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_GNOME, @CLASS_WARRIOR, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_GNOME, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_GNOME, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_GNOME, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_GNOME, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_GNOME, @CLASS_ROGUE, 668, 'Language Common')
    ,(@RACE_GNOME, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_GNOME, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_GNOME, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_GNOME, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_GNOME, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_GNOME, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_GNOME, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_GNOME, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_GNOME, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_GNOME, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_GNOME, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_GNOME, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_GNOME, @CLASS_ROGUE, 7340, 'Language Gnomish')
    ,(@RACE_GNOME, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_GNOME, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_GNOME, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_GNOME, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_GNOME, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_GNOME, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_GNOME, @CLASS_ROGUE, 20589, 'Escape Artist')
    ,(@RACE_GNOME, @CLASS_ROGUE, 20591, 'Expansive Mind')
    ,(@RACE_GNOME, @CLASS_ROGUE, 20592, 'Arcane Resistance')
    ,(@RACE_GNOME, @CLASS_ROGUE, 20593, 'Engineering Specialization')
    ,(@RACE_GNOME, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_GNOME, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_GNOME, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_GNOME, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_GNOME, @CLASS_ROGUE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_GNOME, @CLASS_MAGE, 81, 'Dodge')
    ,(@RACE_GNOME, @CLASS_MAGE, 133, 'Fireball')
    ,(@RACE_GNOME, @CLASS_MAGE, 168, 'Frost Armor')
    ,(@RACE_GNOME, @CLASS_MAGE, 203, 'Unarmed')
    ,(@RACE_GNOME, @CLASS_MAGE, 204, 'Defense')
    ,(@RACE_GNOME, @CLASS_MAGE, 227, 'Staves')
    ,(@RACE_GNOME, @CLASS_MAGE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_GNOME, @CLASS_MAGE, 668, 'Language Common')
    ,(@RACE_GNOME, @CLASS_MAGE, 2382, 'Generic')
    ,(@RACE_GNOME, @CLASS_MAGE, 2479, 'Honorless Target')
    ,(@RACE_GNOME, @CLASS_MAGE, 3050, 'Detect')
    ,(@RACE_GNOME, @CLASS_MAGE, 3365, 'Opening')
    ,(@RACE_GNOME, @CLASS_MAGE, 5009, 'Wands')
    ,(@RACE_GNOME, @CLASS_MAGE, 5019, 'Shoot')
    ,(@RACE_GNOME, @CLASS_MAGE, 6233, 'Closing')
    ,(@RACE_GNOME, @CLASS_MAGE, 6246, 'Closing')
    ,(@RACE_GNOME, @CLASS_MAGE, 6247, 'Opening')
    ,(@RACE_GNOME, @CLASS_MAGE, 6477, 'Opening')
    ,(@RACE_GNOME, @CLASS_MAGE, 6478, 'Opening')
    ,(@RACE_GNOME, @CLASS_MAGE, 6603, 'Attack')
    ,(@RACE_GNOME, @CLASS_MAGE, 7266, 'Duel')
    ,(@RACE_GNOME, @CLASS_MAGE, 7267, 'Grovel')
    ,(@RACE_GNOME, @CLASS_MAGE, 7340, 'Language Gnomish')
    ,(@RACE_GNOME, @CLASS_MAGE, 7355, 'Stuck')
    ,(@RACE_GNOME, @CLASS_MAGE, 8386, 'Attacking')
    ,(@RACE_GNOME, @CLASS_MAGE, 9078, 'Cloth')
    ,(@RACE_GNOME, @CLASS_MAGE, 9125, 'Generic')
    ,(@RACE_GNOME, @CLASS_MAGE, 20589, 'Escape Artist')
    ,(@RACE_GNOME, @CLASS_MAGE, 20591, 'Expansive Mind')
    ,(@RACE_GNOME, @CLASS_MAGE, 20592, 'Arcane Resistance')
    ,(@RACE_GNOME, @CLASS_MAGE, 20593, 'Engineering Specialization')
    ,(@RACE_GNOME, @CLASS_MAGE, 21651, 'Opening')
    ,(@RACE_GNOME, @CLASS_MAGE, 21652, 'Closing')
    ,(@RACE_GNOME, @CLASS_MAGE, 22027, 'Remove Insignia')
    ,(@RACE_GNOME, @CLASS_MAGE, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_GNOME, @CLASS_WARLOCK, 81, 'Dodge')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 203, 'Unarmed')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 204, 'Defense')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 668, 'Language Common')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 686, 'Shadow Bolt')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 687, 'Demon Skin')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 1180, 'Daggers')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 2382, 'Generic')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 2479, 'Honorless Target')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 3050, 'Detect')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 3365, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 5009, 'Wands')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 5019, 'Shoot')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6233, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6246, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6247, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6477, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6478, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6603, 'Attack')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 7266, 'Duel')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 7267, 'Grovel')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 7340, 'Language Gnomish')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 7355, 'Stuck')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 8386, 'Attacking')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 9078, 'Cloth')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 9125, 'Generic')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 20589, 'Escape Artist')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 20591, 'Expansive Mind')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 20592, 'Arcane Resistance')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 20593, 'Engineering Specialization')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 21651, 'Opening')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 21652, 'Closing')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 22027, 'Remove Insignia')
    ,(@RACE_GNOME, @CLASS_WARLOCK, 22810, 'Opening - No Text')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_WARRIOR, 78, 'Heroic Strike')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 107, 'Block')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 196, 'One-Handed Axes')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 1180, 'Daggers')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2457, 'Battle Stance')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2567, 'Thrown')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2764, 'Throw')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 5301, 'Defensive State (DND)')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 8737, 'Mail')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 9077, 'Leather')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 9116, 'Shield')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 26290, 'Bow Specialization')
    ,(@RACE_TROLL, @CLASS_WARRIOR, 26296, 'Berserking')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_HUNTER, 75, 'Auto Shot')
    ,(@RACE_TROLL, @CLASS_HUNTER, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_HUNTER, 196, 'One-Handed Axes')
    ,(@RACE_TROLL, @CLASS_HUNTER, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_HUNTER, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_HUNTER, 264, 'Bows')
    ,(@RACE_TROLL, @CLASS_HUNTER, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_HUNTER, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_HUNTER, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_HUNTER, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_HUNTER, 2973, 'Raptor Strike')
    ,(@RACE_TROLL, @CLASS_HUNTER, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_HUNTER, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_HUNTER, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_HUNTER, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_HUNTER, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_HUNTER, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_HUNTER, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_HUNTER, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_HUNTER, 9077, 'Leather')
    ,(@RACE_TROLL, @CLASS_HUNTER, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_HUNTER, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_HUNTER, 13358, 'Defensive State (DND)')
    ,(@RACE_TROLL, @CLASS_HUNTER, 20554, 'Berserking')
    ,(@RACE_TROLL, @CLASS_HUNTER, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_HUNTER, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_HUNTER, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_HUNTER, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_HUNTER, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_HUNTER, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_HUNTER, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_HUNTER, 24949, 'Defensive State 2 (DND)')
    ,(@RACE_TROLL, @CLASS_HUNTER, 26290, 'Bow Specialization')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_ROGUE, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_ROGUE, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_ROGUE, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_ROGUE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_ROGUE, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_ROGUE, 1180, 'Daggers')
    ,(@RACE_TROLL, @CLASS_ROGUE, 1752, 'Sinister Strike')
    ,(@RACE_TROLL, @CLASS_ROGUE, 2098, 'Eviscerate')
    ,(@RACE_TROLL, @CLASS_ROGUE, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_ROGUE, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_ROGUE, 2567, 'Thrown')
    ,(@RACE_TROLL, @CLASS_ROGUE, 2764, 'Throw')
    ,(@RACE_TROLL, @CLASS_ROGUE, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_ROGUE, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_ROGUE, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_ROGUE, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_ROGUE, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_ROGUE, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_ROGUE, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_ROGUE, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_ROGUE, 9077, 'Leather')
    ,(@RACE_TROLL, @CLASS_ROGUE, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_ROGUE, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_ROGUE, 16092, 'Defensive State (DND)')
    ,(@RACE_TROLL, @CLASS_ROGUE, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_ROGUE, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_ROGUE, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_ROGUE, 21184, 'Rogue Passive (DND)')
    ,(@RACE_TROLL, @CLASS_ROGUE, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_ROGUE, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_ROGUE, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_ROGUE, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_ROGUE, 26290, 'Bow Specialization')
    ,(@RACE_TROLL, @CLASS_ROGUE, 26297, 'Berserking')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_PRIEST, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_PRIEST, 198, 'One-Handed Maces')
    ,(@RACE_TROLL, @CLASS_PRIEST, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_PRIEST, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_PRIEST, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_PRIEST, 585, 'Smite')
    ,(@RACE_TROLL, @CLASS_PRIEST, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_PRIEST, 2050, 'Lesser Heal')
    ,(@RACE_TROLL, @CLASS_PRIEST, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_PRIEST, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_PRIEST, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_PRIEST, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_PRIEST, 5009, 'Wands')
    ,(@RACE_TROLL, @CLASS_PRIEST, 5019, 'Shoot')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_PRIEST, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_PRIEST, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_PRIEST, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_PRIEST, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_PRIEST, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_PRIEST, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_PRIEST, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_PRIEST, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_PRIEST, 20554, 'Berserking')
    ,(@RACE_TROLL, @CLASS_PRIEST, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_PRIEST, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_PRIEST, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_PRIEST, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_PRIEST, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_PRIEST, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_PRIEST, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_PRIEST, 26290, 'Bow Specialization')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_SHAMAN, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 107, 'Block')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 198, 'One-Handed Maces')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 227, 'Staves')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 331, 'Healing Wave')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 403, 'Lightning Bolt')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 9077, 'Leather')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 9116, 'Shield')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 20554, 'Berserking')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 26290, 'Bow Specialization')
    ,(@RACE_TROLL, @CLASS_SHAMAN, 27763, 'Totem')
;

INSERT INTO `playercreateinfo_spell`
    (`race`, `class`, `Spell`, `Note`)
VALUES
     (@RACE_TROLL, @CLASS_MAGE, 81, 'Dodge')
    ,(@RACE_TROLL, @CLASS_MAGE, 133, 'Fireball')
    ,(@RACE_TROLL, @CLASS_MAGE, 168, 'Frost Armor')
    ,(@RACE_TROLL, @CLASS_MAGE, 203, 'Unarmed')
    ,(@RACE_TROLL, @CLASS_MAGE, 204, 'Defense')
    ,(@RACE_TROLL, @CLASS_MAGE, 227, 'Staves')
    ,(@RACE_TROLL, @CLASS_MAGE, 522, 'SPELLDEFENSE (DND)')
    ,(@RACE_TROLL, @CLASS_MAGE, 669, 'Language Orcish')
    ,(@RACE_TROLL, @CLASS_MAGE, 2382, 'Generic')
    ,(@RACE_TROLL, @CLASS_MAGE, 2479, 'Honorless Target')
    ,(@RACE_TROLL, @CLASS_MAGE, 3050, 'Detect')
    ,(@RACE_TROLL, @CLASS_MAGE, 3365, 'Opening')
    ,(@RACE_TROLL, @CLASS_MAGE, 5009, 'Wands')
    ,(@RACE_TROLL, @CLASS_MAGE, 5019, 'Shoot')
    ,(@RACE_TROLL, @CLASS_MAGE, 6233, 'Closing')
    ,(@RACE_TROLL, @CLASS_MAGE, 6246, 'Closing')
    ,(@RACE_TROLL, @CLASS_MAGE, 6247, 'Opening')
    ,(@RACE_TROLL, @CLASS_MAGE, 6477, 'Opening')
    ,(@RACE_TROLL, @CLASS_MAGE, 6478, 'Opening')
    ,(@RACE_TROLL, @CLASS_MAGE, 6603, 'Attack')
    ,(@RACE_TROLL, @CLASS_MAGE, 7266, 'Duel')
    ,(@RACE_TROLL, @CLASS_MAGE, 7267, 'Grovel')
    ,(@RACE_TROLL, @CLASS_MAGE, 7341, 'Language Troll')
    ,(@RACE_TROLL, @CLASS_MAGE, 7355, 'Stuck')
    ,(@RACE_TROLL, @CLASS_MAGE, 8386, 'Attacking')
    ,(@RACE_TROLL, @CLASS_MAGE, 9078, 'Cloth')
    ,(@RACE_TROLL, @CLASS_MAGE, 9125, 'Generic')
    ,(@RACE_TROLL, @CLASS_MAGE, 20554, 'Berserking')
    ,(@RACE_TROLL, @CLASS_MAGE, 20555, 'Regeneration')
    ,(@RACE_TROLL, @CLASS_MAGE, 20557, 'Beast Slaying')
    ,(@RACE_TROLL, @CLASS_MAGE, 20558, 'Throwing Specialization')
    ,(@RACE_TROLL, @CLASS_MAGE, 21651, 'Opening')
    ,(@RACE_TROLL, @CLASS_MAGE, 21652, 'Closing')
    ,(@RACE_TROLL, @CLASS_MAGE, 22027, 'Remove Insignia')
    ,(@RACE_TROLL, @CLASS_MAGE, 22810, 'Opening - No Text')
    ,(@RACE_TROLL, @CLASS_MAGE, 26290, 'Bow Specialization')
;

-- Insert default action buttons for characters ------------------------------
INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_PALADIN, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PALADIN, 1,      @SPELL_SEAL_OF_RIGHTEOUSNESS,   @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PALADIN, 2,      @SPELL_HOLY_LIGHT,              @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PALADIN, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_HUMAN,       @CLASS_PALADIN, 11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_ROGUE,   11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_HUMAN,       @CLASS_PRIEST,  11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_HUMAN,       @CLASS_MAGE,    11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_HUMAN,       @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL)
    ,(@RACE_HUMAN,       @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_HUMAN,       @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_ORC,         @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARRIOR, 74,     @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_ORC,         @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_HUNTER,  3,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_ORC,         @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_ORC,         @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_ROGUE,   4,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_ORC,         @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_SHAMAN,  3,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_ORC,         @CLASS_SHAMAN,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_ORC,         @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARLOCK, 3,      @SPELL_BLOOD_FURY,              @ACTION_TYPE_SPELL)
    ,(@RACE_ORC,         @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_ORC,         @CLASS_WARLOCK, 11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_DWARF,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_WARRIOR, 74,     @SPELL_STONEFORM,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_WARRIOR, 75,     @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_DWARF,       @CLASS_PALADIN, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 1,      @SPELL_SEAL_OF_RIGHTEOUSNESS,   @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 2,      @SPELL_HOLY_LIGHT,              @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_DWARF,       @CLASS_PALADIN, 11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_DWARF,       @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_DWARF,       @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_DWARF,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   4,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   5,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_DWARF,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  3,      @SPELL_STONEFORM,               @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  4,      @SPELL_FIND_TREASURE,           @ACTION_TYPE_SPELL)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_DWARF,       @CLASS_PRIEST,  11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 74,     @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_NIGHT_ELF,   @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_HUNTER,  3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_NIGHT_ELF,   @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_NIGHT_ELF,   @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_ROGUE,   4,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_ROGUE,   11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_NIGHT_ELF,   @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_PRIEST,  3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_NIGHT_ELF,   @CLASS_PRIEST,  11,     @ITEM_DARNASSIAN_BLEU,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_NIGHT_ELF,   @CLASS_DRUID,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_DRUID,   1,      @SPELL_WRATH,                   @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_DRUID,   2,      @SPELL_HEALING_TOUCH,           @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_DRUID,   3,      @SPELL_SHADOWMELD,              @ACTION_TYPE_SPELL)
    ,(@RACE_NIGHT_ELF,   @CLASS_DRUID,   10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_NIGHT_ELF,   @CLASS_DRUID,   11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_UNDEAD,      @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARRIOR, 74,     @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARRIOR, 83,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_UNDEAD,      @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_ROGUE,   4,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_ROGUE,   11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_UNDEAD,      @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_PRIEST,  3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_UNDEAD,      @CLASS_PRIEST,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_UNDEAD,      @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_MAGE,    3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_UNDEAD,      @CLASS_MAGE,    11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_UNDEAD,      @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARLOCK, 3,      @SPELL_CANNIBALIZE,             @ACTION_TYPE_SPELL)
    ,(@RACE_UNDEAD,      @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_UNDEAD,      @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TAUREN,      @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_WARRIOR, 74,     @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_WARRIOR, 83,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TAUREN,      @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_HUNTER,  3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TAUREN,      @CLASS_HUNTER,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TAUREN,      @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_SHAMAN,  3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TAUREN,      @CLASS_SHAMAN,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TAUREN,      @CLASS_DRUID,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_DRUID,   1,      @SPELL_WRATH,                   @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_DRUID,   2,      @SPELL_HEALING_TOUCH,           @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_DRUID,   3,      @SPELL_WAR_STOMP,               @ACTION_TYPE_SPELL)
    ,(@RACE_TAUREN,      @CLASS_DRUID,   10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TAUREN,      @CLASS_DRUID,   11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_GNOME,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_GNOME,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_GNOME,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_GNOME,       @CLASS_MAGE,    11,     @ITEM_SHINY_RED_APPLE,          @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_GNOME,       @CLASS_WARLOCK, 0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_WARLOCK, 1,      @SPELL_SHADOW_BOLT,             @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_WARLOCK, 2,      @SPELL_DEMON_SKIN,              @ACTION_TYPE_SPELL)
    ,(@RACE_GNOME,       @CLASS_WARLOCK, 10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_GNOME,       @CLASS_WARLOCK, 11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_WARRIOR, 72,     @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_WARRIOR, 73,     @SPELL_HEROIC_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_WARRIOR, 74,     @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_WARRIOR, 75,     @SPELL_BERSERKING_RAGE,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_WARRIOR, 83,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_HUNTER,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_HUNTER,  1,      @SPELL_RAPTOR_STRIKE,           @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_HUNTER,  2,      @SPELL_AUTO_SHOT,               @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_HUNTER,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_HUNTER,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TROLL,       @CLASS_HUNTER,  11,     @ITEM_FOREST_MUSHROOM_CAP,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_ROGUE,   0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_ROGUE,   1,      @SPELL_SINISTER_STRIKE,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_ROGUE,   2,      @SPELL_EVISCERATE,              @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_ROGUE,   3,      @SPELL_THROW,                   @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_ROGUE,   4,      @SPELL_BERSERKING_ENERGY,       @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_ROGUE,   11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_PRIEST,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_PRIEST,  1,      @SPELL_SMITE,                   @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_PRIEST,  2,      @SPELL_LESSER_HEAL,             @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_PRIEST,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_PRIEST,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TROLL,       @CLASS_PRIEST,  11,     @ITEM_TOUGH_HUNK_OF_BREAD,      @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_SHAMAN,  0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_SHAMAN,  1,      @SPELL_LIGHTNING_BOLT,          @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_SHAMAN,  2,      @SPELL_HEALING_WAVE,            @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_SHAMAN,  3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_SHAMAN,  10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TROLL,       @CLASS_SHAMAN,  11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

INSERT INTO `playercreateinfo_action`
    (`race`, `class`, `button`, `action`, `type`)
VALUES
     (@RACE_TROLL,       @CLASS_MAGE,    0,      @SPELL_ATTACK,                  @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_MAGE,    1,      @SPELL_FIREBALL,                @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_MAGE,    2,      @SPELL_FROST_ARMOR,             @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_MAGE,    3,      @SPELL_BERSERKING_MANA,         @ACTION_TYPE_SPELL)
    ,(@RACE_TROLL,       @CLASS_MAGE,    10,     @ITEM_REFRESHING_SPRING_WATER,  @ACTION_TYPE_ITEM)
    ,(@RACE_TROLL,       @CLASS_MAGE,    11,     @ITEM_TOUGH_JERKY,              @ACTION_TYPE_ITEM)
;

-- Insert class based leveling stat changes ----------------------------------
INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_WARRIOR, 1, 20, 0)
    ,(@CLASS_WARRIOR, 2, 29, 0)
    ,(@CLASS_WARRIOR, 3, 38, 0)
    ,(@CLASS_WARRIOR, 4, 47, 0)
    ,(@CLASS_WARRIOR, 5, 56, 0)
    ,(@CLASS_WARRIOR, 6, 65, 0)
    ,(@CLASS_WARRIOR, 7, 74, 0)
    ,(@CLASS_WARRIOR, 8, 83, 0)
    ,(@CLASS_WARRIOR, 9, 92, 0)
    ,(@CLASS_WARRIOR, 10, 101, 0)
    ,(@CLASS_WARRIOR, 11, 100, 0)
    ,(@CLASS_WARRIOR, 12, 109, 0)
    ,(@CLASS_WARRIOR, 13, 118, 0)
    ,(@CLASS_WARRIOR, 14, 128, 0)
    ,(@CLASS_WARRIOR, 15, 139, 0)
    ,(@CLASS_WARRIOR, 16, 151, 0)
    ,(@CLASS_WARRIOR, 17, 154, 0)
    ,(@CLASS_WARRIOR, 18, 168, 0)
    ,(@CLASS_WARRIOR, 19, 168, 0)
    ,(@CLASS_WARRIOR, 20, 199, 0)
    ,(@CLASS_WARRIOR, 21, 206, 0)
    ,(@CLASS_WARRIOR, 22, 224, 0)
    ,(@CLASS_WARRIOR, 23, 243, 0)
    ,(@CLASS_WARRIOR, 24, 253, 0)
    ,(@CLASS_WARRIOR, 25, 274, 0)
    ,(@CLASS_WARRIOR, 26, 296, 0)
    ,(@CLASS_WARRIOR, 27, 309, 0)
    ,(@CLASS_WARRIOR, 28, 333, 0)
    ,(@CLASS_WARRIOR, 29, 348, 0)
    ,(@CLASS_WARRIOR, 30, 374, 0)
    ,(@CLASS_WARRIOR, 31, 401, 0)
    ,(@CLASS_WARRIOR, 32, 419, 0)
    ,(@CLASS_WARRIOR, 33, 448, 0)
    ,(@CLASS_WARRIOR, 34, 468, 0)
    ,(@CLASS_WARRIOR, 35, 499, 0)
    ,(@CLASS_WARRIOR, 36, 521, 0)
    ,(@CLASS_WARRIOR, 37, 545, 0)
    ,(@CLASS_WARRIOR, 38, 581, 0)
    ,(@CLASS_WARRIOR, 39, 609, 0)
    ,(@CLASS_WARRIOR, 40, 649, 0)
    ,(@CLASS_WARRIOR, 41, 681, 0)
    ,(@CLASS_WARRIOR, 42, 715, 0)
    ,(@CLASS_WARRIOR, 43, 761, 0)
    ,(@CLASS_WARRIOR, 44, 799, 0)
    ,(@CLASS_WARRIOR, 45, 839, 0)
    ,(@CLASS_WARRIOR, 46, 881, 0)
    ,(@CLASS_WARRIOR, 47, 935, 0)
    ,(@CLASS_WARRIOR, 48, 981, 0)
    ,(@CLASS_WARRIOR, 49, 1029, 0)
    ,(@CLASS_WARRIOR, 50, 1079, 0)
    ,(@CLASS_WARRIOR, 51, 1131, 0)
    ,(@CLASS_WARRIOR, 52, 1185, 0)
    ,(@CLASS_WARRIOR, 53, 1241, 0)
    ,(@CLASS_WARRIOR, 54, 1299, 0)
    ,(@CLASS_WARRIOR, 55, 1359, 0)
    ,(@CLASS_WARRIOR, 56, 1421, 0)
    ,(@CLASS_WARRIOR, 57, 1485, 0)
    ,(@CLASS_WARRIOR, 58, 1551, 0)
    ,(@CLASS_WARRIOR, 59, 1619, 0)
    ,(@CLASS_WARRIOR, 60, 1689, 0)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_PALADIN, 1, 28, 59)
    ,(@CLASS_PALADIN, 2, 26, 64)
    ,(@CLASS_PALADIN, 3, 34, 84)
    ,(@CLASS_PALADIN, 4, 42, 90)
    ,(@CLASS_PALADIN, 5, 50, 112)
    ,(@CLASS_PALADIN, 6, 58, 120)
    ,(@CLASS_PALADIN, 7, 66, 129)
    ,(@CLASS_PALADIN, 8, 84, 154)
    ,(@CLASS_PALADIN, 9, 92, 165)
    ,(@CLASS_PALADIN, 10, 100, 192)
    ,(@CLASS_PALADIN, 11, 108, 205)
    ,(@CLASS_PALADIN, 12, 116, 219)
    ,(@CLASS_PALADIN, 13, 124, 249)
    ,(@CLASS_PALADIN, 14, 132, 265)
    ,(@CLASS_PALADIN, 15, 131, 282)
    ,(@CLASS_PALADIN, 16, 141, 315)
    ,(@CLASS_PALADIN, 17, 152, 334)
    ,(@CLASS_PALADIN, 18, 164, 354)
    ,(@CLASS_PALADIN, 19, 177, 390)
    ,(@CLASS_PALADIN, 20, 191, 412)
    ,(@CLASS_PALADIN, 21, 206, 435)
    ,(@CLASS_PALADIN, 22, 222, 459)
    ,(@CLASS_PALADIN, 23, 239, 499)
    ,(@CLASS_PALADIN, 24, 247, 525)
    ,(@CLASS_PALADIN, 25, 266, 552)
    ,(@CLASS_PALADIN, 26, 286, 579)
    ,(@CLASS_PALADIN, 27, 307, 621)
    ,(@CLASS_PALADIN, 28, 329, 648)
    ,(@CLASS_PALADIN, 29, 342, 675)
    ,(@CLASS_PALADIN, 30, 366, 702)
    ,(@CLASS_PALADIN, 31, 391, 729)
    ,(@CLASS_PALADIN, 32, 407, 756)
    ,(@CLASS_PALADIN, 33, 434, 798)
    ,(@CLASS_PALADIN, 34, 462, 825)
    ,(@CLASS_PALADIN, 35, 481, 852)
    ,(@CLASS_PALADIN, 36, 511, 879)
    ,(@CLASS_PALADIN, 37, 542, 906)
    ,(@CLASS_PALADIN, 38, 564, 933)
    ,(@CLASS_PALADIN, 39, 597, 960)
    ,(@CLASS_PALADIN, 40, 621, 987)
    ,(@CLASS_PALADIN, 41, 656, 1014)
    ,(@CLASS_PALADIN, 42, 682, 1041)
    ,(@CLASS_PALADIN, 43, 719, 1068)
    ,(@CLASS_PALADIN, 44, 747, 1110)
    ,(@CLASS_PALADIN, 45, 786, 1137)
    ,(@CLASS_PALADIN, 46, 816, 1164)
    ,(@CLASS_PALADIN, 47, 857, 1176)
    ,(@CLASS_PALADIN, 48, 889, 1203)
    ,(@CLASS_PALADIN, 49, 922, 1230)
    ,(@CLASS_PALADIN, 50, 966, 1257)
    ,(@CLASS_PALADIN, 51, 1001, 1284)
    ,(@CLASS_PALADIN, 52, 1037, 1311)
    ,(@CLASS_PALADIN, 53, 1084, 1338)
    ,(@CLASS_PALADIN, 54, 1122, 1365)
    ,(@CLASS_PALADIN, 55, 1161, 1392)
    ,(@CLASS_PALADIN, 56, 1201, 1419)
    ,(@CLASS_PALADIN, 57, 1252, 1446)
    ,(@CLASS_PALADIN, 58, 1294, 1458)
    ,(@CLASS_PALADIN, 59, 1337, 1485)
    ,(@CLASS_PALADIN, 60, 1381, 1512)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_HUNTER, 1, 26, 63)
    ,(@CLASS_HUNTER, 2, 33, 70)
    ,(@CLASS_HUNTER, 3, 40, 91)
    ,(@CLASS_HUNTER, 4, 57, 98)
    ,(@CLASS_HUNTER, 5, 64, 121)
    ,(@CLASS_HUNTER, 6, 71, 130)
    ,(@CLASS_HUNTER, 7, 78, 155)
    ,(@CLASS_HUNTER, 8, 85, 166)
    ,(@CLASS_HUNTER, 9, 92, 193)
    ,(@CLASS_HUNTER, 10, 109, 206)
    ,(@CLASS_HUNTER, 11, 116, 235)
    ,(@CLASS_HUNTER, 12, 123, 250)
    ,(@CLASS_HUNTER, 13, 130, 266)
    ,(@CLASS_HUNTER, 14, 138, 298)
    ,(@CLASS_HUNTER, 15, 147, 316)
    ,(@CLASS_HUNTER, 16, 157, 350)
    ,(@CLASS_HUNTER, 17, 168, 370)
    ,(@CLASS_HUNTER, 18, 180, 391)
    ,(@CLASS_HUNTER, 19, 193, 428)
    ,(@CLASS_HUNTER, 20, 207, 451)
    ,(@CLASS_HUNTER, 21, 222, 475)
    ,(@CLASS_HUNTER, 22, 238, 515)
    ,(@CLASS_HUNTER, 23, 255, 541)
    ,(@CLASS_HUNTER, 24, 273, 568)
    ,(@CLASS_HUNTER, 25, 292, 611)
    ,(@CLASS_HUNTER, 26, 312, 640)
    ,(@CLASS_HUNTER, 27, 333, 670)
    ,(@CLASS_HUNTER, 28, 355, 715)
    ,(@CLASS_HUNTER, 29, 378, 745)
    ,(@CLASS_HUNTER, 30, 402, 775)
    ,(@CLASS_HUNTER, 31, 417, 805)
    ,(@CLASS_HUNTER, 32, 443, 850)
    ,(@CLASS_HUNTER, 33, 470, 880)
    ,(@CLASS_HUNTER, 34, 498, 910)
    ,(@CLASS_HUNTER, 35, 527, 940)
    ,(@CLASS_HUNTER, 36, 547, 970)
    ,(@CLASS_HUNTER, 37, 578, 1015)
    ,(@CLASS_HUNTER, 38, 610, 1045)
    ,(@CLASS_HUNTER, 39, 643, 1075)
    ,(@CLASS_HUNTER, 40, 667, 1105)
    ,(@CLASS_HUNTER, 41, 702, 1135)
    ,(@CLASS_HUNTER, 42, 738, 1180)
    ,(@CLASS_HUNTER, 43, 775, 1210)
    ,(@CLASS_HUNTER, 44, 803, 1240)
    ,(@CLASS_HUNTER, 45, 842, 1270)
    ,(@CLASS_HUNTER, 46, 872, 1300)
    ,(@CLASS_HUNTER, 47, 913, 1330)
    ,(@CLASS_HUNTER, 48, 955, 1360)
    ,(@CLASS_HUNTER, 49, 988, 1390)
    ,(@CLASS_HUNTER, 50, 1032, 1420)
    ,(@CLASS_HUNTER, 51, 1067, 1450)
    ,(@CLASS_HUNTER, 52, 1113, 1480)
    ,(@CLASS_HUNTER, 53, 1150, 1510)
    ,(@CLASS_HUNTER, 54, 1198, 1540)
    ,(@CLASS_HUNTER, 55, 1237, 1570)
    ,(@CLASS_HUNTER, 56, 1287, 1600)
    ,(@CLASS_HUNTER, 57, 1328, 1630)
    ,(@CLASS_HUNTER, 58, 1370, 1660)
    ,(@CLASS_HUNTER, 59, 1423, 1690)
    ,(@CLASS_HUNTER, 60, 1467, 1720)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_ROGUE, 1, 25, 0)
    ,(@CLASS_ROGUE, 2, 32, 0)
    ,(@CLASS_ROGUE, 3, 49, 0)
    ,(@CLASS_ROGUE, 4, 56, 0)
    ,(@CLASS_ROGUE, 5, 63, 0)
    ,(@CLASS_ROGUE, 6, 80, 0)
    ,(@CLASS_ROGUE, 7, 87, 0)
    ,(@CLASS_ROGUE, 8, 104, 0)
    ,(@CLASS_ROGUE, 9, 111, 0)
    ,(@CLASS_ROGUE, 10, 118, 0)
    ,(@CLASS_ROGUE, 11, 125, 0)
    ,(@CLASS_ROGUE, 12, 142, 0)
    ,(@CLASS_ROGUE, 13, 149, 0)
    ,(@CLASS_ROGUE, 14, 156, 0)
    ,(@CLASS_ROGUE, 15, 173, 0)
    ,(@CLASS_ROGUE, 16, 181, 0)
    ,(@CLASS_ROGUE, 17, 190, 0)
    ,(@CLASS_ROGUE, 18, 200, 0)
    ,(@CLASS_ROGUE, 19, 221, 0)
    ,(@CLASS_ROGUE, 20, 233, 0)
    ,(@CLASS_ROGUE, 21, 246, 0)
    ,(@CLASS_ROGUE, 22, 260, 0)
    ,(@CLASS_ROGUE, 23, 275, 0)
    ,(@CLASS_ROGUE, 24, 301, 0)
    ,(@CLASS_ROGUE, 25, 318, 0)
    ,(@CLASS_ROGUE, 26, 336, 0)
    ,(@CLASS_ROGUE, 27, 355, 0)
    ,(@CLASS_ROGUE, 28, 375, 0)
    ,(@CLASS_ROGUE, 29, 396, 0)
    ,(@CLASS_ROGUE, 30, 428, 0)
    ,(@CLASS_ROGUE, 31, 451, 0)
    ,(@CLASS_ROGUE, 32, 475, 0)
    ,(@CLASS_ROGUE, 33, 500, 0)
    ,(@CLASS_ROGUE, 34, 526, 0)
    ,(@CLASS_ROGUE, 35, 553, 0)
    ,(@CLASS_ROGUE, 36, 581, 0)
    ,(@CLASS_ROGUE, 37, 610, 0)
    ,(@CLASS_ROGUE, 38, 640, 0)
    ,(@CLASS_ROGUE, 39, 671, 0)
    ,(@CLASS_ROGUE, 40, 703, 0)
    ,(@CLASS_ROGUE, 41, 736, 0)
    ,(@CLASS_ROGUE, 42, 770, 0)
    ,(@CLASS_ROGUE, 43, 805, 0)
    ,(@CLASS_ROGUE, 44, 841, 0)
    ,(@CLASS_ROGUE, 45, 878, 0)
    ,(@CLASS_ROGUE, 46, 916, 0)
    ,(@CLASS_ROGUE, 47, 955, 0)
    ,(@CLASS_ROGUE, 48, 995, 0)
    ,(@CLASS_ROGUE, 49, 1026, 0)
    ,(@CLASS_ROGUE, 50, 1068, 0)
    ,(@CLASS_ROGUE, 51, 1111, 0)
    ,(@CLASS_ROGUE, 52, 1155, 0)
    ,(@CLASS_ROGUE, 53, 1200, 0)
    ,(@CLASS_ROGUE, 54, 1246, 0)
    ,(@CLASS_ROGUE, 55, 1283, 0)
    ,(@CLASS_ROGUE, 56, 1331, 0)
    ,(@CLASS_ROGUE, 57, 1380, 0)
    ,(@CLASS_ROGUE, 58, 1430, 0)
    ,(@CLASS_ROGUE, 59, 1471, 0)
    ,(@CLASS_ROGUE, 60, 1523, 0)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_PRIEST, 1, 31, 110)
    ,(@CLASS_PRIEST, 2, 37, 165)
    ,(@CLASS_PRIEST, 3, 42, 189)
    ,(@CLASS_PRIEST, 4, 57, 200)
    ,(@CLASS_PRIEST, 5, 72, 197)
    ,(@CLASS_PRIEST, 6, 77, 210)
    ,(@CLASS_PRIEST, 7, 92, 224)
    ,(@CLASS_PRIEST, 8, 107, 239)
    ,(@CLASS_PRIEST, 9, 112, 255)
    ,(@CLASS_PRIEST, 10, 127, 272)
    ,(@CLASS_PRIEST, 11, 132, 275)
    ,(@CLASS_PRIEST, 12, 147, 294)
    ,(@CLASS_PRIEST, 13, 162, 314)
    ,(@CLASS_PRIEST, 14, 167, 320)
    ,(@CLASS_PRIEST, 15, 182, 342)
    ,(@CLASS_PRIEST, 16, 187, 365)
    ,(@CLASS_PRIEST, 17, 202, 389)
    ,(@CLASS_PRIEST, 18, 217, 399)
    ,(@CLASS_PRIEST, 19, 222, 425)
    ,(@CLASS_PRIEST, 20, 237, 437)
    ,(@CLASS_PRIEST, 21, 242, 465)
    ,(@CLASS_PRIEST, 22, 258, 494)
    ,(@CLASS_PRIEST, 23, 265, 509)
    ,(@CLASS_PRIEST, 24, 283, 540)
    ,(@CLASS_PRIEST, 25, 292, 557)
    ,(@CLASS_PRIEST, 26, 312, 590)
    ,(@CLASS_PRIEST, 27, 333, 609)
    ,(@CLASS_PRIEST, 28, 345, 644)
    ,(@CLASS_PRIEST, 29, 368, 665)
    ,(@CLASS_PRIEST, 30, 382, 687)
    ,(@CLASS_PRIEST, 31, 407, 725)
    ,(@CLASS_PRIEST, 32, 423, 749)
    ,(@CLASS_PRIEST, 33, 450, 788)
    ,(@CLASS_PRIEST, 34, 468, 812)
    ,(@CLASS_PRIEST, 35, 497, 836)
    ,(@CLASS_PRIEST, 36, 517, 860)
    ,(@CLASS_PRIEST, 37, 538, 899)
    ,(@CLASS_PRIEST, 38, 570, 923)
    ,(@CLASS_PRIEST, 39, 593, 947)
    ,(@CLASS_PRIEST, 40, 627, 971)
    ,(@CLASS_PRIEST, 41, 652, 1010)
    ,(@CLASS_PRIEST, 42, 688, 1034)
    ,(@CLASS_PRIEST, 43, 715, 1058)
    ,(@CLASS_PRIEST, 44, 753, 1082)
    ,(@CLASS_PRIEST, 45, 782, 1106)
    ,(@CLASS_PRIEST, 46, 812, 1130)
    ,(@CLASS_PRIEST, 47, 853, 1154)
    ,(@CLASS_PRIEST, 48, 885, 1178)
    ,(@CLASS_PRIEST, 49, 918, 1202)
    ,(@CLASS_PRIEST, 50, 962, 1226)
    ,(@CLASS_PRIEST, 51, 997, 1250)
    ,(@CLASS_PRIEST, 52, 1043, 1274)
    ,(@CLASS_PRIEST, 53, 1080, 1298)
    ,(@CLASS_PRIEST, 54, 1118, 1322)
    ,(@CLASS_PRIEST, 55, 1167, 1331)
    ,(@CLASS_PRIEST, 56, 1207, 1355)
    ,(@CLASS_PRIEST, 57, 1248, 1379)
    ,(@CLASS_PRIEST, 58, 1290, 1403)
    ,(@CLASS_PRIEST, 59, 1343, 1412)
    ,(@CLASS_PRIEST, 60, 1387, 1436)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_SHAMAN, 1, 27, 53)
    ,(@CLASS_SHAMAN, 2, 34, 61)
    ,(@CLASS_SHAMAN, 3, 41, 68)
    ,(@CLASS_SHAMAN, 4, 48, 91)
    ,(@CLASS_SHAMAN, 5, 65, 100)
    ,(@CLASS_SHAMAN, 6, 72, 110)
    ,(@CLASS_SHAMAN, 7, 79, 121)
    ,(@CLASS_SHAMAN, 8, 86, 133)
    ,(@CLASS_SHAMAN, 9, 93, 161)
    ,(@CLASS_SHAMAN, 10, 100, 175)
    ,(@CLASS_SHAMAN, 11, 107, 190)
    ,(@CLASS_SHAMAN, 12, 114, 206)
    ,(@CLASS_SHAMAN, 13, 121, 223)
    ,(@CLASS_SHAMAN, 14, 128, 241)
    ,(@CLASS_SHAMAN, 15, 135, 260)
    ,(@CLASS_SHAMAN, 16, 142, 280)
    ,(@CLASS_SHAMAN, 17, 150, 301)
    ,(@CLASS_SHAMAN, 18, 159, 323)
    ,(@CLASS_SHAMAN, 19, 169, 346)
    ,(@CLASS_SHAMAN, 20, 180, 370)
    ,(@CLASS_SHAMAN, 21, 192, 395)
    ,(@CLASS_SHAMAN, 22, 205, 456)
    ,(@CLASS_SHAMAN, 23, 219, 448)
    ,(@CLASS_SHAMAN, 24, 234, 476)
    ,(@CLASS_SHAMAN, 25, 240, 505)
    ,(@CLASS_SHAMAN, 26, 257, 579)
    ,(@CLASS_SHAMAN, 27, 275, 566)
    ,(@CLASS_SHAMAN, 28, 294, 598)
    ,(@CLASS_SHAMAN, 29, 314, 631)
    ,(@CLASS_SHAMAN, 30, 335, 718)
    ,(@CLASS_SHAMAN, 31, 347, 699)
    ,(@CLASS_SHAMAN, 32, 370, 733)
    ,(@CLASS_SHAMAN, 33, 394, 767)
    ,(@CLASS_SHAMAN, 34, 419, 786)
    ,(@CLASS_SHAMAN, 35, 435, 820)
    ,(@CLASS_SHAMAN, 36, 462, 854)
    ,(@CLASS_SHAMAN, 37, 490, 888)
    ,(@CLASS_SHAMAN, 38, 509, 922)
    ,(@CLASS_SHAMAN, 39, 539, 941)
    ,(@CLASS_SHAMAN, 40, 570, 975)
    ,(@CLASS_SHAMAN, 41, 592, 1009)
    ,(@CLASS_SHAMAN, 42, 625, 1028)
    ,(@CLASS_SHAMAN, 43, 649, 1062)
    ,(@CLASS_SHAMAN, 44, 684, 1096)
    ,(@CLASS_SHAMAN, 45, 710, 1115)
    ,(@CLASS_SHAMAN, 46, 747, 1149)
    ,(@CLASS_SHAMAN, 47, 775, 1183)
    ,(@CLASS_SHAMAN, 48, 814, 1202)
    ,(@CLASS_SHAMAN, 49, 844, 1236)
    ,(@CLASS_SHAMAN, 50, 885, 1255)
    ,(@CLASS_SHAMAN, 51, 917, 1289)
    ,(@CLASS_SHAMAN, 52, 960, 1313)
    ,(@CLASS_SHAMAN, 53, 994, 1342)
    ,(@CLASS_SHAMAN, 54, 1029, 1376)
    ,(@CLASS_SHAMAN, 55, 1075, 1395)
    ,(@CLASS_SHAMAN, 56, 1112, 1414)
    ,(@CLASS_SHAMAN, 57, 1150, 1448)
    ,(@CLASS_SHAMAN, 58, 1199, 1467)
    ,(@CLASS_SHAMAN, 59, 1239, 1501)
    ,(@CLASS_SHAMAN, 60, 1280, 1520)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_MAGE, 1, 31, 100)
    ,(@CLASS_MAGE, 2, 37, 170)
    ,(@CLASS_MAGE, 3, 42, 181)
    ,(@CLASS_MAGE, 4, 57, 178)
    ,(@CLASS_MAGE, 5, 72, 191)
    ,(@CLASS_MAGE, 6, 87, 205)
    ,(@CLASS_MAGE, 7, 92, 220)
    ,(@CLASS_MAGE, 8, 107, 221)
    ,(@CLASS_MAGE, 9, 122, 238)
    ,(@CLASS_MAGE, 10, 127, 256)
    ,(@CLASS_MAGE, 11, 142, 275)
    ,(@CLASS_MAGE, 12, 157, 280)
    ,(@CLASS_MAGE, 13, 162, 301)
    ,(@CLASS_MAGE, 14, 177, 323)
    ,(@CLASS_MAGE, 15, 192, 331)
    ,(@CLASS_MAGE, 16, 197, 355)
    ,(@CLASS_MAGE, 17, 212, 365)
    ,(@CLASS_MAGE, 18, 227, 391)
    ,(@CLASS_MAGE, 19, 232, 403)
    ,(@CLASS_MAGE, 20, 247, 431)
    ,(@CLASS_MAGE, 21, 262, 445)
    ,(@CLASS_MAGE, 22, 267, 475)
    ,(@CLASS_MAGE, 23, 282, 491)
    ,(@CLASS_MAGE, 24, 288, 523)
    ,(@CLASS_MAGE, 25, 305, 541)
    ,(@CLASS_MAGE, 26, 323, 575)
    ,(@CLASS_MAGE, 27, 332, 595)
    ,(@CLASS_MAGE, 28, 352, 616)
    ,(@CLASS_MAGE, 29, 363, 652)
    ,(@CLASS_MAGE, 30, 385, 673)
    ,(@CLASS_MAGE, 31, 408, 694)
    ,(@CLASS_MAGE, 32, 422, 730)
    ,(@CLASS_MAGE, 33, 447, 751)
    ,(@CLASS_MAGE, 34, 463, 772)
    ,(@CLASS_MAGE, 35, 490, 793)
    ,(@CLASS_MAGE, 36, 508, 814)
    ,(@CLASS_MAGE, 37, 537, 850)
    ,(@CLASS_MAGE, 38, 567, 871)
    ,(@CLASS_MAGE, 39, 588, 892)
    ,(@CLASS_MAGE, 40, 620, 913)
    ,(@CLASS_MAGE, 41, 643, 934)
    ,(@CLASS_MAGE, 42, 677, 955)
    ,(@CLASS_MAGE, 43, 702, 976)
    ,(@CLASS_MAGE, 44, 738, 997)
    ,(@CLASS_MAGE, 45, 765, 1018)
    ,(@CLASS_MAGE, 46, 803, 1039)
    ,(@CLASS_MAGE, 47, 832, 1060)
    ,(@CLASS_MAGE, 48, 872, 1081)
    ,(@CLASS_MAGE, 49, 903, 1102)
    ,(@CLASS_MAGE, 50, 945, 1108)
    ,(@CLASS_MAGE, 51, 978, 1129)
    ,(@CLASS_MAGE, 52, 1022, 1150)
    ,(@CLASS_MAGE, 53, 1057, 1171)
    ,(@CLASS_MAGE, 54, 1093, 1177)
    ,(@CLASS_MAGE, 55, 1140, 1198)
    ,(@CLASS_MAGE, 56, 1178, 1219)
    ,(@CLASS_MAGE, 57, 1227, 1225)
    ,(@CLASS_MAGE, 58, 1267, 1246)
    ,(@CLASS_MAGE, 59, 1318, 1252)
    ,(@CLASS_MAGE, 60, 1360, 1273)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_WARLOCK, 1, 23, 59)
    ,(@CLASS_WARLOCK, 2, 28, 98)
    ,(@CLASS_WARLOCK, 3, 43, 107)
    ,(@CLASS_WARLOCK, 4, 48, 117)
    ,(@CLASS_WARLOCK, 5, 63, 128)
    ,(@CLASS_WARLOCK, 6, 68, 140)
    ,(@CLASS_WARLOCK, 7, 83, 153)
    ,(@CLASS_WARLOCK, 8, 88, 167)
    ,(@CLASS_WARLOCK, 9, 103, 182)
    ,(@CLASS_WARLOCK, 10, 108, 198)
    ,(@CLASS_WARLOCK, 11, 123, 200)
    ,(@CLASS_WARLOCK, 12, 128, 218)
    ,(@CLASS_WARLOCK, 13, 143, 237)
    ,(@CLASS_WARLOCK, 14, 148, 257)
    ,(@CLASS_WARLOCK, 15, 153, 278)
    ,(@CLASS_WARLOCK, 16, 168, 300)
    ,(@CLASS_WARLOCK, 17, 173, 308)
    ,(@CLASS_WARLOCK, 18, 189, 332)
    ,(@CLASS_WARLOCK, 19, 196, 357)
    ,(@CLASS_WARLOCK, 20, 204, 383)
    ,(@CLASS_WARLOCK, 21, 223, 395)
    ,(@CLASS_WARLOCK, 22, 233, 423)
    ,(@CLASS_WARLOCK, 23, 244, 452)
    ,(@CLASS_WARLOCK, 24, 266, 467)
    ,(@CLASS_WARLOCK, 25, 279, 498)
    ,(@CLASS_WARLOCK, 26, 293, 530)
    ,(@CLASS_WARLOCK, 27, 318, 548)
    ,(@CLASS_WARLOCK, 28, 334, 582)
    ,(@CLASS_WARLOCK, 29, 351, 602)
    ,(@CLASS_WARLOCK, 30, 379, 638)
    ,(@CLASS_WARLOCK, 31, 398, 674)
    ,(@CLASS_WARLOCK, 32, 418, 695)
    ,(@CLASS_WARLOCK, 33, 439, 731)
    ,(@CLASS_WARLOCK, 34, 471, 752)
    ,(@CLASS_WARLOCK, 35, 494, 788)
    ,(@CLASS_WARLOCK, 36, 518, 809)
    ,(@CLASS_WARLOCK, 37, 543, 830)
    ,(@CLASS_WARLOCK, 38, 569, 866)
    ,(@CLASS_WARLOCK, 39, 606, 887)
    ,(@CLASS_WARLOCK, 40, 634, 923)
    ,(@CLASS_WARLOCK, 41, 663, 944)
    ,(@CLASS_WARLOCK, 42, 693, 965)
    ,(@CLASS_WARLOCK, 43, 724, 1001)
    ,(@CLASS_WARLOCK, 44, 756, 1022)
    ,(@CLASS_WARLOCK, 45, 799, 1043)
    ,(@CLASS_WARLOCK, 46, 823, 1064)
    ,(@CLASS_WARLOCK, 47, 868, 1100)
    ,(@CLASS_WARLOCK, 48, 904, 1121)
    ,(@CLASS_WARLOCK, 49, 941, 1142)
    ,(@CLASS_WARLOCK, 50, 979, 1163)
    ,(@CLASS_WARLOCK, 51, 1018, 1184)
    ,(@CLASS_WARLOCK, 52, 1058, 1205)
    ,(@CLASS_WARLOCK, 53, 1089, 1226)
    ,(@CLASS_WARLOCK, 54, 1131, 1247)
    ,(@CLASS_WARLOCK, 55, 1184, 1268)
    ,(@CLASS_WARLOCK, 56, 1228, 1289)
    ,(@CLASS_WARLOCK, 57, 1273, 1310)
    ,(@CLASS_WARLOCK, 58, 1319, 1331)
    ,(@CLASS_WARLOCK, 59, 1366, 1352)
    ,(@CLASS_WARLOCK, 60, 1414, 1373)
;

INSERT INTO `player_classlevelstats`
    (`class`,`level`,`basehp`,`basemana`)
VALUES
     (@CLASS_DRUID, 1, 33, 17)
    ,(@CLASS_DRUID, 2, 41, 57)
    ,(@CLASS_DRUID, 3, 58, 65)
    ,(@CLASS_DRUID, 4, 65, 74)
    ,(@CLASS_DRUID, 5, 82, 84)
    ,(@CLASS_DRUID, 6, 89, 95)
    ,(@CLASS_DRUID, 7, 96, 107)
    ,(@CLASS_DRUID, 8, 113, 120)
    ,(@CLASS_DRUID, 9, 120, 134)
    ,(@CLASS_DRUID, 10, 137, 149)
    ,(@CLASS_DRUID, 11, 144, 165)
    ,(@CLASS_DRUID, 12, 151, 182)
    ,(@CLASS_DRUID, 13, 168, 200)
    ,(@CLASS_DRUID, 14, 175, 219)
    ,(@CLASS_DRUID, 15, 182, 239)
    ,(@CLASS_DRUID, 16, 199, 260)
    ,(@CLASS_DRUID, 17, 206, 282)
    ,(@CLASS_DRUID, 18, 214, 305)
    ,(@CLASS_DRUID, 19, 233, 329)
    ,(@CLASS_DRUID, 20, 243, 354)
    ,(@CLASS_DRUID, 21, 254, 380)
    ,(@CLASS_DRUID, 22, 266, 392)
    ,(@CLASS_DRUID, 23, 289, 420)
    ,(@CLASS_DRUID, 24, 303, 449)
    ,(@CLASS_DRUID, 25, 318, 479)
    ,(@CLASS_DRUID, 26, 334, 509)
    ,(@CLASS_DRUID, 27, 361, 524)
    ,(@CLASS_DRUID, 28, 379, 554)
    ,(@CLASS_DRUID, 29, 398, 584)
    ,(@CLASS_DRUID, 30, 418, 614)
    ,(@CLASS_DRUID, 31, 439, 629)
    ,(@CLASS_DRUID, 32, 461, 659)
    ,(@CLASS_DRUID, 33, 494, 689)
    ,(@CLASS_DRUID, 34, 518, 704)
    ,(@CLASS_DRUID, 35, 543, 734)
    ,(@CLASS_DRUID, 36, 569, 749)
    ,(@CLASS_DRUID, 37, 596, 779)
    ,(@CLASS_DRUID, 38, 624, 809)
    ,(@CLASS_DRUID, 39, 653, 824)
    ,(@CLASS_DRUID, 40, 683, 854)
    ,(@CLASS_DRUID, 41, 714, 869)
    ,(@CLASS_DRUID, 42, 746, 899)
    ,(@CLASS_DRUID, 43, 779, 914)
    ,(@CLASS_DRUID, 44, 823, 944)
    ,(@CLASS_DRUID, 45, 858, 959)
    ,(@CLASS_DRUID, 46, 894, 989)
    ,(@CLASS_DRUID, 47, 921, 1004)
    ,(@CLASS_DRUID, 48, 959, 1019)
    ,(@CLASS_DRUID, 49, 998, 1049)
    ,(@CLASS_DRUID, 50, 1038, 1064)
    ,(@CLASS_DRUID, 51, 1079, 1079)
    ,(@CLASS_DRUID, 52, 1121, 1109)
    ,(@CLASS_DRUID, 53, 1164, 1124)
    ,(@CLASS_DRUID, 54, 1208, 1139)
    ,(@CLASS_DRUID, 55, 1253, 1154)
    ,(@CLASS_DRUID, 56, 1299, 1169)
    ,(@CLASS_DRUID, 57, 1346, 1199)
    ,(@CLASS_DRUID, 58, 1384, 1214)
    ,(@CLASS_DRUID, 59, 1433, 1229)
    ,(@CLASS_DRUID, 60, 1483, 1244)
;

-- Insert race based leveling stat changes -----------------------------------
INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_WARRIOR, 1, 23, 20, 22, 20, 21)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 2, 24, 21, 23, 20, 21)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 3, 25, 21, 24, 20, 22)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 4, 26, 22, 25, 20, 22)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 5, 28, 23, 26, 20, 22)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 6, 29, 24, 27, 21, 22)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 7, 30, 24, 28, 21, 23)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 8, 31, 25, 29, 21, 23)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 9, 32, 26, 30, 21, 23)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 10, 33, 26, 31, 21, 24)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 11, 35, 27, 33, 21, 24)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 12, 36, 28, 34, 21, 24)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 13, 37, 29, 35, 21, 25)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 14, 39, 30, 36, 22, 25)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 15, 40, 30, 37, 22, 25)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 16, 41, 31, 38, 22, 26)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 17, 42, 32, 40, 22, 26)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 18, 44, 33, 41, 22, 26)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 19, 44, 33, 41, 22, 26)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 20, 47, 35, 43, 22, 27)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 21, 48, 35, 45, 23, 27)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 22, 49, 36, 46, 23, 28)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 23, 51, 37, 47, 23, 28)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 24, 52, 38, 49, 23, 29)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 25, 54, 39, 50, 23, 29)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 26, 55, 40, 51, 23, 29)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 27, 57, 41, 53, 23, 30)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 28, 58, 42, 54, 24, 30)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 29, 60, 43, 56, 24, 31)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 30, 62, 44, 57, 24, 31)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 31, 63, 45, 58, 24, 31)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 32, 65, 46, 60, 24, 32)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 33, 66, 47, 61, 24, 32)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 34, 68, 48, 63, 25, 33)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 35, 70, 49, 64, 25, 33)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 36, 72, 50, 66, 25, 34)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 37, 73, 51, 68, 25, 34)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 38, 75, 52, 69, 25, 34)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 39, 77, 53, 71, 26, 35)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 40, 79, 54, 72, 26, 35)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 41, 80, 56, 74, 26, 36)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 42, 82, 57, 76, 26, 36)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 43, 84, 58, 77, 26, 37)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 44, 86, 59, 79, 26, 37)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 45, 88, 60, 81, 27, 38)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 46, 90, 61, 83, 27, 38)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 47, 92, 63, 84, 27, 39)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 48, 94, 64, 86, 27, 39)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 49, 96, 65, 88, 28, 40)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 50, 98, 66, 90, 28, 40)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 51, 100, 68, 92, 28, 42)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 52, 102, 69, 94, 28, 42)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 53, 104, 70, 96, 28, 43)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 54, 106, 72, 98, 29, 44)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 55, 109, 73, 100, 29, 44)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 56, 111, 74, 102, 29, 45)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 57, 113, 76, 104, 29, 45)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 58, 115, 77, 106, 30, 46)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 59, 118, 79, 108, 30, 46)
    ,(@RACE_HUMAN, @CLASS_WARRIOR, 60, 120, 80, 110, 30, 47)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_PALADIN, 1, 22, 20, 22, 20, 22)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 2, 23, 21, 23, 21, 23)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 3, 24, 21, 24, 21, 23)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 4, 25, 22, 25, 22, 24)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 5, 26, 22, 26, 22, 25)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 6, 27, 23, 27, 23, 25)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 7, 28, 23, 28, 24, 26)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 8, 29, 24, 28, 24, 26)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 9, 30, 24, 29, 25, 27)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 10, 31, 25, 30, 25, 28)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 11, 32, 25, 31, 26, 29)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 12, 33, 26, 32, 27, 29)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 13, 34, 27, 33, 27, 30)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 14, 35, 27, 34, 28, 31)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 15, 36, 28, 36, 29, 31)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 16, 38, 28, 37, 29, 32)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 17, 39, 29, 38, 30, 33)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 18, 40, 30, 39, 31, 34)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 19, 41, 30, 40, 31, 34)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 20, 42, 31, 41, 32, 35)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 21, 43, 32, 42, 33, 36)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 22, 45, 32, 43, 34, 37)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 23, 46, 33, 44, 34, 38)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 24, 47, 34, 46, 35, 38)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 25, 48, 34, 47, 36, 39)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 26, 50, 35, 48, 37, 40)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 27, 51, 36, 49, 37, 42)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 28, 52, 36, 50, 38, 43)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 29, 54, 37, 52, 39, 44)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 30, 55, 38, 53, 40, 44)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 31, 56, 39, 54, 41, 45)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 32, 58, 39, 56, 42, 46)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 33, 59, 40, 57, 42, 47)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 34, 61, 41, 58, 43, 48)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 35, 62, 42, 60, 44, 49)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 36, 64, 43, 61, 45, 50)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 37, 65, 43, 62, 46, 51)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 38, 67, 44, 64, 47, 52)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 39, 68, 45, 65, 48, 53)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 40, 70, 46, 67, 49, 54)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 41, 71, 47, 68, 50, 55)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 42, 73, 47, 70, 51, 56)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 43, 74, 48, 71, 52, 57)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 44, 76, 49, 73, 52, 58)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 45, 78, 50, 74, 53, 59)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 46, 79, 51, 76, 54, 60)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 47, 81, 52, 77, 56, 61)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 48, 83, 53, 79, 57, 63)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 49, 84, 54, 81, 58, 65)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 50, 86, 55, 82, 59, 66)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 51, 88, 56, 84, 60, 67)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 52, 90, 57, 86, 61, 68)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 53, 92, 58, 87, 62, 69)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 54, 93, 59, 89, 63, 70)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 55, 95, 60, 91, 64, 72)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 56, 97, 61, 93, 65, 73)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 57, 99, 62, 94, 66, 74)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 58, 101, 63, 96, 68, 75)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 59, 103, 64, 98, 69, 77)
    ,(@RACE_HUMAN, @CLASS_PALADIN, 60, 105, 65, 100, 70, 78)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_ROGUE, 1, 21, 23, 21, 20, 20)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 2, 22, 24, 22, 20, 21)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 3, 22, 25, 22, 20, 22)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 4, 23, 27, 23, 21, 22)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 5, 24, 28, 24, 21, 22)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 6, 24, 29, 24, 21, 23)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 7, 25, 31, 25, 21, 23)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 8, 26, 32, 25, 21, 23)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 9, 27, 33, 26, 21, 24)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 10, 27, 35, 27, 22, 24)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 11, 28, 36, 28, 22, 25)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 12, 29, 37, 28, 22, 25)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 13, 30, 39, 29, 22, 25)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 14, 30, 40, 30, 22, 26)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 15, 31, 42, 30, 23, 26)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 16, 32, 43, 31, 23, 27)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 17, 33, 44, 32, 23, 27)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 18, 34, 46, 33, 23, 27)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 19, 35, 48, 33, 23, 28)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 20, 35, 49, 34, 24, 28)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 21, 36, 51, 35, 24, 29)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 22, 37, 52, 36, 24, 29)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 23, 38, 54, 37, 24, 30)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 24, 39, 55, 37, 25, 30)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 25, 40, 57, 38, 25, 31)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 26, 41, 59, 39, 25, 31)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 27, 42, 60, 40, 25, 31)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 28, 43, 62, 41, 25, 32)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 29, 43, 64, 42, 26, 32)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 30, 44, 66, 42, 26, 33)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 31, 45, 67, 43, 26, 33)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 32, 46, 69, 44, 26, 34)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 33, 47, 71, 45, 27, 34)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 34, 48, 73, 46, 27, 35)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 35, 49, 75, 47, 27, 35)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 36, 51, 77, 48, 28, 36)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 37, 52, 78, 49, 28, 37)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 38, 53, 80, 50, 28, 37)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 39, 54, 82, 51, 28, 38)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 40, 55, 84, 52, 29, 38)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 41, 56, 86, 53, 29, 39)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 42, 57, 88, 54, 29, 39)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 43, 58, 90, 55, 29, 40)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 44, 59, 93, 56, 30, 40)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 45, 61, 95, 57, 30, 42)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 46, 62, 97, 58, 30, 43)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 47, 63, 99, 59, 31, 43)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 48, 64, 101, 60, 31, 44)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 49, 65, 103, 62, 31, 45)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 50, 67, 106, 63, 32, 45)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 51, 68, 108, 64, 32, 46)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 52, 69, 110, 65, 32, 46)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 53, 70, 113, 66, 33, 47)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 54, 72, 115, 67, 33, 48)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 55, 73, 117, 69, 33, 48)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 56, 74, 120, 70, 34, 49)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 57, 76, 122, 71, 34, 50)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 58, 77, 125, 72, 34, 51)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 59, 79, 127, 74, 35, 51)
    ,(@RACE_HUMAN, @CLASS_ROGUE, 60, 80, 130, 75, 35, 52)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_PRIEST, 1, 20, 20, 20, 22, 24)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 2, 20, 20, 20, 23, 25)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 3, 20, 20, 21, 24, 26)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 4, 21, 21, 21, 25, 28)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 5, 21, 21, 21, 27, 29)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 6, 21, 21, 22, 28, 30)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 7, 21, 21, 22, 29, 31)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 8, 21, 22, 22, 30, 32)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 9, 21, 22, 23, 31, 34)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 10, 22, 22, 23, 33, 35)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 11, 22, 22, 24, 34, 36)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 12, 22, 23, 24, 35, 38)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 13, 22, 23, 24, 36, 39)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 14, 22, 23, 25, 38, 40)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 15, 23, 23, 25, 39, 43)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 16, 23, 24, 26, 40, 44)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 17, 23, 24, 26, 42, 45)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 18, 23, 24, 26, 43, 47)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 19, 23, 25, 27, 44, 48)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 20, 24, 25, 27, 46, 50)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 21, 24, 25, 28, 47, 51)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 22, 24, 25, 28, 49, 53)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 23, 24, 26, 29, 50, 54)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 24, 25, 26, 29, 52, 56)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 25, 25, 26, 30, 53, 57)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 26, 25, 27, 30, 55, 59)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 27, 25, 27, 30, 56, 61)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 28, 25, 27, 31, 58, 63)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 29, 26, 28, 31, 59, 65)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 30, 26, 28, 32, 61, 67)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 31, 26, 28, 32, 63, 68)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 32, 26, 29, 33, 64, 70)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 33, 27, 29, 33, 66, 72)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 34, 27, 29, 34, 68, 73)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 35, 27, 30, 34, 69, 75)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 36, 28, 30, 35, 71, 77)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 37, 28, 30, 36, 73, 79)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 38, 28, 31, 36, 75, 81)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 39, 28, 31, 37, 76, 84)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 40, 29, 31, 37, 78, 85)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 41, 29, 32, 38, 80, 87)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 42, 29, 32, 38, 82, 89)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 43, 29, 33, 39, 84, 91)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 44, 30, 33, 39, 86, 93)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 45, 30, 33, 40, 88, 95)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 46, 30, 34, 41, 90, 97)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 47, 31, 34, 41, 92, 99)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 48, 31, 35, 42, 94, 102)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 49, 31, 35, 43, 96, 105)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 50, 32, 35, 43, 98, 107)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 51, 32, 36, 44, 100, 109)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 52, 32, 36, 44, 102, 111)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 53, 33, 37, 45, 104, 113)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 54, 33, 37, 46, 106, 116)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 55, 33, 38, 46, 109, 118)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 56, 34, 38, 47, 111, 120)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 57, 34, 39, 48, 113, 123)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 58, 34, 39, 49, 115, 126)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 59, 35, 40, 49, 118, 129)
    ,(@RACE_HUMAN, @CLASS_PRIEST, 60, 35, 40, 50, 120, 131)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_MAGE, 1, 20, 20, 20, 23, 22)
    ,(@RACE_HUMAN, @CLASS_MAGE, 2, 20, 20, 20, 24, 24)
    ,(@RACE_HUMAN, @CLASS_MAGE, 3, 20, 20, 21, 25, 25)
    ,(@RACE_HUMAN, @CLASS_MAGE, 4, 20, 21, 21, 27, 26)
    ,(@RACE_HUMAN, @CLASS_MAGE, 5, 20, 21, 21, 28, 28)
    ,(@RACE_HUMAN, @CLASS_MAGE, 6, 21, 21, 21, 29, 29)
    ,(@RACE_HUMAN, @CLASS_MAGE, 7, 21, 21, 22, 30, 30)
    ,(@RACE_HUMAN, @CLASS_MAGE, 8, 21, 21, 22, 31, 31)
    ,(@RACE_HUMAN, @CLASS_MAGE, 9, 21, 21, 22, 33, 32)
    ,(@RACE_HUMAN, @CLASS_MAGE, 10, 21, 22, 23, 34, 34)
    ,(@RACE_HUMAN, @CLASS_MAGE, 11, 21, 22, 23, 35, 35)
    ,(@RACE_HUMAN, @CLASS_MAGE, 12, 21, 22, 23, 37, 36)
    ,(@RACE_HUMAN, @CLASS_MAGE, 13, 21, 22, 24, 38, 37)
    ,(@RACE_HUMAN, @CLASS_MAGE, 14, 22, 22, 24, 39, 39)
    ,(@RACE_HUMAN, @CLASS_MAGE, 15, 22, 23, 24, 41, 40)
    ,(@RACE_HUMAN, @CLASS_MAGE, 16, 22, 23, 25, 42, 42)
    ,(@RACE_HUMAN, @CLASS_MAGE, 17, 22, 23, 25, 43, 44)
    ,(@RACE_HUMAN, @CLASS_MAGE, 18, 22, 23, 25, 45, 45)
    ,(@RACE_HUMAN, @CLASS_MAGE, 19, 22, 23, 26, 46, 46)
    ,(@RACE_HUMAN, @CLASS_MAGE, 20, 22, 24, 26, 48, 48)
    ,(@RACE_HUMAN, @CLASS_MAGE, 21, 23, 24, 26, 49, 49)
    ,(@RACE_HUMAN, @CLASS_MAGE, 22, 23, 24, 27, 51, 51)
    ,(@RACE_HUMAN, @CLASS_MAGE, 23, 23, 24, 27, 52, 52)
    ,(@RACE_HUMAN, @CLASS_MAGE, 24, 23, 25, 28, 54, 54)
    ,(@RACE_HUMAN, @CLASS_MAGE, 25, 23, 25, 28, 55, 55)
    ,(@RACE_HUMAN, @CLASS_MAGE, 26, 23, 25, 28, 57, 57)
    ,(@RACE_HUMAN, @CLASS_MAGE, 27, 23, 25, 29, 59, 58)
    ,(@RACE_HUMAN, @CLASS_MAGE, 28, 24, 25, 29, 60, 60)
    ,(@RACE_HUMAN, @CLASS_MAGE, 29, 24, 26, 30, 62, 61)
    ,(@RACE_HUMAN, @CLASS_MAGE, 30, 24, 26, 30, 64, 64)
    ,(@RACE_HUMAN, @CLASS_MAGE, 31, 24, 26, 30, 65, 66)
    ,(@RACE_HUMAN, @CLASS_MAGE, 32, 24, 26, 31, 67, 67)
    ,(@RACE_HUMAN, @CLASS_MAGE, 33, 24, 27, 31, 69, 69)
    ,(@RACE_HUMAN, @CLASS_MAGE, 34, 25, 27, 32, 70, 71)
    ,(@RACE_HUMAN, @CLASS_MAGE, 35, 25, 27, 32, 72, 72)
    ,(@RACE_HUMAN, @CLASS_MAGE, 36, 25, 28, 33, 74, 74)
    ,(@RACE_HUMAN, @CLASS_MAGE, 37, 25, 28, 33, 76, 76)
    ,(@RACE_HUMAN, @CLASS_MAGE, 38, 25, 28, 33, 78, 78)
    ,(@RACE_HUMAN, @CLASS_MAGE, 39, 26, 28, 34, 80, 79)
    ,(@RACE_HUMAN, @CLASS_MAGE, 40, 26, 29, 34, 81, 81)
    ,(@RACE_HUMAN, @CLASS_MAGE, 41, 26, 29, 35, 83, 84)
    ,(@RACE_HUMAN, @CLASS_MAGE, 42, 26, 29, 35, 85, 86)
    ,(@RACE_HUMAN, @CLASS_MAGE, 43, 26, 29, 36, 87, 88)
    ,(@RACE_HUMAN, @CLASS_MAGE, 44, 26, 30, 36, 89, 90)
    ,(@RACE_HUMAN, @CLASS_MAGE, 45, 27, 30, 37, 91, 92)
    ,(@RACE_HUMAN, @CLASS_MAGE, 46, 27, 30, 37, 93, 94)
    ,(@RACE_HUMAN, @CLASS_MAGE, 47, 27, 31, 38, 95, 96)
    ,(@RACE_HUMAN, @CLASS_MAGE, 48, 27, 31, 38, 98, 98)
    ,(@RACE_HUMAN, @CLASS_MAGE, 49, 28, 31, 39, 100, 100)
    ,(@RACE_HUMAN, @CLASS_MAGE, 50, 28, 32, 39, 102, 102)
    ,(@RACE_HUMAN, @CLASS_MAGE, 51, 28, 32, 40, 104, 105)
    ,(@RACE_HUMAN, @CLASS_MAGE, 52, 28, 32, 40, 106, 107)
    ,(@RACE_HUMAN, @CLASS_MAGE, 53, 28, 33, 41, 108, 109)
    ,(@RACE_HUMAN, @CLASS_MAGE, 54, 29, 33, 42, 111, 111)
    ,(@RACE_HUMAN, @CLASS_MAGE, 55, 29, 33, 42, 113, 114)
    ,(@RACE_HUMAN, @CLASS_MAGE, 56, 29, 34, 43, 115, 116)
    ,(@RACE_HUMAN, @CLASS_MAGE, 57, 29, 34, 43, 118, 118)
    ,(@RACE_HUMAN, @CLASS_MAGE, 58, 30, 34, 44, 120, 120)
    ,(@RACE_HUMAN, @CLASS_MAGE, 59, 30, 35, 44, 123, 123)
    ,(@RACE_HUMAN, @CLASS_MAGE, 60, 30, 35, 45, 125, 126)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_HUMAN, @CLASS_WARLOCK, 1, 20, 20, 21, 22, 22)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 2, 20, 20, 22, 23, 24)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 3, 21, 21, 22, 24, 25)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 4, 21, 21, 23, 25, 26)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 5, 21, 21, 23, 26, 27)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 6, 21, 22, 24, 27, 28)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 7, 22, 22, 24, 28, 30)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 8, 22, 22, 25, 29, 31)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 9, 22, 23, 25, 30, 32)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 10, 23, 23, 26, 31, 33)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 11, 23, 24, 26, 33, 34)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 12, 23, 24, 27, 34, 35)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 13, 24, 24, 27, 35, 37)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 14, 24, 25, 28, 36, 38)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 15, 24, 25, 29, 37, 39)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 16, 25, 26, 29, 38, 40)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 17, 25, 26, 30, 40, 43)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 18, 25, 26, 30, 41, 44)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 19, 26, 27, 31, 42, 45)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 20, 26, 27, 32, 43, 47)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 21, 26, 28, 32, 45, 48)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 22, 27, 28, 33, 46, 49)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 23, 27, 29, 34, 47, 51)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 24, 28, 29, 34, 49, 52)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 25, 28, 30, 35, 50, 54)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 26, 28, 30, 36, 51, 55)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 27, 29, 30, 36, 53, 56)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 28, 29, 31, 37, 54, 58)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 29, 30, 31, 38, 56, 59)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 30, 30, 32, 38, 57, 61)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 31, 30, 32, 39, 58, 64)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 32, 31, 33, 40, 60, 65)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 33, 31, 33, 41, 61, 67)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 34, 32, 34, 41, 63, 68)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 35, 32, 34, 42, 64, 70)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 36, 33, 35, 43, 66, 72)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 37, 33, 36, 44, 68, 73)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 38, 33, 36, 45, 69, 75)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 39, 34, 37, 45, 71, 77)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 40, 34, 37, 46, 72, 78)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 41, 35, 38, 47, 74, 80)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 42, 35, 38, 48, 76, 82)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 43, 36, 39, 48, 77, 86)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 44, 36, 39, 50, 79, 86)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 45, 37, 40, 50, 81, 88)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 46, 37, 41, 51, 83, 90)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 47, 38, 41, 52, 84, 92)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 48, 38, 42, 53, 86, 94)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 49, 39, 43, 54, 88, 96)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 50, 39, 43, 55, 90, 98)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 51, 40, 44, 56, 92, 100)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 52, 40, 44, 57, 94, 102)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 53, 41, 45, 58, 96, 105)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 54, 42, 46, 59, 98, 107)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 55, 42, 46, 60, 100, 109)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 56, 43, 47, 61, 102, 111)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 57, 43, 48, 62, 104, 113)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 58, 44, 49, 63, 106, 116)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 59, 44, 49, 64, 108, 118)
    ,(@RACE_HUMAN, @CLASS_WARLOCK, 60, 45, 50, 65, 110, 120)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_ORC, @CLASS_WARRIOR, 1, 26, 17, 24, 17, 23)
    ,(@RACE_ORC, @CLASS_WARRIOR, 2, 27, 18, 25, 17, 23)
    ,(@RACE_ORC, @CLASS_WARRIOR, 3, 28, 18, 26, 17, 24)
    ,(@RACE_ORC, @CLASS_WARRIOR, 4, 29, 19, 27, 17, 24)
    ,(@RACE_ORC, @CLASS_WARRIOR, 5, 31, 20, 28, 17, 24)
    ,(@RACE_ORC, @CLASS_WARRIOR, 6, 32, 21, 29, 18, 24)
    ,(@RACE_ORC, @CLASS_WARRIOR, 7, 33, 21, 30, 18, 25)
    ,(@RACE_ORC, @CLASS_WARRIOR, 8, 34, 22, 31, 18, 25)
    ,(@RACE_ORC, @CLASS_WARRIOR, 9, 35, 23, 32, 18, 25)
    ,(@RACE_ORC, @CLASS_WARRIOR, 10, 36, 23, 33, 18, 26)
    ,(@RACE_ORC, @CLASS_WARRIOR, 11, 38, 24, 35, 18, 26)
    ,(@RACE_ORC, @CLASS_WARRIOR, 12, 39, 25, 36, 18, 26)
    ,(@RACE_ORC, @CLASS_WARRIOR, 13, 40, 26, 37, 18, 27)
    ,(@RACE_ORC, @CLASS_WARRIOR, 14, 42, 27, 38, 19, 27)
    ,(@RACE_ORC, @CLASS_WARRIOR, 15, 43, 27, 39, 19, 27)
    ,(@RACE_ORC, @CLASS_WARRIOR, 16, 44, 28, 40, 19, 28)
    ,(@RACE_ORC, @CLASS_WARRIOR, 17, 45, 29, 42, 19, 28)
    ,(@RACE_ORC, @CLASS_WARRIOR, 18, 47, 30, 43, 19, 28)
    ,(@RACE_ORC, @CLASS_WARRIOR, 19, 48, 31, 44, 19, 29)
    ,(@RACE_ORC, @CLASS_WARRIOR, 20, 50, 32, 45, 19, 29)
    ,(@RACE_ORC, @CLASS_WARRIOR, 21, 51, 32, 47, 20, 29)
    ,(@RACE_ORC, @CLASS_WARRIOR, 22, 52, 33, 48, 20, 30)
    ,(@RACE_ORC, @CLASS_WARRIOR, 23, 54, 34, 49, 20, 30)
    ,(@RACE_ORC, @CLASS_WARRIOR, 24, 55, 35, 51, 20, 31)
    ,(@RACE_ORC, @CLASS_WARRIOR, 25, 57, 36, 52, 20, 31)
    ,(@RACE_ORC, @CLASS_WARRIOR, 26, 58, 37, 53, 20, 31)
    ,(@RACE_ORC, @CLASS_WARRIOR, 27, 60, 38, 55, 20, 32)
    ,(@RACE_ORC, @CLASS_WARRIOR, 28, 61, 39, 56, 21, 32)
    ,(@RACE_ORC, @CLASS_WARRIOR, 29, 63, 40, 58, 21, 33)
    ,(@RACE_ORC, @CLASS_WARRIOR, 30, 65, 41, 59, 21, 33)
    ,(@RACE_ORC, @CLASS_WARRIOR, 31, 66, 42, 60, 21, 33)
    ,(@RACE_ORC, @CLASS_WARRIOR, 32, 68, 43, 62, 21, 34)
    ,(@RACE_ORC, @CLASS_WARRIOR, 33, 69, 44, 63, 21, 34)
    ,(@RACE_ORC, @CLASS_WARRIOR, 34, 71, 45, 65, 22, 35)
    ,(@RACE_ORC, @CLASS_WARRIOR, 35, 73, 46, 66, 22, 35)
    ,(@RACE_ORC, @CLASS_WARRIOR, 36, 75, 47, 68, 22, 36)
    ,(@RACE_ORC, @CLASS_WARRIOR, 37, 76, 48, 70, 22, 36)
    ,(@RACE_ORC, @CLASS_WARRIOR, 38, 78, 49, 71, 22, 36)
    ,(@RACE_ORC, @CLASS_WARRIOR, 39, 80, 50, 73, 23, 37)
    ,(@RACE_ORC, @CLASS_WARRIOR, 40, 82, 51, 74, 23, 37)
    ,(@RACE_ORC, @CLASS_WARRIOR, 41, 83, 53, 76, 23, 38)
    ,(@RACE_ORC, @CLASS_WARRIOR, 42, 85, 54, 78, 23, 38)
    ,(@RACE_ORC, @CLASS_WARRIOR, 43, 87, 55, 79, 23, 39)
    ,(@RACE_ORC, @CLASS_WARRIOR, 44, 89, 56, 81, 23, 39)
    ,(@RACE_ORC, @CLASS_WARRIOR, 45, 91, 57, 83, 24, 40)
    ,(@RACE_ORC, @CLASS_WARRIOR, 46, 93, 58, 85, 24, 40)
    ,(@RACE_ORC, @CLASS_WARRIOR, 47, 95, 60, 86, 24, 41)
    ,(@RACE_ORC, @CLASS_WARRIOR, 48, 97, 61, 88, 24, 41)
    ,(@RACE_ORC, @CLASS_WARRIOR, 49, 99, 62, 90, 25, 42)
    ,(@RACE_ORC, @CLASS_WARRIOR, 50, 101, 63, 92, 25, 42)
    ,(@RACE_ORC, @CLASS_WARRIOR, 51, 103, 65, 94, 25, 43)
    ,(@RACE_ORC, @CLASS_WARRIOR, 52, 105, 66, 96, 25, 43)
    ,(@RACE_ORC, @CLASS_WARRIOR, 53, 107, 67, 98, 25, 44)
    ,(@RACE_ORC, @CLASS_WARRIOR, 54, 109, 69, 100, 26, 45)
    ,(@RACE_ORC, @CLASS_WARRIOR, 55, 112, 70, 102, 26, 45)
    ,(@RACE_ORC, @CLASS_WARRIOR, 56, 114, 71, 104, 26, 46)
    ,(@RACE_ORC, @CLASS_WARRIOR, 57, 116, 73, 106, 26, 46)
    ,(@RACE_ORC, @CLASS_WARRIOR, 58, 118, 74, 108, 27, 47)
    ,(@RACE_ORC, @CLASS_WARRIOR, 59, 121, 76, 110, 27, 47)
    ,(@RACE_ORC, @CLASS_WARRIOR, 60, 123, 77, 112, 27, 48)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_ORC, @CLASS_HUNTER, 1, 23, 20, 23, 17, 24)
    ,(@RACE_ORC, @CLASS_HUNTER, 2, 23, 21, 24, 18, 25)
    ,(@RACE_ORC, @CLASS_HUNTER, 3, 24, 22, 25, 18, 25)
    ,(@RACE_ORC, @CLASS_HUNTER, 4, 24, 24, 25, 19, 26)
    ,(@RACE_ORC, @CLASS_HUNTER, 5, 25, 25, 26, 19, 26)
    ,(@RACE_ORC, @CLASS_HUNTER, 6, 25, 26, 27, 20, 27)
    ,(@RACE_ORC, @CLASS_HUNTER, 7, 25, 27, 28, 20, 27)
    ,(@RACE_ORC, @CLASS_HUNTER, 8, 26, 28, 29, 21, 28)
    ,(@RACE_ORC, @CLASS_HUNTER, 9, 26, 30, 30, 21, 29)
    ,(@RACE_ORC, @CLASS_HUNTER, 10, 27, 31, 30, 22, 29)
    ,(@RACE_ORC, @CLASS_HUNTER, 11, 27, 32, 31, 22, 30)
    ,(@RACE_ORC, @CLASS_HUNTER, 12, 28, 34, 32, 23, 31)
    ,(@RACE_ORC, @CLASS_HUNTER, 13, 28, 35, 33, 24, 31)
    ,(@RACE_ORC, @CLASS_HUNTER, 14, 29, 36, 34, 24, 32)
    ,(@RACE_ORC, @CLASS_HUNTER, 15, 29, 38, 35, 25, 32)
    ,(@RACE_ORC, @CLASS_HUNTER, 16, 30, 39, 36, 25, 33)
    ,(@RACE_ORC, @CLASS_HUNTER, 17, 30, 40, 37, 26, 34)
    ,(@RACE_ORC, @CLASS_HUNTER, 18, 31, 42, 38, 27, 35)
    ,(@RACE_ORC, @CLASS_HUNTER, 19, 31, 43, 39, 27, 35)
    ,(@RACE_ORC, @CLASS_HUNTER, 20, 32, 45, 40, 28, 36)
    ,(@RACE_ORC, @CLASS_HUNTER, 21, 32, 46, 41, 29, 37)
    ,(@RACE_ORC, @CLASS_HUNTER, 22, 33, 48, 42, 29, 37)
    ,(@RACE_ORC, @CLASS_HUNTER, 23, 33, 49, 43, 30, 38)
    ,(@RACE_ORC, @CLASS_HUNTER, 24, 34, 51, 44, 31, 39)
    ,(@RACE_ORC, @CLASS_HUNTER, 25, 34, 52, 45, 31, 40)
    ,(@RACE_ORC, @CLASS_HUNTER, 26, 35, 54, 46, 32, 40)
    ,(@RACE_ORC, @CLASS_HUNTER, 27, 35, 56, 47, 33, 41)
    ,(@RACE_ORC, @CLASS_HUNTER, 28, 36, 57, 48, 33, 42)
    ,(@RACE_ORC, @CLASS_HUNTER, 29, 36, 59, 49, 34, 43)
    ,(@RACE_ORC, @CLASS_HUNTER, 30, 37, 61, 50, 35, 43)
    ,(@RACE_ORC, @CLASS_HUNTER, 31, 37, 62, 52, 36, 44)
    ,(@RACE_ORC, @CLASS_HUNTER, 32, 38, 64, 53, 36, 45)
    ,(@RACE_ORC, @CLASS_HUNTER, 33, 39, 66, 54, 37, 46)
    ,(@RACE_ORC, @CLASS_HUNTER, 34, 39, 67, 55, 38, 47)
    ,(@RACE_ORC, @CLASS_HUNTER, 35, 40, 69, 56, 39, 48)
    ,(@RACE_ORC, @CLASS_HUNTER, 36, 41, 71, 58, 40, 49)
    ,(@RACE_ORC, @CLASS_HUNTER, 37, 41, 73, 59, 40, 49)
    ,(@RACE_ORC, @CLASS_HUNTER, 38, 42, 75, 60, 41, 50)
    ,(@RACE_ORC, @CLASS_HUNTER, 39, 42, 77, 61, 42, 51)
    ,(@RACE_ORC, @CLASS_HUNTER, 40, 43, 78, 63, 43, 52)
    ,(@RACE_ORC, @CLASS_HUNTER, 41, 44, 80, 64, 44, 53)
    ,(@RACE_ORC, @CLASS_HUNTER, 42, 44, 82, 65, 44, 54)
    ,(@RACE_ORC, @CLASS_HUNTER, 43, 45, 84, 66, 45, 55)
    ,(@RACE_ORC, @CLASS_HUNTER, 44, 46, 86, 68, 46, 56)
    ,(@RACE_ORC, @CLASS_HUNTER, 45, 46, 88, 69, 47, 57)
    ,(@RACE_ORC, @CLASS_HUNTER, 46, 47, 90, 71, 48, 58)
    ,(@RACE_ORC, @CLASS_HUNTER, 47, 48, 92, 72, 49, 59)
    ,(@RACE_ORC, @CLASS_HUNTER, 48, 49, 95, 73, 50, 60)
    ,(@RACE_ORC, @CLASS_HUNTER, 49, 49, 97, 75, 51, 61)
    ,(@RACE_ORC, @CLASS_HUNTER, 50, 50, 99, 76, 52, 62)
    ,(@RACE_ORC, @CLASS_HUNTER, 51, 51, 101, 78, 53, 63)
    ,(@RACE_ORC, @CLASS_HUNTER, 52, 52, 103, 79, 54, 64)
    ,(@RACE_ORC, @CLASS_HUNTER, 53, 52, 105, 81, 55, 65)
    ,(@RACE_ORC, @CLASS_HUNTER, 54, 53, 108, 82, 56, 66)
    ,(@RACE_ORC, @CLASS_HUNTER, 55, 54, 110, 84, 57, 67)
    ,(@RACE_ORC, @CLASS_HUNTER, 56, 55, 112, 85, 58, 68)
    ,(@RACE_ORC, @CLASS_HUNTER, 57, 56, 115, 87, 59, 70)
    ,(@RACE_ORC, @CLASS_HUNTER, 58, 56, 117, 89, 60, 71)
    ,(@RACE_ORC, @CLASS_HUNTER, 59, 57, 120, 90, 61, 72)
    ,(@RACE_ORC, @CLASS_HUNTER, 60, 58, 122, 92, 62, 73)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_ORC, @CLASS_ROGUE, 1, 24, 20, 23, 17, 23)
    ,(@RACE_ORC, @CLASS_ROGUE, 2, 25, 21, 24, 17, 23)
    ,(@RACE_ORC, @CLASS_ROGUE, 3, 25, 22, 24, 17, 24)
    ,(@RACE_ORC, @CLASS_ROGUE, 4, 26, 24, 25, 18, 24)
    ,(@RACE_ORC, @CLASS_ROGUE, 5, 27, 25, 26, 18, 24)
    ,(@RACE_ORC, @CLASS_ROGUE, 6, 27, 26, 26, 18, 25)
    ,(@RACE_ORC, @CLASS_ROGUE, 7, 28, 28, 27, 18, 25)
    ,(@RACE_ORC, @CLASS_ROGUE, 8, 29, 29, 27, 18, 25)
    ,(@RACE_ORC, @CLASS_ROGUE, 9, 30, 30, 28, 18, 26)
    ,(@RACE_ORC, @CLASS_ROGUE, 10, 30, 32, 29, 19, 26)
    ,(@RACE_ORC, @CLASS_ROGUE, 11, 31, 33, 30, 19, 27)
    ,(@RACE_ORC, @CLASS_ROGUE, 12, 32, 34, 30, 19, 27)
    ,(@RACE_ORC, @CLASS_ROGUE, 13, 33, 36, 31, 19, 27)
    ,(@RACE_ORC, @CLASS_ROGUE, 14, 33, 37, 32, 19, 28)
    ,(@RACE_ORC, @CLASS_ROGUE, 15, 34, 39, 32, 20, 28)
    ,(@RACE_ORC, @CLASS_ROGUE, 16, 35, 40, 33, 20, 29)
    ,(@RACE_ORC, @CLASS_ROGUE, 17, 36, 41, 34, 20, 29)
    ,(@RACE_ORC, @CLASS_ROGUE, 18, 37, 43, 35, 20, 29)
    ,(@RACE_ORC, @CLASS_ROGUE, 19, 37, 43, 35, 20, 29)
    ,(@RACE_ORC, @CLASS_ROGUE, 20, 37, 43, 35, 20, 29)
    ,(@RACE_ORC, @CLASS_ROGUE, 21, 39, 48, 37, 21, 31)
    ,(@RACE_ORC, @CLASS_ROGUE, 22, 40, 49, 38, 21, 31)
    ,(@RACE_ORC, @CLASS_ROGUE, 23, 41, 51, 39, 21, 32)
    ,(@RACE_ORC, @CLASS_ROGUE, 24, 42, 52, 39, 22, 32)
    ,(@RACE_ORC, @CLASS_ROGUE, 25, 43, 54, 40, 22, 33)
    ,(@RACE_ORC, @CLASS_ROGUE, 26, 44, 56, 41, 22, 33)
    ,(@RACE_ORC, @CLASS_ROGUE, 27, 45, 57, 42, 22, 33)
    ,(@RACE_ORC, @CLASS_ROGUE, 28, 46, 59, 43, 22, 34)
    ,(@RACE_ORC, @CLASS_ROGUE, 29, 46, 61, 44, 23, 34)
    ,(@RACE_ORC, @CLASS_ROGUE, 30, 47, 63, 44, 23, 35)
    ,(@RACE_ORC, @CLASS_ROGUE, 31, 48, 64, 45, 23, 35)
    ,(@RACE_ORC, @CLASS_ROGUE, 32, 49, 66, 46, 23, 36)
    ,(@RACE_ORC, @CLASS_ROGUE, 33, 50, 68, 47, 24, 36)
    ,(@RACE_ORC, @CLASS_ROGUE, 34, 51, 70, 48, 24, 37)
    ,(@RACE_ORC, @CLASS_ROGUE, 35, 52, 72, 49, 24, 37)
    ,(@RACE_ORC, @CLASS_ROGUE, 36, 54, 74, 50, 25, 38)
    ,(@RACE_ORC, @CLASS_ROGUE, 37, 55, 75, 51, 25, 39)
    ,(@RACE_ORC, @CLASS_ROGUE, 38, 56, 77, 52, 25, 39)
    ,(@RACE_ORC, @CLASS_ROGUE, 39, 57, 79, 53, 25, 40)
    ,(@RACE_ORC, @CLASS_ROGUE, 40, 58, 81, 54, 26, 40)
    ,(@RACE_ORC, @CLASS_ROGUE, 41, 59, 83, 55, 26, 41)
    ,(@RACE_ORC, @CLASS_ROGUE, 42, 60, 85, 56, 26, 41)
    ,(@RACE_ORC, @CLASS_ROGUE, 43, 61, 87, 57, 26, 42)
    ,(@RACE_ORC, @CLASS_ROGUE, 44, 62, 90, 58, 27, 42)
    ,(@RACE_ORC, @CLASS_ROGUE, 45, 64, 92, 59, 27, 43)
    ,(@RACE_ORC, @CLASS_ROGUE, 46, 65, 94, 60, 27, 44)
    ,(@RACE_ORC, @CLASS_ROGUE, 47, 66, 96, 61, 28, 44)
    ,(@RACE_ORC, @CLASS_ROGUE, 48, 67, 98, 62, 28, 45)
    ,(@RACE_ORC, @CLASS_ROGUE, 49, 68, 100, 64, 28, 46)
    ,(@RACE_ORC, @CLASS_ROGUE, 50, 70, 103, 65, 29, 46)
    ,(@RACE_ORC, @CLASS_ROGUE, 51, 71, 105, 66, 29, 47)
    ,(@RACE_ORC, @CLASS_ROGUE, 52, 72, 107, 67, 29, 47)
    ,(@RACE_ORC, @CLASS_ROGUE, 53, 73, 110, 68, 30, 48)
    ,(@RACE_ORC, @CLASS_ROGUE, 54, 75, 112, 69, 30, 49)
    ,(@RACE_ORC, @CLASS_ROGUE, 55, 76, 114, 71, 30, 49)
    ,(@RACE_ORC, @CLASS_ROGUE, 56, 77, 117, 72, 31, 50)
    ,(@RACE_ORC, @CLASS_ROGUE, 57, 79, 119, 73, 31, 51)
    ,(@RACE_ORC, @CLASS_ROGUE, 58, 80, 122, 74, 31, 52)
    ,(@RACE_ORC, @CLASS_ROGUE, 59, 82, 124, 76, 32, 52)
    ,(@RACE_ORC, @CLASS_ROGUE, 60, 83, 127, 77, 32, 53)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_ORC, @CLASS_SHAMAN, 1, 24, 17, 23, 18, 25)
    ,(@RACE_ORC, @CLASS_SHAMAN, 2, 25, 17, 24, 19, 26)
    ,(@RACE_ORC, @CLASS_SHAMAN, 3, 25, 18, 25, 20, 27)
    ,(@RACE_ORC, @CLASS_SHAMAN, 4, 26, 18, 26, 20, 28)
    ,(@RACE_ORC, @CLASS_SHAMAN, 5, 27, 19, 26, 21, 29)
    ,(@RACE_ORC, @CLASS_SHAMAN, 6, 28, 19, 27, 22, 30)
    ,(@RACE_ORC, @CLASS_SHAMAN, 7, 29, 19, 28, 23, 31)
    ,(@RACE_ORC, @CLASS_SHAMAN, 8, 29, 20, 29, 24, 31)
    ,(@RACE_ORC, @CLASS_SHAMAN, 9, 30, 20, 30, 25, 32)
    ,(@RACE_ORC, @CLASS_SHAMAN, 10, 31, 21, 31, 25, 33)
    ,(@RACE_ORC, @CLASS_SHAMAN, 11, 32, 21, 32, 26, 34)
    ,(@RACE_ORC, @CLASS_SHAMAN, 12, 33, 22, 33, 27, 35)
    ,(@RACE_ORC, @CLASS_SHAMAN, 13, 33, 22, 34, 28, 36)
    ,(@RACE_ORC, @CLASS_SHAMAN, 14, 34, 23, 35, 29, 37)
    ,(@RACE_ORC, @CLASS_SHAMAN, 15, 35, 23, 36, 30, 39)
    ,(@RACE_ORC, @CLASS_SHAMAN, 16, 36, 24, 37, 31, 40)
    ,(@RACE_ORC, @CLASS_SHAMAN, 17, 37, 24, 38, 32, 41)
    ,(@RACE_ORC, @CLASS_SHAMAN, 18, 38, 25, 39, 33, 42)
    ,(@RACE_ORC, @CLASS_SHAMAN, 19, 39, 25, 40, 34, 43)
    ,(@RACE_ORC, @CLASS_SHAMAN, 20, 40, 26, 41, 35, 44)
    ,(@RACE_ORC, @CLASS_SHAMAN, 21, 41, 26, 42, 36, 45)
    ,(@RACE_ORC, @CLASS_SHAMAN, 22, 41, 27, 43, 37, 46)
    ,(@RACE_ORC, @CLASS_SHAMAN, 23, 42, 27, 44, 38, 47)
    ,(@RACE_ORC, @CLASS_SHAMAN, 24, 43, 28, 45, 39, 49)
    ,(@RACE_ORC, @CLASS_SHAMAN, 25, 44, 28, 47, 40, 50)
    ,(@RACE_ORC, @CLASS_SHAMAN, 26, 45, 29, 48, 41, 51)
    ,(@RACE_ORC, @CLASS_SHAMAN, 27, 46, 29, 49, 42, 52)
    ,(@RACE_ORC, @CLASS_SHAMAN, 28, 47, 30, 50, 43, 53)
    ,(@RACE_ORC, @CLASS_SHAMAN, 29, 48, 30, 51, 44, 55)
    ,(@RACE_ORC, @CLASS_SHAMAN, 30, 49, 31, 52, 45, 56)
    ,(@RACE_ORC, @CLASS_SHAMAN, 31, 51, 31, 54, 47, 57)
    ,(@RACE_ORC, @CLASS_SHAMAN, 32, 52, 32, 55, 48, 59)
    ,(@RACE_ORC, @CLASS_SHAMAN, 33, 53, 33, 56, 49, 60)
    ,(@RACE_ORC, @CLASS_SHAMAN, 34, 54, 33, 57, 50, 61)
    ,(@RACE_ORC, @CLASS_SHAMAN, 35, 55, 34, 59, 51, 63)
    ,(@RACE_ORC, @CLASS_SHAMAN, 36, 56, 35, 60, 53, 64)
    ,(@RACE_ORC, @CLASS_SHAMAN, 37, 57, 35, 61, 54, 65)
    ,(@RACE_ORC, @CLASS_SHAMAN, 38, 58, 36, 63, 55, 67)
    ,(@RACE_ORC, @CLASS_SHAMAN, 39, 59, 36, 64, 56, 68)
    ,(@RACE_ORC, @CLASS_SHAMAN, 40, 61, 37, 65, 58, 70)
    ,(@RACE_ORC, @CLASS_SHAMAN, 41, 62, 38, 67, 59, 71)
    ,(@RACE_ORC, @CLASS_SHAMAN, 42, 63, 38, 68, 60, 73)
    ,(@RACE_ORC, @CLASS_SHAMAN, 43, 64, 39, 70, 61, 74)
    ,(@RACE_ORC, @CLASS_SHAMAN, 44, 66, 40, 71, 63, 76)
    ,(@RACE_ORC, @CLASS_SHAMAN, 45, 67, 40, 73, 64, 77)
    ,(@RACE_ORC, @CLASS_SHAMAN, 46, 68, 41, 74, 66, 79)
    ,(@RACE_ORC, @CLASS_SHAMAN, 47, 69, 42, 76, 67, 80)
    ,(@RACE_ORC, @CLASS_SHAMAN, 48, 71, 43, 77, 68, 82)
    ,(@RACE_ORC, @CLASS_SHAMAN, 49, 72, 43, 79, 70, 84)
    ,(@RACE_ORC, @CLASS_SHAMAN, 50, 73, 44, 80, 71, 85)
    ,(@RACE_ORC, @CLASS_SHAMAN, 51, 75, 45, 82, 73, 87)
    ,(@RACE_ORC, @CLASS_SHAMAN, 52, 76, 46, 83, 74, 89)
    ,(@RACE_ORC, @CLASS_SHAMAN, 53, 78, 46, 85, 76, 90)
    ,(@RACE_ORC, @CLASS_SHAMAN, 54, 79, 47, 87, 77, 92)
    ,(@RACE_ORC, @CLASS_SHAMAN, 55, 80, 48, 88, 79, 94)
    ,(@RACE_ORC, @CLASS_SHAMAN, 56, 82, 49, 90, 80, 96)
    ,(@RACE_ORC, @CLASS_SHAMAN, 57, 83, 50, 92, 82, 97)
    ,(@RACE_ORC, @CLASS_SHAMAN, 58, 85, 50, 93, 84, 99)
    ,(@RACE_ORC, @CLASS_SHAMAN, 59, 86, 51, 95, 85, 101)
    ,(@RACE_ORC, @CLASS_SHAMAN, 60, 88, 52, 97, 87, 103)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_ORC, @CLASS_WARLOCK, 1, 23, 17, 23, 19, 25)
    ,(@RACE_ORC, @CLASS_WARLOCK, 2, 23, 17, 24, 20, 26)
    ,(@RACE_ORC, @CLASS_WARLOCK, 3, 24, 18, 24, 21, 27)
    ,(@RACE_ORC, @CLASS_WARLOCK, 4, 24, 18, 25, 22, 28)
    ,(@RACE_ORC, @CLASS_WARLOCK, 5, 24, 18, 25, 23, 29)
    ,(@RACE_ORC, @CLASS_WARLOCK, 6, 24, 19, 26, 24, 30)
    ,(@RACE_ORC, @CLASS_WARLOCK, 7, 25, 19, 26, 25, 32)
    ,(@RACE_ORC, @CLASS_WARLOCK, 8, 25, 19, 27, 26, 33)
    ,(@RACE_ORC, @CLASS_WARLOCK, 9, 25, 20, 27, 27, 34)
    ,(@RACE_ORC, @CLASS_WARLOCK, 10, 26, 20, 28, 28, 35)
    ,(@RACE_ORC, @CLASS_WARLOCK, 11, 26, 21, 28, 30, 36)
    ,(@RACE_ORC, @CLASS_WARLOCK, 12, 26, 21, 29, 31, 37)
    ,(@RACE_ORC, @CLASS_WARLOCK, 13, 27, 21, 29, 32, 39)
    ,(@RACE_ORC, @CLASS_WARLOCK, 14, 27, 22, 30, 33, 40)
    ,(@RACE_ORC, @CLASS_WARLOCK, 15, 27, 22, 31, 34, 41)
    ,(@RACE_ORC, @CLASS_WARLOCK, 16, 28, 23, 31, 35, 42)
    ,(@RACE_ORC, @CLASS_WARLOCK, 17, 28, 23, 32, 37, 44)
    ,(@RACE_ORC, @CLASS_WARLOCK, 18, 28, 23, 32, 38, 45)
    ,(@RACE_ORC, @CLASS_WARLOCK, 19, 29, 24, 33, 39, 46)
    ,(@RACE_ORC, @CLASS_WARLOCK, 20, 29, 24, 34, 40, 48)
    ,(@RACE_ORC, @CLASS_WARLOCK, 21, 29, 25, 34, 42, 49)
    ,(@RACE_ORC, @CLASS_WARLOCK, 22, 30, 25, 34, 43, 50)
    ,(@RACE_ORC, @CLASS_WARLOCK, 23, 30, 26, 35, 44, 52)
    ,(@RACE_ORC, @CLASS_WARLOCK, 24, 31, 26, 35, 46, 53)
    ,(@RACE_ORC, @CLASS_WARLOCK, 25, 31, 27, 36, 47, 55)
    ,(@RACE_ORC, @CLASS_WARLOCK, 26, 31, 27, 37, 48, 56)
    ,(@RACE_ORC, @CLASS_WARLOCK, 27, 32, 27, 37, 50, 57)
    ,(@RACE_ORC, @CLASS_WARLOCK, 28, 32, 28, 38, 51, 59)
    ,(@RACE_ORC, @CLASS_WARLOCK, 29, 33, 28, 39, 53, 60)
    ,(@RACE_ORC, @CLASS_WARLOCK, 30, 33, 29, 39, 54, 62)
    ,(@RACE_ORC, @CLASS_WARLOCK, 31, 33, 29, 40, 55, 64)
    ,(@RACE_ORC, @CLASS_WARLOCK, 32, 34, 30, 41, 57, 65)
    ,(@RACE_ORC, @CLASS_WARLOCK, 33, 34, 30, 41, 58, 68)
    ,(@RACE_ORC, @CLASS_WARLOCK, 34, 35, 31, 42, 60, 68)
    ,(@RACE_ORC, @CLASS_WARLOCK, 35, 35, 31, 43, 61, 70)
    ,(@RACE_ORC, @CLASS_WARLOCK, 36, 36, 32, 44, 63, 71)
    ,(@RACE_ORC, @CLASS_WARLOCK, 37, 36, 33, 45, 65, 73)
    ,(@RACE_ORC, @CLASS_WARLOCK, 38, 36, 33, 46, 66, 75)
    ,(@RACE_ORC, @CLASS_WARLOCK, 39, 37, 34, 46, 68, 77)
    ,(@RACE_ORC, @CLASS_WARLOCK, 40, 37, 34, 47, 69, 78)
    ,(@RACE_ORC, @CLASS_WARLOCK, 41, 38, 35, 47, 71, 80)
    ,(@RACE_ORC, @CLASS_WARLOCK, 42, 38, 35, 47, 73, 83)
    ,(@RACE_ORC, @CLASS_WARLOCK, 43, 39, 36, 50, 74, 84)
    ,(@RACE_ORC, @CLASS_WARLOCK, 44, 39, 36, 51, 76, 85)
    ,(@RACE_ORC, @CLASS_WARLOCK, 45, 40, 37, 51, 78, 87)
    ,(@RACE_ORC, @CLASS_WARLOCK, 46, 40, 38, 52, 80, 89)
    ,(@RACE_ORC, @CLASS_WARLOCK, 47, 41, 38, 53, 81, 91)
    ,(@RACE_ORC, @CLASS_WARLOCK, 48, 41, 39, 53, 83, 93)
    ,(@RACE_ORC, @CLASS_WARLOCK, 49, 42, 40, 54, 85, 96)
    ,(@RACE_ORC, @CLASS_WARLOCK, 50, 42, 40, 56, 87, 97)
    ,(@RACE_ORC, @CLASS_WARLOCK, 51, 43, 41, 56, 89, 99)
    ,(@RACE_ORC, @CLASS_WARLOCK, 52, 43, 41, 58, 91, 101)
    ,(@RACE_ORC, @CLASS_WARLOCK, 53, 44, 42, 59, 93, 103)
    ,(@RACE_ORC, @CLASS_WARLOCK, 54, 45, 43, 60, 95, 105)
    ,(@RACE_ORC, @CLASS_WARLOCK, 55, 45, 43, 61, 97, 106)
    ,(@RACE_ORC, @CLASS_WARLOCK, 56, 46, 44, 62, 99, 109)
    ,(@RACE_ORC, @CLASS_WARLOCK, 57, 46, 45, 62, 101, 110)
    ,(@RACE_ORC, @CLASS_WARLOCK, 58, 47, 46, 64, 103, 114)
    ,(@RACE_ORC, @CLASS_WARLOCK, 59, 47, 46, 65, 105, 116)
    ,(@RACE_ORC, @CLASS_WARLOCK, 60, 48, 47, 66, 107, 118)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_DWARF, @CLASS_WARRIOR, 1, 25, 16, 25, 19, 19)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 2, 26, 17, 26, 19, 19)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 3, 27, 17, 27, 19, 20)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 4, 28, 18, 28, 19, 20)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 5, 30, 19, 29, 19, 20)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 6, 31, 20, 30, 20, 20)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 7, 32, 20, 31, 20, 21)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 8, 33, 21, 32, 20, 21)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 9, 34, 22, 33, 20, 21)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 10, 35, 22, 34, 20, 22)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 11, 37, 23, 36, 20, 22)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 12, 38, 24, 37, 20, 22)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 13, 39, 25, 38, 20, 23)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 14, 41, 26, 39, 21, 23)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 15, 42, 26, 40, 21, 23)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 16, 43, 27, 41, 21, 24)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 17, 44, 28, 43, 21, 24)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 18, 46, 29, 44, 21, 24)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 19, 47, 30, 45, 21, 25)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 20, 49, 31, 46, 21, 25)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 21, 50, 31, 48, 22, 25)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 22, 51, 32, 49, 22, 26)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 23, 53, 33, 50, 22, 26)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 24, 54, 34, 52, 22, 27)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 25, 56, 35, 53, 22, 27)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 26, 57, 36, 54, 22, 27)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 27, 59, 37, 56, 22, 28)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 28, 60, 38, 57, 23, 28)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 29, 62, 39, 59, 23, 29)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 30, 64, 40, 60, 23, 29)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 31, 65, 41, 61, 23, 29)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 32, 67, 42, 63, 23, 30)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 33, 68, 43, 64, 23, 30)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 34, 70, 44, 66, 24, 31)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 35, 72, 45, 67, 24, 31)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 36, 74, 46, 69, 24, 32)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 37, 75, 47, 71, 24, 32)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 38, 77, 48, 72, 24, 32)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 39, 79, 49, 74, 25, 33)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 40, 81, 50, 75, 25, 33)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 41, 82, 52, 77, 25, 34)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 42, 84, 53, 79, 25, 34)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 43, 86, 54, 80, 25, 35)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 44, 88, 55, 82, 25, 35)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 45, 90, 56, 84, 26, 36)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 46, 92, 57, 86, 26, 36)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 47, 94, 59, 87, 26, 37)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 48, 96, 60, 89, 26, 37)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 49, 98, 61, 91, 27, 38)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 50, 100, 62, 93, 27, 38)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 51, 102, 64, 95, 27, 39)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 52, 104, 65, 97, 27, 39)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 53, 106, 66, 99, 27, 40)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 54, 108, 68, 101, 28, 41)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 55, 111, 69, 103, 28, 41)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 56, 113, 70, 105, 28, 42)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 57, 115, 72, 107, 28, 42)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 58, 117, 73, 109, 29, 43)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 59, 120, 75, 111, 29, 43)
    ,(@RACE_DWARF, @CLASS_WARRIOR, 60, 122, 76, 113, 29, 44)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_DWARF, @CLASS_PALADIN, 1, 24, 16, 25, 19, 20)
    ,(@RACE_DWARF, @CLASS_PALADIN, 2, 25, 17, 26, 20, 21)
    ,(@RACE_DWARF, @CLASS_PALADIN, 3, 26, 17, 27, 20, 21)
    ,(@RACE_DWARF, @CLASS_PALADIN, 4, 27, 18, 28, 21, 22)
    ,(@RACE_DWARF, @CLASS_PALADIN, 5, 28, 18, 29, 21, 23)
    ,(@RACE_DWARF, @CLASS_PALADIN, 6, 29, 19, 30, 22, 23)
    ,(@RACE_DWARF, @CLASS_PALADIN, 7, 30, 19, 31, 23, 24)
    ,(@RACE_DWARF, @CLASS_PALADIN, 8, 31, 20, 31, 23, 24)
    ,(@RACE_DWARF, @CLASS_PALADIN, 9, 32, 20, 32, 24, 25)
    ,(@RACE_DWARF, @CLASS_PALADIN, 10, 33, 21, 33, 24, 26)
    ,(@RACE_DWARF, @CLASS_PALADIN, 11, 34, 21, 34, 25, 27)
    ,(@RACE_DWARF, @CLASS_PALADIN, 12, 35, 22, 35, 26, 27)
    ,(@RACE_DWARF, @CLASS_PALADIN, 13, 36, 23, 36, 26, 28)
    ,(@RACE_DWARF, @CLASS_PALADIN, 14, 37, 23, 37, 27, 29)
    ,(@RACE_DWARF, @CLASS_PALADIN, 15, 38, 24, 39, 28, 29)
    ,(@RACE_DWARF, @CLASS_PALADIN, 16, 40, 24, 40, 28, 30)
    ,(@RACE_DWARF, @CLASS_PALADIN, 17, 41, 25, 41, 29, 31)
    ,(@RACE_DWARF, @CLASS_PALADIN, 18, 42, 26, 42, 30, 32)
    ,(@RACE_DWARF, @CLASS_PALADIN, 19, 43, 26, 43, 30, 32)
    ,(@RACE_DWARF, @CLASS_PALADIN, 20, 44, 27, 44, 31, 33)
    ,(@RACE_DWARF, @CLASS_PALADIN, 21, 45, 28, 45, 32, 34)
    ,(@RACE_DWARF, @CLASS_PALADIN, 22, 47, 28, 46, 33, 35)
    ,(@RACE_DWARF, @CLASS_PALADIN, 23, 48, 29, 47, 33, 36)
    ,(@RACE_DWARF, @CLASS_PALADIN, 24, 49, 30, 49, 34, 36)
    ,(@RACE_DWARF, @CLASS_PALADIN, 25, 50, 30, 50, 35, 37)
    ,(@RACE_DWARF, @CLASS_PALADIN, 26, 52, 31, 51, 36, 38)
    ,(@RACE_DWARF, @CLASS_PALADIN, 27, 53, 32, 52, 36, 39)
    ,(@RACE_DWARF, @CLASS_PALADIN, 28, 54, 32, 53, 37, 40)
    ,(@RACE_DWARF, @CLASS_PALADIN, 29, 56, 33, 55, 38, 41)
    ,(@RACE_DWARF, @CLASS_PALADIN, 30, 57, 34, 56, 39, 41)
    ,(@RACE_DWARF, @CLASS_PALADIN, 31, 58, 35, 57, 40, 42)
    ,(@RACE_DWARF, @CLASS_PALADIN, 32, 60, 35, 59, 41, 43)
    ,(@RACE_DWARF, @CLASS_PALADIN, 33, 61, 36, 60, 41, 44)
    ,(@RACE_DWARF, @CLASS_PALADIN, 34, 63, 37, 61, 42, 45)
    ,(@RACE_DWARF, @CLASS_PALADIN, 35, 64, 38, 63, 43, 46)
    ,(@RACE_DWARF, @CLASS_PALADIN, 36, 66, 39, 64, 44, 47)
    ,(@RACE_DWARF, @CLASS_PALADIN, 37, 67, 39, 65, 45, 48)
    ,(@RACE_DWARF, @CLASS_PALADIN, 38, 69, 40, 67, 46, 49)
    ,(@RACE_DWARF, @CLASS_PALADIN, 39, 70, 41, 68, 47, 50)
    ,(@RACE_DWARF, @CLASS_PALADIN, 40, 72, 42, 70, 48, 51)
    ,(@RACE_DWARF, @CLASS_PALADIN, 41, 73, 43, 71, 49, 52)
    ,(@RACE_DWARF, @CLASS_PALADIN, 42, 75, 43, 73, 50, 53)
    ,(@RACE_DWARF, @CLASS_PALADIN, 43, 76, 44, 74, 51, 54)
    ,(@RACE_DWARF, @CLASS_PALADIN, 44, 78, 45, 76, 51, 55)
    ,(@RACE_DWARF, @CLASS_PALADIN, 45, 80, 46, 77, 52, 56)
    ,(@RACE_DWARF, @CLASS_PALADIN, 46, 81, 47, 79, 53, 57)
    ,(@RACE_DWARF, @CLASS_PALADIN, 47, 83, 48, 80, 55, 58)
    ,(@RACE_DWARF, @CLASS_PALADIN, 48, 85, 49, 82, 56, 59)
    ,(@RACE_DWARF, @CLASS_PALADIN, 49, 86, 50, 84, 57, 61)
    ,(@RACE_DWARF, @CLASS_PALADIN, 50, 88, 51, 85, 58, 62)
    ,(@RACE_DWARF, @CLASS_PALADIN, 51, 90, 52, 87, 59, 63)
    ,(@RACE_DWARF, @CLASS_PALADIN, 52, 92, 53, 89, 60, 64)
    ,(@RACE_DWARF, @CLASS_PALADIN, 53, 94, 54, 90, 61, 65)
    ,(@RACE_DWARF, @CLASS_PALADIN, 54, 95, 55, 92, 62, 66)
    ,(@RACE_DWARF, @CLASS_PALADIN, 55, 97, 56, 94, 63, 68)
    ,(@RACE_DWARF, @CLASS_PALADIN, 56, 99, 57, 96, 64, 69)
    ,(@RACE_DWARF, @CLASS_PALADIN, 57, 101, 58, 97, 65, 70)
    ,(@RACE_DWARF, @CLASS_PALADIN, 58, 103, 59, 99, 67, 71)
    ,(@RACE_DWARF, @CLASS_PALADIN, 59, 105, 60, 101, 68, 73)
    ,(@RACE_DWARF, @CLASS_PALADIN, 60, 107, 61, 103, 69, 74)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_DWARF, @CLASS_HUNTER, 1, 22, 19, 24, 19, 20)
    ,(@RACE_DWARF, @CLASS_HUNTER, 2, 22, 20, 25, 20, 21)
    ,(@RACE_DWARF, @CLASS_HUNTER, 3, 23, 21, 26, 20, 21)
    ,(@RACE_DWARF, @CLASS_HUNTER, 4, 23, 23, 26, 21, 22)
    ,(@RACE_DWARF, @CLASS_HUNTER, 5, 24, 24, 27, 21, 22)
    ,(@RACE_DWARF, @CLASS_HUNTER, 6, 24, 25, 28, 22, 23)
    ,(@RACE_DWARF, @CLASS_HUNTER, 7, 24, 26, 29, 22, 23)
    ,(@RACE_DWARF, @CLASS_HUNTER, 8, 25, 27, 30, 23, 24)
    ,(@RACE_DWARF, @CLASS_HUNTER, 9, 25, 29, 31, 23, 25)
    ,(@RACE_DWARF, @CLASS_HUNTER, 10, 26, 30, 31, 24, 25)
    ,(@RACE_DWARF, @CLASS_HUNTER, 11, 26, 31, 32, 24, 26)
    ,(@RACE_DWARF, @CLASS_HUNTER, 12, 27, 33, 33, 25, 27)
    ,(@RACE_DWARF, @CLASS_HUNTER, 13, 27, 34, 34, 26, 27)
    ,(@RACE_DWARF, @CLASS_HUNTER, 14, 28, 35, 35, 26, 28)
    ,(@RACE_DWARF, @CLASS_HUNTER, 15, 28, 37, 36, 27, 28)
    ,(@RACE_DWARF, @CLASS_HUNTER, 16, 29, 38, 37, 27, 29)
    ,(@RACE_DWARF, @CLASS_HUNTER, 17, 29, 39, 38, 28, 30)
    ,(@RACE_DWARF, @CLASS_HUNTER, 18, 30, 41, 39, 29, 31)
    ,(@RACE_DWARF, @CLASS_HUNTER, 19, 30, 42, 40, 29, 31)
    ,(@RACE_DWARF, @CLASS_HUNTER, 20, 31, 44, 41, 30, 32)
    ,(@RACE_DWARF, @CLASS_HUNTER, 21, 31, 45, 42, 31, 33)
    ,(@RACE_DWARF, @CLASS_HUNTER, 22, 32, 47, 43, 31, 33)
    ,(@RACE_DWARF, @CLASS_HUNTER, 23, 32, 48, 44, 32, 34)
    ,(@RACE_DWARF, @CLASS_HUNTER, 24, 33, 50, 45, 33, 35)
    ,(@RACE_DWARF, @CLASS_HUNTER, 25, 33, 51, 46, 33, 36)
    ,(@RACE_DWARF, @CLASS_HUNTER, 26, 34, 53, 47, 34, 36)
    ,(@RACE_DWARF, @CLASS_HUNTER, 27, 34, 55, 48, 35, 37)
    ,(@RACE_DWARF, @CLASS_HUNTER, 28, 35, 56, 49, 35, 38)
    ,(@RACE_DWARF, @CLASS_HUNTER, 29, 35, 58, 50, 36, 39)
    ,(@RACE_DWARF, @CLASS_HUNTER, 30, 36, 60, 51, 37, 39)
    ,(@RACE_DWARF, @CLASS_HUNTER, 31, 36, 61, 53, 38, 40)
    ,(@RACE_DWARF, @CLASS_HUNTER, 32, 37, 63, 54, 38, 41)
    ,(@RACE_DWARF, @CLASS_HUNTER, 33, 38, 65, 55, 39, 42)
    ,(@RACE_DWARF, @CLASS_HUNTER, 34, 38, 66, 56, 40, 43)
    ,(@RACE_DWARF, @CLASS_HUNTER, 35, 39, 68, 57, 41, 44)
    ,(@RACE_DWARF, @CLASS_HUNTER, 36, 40, 70, 59, 42, 45)
    ,(@RACE_DWARF, @CLASS_HUNTER, 37, 40, 72, 60, 42, 45)
    ,(@RACE_DWARF, @CLASS_HUNTER, 38, 41, 74, 61, 43, 46)
    ,(@RACE_DWARF, @CLASS_HUNTER, 39, 41, 76, 62, 44, 47)
    ,(@RACE_DWARF, @CLASS_HUNTER, 40, 42, 77, 64, 45, 48)
    ,(@RACE_DWARF, @CLASS_HUNTER, 41, 43, 79, 65, 46, 49)
    ,(@RACE_DWARF, @CLASS_HUNTER, 42, 43, 81, 66, 46, 50)
    ,(@RACE_DWARF, @CLASS_HUNTER, 43, 44, 83, 67, 47, 51)
    ,(@RACE_DWARF, @CLASS_HUNTER, 44, 45, 85, 69, 48, 52)
    ,(@RACE_DWARF, @CLASS_HUNTER, 45, 45, 87, 70, 49, 53)
    ,(@RACE_DWARF, @CLASS_HUNTER, 46, 46, 89, 72, 50, 54)
    ,(@RACE_DWARF, @CLASS_HUNTER, 47, 47, 91, 73, 51, 55)
    ,(@RACE_DWARF, @CLASS_HUNTER, 48, 48, 94, 74, 52, 56)
    ,(@RACE_DWARF, @CLASS_HUNTER, 49, 48, 96, 76, 53, 57)
    ,(@RACE_DWARF, @CLASS_HUNTER, 50, 49, 98, 77, 54, 58)
    ,(@RACE_DWARF, @CLASS_HUNTER, 51, 50, 100, 79, 55, 59)
    ,(@RACE_DWARF, @CLASS_HUNTER, 52, 51, 102, 80, 56, 60)
    ,(@RACE_DWARF, @CLASS_HUNTER, 53, 51, 104, 82, 57, 61)
    ,(@RACE_DWARF, @CLASS_HUNTER, 54, 52, 107, 83, 58, 62)
    ,(@RACE_DWARF, @CLASS_HUNTER, 55, 53, 109, 85, 59, 63)
    ,(@RACE_DWARF, @CLASS_HUNTER, 56, 54, 111, 86, 60, 64)
    ,(@RACE_DWARF, @CLASS_HUNTER, 57, 55, 114, 88, 61, 66)
    ,(@RACE_DWARF, @CLASS_HUNTER, 58, 55, 116, 90, 62, 67)
    ,(@RACE_DWARF, @CLASS_HUNTER, 59, 56, 119, 91, 63, 68)
    ,(@RACE_DWARF, @CLASS_HUNTER, 60, 57, 121, 93, 64, 69)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_DWARF, @CLASS_ROGUE, 1, 23, 19, 24, 19, 19)
    ,(@RACE_DWARF, @CLASS_ROGUE, 2, 24, 20, 25, 19, 19)
    ,(@RACE_DWARF, @CLASS_ROGUE, 3, 24, 21, 25, 19, 20)
    ,(@RACE_DWARF, @CLASS_ROGUE, 4, 25, 23, 26, 20, 20)
    ,(@RACE_DWARF, @CLASS_ROGUE, 5, 26, 24, 27, 20, 20)
    ,(@RACE_DWARF, @CLASS_ROGUE, 6, 26, 25, 27, 20, 21)
    ,(@RACE_DWARF, @CLASS_ROGUE, 7, 27, 27, 28, 20, 21)
    ,(@RACE_DWARF, @CLASS_ROGUE, 8, 28, 28, 28, 20, 21)
    ,(@RACE_DWARF, @CLASS_ROGUE, 9, 29, 29, 29, 20, 22)
    ,(@RACE_DWARF, @CLASS_ROGUE, 10, 29, 31, 30, 21, 22)
    ,(@RACE_DWARF, @CLASS_ROGUE, 11, 30, 32, 31, 21, 23)
    ,(@RACE_DWARF, @CLASS_ROGUE, 12, 31, 33, 31, 21, 23)
    ,(@RACE_DWARF, @CLASS_ROGUE, 13, 32, 35, 32, 21, 23)
    ,(@RACE_DWARF, @CLASS_ROGUE, 14, 32, 36, 33, 21, 24)
    ,(@RACE_DWARF, @CLASS_ROGUE, 15, 33, 38, 33, 22, 24)
    ,(@RACE_DWARF, @CLASS_ROGUE, 16, 34, 39, 34, 22, 25)
    ,(@RACE_DWARF, @CLASS_ROGUE, 17, 35, 40, 35, 22, 25)
    ,(@RACE_DWARF, @CLASS_ROGUE, 18, 36, 42, 36, 22, 25)
    ,(@RACE_DWARF, @CLASS_ROGUE, 19, 37, 44, 36, 22, 26)
    ,(@RACE_DWARF, @CLASS_ROGUE, 20, 37, 45, 37, 23, 26)
    ,(@RACE_DWARF, @CLASS_ROGUE, 21, 38, 47, 38, 23, 27)
    ,(@RACE_DWARF, @CLASS_ROGUE, 22, 39, 48, 39, 23, 27)
    ,(@RACE_DWARF, @CLASS_ROGUE, 23, 40, 50, 40, 23, 28)
    ,(@RACE_DWARF, @CLASS_ROGUE, 24, 41, 51, 40, 24, 28)
    ,(@RACE_DWARF, @CLASS_ROGUE, 25, 42, 53, 41, 24, 29)
    ,(@RACE_DWARF, @CLASS_ROGUE, 26, 43, 55, 42, 24, 29)
    ,(@RACE_DWARF, @CLASS_ROGUE, 27, 44, 56, 43, 24, 29)
    ,(@RACE_DWARF, @CLASS_ROGUE, 28, 45, 58, 44, 24, 30)
    ,(@RACE_DWARF, @CLASS_ROGUE, 29, 45, 60, 45, 25, 30)
    ,(@RACE_DWARF, @CLASS_ROGUE, 30, 46, 62, 45, 25, 31)
    ,(@RACE_DWARF, @CLASS_ROGUE, 31, 47, 63, 46, 25, 31)
    ,(@RACE_DWARF, @CLASS_ROGUE, 32, 48, 65, 47, 25, 32)
    ,(@RACE_DWARF, @CLASS_ROGUE, 33, 49, 67, 48, 26, 32)
    ,(@RACE_DWARF, @CLASS_ROGUE, 34, 50, 69, 49, 26, 33)
    ,(@RACE_DWARF, @CLASS_ROGUE, 35, 51, 71, 50, 26, 33)
    ,(@RACE_DWARF, @CLASS_ROGUE, 36, 53, 73, 51, 27, 34)
    ,(@RACE_DWARF, @CLASS_ROGUE, 37, 54, 74, 52, 27, 35)
    ,(@RACE_DWARF, @CLASS_ROGUE, 38, 55, 76, 53, 27, 35)
    ,(@RACE_DWARF, @CLASS_ROGUE, 39, 56, 78, 54, 27, 36)
    ,(@RACE_DWARF, @CLASS_ROGUE, 40, 57, 80, 55, 28, 36)
    ,(@RACE_DWARF, @CLASS_ROGUE, 41, 58, 82, 56, 28, 37)
    ,(@RACE_DWARF, @CLASS_ROGUE, 42, 59, 84, 57, 28, 37)
    ,(@RACE_DWARF, @CLASS_ROGUE, 43, 60, 86, 58, 28, 38)
    ,(@RACE_DWARF, @CLASS_ROGUE, 44, 61, 89, 59, 29, 38)
    ,(@RACE_DWARF, @CLASS_ROGUE, 45, 63, 91, 60, 29, 39)
    ,(@RACE_DWARF, @CLASS_ROGUE, 46, 64, 93, 61, 29, 40)
    ,(@RACE_DWARF, @CLASS_ROGUE, 47, 65, 95, 62, 30, 40)
    ,(@RACE_DWARF, @CLASS_ROGUE, 48, 66, 97, 63, 30, 41)
    ,(@RACE_DWARF, @CLASS_ROGUE, 49, 67, 99, 65, 30, 42)
    ,(@RACE_DWARF, @CLASS_ROGUE, 50, 69, 102, 66, 31, 42)
    ,(@RACE_DWARF, @CLASS_ROGUE, 51, 70, 104, 67, 31, 43)
    ,(@RACE_DWARF, @CLASS_ROGUE, 52, 71, 106, 68, 31, 43)
    ,(@RACE_DWARF, @CLASS_ROGUE, 53, 72, 109, 69, 32, 44)
    ,(@RACE_DWARF, @CLASS_ROGUE, 54, 74, 111, 70, 32, 45)
    ,(@RACE_DWARF, @CLASS_ROGUE, 55, 75, 113, 72, 32, 45)
    ,(@RACE_DWARF, @CLASS_ROGUE, 56, 76, 116, 73, 33, 46)
    ,(@RACE_DWARF, @CLASS_ROGUE, 57, 78, 118, 74, 33, 47)
    ,(@RACE_DWARF, @CLASS_ROGUE, 58, 79, 121, 75, 33, 48)
    ,(@RACE_DWARF, @CLASS_ROGUE, 59, 81, 123, 77, 34, 48)
    ,(@RACE_DWARF, @CLASS_ROGUE, 60, 82, 126, 78, 34, 49)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_DWARF, @CLASS_PRIEST, 1, 22, 16, 23, 21, 22)
    ,(@RACE_DWARF, @CLASS_PRIEST, 2, 22, 16, 23, 22, 23)
    ,(@RACE_DWARF, @CLASS_PRIEST, 3, 22, 16, 24, 23, 24)
    ,(@RACE_DWARF, @CLASS_PRIEST, 4, 23, 17, 24, 24, 26)
    ,(@RACE_DWARF, @CLASS_PRIEST, 5, 23, 17, 24, 26, 27)
    ,(@RACE_DWARF, @CLASS_PRIEST, 6, 23, 17, 25, 27, 28)
    ,(@RACE_DWARF, @CLASS_PRIEST, 7, 23, 17, 25, 28, 29)
    ,(@RACE_DWARF, @CLASS_PRIEST, 8, 23, 18, 25, 29, 30)
    ,(@RACE_DWARF, @CLASS_PRIEST, 9, 23, 18, 26, 30, 32)
    ,(@RACE_DWARF, @CLASS_PRIEST, 10, 24, 18, 26, 32, 33)
    ,(@RACE_DWARF, @CLASS_PRIEST, 11, 24, 18, 27, 33, 34)
    ,(@RACE_DWARF, @CLASS_PRIEST, 12, 24, 19, 27, 34, 36)
    ,(@RACE_DWARF, @CLASS_PRIEST, 13, 24, 19, 27, 35, 37)
    ,(@RACE_DWARF, @CLASS_PRIEST, 14, 24, 19, 28, 37, 38)
    ,(@RACE_DWARF, @CLASS_PRIEST, 15, 25, 19, 28, 38, 40)
    ,(@RACE_DWARF, @CLASS_PRIEST, 16, 25, 20, 29, 39, 41)
    ,(@RACE_DWARF, @CLASS_PRIEST, 17, 25, 20, 29, 41, 42)
    ,(@RACE_DWARF, @CLASS_PRIEST, 18, 25, 20, 29, 42, 44)
    ,(@RACE_DWARF, @CLASS_PRIEST, 19, 25, 21, 30, 43, 45)
    ,(@RACE_DWARF, @CLASS_PRIEST, 20, 26, 21, 30, 45, 47)
    ,(@RACE_DWARF, @CLASS_PRIEST, 21, 26, 21, 31, 46, 48)
    ,(@RACE_DWARF, @CLASS_PRIEST, 22, 26, 21, 31, 48, 50)
    ,(@RACE_DWARF, @CLASS_PRIEST, 23, 26, 22, 32, 49, 51)
    ,(@RACE_DWARF, @CLASS_PRIEST, 24, 27, 22, 32, 51, 53)
    ,(@RACE_DWARF, @CLASS_PRIEST, 25, 27, 22, 33, 52, 54)
    ,(@RACE_DWARF, @CLASS_PRIEST, 26, 27, 23, 33, 54, 56)
    ,(@RACE_DWARF, @CLASS_PRIEST, 27, 27, 23, 33, 55, 58)
    ,(@RACE_DWARF, @CLASS_PRIEST, 28, 27, 23, 34, 57, 59)
    ,(@RACE_DWARF, @CLASS_PRIEST, 29, 28, 24, 34, 58, 61)
    ,(@RACE_DWARF, @CLASS_PRIEST, 30, 28, 24, 35, 60, 63)
    ,(@RACE_DWARF, @CLASS_PRIEST, 31, 28, 24, 35, 62, 64)
    ,(@RACE_DWARF, @CLASS_PRIEST, 32, 28, 25, 36, 63, 66)
    ,(@RACE_DWARF, @CLASS_PRIEST, 33, 29, 25, 36, 65, 68)
    ,(@RACE_DWARF, @CLASS_PRIEST, 34, 29, 25, 37, 67, 69)
    ,(@RACE_DWARF, @CLASS_PRIEST, 35, 29, 26, 37, 68, 71)
    ,(@RACE_DWARF, @CLASS_PRIEST, 36, 30, 26, 38, 70, 73)
    ,(@RACE_DWARF, @CLASS_PRIEST, 37, 30, 26, 39, 72, 75)
    ,(@RACE_DWARF, @CLASS_PRIEST, 38, 30, 27, 39, 74, 77)
    ,(@RACE_DWARF, @CLASS_PRIEST, 39, 30, 27, 40, 75, 79)
    ,(@RACE_DWARF, @CLASS_PRIEST, 40, 31, 27, 40, 77, 80)
    ,(@RACE_DWARF, @CLASS_PRIEST, 41, 31, 28, 41, 79, 82)
    ,(@RACE_DWARF, @CLASS_PRIEST, 42, 31, 28, 41, 81, 84)
    ,(@RACE_DWARF, @CLASS_PRIEST, 43, 31, 29, 42, 83, 86)
    ,(@RACE_DWARF, @CLASS_PRIEST, 44, 32, 29, 42, 85, 88)
    ,(@RACE_DWARF, @CLASS_PRIEST, 45, 32, 29, 43, 87, 90)
    ,(@RACE_DWARF, @CLASS_PRIEST, 46, 32, 30, 44, 89, 92)
    ,(@RACE_DWARF, @CLASS_PRIEST, 47, 33, 30, 44, 91, 94)
    ,(@RACE_DWARF, @CLASS_PRIEST, 48, 33, 31, 45, 93, 97)
    ,(@RACE_DWARF, @CLASS_PRIEST, 49, 33, 31, 46, 95, 99)
    ,(@RACE_DWARF, @CLASS_PRIEST, 50, 34, 31, 46, 97, 101)
    ,(@RACE_DWARF, @CLASS_PRIEST, 51, 34, 32, 47, 99, 103)
    ,(@RACE_DWARF, @CLASS_PRIEST, 52, 34, 32, 47, 101, 105)
    ,(@RACE_DWARF, @CLASS_PRIEST, 53, 35, 33, 48, 103, 107)
    ,(@RACE_DWARF, @CLASS_PRIEST, 54, 35, 33, 49, 105, 110)
    ,(@RACE_DWARF, @CLASS_PRIEST, 55, 35, 34, 49, 108, 112)
    ,(@RACE_DWARF, @CLASS_PRIEST, 56, 36, 34, 50, 110, 114)
    ,(@RACE_DWARF, @CLASS_PRIEST, 57, 36, 35, 51, 112, 117)
    ,(@RACE_DWARF, @CLASS_PRIEST, 58, 36, 35, 52, 114, 119)
    ,(@RACE_DWARF, @CLASS_PRIEST, 59, 37, 36, 52, 117, 122)
    ,(@RACE_DWARF, @CLASS_PRIEST, 60, 37, 36, 53, 119, 124)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_WARRIOR, 1, 20, 25, 21, 20, 20)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 2, 21, 26, 22, 20, 20)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 3, 22, 26, 23, 20, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 4, 23, 27, 24, 20, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 5, 25, 28, 25, 20, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 6, 26, 29, 26, 21, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 7, 27, 29, 27, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 8, 28, 30, 28, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 9, 29, 31, 29, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 10, 30, 31, 30, 21, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 11, 32, 32, 32, 21, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 12, 33, 33, 33, 21, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 13, 34, 34, 34, 21, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 14, 36, 35, 35, 22, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 15, 37, 35, 36, 22, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 16, 38, 36, 37, 22, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 17, 39, 37, 39, 22, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 18, 41, 38, 40, 22, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 19, 42, 39, 41, 22, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 20, 44, 40, 42, 22, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 21, 45, 40, 44, 23, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 22, 46, 41, 45, 23, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 23, 48, 42, 46, 23, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 24, 49, 43, 48, 23, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 25, 51, 44, 49, 23, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 26, 52, 45, 50, 23, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 27, 54, 46, 52, 23, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 28, 55, 47, 53, 24, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 29, 57, 48, 55, 24, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 30, 59, 49, 56, 24, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 31, 60, 50, 57, 24, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 32, 62, 51, 59, 24, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 33, 63, 52, 60, 24, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 34, 65, 53, 62, 25, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 35, 67, 54, 63, 25, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 36, 69, 55, 65, 25, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 37, 70, 56, 67, 25, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 38, 72, 57, 68, 25, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 39, 74, 58, 70, 26, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 40, 76, 59, 71, 26, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 41, 77, 61, 73, 26, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 42, 79, 62, 75, 26, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 43, 81, 63, 76, 26, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 44, 83, 64, 78, 26, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 45, 85, 65, 80, 27, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 46, 87, 66, 82, 27, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 47, 89, 68, 83, 27, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 48, 91, 69, 85, 27, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 49, 93, 70, 87, 28, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 50, 95, 71, 89, 28, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 51, 97, 73, 91, 28, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 52, 99, 74, 93, 28, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 53, 101, 75, 95, 28, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 54, 103, 77, 97, 29, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 55, 106, 78, 99, 29, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 56, 108, 79, 101, 29, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 57, 110, 81, 103, 29, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 58, 112, 82, 105, 30, 44)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 59, 115, 84, 107, 30, 44)
    ,(@RACE_NIGHT_ELF, @CLASS_WARRIOR, 60, 117, 85, 109, 30, 45)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_HUNTER, 1, 17, 28, 20, 20, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 2, 17, 29, 21, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 3, 18, 30, 22, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 4, 18, 32, 22, 22, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 5, 19, 33, 23, 22, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 6, 19, 34, 24, 23, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 7, 19, 35, 25, 23, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 8, 20, 36, 26, 24, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 9, 20, 38, 27, 24, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 10, 21, 39, 27, 25, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 11, 21, 40, 28, 25, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 12, 22, 42, 29, 26, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 13, 22, 43, 30, 27, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 14, 23, 44, 31, 27, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 15, 23, 46, 32, 28, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 16, 24, 47, 33, 28, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 17, 24, 48, 34, 29, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 18, 25, 50, 35, 30, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 19, 25, 51, 36, 30, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 20, 26, 53, 37, 31, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 21, 26, 54, 38, 32, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 22, 27, 56, 39, 32, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 23, 27, 57, 40, 33, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 24, 28, 59, 41, 34, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 25, 28, 60, 42, 34, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 26, 29, 62, 43, 35, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 27, 29, 64, 44, 36, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 28, 30, 65, 45, 36, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 29, 30, 67, 46, 37, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 30, 31, 69, 47, 38, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 31, 31, 70, 49, 39, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 32, 32, 72, 50, 39, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 33, 33, 74, 51, 40, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 34, 33, 75, 52, 41, 44)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 35, 34, 77, 53, 42, 45)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 36, 35, 79, 55, 43, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 37, 35, 81, 56, 43, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 38, 36, 83, 57, 44, 47)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 39, 36, 85, 58, 45, 48)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 40, 37, 86, 60, 46, 49)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 41, 38, 88, 61, 47, 50)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 42, 38, 90, 62, 47, 51)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 43, 39, 92, 63, 48, 52)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 44, 40, 94, 65, 49, 53)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 45, 40, 96, 66, 50, 54)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 46, 41, 98, 68, 51, 55)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 47, 42, 100, 69, 52, 56)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 48, 43, 103, 70, 53, 57)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 49, 43, 105, 72, 54, 58)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 50, 44, 107, 73, 55, 59)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 51, 45, 109, 75, 56, 60)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 52, 46, 111, 76, 57, 61)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 53, 46, 113, 78, 58, 62)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 54, 47, 116, 79, 59, 63)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 55, 48, 118, 81, 60, 64)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 56, 49, 120, 82, 61, 65)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 57, 50, 123, 84, 62, 67)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 58, 50, 125, 86, 63, 68)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 59, 51, 128, 87, 64, 69)
    ,(@RACE_NIGHT_ELF, @CLASS_HUNTER, 60, 52, 130, 89, 65, 70)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_ROGUE, 1, 18, 28, 20, 20, 20)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 2, 19, 29, 21, 20, 20)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 3, 19, 30, 21, 20, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 4, 20, 32, 22, 21, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 5, 21, 33, 23, 21, 21)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 6, 21, 34, 23, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 7, 22, 36, 24, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 8, 23, 37, 24, 21, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 9, 24, 38, 25, 21, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 10, 24, 40, 26, 22, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 11, 25, 41, 27, 22, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 12, 26, 42, 27, 22, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 13, 27, 44, 28, 22, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 14, 27, 45, 29, 22, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 15, 28, 47, 29, 23, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 16, 29, 48, 30, 23, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 17, 30, 49, 31, 23, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 18, 31, 51, 32, 23, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 19, 32, 53, 32, 23, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 20, 32, 54, 33, 24, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 21, 33, 56, 34, 24, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 22, 34, 57, 35, 24, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 23, 35, 59, 36, 24, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 24, 36, 60, 36, 25, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 25, 37, 62, 37, 25, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 26, 38, 64, 38, 25, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 27, 39, 65, 39, 25, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 28, 40, 67, 40, 25, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 29, 40, 69, 41, 26, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 30, 41, 71, 41, 26, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 31, 42, 72, 42, 26, 32)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 32, 43, 74, 43, 26, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 33, 44, 76, 44, 27, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 34, 45, 78, 45, 27, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 35, 46, 80, 46, 27, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 36, 48, 82, 47, 28, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 37, 49, 83, 48, 28, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 38, 50, 85, 49, 28, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 39, 51, 87, 50, 28, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 40, 52, 89, 51, 29, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 41, 53, 91, 52, 29, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 42, 54, 93, 53, 29, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 43, 55, 95, 54, 29, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 44, 56, 98, 55, 30, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 45, 58, 100, 56, 30, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 46, 59, 102, 57, 30, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 47, 60, 104, 58, 31, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 48, 61, 106, 59, 31, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 49, 62, 108, 61, 31, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 50, 64, 111, 62, 32, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 51, 65, 113, 63, 32, 44)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 52, 66, 115, 64, 32, 44)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 53, 67, 118, 65, 33, 45)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 54, 69, 120, 66, 33, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 55, 70, 122, 68, 33, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 56, 71, 125, 69, 34, 47)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 57, 73, 127, 70, 34, 48)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 58, 74, 130, 71, 34, 49)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 59, 76, 132, 73, 35, 49)
    ,(@RACE_NIGHT_ELF, @CLASS_ROGUE, 60, 77, 135, 74, 35, 50)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_PRIEST, 1, 17, 25, 19, 22, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 2, 17, 25, 19, 23, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 3, 17, 25, 20, 24, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 4, 18, 26, 20, 25, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 5, 18, 26, 20, 27, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 6, 18, 26, 21, 28, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 7, 18, 26, 21, 29, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 8, 18, 27, 21, 30, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 9, 18, 27, 22, 31, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 10, 19, 27, 22, 33, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 11, 19, 27, 23, 34, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 12, 19, 28, 23, 35, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 13, 19, 28, 23, 36, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 14, 19, 28, 24, 38, 39)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 15, 20, 28, 24, 39, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 16, 20, 29, 25, 40, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 17, 20, 29, 25, 42, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 18, 20, 29, 25, 43, 45)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 19, 20, 30, 26, 44, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 20, 21, 30, 26, 46, 48)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 21, 21, 30, 27, 47, 49)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 22, 21, 30, 27, 49, 51)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 23, 21, 31, 28, 50, 52)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 24, 22, 31, 28, 52, 54)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 25, 22, 31, 29, 53, 55)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 26, 22, 32, 29, 55, 57)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 27, 22, 32, 29, 56, 59)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 28, 22, 32, 30, 58, 60)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 29, 23, 33, 30, 59, 62)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 30, 23, 33, 31, 61, 64)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 31, 23, 33, 31, 63, 65)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 32, 23, 34, 32, 64, 67)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 33, 24, 34, 32, 66, 69)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 34, 24, 34, 33, 68, 70)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 35, 24, 35, 33, 69, 72)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 36, 25, 35, 34, 71, 74)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 37, 25, 35, 35, 73, 76)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 38, 25, 36, 35, 75, 78)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 39, 25, 36, 36, 76, 80)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 40, 26, 36, 36, 78, 81)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 41, 26, 37, 37, 80, 83)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 42, 26, 37, 37, 82, 85)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 43, 26, 38, 38, 84, 87)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 44, 27, 38, 38, 86, 89)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 45, 27, 38, 39, 88, 91)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 46, 27, 39, 40, 90, 93)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 47, 28, 39, 40, 92, 95)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 48, 28, 40, 41, 94, 98)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 49, 28, 40, 42, 96, 100)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 50, 29, 40, 42, 98, 102)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 51, 29, 41, 43, 100, 104)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 52, 29, 41, 43, 102, 106)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 53, 30, 42, 44, 104, 108)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 54, 30, 42, 45, 106, 111)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 55, 30, 43, 45, 109, 113)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 56, 31, 43, 46, 111, 115)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 57, 31, 44, 47, 113, 118)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 58, 31, 44, 48, 115, 120)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 59, 32, 45, 48, 118, 123)
    ,(@RACE_NIGHT_ELF, @CLASS_PRIEST, 60, 32, 45, 49, 120, 125)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_NIGHT_ELF, @CLASS_DRUID, 1, 18, 25, 19, 22, 22)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 2, 19, 25, 20, 23, 23)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 3, 19, 26, 20, 24, 24)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 4, 20, 26, 21, 25, 25)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 5, 20, 27, 21, 26, 26)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 6, 21, 27, 22, 27, 27)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 7, 21, 28, 23, 28, 28)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 8, 22, 28, 23, 28, 29)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 9, 22, 29, 24, 29, 30)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 10, 23, 29, 24, 30, 31)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 11, 23, 30, 25, 31, 33)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 12, 24, 30, 26, 32, 34)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 13, 24, 31, 26, 33, 35)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 14, 25, 31, 27, 34, 36)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 15, 26, 32, 28, 36, 37)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 16, 26, 32, 28, 37, 38)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 17, 27, 33, 29, 38, 40)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 18, 27, 34, 30, 39, 41)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 19, 28, 34, 30, 40, 42)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 20, 29, 35, 31, 41, 43)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 21, 29, 35, 32, 42, 45)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 22, 30, 36, 33, 43, 46)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 23, 31, 37, 33, 44, 47)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 24, 31, 37, 34, 46, 49)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 25, 32, 38, 35, 47, 50)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 26, 33, 38, 36, 48, 51)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 27, 33, 39, 36, 49, 53)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 28, 34, 40, 37, 50, 54)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 29, 35, 40, 38, 52, 56)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 30, 35, 41, 39, 53, 57)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 31, 36, 42, 40, 54, 58)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 32, 37, 42, 41, 56, 60)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 33, 38, 43, 41, 57, 61)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 34, 38, 44, 42, 58, 63)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 35, 39, 44, 43, 60, 64)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 36, 40, 45, 44, 61, 66)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 37, 41, 46, 45, 62, 68)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 38, 42, 46, 46, 64, 69)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 39, 42, 47, 47, 65, 71)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 40, 43, 48, 48, 67, 72)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 41, 44, 49, 49, 68, 74)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 42, 45, 49, 50, 70, 76)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 43, 46, 50, 51, 71, 77)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 44, 47, 51, 51, 73, 79)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 45, 47, 52, 52, 74, 81)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 46, 48, 53, 53, 76, 83)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 47, 49, 53, 55, 77, 84)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 48, 50, 54, 56, 79, 86)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 49, 51, 55, 57, 81, 88)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 50, 52, 56, 58, 82, 90)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 51, 53, 57, 59, 84, 92)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 52, 54, 58, 60, 86, 94)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 53, 55, 59, 61, 87, 96)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 54, 56, 59, 62, 89, 98)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 55, 57, 60, 63, 91, 100)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 56, 58, 61, 64, 93, 102)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 57, 59, 62, 65, 94, 104)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 58, 60, 63, 67, 96, 106)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 59, 61, 64, 68, 98, 108)
    ,(@RACE_NIGHT_ELF, @CLASS_DRUID, 60, 62, 65, 69, 100, 110)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_UNDEAD, @CLASS_WARRIOR, 1, 22, 18, 23, 18, 25)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 2, 23, 19, 24, 18, 25)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 3, 24, 19, 25, 18, 26)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 4, 25, 20, 26, 18, 26)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 5, 27, 21, 27, 18, 26)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 6, 28, 22, 28, 19, 26)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 7, 29, 22, 29, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 8, 30, 23, 30, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 9, 31, 24, 31, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 10, 32, 24, 32, 19, 28)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 11, 34, 25, 34, 19, 28)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 12, 35, 26, 35, 19, 28)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 13, 36, 27, 36, 19, 29)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 14, 38, 28, 37, 20, 29)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 15, 39, 28, 38, 20, 29)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 16, 40, 29, 39, 20, 30)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 17, 41, 30, 41, 20, 30)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 18, 43, 31, 42, 20, 30)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 19, 44, 32, 43, 20, 31)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 20, 46, 33, 44, 20, 31)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 21, 47, 33, 46, 21, 31)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 22, 48, 34, 47, 21, 32)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 23, 50, 35, 48, 21, 32)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 24, 51, 36, 50, 21, 33)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 25, 53, 37, 51, 21, 33)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 26, 54, 38, 52, 21, 33)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 27, 56, 39, 54, 21, 34)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 28, 57, 40, 55, 22, 34)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 29, 59, 41, 57, 22, 35)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 30, 61, 42, 58, 22, 35)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 31, 62, 43, 59, 22, 35)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 32, 64, 44, 61, 22, 36)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 33, 65, 45, 62, 22, 36)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 34, 67, 46, 64, 23, 37)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 35, 69, 47, 65, 23, 37)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 36, 71, 48, 67, 23, 38)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 37, 72, 49, 69, 23, 38)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 38, 74, 50, 70, 23, 38)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 39, 76, 51, 72, 24, 39)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 40, 78, 52, 73, 24, 39)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 41, 79, 54, 75, 24, 40)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 42, 81, 55, 77, 24, 40)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 43, 83, 56, 78, 24, 41)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 44, 85, 57, 80, 24, 41)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 45, 87, 58, 82, 25, 42)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 46, 89, 59, 84, 25, 42)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 47, 91, 61, 85, 25, 43)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 48, 93, 62, 87, 25, 43)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 49, 95, 63, 89, 26, 44)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 50, 97, 64, 91, 26, 44)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 51, 99, 66, 93, 26, 45)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 52, 101, 67, 95, 26, 45)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 53, 103, 68, 97, 26, 46)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 54, 105, 70, 99, 27, 47)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 55, 108, 71, 101, 27, 47)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 56, 110, 72, 103, 27, 48)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 57, 112, 74, 105, 27, 48)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 58, 114, 75, 107, 28, 49)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 59, 117, 77, 109, 28, 49)
    ,(@RACE_UNDEAD, @CLASS_WARRIOR, 60, 119, 78, 111, 28, 50)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_UNDEAD, @CLASS_ROGUE, 1, 20, 21, 22, 18, 25)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 2, 21, 22, 23, 18, 25)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 3, 21, 23, 23, 18, 26)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 4, 22, 25, 24, 19, 26)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 5, 23, 26, 25, 19, 26)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 6, 23, 27, 25, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 7, 24, 29, 26, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 8, 25, 30, 26, 19, 27)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 9, 26, 31, 27, 19, 28)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 10, 26, 33, 28, 20, 28)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 11, 27, 34, 29, 20, 29)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 12, 28, 35, 29, 20, 29)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 13, 29, 37, 30, 20, 29)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 14, 29, 38, 31, 20, 30)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 15, 30, 40, 31, 21, 30)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 16, 31, 41, 32, 21, 31)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 17, 32, 42, 33, 21, 31)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 18, 33, 44, 34, 21, 31)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 19, 34, 46, 34, 21, 32)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 20, 34, 47, 35, 22, 32)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 21, 35, 49, 36, 22, 33)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 22, 36, 50, 37, 22, 33)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 23, 37, 52, 38, 22, 34)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 24, 38, 53, 38, 23, 34)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 25, 39, 55, 39, 23, 35)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 26, 40, 57, 40, 23, 35)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 27, 41, 58, 41, 23, 35)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 28, 42, 60, 42, 23, 36)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 29, 42, 62, 43, 24, 36)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 30, 43, 64, 43, 24, 37)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 31, 44, 65, 44, 24, 37)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 32, 45, 67, 45, 24, 38)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 33, 46, 69, 46, 25, 38)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 34, 47, 71, 47, 25, 39)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 35, 48, 73, 48, 25, 39)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 36, 50, 75, 49, 26, 40)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 37, 51, 76, 50, 26, 41)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 38, 52, 78, 51, 26, 41)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 39, 53, 80, 52, 26, 42)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 40, 54, 82, 53, 27, 42)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 41, 55, 84, 54, 27, 43)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 42, 56, 86, 55, 27, 43)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 43, 57, 88, 56, 27, 44)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 44, 58, 91, 57, 28, 44)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 45, 60, 93, 58, 28, 45)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 46, 61, 95, 59, 28, 46)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 47, 62, 97, 60, 29, 46)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 48, 63, 99, 61, 29, 47)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 49, 64, 101, 63, 29, 48)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 50, 66, 104, 64, 30, 48)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 51, 67, 106, 65, 30, 49)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 52, 68, 108, 66, 30, 49)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 53, 69, 111, 67, 31, 50)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 54, 71, 113, 68, 31, 51)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 55, 72, 115, 70, 31, 51)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 56, 73, 118, 71, 32, 52)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 57, 75, 120, 72, 32, 53)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 58, 76, 123, 73, 32, 54)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 59, 78, 125, 75, 33, 54)
    ,(@RACE_UNDEAD, @CLASS_ROGUE, 60, 79, 128, 76, 33, 55)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_UNDEAD, @CLASS_PRIEST, 1, 19, 18, 21, 20, 28)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 2, 19, 18, 21, 21, 29)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 3, 19, 18, 22, 22, 30)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 4, 20, 19, 22, 23, 32)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 5, 20, 19, 22, 25, 33)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 6, 20, 19, 23, 26, 34)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 7, 20, 19, 23, 27, 35)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 8, 20, 20, 23, 28, 36)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 9, 20, 20, 24, 29, 38)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 10, 21, 20, 24, 31, 39)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 11, 21, 20, 25, 32, 40)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 12, 21, 21, 25, 33, 42)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 13, 21, 21, 25, 34, 43)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 14, 21, 21, 26, 36, 44)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 15, 22, 21, 26, 37, 46)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 16, 22, 22, 27, 38, 47)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 17, 22, 22, 27, 40, 48)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 18, 22, 22, 27, 41, 50)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 19, 22, 23, 28, 42, 51)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 20, 23, 23, 28, 44, 53)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 21, 23, 23, 29, 45, 54)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 22, 23, 23, 29, 47, 56)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 23, 23, 24, 30, 48, 57)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 24, 24, 24, 30, 50, 59)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 25, 24, 24, 31, 51, 60)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 26, 24, 25, 31, 53, 62)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 27, 24, 25, 31, 54, 64)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 28, 24, 25, 32, 56, 65)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 29, 25, 26, 32, 57, 67)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 30, 25, 26, 33, 59, 69)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 31, 25, 26, 33, 61, 70)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 32, 25, 27, 34, 62, 72)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 33, 26, 27, 34, 64, 74)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 34, 26, 27, 35, 66, 75)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 35, 26, 28, 35, 67, 77)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 36, 27, 28, 36, 69, 79)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 37, 27, 28, 37, 71, 81)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 38, 27, 29, 37, 73, 83)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 39, 27, 29, 38, 74, 85)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 40, 28, 29, 38, 76, 86)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 41, 28, 30, 39, 78, 88)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 42, 28, 30, 39, 80, 90)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 43, 28, 31, 40, 82, 92)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 44, 29, 31, 40, 84, 94)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 45, 29, 31, 41, 86, 96)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 46, 29, 32, 42, 88, 98)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 47, 30, 32, 42, 90, 100)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 48, 30, 33, 43, 92, 103)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 49, 30, 33, 44, 94, 105)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 50, 31, 33, 44, 96, 107)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 51, 31, 34, 45, 98, 109)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 52, 31, 34, 45, 100, 111)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 53, 32, 35, 46, 102, 113)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 54, 32, 35, 47, 104, 116)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 55, 32, 36, 47, 107, 118)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 56, 33, 36, 48, 109, 120)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 57, 33, 37, 49, 111, 123)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 58, 33, 37, 50, 113, 125)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 59, 34, 38, 50, 116, 128)
    ,(@RACE_UNDEAD, @CLASS_PRIEST, 60, 34, 38, 51, 118, 130)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_UNDEAD, @CLASS_MAGE, 1, 19, 18, 21, 27, 21)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 2, 19, 18, 21, 22, 28)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 3, 19, 18, 22, 23, 29)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 4, 19, 19, 22, 25, 30)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 5, 19, 19, 22, 26, 32)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 6, 20, 19, 22, 27, 33)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 7, 20, 19, 23, 28, 34)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 8, 20, 19, 23, 29, 35)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 9, 20, 19, 23, 31, 36)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 10, 20, 20, 24, 32, 38)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 11, 20, 20, 24, 33, 39)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 12, 20, 20, 24, 35, 40)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 13, 20, 20, 25, 36, 41)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 14, 21, 20, 25, 37, 43)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 15, 21, 21, 25, 39, 44)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 16, 21, 21, 26, 40, 45)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 17, 21, 21, 26, 41, 47)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 18, 21, 21, 26, 43, 48)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 19, 21, 21, 27, 44, 49)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 20, 21, 22, 27, 46, 51)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 21, 22, 22, 27, 47, 52)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 22, 22, 22, 28, 49, 54)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 23, 22, 22, 28, 50, 55)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 24, 22, 23, 29, 52, 57)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 25, 22, 23, 29, 53, 58)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 26, 22, 23, 29, 55, 60)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 27, 22, 23, 30, 57, 61)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 28, 23, 23, 30, 58, 63)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 29, 23, 24, 31, 60, 64)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 30, 23, 24, 31, 62, 66)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 31, 23, 24, 31, 63, 68)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 32, 23, 24, 32, 65, 69)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 33, 23, 25, 32, 67, 71)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 34, 24, 25, 33, 68, 73)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 35, 24, 25, 33, 70, 74)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 36, 24, 26, 34, 72, 76)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 37, 24, 26, 34, 74, 78)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 38, 24, 26, 34, 76, 80)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 39, 25, 26, 35, 78, 81)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 40, 25, 27, 35, 79, 83)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 41, 25, 27, 36, 81, 85)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 42, 25, 27, 36, 83, 87)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 43, 25, 27, 37, 85, 89)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 44, 25, 28, 37, 87, 91)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 45, 26, 28, 38, 89, 93)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 46, 26, 28, 38, 91, 95)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 47, 26, 29, 39, 93, 97)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 48, 26, 29, 39, 96, 99)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 49, 27, 29, 40, 98, 101)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 50, 27, 30, 40, 100, 103)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 51, 27, 30, 41, 102, 105)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 52, 27, 30, 41, 104, 107)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 53, 27, 31, 42, 106, 109)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 54, 28, 31, 43, 109, 111)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 55, 28, 31, 43, 111, 114)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 56, 28, 32, 44, 113, 116)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 57, 28, 32, 44, 116, 118)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 58, 29, 32, 45, 118, 120)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 59, 29, 33, 45, 121, 123)
    ,(@RACE_UNDEAD, @CLASS_MAGE, 60, 29, 33, 46, 123, 125)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_UNDEAD, @CLASS_WARLOCK, 1, 19, 18, 22, 20, 27)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 2, 19, 18, 23, 21, 28)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 3, 20, 19, 23, 22, 29)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 4, 20, 19, 24, 23, 30)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 5, 20, 19, 24, 24, 31)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 6, 20, 20, 25, 25, 32)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 7, 21, 20, 25, 26, 34)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 8, 21, 20, 26, 27, 35)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 9, 21, 21, 26, 28, 36)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 10, 22, 21, 27, 29, 37)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 11, 22, 22, 27, 31, 38)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 12, 22, 22, 28, 32, 39)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 13, 23, 22, 28, 33, 41)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 14, 23, 23, 29, 34, 42)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 15, 23, 23, 30, 35, 43)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 16, 24, 24, 30, 36, 44)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 17, 24, 24, 31, 38, 46)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 18, 24, 24, 31, 39, 47)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 19, 25, 25, 32, 40, 48)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 20, 25, 25, 33, 41, 50)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 21, 25, 26, 33, 43, 51)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 22, 26, 26, 34, 44, 52)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 23, 26, 27, 35, 45, 54)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 24, 27, 27, 35, 47, 55)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 25, 27, 28, 36, 48, 57)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 26, 27, 28, 37, 49, 58)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 27, 28, 28, 37, 51, 59)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 28, 28, 29, 38, 52, 61)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 29, 29, 29, 39, 54, 62)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 30, 29, 30, 39, 55, 64)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 31, 29, 30, 40, 56, 66)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 32, 30, 31, 41, 58, 67)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 33, 30, 31, 42, 59, 69)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 34, 31, 32, 42, 61, 70)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 35, 31, 32, 43, 62, 72)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 36, 32, 33, 43, 64, 75)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 37, 32, 34, 45, 66, 75)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 38, 32, 34, 46, 67, 77)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 39, 33, 35, 46, 69, 79)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 40, 33, 35, 47, 70, 80)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 41, 34, 36, 48, 72, 82)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 42, 34, 36, 48, 74, 85)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 43, 35, 37, 50, 75, 86)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 44, 35, 37, 51, 77, 87)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 45, 36, 38, 51, 79, 89)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 46, 36, 39, 52, 81, 90)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 47, 37, 39, 53, 82, 93)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 48, 37, 40, 54, 84, 95)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 49, 38, 41, 55, 86, 96)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 50, 38, 41, 56, 88, 99)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 51, 39, 42, 57, 90, 101)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 52, 39, 42, 58, 92, 103)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 53, 40, 43, 59, 94, 105)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 54, 41, 44, 60, 96, 107)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 55, 41, 44, 60, 98, 110)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 56, 42, 45, 62, 100, 111)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 57, 42, 46, 63, 102, 113)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 58, 43, 47, 63, 104, 116)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 59, 43, 47, 65, 106, 118)
    ,(@RACE_UNDEAD, @CLASS_WARLOCK, 60, 44, 48, 66, 108, 120)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TAUREN, @CLASS_WARRIOR, 1, 28, 15, 24, 15, 22)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 2, 29, 16, 25, 15, 22)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 3, 30, 16, 26, 15, 23)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 4, 31, 17, 27, 15, 23)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 5, 33, 18, 28, 15, 23)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 6, 34, 19, 29, 16, 23)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 7, 35, 19, 30, 16, 24)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 8, 36, 20, 31, 16, 24)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 9, 37, 21, 32, 16, 24)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 10, 38, 21, 33, 16, 25)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 11, 40, 22, 35, 16, 25)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 12, 41, 23, 36, 16, 25)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 13, 42, 24, 37, 16, 26)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 14, 44, 25, 38, 17, 26)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 15, 45, 25, 39, 17, 26)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 16, 46, 26, 40, 17, 27)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 17, 47, 27, 42, 17, 27)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 18, 49, 28, 43, 17, 27)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 19, 50, 29, 44, 17, 28)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 20, 52, 30, 45, 17, 28)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 21, 53, 30, 47, 18, 28)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 22, 54, 31, 48, 18, 29)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 23, 56, 32, 49, 18, 29)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 24, 57, 33, 51, 18, 30)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 25, 59, 34, 52, 18, 30)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 26, 60, 35, 53, 18, 30)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 27, 62, 36, 55, 18, 31)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 28, 63, 37, 56, 19, 31)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 29, 65, 38, 58, 19, 32)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 30, 67, 39, 59, 19, 32)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 31, 68, 40, 60, 19, 32)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 32, 70, 41, 62, 19, 33)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 33, 71, 42, 63, 19, 33)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 34, 73, 43, 65, 20, 34)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 35, 75, 44, 66, 20, 34)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 36, 77, 45, 68, 20, 35)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 37, 78, 46, 70, 20, 35)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 38, 80, 47, 71, 20, 35)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 39, 82, 48, 73, 21, 36)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 40, 84, 49, 74, 21, 36)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 41, 85, 51, 76, 21, 37)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 42, 87, 52, 78, 21, 37)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 43, 89, 53, 79, 21, 38)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 44, 91, 54, 81, 21, 38)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 45, 93, 55, 83, 22, 39)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 46, 95, 56, 85, 22, 39)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 47, 97, 58, 86, 22, 40)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 48, 99, 59, 88, 22, 40)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 49, 101, 60, 90, 23, 41)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 50, 103, 61, 92, 23, 41)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 51, 105, 63, 94, 23, 42)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 52, 107, 64, 96, 23, 42)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 53, 109, 65, 98, 23, 43)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 54, 111, 67, 100, 24, 44)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 55, 114, 68, 102, 24, 44)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 56, 116, 69, 104, 24, 45)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 57, 118, 71, 106, 24, 45)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 58, 120, 72, 108, 25, 46)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 59, 123, 74, 110, 25, 46)
    ,(@RACE_TAUREN, @CLASS_WARRIOR, 60, 125, 75, 112, 25, 47)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TAUREN, @CLASS_HUNTER, 1, 25, 18, 23, 15, 23)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 2, 25, 19, 24, 16, 24)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 3, 26, 20, 25, 16, 24)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 4, 26, 22, 25, 17, 25)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 5, 27, 23, 26, 17, 25)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 6, 27, 24, 27, 18, 26)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 7, 27, 25, 28, 18, 26)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 8, 28, 26, 29, 19, 27)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 9, 28, 28, 30, 19, 28)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 10, 29, 29, 30, 20, 28)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 11, 29, 30, 31, 20, 29)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 12, 30, 32, 32, 21, 30)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 13, 30, 33, 33, 22, 30)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 14, 31, 34, 34, 22, 31)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 15, 31, 36, 35, 23, 31)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 16, 32, 37, 36, 23, 32)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 17, 32, 38, 37, 24, 33)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 18, 33, 40, 38, 25, 34)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 19, 33, 41, 39, 25, 34)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 20, 34, 43, 40, 26, 35)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 21, 34, 44, 41, 27, 36)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 22, 35, 46, 42, 27, 36)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 23, 35, 47, 43, 28, 37)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 24, 36, 49, 44, 29, 38)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 25, 36, 50, 45, 29, 39)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 26, 37, 52, 46, 30, 39)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 27, 37, 54, 47, 31, 40)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 28, 38, 55, 48, 31, 41)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 29, 38, 57, 49, 32, 42)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 30, 39, 59, 50, 33, 42)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 31, 39, 60, 52, 34, 43)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 32, 40, 62, 53, 34, 44)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 33, 41, 64, 54, 35, 45)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 34, 41, 65, 55, 36, 46)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 35, 42, 67, 56, 37, 47)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 36, 43, 69, 58, 38, 48)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 37, 43, 71, 59, 38, 48)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 38, 44, 73, 60, 39, 49)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 39, 44, 75, 61, 40, 50)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 40, 45, 76, 63, 41, 51)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 41, 46, 78, 64, 42, 52)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 42, 46, 80, 65, 42, 53)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 43, 47, 82, 66, 43, 54)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 44, 48, 84, 68, 44, 55)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 45, 48, 86, 69, 45, 56)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 46, 49, 88, 71, 46, 57)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 47, 50, 90, 72, 47, 58)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 48, 51, 93, 73, 48, 59)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 49, 51, 95, 75, 49, 60)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 50, 52, 97, 76, 50, 61)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 51, 53, 99, 78, 51, 62)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 52, 54, 101, 79, 52, 63)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 53, 54, 103, 81, 53, 64)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 54, 55, 106, 82, 54, 65)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 55, 56, 108, 84, 55, 66)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 56, 57, 110, 85, 56, 67)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 57, 58, 113, 87, 57, 69)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 58, 58, 115, 89, 58, 70)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 59, 59, 118, 90, 59, 71)
    ,(@RACE_TAUREN, @CLASS_HUNTER, 60, 60, 120, 92, 60, 72)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TAUREN, @CLASS_SHAMAN, 1, 26, 15, 23, 16, 24)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 2, 27, 15, 24, 17, 25)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 3, 27, 16, 25, 18, 26)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 4, 28, 16, 26, 18, 27)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 5, 29, 17, 26, 19, 28)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 6, 30, 17, 27, 20, 29)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 7, 31, 17, 28, 21, 30)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 8, 31, 18, 29, 22, 30)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 9, 32, 18, 30, 23, 31)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 10, 33, 19, 31, 23, 32)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 11, 34, 19, 32, 24, 33)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 12, 35, 20, 33, 25, 34)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 13, 35, 20, 34, 26, 35)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 14, 36, 21, 35, 27, 36)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 15, 37, 21, 36, 28, 38)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 16, 38, 22, 37, 29, 39)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 17, 39, 22, 38, 30, 40)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 18, 40, 23, 39, 31, 41)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 19, 41, 23, 40, 32, 42)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 20, 42, 24, 41, 33, 43)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 21, 43, 24, 42, 34, 44)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 22, 43, 25, 43, 35, 45)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 23, 44, 25, 44, 36, 46)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 24, 45, 26, 45, 37, 48)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 25, 46, 26, 47, 38, 49)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 26, 47, 27, 48, 39, 50)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 27, 48, 27, 49, 40, 51)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 28, 49, 28, 50, 41, 52)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 29, 50, 28, 51, 42, 54)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 30, 51, 29, 52, 43, 55)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 31, 53, 29, 54, 45, 56)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 32, 54, 30, 55, 46, 58)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 33, 55, 31, 56, 47, 59)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 34, 56, 31, 57, 48, 60)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 35, 57, 32, 59, 49, 62)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 36, 58, 33, 60, 51, 63)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 37, 59, 33, 61, 52, 64)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 38, 60, 34, 63, 53, 66)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 39, 61, 34, 64, 54, 67)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 40, 63, 35, 65, 56, 69)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 41, 64, 36, 67, 57, 70)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 42, 65, 36, 68, 58, 72)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 43, 66, 37, 70, 59, 73)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 44, 68, 38, 71, 61, 75)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 45, 69, 38, 73, 62, 76)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 46, 70, 39, 74, 64, 78)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 47, 71, 40, 76, 65, 79)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 48, 73, 41, 77, 66, 81)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 49, 74, 41, 79, 68, 83)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 50, 75, 42, 80, 69, 84)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 51, 77, 43, 82, 71, 86)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 52, 78, 44, 83, 72, 88)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 53, 80, 44, 85, 74, 89)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 54, 81, 45, 87, 75, 91)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 55, 82, 46, 88, 77, 93)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 56, 84, 47, 90, 78, 95)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 57, 85, 48, 92, 80, 96)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 58, 87, 48, 93, 82, 98)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 59, 88, 49, 95, 83, 100)
    ,(@RACE_TAUREN, @CLASS_SHAMAN, 60, 90, 50, 97, 85, 102)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TAUREN, @CLASS_DRUID, 1, 26, 15, 22, 17, 24)
    ,(@RACE_TAUREN, @CLASS_DRUID, 2, 27, 15, 23, 18, 25)
    ,(@RACE_TAUREN, @CLASS_DRUID, 3, 27, 16, 23, 19, 26)
    ,(@RACE_TAUREN, @CLASS_DRUID, 4, 28, 16, 24, 20, 27)
    ,(@RACE_TAUREN, @CLASS_DRUID, 5, 28, 17, 24, 21, 28)
    ,(@RACE_TAUREN, @CLASS_DRUID, 6, 29, 17, 25, 22, 29)
    ,(@RACE_TAUREN, @CLASS_DRUID, 7, 29, 18, 26, 23, 30)
    ,(@RACE_TAUREN, @CLASS_DRUID, 8, 30, 18, 26, 23, 31)
    ,(@RACE_TAUREN, @CLASS_DRUID, 9, 30, 19, 27, 24, 32)
    ,(@RACE_TAUREN, @CLASS_DRUID, 10, 31, 19, 27, 25, 33)
    ,(@RACE_TAUREN, @CLASS_DRUID, 11, 31, 20, 28, 26, 35)
    ,(@RACE_TAUREN, @CLASS_DRUID, 12, 32, 20, 29, 27, 36)
    ,(@RACE_TAUREN, @CLASS_DRUID, 13, 32, 21, 29, 28, 37)
    ,(@RACE_TAUREN, @CLASS_DRUID, 14, 33, 21, 30, 29, 38)
    ,(@RACE_TAUREN, @CLASS_DRUID, 15, 34, 22, 31, 31, 39)
    ,(@RACE_TAUREN, @CLASS_DRUID, 16, 34, 22, 31, 32, 40)
    ,(@RACE_TAUREN, @CLASS_DRUID, 17, 35, 23, 32, 33, 42)
    ,(@RACE_TAUREN, @CLASS_DRUID, 18, 35, 24, 33, 34, 43)
    ,(@RACE_TAUREN, @CLASS_DRUID, 19, 36, 24, 33, 35, 44)
    ,(@RACE_TAUREN, @CLASS_DRUID, 20, 37, 25, 34, 36, 45)
    ,(@RACE_TAUREN, @CLASS_DRUID, 21, 37, 25, 35, 37, 47)
    ,(@RACE_TAUREN, @CLASS_DRUID, 22, 38, 26, 36, 38, 48)
    ,(@RACE_TAUREN, @CLASS_DRUID, 23, 39, 27, 36, 39, 49)
    ,(@RACE_TAUREN, @CLASS_DRUID, 24, 39, 27, 37, 41, 51)
    ,(@RACE_TAUREN, @CLASS_DRUID, 25, 40, 28, 38, 42, 52)
    ,(@RACE_TAUREN, @CLASS_DRUID, 26, 41, 28, 39, 43, 53)
    ,(@RACE_TAUREN, @CLASS_DRUID, 27, 41, 29, 39, 44, 55)
    ,(@RACE_TAUREN, @CLASS_DRUID, 28, 42, 30, 40, 45, 56)
    ,(@RACE_TAUREN, @CLASS_DRUID, 29, 43, 30, 41, 47, 58)
    ,(@RACE_TAUREN, @CLASS_DRUID, 30, 43, 31, 42, 48, 59)
    ,(@RACE_TAUREN, @CLASS_DRUID, 31, 44, 32, 43, 49, 60)
    ,(@RACE_TAUREN, @CLASS_DRUID, 32, 45, 32, 44, 51, 62)
    ,(@RACE_TAUREN, @CLASS_DRUID, 33, 46, 33, 44, 52, 63)
    ,(@RACE_TAUREN, @CLASS_DRUID, 34, 46, 34, 45, 53, 65)
    ,(@RACE_TAUREN, @CLASS_DRUID, 35, 47, 34, 46, 55, 66)
    ,(@RACE_TAUREN, @CLASS_DRUID, 36, 48, 35, 47, 56, 68)
    ,(@RACE_TAUREN, @CLASS_DRUID, 37, 49, 36, 48, 57, 70)
    ,(@RACE_TAUREN, @CLASS_DRUID, 38, 50, 36, 49, 59, 71)
    ,(@RACE_TAUREN, @CLASS_DRUID, 39, 50, 37, 50, 60, 73)
    ,(@RACE_TAUREN, @CLASS_DRUID, 40, 51, 38, 51, 62, 74)
    ,(@RACE_TAUREN, @CLASS_DRUID, 41, 52, 39, 52, 63, 76)
    ,(@RACE_TAUREN, @CLASS_DRUID, 42, 53, 39, 53, 65, 78)
    ,(@RACE_TAUREN, @CLASS_DRUID, 43, 54, 40, 54, 66, 79)
    ,(@RACE_TAUREN, @CLASS_DRUID, 44, 55, 41, 54, 68, 81)
    ,(@RACE_TAUREN, @CLASS_DRUID, 45, 55, 42, 55, 69, 83)
    ,(@RACE_TAUREN, @CLASS_DRUID, 46, 56, 43, 56, 71, 85)
    ,(@RACE_TAUREN, @CLASS_DRUID, 47, 57, 43, 58, 72, 86)
    ,(@RACE_TAUREN, @CLASS_DRUID, 48, 58, 44, 59, 74, 88)
    ,(@RACE_TAUREN, @CLASS_DRUID, 49, 59, 45, 60, 76, 90)
    ,(@RACE_TAUREN, @CLASS_DRUID, 50, 60, 46, 61, 77, 92)
    ,(@RACE_TAUREN, @CLASS_DRUID, 51, 61, 47, 62, 79, 94)
    ,(@RACE_TAUREN, @CLASS_DRUID, 52, 62, 48, 63, 81, 96)
    ,(@RACE_TAUREN, @CLASS_DRUID, 53, 63, 49, 64, 82, 98)
    ,(@RACE_TAUREN, @CLASS_DRUID, 54, 64, 49, 65, 84, 100)
    ,(@RACE_TAUREN, @CLASS_DRUID, 55, 65, 50, 66, 86, 102)
    ,(@RACE_TAUREN, @CLASS_DRUID, 56, 66, 51, 67, 88, 104)
    ,(@RACE_TAUREN, @CLASS_DRUID, 57, 67, 52, 68, 89, 106)
    ,(@RACE_TAUREN, @CLASS_DRUID, 58, 68, 53, 70, 91, 108)
    ,(@RACE_TAUREN, @CLASS_DRUID, 59, 69, 54, 71, 93, 110)
    ,(@RACE_TAUREN, @CLASS_DRUID, 60, 70, 55, 72, 95, 112)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_GNOME, @CLASS_WARRIOR, 1, 18, 23, 21, 23, 20)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 2, 19, 24, 22, 24, 20)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 3, 20, 24, 23, 24, 21)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 4, 21, 25, 24, 24, 21)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 5, 23, 26, 25, 24, 21)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 6, 24, 27, 26, 25, 21)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 7, 25, 27, 27, 25, 22)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 8, 26, 28, 28, 25, 22)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 9, 27, 29, 29, 25, 22)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 10, 28, 29, 30, 25, 23)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 11, 30, 30, 32, 25, 23)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 12, 31, 31, 33, 25, 23)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 13, 32, 32, 34, 25, 24)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 14, 34, 33, 35, 26, 24)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 15, 35, 33, 36, 26, 24)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 16, 36, 34, 37, 26, 25)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 17, 37, 35, 39, 26, 25)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 18, 39, 36, 40, 26, 25)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 19, 40, 37, 41, 26, 26)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 20, 42, 38, 42, 26, 26)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 21, 43, 38, 44, 27, 26)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 22, 44, 39, 45, 27, 27)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 23, 46, 40, 46, 27, 27)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 24, 47, 41, 48, 27, 28)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 25, 49, 42, 49, 27, 28)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 26, 50, 43, 50, 27, 28)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 27, 52, 44, 52, 27, 29)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 28, 53, 45, 53, 28, 29)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 29, 55, 46, 55, 28, 30)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 30, 57, 47, 56, 28, 30)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 31, 58, 48, 57, 28, 30)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 32, 60, 49, 59, 28, 31)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 33, 61, 50, 60, 28, 31)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 34, 63, 51, 62, 29, 32)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 35, 65, 52, 63, 29, 32)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 36, 67, 53, 65, 29, 33)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 37, 68, 54, 67, 29, 33)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 38, 70, 55, 68, 29, 33)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 39, 72, 56, 70, 30, 34)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 40, 74, 57, 71, 30, 34)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 41, 75, 59, 73, 30, 35)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 42, 77, 60, 75, 30, 35)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 43, 79, 61, 76, 30, 36)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 44, 81, 62, 78, 30, 36)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 45, 83, 63, 80, 32, 37)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 46, 85, 64, 82, 32, 37)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 47, 87, 66, 83, 32, 38)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 48, 89, 67, 85, 32, 38)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 49, 91, 68, 87, 33, 39)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 50, 93, 69, 89, 33, 39)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 51, 95, 71, 91, 33, 40)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 52, 97, 72, 93, 33, 40)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 53, 99, 73, 95, 33, 41)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 54, 101, 75, 97, 34, 42)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 55, 104, 76, 99, 34, 42)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 56, 106, 77, 101, 34, 43)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 57, 108, 79, 103, 34, 43)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 58, 110, 80, 105, 35, 44)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 59, 113, 82, 107, 35, 44)
    ,(@RACE_GNOME, @CLASS_WARRIOR, 60, 115, 83, 109, 35, 45)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_GNOME, @CLASS_ROGUE, 1, 16, 26, 20, 23, 20)
    ,(@RACE_GNOME, @CLASS_ROGUE, 2, 17, 27, 21, 24, 20)
    ,(@RACE_GNOME, @CLASS_ROGUE, 3, 17, 28, 21, 24, 21)
    ,(@RACE_GNOME, @CLASS_ROGUE, 4, 18, 30, 22, 25, 21)
    ,(@RACE_GNOME, @CLASS_ROGUE, 5, 19, 31, 23, 25, 21)
    ,(@RACE_GNOME, @CLASS_ROGUE, 6, 19, 32, 23, 25, 22)
    ,(@RACE_GNOME, @CLASS_ROGUE, 7, 20, 34, 24, 25, 22)
    ,(@RACE_GNOME, @CLASS_ROGUE, 8, 21, 35, 24, 25, 22)
    ,(@RACE_GNOME, @CLASS_ROGUE, 9, 22, 36, 25, 25, 23)
    ,(@RACE_GNOME, @CLASS_ROGUE, 10, 22, 38, 26, 26, 23)
    ,(@RACE_GNOME, @CLASS_ROGUE, 11, 23, 39, 27, 26, 24)
    ,(@RACE_GNOME, @CLASS_ROGUE, 12, 24, 40, 27, 26, 24)
    ,(@RACE_GNOME, @CLASS_ROGUE, 13, 25, 42, 28, 26, 24)
    ,(@RACE_GNOME, @CLASS_ROGUE, 14, 25, 43, 29, 26, 25)
    ,(@RACE_GNOME, @CLASS_ROGUE, 15, 26, 45, 29, 27, 25)
    ,(@RACE_GNOME, @CLASS_ROGUE, 16, 27, 46, 30, 27, 26)
    ,(@RACE_GNOME, @CLASS_ROGUE, 17, 28, 47, 31, 27, 26)
    ,(@RACE_GNOME, @CLASS_ROGUE, 18, 29, 49, 32, 27, 26)
    ,(@RACE_GNOME, @CLASS_ROGUE, 19, 30, 51, 32, 27, 27)
    ,(@RACE_GNOME, @CLASS_ROGUE, 20, 30, 52, 33, 28, 27)
    ,(@RACE_GNOME, @CLASS_ROGUE, 21, 31, 54, 34, 28, 28)
    ,(@RACE_GNOME, @CLASS_ROGUE, 22, 32, 55, 35, 28, 28)
    ,(@RACE_GNOME, @CLASS_ROGUE, 23, 33, 57, 36, 28, 29)
    ,(@RACE_GNOME, @CLASS_ROGUE, 24, 34, 58, 36, 29, 29)
    ,(@RACE_GNOME, @CLASS_ROGUE, 25, 35, 60, 37, 29, 30)
    ,(@RACE_GNOME, @CLASS_ROGUE, 26, 36, 62, 38, 29, 30)
    ,(@RACE_GNOME, @CLASS_ROGUE, 27, 37, 63, 39, 29, 30)
    ,(@RACE_GNOME, @CLASS_ROGUE, 28, 38, 65, 40, 29, 31)
    ,(@RACE_GNOME, @CLASS_ROGUE, 29, 38, 67, 41, 30, 31)
    ,(@RACE_GNOME, @CLASS_ROGUE, 30, 39, 69, 41, 30, 32)
    ,(@RACE_GNOME, @CLASS_ROGUE, 31, 40, 70, 42, 30, 32)
    ,(@RACE_GNOME, @CLASS_ROGUE, 32, 41, 72, 43, 30, 33)
    ,(@RACE_GNOME, @CLASS_ROGUE, 33, 42, 74, 44, 32, 33)
    ,(@RACE_GNOME, @CLASS_ROGUE, 34, 43, 76, 45, 32, 34)
    ,(@RACE_GNOME, @CLASS_ROGUE, 35, 44, 78, 46, 32, 34)
    ,(@RACE_GNOME, @CLASS_ROGUE, 36, 46, 80, 47, 33, 35)
    ,(@RACE_GNOME, @CLASS_ROGUE, 37, 47, 81, 48, 33, 36)
    ,(@RACE_GNOME, @CLASS_ROGUE, 38, 48, 83, 49, 33, 36)
    ,(@RACE_GNOME, @CLASS_ROGUE, 39, 49, 85, 50, 33, 37)
    ,(@RACE_GNOME, @CLASS_ROGUE, 40, 50, 87, 51, 34, 37)
    ,(@RACE_GNOME, @CLASS_ROGUE, 41, 51, 89, 52, 34, 38)
    ,(@RACE_GNOME, @CLASS_ROGUE, 42, 52, 91, 53, 34, 38)
    ,(@RACE_GNOME, @CLASS_ROGUE, 43, 53, 93, 54, 34, 39)
    ,(@RACE_GNOME, @CLASS_ROGUE, 44, 54, 96, 55, 35, 39)
    ,(@RACE_GNOME, @CLASS_ROGUE, 45, 56, 98, 56, 35, 40)
    ,(@RACE_GNOME, @CLASS_ROGUE, 46, 57, 100, 57, 35, 41)
    ,(@RACE_GNOME, @CLASS_ROGUE, 47, 58, 102, 58, 36, 41)
    ,(@RACE_GNOME, @CLASS_ROGUE, 48, 59, 104, 59, 36, 42)
    ,(@RACE_GNOME, @CLASS_ROGUE, 49, 60, 106, 61, 36, 43)
    ,(@RACE_GNOME, @CLASS_ROGUE, 50, 62, 109, 62, 37, 43)
    ,(@RACE_GNOME, @CLASS_ROGUE, 51, 63, 111, 63, 37, 44)
    ,(@RACE_GNOME, @CLASS_ROGUE, 52, 64, 113, 64, 37, 44)
    ,(@RACE_GNOME, @CLASS_ROGUE, 53, 65, 116, 65, 38, 45)
    ,(@RACE_GNOME, @CLASS_ROGUE, 54, 67, 118, 66, 38, 46)
    ,(@RACE_GNOME, @CLASS_ROGUE, 55, 68, 120, 68, 38, 46)
    ,(@RACE_GNOME, @CLASS_ROGUE, 56, 69, 123, 69, 39, 47)
    ,(@RACE_GNOME, @CLASS_ROGUE, 57, 71, 125, 70, 39, 48)
    ,(@RACE_GNOME, @CLASS_ROGUE, 58, 72, 128, 71, 39, 49)
    ,(@RACE_GNOME, @CLASS_ROGUE, 59, 74, 130, 73, 40, 49)
    ,(@RACE_GNOME, @CLASS_ROGUE, 60, 75, 133, 74, 40, 50)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_GNOME, @CLASS_MAGE, 1, 15, 23, 19, 26, 22)
    ,(@RACE_GNOME, @CLASS_MAGE, 2, 15, 23, 19, 28, 23)
    ,(@RACE_GNOME, @CLASS_MAGE, 3, 15, 23, 20, 29, 24)
    ,(@RACE_GNOME, @CLASS_MAGE, 4, 15, 24, 20, 32, 25)
    ,(@RACE_GNOME, @CLASS_MAGE, 5, 15, 24, 20, 33, 27)
    ,(@RACE_GNOME, @CLASS_MAGE, 6, 16, 24, 20, 34, 28)
    ,(@RACE_GNOME, @CLASS_MAGE, 7, 16, 24, 21, 35, 29)
    ,(@RACE_GNOME, @CLASS_MAGE, 8, 16, 24, 21, 36, 30)
    ,(@RACE_GNOME, @CLASS_MAGE, 9, 16, 24, 21, 38, 31)
    ,(@RACE_GNOME, @CLASS_MAGE, 10, 16, 25, 22, 39, 33)
    ,(@RACE_GNOME, @CLASS_MAGE, 11, 16, 25, 22, 40, 34)
    ,(@RACE_GNOME, @CLASS_MAGE, 12, 16, 25, 22, 42, 35)
    ,(@RACE_GNOME, @CLASS_MAGE, 13, 16, 25, 23, 43, 36)
    ,(@RACE_GNOME, @CLASS_MAGE, 14, 17, 25, 23, 44, 38)
    ,(@RACE_GNOME, @CLASS_MAGE, 15, 17, 26, 23, 46, 39)
    ,(@RACE_GNOME, @CLASS_MAGE, 16, 17, 26, 24, 47, 40)
    ,(@RACE_GNOME, @CLASS_MAGE, 17, 17, 26, 24, 48, 42)
    ,(@RACE_GNOME, @CLASS_MAGE, 18, 17, 26, 24, 50, 43)
    ,(@RACE_GNOME, @CLASS_MAGE, 19, 17, 26, 25, 51, 44)
    ,(@RACE_GNOME, @CLASS_MAGE, 20, 17, 27, 25, 54, 46)
    ,(@RACE_GNOME, @CLASS_MAGE, 21, 18, 27, 25, 55, 47)
    ,(@RACE_GNOME, @CLASS_MAGE, 22, 18, 27, 26, 57, 49)
    ,(@RACE_GNOME, @CLASS_MAGE, 23, 18, 27, 26, 58, 50)
    ,(@RACE_GNOME, @CLASS_MAGE, 24, 18, 28, 27, 60, 52)
    ,(@RACE_GNOME, @CLASS_MAGE, 25, 18, 28, 27, 61, 53)
    ,(@RACE_GNOME, @CLASS_MAGE, 26, 18, 28, 27, 63, 55)
    ,(@RACE_GNOME, @CLASS_MAGE, 27, 18, 28, 28, 65, 56)
    ,(@RACE_GNOME, @CLASS_MAGE, 28, 19, 28, 28, 66, 58)
    ,(@RACE_GNOME, @CLASS_MAGE, 29, 19, 29, 29, 68, 59)
    ,(@RACE_GNOME, @CLASS_MAGE, 30, 19, 29, 29, 70, 61)
    ,(@RACE_GNOME, @CLASS_MAGE, 31, 19, 29, 29, 71, 63)
    ,(@RACE_GNOME, @CLASS_MAGE, 32, 19, 29, 30, 74, 64)
    ,(@RACE_GNOME, @CLASS_MAGE, 33, 19, 30, 30, 76, 66)
    ,(@RACE_GNOME, @CLASS_MAGE, 34, 20, 30, 31, 77, 68)
    ,(@RACE_GNOME, @CLASS_MAGE, 35, 20, 30, 31, 79, 69)
    ,(@RACE_GNOME, @CLASS_MAGE, 36, 20, 31, 32, 81, 71)
    ,(@RACE_GNOME, @CLASS_MAGE, 37, 20, 31, 32, 83, 73)
    ,(@RACE_GNOME, @CLASS_MAGE, 38, 20, 31, 32, 85, 75)
    ,(@RACE_GNOME, @CLASS_MAGE, 39, 21, 31, 33, 87, 76)
    ,(@RACE_GNOME, @CLASS_MAGE, 40, 21, 32, 33, 88, 78)
    ,(@RACE_GNOME, @CLASS_MAGE, 41, 21, 32, 34, 90, 80)
    ,(@RACE_GNOME, @CLASS_MAGE, 42, 21, 32, 34, 92, 82)
    ,(@RACE_GNOME, @CLASS_MAGE, 43, 21, 32, 35, 95, 84)
    ,(@RACE_GNOME, @CLASS_MAGE, 44, 21, 33, 35, 97, 86)
    ,(@RACE_GNOME, @CLASS_MAGE, 45, 22, 33, 36, 99, 88)
    ,(@RACE_GNOME, @CLASS_MAGE, 46, 22, 33, 36, 101, 90)
    ,(@RACE_GNOME, @CLASS_MAGE, 47, 22, 34, 37, 103, 92)
    ,(@RACE_GNOME, @CLASS_MAGE, 48, 22, 34, 37, 106, 94)
    ,(@RACE_GNOME, @CLASS_MAGE, 49, 23, 34, 38, 108, 96)
    ,(@RACE_GNOME, @CLASS_MAGE, 50, 23, 35, 38, 110, 98)
    ,(@RACE_GNOME, @CLASS_MAGE, 51, 23, 35, 39, 112, 100)
    ,(@RACE_GNOME, @CLASS_MAGE, 52, 23, 35, 39, 114, 102)
    ,(@RACE_GNOME, @CLASS_MAGE, 53, 23, 36, 40, 117, 104)
    ,(@RACE_GNOME, @CLASS_MAGE, 54, 24, 36, 41, 120, 106)
    ,(@RACE_GNOME, @CLASS_MAGE, 55, 24, 36, 41, 122, 109)
    ,(@RACE_GNOME, @CLASS_MAGE, 56, 24, 37, 42, 124, 111)
    ,(@RACE_GNOME, @CLASS_MAGE, 57, 24, 37, 42, 127, 113)
    ,(@RACE_GNOME, @CLASS_MAGE, 58, 25, 37, 43, 129, 115)
    ,(@RACE_GNOME, @CLASS_MAGE, 59, 25, 38, 43, 132, 118)
    ,(@RACE_GNOME, @CLASS_MAGE, 60, 25, 38, 44, 133, 120)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_GNOME, @CLASS_WARLOCK, 1, 15, 23, 20, 25, 22)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 2, 15, 23, 21, 27, 23)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 3, 16, 24, 21, 28, 24)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 4, 16, 24, 22, 29, 25)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 5, 16, 24, 22, 30, 26)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 6, 16, 25, 23, 32, 27)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 7, 17, 25, 23, 33, 29)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 8, 17, 25, 24, 34, 30)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 9, 17, 26, 24, 35, 31)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 10, 18, 26, 25, 36, 32)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 11, 18, 27, 25, 38, 33)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 12, 18, 27, 26, 39, 34)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 13, 19, 27, 26, 40, 36)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 14, 19, 28, 27, 41, 37)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 15, 19, 28, 28, 42, 38)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 16, 20, 29, 28, 43, 39)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 17, 20, 29, 29, 45, 41)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 18, 20, 29, 29, 46, 42)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 19, 21, 30, 30, 47, 43)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 20, 21, 30, 31, 48, 45)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 21, 21, 31, 31, 50, 46)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 22, 22, 31, 32, 51, 47)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 23, 22, 32, 33, 53, 49)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 24, 23, 32, 33, 55, 50)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 25, 23, 33, 34, 56, 52)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 26, 23, 33, 35, 57, 53)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 27, 24, 33, 35, 59, 54)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 28, 24, 34, 36, 60, 56)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 29, 25, 34, 37, 62, 57)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 30, 25, 35, 37, 63, 59)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 31, 25, 35, 37, 64, 62)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 32, 26, 36, 39, 66, 62)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 33, 26, 36, 40, 67, 64)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 34, 27, 37, 40, 69, 65)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 35, 27, 37, 41, 70, 67)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 36, 28, 38, 42, 72, 69)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 37, 28, 39, 43, 75, 69)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 38, 28, 39, 44, 76, 72)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 39, 29, 40, 44, 78, 74)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 40, 29, 40, 45, 79, 75)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 41, 30, 41, 46, 81, 77)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 42, 30, 41, 47, 83, 79)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 43, 31, 42, 48, 84, 81)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 44, 31, 42, 49, 86, 82)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 45, 32, 43, 49, 88, 84)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 46, 32, 44, 50, 90, 86)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 47, 33, 44, 51, 91, 88)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 48, 33, 45, 52, 93, 90)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 49, 34, 46, 53, 96, 92)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 50, 34, 46, 54, 98, 93)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 51, 35, 47, 55, 100, 96)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 52, 35, 47, 56, 102, 98)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 53, 36, 48, 57, 104, 100)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 54, 37, 49, 58, 106, 102)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 55, 37, 49, 58, 108, 104)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 56, 38, 50, 60, 110, 106)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 57, 38, 51, 61, 112, 108)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 58, 39, 52, 62, 114, 111)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 59, 39, 52, 63, 117, 111)
    ,(@RACE_GNOME, @CLASS_WARLOCK, 60, 40, 53, 64, 119, 115)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_WARRIOR, 1, 24, 22, 23, 16, 21)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 2, 25, 23, 24, 16, 21)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 3, 26, 23, 25, 16, 22)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 4, 27, 24, 26, 16, 22)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 5, 29, 25, 27, 16, 22)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 6, 30, 26, 28, 17, 22)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 7, 31, 26, 29, 17, 23)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 8, 32, 27, 30, 17, 23)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 9, 33, 28, 31, 17, 23)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 10, 34, 28, 32, 17, 24)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 11, 36, 29, 34, 17, 24)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 12, 37, 30, 35, 17, 24)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 13, 38, 31, 36, 17, 25)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 14, 40, 32, 37, 18, 25)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 15, 41, 32, 38, 18, 25)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 16, 42, 33, 39, 18, 26)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 17, 43, 34, 41, 18, 26)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 18, 45, 35, 42, 18, 26)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 19, 46, 36, 43, 18, 27)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 20, 48, 37, 44, 18, 27)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 21, 49, 37, 46, 19, 27)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 22, 50, 38, 47, 19, 28)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 23, 52, 39, 48, 19, 28)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 24, 53, 40, 50, 19, 29)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 25, 55, 41, 51, 19, 29)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 26, 56, 42, 52, 19, 29)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 27, 58, 43, 54, 19, 30)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 28, 59, 44, 55, 20, 30)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 29, 61, 45, 57, 20, 31)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 30, 63, 46, 58, 20, 31)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 31, 64, 47, 59, 20, 31)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 32, 66, 48, 61, 20, 32)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 33, 67, 49, 62, 20, 32)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 34, 69, 50, 64, 21, 33)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 35, 71, 51, 65, 21, 33)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 36, 73, 52, 67, 21, 34)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 37, 74, 53, 69, 21, 34)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 38, 76, 54, 70, 21, 34)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 39, 78, 55, 72, 22, 35)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 40, 80, 56, 73, 22, 35)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 41, 81, 58, 75, 22, 36)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 42, 83, 59, 77, 22, 36)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 43, 85, 60, 78, 22, 37)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 44, 87, 61, 80, 22, 37)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 45, 89, 62, 82, 23, 38)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 46, 91, 63, 84, 23, 38)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 47, 93, 65, 85, 23, 39)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 48, 95, 66, 87, 23, 39)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 49, 97, 67, 89, 24, 40)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 50, 99, 68, 91, 24, 40)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 51, 101, 70, 93, 24, 41)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 52, 103, 71, 95, 24, 41)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 53, 105, 72, 97, 24, 42)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 54, 107, 74, 99, 25, 43)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 55, 110, 75, 101, 25, 43)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 56, 112, 76, 103, 25, 44)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 57, 114, 78, 105, 25, 44)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 58, 116, 79, 107, 26, 45)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 59, 119, 81, 109, 26, 45)
    ,(@RACE_TROLL, @CLASS_WARRIOR, 60, 121, 82, 111, 26, 46)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_HUNTER, 1, 21, 25, 22, 16, 22)
    ,(@RACE_TROLL, @CLASS_HUNTER, 2, 21, 26, 23, 17, 23)
    ,(@RACE_TROLL, @CLASS_HUNTER, 3, 22, 27, 24, 17, 23)
    ,(@RACE_TROLL, @CLASS_HUNTER, 4, 22, 29, 24, 18, 24)
    ,(@RACE_TROLL, @CLASS_HUNTER, 5, 23, 30, 25, 18, 24)
    ,(@RACE_TROLL, @CLASS_HUNTER, 6, 23, 31, 26, 19, 25)
    ,(@RACE_TROLL, @CLASS_HUNTER, 7, 23, 32, 27, 19, 25)
    ,(@RACE_TROLL, @CLASS_HUNTER, 8, 24, 33, 28, 20, 26)
    ,(@RACE_TROLL, @CLASS_HUNTER, 9, 24, 35, 29, 20, 27)
    ,(@RACE_TROLL, @CLASS_HUNTER, 10, 25, 36, 29, 21, 27)
    ,(@RACE_TROLL, @CLASS_HUNTER, 11, 25, 37, 30, 21, 28)
    ,(@RACE_TROLL, @CLASS_HUNTER, 12, 26, 39, 31, 22, 29)
    ,(@RACE_TROLL, @CLASS_HUNTER, 13, 26, 40, 32, 23, 29)
    ,(@RACE_TROLL, @CLASS_HUNTER, 14, 27, 41, 33, 23, 30)
    ,(@RACE_TROLL, @CLASS_HUNTER, 15, 27, 43, 34, 24, 30)
    ,(@RACE_TROLL, @CLASS_HUNTER, 16, 28, 44, 35, 24, 31)
    ,(@RACE_TROLL, @CLASS_HUNTER, 17, 28, 45, 36, 25, 32)
    ,(@RACE_TROLL, @CLASS_HUNTER, 18, 29, 47, 37, 26, 33)
    ,(@RACE_TROLL, @CLASS_HUNTER, 19, 29, 48, 38, 26, 33)
    ,(@RACE_TROLL, @CLASS_HUNTER, 20, 30, 50, 39, 27, 34)
    ,(@RACE_TROLL, @CLASS_HUNTER, 21, 30, 51, 40, 28, 35)
    ,(@RACE_TROLL, @CLASS_HUNTER, 22, 31, 53, 41, 28, 35)
    ,(@RACE_TROLL, @CLASS_HUNTER, 23, 31, 54, 42, 29, 36)
    ,(@RACE_TROLL, @CLASS_HUNTER, 24, 32, 56, 43, 30, 37)
    ,(@RACE_TROLL, @CLASS_HUNTER, 25, 32, 57, 44, 30, 38)
    ,(@RACE_TROLL, @CLASS_HUNTER, 26, 33, 59, 45, 31, 38)
    ,(@RACE_TROLL, @CLASS_HUNTER, 27, 33, 61, 46, 32, 39)
    ,(@RACE_TROLL, @CLASS_HUNTER, 28, 34, 62, 47, 32, 40)
    ,(@RACE_TROLL, @CLASS_HUNTER, 29, 34, 64, 48, 33, 41)
    ,(@RACE_TROLL, @CLASS_HUNTER, 30, 35, 66, 49, 34, 41)
    ,(@RACE_TROLL, @CLASS_HUNTER, 31, 35, 67, 51, 35, 42)
    ,(@RACE_TROLL, @CLASS_HUNTER, 32, 36, 69, 52, 35, 43)
    ,(@RACE_TROLL, @CLASS_HUNTER, 33, 37, 71, 53, 36, 44)
    ,(@RACE_TROLL, @CLASS_HUNTER, 34, 37, 72, 54, 37, 45)
    ,(@RACE_TROLL, @CLASS_HUNTER, 35, 38, 74, 55, 38, 46)
    ,(@RACE_TROLL, @CLASS_HUNTER, 36, 39, 76, 57, 39, 47)
    ,(@RACE_TROLL, @CLASS_HUNTER, 37, 39, 78, 58, 39, 47)
    ,(@RACE_TROLL, @CLASS_HUNTER, 38, 40, 80, 59, 40, 48)
    ,(@RACE_TROLL, @CLASS_HUNTER, 39, 40, 82, 60, 41, 49)
    ,(@RACE_TROLL, @CLASS_HUNTER, 40, 41, 83, 62, 42, 50)
    ,(@RACE_TROLL, @CLASS_HUNTER, 41, 42, 85, 63, 43, 51)
    ,(@RACE_TROLL, @CLASS_HUNTER, 42, 42, 87, 64, 43, 52)
    ,(@RACE_TROLL, @CLASS_HUNTER, 43, 43, 89, 65, 44, 53)
    ,(@RACE_TROLL, @CLASS_HUNTER, 44, 44, 91, 67, 45, 54)
    ,(@RACE_TROLL, @CLASS_HUNTER, 45, 44, 93, 68, 46, 55)
    ,(@RACE_TROLL, @CLASS_HUNTER, 46, 45, 95, 70, 47, 56)
    ,(@RACE_TROLL, @CLASS_HUNTER, 47, 46, 97, 71, 48, 57)
    ,(@RACE_TROLL, @CLASS_HUNTER, 48, 47, 100, 72, 49, 58)
    ,(@RACE_TROLL, @CLASS_HUNTER, 49, 47, 102, 74, 50, 59)
    ,(@RACE_TROLL, @CLASS_HUNTER, 50, 48, 104, 75, 51, 60)
    ,(@RACE_TROLL, @CLASS_HUNTER, 51, 49, 106, 77, 52, 61)
    ,(@RACE_TROLL, @CLASS_HUNTER, 52, 50, 108, 78, 53, 62)
    ,(@RACE_TROLL, @CLASS_HUNTER, 53, 50, 110, 80, 54, 63)
    ,(@RACE_TROLL, @CLASS_HUNTER, 54, 51, 113, 81, 55, 64)
    ,(@RACE_TROLL, @CLASS_HUNTER, 55, 52, 115, 83, 56, 65)
    ,(@RACE_TROLL, @CLASS_HUNTER, 56, 53, 117, 84, 57, 66)
    ,(@RACE_TROLL, @CLASS_HUNTER, 57, 54, 120, 86, 58, 68)
    ,(@RACE_TROLL, @CLASS_HUNTER, 58, 54, 122, 88, 59, 69)
    ,(@RACE_TROLL, @CLASS_HUNTER, 59, 55, 125, 89, 60, 70)
    ,(@RACE_TROLL, @CLASS_HUNTER, 60, 56, 127, 91, 61, 71)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_ROGUE, 1, 22, 25, 22, 16, 21)
    ,(@RACE_TROLL, @CLASS_ROGUE, 2, 23, 26, 23, 16, 21)
    ,(@RACE_TROLL, @CLASS_ROGUE, 3, 23, 27, 23, 16, 22)
    ,(@RACE_TROLL, @CLASS_ROGUE, 4, 24, 29, 24, 17, 22)
    ,(@RACE_TROLL, @CLASS_ROGUE, 5, 25, 30, 25, 17, 22)
    ,(@RACE_TROLL, @CLASS_ROGUE, 6, 25, 31, 25, 17, 23)
    ,(@RACE_TROLL, @CLASS_ROGUE, 7, 26, 33, 26, 17, 23)
    ,(@RACE_TROLL, @CLASS_ROGUE, 8, 27, 34, 26, 17, 23)
    ,(@RACE_TROLL, @CLASS_ROGUE, 9, 28, 35, 27, 17, 24)
    ,(@RACE_TROLL, @CLASS_ROGUE, 10, 28, 37, 28, 18, 24)
    ,(@RACE_TROLL, @CLASS_ROGUE, 11, 29, 38, 29, 18, 25)
    ,(@RACE_TROLL, @CLASS_ROGUE, 12, 30, 39, 29, 18, 25)
    ,(@RACE_TROLL, @CLASS_ROGUE, 13, 31, 41, 30, 18, 25)
    ,(@RACE_TROLL, @CLASS_ROGUE, 14, 31, 42, 31, 18, 26)
    ,(@RACE_TROLL, @CLASS_ROGUE, 15, 32, 44, 31, 19, 26)
    ,(@RACE_TROLL, @CLASS_ROGUE, 16, 33, 45, 32, 19, 27)
    ,(@RACE_TROLL, @CLASS_ROGUE, 17, 34, 46, 33, 19, 27)
    ,(@RACE_TROLL, @CLASS_ROGUE, 18, 35, 48, 34, 19, 27)
    ,(@RACE_TROLL, @CLASS_ROGUE, 19, 36, 50, 34, 19, 28)
    ,(@RACE_TROLL, @CLASS_ROGUE, 20, 36, 51, 35, 20, 28)
    ,(@RACE_TROLL, @CLASS_ROGUE, 21, 37, 53, 36, 20, 29)
    ,(@RACE_TROLL, @CLASS_ROGUE, 22, 38, 54, 37, 20, 29)
    ,(@RACE_TROLL, @CLASS_ROGUE, 23, 39, 56, 38, 20, 30)
    ,(@RACE_TROLL, @CLASS_ROGUE, 24, 40, 57, 38, 21, 30)
    ,(@RACE_TROLL, @CLASS_ROGUE, 25, 41, 59, 39, 21, 31)
    ,(@RACE_TROLL, @CLASS_ROGUE, 26, 42, 61, 40, 21, 31)
    ,(@RACE_TROLL, @CLASS_ROGUE, 27, 43, 62, 41, 21, 31)
    ,(@RACE_TROLL, @CLASS_ROGUE, 28, 44, 64, 42, 21, 32)
    ,(@RACE_TROLL, @CLASS_ROGUE, 29, 44, 66, 43, 22, 32)
    ,(@RACE_TROLL, @CLASS_ROGUE, 30, 45, 68, 43, 22, 33)
    ,(@RACE_TROLL, @CLASS_ROGUE, 31, 46, 69, 44, 22, 33)
    ,(@RACE_TROLL, @CLASS_ROGUE, 32, 47, 71, 45, 22, 34)
    ,(@RACE_TROLL, @CLASS_ROGUE, 33, 48, 73, 46, 23, 34)
    ,(@RACE_TROLL, @CLASS_ROGUE, 34, 49, 75, 47, 23, 35)
    ,(@RACE_TROLL, @CLASS_ROGUE, 35, 50, 77, 48, 23, 35)
    ,(@RACE_TROLL, @CLASS_ROGUE, 36, 52, 79, 49, 24, 36)
    ,(@RACE_TROLL, @CLASS_ROGUE, 37, 53, 80, 50, 24, 37)
    ,(@RACE_TROLL, @CLASS_ROGUE, 38, 54, 82, 51, 24, 37)
    ,(@RACE_TROLL, @CLASS_ROGUE, 39, 55, 84, 52, 24, 38)
    ,(@RACE_TROLL, @CLASS_ROGUE, 40, 56, 86, 53, 25, 38)
    ,(@RACE_TROLL, @CLASS_ROGUE, 41, 57, 88, 54, 25, 39)
    ,(@RACE_TROLL, @CLASS_ROGUE, 42, 58, 90, 55, 25, 39)
    ,(@RACE_TROLL, @CLASS_ROGUE, 43, 59, 92, 56, 25, 40)
    ,(@RACE_TROLL, @CLASS_ROGUE, 44, 60, 95, 57, 26, 40)
    ,(@RACE_TROLL, @CLASS_ROGUE, 45, 62, 97, 58, 26, 41)
    ,(@RACE_TROLL, @CLASS_ROGUE, 46, 63, 99, 59, 26, 42)
    ,(@RACE_TROLL, @CLASS_ROGUE, 47, 64, 101, 60, 27, 42)
    ,(@RACE_TROLL, @CLASS_ROGUE, 48, 65, 103, 61, 27, 43)
    ,(@RACE_TROLL, @CLASS_ROGUE, 49, 66, 105, 63, 27, 44)
    ,(@RACE_TROLL, @CLASS_ROGUE, 50, 68, 108, 64, 28, 44)
    ,(@RACE_TROLL, @CLASS_ROGUE, 51, 69, 110, 65, 28, 45)
    ,(@RACE_TROLL, @CLASS_ROGUE, 52, 70, 112, 66, 28, 45)
    ,(@RACE_TROLL, @CLASS_ROGUE, 53, 71, 115, 67, 29, 46)
    ,(@RACE_TROLL, @CLASS_ROGUE, 54, 73, 117, 68, 29, 47)
    ,(@RACE_TROLL, @CLASS_ROGUE, 55, 74, 119, 70, 29, 47)
    ,(@RACE_TROLL, @CLASS_ROGUE, 56, 75, 122, 71, 30, 48)
    ,(@RACE_TROLL, @CLASS_ROGUE, 57, 77, 124, 72, 30, 49)
    ,(@RACE_TROLL, @CLASS_ROGUE, 58, 78, 127, 73, 30, 50)
    ,(@RACE_TROLL, @CLASS_ROGUE, 59, 80, 129, 75, 31, 50)
    ,(@RACE_TROLL, @CLASS_ROGUE, 60, 81, 132, 76, 31, 51)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_PRIEST, 1, 21, 22, 21, 18, 24)
    ,(@RACE_TROLL, @CLASS_PRIEST, 2, 21, 22, 21, 19, 25)
    ,(@RACE_TROLL, @CLASS_PRIEST, 3, 21, 22, 22, 20, 26)
    ,(@RACE_TROLL, @CLASS_PRIEST, 4, 22, 23, 22, 21, 28)
    ,(@RACE_TROLL, @CLASS_PRIEST, 5, 22, 23, 22, 23, 29)
    ,(@RACE_TROLL, @CLASS_PRIEST, 6, 22, 23, 23, 24, 30)
    ,(@RACE_TROLL, @CLASS_PRIEST, 7, 22, 23, 23, 25, 31)
    ,(@RACE_TROLL, @CLASS_PRIEST, 8, 22, 24, 23, 26, 32)
    ,(@RACE_TROLL, @CLASS_PRIEST, 9, 22, 24, 24, 27, 34)
    ,(@RACE_TROLL, @CLASS_PRIEST, 10, 23, 24, 24, 29, 35)
    ,(@RACE_TROLL, @CLASS_PRIEST, 11, 23, 24, 25, 30, 36)
    ,(@RACE_TROLL, @CLASS_PRIEST, 12, 23, 25, 25, 31, 38)
    ,(@RACE_TROLL, @CLASS_PRIEST, 13, 23, 25, 25, 32, 39)
    ,(@RACE_TROLL, @CLASS_PRIEST, 14, 23, 25, 26, 34, 40)
    ,(@RACE_TROLL, @CLASS_PRIEST, 15, 24, 25, 26, 35, 42)
    ,(@RACE_TROLL, @CLASS_PRIEST, 16, 24, 26, 27, 36, 43)
    ,(@RACE_TROLL, @CLASS_PRIEST, 17, 24, 26, 27, 38, 44)
    ,(@RACE_TROLL, @CLASS_PRIEST, 18, 24, 26, 27, 39, 46)
    ,(@RACE_TROLL, @CLASS_PRIEST, 19, 24, 27, 28, 40, 47)
    ,(@RACE_TROLL, @CLASS_PRIEST, 20, 25, 27, 28, 42, 49)
    ,(@RACE_TROLL, @CLASS_PRIEST, 21, 25, 27, 29, 43, 50)
    ,(@RACE_TROLL, @CLASS_PRIEST, 22, 25, 27, 29, 45, 52)
    ,(@RACE_TROLL, @CLASS_PRIEST, 23, 25, 28, 30, 46, 53)
    ,(@RACE_TROLL, @CLASS_PRIEST, 24, 26, 28, 30, 48, 55)
    ,(@RACE_TROLL, @CLASS_PRIEST, 25, 26, 28, 31, 49, 56)
    ,(@RACE_TROLL, @CLASS_PRIEST, 26, 26, 29, 31, 51, 58)
    ,(@RACE_TROLL, @CLASS_PRIEST, 27, 26, 29, 31, 52, 60)
    ,(@RACE_TROLL, @CLASS_PRIEST, 28, 26, 29, 32, 54, 61)
    ,(@RACE_TROLL, @CLASS_PRIEST, 29, 27, 30, 32, 55, 63)
    ,(@RACE_TROLL, @CLASS_PRIEST, 30, 27, 30, 33, 57, 65)
    ,(@RACE_TROLL, @CLASS_PRIEST, 31, 27, 30, 33, 59, 66)
    ,(@RACE_TROLL, @CLASS_PRIEST, 32, 27, 31, 34, 60, 68)
    ,(@RACE_TROLL, @CLASS_PRIEST, 33, 28, 31, 34, 62, 70)
    ,(@RACE_TROLL, @CLASS_PRIEST, 34, 28, 31, 35, 64, 71)
    ,(@RACE_TROLL, @CLASS_PRIEST, 35, 28, 32, 35, 65, 73)
    ,(@RACE_TROLL, @CLASS_PRIEST, 36, 29, 32, 36, 67, 75)
    ,(@RACE_TROLL, @CLASS_PRIEST, 37, 29, 32, 37, 69, 77)
    ,(@RACE_TROLL, @CLASS_PRIEST, 38, 29, 33, 37, 71, 79)
    ,(@RACE_TROLL, @CLASS_PRIEST, 39, 29, 33, 38, 72, 81)
    ,(@RACE_TROLL, @CLASS_PRIEST, 40, 30, 33, 38, 74, 82)
    ,(@RACE_TROLL, @CLASS_PRIEST, 41, 30, 34, 39, 76, 84)
    ,(@RACE_TROLL, @CLASS_PRIEST, 42, 30, 34, 39, 78, 86)
    ,(@RACE_TROLL, @CLASS_PRIEST, 43, 30, 35, 40, 80, 88)
    ,(@RACE_TROLL, @CLASS_PRIEST, 44, 31, 35, 40, 82, 90)
    ,(@RACE_TROLL, @CLASS_PRIEST, 45, 31, 35, 41, 84, 92)
    ,(@RACE_TROLL, @CLASS_PRIEST, 46, 31, 36, 42, 86, 94)
    ,(@RACE_TROLL, @CLASS_PRIEST, 47, 32, 36, 42, 88, 96)
    ,(@RACE_TROLL, @CLASS_PRIEST, 48, 32, 37, 43, 90, 99)
    ,(@RACE_TROLL, @CLASS_PRIEST, 49, 32, 37, 44, 92, 101)
    ,(@RACE_TROLL, @CLASS_PRIEST, 50, 33, 37, 44, 94, 103)
    ,(@RACE_TROLL, @CLASS_PRIEST, 51, 33, 38, 45, 96, 105)
    ,(@RACE_TROLL, @CLASS_PRIEST, 52, 33, 38, 45, 98, 107)
    ,(@RACE_TROLL, @CLASS_PRIEST, 53, 34, 39, 46, 100, 109)
    ,(@RACE_TROLL, @CLASS_PRIEST, 54, 34, 39, 47, 102, 112)
    ,(@RACE_TROLL, @CLASS_PRIEST, 55, 34, 40, 47, 105, 114)
    ,(@RACE_TROLL, @CLASS_PRIEST, 56, 35, 40, 48, 107, 116)
    ,(@RACE_TROLL, @CLASS_PRIEST, 57, 35, 41, 49, 109, 119)
    ,(@RACE_TROLL, @CLASS_PRIEST, 58, 35, 41, 50, 111, 121)
    ,(@RACE_TROLL, @CLASS_PRIEST, 59, 36, 42, 50, 114, 124)
    ,(@RACE_TROLL, @CLASS_PRIEST, 60, 36, 42, 51, 116, 126)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_SHAMAN, 1, 22, 22, 22, 17, 23)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 2, 23, 22, 23, 18, 24)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 3, 23, 23, 24, 19, 25)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 4, 24, 23, 25, 19, 26)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 5, 25, 24, 25, 20, 27)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 6, 26, 24, 26, 21, 28)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 7, 27, 24, 27, 22, 29)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 8, 27, 25, 28, 23, 29)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 9, 28, 25, 29, 24, 30)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 10, 29, 26, 30, 24, 31)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 11, 30, 26, 31, 25, 32)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 12, 31, 27, 32, 26, 33)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 13, 31, 27, 33, 27, 34)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 14, 32, 28, 34, 28, 35)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 15, 33, 28, 35, 29, 37)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 16, 34, 29, 36, 30, 38)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 17, 35, 29, 37, 31, 39)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 18, 36, 30, 38, 32, 40)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 19, 37, 30, 39, 33, 41)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 20, 38, 31, 40, 34, 42)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 21, 39, 31, 41, 35, 43)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 22, 39, 32, 42, 36, 44)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 23, 40, 32, 43, 37, 45)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 24, 41, 33, 44, 38, 47)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 25, 42, 33, 46, 39, 48)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 26, 43, 34, 47, 40, 49)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 27, 44, 34, 48, 41, 50)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 28, 45, 35, 49, 42, 51)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 29, 46, 35, 50, 43, 53)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 30, 47, 36, 51, 44, 54)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 31, 49, 36, 53, 46, 55)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 32, 50, 37, 54, 47, 57)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 33, 51, 38, 55, 48, 58)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 34, 52, 38, 56, 49, 59)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 35, 53, 39, 58, 50, 61)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 36, 54, 40, 59, 52, 62)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 37, 55, 40, 60, 53, 63)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 38, 56, 41, 62, 54, 65)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 39, 57, 41, 63, 55, 66)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 40, 59, 42, 64, 57, 68)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 41, 60, 43, 66, 58, 69)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 42, 61, 43, 67, 59, 71)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 43, 62, 44, 69, 60, 72)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 44, 64, 45, 70, 62, 74)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 45, 65, 45, 72, 63, 75)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 46, 66, 46, 73, 65, 77)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 47, 67, 47, 75, 66, 78)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 48, 69, 48, 76, 67, 80)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 49, 70, 48, 78, 69, 82)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 50, 71, 49, 79, 70, 83)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 51, 73, 50, 81, 72, 85)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 52, 74, 51, 82, 73, 87)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 53, 76, 51, 84, 75, 88)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 54, 77, 52, 86, 76, 90)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 55, 78, 53, 87, 78, 92)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 56, 80, 54, 89, 79, 94)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 57, 81, 55, 91, 81, 95)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 58, 83, 55, 92, 83, 97)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 59, 84, 56, 94, 84, 99)
    ,(@RACE_TROLL, @CLASS_SHAMAN, 60, 86, 57, 96, 86, 101)
;

INSERT INTO `player_levelstats`
    (`race`, `class`, `level`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
     (@RACE_TROLL, @CLASS_MAGE, 1, 21, 22, 21, 19, 23)
    ,(@RACE_TROLL, @CLASS_MAGE, 2, 21, 22, 21, 20, 24)
    ,(@RACE_TROLL, @CLASS_MAGE, 3, 21, 22, 22, 21, 25)
    ,(@RACE_TROLL, @CLASS_MAGE, 4, 21, 23, 22, 23, 26)
    ,(@RACE_TROLL, @CLASS_MAGE, 5, 21, 23, 22, 24, 28)
    ,(@RACE_TROLL, @CLASS_MAGE, 6, 22, 23, 22, 25, 29)
    ,(@RACE_TROLL, @CLASS_MAGE, 7, 22, 23, 23, 26, 30)
    ,(@RACE_TROLL, @CLASS_MAGE, 8, 22, 23, 23, 27, 31)
    ,(@RACE_TROLL, @CLASS_MAGE, 9, 22, 23, 23, 29, 32)
    ,(@RACE_TROLL, @CLASS_MAGE, 10, 22, 24, 24, 30, 34)
    ,(@RACE_TROLL, @CLASS_MAGE, 11, 22, 24, 24, 31, 35)
    ,(@RACE_TROLL, @CLASS_MAGE, 12, 22, 24, 24, 33, 36)
    ,(@RACE_TROLL, @CLASS_MAGE, 13, 22, 24, 25, 34, 37)
    ,(@RACE_TROLL, @CLASS_MAGE, 14, 23, 24, 25, 35, 39)
    ,(@RACE_TROLL, @CLASS_MAGE, 15, 23, 25, 25, 37, 40)
    ,(@RACE_TROLL, @CLASS_MAGE, 16, 23, 25, 26, 38, 41)
    ,(@RACE_TROLL, @CLASS_MAGE, 17, 23, 25, 26, 39, 43)
    ,(@RACE_TROLL, @CLASS_MAGE, 18, 23, 25, 26, 41, 44)
    ,(@RACE_TROLL, @CLASS_MAGE, 19, 23, 25, 27, 42, 45)
    ,(@RACE_TROLL, @CLASS_MAGE, 20, 23, 26, 27, 44, 47)
    ,(@RACE_TROLL, @CLASS_MAGE, 21, 24, 26, 27, 45, 48)
    ,(@RACE_TROLL, @CLASS_MAGE, 22, 24, 26, 28, 47, 50)
    ,(@RACE_TROLL, @CLASS_MAGE, 23, 24, 26, 28, 48, 51)
    ,(@RACE_TROLL, @CLASS_MAGE, 24, 24, 27, 29, 50, 53)
    ,(@RACE_TROLL, @CLASS_MAGE, 25, 24, 27, 29, 51, 54)
    ,(@RACE_TROLL, @CLASS_MAGE, 26, 24, 27, 29, 53, 56)
    ,(@RACE_TROLL, @CLASS_MAGE, 27, 24, 27, 30, 55, 57)
    ,(@RACE_TROLL, @CLASS_MAGE, 28, 25, 27, 30, 56, 59)
    ,(@RACE_TROLL, @CLASS_MAGE, 29, 25, 28, 31, 58, 60)
    ,(@RACE_TROLL, @CLASS_MAGE, 30, 25, 28, 31, 60, 62)
    ,(@RACE_TROLL, @CLASS_MAGE, 31, 25, 28, 31, 61, 64)
    ,(@RACE_TROLL, @CLASS_MAGE, 32, 25, 28, 32, 63, 65)
    ,(@RACE_TROLL, @CLASS_MAGE, 33, 25, 29, 32, 65, 67)
    ,(@RACE_TROLL, @CLASS_MAGE, 34, 26, 29, 33, 66, 69)
    ,(@RACE_TROLL, @CLASS_MAGE, 35, 26, 29, 33, 68, 70)
    ,(@RACE_TROLL, @CLASS_MAGE, 36, 26, 30, 34, 70, 72)
    ,(@RACE_TROLL, @CLASS_MAGE, 37, 26, 30, 34, 72, 74)
    ,(@RACE_TROLL, @CLASS_MAGE, 38, 26, 30, 34, 74, 76)
    ,(@RACE_TROLL, @CLASS_MAGE, 39, 27, 30, 35, 76, 77)
    ,(@RACE_TROLL, @CLASS_MAGE, 40, 27, 31, 35, 77, 79)
    ,(@RACE_TROLL, @CLASS_MAGE, 41, 27, 31, 36, 79, 81)
    ,(@RACE_TROLL, @CLASS_MAGE, 42, 27, 31, 36, 81, 83)
    ,(@RACE_TROLL, @CLASS_MAGE, 43, 27, 31, 37, 83, 85)
    ,(@RACE_TROLL, @CLASS_MAGE, 44, 27, 32, 37, 85, 87)
    ,(@RACE_TROLL, @CLASS_MAGE, 45, 28, 32, 38, 87, 89)
    ,(@RACE_TROLL, @CLASS_MAGE, 46, 28, 32, 38, 89, 91)
    ,(@RACE_TROLL, @CLASS_MAGE, 47, 28, 33, 39, 91, 93)
    ,(@RACE_TROLL, @CLASS_MAGE, 48, 28, 33, 39, 94, 95)
    ,(@RACE_TROLL, @CLASS_MAGE, 49, 29, 33, 40, 96, 97)
    ,(@RACE_TROLL, @CLASS_MAGE, 50, 29, 34, 40, 98, 99)
    ,(@RACE_TROLL, @CLASS_MAGE, 51, 29, 34, 41, 100, 101)
    ,(@RACE_TROLL, @CLASS_MAGE, 52, 29, 34, 41, 102, 103)
    ,(@RACE_TROLL, @CLASS_MAGE, 53, 29, 35, 42, 104, 105)
    ,(@RACE_TROLL, @CLASS_MAGE, 54, 30, 35, 43, 107, 107)
    ,(@RACE_TROLL, @CLASS_MAGE, 55, 30, 35, 43, 109, 110)
    ,(@RACE_TROLL, @CLASS_MAGE, 56, 30, 36, 44, 111, 112)
    ,(@RACE_TROLL, @CLASS_MAGE, 57, 30, 36, 44, 114, 114)
    ,(@RACE_TROLL, @CLASS_MAGE, 58, 31, 36, 45, 116, 116)
    ,(@RACE_TROLL, @CLASS_MAGE, 59, 31, 37, 45, 119, 119)
    ,(@RACE_TROLL, @CLASS_MAGE, 60, 31, 37, 46, 121, 121)
;

-- Insert information for player character experience gain -------------------
INSERT INTO `player_xp_for_level`
    (`lvl`, `xp_for_next_level`)
VALUES
     (1, 400)
    ,(2, 900)
    ,(3, 1400)
    ,(4, 2100)
    ,(5, 2800)
    ,(6, 3600)
    ,(7, 4500)
    ,(8, 5400)
    ,(9, 6500)
    ,(10, 7600)
    ,(11, 8800)
    ,(12, 10100)
    ,(13, 11400)
    ,(14, 12900)
    ,(15, 14400)
    ,(16, 16000)
    ,(17, 17700)
    ,(18, 19400)
    ,(19, 21300)
    ,(20, 23200)
    ,(21, 25200)
    ,(22, 27300)
    ,(23, 29400)
    ,(24, 31700)
    ,(25, 34000)
    ,(26, 36400)
    ,(27, 38900)
    ,(28, 41400)
    ,(29, 44300)
    ,(30, 47400)
    ,(31, 50800)
    ,(32, 54500)
    ,(33, 58600)
    ,(34, 62800)
    ,(35, 67100)
    ,(36, 71600)
    ,(37, 76100)
    ,(38, 80800)
    ,(39, 85700)
    ,(40, 90700)
    ,(41, 95800)
    ,(42, 101000)
    ,(43, 106300)
    ,(44, 111800)
    ,(45, 117500)
    ,(46, 123200)
    ,(47, 129100)
    ,(48, 135100)
    ,(49, 141200)
    ,(50, 147500)
    ,(51, 153900)
    ,(52, 160400)
    ,(53, 167100)
    ,(54, 173900)
    ,(55, 180800)
    ,(56, 187900)
    ,(57, 195000)
    ,(58, 202300)
    ,(59, 209800)
;

-- Insert pet name generation templates --------------------------------------
INSERT INTO `pet_name_generation`
    (`id`, `word`, `entry`, `half`)
VALUES
     (1,'Aba',@PLAYER_PET_IMP,0)
    ,(2,'Az',@PLAYER_PET_IMP,0)
    ,(3,'Bel',@PLAYER_PET_IMP,0)
    ,(4,'Biz',@PLAYER_PET_IMP,0)
    ,(5,'Cho',@PLAYER_PET_IMP,0)
    ,(6,'Dag',@PLAYER_PET_IMP,0)
    ,(7,'Gak',@PLAYER_PET_IMP,0)
    ,(8,'Gar',@PLAYER_PET_IMP,0)
    ,(9,'Gel',@PLAYER_PET_IMP,0)
    ,(10,'Gho',@PLAYER_PET_IMP,0)
    ,(11,'Gob',@PLAYER_PET_IMP,0)
    ,(12,'Gra',@PLAYER_PET_IMP,0)
    ,(13,'Jak',@PLAYER_PET_IMP,0)
    ,(14,'Jub',@PLAYER_PET_IMP,0)
    ,(15,'Kar',@PLAYER_PET_IMP,0)
    ,(16,'Kup',@PLAYER_PET_IMP,0)
    ,(17,'Laz',@PLAYER_PET_IMP,0)
    ,(18,'Nal',@PLAYER_PET_IMP,0)
    ,(19,'Nok',@PLAYER_PET_IMP,0)
    ,(20,'Pag',@PLAYER_PET_IMP,0)
    ,(21,'Pig',@PLAYER_PET_IMP,0)
    ,(22,'Pip',@PLAYER_PET_IMP,0)
    ,(23,'Piz',@PLAYER_PET_IMP,0)
    ,(24,'Quz',@PLAYER_PET_IMP,0)
    ,(25,'Rui',@PLAYER_PET_IMP,0)
    ,(26,'Rul',@PLAYER_PET_IMP,0)
    ,(27,'Rup',@PLAYER_PET_IMP,0)
    ,(28,'Tar',@PLAYER_PET_IMP,0)
    ,(29,'Vol',@PLAYER_PET_IMP,0)
    ,(30,'Yaz',@PLAYER_PET_IMP,0)
    ,(31,'Zep',@PLAYER_PET_IMP,0)
    ,(32,'Zig',@PLAYER_PET_IMP,0)
    ,(33,'Zil',@PLAYER_PET_IMP,0)
    ,(34,'Zor',@PLAYER_PET_IMP,0)
    ,(35,'bis',@PLAYER_PET_IMP,1)
    ,(36,'fip',@PLAYER_PET_IMP,1)
    ,(37,'gup',@PLAYER_PET_IMP,1)
    ,(38,'ham',@PLAYER_PET_IMP,1)
    ,(39,'jub',@PLAYER_PET_IMP,1)
    ,(40,'kin',@PLAYER_PET_IMP,1)
    ,(41,'kol',@PLAYER_PET_IMP,1)
    ,(42,'lop',@PLAYER_PET_IMP,1)
    ,(43,'loz',@PLAYER_PET_IMP,1)
    ,(44,'mat',@PLAYER_PET_IMP,1)
    ,(45,'mir',@PLAYER_PET_IMP,1)
    ,(46,'nam',@PLAYER_PET_IMP,1)
    ,(47,'nar',@PLAYER_PET_IMP,1)
    ,(48,'nik',@PLAYER_PET_IMP,1)
    ,(49,'nip',@PLAYER_PET_IMP,1)
    ,(50,'pad',@PLAYER_PET_IMP,1)
    ,(51,'pep',@PLAYER_PET_IMP,1)
    ,(52,'pit',@PLAYER_PET_IMP,1)
    ,(53,'qua',@PLAYER_PET_IMP,1)
    ,(54,'rai',@PLAYER_PET_IMP,1)
    ,(55,'rin',@PLAYER_PET_IMP,1)
    ,(56,'rot',@PLAYER_PET_IMP,1)
    ,(57,'tai',@PLAYER_PET_IMP,1)
    ,(58,'tal',@PLAYER_PET_IMP,1)
    ,(59,'tik',@PLAYER_PET_IMP,1)
    ,(60,'tip',@PLAYER_PET_IMP,1)
    ,(61,'tog',@PLAYER_PET_IMP,1)
    ,(62,'tuk',@PLAYER_PET_IMP,1)
    ,(63,'uri',@PLAYER_PET_IMP,1)
    ,(64,'yal',@PLAYER_PET_IMP,1)
    ,(65,'yap',@PLAYER_PET_IMP,1)
    ,(66,'Bhee',@PLAYER_PET_FELHUNTER,0)
    ,(67,'Bruu',@PLAYER_PET_FELHUNTER,0)
    ,(68,'Czaa',@PLAYER_PET_FELHUNTER,0)
    ,(69,'Droo',@PLAYER_PET_FELHUNTER,0)
    ,(70,'Flaa',@PLAYER_PET_FELHUNTER,0)
    ,(71,'Fzuu',@PLAYER_PET_FELHUNTER,0)
    ,(72,'Ghaa',@PLAYER_PET_FELHUNTER,0)
    ,(73,'Gree',@PLAYER_PET_FELHUNTER,0)
    ,(74,'Gzaa',@PLAYER_PET_FELHUNTER,0)
    ,(75,'Haa',@PLAYER_PET_FELHUNTER,0)
    ,(76,'Haad',@PLAYER_PET_FELHUNTER,0)
    ,(77,'Haag',@PLAYER_PET_FELHUNTER,0)
    ,(78,'Haap',@PLAYER_PET_FELHUNTER,0)
    ,(79,'Jhaa',@PLAYER_PET_FELHUNTER,0)
    ,(80,'Jhuu',@PLAYER_PET_FELHUNTER,0)
    ,(81,'Khaa',@PLAYER_PET_FELHUNTER,0)
    ,(82,'Khii',@PLAYER_PET_FELHUNTER,0)
    ,(83,'Khuu',@PLAYER_PET_FELHUNTER,0)
    ,(84,'Kree',@PLAYER_PET_FELHUNTER,0)
    ,(85,'Luu',@PLAYER_PET_FELHUNTER,0)
    ,(86,'Maa',@PLAYER_PET_FELHUNTER,0)
    ,(87,'Nhee',@PLAYER_PET_FELHUNTER,0)
    ,(88,'Phuu',@PLAYER_PET_FELHUNTER,0)
    ,(89,'Pryy',@PLAYER_PET_FELHUNTER,0)
    ,(90,'Rhuu',@PLAYER_PET_FELHUNTER,0)
    ,(91,'Shaa',@PLAYER_PET_FELHUNTER,0)
    ,(92,'Sloo',@PLAYER_PET_FELHUNTER,0)
    ,(93,'Sruu',@PLAYER_PET_FELHUNTER,0)
    ,(94,'Thoo',@PLAYER_PET_FELHUNTER,0)
    ,(95,'Traa',@PLAYER_PET_FELHUNTER,0)
    ,(96,'Wraa',@PLAYER_PET_FELHUNTER,0)
    ,(97,'Zhaa',@PLAYER_PET_FELHUNTER,0)
    ,(98,'dhon',@PLAYER_PET_FELHUNTER,1)
    ,(99,'dhum',@PLAYER_PET_FELHUNTER,1)
    ,(100,'dhun',@PLAYER_PET_FELHUNTER,1)
    ,(101,'dom',@PLAYER_PET_FELHUNTER,1)
    ,(102,'don',@PLAYER_PET_FELHUNTER,1)
    ,(103,'drom',@PLAYER_PET_FELHUNTER,1)
    ,(104,'dym',@PLAYER_PET_FELHUNTER,1)
    ,(105,'fenn',@PLAYER_PET_FELHUNTER,1)
    ,(106,'fum',@PLAYER_PET_FELHUNTER,1)
    ,(107,'fun',@PLAYER_PET_FELHUNTER,1)
    ,(108,'ghon',@PLAYER_PET_FELHUNTER,1)
    ,(109,'ghun',@PLAYER_PET_FELHUNTER,1)
    ,(110,'grom',@PLAYER_PET_FELHUNTER,1)
    ,(111,'grym',@PLAYER_PET_FELHUNTER,1)
    ,(112,'hom',@PLAYER_PET_FELHUNTER,1)
    ,(113,'hon',@PLAYER_PET_FELHUNTER,1)
    ,(114,'hun',@PLAYER_PET_FELHUNTER,1)
    ,(115,'jhom',@PLAYER_PET_FELHUNTER,1)
    ,(116,'kun',@PLAYER_PET_FELHUNTER,1)
    ,(117,'lum',@PLAYER_PET_FELHUNTER,1)
    ,(118,'mmon',@PLAYER_PET_FELHUNTER,1)
    ,(119,'mon',@PLAYER_PET_FELHUNTER,1)
    ,(120,'myn',@PLAYER_PET_FELHUNTER,1)
    ,(121,'nam',@PLAYER_PET_FELHUNTER,1)
    ,(122,'nem',@PLAYER_PET_FELHUNTER,1)
    ,(123,'nhym',@PLAYER_PET_FELHUNTER,1)
    ,(124,'nom',@PLAYER_PET_FELHUNTER,1)
    ,(125,'num',@PLAYER_PET_FELHUNTER,1)
    ,(126,'phom',@PLAYER_PET_FELHUNTER,1)
    ,(127,'roon',@PLAYER_PET_FELHUNTER,1)
    ,(128,'rym',@PLAYER_PET_FELHUNTER,1)
    ,(129,'shon',@PLAYER_PET_FELHUNTER,1)
    ,(130,'thun',@PLAYER_PET_FELHUNTER,1)
    ,(131,'tom',@PLAYER_PET_FELHUNTER,1)
    ,(132,'zhem',@PLAYER_PET_FELHUNTER,1)
    ,(133,'zhum',@PLAYER_PET_FELHUNTER,1)
    ,(134,'zun',@PLAYER_PET_FELHUNTER,1)
    ,(135,'Bar',@PLAYER_PET_VOIDWALKER,0)
    ,(136,'Bel',@PLAYER_PET_VOIDWALKER,0)
    ,(137,'Char',@PLAYER_PET_VOIDWALKER,0)
    ,(138,'Grak\'',@PLAYER_PET_VOIDWALKER,0)
    ,(139,'Graz\'',@PLAYER_PET_VOIDWALKER,0)
    ,(140,'Grim',@PLAYER_PET_VOIDWALKER,0)
    ,(141,'Hath',@PLAYER_PET_VOIDWALKER,0)
    ,(142,'Hel',@PLAYER_PET_VOIDWALKER,0)
    ,(143,'Hok',@PLAYER_PET_VOIDWALKER,0)
    ,(144,'Huk',@PLAYER_PET_VOIDWALKER,0)
    ,(145,'Jhaz',@PLAYER_PET_VOIDWALKER,0)
    ,(146,'Jhom',@PLAYER_PET_VOIDWALKER,0)
    ,(147,'Juk\'',@PLAYER_PET_VOIDWALKER,0)
    ,(148,'Kal\'',@PLAYER_PET_VOIDWALKER,0)
    ,(149,'Klath',@PLAYER_PET_VOIDWALKER,0)
    ,(150,'Kon',@PLAYER_PET_VOIDWALKER,0)
    ,(151,'Krag',@PLAYER_PET_VOIDWALKER,0)
    ,(152,'Krak',@PLAYER_PET_VOIDWALKER,0)
    ,(153,'Mak',@PLAYER_PET_VOIDWALKER,0)
    ,(154,'Mezz',@PLAYER_PET_VOIDWALKER,0)
    ,(155,'Orm',@PLAYER_PET_VOIDWALKER,0)
    ,(156,'Phan',@PLAYER_PET_VOIDWALKER,0)
    ,(157,'Sar',@PLAYER_PET_VOIDWALKER,0)
    ,(158,'Tang',@PLAYER_PET_VOIDWALKER,0)
    ,(159,'Than',@PLAYER_PET_VOIDWALKER,0)
    ,(160,'Thog',@PLAYER_PET_VOIDWALKER,0)
    ,(161,'Thok',@PLAYER_PET_VOIDWALKER,0)
    ,(162,'Thul',@PLAYER_PET_VOIDWALKER,0)
    ,(163,'Zag\'',@PLAYER_PET_VOIDWALKER,0)
    ,(164,'Zang',@PLAYER_PET_VOIDWALKER,0)
    ,(165,'Zhar\'',@PLAYER_PET_VOIDWALKER,0)
    ,(166,'kath',@PLAYER_PET_VOIDWALKER,1)
    ,(167,'doc',@PLAYER_PET_VOIDWALKER,1)
    ,(168,'dok',@PLAYER_PET_VOIDWALKER,1)
    ,(169,'gak',@PLAYER_PET_VOIDWALKER,1)
    ,(170,'garth',@PLAYER_PET_VOIDWALKER,1)
    ,(171,'gore',@PLAYER_PET_VOIDWALKER,1)
    ,(172,'gorg',@PLAYER_PET_VOIDWALKER,1)
    ,(173,'grave',@PLAYER_PET_VOIDWALKER,1)
    ,(174,'gron',@PLAYER_PET_VOIDWALKER,1)
    ,(175,'juk',@PLAYER_PET_VOIDWALKER,1)
    ,(176,'krast',@PLAYER_PET_VOIDWALKER,1)
    ,(177,'kresh',@PLAYER_PET_VOIDWALKER,1)
    ,(178,'krit',@PLAYER_PET_VOIDWALKER,1)
    ,(179,'los',@PLAYER_PET_VOIDWALKER,1)
    ,(180,'mon',@PLAYER_PET_VOIDWALKER,1)
    ,(181,'mos',@PLAYER_PET_VOIDWALKER,1)
    ,(182,'moth',@PLAYER_PET_VOIDWALKER,1)
    ,(183,'nagma',@PLAYER_PET_VOIDWALKER,1)
    ,(184,'nak',@PLAYER_PET_VOIDWALKER,1)
    ,(185,'nar',@PLAYER_PET_VOIDWALKER,1)
    ,(186,'nos',@PLAYER_PET_VOIDWALKER,1)
    ,(187,'nuz',@PLAYER_PET_VOIDWALKER,1)
    ,(188,'phog',@PLAYER_PET_VOIDWALKER,1)
    ,(189,'rath',@PLAYER_PET_VOIDWALKER,1)
    ,(190,'tast',@PLAYER_PET_VOIDWALKER,1)
    ,(191,'taz',@PLAYER_PET_VOIDWALKER,1)
    ,(192,'thak',@PLAYER_PET_VOIDWALKER,1)
    ,(193,'thang',@PLAYER_PET_VOIDWALKER,1)
    ,(194,'thyk',@PLAYER_PET_VOIDWALKER,1)
    ,(195,'vhug',@PLAYER_PET_VOIDWALKER,1)
    ,(196,'zazt',@PLAYER_PET_VOIDWALKER,1)
    ,(197,'Ael',@PLAYER_PET_SUCCUBUS,0)
    ,(198,'Aez',@PLAYER_PET_SUCCUBUS,0)
    ,(199,'Ang',@PLAYER_PET_SUCCUBUS,0)
    ,(200,'Ban',@PLAYER_PET_SUCCUBUS,0)
    ,(201,'Bet',@PLAYER_PET_SUCCUBUS,0)
    ,(202,'Bro',@PLAYER_PET_SUCCUBUS,0)
    ,(203,'Bry',@PLAYER_PET_SUCCUBUS,0)
    ,(204,'Cat',@PLAYER_PET_SUCCUBUS,0)
    ,(205,'Dir',@PLAYER_PET_SUCCUBUS,0)
    ,(206,'Dis',@PLAYER_PET_SUCCUBUS,0)
    ,(207,'Dom',@PLAYER_PET_SUCCUBUS,0)
    ,(208,'Drus',@PLAYER_PET_SUCCUBUS,0)
    ,(209,'Fie',@PLAYER_PET_SUCCUBUS,0)
    ,(210,'Fier',@PLAYER_PET_SUCCUBUS,0)
    ,(211,'Gly',@PLAYER_PET_SUCCUBUS,0)
    ,(212,'Hel',@PLAYER_PET_SUCCUBUS,0)
    ,(213,'Hes',@PLAYER_PET_SUCCUBUS,0)
    ,(214,'Kal',@PLAYER_PET_SUCCUBUS,0)
    ,(215,'Lyn',@PLAYER_PET_SUCCUBUS,0)
    ,(216,'Mir',@PLAYER_PET_SUCCUBUS,0)
    ,(217,'Nim',@PLAYER_PET_SUCCUBUS,0)
    ,(218,'Sar',@PLAYER_PET_SUCCUBUS,0)
    ,(219,'Sel',@PLAYER_PET_SUCCUBUS,0)
    ,(220,'Vil',@PLAYER_PET_SUCCUBUS,0)
    ,(221,'Zah',@PLAYER_PET_SUCCUBUS,0)
    ,(222,'aith',@PLAYER_PET_SUCCUBUS,1)
    ,(223,'anda',@PLAYER_PET_SUCCUBUS,1)
    ,(224,'antia',@PLAYER_PET_SUCCUBUS,1)
    ,(225,'evere',@PLAYER_PET_SUCCUBUS,1)
    ,(226,'lia',@PLAYER_PET_SUCCUBUS,1)
    ,(227,'lissa',@PLAYER_PET_SUCCUBUS,1)
    ,(228,'neri',@PLAYER_PET_SUCCUBUS,1)
    ,(229,'neth',@PLAYER_PET_SUCCUBUS,1)
    ,(230,'nia',@PLAYER_PET_SUCCUBUS,1)
    ,(231,'nlissa',@PLAYER_PET_SUCCUBUS,1)
    ,(232,'nora',@PLAYER_PET_SUCCUBUS,1)
    ,(233,'nva',@PLAYER_PET_SUCCUBUS,1)
    ,(234,'nys',@PLAYER_PET_SUCCUBUS,1)
    ,(235,'ola',@PLAYER_PET_SUCCUBUS,1)
    ,(236,'ona',@PLAYER_PET_SUCCUBUS,1)
    ,(237,'ora',@PLAYER_PET_SUCCUBUS,1)
    ,(238,'rah',@PLAYER_PET_SUCCUBUS,1)
    ,(239,'riana',@PLAYER_PET_SUCCUBUS,1)
    ,(240,'riel',@PLAYER_PET_SUCCUBUS,1)
    ,(241,'rona',@PLAYER_PET_SUCCUBUS,1)
    ,(242,'tai',@PLAYER_PET_SUCCUBUS,1)
    ,(243,'tevere',@PLAYER_PET_SUCCUBUS,1)
    ,(244,'thea',@PLAYER_PET_SUCCUBUS,1)
    ,(245,'vina',@PLAYER_PET_SUCCUBUS,1)
    ,(246,'wena',@PLAYER_PET_SUCCUBUS,1)
    ,(247,'wyn',@PLAYER_PET_SUCCUBUS,1)
    ,(248,'xia',@PLAYER_PET_SUCCUBUS,1)
    ,(249,'yla',@PLAYER_PET_SUCCUBUS,1)
    ,(250,'yssa',@PLAYER_PET_SUCCUBUS,1)
;

-- Insert base experience awarded for exploration ----------------------------
INSERT INTO `exploration_basexp`
    (`level`,   `basexp`)
VALUES
     (0,        0)
    ,(1,        5)
    ,(2,        15)
    ,(3,        25)
    ,(4,        35)
    ,(5,        45)
    ,(6,        55)
    ,(7,        65)
    ,(8,        70)
    ,(9,        80)
    ,(10,       85)
    ,(11,       90)
    ,(12,       90)
    ,(13,       90)
    ,(14,       100)
    ,(15,       105)
    ,(16,       115)
    ,(17,       125)
    ,(18,       135)
    ,(19,       145)
    ,(20,       155)
    ,(21,       165)
    ,(22,       175)
    ,(23,       185)
    ,(24,       195)
    ,(25,       200)
    ,(26,       210)
    ,(27,       220)
    ,(28,       230)
    ,(29,       240)
    ,(30,       245)
    ,(31,       250)
    ,(32,       255)
    ,(33,       265)
    ,(34,       270)
    ,(35,       275)
    ,(36,       280)
    ,(37,       285)
    ,(38,       285)
    ,(39,       300)
    ,(40,       315)
    ,(41,       330)
    ,(42,       345)
    ,(43,       360)
    ,(44,       375)
    ,(45,       390)
    ,(46,       405)
    ,(47,       420)
    ,(48,       440)
    ,(49,       455)
    ,(50,       470)
    ,(51,       490)
    ,(52,       510)
    ,(53,       530)
    ,(54,       540)
    ,(55,       560)
    ,(56,       580)
    ,(57,       600)
    ,(58,       620)
    ,(59,       640)
    ,(60,       660)
;

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

-- Insert graveyard data for each zone ---------------------------------------
INSERT INTO `game_graveyard_zone`
    (`id`, `ghost_zone`, `faction`)
VALUES
     (3,     @ZONE_DUSKWOOD,                     @FACTION_ALLIANCE)
    ,(4,     @ZONE_WESTFALL,                     @FACTION_ANY)
    ,(4,     @ZONE_THE_DEADMINES,                @FACTION_ANY)
    ,(6,     @ZONE_LOCH_MODAN,                   @FACTION_ALLIANCE)
    ,(7,     @ZONE_DUN_MOROGH,                   @FACTION_HORDE)
    ,(7,     @ZONE_WETLANDS,                     @FACTION_ANY)
    ,(7,     @ZONE_LOCH_MODAN,                   @FACTION_HORDE)
    ,(8,     @ZONE_BADLANDS,                     @FACTION_ANY)
    ,(8,     @ZONE_LOCH_MODAN,                   @FACTION_HORDE)
    ,(8,     @ZONE_ULDAMAN,                      @FACTION_ANY)
    ,(10,    @ZONE_THE_BARRENS,                  @FACTION_HORDE)
    ,(10,    @ZONE_WAILING_CAVERNS,              @FACTION_ANY)
    ,(31,    @ZONE_DESOLACE,                     @FACTION_ANY)
    ,(31,    @ZONE_MARAUDON,                     @FACTION_ANY)
    ,(32,    @ZONE_DUROTAR,                      @FACTION_ANY)
    ,(34,    @ZONE_MULGORE,                      @FACTION_HORDE)
    ,(35,    @ZONE_DARKSHORE,                    @FACTION_ALLIANCE)
    ,(36,    @ZONE_DEADWIND_PASS,                @FACTION_ANY)
    ,(39,    @ZONE_THOUSAND_NEEDLES,             @FACTION_ANY)
    ,(39,    @ZONE_RAZORFEN_KRAUL,               @FACTION_ANY)
    ,(39,    @ZONE_RAZORFEN_DOWNS,               @FACTION_ANY)
    ,(70,    @ZONE_SILITHUS,                     @FACTION_ANY)
    ,(89,    @ZONE_MULGORE,                      @FACTION_HORDE)
    ,(90,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE)
    ,(90,    @ZONE_DARNASSUS,                    @FACTION_ALLIANCE)
    ,(91,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE)
    ,(92,    @ZONE_ASHENVALE,                    @FACTION_ANY)
    ,(92,    @ZONE_BLACKFATHOM_DEEPS,            @FACTION_ANY)
    ,(93,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE)
    ,(94,    @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE)
    ,(96,    @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE)
    ,(97,    @ZONE_SILVERPINE_FOREST,            @FACTION_HORDE)
    ,(97,    @ZONE_SHADOWFANG_KEEP,              @FACTION_ANY)
    ,(98,    @ZONE_ALTERAC_MOUNTAINS,            @FACTION_HORDE)
    ,(98,    @ZONE_HILLSBRAD_FOOTHILLS,          @FACTION_HORDE)
    ,(99,    @ZONE_ARATHI_HIGHLANDS,             @FACTION_ANY)
    ,(100,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE)
    ,(101,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE)
    ,(101,   @ZONE_GNOMEREGAN,                   @FACTION_ANY)
    ,(103,   @ZONE_BADLANDS,                     @FACTION_HORDE)
    ,(104,   @ZONE_DUSKWOOD,                     @FACTION_HORDE)
    ,(104,   @ZONE_REDRIDGE_MOUNTAINS,           @FACTION_ANY)
    ,(105,   @ZONE_ELWYNN_FOREST,                @FACTION_ALLIANCE)
    ,(106,   @ZONE_ELWYNN_FOREST,                @FACTION_ALLIANCE)
    ,(106,   @ZONE_THE_STOCKADE,                 @FACTION_ANY)
    ,(107,   @ZONE_STORMWIND_CITY,               @FACTION_ALLIANCE)
    ,(107,   @ZONE_DEEPRUN_TRAM,                 @FACTION_ANY)
    ,(107,   @ZONE_CHAMPIONS_HALL,               @FACTION_ANY)
    ,(108,   @ZONE_SWAMP_OF_SORROWS,             @FACTION_HORDE)
    ,(108,   @ZONE_SUNKEN_TEMPLE,                @FACTION_ANY)
    ,(108,   @ZONE_THE_TEMPLE_OF_ATALHAKKAR,     @FACTION_ANY)
    ,(109,   @ZONE_STRANGLETHORN_VALE,           @FACTION_ANY)
    ,(149,   @ZONE_ALTERAC_MOUNTAINS,            @FACTION_ALLIANCE)
    ,(149,   @ZONE_SILVERPINE_FOREST,            @FACTION_ALLIANCE)
    ,(149,   @ZONE_SHADOWFANG_KEEP,              @FACTION_ANY)
    ,(149,   @ZONE_HILLSBRAD_FOOTHILLS,          @FACTION_ALLIANCE)
    ,(169,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY)
    ,(189,   @ZONE_DUSTWALLOW_MARSH,             @FACTION_ALLIANCE)
    ,(189,   @ZONE_ONYXIAS_LAIR,                 @FACTION_ALLIANCE)
    ,(209,   @ZONE_TANARIS,                      @FACTION_ANY)
    ,(209,   @ZONE_ZULFARRAK,                    @FACTION_ANY)
    ,(209,   @ZONE_CAVERNS_OF_TIME,              @FACTION_ANY)
    ,(229,   @ZONE_THE_BARRENS,                  @FACTION_ANY)
    ,(249,   @ZONE_THE_BARRENS,                  @FACTION_HORDE)
    ,(249,   @ZONE_MULGORE,                      @FACTION_ALLIANCE)
    ,(249,   @ZONE_THUNDER_BLUFF,                @FACTION_ALLIANCE)
    ,(289,   @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE)
    ,(309,   @ZONE_FERALAS,                      @FACTION_ALLIANCE)
    ,(309,   @ZONE_THE_TEMPLE_OF_ATALHAKKAR,     @FACTION_ANY)
    ,(310,   @ZONE_FERALAS,                      @FACTION_HORDE)
    ,(329,   @ZONE_THOUSAND_NEEDLES,             @FACTION_ANY)
    ,(349,   @ZONE_THE_HINTERLANDS,              @FACTION_ALLIANCE)
    ,(369,   @ZONE_AZSHARA,                      @FACTION_ANY)
    ,(370,   @ZONE_BLASTED_LANDS,                @FACTION_ANY)
    ,(370,   @ZONE_SWAMP_OF_SORROWS,             @FACTION_ALLIANCE)
    ,(389,   @ZONE_STRANGLETHORN_VALE,           @FACTION_ANY)
    ,(389,   @ZONE_THE_DEADMINES,                @FACTION_ANY)
    ,(389,   @ZONE_ZULGURUB,                     @FACTION_ANY)
    ,(409,   @ZONE_STONETALON_MOUNTAINS,         @FACTION_ANY)
    ,(429,   @ZONE_SCARLET_MONASTERY,            @FACTION_ANY)
    ,(429,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY)
    ,(449,   @ZONE_FELWOOD,                      @FACTION_ANY)
    ,(450,   @ZONE_UNGORO_CRATER,                @FACTION_ANY)
    ,(469,   @ZONE_TELDRASSIL,                   @FACTION_HORDE)
    ,(469,   @ZONE_DARKSHORE,                    @FACTION_ALLIANCE)
    ,(469,   @ZONE_DARNASSUS,                    @FACTION_HORDE)
    ,(489,   @ZONE_WETLANDS,                     @FACTION_ANY)
    ,(509,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_ALLIANCE)
    ,(510,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY)
    ,(511,   @ZONE_WINTERSPRING,                 @FACTION_ANY)
    ,(512,   @ZONE_THE_BARRENS,                  @FACTION_ALLIANCE)
    ,(512,   @ZONE_DARKSHORE,                    @FACTION_HORDE)
    ,(512,   @ZONE_ASHENVALE,                    @FACTION_ANY)
    ,(512,   @ZONE_BLACKFATHOM_DEEPS,            @FACTION_ANY)
    ,(512,   @ZONE_ORGRIMMAR,                    @FACTION_ALLIANCE)
    ,(529,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY)
    ,(569,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_HORDE)
    ,(569,   @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE)
    ,(609,   @ZONE_AZSHARA,                      @FACTION_ANY)
    ,(610,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE)
    ,(611,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE)
    ,(629,   @ZONE_TIRISFAL_GLADES,              @FACTION_ALLIANCE)
    ,(629,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY)
    ,(630,   @ZONE_AZSHARA,                      @FACTION_ANY)
    ,(631,   @ZONE_DUSTWALLOW_MARSH,             @FACTION_HORDE)
    ,(631,   @ZONE_ONYXIAS_LAIR,                 @FACTION_HORDE)
    ,(632,   @ZONE_BURNING_STEPPES,              @FACTION_ANY)
    ,(633,   @ZONE_MOONGLADE,                    @FACTION_ANY)
    ,(634,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY)
    ,(635,   @ZONE_FELWOOD,                      @FACTION_ANY)
    ,(636,   @ZONE_SEARING_GORGE,                @FACTION_ANY)
    ,(636,   @ZONE_BLACKROCK_DEPTHS,             @FACTION_ANY)
    ,(636,   @ZONE_BLACKROCK_MOUNTAIN,           @FACTION_ANY)
    ,(636,   @ZONE_BLACKROCK_SPIRE,              @FACTION_ANY)
    ,(636,   @ZONE_MOLTEN_CORE,                  @FACTION_ANY)
    ,(636,   @ZONE_BLACKWING_LAIR,               @FACTION_ANY)
    ,(649,   @ZONE_DUROTAR,                      @FACTION_HORDE)
    ,(669,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY)
    ,(670,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY)
    ,(671,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY)
    ,(689,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY)
    ,(709,   @ZONE_DUROTAR,                      @FACTION_HORDE)
    ,(729,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE)
    ,(749,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE)
    ,(750,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE)
    ,(751,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE)
    ,(769,   @ZONE_WARSONG_GULCH,                @FACTION_ALLIANCE)
    ,(770,   @ZONE_WARSONG_GULCH,                @FACTION_HORDE)
    ,(771,   @ZONE_WARSONG_GULCH,                @FACTION_ALLIANCE)
    ,(772,   @ZONE_WARSONG_GULCH,                @FACTION_HORDE)
    ,(789,   @ZONE_THE_HINTERLANDS,              @FACTION_HORDE)
    ,(809,   @ZONE_WARSONG_GULCH,                @FACTION_ANY)
    ,(810,   @ZONE_WARSONG_GULCH,                @FACTION_ANY)
    ,(829,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_ANY)
    ,(829,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY)
    ,(830,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY)
    ,(849,   @ZONE_FERALAS,                      @FACTION_ANY)
    ,(849,   @ZONE_DIRE_MAUL,                    @FACTION_ANY)
    ,(850,   @ZONE_DUROTAR,                      @FACTION_HORDE)
    ,(850,   @ZONE_ORGRIMMAR,                    @FACTION_HORDE)
    ,(850,   @ZONE_RAGEFIRE_CHASM,               @FACTION_ANY)
    ,(850,   @ZONE_HALL_OF_LEGENDS,              @FACTION_HORDE)
    ,(851,   @ZONE_MULGORE,                      @FACTION_HORDE)
    ,(851,   @ZONE_THUNDER_BLUFF,                @FACTION_HORDE)
    ,(852,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE)
    ,(854,   @ZONE_ELWYNN_FOREST,                @FACTION_ANY)
    ,(854,   @ZONE_STORMWIND_CITY,               @FACTION_HORDE)
    ,(869,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY)
    ,(889,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE)
    ,(890,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE)
    ,(891,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY)
    ,(892,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY)
    ,(893,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE)
    ,(894,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY)
    ,(895,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE)
    ,(896,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY)
    ,(897,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY)
    ,(898,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE)
    ,(899,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE)
    ,(909,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY)
    ,(909,   @ZONE_STRATHOLME,                   @FACTION_ANY)
    ,(909,   @ZONE_NAXXRAMAS,                    @FACTION_ANY)
    ,(910,   @ZONE_SILITHUS,                     @FACTION_ANY)
    ,(911,   @ZONE_DUSKWOOD,                     @FACTION_ANY)
    ,(913,   @ZONE_SILITHUS,                     @FACTION_ANY)
    ,(913,   @ZONE_AHNQIRAJ,                     @FACTION_ANY)
    ,(913,   @ZONE_GATES_OF_AHNQIRAJ,            @FACTION_ANY)
    ,(927,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY)
;

-- Insert basic creature templates used by game systems / classes ------------
INSERT INTO `creature_template`
    (`Entry`, `ModelId1`,  `Name`,                          `SubName`)
VALUES
     (1,       10045,      'Waypoint',                      'GM Visual')
    ,(2,       262,        'Spawnpoint',                    'GM Visual')
    ,(89,      169,        'Infernal',                      NULL)
    ,(416,     4449,       'Imp',                           NULL)
    ,(417,     850,        'Felhunter',                     NULL)
    ,(541,     6852,       'Riding Gryphon',                NULL)
    ,(1860,    1132,       'Voidwalker',                    NULL)
    ,(1863,    4162,       'Succubus',                      NULL)
    ,(2224,    6851,       'Wind Rider',                    NULL)
    ,(3574,    1566,       'Riding Bat',                    NULL)
    ,(3837,    1936,       'Riding Hippogryph',             NULL)
    ,(4253,    2281,       'Bear Form',                     'Night Elf Druid')
    ,(4261,    2289,       'Bear Form',                     'Tauren Druid')
    ,(4277,    2421,       'Eye of Kilrogg',                NULL)
    ,(4408,    2428,       'Aquatic Form',                  'Night Elf Druid')
    ,(4410,    2428,       'Aquatic Form',                  'Tauren Druid')
    ,(5764,    7029,       'Guardian of Blizzard',          NULL)
    ,(6491,    5233,       'Spirit Healer',                 NULL)
    ,(6571,    892,        'Cat Form',                      'Night Elf Druid')
    ,(6572,    1058,       'Cat Form',                      'Tauren Druid')
    ,(6573,    918,        'Travel Form',                   'Druid')
    ,(12861,   1825,       'Wisp',                          'Ghost Visual')
    ,(15313,   15374,      'Moonkin',                       'Night Elf Druid')
    ,(15314,   15375,      'Moonkin',                       'Tauren Druid')
;

-- Modify creature templates with matching flags -----------------------------
UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,      `FactionHorde`          = 35,
    `rank`               = @CREATURE_RANK_NORMAL,
    `MinLevel`           = 63,      `MaxLevel`              = 63,
    `MinLevelHealth`     = 9999,    `MaxLevelHealth`        = 9999,
    `MeleeAttackPower`   = 3,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 7,       `MaxMeleeDmg`           = 7,
    `MinRangedDmg`       = 1.76,    `MaxRangedDmg`          = 2.42,
    `RangedAttackPower`  = 100,     `RangedBaseAttackTime`  = 2200,
    `SpeedWalk`          = 0.91,
    `InhabitType`        = @CREATURE_INHABIT_ANY,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `UnitFlags`          = 4096,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN | @CREATURE_FLAG_EXTRA_INVISIBLE,
    `CreatureType`       = @CREATURE_TYPE_CRITTER
WHERE `Entry` = 1;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,      `FactionHorde`          = 35,
    `MinLevel`           = 63,      `MaxLevel`              = 63,
    `MinLevelHealth`     = 9999,    `MaxLevelHealth`        = 9999,
    `MeleeAttackPower`   = 5,       `MeleeBaseAttackTime`   = 1800,
    `MinMeleeDmg`        = 11,      `MaxMeleeDmg`           = 11,
    `MinRangedDmg`       = 387.6,   `MaxRangedDmg`          = 532.95,
    `RangedAttackPower`  = 100,     `RangedBaseAttackTime`  = 1900,
    `SpeedWalk`          = 0,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN | @CREATURE_FLAG_EXTRA_INVISIBLE,
    `CreatureType`       = @CREATURE_TYPE_CRITTER
WHERE `Entry` = 2;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 50,       `MaxLevel`              = 50,
    `MinLevelHealth`     = 3517,     `MaxLevelHealth`        = 3517,
    `MinLevelMana`       = 3460,     `MaxLevelMana`          = 3460,
    `MeleeAttackPower`   = 93,       `MeleeBaseAttackTime`   = 1510,
    `MinMeleeDmg`        = 183,      `MaxMeleeDmg`           = 220,
    `MinRangedDmg`       = 66.44,    `MaxRangedDmg`          = 91.355,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1661,
    `SpeedWalk`          = 1.4,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 89;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 5,        `MaxLevel`              = 5,
    `MinLevelHealth`     = 166,      `MaxLevelHealth`        = 166,
    `MinLevelMana`       = 85,       `MaxLevelMana`          = 85,
    `MeleeAttackPower`   = 3,        `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 6,        `MaxMeleeDmg`           = 8,
    `MinRangedDmg`       = 8.624,    `MaxRangedDmg`          = 11.858,
    `RangedAttackPower`  = 100,
    `UnitClass`          = @CREATURE_CLASS_MAGE,
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 416;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 60,       `MaxLevel`              = 60,
    `MinLevelHealth`     = 3857,     `MaxLevelHealth`        = 3857,
    `MinLevelMana`       = 1666,     `MaxLevelMana`          = 3195,
    `MeleeAttackPower`   = 58,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 110,      `MaxMeleeDmg`           = 142,
    `MinRangedDmg`       = 74.448,   `MaxRangedDmg`          = 102.366,
    `RangedAttackPower`  = 100,
    `InhabitType`        = @CREATURE_INHABIT_GROUND,
    `UnitClass`          = @CREATURE_CLASS_PALADIN,
    `CreatureType`       = @CREATURE_TYPE_DEMON,
    `Family`             = @CREATURE_BEAST_FAMILY_FELHUNTER
WHERE `Entry` = 417;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 29,       `MaxLevel`              = 29,
    `MinLevelHealth`     = 1528,     `MaxLevelHealth`        = 1528,
    `MinLevelMana`       = 1126,     `MaxLevelMana`          = 1126,
    `MeleeAttackPower`   = 4,        `MeleeBaseAttackTime`   = 1720,
    `MinMeleeDmg`        = 9,        `MaxMeleeDmg`           = 10,
    `MinRangedDmg`       = 43.8944,  `MaxRangedDmg`          = 60.3548,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1892,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 541;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 17,       `MaxLevel`              = 17,
    `MinLevelHealth`     = 548,      `MaxLevelHealth`        = 548,
    `MinLevelMana`       = 300,      `MaxLevelMana`          = 300,
    `MeleeAttackPower`   = 8,        `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 15,       `MaxMeleeDmg`           = 19,
    `MinRangedDmg`       = 23.0384,  `MaxRangedDmg`          = 31.6778,
    `RangedAttackPower`  = 100,
    `SpeedWalk`          = 1.1,
    `InhabitType`        = @CREATURE_INHABIT_GROUND,
    `UnitClass`          = @CREATURE_CLASS_PALADIN,
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 1860;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 20,       `MaxLevel`              = 20,
    `MinLevelHealth`     = 919,      `MaxLevelHealth`        = 919,
    `MinLevelMana`       = 436,      `MaxLevelMana`          = 436,
    `MeleeAttackPower`   = 13,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 24,       `MaxMeleeDmg`           = 31,
    `MinRangedDmg`       = 31.856,   `MaxRangedDmg`          = 43.802,
    `RangedAttackPower`  = 100,
    `SpeedWalk`          = 1.1,
    `InhabitType`        = @CREATURE_INHABIT_GROUND,
    `UnitClass`          = @CREATURE_CLASS_MAGE,
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 1863;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 29,       `MaxLevel`              = 29,
    `MinLevelHealth`     = 1528,     `MaxLevelHealth`        = 1528,
    `MinLevelMana`       = 1126,     `MaxLevelMana`          = 1126,
    `MeleeAttackPower`   = 4,        `MeleeBaseAttackTime`   = 1720,
    `MinMeleeDmg`        = 9,        `MaxMeleeDmg`           = 10,
    `MinRangedDmg`       = 43.8944,  `MaxRangedDmg`          = 60.3548,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1892,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 2224;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 29,       `MaxLevel`              = 29,
    `MinLevelHealth`     = 1528,     `MaxLevelHealth`        = 1528,
    `MinLevelMana`       = 1126,     `MaxLevelMana`          = 1126,
    `MeleeAttackPower`   = 4,        `MeleeBaseAttackTime`   = 1720,
    `MinMeleeDmg`        = 9,        `MaxMeleeDmg`           = 10,
    `MinRangedDmg`       = 43.8944,  `MaxRangedDmg`          = 60.3548,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1892,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 3574;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 29,       `MaxLevel`              = 29,
    `MinLevelHealth`     = 1528,     `MaxLevelHealth`        = 1528,
    `MinLevelMana`       = 1126,     `MaxLevelMana`          = 1126,
    `MeleeAttackPower`   = 4,        `MeleeBaseAttackTime`   = 1720,
    `MinMeleeDmg`        = 9,        `MaxMeleeDmg`           = 10,
    `MinRangedDmg`       = 43.8944,  `MaxRangedDmg`          = 60.3548,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1892,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 3837;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 4253;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 4261;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `MinLevel`           = 22,       `MaxLevel`              = 22,
    `MinLevelHealth`     = 1042,     `MaxLevelHealth`        = 1042,
    `MeleeAttackPower`   = 22,       `MeleeBaseAttackTime`   = 1790,
    `MinMeleeDmg`        = 44,       `MaxMeleeDmg`           = 52,
    `MinRangedDmg`       = 34.6544,  `MaxRangedDmg`          = 47.6498,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1969,
    `SpeedWalk`          = 1.03,
    `InhabitType`        = @CREATURE_INHABIT_GROUND,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 4277;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 4408;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `CreatureType`       = @CREATURE_TYPE_BEAST
WHERE `Entry` = 4410;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 90,       `FactionHorde`          = 90,
    `rank`               = @CREATURE_RANK_WORLD_BOSS,
    `MinLevel`           = 63,       `MaxLevel`              = 63,
    `MinLevelHealth`     = 8832,     `MaxLevelHealth`        = 8832,
    `MeleeAttackPower`   = 265,      `MeleeBaseAttackTime`   = 1020,
    `MinMeleeDmg`        = 520,      `MaxMeleeDmg`           = 628,
    `MinRangedDmg`       = 88.8624,  `MaxRangedDmg`          = 122.186,
    `RangedAttackPower`  = 100,      `RangedBaseAttackTime`  = 1122,
    `Scale`              = 2.25,
    `SpeedWalk`          = 1.3,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `MovementType`       = @CREATURE_MOVEMENT_RANDOM,
    `InhabitType`        = @CREATURE_INHABIT_GROUND_WATER,
    `AIName`             = 'EventAI',
    `CreatureType`       = @CREATURE_TYPE_DEMON
WHERE `Entry` = 5764;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 60,       `MaxLevel`              = 60,
    `MinLevelHealth`     = 7680,     `MaxLevelHealth`        = 7680,
    `MeleeAttackPower`   = 87,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 164,      `MaxMeleeDmg`           = 212,
    `MinRangedDmg`       = 74.448,   `MaxRangedDmg`          = 102.366,
    `RangedAttackPower`  = 100,
    `SpeedRun`           = 1,
    `InhabitType`        = @CREATURE_INHABIT_GROUND,
    `NpcFlags`           = @CREATURE_FLAG_NPC_GOSSIP | @CREATURE_FLAG_NPC_SPIRITHEALER,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `UnitFlags`          = 768,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_HUMANOID,
    `CreatureTypeFlags`  = @CREATURE_TYPE_FLAG_NOT_ATTACKABLE
WHERE `Entry` = 6491;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST,
    `Family`             = @CREATURE_BEAST_FAMILY_BEAR
WHERE `Entry` = 6571;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST,
    `Family`             = @CREATURE_BEAST_FAMILY_BEAR
WHERE `Entry` = 6572;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_BEAST,
    `Family`             = @CREATURE_BEAST_FAMILY_BEAR
WHERE `Entry` = 6573;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 8,        `MaxLevelHealth`        = 8,
    `MeleeAttackPower`   = 1,        `MeleeBaseAttackTime`   = 0,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 0,        `MaxRangedDmg`          = 0,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `ExtraFlags`         = @CREATURE_FLAG_EXTRA_CIVILIAN,
    `CreatureType`       = @CREATURE_TYPE_CRITTER
WHERE `Entry` = 12861;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `CreatureType`       = @CREATURE_TYPE_HUMANOID
WHERE `Entry` = 15313;

UPDATE `creature_template`
SET
    `FactionAlliance`    = 35,       `FactionHorde`          = 35,
    `MinLevel`           = 1,        `MaxLevel`              = 1,
    `MinLevelHealth`     = 5000,     `MaxLevelHealth`        = 5000,
    `MeleeAttackPower`   = 24,       `MeleeBaseAttackTime`   = 2000,
    `MinMeleeDmg`        = 2,        `MaxMeleeDmg`           = 2,
    `MinRangedDmg`       = 1,        `MaxRangedDmg`          = 1,
    `SpeedWalk`          = 1.2,
    `UnitClass`          = @CREATURE_CLASS_WARRIOR,
    `CreatureType`       = @CREATURE_TYPE_HUMANOID
WHERE `Entry` = 15314;

-- Insert template spells for creatures --------------------------------------
INSERT INTO `creature_template_spells`
    (`entry`, `spell1`, `spell2`, `spell3`, `spell4`)
VALUES
     (  416,  3110,         0,          0,      0)
    ,( 5764,     5,         0,          0,      0)
;

-- Insert AI text strings for creatures --------------------------------------
INSERT INTO `creature_ai_texts`
    (`entry`, `content_default`, `type`, `comment`)
VALUES
     (-5764, '$N! THIS AREA IS OFF LIMITS!', 1, 'Guardian of Blizzard - Yell at player')
;

-- Insert AI scripts for creatures -------------------------------------------
INSERT INTO `creature_ai_scripts`
    (`id`, `creature_id`, `event_type`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action1_type`, `action1_param1`, `comment`)
VALUES
     (576401, 5764, 4, 100, 2,    0,     0,     0,     0,  1, -5764, 'Guardian of Blizzard - Yell at character')
    ,(576402, 5764, 0,  50, 1, 4000, 14100, 38000, 42000, 11,     5, 'Guardian of Blizzard - Cast Death Touch on character')
;

-- Insert template addon for creatures ---------------------------------------
INSERT INTO `creature_template_addon`
    (`entry`, `mount`, `bytes1`, `b2_0_sheath`, `b2_1_flags`, `emote`, `moveflags`, `auras`)
VALUES
     (89,       0,              0, 0,             0,             0,      0,          '19483')
    ,(4277,     0,              0, 1,            40,             0,      0,          NULL)
    ,(6491,     0,       16777216, 1,            16,             0,      0,          NULL)
;

-- Insert spawns for creatures -----------------------------------------------
INSERT INTO `creature`
    (`guid`, `id`, `map`, `modelid`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`)
VALUES
     (6491001,    6491, 0, 5233, 1819.41, 219.233, 60.0732, 0.337883, 25, 0, 0, 7680)
    ,(6491002,    6491, 1, 5233, -8591.09, -3623.91, 13.478, 4.54902, 60, 0, 0, 7680)
    ,(6491003,    6491, 1, 5233, 466.735, 1466.16, 12.8983, 0.112288, 60, 0, 0, 7680)
    ,(6491004,    6491, 1, 5233, 2734.82, 1279.54, 295.79, 2.00745, 60, 0, 0, 7680)
    ,(6491005,    6491, 1, 5233, -8146.14, -4608.99, -125.103, 4.16259, 60, 0, 0, 7680)
    ,(6491006,    6491, 1, 5233, -4637.91, -3139.22, 34.9469, 0.761173, 60, 0, 0, 7680)
    ,(6491007,    6491, 1, 5233, -4031.16, -3422.71, 38.8247, 1.69815, 60, 0, 0, 7680)
    ,(6491008,    6491, 1, 5233, -3973.19, -2017.75, 96.0305, 0.966001, 60, 0, 0, 7680)
    ,(6491009,    6491, 0, 5233, 790.751, -418.588, 136.861, 5.48565, 60, 0, 0, 7680)
    ,(6491010,    6491, 0, 5233, -6863.62, -1537.06, 241.746, 3.72703, 60, 0, 0, 7680)
    ,(6491011,    6491, 1, 5233, -7348.79, -1316.54, -260.86, 2.90753, 60, 0, 0, 7680)
    ,(6491012,    6491, 1, 5233, 6499.08, -2378.94, 589.681, 4.80547, 60, 0, 0, 7680)
    ,(6491013,    6491, 1, 5233, -7748.02, -4978.67, 6.00826, 2.27058, 60, 0, 0, 7680)
    ,(6491014,    6491, 0, 5233, 1840.76, -2149.67, 67.4929, 2.38151, 60, 0, 0, 7680)
    ,(6491015,    6491, 0, 5233, -7105.79, -3488.52, 242.318, 0.00187445, 60, 0, 0, 7680)
    ,(6491016,    6491, 1, 5233, 5633.21, -4765.75, 777.907, 1.47459, 60, 0, 0, 7680)
    ,(6491017,    6491, 1, 5233, -6154.23, -1142.67, -216.588, 2.99628, 60, 0, 0, 7680)
    ,(6491018,    6491, 1, 5233, -7981.09, 1556.57, 3.64432, 3.17291, 60, 0, 0, 7680)
    ,(6491019,    6491, 0, 5233, 1989.31, -3650.44, 120.369, 3.70566, 60, 0, 0, 7680)
    ,(6491021,    6491, 0, 5233, -10602.4, 293.623, 31.7491, 3.09761, 25, 0, 0, 7680)
    ,(6491022,    6491, 0, 5233, -11103, -1833.2, 71.8642, 3.04545, 60, 0, 0, 7680)
    ,(6491023,    6491, 0, 5233, -9554.16, -1367.13, 51.202, 4.91271, 60, 0, 0, 7680)
    ,(6491024,    6491, 0, 5233, -6439, -1115, 312.16, 3.172, 490, 0, 0, 7680)
    ,(6491025,    6491, 0, 5233, -14286, 283.778, 32.739, 1.543, 490, 0, 0, 7680)
    ,(6491026,    6491, 0, 5233, -11550, -228, 28.285, 6.161, 490, 0, 0, 7680)
    ,(6491027,    6491, 0, 5233, -10836, -2953, 13.941, 3.054, 490, 0, 0, 7680)
    ,(6491028,    6491, 0, 5233, -10779, -1194, 35.275, 0.915, 490, 0, 0, 7680)
    ,(6491029,    6491, 0, 5233, -10575, -3377, 22.344, 0.017, 490, 0, 0, 7680)
    ,(6491030,    6491, 0, 5233, -10559, 1206.87, 31.476, 5.616, 490, 0, 0, 7680)
    ,(6491031,    6491, 0, 5233, -9394, -2022, 58.275, 4.33, 490, 0, 0, 7680)
    ,(6491032,    6491, 0, 5233, -7501, -2145, 146.088, 0.955, 490, 0, 0, 7680)
    ,(6491033,    6491, 0, 5233, -6807, -2289, 280.753, 2.587, 490, 0, 0, 7680)
    ,(6491034,    6491, 0, 5233, -5352, -2892, 341.729, 1.654, 490, 0, 0, 7680)
    ,(6491035,    6491, 0, 5233, -3355, -845, 1.063, 1.734, 490, 0, 0, 7680)
    ,(6491036,    6491, 0, 5233, -3299, -2430, 18.597, 5.693, 490, 0, 0, 7680)
    ,(6491037,    6491, 0, 5233, -1468, -2625, 48.363, 4.617, 490, 0, 0, 7680)
    ,(6491038,    6491, 0, 5233, -721, -592, 25.011, 3.121, 490, 0, 0, 7680)
    ,(6491039,    6491, 0, 5233, -285, -4388, 108.627, 2.007, 490, 0, 0, 7680)
    ,(6491040,    6491, 0, 5233, -20, -996, 55.837, 1.499, 490, 0, 0, 7680)
    ,(6491041,    6491, 0, 5233, 324.261, -2227, 137.775, 3.107, 490, 0, 0, 7680)
    ,(6491042,    6491, 0, 5233, 476.229, 1595.9, 126.662, 5.942, 490, 0, 0, 7680)
    ,(6491043,    6491, 0, 5233, 902.236, -1517, 55.037, 4.744, 490, 0, 0, 7680)
    ,(6491044,    6491, 0, 5233, 1238.37, -2414, 60.739, 2.359, 490, 0, 0, 7680)
    ,(6491045,    6491, 0, 5233, 1380.44, -3701, 77.017, 6.271, 490, 0, 0, 7680)
    ,(6491046,    6491, 0, 5233, 1739.56, -672, 45.062, 6.275, 490, 0, 0, 7680)
    ,(6491047,    6491, 0, 5233, 1882.3, 1641.52, 93.646, 4.491, 490, 0, 0, 7680)
    ,(6491048,    6491, 0, 5233, 2115.64, -5299, 82.163, 1.075, 490, 0, 0, 7680)
    ,(6491049,    6491, 0, 5233, 2348.58, 492.862, 33.358, 4.879, 490, 0, 0, 7680)
    ,(6491050,    6491, 0, 5233, 2603.09, -535, 89, 5.596, 490, 0, 0, 7680)
    ,(6491051,    6491, 0, 5233, 2641.28, -4015, 106.292, 6.239, 490, 0, 0, 7680)
    ,(6491052,    6491, 1, 5233, -7207, -2439, -218, 1.084, 490, 0, 0, 7680)
    ,(6491053,    6491, 1, 5233, -7200, -3938, 9.204, 4.711, 490, 0, 0, 7680)
    ,(6491054,    6491, 1, 5233, -6824, 892.716, 33.999, 3.062, 490, 0, 0, 7680)
    ,(6491055,    6491, 1, 5233, -6442, -290, 3.555, 0.717, 490, 0, 0, 7680)
    ,(6491056,    6491, 1, 5233, -5530, -3455, -44, 4.603, 490, 0, 0, 7680)
    ,(6491057,    6491, 1, 5233, -4642, -1778, -41, 2.489, 490, 0, 0, 7680)
    ,(6491058,    6491, 1, 5233, -4600, 3229.67, 9.006, 0.093, 490, 0, 0, 7680)
    ,(6491059,    6491, 1, 5233, -4593, 1631.68, 93.968, 6.225, 490, 0, 0, 7680)
    ,(6491060,    6491, 1, 5233, -4429, 370.415, 51.727, 3.401, 490, 0, 0, 7680)
    ,(6491061,    6491, 1, 5233, -2949, -142, 67.093, 5.067, 490, 0, 0, 7680)
    ,(6491062,    6491, 1, 5233, -2506, -1968, 91.784, 2.796, 490, 0, 0, 7680)
    ,(6491063,    6491, 1, 5233, -2173, -342, -5, 3.594, 490, 0, 0, 7680)
    ,(6491064,    6491, 1, 5233, -1434, 1967.04, 86.041, 1.71, 490, 0, 0, 7680)
    ,(6491065,    6491, 1, 5233, -1073, -3479, 63.044, 3.446, 490, 0, 0, 7680)
    ,(6491066,    6491, 1, 5233, -983, -75, 20.431, 0.033, 490, 0, 0, 7680)
    ,(6491067,    6491, 1, 5233, -774, -4988, 19.257, 3.291, 490, 0, 0, 7680)
    ,(6491068,    6491, 1, 5233, -639, -4298, 40.942, 1.082, 490, 0, 0, 7680)
    ,(6491069,    6491, 1, 5233, -590, -2515, 91.761, 4.549, 490, 0, 0, 7680)
    ,(6491070,    6491, 1, 5233, 240.765, -4791, 10.256, 3.43, 490, 0, 0, 7680)
    ,(6491071,    6491, 1, 5233, 919.297, 436.482, 65.128, 3.009, 490, 0, 0, 7680)
    ,(6491072,    6491, 1, 5233, 1178.15, -4467, 21.323, 1.176, 490, 0, 0, 7680)
    ,(6491073,    6491, 1, 5233, 2428.47, -2953, 123.513, 0.062, 490, 0, 0, 7680)
    ,(6491074,    6491, 1, 5233, 2644.78, -635, 107.674, 3.347, 490, 0, 0, 7680)
    ,(6491075,    6491, 1, 5233, 2683.48, -3988, 108.41, 4.673, 490, 0, 0, 7680)
    ,(6491076,    6491, 1, 5233, 2924.51, -6031, 4.946, 6.02, 490, 0, 0, 7680)
    ,(6491077,    6491, 1, 5233, 3796.96, -1622, 219.894, 1.45, 490, 0, 0, 7680)
    ,(6491078,    6491, 1, 5233, 4299.27, 89.079, 42.752, 2.397, 490, 0, 0, 7680)
    ,(6491079,    6491, 1, 5233, 4798.35, -6846, 89.817, 3.236, 490, 0, 0, 7680)
    ,(6491080,    6491, 1, 5233, 5943.01, -1205, 382.952, 5.47, 490, 0, 0, 7680)
    ,(6491081,    6491, 1, 5233, 6736.36, 202.91, 23.255, 4.121, 490, 0, 0, 7680)
    ,(6491082,    6491, 1, 5233, 6857.31, -4680, 700.936, 1.527, 490, 0, 0, 7680)
    ,(6491083,    6491, 1, 5233, 7412.88, -2817, 464.855, 0.253, 490, 0, 0, 7680)
    ,(6491084,    6491, 1, 5233, 16320.2, 16243.6, 24.4, 2.253, 490, 0, 0, 7680)
    ,(6491085,    6491, 0, 5233, -6282.51, -3488.48, 252.189, 3.6477, 180, 0, 0, 7680)
    ,(6491086,    6491, 0, 5233, -9341, 165.021, 61.641, 1.096, 490, 0, 0, 7680)
    ,(6491087,    6491, 1, 5233, -3518, -4315, 6.77, 3.035, 490, 0, 0, 7680)
    ,(6491088,    6491, 1, 5233, -3134, -3048, 34.246, 5.711, 490, 0, 0, 7680)
    ,(6491089,    6491, 0, 5233, -5165, -876, 507.245, 0.929, 60, 0, 0, 7680)
    ,(6491090,    6491, 0, 5233, -5670, -528, 398.13, 2.381, 60, 0, 0, 7680)
    ,(6491091,    6491, 0, 5233, -6160, 325.568, 399.968, 1.928, 60, 0, 0, 7680)
    ,(6491092,    6491, 0, 5233, -8924, -189, 80.555, 2.77, 60, 0, 0, 7680)
    ,(6491093,    6491, 1, 5233, 9683.39, 952.225, 1291.87, 5.752, 60, 0, 0, 7680)
    ,(6491094,    6491, 1, 5233, 10055.4, 2116.32, 1329.71, 2.54, 60, 0, 0, 7680)
    ,(6491095,    6491, 1, 5233, 10394.7, 825.111, 1317.52, 3.753, 60, 0, 0, 7680)
;

-- Insert gossip text --------------------------------------------------------
INSERT INTO `npc_text`
    (`ID`, `text0_0`, `text0_1`, `lang0`, `prob0`)
VALUES
    (580, 'It is not yet your time. I shall aid your journey back to the realm of the living... for a price.', NULL, 0, 100);

-- Insert gossip menus -------------------------------------------------------
INSERT INTO `gossip_menu`
    (`entry`, `text_id`)
VALUES
    (83, 580);

-- Add options for gossip menus ----------------------------------------------
INSERT INTO `gossip_menu_option`
    (`menu_id`, `id`, `option_icon`, `option_text`, `option_id`, `npc_option_npcflag`)
VALUES
    (83, 0, 4, 'Return me to life.', 6, 32);

-- Add gossip menus for creatures --------------------------------------------
UPDATE `creature_template`
SET
    `GossipMenuId` = 83
WHERE `Entry` = 6491;

-- Insert pet level stats: these are creatures summoned by Warlocks ----------
INSERT INTO `pet_levelstats`
    (`creature_entry`, `level`, `hp`, `mana`, `armor`, `str`, `agi`, `sta`, `inte`, `spi`)
VALUES
    -- Stats for creature #416: Imp ------------------------------------------
     (416, 1, 140, 48, 20, 20, 5, 20, 24, 23)
    ,(416, 2, 149, 59, 20, 21, 5, 2, 25, 24)
    ,(416, 3, 158, 70, 20, 15, 5, 4, 26, 25)
    ,(416, 4, 168, 81, 33, 17, 5, 8, 27, 26)
    ,(416, 5, 177, 92, 49, 18, 5, 12, 28, 27)
    ,(416, 6, 186, 103, 68, 20, 7, 16, 29, 27)
    ,(416, 7, 195, 114, 92, 22, 7, 21, 30, 28)
    ,(416, 8, 204, 125, 117, 23, 8, 25, 31, 29)
    ,(416, 9, 213, 136, 147, 25, 9, 27, 32, 30)
    ,(416, 10, 223, 147, 180, 29, 10, 29, 33, 31)
    ,(416, 11, 232, 158, 190, 30, 11, 32, 37, 35)
    ,(416, 12, 250, 180, 203, 31, 12, 36, 41, 39)
    ,(416, 13, 289, 203, 215, 32, 13, 43, 50, 43)
    ,(416, 14, 299, 227, 228, 33, 13, 44, 54, 47)
    ,(416, 15, 309, 251, 240, 34, 13, 48, 57, 52)
    ,(416, 16, 329, 275, 253, 36, 13, 52, 62, 56)
    ,(416, 17, 350, 300, 265, 38, 13, 55, 65, 65)
    ,(416, 18, 362, 314, 278, 39, 13, 59, 70, 70)
    ,(416, 19, 393, 351, 291, 40, 13, 63, 74, 75)
    ,(416, 20, 403, 377, 303, 42, 13, 67, 87, 78)
    ,(416, 21, 425, 393, 320, 44, 13, 80, 91, 83)
    ,(416, 22, 449, 420, 346, 46, 13, 84, 95, 86)
    ,(416, 23, 473, 447, 360, 47, 13, 89, 96, 90)
    ,(416, 24, 520, 476, 373, 49, 13, 93, 97, 95)
    ,(416, 25, 540, 504, 386, 50, 13, 97, 98, 100)
    ,(416, 26, 569, 534, 399, 52, 13, 101, 60, 78)
    ,(416, 27, 571, 564, 411, 53, 14, 105, 61, 81)
    ,(416, 28, 574, 592, 424, 55, 15, 110, 62, 86)
    ,(416, 29, 576, 620, 436, 57, 16, 114, 62, 89)
    ,(416, 30, 579, 648, 449, 57, 16, 118, 63, 92)
    ,(416, 31, 581, 676, 462, 59, 16, 123, 64, 95)
    ,(416, 32, 590, 720, 476, 60, 17, 127, 64, 98)
    ,(416, 33, 598, 742, 488, 62, 18, 131, 65, 101)
    ,(416, 34, 601, 793, 501, 63, 19, 135, 65, 104)
    ,(416, 35, 609, 845, 513, 64, 19, 136, 66, 107)
    ,(416, 36, 617, 879, 525, 67, 19, 137, 66, 110)
    ,(416, 37, 626, 916, 537, 69, 19, 138, 68, 112)
    ,(416, 38, 634, 952, 549, 70, 19, 139, 68, 115)
    ,(416, 39, 642, 988, 561, 72, 19, 142, 69, 118)
    ,(416, 40, 650, 1026, 639, 74, 20, 147, 156, 142)
    ,(416, 41, 668, 1063, 694, 77, 20, 152, 160, 143)
    ,(416, 42, 676, 1103, 756, 81, 20, 156, 163, 144)
    ,(416, 43, 685, 1187, 808, 87, 20, 160, 167, 145)
    ,(416, 44, 693, 1214, 853, 91, 21, 164, 170, 146)
    ,(416, 45, 701, 1240, 884, 96, 21, 169, 174, 148)
    ,(416, 46, 709, 1267, 910, 98, 22, 173, 177, 149)
    ,(416, 47, 718, 1294, 928, 100, 22, 177, 181, 151)
    ,(416, 48, 726, 1320, 946, 102, 22, 181, 184, 152)
    ,(416, 49, 734, 1347, 964, 105, 22, 186, 188, 155)
    ,(416, 50, 747, 1391, 983, 107, 22, 190, 194, 158)
    ,(416, 51, 750, 1435, 996, 109, 22, 194, 202, 161)
    ,(416, 52, 764, 1481, 1013, 112, 24, 198, 208, 165)
    ,(416, 53, 787, 1527, 1039, 114, 25, 203, 215, 168)
    ,(416, 54, 820, 1573, 1055, 115, 26, 207, 222, 172)
    ,(416, 55, 836, 1620, 1078, 119, 26, 211, 229, 177)
    ,(416, 56, 846, 1666, 1091, 121, 27, 215, 236, 181)
    ,(416, 57, 850, 1714, 1101, 123, 27, 220, 243, 185)
    ,(416, 58, 862, 1763, 1125, 125, 27, 224, 250, 189)
    ,(416, 59, 878, 1824, 1150, 127, 27, 230, 258, 192)
    ,(416, 60, 920, 1898, 1163, 122, 27, 128, 264, 197)

    -- Stats for creature #417: Felhunter ------------------------------------
    ,(417, 1, 60, 48, 144, 11, 17, 12, 11, 22)
    ,(417, 2, 73, 59, 168, 12, 18, 14, 13, 23)
    ,(417, 3, 87, 70, 191, 14, 19, 17, 15, 24)
    ,(417, 4, 101, 81, 215, 15, 20, 19, 17, 25)
    ,(417, 5, 115, 92, 239, 17, 21, 22, 19, 26)
    ,(417, 6, 129, 103, 263, 19, 22, 24, 21, 27)
    ,(417, 7, 152, 114, 287, 20, 23, 27, 23, 28)
    ,(417, 8, 156, 125, 310, 22, 24, 29, 25, 29)
    ,(417, 9, 170, 136, 334, 23, 25, 32, 27, 30)
    ,(417, 10, 184, 147, 358, 25, 26, 34, 29, 31)
    ,(417, 11, 198, 158, 382, 27, 27, 37, 31, 32)
    ,(417, 12, 225, 180, 406, 28, 28, 41, 33, 33)
    ,(417, 13, 254, 203, 429, 30, 29, 45, 35, 34)
    ,(417, 14, 284, 227, 453, 31, 30, 50, 37, 35)
    ,(417, 15, 313, 251, 477, 33, 31, 54, 39, 36)
    ,(417, 16, 343, 275, 501, 35, 32, 58, 41, 37)
    ,(417, 17, 375, 300, 525, 36, 33, 62, 43, 38)
    ,(417, 18, 392, 314, 548, 38, 34, 67, 45, 39)
    ,(417, 19, 438, 351, 572, 39, 35, 71, 47, 40)
    ,(417, 20, 471, 377, 596, 41, 36, 75, 49, 41)
    ,(417, 21, 500, 400, 620, 43, 37, 80, 51, 42)
    ,(417, 22, 528, 423, 644, 44, 38, 84, 53, 43)
    ,(417, 23, 558, 447, 667, 46, 39, 88, 55, 44)
    ,(417, 24, 595, 476, 691, 47, 40, 93, 57, 45)
    ,(417, 25, 630, 504, 715, 49, 41, 97, 59, 46)
    ,(417, 26, 678, 543, 739, 51, 42, 101, 61, 47)
    ,(417, 27, 705, 564, 763, 52, 43, 105, 63, 48)
    ,(417, 28, 740, 592, 786, 54, 44, 110, 65, 49)
    ,(417, 29, 775, 620, 810, 55, 45, 114, 67, 50)
    ,(417, 30, 800, 648, 834, 57, 46, 118, 69, 51)
    ,(417, 31, 856, 676, 858, 59, 47, 123, 71, 52)
    ,(417, 32, 921, 720, 882, 60, 47, 127, 73, 53)
    ,(417, 33, 987, 742, 905, 62, 49, 131, 74, 54)
    ,(417, 34, 1047, 793, 929, 63, 50, 135, 76, 56)
    ,(417, 35, 1107, 845, 953, 65, 52, 137, 73, 57)
    ,(417, 36, 1167, 879, 977, 67, 53, 138, 72, 58)
    ,(417, 37, 1227, 916, 1001, 68, 54, 138, 70, 60)
    ,(417, 38, 1288, 952, 1024, 70, 55, 139, 69, 61)
    ,(417, 39, 1348, 988, 1048, 71, 56, 142, 68, 62)
    ,(417, 40, 1408, 1026, 1250, 73, 57, 146, 67, 64)
    ,(417, 41, 1468, 1063, 1390, 76, 58, 151, 68, 65)
    ,(417, 42, 1528, 1103, 1484, 81, 59, 156, 70, 67)
    ,(417, 43, 1588, 1187, 1550, 87, 60, 160, 71, 68)
    ,(417, 44, 1648, 1214, 1650, 91, 61, 164, 73, 70)
    ,(417, 45, 1708, 1240, 1750, 95, 64, 168, 75, 71)
    ,(417, 46, 1768, 1267, 1817, 98, 65, 173, 77, 73)
    ,(417, 47, 1828, 1294, 1853, 100, 66, 177, 78, 75)
    ,(417, 48, 1889, 1320, 1888, 102, 68, 181, 80, 76)
    ,(417, 49, 1950, 1347, 1925, 104, 69, 186, 82, 78)
    ,(417, 50, 2003, 1391, 1959, 107, 71, 190, 84, 80)
    ,(417, 51, 2055, 1435, 2041, 109, 72, 195, 86, 82)
    ,(417, 52, 2108, 1481, 2125, 111, 74, 199, 88, 84)
    ,(417, 53, 2161, 1527, 2213, 113, 75, 204, 90, 86)
    ,(417, 54, 2213, 1573, 2305, 116, 77, 208, 92, 88)
    ,(417, 55, 2266, 1620, 2400, 118, 78, 213, 94, 90)
    ,(417, 56, 2318, 1666, 2499, 120, 80, 217, 96, 92)
    ,(417, 57, 2371, 1714, 2602, 123, 82, 222, 99, 94)
    ,(417, 58, 2424, 1763, 2709, 125, 83, 226, 101, 97)
    ,(417, 59, 2476, 1824, 2821, 127, 85, 231, 103, 99)
    ,(417, 60, 2529, 1874, 2938, 130, 87, 235, 106, 101)

    -- Stats for creature #1860: Voidwalker ----------------------------------
    ,(1860, 1, 40, 48, 20, 12, 14, 1, 1, 0)
    ,(1860, 2, 49, 59, 40, 14, 15, 2, 1, 0)
    ,(1860, 3, 58, 70, 60, 15, 16, 4, 1, 0)
    ,(1860, 4, 68, 81, 80, 17, 17, 8, 2, 0)
    ,(1860, 5, 77, 92, 100, 18, 18, 12, 2, 0)
    ,(1860, 6, 86, 103, 120, 20, 19, 16, 3, 0)
    ,(1860, 7, 95, 114, 140, 22, 20, 21, 3, 0)
    ,(1860, 8, 104, 125, 160, 23, 21, 25, 4, 0)
    ,(1860, 9, 113, 136, 180, 25, 22, 27, 4, 0)
    ,(1860, 10, 260, 147, 694, 29, 25, 29, 22, 26)
    ,(1860, 11, 291, 158, 734, 30, 25, 32, 22, 28)
    ,(1860, 12, 322, 180, 782, 31, 26, 36, 24, 31)
    ,(1860, 13, 354, 203, 827, 32, 28, 43, 26, 32)
    ,(1860, 14, 368, 227, 878, 33, 28, 44, 25, 35)
    ,(1860, 15, 421, 251, 925, 34, 30, 48, 26, 37)
    ,(1860, 16, 455, 275, 975, 36, 30, 52, 27, 39)
    ,(1860, 17, 490, 300, 1022, 38, 31, 55, 28, 42)
    ,(1860, 18, 528, 314, 1068, 39, 33, 59, 28, 38)
    ,(1860, 19, 566, 351, 1120, 40, 33, 63, 30, 46)
    ,(1860, 20, 606, 377, 1165, 42, 35, 67, 31, 49)
    ,(1860, 21, 653, 393, 1232, 44, 36, 80, 32, 39)
    ,(1860, 22, 699, 420, 1282, 46, 36, 84, 33, 41)
    ,(1860, 23, 746, 447, 1330, 47, 38, 89, 34, 42)
    ,(1860, 24, 823, 476, 1378, 49, 39, 93, 35, 43)
    ,(1860, 25, 854, 504, 1427, 50, 40, 97, 36, 44)
    ,(1860, 26, 911, 534, 1474, 52, 41, 101, 37, 46)
    ,(1860, 27, 968, 564, 1524, 53, 42, 105, 38, 47)
    ,(1860, 28, 1035, 592, 1572, 55, 43, 110, 39, 48)
    ,(1860, 29, 1127, 620, 1619, 57, 44, 114, 40, 49)
    ,(1860, 30, 1215, 648, 1667, 57, 46, 118, 41, 51)
    ,(1860, 31, 1292, 676, 1715, 59, 47, 123, 42, 52)
    ,(1860, 32, 1386, 720, 1766, 60, 47, 127, 43, 53)
    ,(1860, 33, 1457, 742, 1812, 62, 49, 131, 45, 54)
    ,(1860, 34, 1574, 793, 1861, 63, 50, 135, 46, 56)
    ,(1860, 35, 1690, 845, 1911, 64, 51, 136, 46, 57)
    ,(1860, 36, 1760, 879, 2150, 67, 52, 137, 47, 58)
    ,(1860, 37, 1830, 916, 2246, 69, 53, 138, 48, 59)
    ,(1860, 38, 1924, 952, 2331, 70, 55, 139, 49, 61)
    ,(1860, 39, 1974, 988, 2496, 72, 56, 142, 49, 62)
    ,(1860, 40, 2052, 1026, 2675, 74, 57, 147, 50, 64)
    ,(1860, 41, 2135, 1063, 2826, 77, 58, 152, 51, 66)
    ,(1860, 42, 2215, 1103, 3034, 81, 59, 156, 51, 67)
    ,(1860, 43, 2260, 1187, 3228, 87, 60, 160, 52, 69)
    ,(1860, 44, 2290, 1214, 3463, 91, 61, 164, 54, 71)
    ,(1860, 45, 2303, 1240, 3620, 96, 64, 169, 55, 72)
    ,(1860, 46, 2349, 1267, 3722, 98, 65, 173, 57, 73)
    ,(1860, 47, 2358, 1294, 3796, 100, 66, 177, 57, 75)
    ,(1860, 48, 2436, 1320, 3868, 102, 68, 181, 57, 76)
    ,(1860, 49, 2474, 1347, 3943, 105, 69, 186, 58, 78)
    ,(1860, 50, 2527, 1391, 4013, 107, 71, 190, 59, 123)
    ,(1860, 51, 2560, 1435, 4068, 109, 72, 194, 60, 127)
    ,(1860, 52, 2661, 1481, 4136, 112, 74, 198, 62, 128)
    ,(1860, 53, 2757, 1527, 4207, 114, 75, 203, 63, 131)
    ,(1860, 54, 2840, 1573, 4302, 115, 76, 207, 64, 133)
    ,(1860, 55, 2876, 1620, 4362, 119, 79, 211, 65, 135)
    ,(1860, 56, 3006, 1666, 4428, 121, 80, 215, 66, 139)
    ,(1860, 57, 3110, 1714, 4500, 123, 81, 220, 67, 142)
    ,(1860, 58, 3222, 1763, 4579, 125, 82, 224, 68, 144)
    ,(1860, 59, 3318, 1824, 4673, 127, 83, 230, 69, 147)
    ,(1860, 60, 3419, 1874, 4745, 129, 85, 249, 70, 150)

    -- Stats for creature #1863: Succubus
    ,(1863, 1, 40, 48, 20, 12, 14, 1, 1, 25)
    ,(1863, 2, 49, 59, 40, 14, 15, 2, 1, 26)
    ,(1863, 3, 58, 70, 60, 15, 16, 4, 1, 27)
    ,(1863, 4, 68, 81, 80, 17, 17, 8, 2, 27)
    ,(1863, 5, 77, 92, 100, 18, 18, 12, 2, 28)
    ,(1863, 6, 86, 103, 120, 20, 19, 16, 3, 29)
    ,(1863, 7, 95, 114, 140, 22, 20, 21, 3, 29)
    ,(1863, 8, 104, 125, 160, 23, 21, 25, 4, 30)
    ,(1863, 9, 113, 136, 180, 25, 22, 29, 4, 31)
    ,(1863, 10, 123, 147, 200, 26, 23, 33, 5, 31)
    ,(1863, 11, 132, 158, 220, 28, 25, 38, 6, 32)
    ,(1863, 12, 150, 180, 240, 29, 26, 42, 8, 33)
    ,(1863, 13, 169, 203, 280, 31, 27, 46, 9, 34)
    ,(1863, 14, 189, 227, 320, 33, 28, 50, 11, 35)
    ,(1863, 15, 209, 251, 360, 34, 29, 55, 14, 35)
    ,(1863, 16, 229, 275, 400, 36, 30, 59, 16, 36)
    ,(1863, 17, 250, 300, 460, 37, 31, 63, 20, 37)
    ,(1863, 18, 262, 314, 510, 39, 32, 67, 24, 38)
    ,(1863, 19, 293, 351, 550, 40, 33, 72, 29, 39)
    ,(1863, 20, 303, 377, 563, 42, 35, 67, 31, 49)
    ,(1863, 21, 325, 393, 604, 44, 36, 80, 53, 39)
    ,(1863, 22, 349, 420, 628, 46, 36, 84, 54, 41)
    ,(1863, 23, 373, 447, 652, 47, 38, 89, 56, 42)
    ,(1863, 24, 400, 476, 675, 49, 39, 93, 57, 43)
    ,(1863, 25, 440, 504, 699, 50, 40, 97, 60, 44)
    ,(1863, 26, 469, 534, 721, 52, 41, 101, 62, 46)
    ,(1863, 27, 501, 564, 745, 53, 42, 105, 63, 47)
    ,(1863, 28, 534, 592, 768, 55, 43, 110, 65, 48)
    ,(1863, 29, 566, 620, 791, 57, 44, 114, 67, 49)
    ,(1863, 30, 599, 648, 815, 57, 46, 118, 69, 51)
    ,(1863, 31, 631, 676, 838, 59, 47, 123, 71, 52)
    ,(1863, 32, 680, 720, 862, 60, 47, 127, 73, 53)
    ,(1863, 33, 728, 742, 884, 62, 49, 131, 74, 54)
    ,(1863, 34, 661, 793, 908, 64, 50, 135, 76, 56)
    ,(1863, 35, 699, 845, 950, 63, 51, 136, 73, 57)
    ,(1863, 36, 737, 879, 990, 67, 52, 137, 72, 58)
    ,(1863, 37, 776, 916, 1038, 69, 53, 138, 70, 59)
    ,(1863, 38, 814, 952, 1095, 70, 55, 139, 69, 61)
    ,(1863, 39, 852, 988, 1163, 72, 56, 142, 68, 62)
    ,(1863, 40, 890, 1026, 1244, 74, 57, 147, 67, 64)
    ,(1863, 41, 928, 1063, 1338, 77, 58, 152, 68, 66)
    ,(1863, 42, 976, 1103, 1448, 81, 59, 156, 70, 67)
    ,(1863, 43, 1005, 1187, 1560, 87, 60, 160, 72, 69)
    ,(1863, 44, 1043, 1214, 1670, 91, 61, 164, 74, 71)
    ,(1863, 45, 1081, 1240, 1738, 96, 64, 169, 75, 72)
    ,(1863, 46, 1119, 1267, 1773, 98, 65, 173, 77, 73)
    ,(1863, 47, 1158, 1294, 1808, 100, 66, 177, 78, 75)
    ,(1863, 48, 1196, 1320, 1843, 102, 68, 181, 80, 76)
    ,(1863, 49, 1234, 1347, 1878, 105, 69, 186, 82, 78)
    ,(1863, 50, 1277, 1391, 1912, 107, 71, 190, 84, 80)
    ,(1863, 51, 1320, 1435, 1945, 109, 72, 194, 86, 81)
    ,(1863, 52, 1364, 1481, 1984, 112, 74, 198, 88, 83)
    ,(1863, 53, 1407, 1527, 2020, 114, 75, 203, 90, 85)
    ,(1863, 54, 1450, 1573, 2056, 116, 77, 207, 92, 87)
    ,(1863, 55, 1493, 1620, 2089, 119, 79, 211, 94, 88)
    ,(1863, 56, 1536, 1666, 2113, 121, 80, 215, 96, 90)
    ,(1863, 57, 1580, 1714, 2156, 123, 82, 220, 99, 92)
    ,(1863, 58, 1623, 1763, 2189, 125, 84, 224, 101, 94)
    ,(1863, 59, 1666, 1824, 2230, 128, 86, 228, 103, 96)
    ,(1863, 60, 1709, 1874, 2261, 130, 87, 232, 106, 98)
;

-- Insert battleground templates ---------------------------------------------
INSERT INTO `battleground_template`
    (`id`, `MinPlayersPerTeam`, `MaxPlayersPerTeam`, `MinLvl`, `MaxLvl`, `AllianceStartLoc`, `AllianceStartO`, `HordeStartLoc`, `HordeStartO`)
VALUES
     (1,   20,                  40,                  51,       60,       611,                2.72532,          610,             2.27452)
    ,(2,   5,                   10,                  10,       60,       769,                3.14159,          770,             3.14159)
    ,(3,   8,                   15,                  20,       60,       890,                3.40156,          889,             0.263892)
;

-- Insert instance / raid templates ------------------------------------------
INSERT INTO `instance_template`
    (`map`, `parent`,   `levelMin`, `levelMax`, `maxPlayers`,   `reset_delay`,  `ghostEntranceMap`, `ghostEntranceX`,   `ghostEntranceY`)
VALUES
     (33,   0,          20,         26,         10,             0,              0,                  -230.989,           1571.57)    -- instance_shadowfang_keep
    ,(34,   0,          22,         34,         10,             0,              0,                  -8762.38,           848.01)     -- instance_stormwind_stockade
    ,(36,   0,          17,         26,         10,             0,              0,                  -11207.8,           1681.15)    -- instance_deadmines
    ,(43,   0,          17,         24,         10,             0,              1,                  -751.131,           -2209.24)   -- instance_wailing_caverns
    ,(47,   0,          24,         40,         10,             0,              1,                  -4459.45,           -1660.21)   -- instance_razorfen_kraul
    ,(48,   0,          20,         34,         10,             0,              1,                  4249.12,            748.387)    -- instance_blackfathom_deeps
    ,(70,   0,          41,         51,         10,             0,              0,                  -6060.18,           -2955)      -- instance_uldaman
    ,(90,   0,          24,         40,         10,             0,              0,                  -5162.66,           931.599)    -- instance_gnomeregan
    ,(109,  0,          50,         0,          10,             0,              0,                  -10170.1,           -3995.97)   -- instance_sunken_temple
    ,(129,  0,          33,         47,         10,             0,              1,                  -4662.88,           -2535.87)   -- instance_razorfen_downs
    ,(189,  0,          29,         48,         10,             0,              0,                  2892.24,            -811.264)   -- instance_scarlet_monastery
    ,(209,  0,          43,         54,         10,             0,              1,                  -6790.58,           -2891.28)   -- instance_zulfarrak
    ,(229,  0,          55,         0,          10,             3,              0,                  -7522.53,           -1233.04)   -- instance_blackrock_spire
    ,(230,  0,          48,         60,         5,              0,              0,                  -7178.1,            -928.639)   -- instance_blackrock_depths
    ,(249,  0,          60,         60,         40,             5,              1,                  -4753.31,           -3752.42)   -- instance_onyxias_lair
    ,(289,  0,          58,         0,          5,              0,              0,                  1274.78,            -2552.56)   -- instance_scholomance
    ,(309,  0,          60,         60,         20,             3,              0,                  -11916.1,           -1224.58)   -- instance_zulgurub
    ,(329,  0,          58,         0,          5,              0,              0,                  3392.32,            -3378.48)   -- instance_stratholme
    ,(349,  0,          40,         58,         10,             0,              1,                  -1432.7,            2924.98)    -- instance_maraudon
    ,(389,  0,          13,         22,         10,             0,              1,                  1816.76,            -4423.37)   -- instance_ragefire_chasm
    ,(409,  0,          60,         60,         40,             7,              0,                  -7510.56,           -1036.7)    -- instance_molten_core
    ,(429,  0,          55,         0,          5,              0,              1,                  -3908.03,           1130)       -- instance_dire_maul
    ,(469,  0,          60,         60,         40,             7,              0,                  -7663.41,           -1218.67)   -- instance_blackwing_lair
    ,(509,  0,          60,         60,         20,             3,              1,                  -8114.46,           1526.37)    -- instance_ruins_of_ahnqiraj
    ,(531,  0,          60,         60,         40,             7,              1,                  -8111.72,           1526.79)    -- instance_ahnqiraj_temple
    ,(533,  0,          60,         60,         40,             7,              0,                  0,                  0)          -- instance_naxxramas
;

-- Insert area triggers for instances / raids --------------------------------
INSERT INTO `areatrigger_teleport`
    (`target_position_x`, `target_position_y`, `target_position_z`, `target_map`, `target_orientation`, `id`, `name`)
VALUES
     (-232.796,           1568.28,              76.8909,            0,            4.398,                194,    'Shadowfang Keep - Entrance - Outside')
    ,(-229.135,           2109.18,              76.8898,            33,           1.267,                145,    'Shadowfang Keep - Entrance - Inside')
    ,(-8764.83,           846.075,              87.4842,            0,            3.77934,              503,    'Stormwind Stockade - Entrance - Outside')
    ,(54.23,              0.28,                 -18.34,             34,           6.26,                 101,    'Stormwind Stockade - Entrance - Inside')
    ,(-11208.3,           1672.52,              24.66,              0,            4.55217,              119,    'Deadmines - Entrance - Outside')
    ,(-16.4,              -383.07,              61.78,              36,           1.86,                 78,     'Deadmines - Entrance - Inside')
    ,(-11339.4,           1571.16,              100.56,             0,            0,                    121,    'Deadmines - Exit - South side')
    ,(-163.49,            132.9,                -73.66,             43,           5.83,                 228,    'Wailing Caverns - Entrance - Inside')
    ,(-740.059,           -2214.23,             16.1374,            1,            5.68,                 226,    'Wailing Caverns - Caverns of Mist - Entrance - Outside')
    ,(-4464.92,           -1666.24,             90,                 1,            0,                    242,    'Razorfen Kraul - Entrance - Outside')
    ,(1943,               1544.63,              82,                 47,           1.38,                 244,    'Razorfen Kraul - Entrance - Inside')
    ,(4247.74,            745.879,              -24.5299,           1,            4.5828,               259,    'Blackfathom Deeps - Entrance - Outside')
    ,(-151.89,            106.96,               -39.87,             48,           4.53,                 257,    'Blackfathom Deeps - Entrance - Inside')
    ,(-6066.73,           -2955.63,             209.776,            0,            3.20443,              288,    'Uldaman - Dig One - Entrance - Outside')
    ,(-214.02,            383.607,              -38.7687,           70,           0.5,                  902,    'Uldaman - Echomok Caverns - Side Entrance - Inside')
    ,(-6620.48,           -3765.19,             266.226,            0,            3.13531,              882,    'Dustwind Gulch - Uldaman - Entrance - Outside')
    ,(-226.8,             49.09,                -46.03,             70,           1.39,                 286,    'Uldaman - Hall of the Keepers - Entrance - Entrance - Inside')
    ,(-5163.33,           927.623,              257.188,            0,            0,                    322,    'Gnomeregan - Entrance - Outside')
    ,(-332.22,            -2.28,                -150.86,            90,           2.77,                 324,    'Gnomeregan - The Clockwerk Run - Entrance - Inside')
    ,(-4858.27,           756.435,              244.923,            0,            0,                    525,    'Gnomeregan - Train Depot - Entrance - Outside')
    ,(-736.51,            2.71,                 -249.99,            90,           3.14,                 523,    'Gnomeregan - Train Depot - Entrance - Inside')
    ,(-10175.1,           -3995.15,             -112.9,             0,            2.95938,              448,    'Sunken Temple - Entrance - Outside')
    ,(-319.24,            99.9,                 -131.85,            109,          3.19,                 446,    'Sunken Temple - Entrance - Inside')
    ,(-4658.12,           -2526.35,             81.492,             1,            1.25978,              444,    'Razorfen Downs - Entrance - Outside')
    ,(2592.55,            1107.5,               51.29,              129,          4.74,                 442,    'Razorfen Downs - Entrance - Inside')
    ,(2913.92,            -802.404,             160.333,            0,            3.50405,              602,    'Scarlet Monastery - Graveyard - Entrance - Outside')
    ,(1688.99,            1053.48,              18.6775,            189,          0.00117,              45,     'Scarlet Monastery - Graveyard - Entrance - Inside')
    ,(2870.9,             -820.164,             160.333,            0,            0.387856,             608,    'Scarlet Monastery - Library - Entrance - Outside')
    ,(255.346,            -209.09,              18.6773,            189,          6.26656,              614,    'Scarlet Monastery - Library - Entrance - Inside')
    ,(2884.45,            -822.01,              160.333,            0,            1.95268,              606,    'Scarlet Monastery - Armory - Entrance - Outside')
    ,(1610.83,            -323.433,             18.6738,            189,          6.28022,              612,    'Scarlet Monastery - Armory - Entrance - Inside')
    ,(2906.14,            -813.772,             160.333,            0,            1.95739,              604,    'Scarlet Monastery - Cathedral - Entrance - Outside')
    ,(855.683,            1321.5,               18.6709,            189,          0.001747,             610,    'Scarlet Monastery - Cathedral - Entrance - Inside')
    ,(-6796.49,           -2890.77,             8.88063,            1,            3.30496,              922,    "Zul'Farrak - Entrance - Outside")
    ,(1213.52,            841.59,               8.93,               209,          6.09,                 924,    "Zul'Farrak - Entrance - Inside")
    ,(-7524.19,           -1230.13,             285.743,            0,            2.09544,              1470,   'Blackrock Spire - Entrance - Outside')
    ,(78.5083,            -225.044,             49.839,             229,          5.1,                  1468,   'Blackrock Spire - Entrance - Inside')
    ,(-7524.19,           -1230.13,             285.743,            0,            2.09544,              2068,   'Blackrock Spire - Fall out')
    ,(-7179.63,           -923.667,             166.416,            0,            1.84097,              1472,   'Blackrock Depths - Entrance - Outside')
    ,(458.32,             26.52,                -70.67,             230,          4.95,                 1466,   'Blackrock Depths - Entrance - Inside')
    ,(1115.35,            -457.35,              -102.7,             230,          0.5,                  2890,   'Blackrock Depths - Molten Core - Entrance - Outside')
    ,(-4747.17,           -3753.27,             49.8122,            1,            0.713271,             1064,   "Onyxia's Lair - Entrance - Outside")
    ,(29.1607,            -71.3372,             -8.18032,           249,          4.58,                 2848,   "Onyxia's Lair - Entrance - Inside")
    ,(1275.05,            -2552.03,             90.3994,            0,            3.6631,               2568,   'Scholomance - Entrance - Outside')
    ,(196.37,             127.05,               134.91,             289,          6.09,                 2567,   'Scholomance - Entrance - Inside')
    ,(-11916.3,           -1208.37,             92.2868,            0,            1.61792,              3930,   "Zul'Gurub - Entrance - Outside")
    ,(-11916.1,           -1230.53,             92.5334,            309,          4.71867,              3928,   "Zul'Gurub - Entrance - Inside")
    ,(3235.46,            -4050.6,              108.45,             0,            1.93522,              2221,   'Stratholme - Eastwall Gate - Entrance - Outside')
    ,(3593.15,            -3646.56,             138.5,              329,          5.33,                 2214,   'Stratholme - Eastwall Gate - Entrance - Inside')
    ,(3395.09,            -3380.25,             142.702,            329,          0.1,                  2217,   'Stratholme - Main Entrance - Left - Entrance - Inside')
    ,(3395.09,            -3380.25,             142.702,            329,          0.1,                  2216,   'Stratholme - Main Entrance - Right - Entrance - Inside')
    ,(-1186.98,           2875.95,              85.7258,            1,            1.78443,              3126,   'Maraudon - Purple - Entrance - Outside')
    ,(752.91,             -616.53,              -33.11,             349,          1.37,                 3134,   'Maraudon - Purple - Entrance - Inside')
    ,(1019.69,            -458.31,              -43.43,             349,          0.31,                 3133,   'Maraudon - Orange - Entrance - Inside')
    ,(-1471.07,           2618.57,              76.1944,            1,            0,                    3131,   'Maraudon - Orange - Entrance - Outside')
    ,(1813.49,            -4418.58,             -18.57,             1,            1.78,                 2226,   'Ragefire Chasm - Entrance - Outside')
    ,(3.81,               -14.82,               -17.84,             389,          4.39,                 2230,   'Ragefire Chasm - Entrance - Inside')
    ,(1096,               -467,                 -104.6,             409,          3.64,                 2886,   'Molten Core - The Molten Bridge - Entrance - Inside')
    ,(1096,               -467,                 -104.6,             409,          3.64,                 3528,   'Molten Core - Window - Entrance - Inside')
    ,(1096,               -467,                 -104.6,             409,          3.64,                 3529,   'Molten Core - Window(Lava) - Entrance - Inside')
    ,(-3737.48,           934.975,              160.973,            1,            3.13864,              3194,   'Dire Maul - East - Entrance - Outside')
    ,(44.4499,            -154.822,             -2.71201,           429,          0,                    3183,   'Dire Maul - East - Entrance - Inside')
    ,(-3980.58,           776.193,              161.006,            1,            0,                    3195,   'Dire Maul - East - Side Entrance - Outside')
    ,(-201.11,            -328.66,              -2.72,              429,          5.22,                 3184,   'Dire Maul - East - Side Entrance - Entrance - Inside')
    ,(-4030.21,           127.966,              26.8109,            1,            0,                    3196,   'Dire Maul - East - Lariss Pavilion - Entrance - Outside')
    ,(9.31119,            -837.085,             -32.5305,           429,          0,                    3185,   'Dire Maul - East - Lariss Pavilion - Entrance - Inside')
    ,(-3577.67,           841.859,              134.594,            1,            0,                    3197,   'Dire Maul - East - Alzzin - Exit - Outside')
    ,(-3831.79,           1250.23,              160.223,            1,            0,                    3190,   'Dire Maul - West - Left - Entrance - Outside')
    ,(31.5609,            159.45,               -3.4777,            429,          0.01,                 3187,   'Dire Maul - West - Left - Entrance - Inside')
    ,(-3747.96,           1249.18,              160.217,            1,            3.15827,              3191,   'Dire Maul - West - Right - Entrance - Outside')
    ,(-62.9658,           159.867,              -3.46206,           429,          3.14788,              3186,   'Dire Maul - West - Right - Entrance - Inside')
    ,(-3520.65,           1077.72,              161.138,            1,            1.5009,               3193,   'Dire Maul - North - Entrance - Outside')
    ,(255.249,            -16.0561,             -2.58737,           429,          4.7,                  3189,   'Dire Maul - North - Entrance - Inside')
    ,(-7666.23,           -1102.79,             399.68,             469,          0.601256,             3726,   'Blackwing Lair - Entrance - Inside')
    ,(-8418.5,            1505.94,              31.8232,            1,            0,                    4006,   "Ruins Of Ahn'Qiraj - Entrance - Outside")
    ,(-8429.74,           1512.14,              31.9074,            509,          2.58,                 4008,   "Ruins Of Ahn'Qiraj - Entrance - Inside")
    ,(-8242.67,           1992.06,              129.072,            1,            0,                    4012,   "Ahn'Qiraj Temple - Entrance - Outside")
    ,(-8231.33,           2010.6,               129.861,            531,          0,                    4010,   "Ahn'Qiraj Temple - Entrance - Inside")
    ,(3005.87,            -3435.01,             293.882,            533,          0,                    4055,   'Naxxramas - Entrance - Inside')
    ,(3498.28,            -5349.9,              144.968,            533,          1.31324,              4156,   "Naxxramas - Sapphiron's Lair - Entrance - Inside")
;

-- Insert area triggers for battlegrounds ------------------------------------
INSERT INTO `areatrigger_teleport`
    (`target_position_x`, `target_position_y`, `target_position_z`, `target_map`, `target_orientation`, `id`, `name`)
VALUES
     (534.868,            -1087.68,             106.119,            0,            3.35758,              2606,   'Alterac Valley - Horde - Entrance - Outside')
    ,(98.432,             -182.274,             127.52,             0,            5.02654,              2608,   'Alterac Valley - Alliance - Entrance - Outside')
    ,(-1198,              -2533,                22,                 0,            0,                    3948,   'Arathi Basin - Refuge Point - Entrance - Outside')
    ,(-817,               -3509,                73,                 0,            0,                    3949,   'Arathi Basin - Hammerfall - Entrance - Outside')
;

-- Insert area triggers for world locations ----------------------------------
INSERT INTO `areatrigger_teleport`
    (`target_position_x`, `target_position_y`, `target_position_z`, `target_map`, `target_orientation`, `id`, `name`)
VALUES
     (-9015.97,           875.318,              148.617,            0,            0,                    702,    'Stormwind - Wizard Sanctum - Entrance - Outside')
    ,(-9019.16,           887.596,              29.6206,            0,            0,                    704,    'Stormwind - Wizard Sanctum - Exit - Inside')
    ,(-8762.45,           403.062,              103.902,            0,            5.34463,              2534,   'Stormwind City - Champions Hall - Entrance - Outside')
    ,(-0.299116,          4.39156,              -0.255884,          449,          1.54805,              2532,   'Stormwind City - Champions Hall - Entrance - Inside')
    ,(221.322,            74.4933,              25.7195,            450,          0.484836,             2527,   'Orgrimmar - Hall of Legends - Entrance - Inside')
    ,(1637.32,            -4242.7,              56.1827,            1,            4.1927,               2530,   'Orgrimmar - Hall of Legends - Entrance - Outside')
    ,(8786.36,            967.445,              30.197,             1,            3.39632,              527,    "Teldrassil - Rut'theran Village")
    ,(9945.13,            2616.89,              1316.46,            1,            4.61446,              542,    'Teldrassil - Darnassus')
    ,(-5187.47,           -2804.32,             -8.375,             1,            5.76,                 943,    'Leap of Faith - End of fall')
;

-- Insert transport game objects ---------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
    -- Fixed location transport objects --------------------------------------
     (4170,   @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, left entrance
    ,(4171,   @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, left entrance
    ,(11898,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thousand Needles, Barrens + Freewind Post
    ,(11899,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thousand Needles, Barrens + Freewind Post
    ,(20649,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, left entrance
    ,(20650,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, left entrance upper doors
    ,(20651,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, left entrance lower doors
    ,(20652,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, right entrance
    ,(20653,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, right entrance upper doors
    ,(20654,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, right entrance lower doors
    ,(20655,  @GO_TYPE_TRANSPORT,     455,        "Undervator"                      ) -- Undercity elevator, middle entrance
    ,(20656,  @GO_TYPE_TRANSPORT,     462,        "upperLdoor"                      ) -- Undercity elevator, middle entrance upper doors
    ,(20657,  @GO_TYPE_TRANSPORT,     462,        "lowerLdoor"                      ) -- Undercity elevator, middle entrance lower doors
    ,(47296,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, upper entrance
    ,(47297,  @GO_TYPE_TRANSPORT,     360,        "Mesa Elevator"                   ) -- Thunder Bluff, upper entrance
    ,(80022,  @GO_TYPE_TRANSPORT,     808,        "Plunger"                         ) -- Gnomeregan above ground,elevator
    ,(80023,  @GO_TYPE_TRANSPORT,     807,        "Vator"                           ) -- Gnomeregan above ground,elevator
    ,(85556,  @GO_TYPE_TRANSPORT,     852,        "Vator2"                          ) -- Gnomeregan instance, elevator
    ,(149045, @GO_TYPE_TRANSPORT,    2454,        "Scaffold Cars"                   ) -- Burning Steps elevator, The Cauldron
    ,(149046, @GO_TYPE_TRANSPORT,    2454,        "Scaffold Cars"                   ) -- Burning Steps elevator, The Cauldron
    ,(152614, @GO_TYPE_TRANSPORT,    1587,        "Elevator"                        ) -- Gnomish in-house elevator
    ,(176080, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176081, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176082, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176083, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176084, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176085, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts
    ,(176086, @GO_TYPE_TRANSPORT,    3831,        "Subway"                          ) -- Deeprun Tram carts

    -- Mobile transports following a taxi path -------------------------------
    ,(20808,  @GO_TYPE_MO_TRANSPORT, 3015,        "Booty Bay Ship"                  ) -- Booty Bay <-> Ratchet
    ,(164871, @GO_TYPE_MO_TRANSPORT, 3031,        "Orgrimmar - Undercity"           ) -- Orgrimmar <-> Undercity
    ,(175080, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Orgrimmar"  ) -- Grom'Gol <-> Orgrimmar
    ,(176231, @GO_TYPE_MO_TRANSPORT, 3015,        "Proudmore's Treasure"            ) -- Menethil Harbor <-> Theramore Isle
    ,(176244, @GO_TYPE_MO_TRANSPORT, 3015,        "Moonspray"                       ) -- Teldrassil <-> Auberdine
    ,(176310, @GO_TYPE_MO_TRANSPORT, 3015,        "Serenity's Shore"                ) -- Menethil Harbor <-> Auberdine
    ,(176495, @GO_TYPE_MO_TRANSPORT, 3031,        "Grom'Gol Base Camp - Undercity"  ) -- Grom'Gol <-> Undercity
    ,(177233, @GO_TYPE_MO_TRANSPORT, 3015,        "Feathermoon Ferry"               ) -- Feathermoon <-> Forgotten Coast
    ,(181056, @GO_TYPE_MO_TRANSPORT, 6637,        "Naxxramas"                       ) -- Naxxramas Citadel roaming over the Eastern Plaguelands
;

-- Configure fixed location transport game objects ---------------------------
UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT
WHERE `entry` IN (21653, 21654, 21655, 21656, 32056, 32057, 80024);

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN
WHERE
    `entry` IN (4170, 4171, 11898, 11899, 20649, 20650, 20651, 20652, 20653, 20654, 20655, 20656, 20657, 47296, 47297, 80022, 80023, 85556, 149045, 149046, 152614);

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN
WHERE `entry` IN (176080, 176081, 176082, 176083, 176084, 176085, 176086);

-- Configure mobile transport game objects -----------------------------------
UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 241, `data1` = 30, `data2` = 1,
    `data5` = 1,
    `data6` = 593
WHERE `entry` = 20808;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 302, `data1` = 30, `data2` = 1,
    `data6` = 591
WHERE `entry` = 164871;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 285, `data1` = 30, `data2` = 1,
    `data6` = 589
WHERE `entry` = 175080;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 292, `data1` = 30, `data2` = 1,
    `data6` = 584
WHERE `entry` = 176231;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 293, `data1` = 30, `data2` = 1,
    `data6` = 582
WHERE `entry` = 176244;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 295, `data1` = 30, `data2` = 1,
    `data6` = 588
WHERE `entry` = 176310;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 301, `data1` = 30, `data2` = 1,
    `data6` = 590
WHERE `entry` = 176495;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 303, `data1` = 30, `data2` = 1,
    `data6` = 587
WHERE `entry` = 177233;

UPDATE `gameobject_template`
SET
    `flags` = @GO_FLAG_TRANSPORT | @GO_FLAG_NODESPAWN,
    `data0` = 436
WHERE `entry` = 181056;

-- Insert stationery transports ----------------------------------------------
INSERT INTO `gameobject`
    (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
     (1,          4170,   1,    -1286.24,      189.72,       130.08,    -1.07338,        0,           0,           -0.511294,    0.859406,    900,             100,           1)
    ,(2,          4171,   1,    -1308.38,      185.29,      68.5858,   -0.270525,        0,           0,            -0.13485,    0.990866,    900,             100,           1)
    ,(3,         11898,   1,    -4665.43,    -1827.67,      85.4053,    0.061086,        0,           0,            0.030538,    0.999534,    180,             100,           1)
    ,(4,         11898,   1,    -5399.19,    -2504.62,      89.0211,     2.60927,        0,           0,            0.964787,    0.263032,    180,             100,           1)
    ,(5,         11898,  47,     1734.57,     1372.33,      85.4053,    0.061086,        0,           0,            0.030538,    0.999534,   3600,             100,           1)
    ,(6,         11899,   1,    -4670.77,    -1849.61,     -44.1442,    -0.18326,        0,           0,           -0.091502,    0.995805,    180,             100,           1)
    ,(7,         11899,   1,     -5382.5,    -2489.42,     -40.5284,     2.36492,        0,           0,             0.92554,    0.378649,    180,             100,           1)
    ,(8,         11899,  47,     1729.23,     1350.39,     -44.1443,    -0.18326,        0,           0,           -0.091502,    0.995805,   3600,             100,           1)
    ,(9,         20649,   0,     1596.15,       291.8,      14.6822,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(10,        20650,   0,     1596.04,     282.738,      55.3952,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(11,        20651,   0,     1596.21,     302.401,     -40.6645,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(12,        20652,   0,     1595.26,     188.644,     -40.7835,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(13,        20653,   0,     1595.38,     197.706,      55.3952,     1.56207,        0,           0,            0.704015,    0.710185,    900,             100,           1)
    ,(14,        20654,   0,     1595.21,     178.693,     -40.5223,    -1.57952,        0,           0,           -0.710186,    0.704014,    900,             100,           1)
    ,(15,        20655,   0,     1544.24,     240.773,     -40.7835,   -0.008727,        0,           0,           -0.004363,     0.99999,    900,             100,           1)
    ,(16,        20656,   0,      1553.3,     240.656,      55.3952,   -0.008727,        0,           0,           -0.004363,     0.99999,    900,             100,           1)
    ,(17,        20657,   0,     1533.88,     240.826,     -32.3473,     3.13287,        0,           0,             0.99999,    0.004363,    900,             100,           1)
    ,(18,        47296,   1,    -1028.04,    -28.3568,      69.0226,      2.9147,        0,           0,            0.993572,    0.113203,    900,             100,           1)
    ,(19,        47297,   1,    -1037.27,    -49.2355,      140.495,     3.07178,        0,           0,            0.999391,    0.034899,    900,             100,           1)
    ,(20,        80022,   0,    -5164.47,     648.442,      362.099,     1.49226,        0,           0,            0.678801,    0.734323,    900,             100,           1)
    ,(21,        80023,   0,    -5164.24,     650.354,       349.52,     1.49226,        0,           0,            0.678801,    0.734323,    900,             100,           1)
    ,(22,        85556,  90,    -806.887,     323.963,     -271.656,     2.21308,        0,           0,            0.894154,    0.447759,   3600,             100,           1)
    ,(23,       149045,   0,    -6904.81,    -1206.78,      178.512,     2.98451,        0,           0,            0.996917,    0.078459,   7200,             100,           1)
    ,(24,       149045, 469,    -6904.81,    -1206.78,      178.512,      2.9845,        0,           0,            0.996917,   0.0784656,    180,             255,           1)
    ,(25,       149046,   0,    -6900.42,    -1339.33,      239.652,    -2.88852,        0,           0,            0.992005,   -0.126199,   7200,             100,           1)
    ,(26,       149046, 469,    -6900.42,    -1339.33,      239.652,    -2.88851,        0,           0,           -0.992004,    0.126204,    180,             255,           1)
    ,(27,       152614,   0,    -5067.46,     438.984,      423.758,     2.53945,        0,           0,             0.95502,    0.296542,    900,             100,           1)
    ,(28,       152614,   1,      2263.7,    -5565.56,      33.9385,    -1.09956,        0,           0,           -0.522498,     0.85264,    180,             100,           1)
;

-- Insert mobile transports ----------------------------------------------
INSERT INTO `gameobject`
    (`guid`,    `id`,   `map`,  `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`)
VALUES
     (29,       176080, 369,    -45.3934,     2472.93,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(30,       176081, 369,     4.52807,     8.43529,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(31,       176082, 369,    -45.4005,     2492.79,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(32,       176083, 369,    -45.4007,     2512.15,      6.90526,      1.5708,        0,           0,            0.707107,    0.707107,    120,               0,           1)
    ,(33,       176084, 369,     4.58065,     28.2097,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(34,       176085, 369,     4.49883,    -11.3475,      6.90526,      1.5708,        0,           0,           -0.707107,    0.707107,    120,               0,           1)
    ,(35,       181056,   0,     3157.28,    -3743.47,      236.951,     2.76712,        0,           0,            0.982523,    0.186143,     25,             100,           1)
;

-- Insert mobile transports --------------------------------------------------
INSERT INTO `transports`
    (`entry`,   `name`,                                         `period`)
VALUES
     (20808,     "Ratchet and Booty Bay",                        350818)
    ,(164871,    "Orgrimmar and Undercity",                      356284)
    ,(175080,    "Grom'Gol Base Camp and Orgrimmar",             303463)
    ,(176231,    "Menethil Harbor and Theramore Isle",           329313)
    ,(176244,    "Teldrassil and Auberdine",                     316251)
    ,(176310,    "Menethil Harbor and Auberdine",                295579)
    ,(176495,    "Grom'Gol Base Camp and Undercity",             333044)
    ,(177233,    "Forgotton Coast and Feathermoon Stronghold",   317038)
;

-- Insert area trigger for Deeprun train -------------------------------------
INSERT INTO `areatrigger_teleport`
    (`id`,  `name`,                                         `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`)
VALUES
     (2166, 'Deeprun Tram - Ironforge Instance (Inside)',   0,            -4838.95,            -1318.46,             501.868,            1.42372)
    ,(2171, 'Deeprun Tram - Stormwind Instance (Inside)',   0,            -8364.57,             535.981,             91.7969,            2.24619)
    ,(2173, 'Deeprun Tram - Stormwind Instance',            369,           68.3006,             2490.91,            -4.29647,            3.12192)
    ,(2175, 'Deeprun Tram - Ironforge Instance',            369,           69.2542,              10.257,            -4.29664,            3.09832)
;

-- Insert spell affect data --------------------------------------------------
INSERT INTO `spell_affect`
    (`entry`, `effectId`, `SpellFamilyMask`)
VALUES
     (11083,0,12714007)
    ,(11115,0,146931735)
    ,(11124,0,146931735)
    ,(11170,0,1090394871)
    ,(11242,0,4096)
    ,(11247,0,8192)
    ,(11367,0,146931735)
    ,(11368,0,146931735)
    ,(11369,0,146931735)
    ,(11370,0,146931735)
    ,(12042,0,551557879)
    ,(12042,1,551557879)
    ,(12042,2,551557879)
    ,(12285,0,1)
    ,(12288,0,8)
    ,(12288,1,8)
    ,(12301,0,256)
    ,(12351,0,12714007)
    ,(12378,0,146931735)
    ,(12398,0,146931735)
    ,(12399,0,146931735)
    ,(12400,0,146931735)
    ,(12467,0,4096)
    ,(12469,0,4096)
    ,(12536,0,549460727)
    ,(12593,1,551557879)
    ,(12697,0,1)
    ,(12707,0,8)
    ,(12707,1,8)
    ,(12818,0,256)
    ,(12842,0,2359296)
    ,(12982,0,1090394871)
    ,(12983,0,1090394871)
    ,(12984,0,1090394871)
    ,(12985,0,1090394871)
    ,(13742,0,96)
    ,(13743,0,64)
    ,(13872,0,96)
    ,(13875,0,64)
    ,(13975,1,4194304)
    ,(13976,0,1792)
    ,(13979,0,1792)
    ,(13980,0,1792)
    ,(13981,0,16779264)
    ,(14062,1,4194304)
    ,(14063,1,4194304)
    ,(14064,1,4194304)
    ,(14065,1,4194304)
    ,(14066,0,16779264)
    ,(14067,0,16779264)
    ,(14082,0,1280)
    ,(14083,0,1280)
    ,(14113,0,268558336)
    ,(14114,0,268558336)
    ,(14115,0,268558336)
    ,(14116,0,268558336)
    ,(14117,0,268558336)
    ,(14143,0,67109382)
    ,(14149,0,67109382)
    ,(14168,0,524288)
    ,(14169,0,524288)
    ,(14174,0,2097152)
    ,(14175,0,2097152)
    ,(14176,0,2097152)
    ,(14909,1,1048704)
    ,(15017,1,1048704)
    ,(15058,0,2233056)
    ,(15059,0,2233056)
    ,(15060,0,2233056)
    ,(16035,0,2416967683)
    ,(16038,0,1073741824)
    ,(16039,0,2416967683)
    ,(16041,0,3)
    ,(16043,0,8)
    ,(16043,1,536870912)
    ,(16086,0,32)
    ,(16086,1,134217728)
    ,(16086,2,4)
    ,(16089,0,20723008519)
    ,(16105,0,2416967683)
    ,(16106,0,2416967683)
    ,(16106,1,268435456)
    ,(16107,0,2416967683)
    ,(16108,0,2416967683)
    ,(16109,0,2416967683)
    ,(16110,0,2416967683)
    ,(16111,0,2416967683)
    ,(16112,0,2416967683)
    ,(16117,0,3)
    ,(16118,0,3)
    ,(16119,0,3)
    ,(16120,0,3)
    ,(16130,0,8)
    ,(16130,1,536870912)
    ,(16160,0,1073741824)
    ,(16161,0,1073741824)
    ,(16166,0,2416967683)
    ,(16166,1,2416967683)
    ,(16173,0,537395200)
    ,(16181,0,448)
    ,(16183,0,256)
    ,(16184,0,512)
    ,(16184,1,512)
    ,(16187,0,24576)
    ,(16189,0,67362816)
    ,(16205,0,24576)
    ,(16206,0,24576)
    ,(16207,0,24576)
    ,(16208,0,24576)
    ,(16209,1,512)
    ,(16222,0,537395200)
    ,(16223,0,537395200)
    ,(16224,0,537395200)
    ,(16225,0,537395200)
    ,(16230,0,448)
    ,(16232,0,448)
    ,(16233,0,448)
    ,(16234,0,448)
    ,(16258,0,32768)
    ,(16258,1,262144)
    ,(16259,0,65536)
    ,(16259,1,131072)
    ,(16266,0,4194304)
    ,(16266,1,16777216)
    ,(16266,2,8388608)
    ,(16293,0,32768)
    ,(16293,1,262144)
    ,(16295,0,65536)
    ,(16295,1,131072)
    ,(16513,0,34359861248)
    ,(16513,1,122880)
    ,(16513,2,122880)
    ,(16514,0,34359861248)
    ,(16514,1,122880)
    ,(16514,2,122880)
    ,(16515,0,34359861248)
    ,(16515,1,122880)
    ,(16515,2,122880)
    ,(16544,2,4)
    ,(16719,0,34359861248)
    ,(16719,1,122880)
    ,(16719,2,122880)
    ,(16720,0,34359861248)
    ,(16720,1,122880)
    ,(16720,2,122880)
    ,(16870,0,4512331310825215)
    ,(17123,0,128)
    ,(17124,0,128)
    ,(17904,0,0)
    ,(17912,0,0)
    ,(17913,0,0)
    ,(17914,0,0)
    ,(17915,0,0)
    ,(17916,0,0)
    ,(17954,1,824633725796)
    ,(17955,1,824633725796)
    ,(17956,1,824633725796)
    ,(17957,1,824633725796)
    ,(17958,1,824633725796)
    ,(18174,0,6447531034)
    ,(18175,0,6447531034)
    ,(18176,0,6447531034)
    ,(18177,0,6447531034)
    ,(18178,0,6447531034)
    ,(18218,0,6447531034)
    ,(18219,0,6447531034)
    ,(18271,0,12884993161)
    ,(18271,1,4295492618)
    ,(18271,2,0)
    ,(18272,0,12884993161)
    ,(18272,1,4295492618)
    ,(18272,2,0)
    ,(18273,0,12884993161)
    ,(18273,1,4295492618)
    ,(18273,2,0)
    ,(18274,0,12884993161)
    ,(18274,1,4295492618)
    ,(18274,2,0)
    ,(18275,0,12884993161)
    ,(18275,1,4295492618)
    ,(18275,2,0)
    ,(20101,0,176161280)
    ,(20102,0,176161280)
    ,(20103,0,176161280)
    ,(20104,0,176161280)
    ,(20105,0,176161280)
    ,(20575,1,67108864)
    ,(21942,1,134217728)
    ,(23300,0,536870912)
    ,(26118,0,67108864)
    ,(26118,1,67108864)
    ,(28539,0,4096)
    ,(28682,0,4194327)
    ,(28743,0,240)
    ,(28746,1,66566)
    ,(28751,0,135168)
    ,(28755,0,32)
    ,(28763,0,67108864)
    ,(28774,0,32768)
    ,(28787,0,8589934592)
    ,(28807,0,64)
    ,(28808,0,17465351744)
    ,(28811,0,8388608)
    ,(28814,0,131072)
    ,(28815,0,33554438)
    ,(28818,0,537395200)
    ,(28821,0,1024)
    ,(28829,0,2)
    ,(28830,0,262144)
    ,(28831,0,1)
    ,(28842,0,4294984768)
    ,(28843,0,557056)
    ,(28844,0,1024)
    ,(28852,0,512)
    ,(28852,1,536870912)
    ,(28855,0,2048)
    ,(28999,0,3)
    ,(29000,0,3)
    ,(29005,0,2416967683)
    ,(29063,0,2499)
    ,(29079,0,4194304)
    ,(29079,1,16777216)
    ,(29079,2,8388608)
    ,(29080,0,4194304)
    ,(29080,1,16777216)
    ,(29080,2,8388608)
    ,(29171,0,16384)
    ,(29187,0,448)
    ,(29189,0,448)
    ,(29191,0,448)
    ,(29192,0,8388608)
    ,(29192,1,2097152)
    ,(29193,0,8388608)
    ,(29193,1,2097152)
    ,(29202,0,64)
    ,(29205,0,64)
    ,(29206,0,64)
    ,(29438,0,4195063)
    ,(29439,0,4195063)
    ,(29440,0,4195063)
    ,(30440,0,557056)
    ,(30441,0,34359738368)
    ,(30640,0,256)
    ,(30812,0,2954368024)
    ,(30813,0,2954368024)
    ,(30814,0,2954368024)
    ,(30872,0,256)
    ,(30892,0,134217728)
    ,(30893,0,134217728)
;

-- Insert spells which require facing the target -----------------------------
INSERT INTO `spell_facing`
    (`entry`, `facingcasterflag`)
VALUES
     (53,1)      -- Backstab
    ,(72,1)      -- Shield Bash
    ,(75,1)      -- Auto Shot
    ,(78,1)      -- Heroic Strike
    ,(100,1)     -- Charge
    ,(116,1)     -- Frostbolt
    ,(133,1)     -- Fireball
    ,(143,1)     -- Fireball
    ,(145,1)     -- Fireball
    ,(205,1)     -- Frostbolt
    ,(284,1)     -- Heroic Strike
    ,(285,1)     -- Heroic Strike
    ,(348,1)     -- Immolate
    ,(403,1)     -- Lightning Bolt
    ,(408,1)     -- Kidney Shot
    ,(421,1)     -- Chain Lightning
    ,(529,1)     -- Lightning Bolt
    ,(548,1)     -- Lightning Bolt
    ,(585,1)     -- Smite
    ,(591,1)     -- Smite
    ,(598,1)     -- Smite
    ,(676,1)     -- Disarm
    ,(686,1)     -- Shadow Bolt
    ,(689,1)     -- Drain Life
    ,(694,1)     -- Mocking Blow
    ,(695,1)     -- Shadow Bolt
    ,(699,1)     -- Drain Life
    ,(703,1)     -- Garrote
    ,(705,1)     -- Shadow Bolt
    ,(707,1)     -- Immolate
    ,(709,1)     -- Drain Life
    ,(769,1)     -- Swipe
    ,(772,1)     -- Rend
    ,(779,1)     -- Swipe
    ,(780,1)     -- Swipe
    ,(837,1)     -- Frostbolt
    ,(845,1)     -- Cleave
    ,(879,1)     -- Exorcism
    ,(915,1)     -- Lightning Bolt
    ,(930,1)     -- Chain Lightning
    ,(943,1)     -- Lightning Bolt
    ,(984,1)     -- Smite
    ,(1004,1)    -- Smite
    ,(1079,1)    -- Rip
    ,(1082,1)    -- Claw
    ,(1088,1)    -- Shadow Bolt
    ,(1094,1)    -- Immolate
    ,(1106,1)    -- Shadow Bolt
    ,(1120,1)    -- Drain Soul
    ,(1329,1)    -- Bloodlust II
    ,(1464,1)    -- Slam
    ,(1495,1)    -- Mongoose Bite
    ,(1608,1)    -- Heroic Strike
    ,(1671,1)    -- Shield Bash
    ,(1672,1)    -- Shield Bash
    ,(1715,1)    -- Hamstring
    ,(1742,1)    -- Cower
    ,(1752,1)    -- Sinister Strike
    ,(1753,1)    -- Cower
    ,(1754,1)    -- Cower
    ,(1755,1)    -- Cower
    ,(1756,1)    -- Cower
    ,(1757,1)    -- Sinister Strike
    ,(1758,1)    -- Sinister Strike
    ,(1759,1)    -- Sinister Strike
    ,(1760,1)    -- Sinister Strike
    ,(1766,1)    -- Kick
    ,(1767,1)    -- Kick
    ,(1768,1)    -- Kick
    ,(1769,1)    -- Kick
    ,(1776,1)    -- Gouge
    ,(1777,1)    -- Gouge
    ,(1822,1)    -- Rake
    ,(1823,1)    -- Rake
    ,(1824,1)    -- Rake
    ,(1833,1)    -- Cheap Shot
    ,(1943,1)    -- Rupture
    ,(1966,1)    -- Feint
    ,(1978,1)    -- Serpent Sting
    ,(2070,1)    -- Sap
    ,(2098,1)    -- Eviscerate
    ,(2136,1)    -- Fire Blast
    ,(2137,1)    -- Fire Blast
    ,(2138,1)    -- Fire Blast
    ,(2589,1)    -- Backstab
    ,(2590,1)    -- Backstab
    ,(2591,1)    -- Backstab
    ,(2643,1)    -- Multi-Shot
    ,(2764,1)    -- Throw
    ,(2860,1)    -- Chain Lightning
    ,(2912,1)    -- Starfire
    ,(2941,1)    -- Immolate
    ,(2948,1)    -- Scorch
    ,(2973,1)    -- Raptor Strike
    ,(2974,1)    -- Wing Clip
    ,(3009,1)    -- Claw
    ,(3010,1)    -- Claw
    ,(3029,1)    -- Claw
    ,(3034,1)    -- Viper Sting
    ,(3043,1)    -- Scorpid Sting
    ,(3044,1)    -- Arcane Shot
    ,(3140,1)    -- Fireball
    ,(3674,1)    -- Black Arrow
    ,(4164,1)    -- Throw Rock
    ,(4165,1)    -- Throw Rock II
    ,(5019,1)    -- Shoot
    ,(5116,1)    -- Concussive Shot
    ,(5133,1)    -- Interrupt (PT)
    ,(5138,1)    -- Drain Mana
    ,(5143,1)    -- Arcane Missiles
    ,(5144,1)    -- Arcane Missiles
    ,(5145,1)    -- Arcane Missiles
    ,(5176,1)    -- Wrath
    ,(5177,1)    -- Wrath
    ,(5178,1)    -- Wrath
    ,(5179,1)    -- Wrath
    ,(5180,1)    -- Wrath
    ,(5201,1)    -- Claw
    ,(5211,1)    -- Bash
    ,(5221,1)    -- Shred
    ,(5308,1)    -- Execute
    ,(5401,1)    -- Lizard Bolt
    ,(5614,1)    -- Exorcism
    ,(5615,1)    -- Exorcism
    ,(5676,1)    -- Searing Pain
    ,(6041,1)    -- Lightning Bolt
    ,(6060,1)    -- Smite
    ,(6178,1)    -- Charge
    ,(6252,1)    -- Southsea Cannon Fire
    ,(6254,1)    -- Chained Bolt
    ,(6255,1)    -- Lizard Bolt
    ,(6353,1)    -- Soul Fire
    ,(6546,1)    -- Rend
    ,(6547,1)    -- Rend
    ,(6548,1)    -- Rend
    ,(6552,1)    -- Pummel
    ,(6554,1)    -- Pummel
    ,(6572,1)    -- Revenge
    ,(6574,1)    -- Revenge
    ,(6660,1)    -- Shoot
    ,(6726,1)    -- Silence
    ,(6760,1)    -- Eviscerate
    ,(6761,1)    -- Eviscerate
    ,(6762,1)    -- Eviscerate
    ,(6768,1)    -- Feint
    ,(6770,1)    -- Sap
    ,(6780,1)    -- Wrath
    ,(6785,1)    -- Ravage
    ,(6787,1)    -- Ravage
    ,(6789,1)    -- Death Coil
    ,(6798,1)    -- Bash
    ,(6800,1)    -- Shred
    ,(6807,1)    -- Maul
    ,(6808,1)    -- Maul
    ,(6809,1)    -- Maul
    ,(6949,1)    -- Weak Frostbolt
    ,(7105,1)    -- Fake Shot
    ,(7145,1)    -- Diving Sweep
    ,(7268,1)    -- Arcane Missile
    ,(7269,1)    -- Arcane Missiles
    ,(7270,1)    -- Arcane Missiles
    ,(7290,1)    -- Soul Siphon
    ,(7295,1)    -- Soul Drain
    ,(7322,1)    -- Frostbolt
    ,(7369,1)    -- Cleave
    ,(7372,1)    -- Hamstring
    ,(7373,1)    -- Hamstring
    ,(7379,1)    -- Revenge
    ,(7384,1)    -- Overpower
    ,(7386,1)    -- Sunder Armor
    ,(7400,1)    -- Mocking Blow
    ,(7402,1)    -- Mocking Blow
    ,(7405,1)    -- Sunder Armor
    ,(7641,1)    -- Shadow Bolt
    ,(7651,1)    -- Drain Life
    ,(7712,1)    -- Fire Strike
    ,(7714,1)    -- Fire Strike
    ,(7715,1)    -- Fire Strike
    ,(7716,1)    -- Fire Strike
    ,(7717,1)    -- Fire Strike
    ,(7718,1)    -- Fire Strike
    ,(7719,1)    -- Fire Strike
    ,(7887,1)    -- Overpower
    ,(8042,1)    -- Earth Shock
    ,(8044,1)    -- Earth Shock
    ,(8045,1)    -- Earth Shock
    ,(8046,1)    -- Earth Shock
    ,(8050,1)    -- Flame Shock
    ,(8052,1)    -- Flame Shock
    ,(8053,1)    -- Flame Shock
    ,(8056,1)    -- Frost Shock
    ,(8058,1)    -- Frost Shock
    ,(8092,1)    -- Mind Blast
    ,(8102,1)    -- Mind Blast
    ,(8103,1)    -- Mind Blast
    ,(8104,1)    -- Mind Blast
    ,(8105,1)    -- Mind Blast
    ,(8106,1)    -- Mind Blast
    ,(8129,1)    -- Mana Burn
    ,(8246,1)    -- Lightning Bolt
    ,(8255,1)    -- Strong Cleave
    ,(8288,1)    -- Drain Soul
    ,(8289,1)    -- Drain Soul
    ,(8380,1)    -- Sunder Armor
    ,(8398,1)    -- Frostbolt Volley
    ,(8400,1)    -- Fireball
    ,(8401,1)    -- Fireball
    ,(8402,1)    -- Fireball
    ,(8406,1)    -- Frostbolt
    ,(8407,1)    -- Frostbolt
    ,(8408,1)    -- Frostbolt
    ,(8412,1)    -- Fire Blast
    ,(8413,1)    -- Fire Blast
    ,(8416,1)    -- Arcane Missiles
    ,(8417,1)    -- Arcane Missiles
    ,(8418,1)    -- Arcane Missiles
    ,(8419,1)    -- Arcane Missiles
    ,(8444,1)    -- Scorch
    ,(8445,1)    -- Scorch
    ,(8446,1)    -- Scorch
    ,(8598,1)    -- Lightning Blast
    ,(8621,1)    -- Sinister Strike
    ,(8623,1)    -- Eviscerate
    ,(8624,1)    -- Eviscerate
    ,(8629,1)    -- Gouge
    ,(8631,1)    -- Garrote
    ,(8632,1)    -- Garrote
    ,(8633,1)    -- Garrote
    ,(8637,1)    -- Feint
    ,(8639,1)    -- Rupture
    ,(8640,1)    -- Rupture
    ,(8643,1)    -- Kidney Shot
    ,(8647,1)    -- Expose Armor
    ,(8649,1)    -- Expose Armor
    ,(8650,1)    -- Expose Armor
    ,(8676,1)    -- Ambush
    ,(8682,1)    -- Fake Shot
    ,(8721,1)    -- Backstab
    ,(8724,1)    -- Ambush
    ,(8725,1)    -- Ambush
    ,(8820,1)    -- Slam
    ,(8905,1)    -- Wrath
    ,(8921,1)    -- Moonfire
    ,(8924,1)    -- Moonfire
    ,(8925,1)    -- Moonfire
    ,(8926,1)    -- Moonfire
    ,(8927,1)    -- Moonfire
    ,(8928,1)    -- Moonfire
    ,(8929,1)    -- Moonfire
    ,(8949,1)    -- Starfire
    ,(8950,1)    -- Starfire
    ,(8951,1)    -- Starfire
    ,(8972,1)    -- Maul
    ,(8983,1)    -- Bash
    ,(8992,1)    -- Shred
    ,(8998,1)    -- Cower
    ,(9000,1)    -- Cower
    ,(9005,1)    -- Pounce
    ,(9053,1)    -- Fireball
    ,(9057,1)    -- Firebolt
    ,(9081,1)    -- Shadow Bolt Volley
    ,(9373,1)    -- Soul Siphon
    ,(9481,1)    -- Holy Smite
    ,(9483,1)    -- Boulder
    ,(9487,1)    -- Fireball
    ,(9488,1)    -- Fireball
    ,(9492,1)    -- Rip
    ,(9493,1)    -- Rip
    ,(9532,1)    -- Lightning Bolt
    ,(9591,1)    -- Acid Spit
    ,(9613,1)    -- Shadow Bolt
    ,(9654,1)    -- Jumping Lightning
    ,(9672,1)    -- Frostbolt
    ,(9734,1)    -- Holy Smite
    ,(9739,1)    -- Wrath
    ,(9745,1)    -- Maul
    ,(9752,1)    -- Rip
    ,(9754,1)    -- Swipe
    ,(9771,1)    -- Radiation Bolt
    ,(9823,1)    -- Pounce
    ,(9827,1)    -- Pounce
    ,(9829,1)    -- Shred
    ,(9830,1)    -- Shred
    ,(9833,1)    -- Moonfire
    ,(9834,1)    -- Moonfire
    ,(9835,1)    -- Moonfire
    ,(9849,1)    -- Claw
    ,(9850,1)    -- Claw
    ,(9866,1)    -- Ravage
    ,(9867,1)    -- Ravage
    ,(9875,1)    -- Starfire
    ,(9876,1)    -- Starfire
    ,(9880,1)    -- Maul
    ,(9881,1)    -- Maul
    ,(9892,1)    -- Cower
    ,(9894,1)    -- Rip
    ,(9896,1)    -- Rip
    ,(9904,1)    -- Rake
    ,(9908,1)    -- Swipe
    ,(9912,1)    -- Wrath
    ,(10148,1)   -- Fireball
    ,(10149,1)   -- Fireball
    ,(10150,1)   -- Fireball
    ,(10151,1)   -- Fireball
    ,(10179,1)   -- Frostbolt
    ,(10180,1)   -- Frostbolt
    ,(10181,1)   -- Frostbolt
    ,(10197,1)   -- Fire Blast
    ,(10199,1)   -- Fire Blast
    ,(10205,1)   -- Scorch
    ,(10206,1)   -- Scorch
    ,(10207,1)   -- Scorch
    ,(10211,1)   -- Arcane Missiles
    ,(10212,1)   -- Arcane Missiles
    ,(10273,1)   -- Arcane Missiles
    ,(10274,1)   -- Arcane Missiles
    ,(10277,1)   -- Throw
    ,(10312,1)   -- Exorcism
    ,(10313,1)   -- Exorcism
    ,(10314,1)   -- Exorcism
    ,(10346,1)   -- Machine Gun
    ,(10391,1)   -- Lightning Bolt
    ,(10392,1)   -- Lightning Bolt
    ,(10412,1)   -- Earth Shock
    ,(10413,1)   -- Earth Shock
    ,(10414,1)   -- Earth Shock
    ,(10447,1)   -- Flame Shock
    ,(10448,1)   -- Flame Shock
    ,(10472,1)   -- Frost Shock
    ,(10473,1)   -- Frost Shock
    ,(10578,1)   -- Fireball
    ,(10605,1)   -- Chain Lightning
    ,(10933,1)   -- Smite
    ,(10934,1)   -- Smite
    ,(10945,1)   -- Mind Blast
    ,(10946,1)   -- Mind Blast
    ,(10947,1)   -- Mind Blast
    ,(11021,1)   -- Flamespit
    ,(11131,1)   -- Icicle
    ,(11197,1)   -- Expose Armor
    ,(11198,1)   -- Expose Armor
    ,(11267,1)   -- Ambush
    ,(11268,1)   -- Ambush
    ,(11269,1)   -- Ambush
    ,(11273,1)   -- Rupture
    ,(11274,1)   -- Rupture
    ,(11275,1)   -- Rupture
    ,(11279,1)   -- Backstab
    ,(11280,1)   -- Backstab
    ,(11281,1)   -- Backstab
    ,(11285,1)   -- Gouge
    ,(11286,1)   -- Gouge
    ,(11289,1)   -- Garrote
    ,(11290,1)   -- Garrote
    ,(11293,1)   -- Sinister Strike
    ,(11294,1)   -- Sinister Strike
    ,(11297,1)   -- Sap
    ,(11299,1)   -- Eviscerate
    ,(11300,1)   -- Eviscerate
    ,(11303,1)   -- Feint
    ,(11366,1)   -- Pyroblast
    ,(11538,1)   -- Frostbolt
    ,(11564,1)   -- Heroic Strike
    ,(11565,1)   -- Heroic Strike
    ,(11566,1)   -- Heroic Strike
    ,(11567,1)   -- Heroic Strike
    ,(11572,1)   -- Rend
    ,(11573,1)   -- Rend
    ,(11574,1)   -- Rend
    ,(11578,1)   -- Charge
    ,(11584,1)   -- Overpower
    ,(11585,1)   -- Overpower
    ,(11596,1)   -- Sunder Armor
    ,(11597,1)   -- Sunder Armor
    ,(11600,1)   -- Revenge
    ,(11601,1)   -- Revenge
    ,(11604,1)   -- Slam
    ,(11605,1)   -- Slam
    ,(11608,1)   -- Cleave
    ,(11609,1)   -- Cleave
    ,(11659,1)   -- Shadow Bolt
    ,(11660,1)   -- Shadow Bolt
    ,(11661,1)   -- Shadow Bolt
    ,(11665,1)   -- Immolate
    ,(11667,1)   -- Immolate
    ,(11668,1)   -- Immolate
    ,(11675,1)   -- Drain Soul
    ,(11699,1)   -- Drain Life
    ,(11700,1)   -- Drain Life
    ,(11839,1)   -- Fireball
    ,(11921,1)   -- Fireball
    ,(11985,1)   -- Fireball
    ,(11988,1)   -- Fireball Volley
    ,(11989,1)   -- Fireball Volley
    ,(12058,1)   -- Chain Lightning
    ,(12167,1)   -- Lightning Bolt
    ,(12280,1)   -- Acid of Hakkar
    ,(12294,1)   -- Mortal Strike
    ,(12466,1)   -- Fireball
    ,(12471,1)   -- Shadow Bolt
    ,(12505,1)   -- Pyroblast
    ,(12522,1)   -- Pyroblast
    ,(12523,1)   -- Pyroblast
    ,(12524,1)   -- Pyroblast
    ,(12525,1)   -- Pyroblast
    ,(12526,1)   -- Pyroblast
    ,(12555,1)   -- Pummel
    ,(12557,1)   -- Cone of Cold
    ,(12611,1)   -- Cone of Cold
    ,(12675,1)   -- Frostbolt
    ,(12693,1)   -- Drain Life
    ,(12737,1)   -- Frostbolt
    ,(12739,1)   -- Shadow Bolt
    ,(12809,1)   -- Concussion Blow
    ,(13140,1)   -- Fireball
    ,(13322,1)   -- Frostbolt
    ,(13339,1)   -- Fire Blast
    ,(13340,1)   -- Fire Blast
    ,(13341,1)   -- Fire Blast
    ,(13342,1)   -- Fire Blast
    ,(13374,1)   -- Fire Blast
    ,(13375,1)   -- Fireball
    ,(13398,1)   -- Throw Wrench
    ,(13438,1)   -- Fireball
    ,(13439,1)   -- Frostbolt
    ,(13440,1)   -- Shadow Bolt
    ,(13441,1)   -- Firebolt
    ,(13480,1)   -- Shadow Bolt
    ,(13482,1)   -- Lightning Bolt
    ,(13491,1)   -- Pummel
    ,(13519,1)   -- Holy Smite
    ,(13527,1)   -- Lightning Bolt
    ,(13549,1)   -- Serpent Sting
    ,(13550,1)   -- Serpent Sting
    ,(13551,1)   -- Serpent Sting
    ,(13552,1)   -- Serpent Sting
    ,(13553,1)   -- Serpent Sting
    ,(13554,1)   -- Serpent Sting
    ,(13555,1)   -- Serpent Sting
    ,(13748,1)   -- Arcane Bolt
    ,(13900,1)   -- Fiery Burst
    ,(13901,1)   -- Arcane Bolt
    ,(13953,1)   -- Holy Strike
    ,(14034,1)   -- Fireball
    ,(14105,1)   -- Frost Blast
    ,(14106,1)   -- Shadow Bolt
    ,(14109,1)   -- Lightning Bolt
    ,(14112,1)   -- Flaying Vine
    ,(14119,1)   -- Lightning Bolt
    ,(14122,1)   -- Shadow Bolt
    ,(14145,1)   -- Fire Blast
    ,(14200,1)   -- Chained Bolt
    ,(14251,1)   -- Riposte
    ,(14260,1)   -- Raptor Strike
    ,(14261,1)   -- Raptor Strike
    ,(14262,1)   -- Raptor Strike
    ,(14263,1)   -- Raptor Strike
    ,(14264,1)   -- Raptor Strike
    ,(14265,1)   -- Raptor Strike
    ,(14266,1)   -- Raptor Strike
    ,(14269,1)   -- Mongoose Bite
    ,(14270,1)   -- Mongoose Bite
    ,(14271,1)   -- Mongoose Bite
    ,(14278,1)   -- Ghostly Strike
    ,(14281,1)   -- Arcane Shot
    ,(14282,1)   -- Arcane Shot
    ,(14283,1)   -- Arcane Shot
    ,(14284,1)   -- Arcane Shot
    ,(14285,1)   -- Arcane Shot
    ,(14286,1)   -- Arcane Shot
    ,(14287,1)   -- Arcane Shot
    ,(14288,1)   -- Multi-Shot
    ,(14289,1)   -- Multi-Shot
    ,(14290,1)   -- Multi-Shot
    ,(14443,1)   -- Multi-Shot
    ,(14517,1)   -- Crusader Strike
    ,(14518,1)   -- Crusader Strike
    ,(14873,1)   -- Sinister Strike
    ,(14874,1)   -- Rupture
    ,(14895,1)   -- Overpower
    ,(14902,1)   -- Cheap Shot
    ,(14903,1)   -- Rupture
    ,(14914,1)   -- Holy Fire
    ,(15040,1)   -- Molten Blast
    ,(15043,1)   -- Frostbolt
    ,(15095,1)   -- Molten Blast
    ,(15117,1)   -- Chain Lightning
    ,(15124,1)   -- Arcane Bolt
    ,(15207,1)   -- Lightning Bolt
    ,(15208,1)   -- Lightning Bolt
    ,(15228,1)   -- Fireball
    ,(15230,1)   -- Arcane Bolt
    ,(15232,1)   -- Shadow Bolt
    ,(15234,1)   -- Lightning Bolt
    ,(15238,1)   -- Holy Smite
    ,(15242,1)   -- Fireball
    ,(15243,1)   -- Fireball Volley
    ,(15244,1)   -- Cone of Cold
    ,(15249,1)   -- Machine Gun
    ,(15254,1)   -- Arcane Bolt
    ,(15261,1)   -- Holy Fire
    ,(15262,1)   -- Holy Fire
    ,(15263,1)   -- Holy Fire
    ,(15264,1)   -- Holy Fire
    ,(15265,1)   -- Holy Fire
    ,(15266,1)   -- Holy Fire
    ,(15267,1)   -- Holy Fire
    ,(15284,1)   -- Cleave
    ,(15285,1)   -- Fireball Volley
    ,(15305,1)   -- Chain Lightning
    ,(15407,1)   -- Mind Flay
    ,(15451,1)   -- Arcane Bolt
    ,(15472,1)   -- Shadow Bolt
    ,(15496,1)   -- Cleave
    ,(15497,1)   -- Frostbolt
    ,(15498,1)   -- Holy Smite
    ,(15530,1)   -- Frostbolt
    ,(15536,1)   -- Fireball
    ,(15537,1)   -- Shadow Bolt
    ,(15547,1)   -- Shoot
    ,(15549,1)   -- Chained Bolt
    ,(15574,1)   -- Fire Blast
    ,(15575,1)   -- Flame Cannon
    ,(15581,1)   -- Sinister Strike
    ,(15583,1)   -- Rupture
    ,(15598,1)   -- Firebolt
    ,(15607,1)   -- Throw
    ,(15611,1)   -- Lizard Bolt
    ,(15612,1)   -- Lizard Bolt
    ,(15615,1)   -- Pummel
    ,(15619,1)   -- Throw Wrench
    ,(15620,1)   -- Shoot
    ,(15653,1)   -- Acid Spit
    ,(15659,1)   -- Chain Lightning
    ,(15662,1)   -- Fireball
    ,(15665,1)   -- Fireball
    ,(15667,1)   -- Sinister Strike
    ,(15668,1)   -- Fiery Burst
    ,(15691,1)   -- Eviscerate
    ,(15692,1)   -- Eviscerate
    ,(15735,1)   -- Arcane Missiles
    ,(15736,1)   -- Arcane Missiles
    ,(15790,1)   -- Arcane Missiles
    ,(15791,1)   -- Arcane Missiles
    ,(15795,1)   -- Throw
    ,(15797,1)   -- Lightning Breath
    ,(15801,1)   -- Lightning Bolt
    ,(15860,1)   -- Impale
    ,(15968,1)   -- Lash of Pain
    ,(16000,1)   -- Throw
    ,(16001,1)   -- Impale
    ,(16006,1)   -- Chain Lightning
    ,(16033,1)   -- Chain Lightning
    ,(16044,1)   -- Cleave
    ,(16067,1)   -- Arcane Blast
    ,(16100,1)   -- Shoot
    ,(16101,1)   -- Fireball
    ,(16144,1)   -- Fire Blast
    ,(16243,1)   -- Ribbon of Souls
    ,(16249,1)   -- Frostbolt
    ,(16250,1)   -- Fireball Volley
    ,(16375,1)   -- Drain Life
    ,(16407,1)   -- Frost Blast
    ,(16408,1)   -- Shadow Bolt
    ,(16409,1)   -- Shadow Bolt
    ,(16410,1)   -- Shadow Bolt
    ,(16412,1)   -- Fireball
    ,(16413,1)   -- Fireball
    ,(16414,1)   -- Drain Life
    ,(16415,1)   -- Fireball
    ,(16430,1)   -- Soul Tap
    ,(16454,1)   -- Searing Blast
    ,(16496,1)   -- Shoot
    ,(16511,1)   -- Hemorrhage
    ,(16564,1)   -- Gargoyle Strike
    ,(16565,1)   -- Banshee Wail
    ,(16570,1)   -- Charged Arcane Bolt
    ,(16603,1)   -- Demonfork
    ,(16614,1)   -- Lightning Strike
    ,(16697,1)   -- Cower
    ,(16784,1)   -- Shadow Bolt
    ,(16788,1)   -- Fireball
    ,(16790,1)   -- Knockdown
    ,(16799,1)   -- Frostbolt
    ,(16827,1)   -- Claw
    ,(16828,1)   -- Claw
    ,(16829,1)   -- Claw
    ,(16830,1)   -- Claw
    ,(16831,1)   -- Claw
    ,(16832,1)   -- Claw
    ,(16868,1)   -- Banshee Wail
    ,(16908,1)   -- Dispel Magic
    ,(16979,1)   -- Feral Charge
    ,(16997,1)   -- Gargoyle Strike
    ,(17008,1)   -- Drain Mana
    ,(17140,1)   -- Holy Fire
    ,(17141,1)   -- Holy Fire
    ,(17142,1)   -- Holy Fire
    ,(17143,1)   -- Holy Strike
    ,(17144,1)   -- Wrath
    ,(17147,1)   -- Exorcism
    ,(17149,1)   -- Exorcism
    ,(17157,1)   -- Lightning Breath
    ,(17171,1)   -- Shadow Shot
    ,(17173,1)   -- Drain Life
    ,(17174,1)   -- Concussive Shot
    ,(17198,1)   -- Overpower
    ,(17203,1)   -- Fireball Volley
    ,(17238,1)   -- Drain Life
    ,(17243,1)   -- Drain Mana
    ,(17253,1)   -- Bite
    ,(17255,1)   -- Bite
    ,(17256,1)   -- Bite
    ,(17257,1)   -- Bite
    ,(17258,1)   -- Bite
    ,(17259,1)   -- Bite
    ,(17260,1)   -- Bite
    ,(17261,1)   -- Bite
    ,(17273,1)   -- Pyroblast
    ,(17274,1)   -- Pyroblast
    ,(17276,1)   -- Scald
    ,(17281,1)   -- Crusader Strike
    ,(17284,1)   -- Holy Strike
    ,(17290,1)   -- Fireball
    ,(17311,1)   -- Mind Flay
    ,(17312,1)   -- Mind Flay
    ,(17313,1)   -- Mind Flay
    ,(17314,1)   -- Mind Flay
    ,(17333,1)   -- Spider's Kiss
    ,(17347,1)   -- Hemorrhage
    ,(17348,1)   -- Hemorrhage
    ,(17353,1)   -- Shoot
    ,(17364,1)   -- Stormstrike
    ,(17393,1)   -- Shadow Bolt
    ,(17434,1)   -- Shadow Bolt
    ,(17435,1)   -- Shadow Bolt
    ,(17483,1)   -- Shadow Bolt
    ,(17501,1)   -- Cannon Fire
    ,(17503,1)   -- Frostbolt
    ,(17509,1)   -- Shadow Bolt
    ,(17620,1)   -- Drain Life
    ,(17682,1)   -- Drain Mana
    ,(17745,1)   -- Diseased Spit
    ,(17877,1)   -- Shadowburn
    ,(17919,1)   -- Searing Pain
    ,(17920,1)   -- Searing Pain
    ,(17921,1)   -- Searing Pain
    ,(17922,1)   -- Searing Pain
    ,(17923,1)   -- Searing Pain
    ,(17924,1)   -- Soul Fire
    ,(17925,1)   -- Death Coil
    ,(17926,1)   -- Death Coil
    ,(17962,1)   -- Conflagrate
    ,(17963,1)   -- Sundering Cleave
    ,(18081,1)   -- Lightning Bolt
    ,(18082,1)   -- Fireball
    ,(18083,1)   -- Firebolt
    ,(18084,1)   -- Drain Life
    ,(18085,1)   -- Frost Blast
    ,(18089,1)   -- Lightning Bolt
    ,(18091,1)   -- Arcane Blast
    ,(18092,1)   -- Frost Blast
    ,(18104,1)   -- Wrath
    ,(18105,1)   -- Fireball
    ,(18108,1)   -- Fireball
    ,(18111,1)   -- Shadow Bolt
    ,(18138,1)   -- Shadow Bolt
    ,(18164,1)   -- Shadow Bolt
    ,(18165,1)   -- Holy Fire
    ,(18187,1)   -- Firebolt
    ,(18199,1)   -- Fireball
    ,(18204,1)   -- Frost Blast
    ,(18205,1)   -- Shadow Bolt
    ,(18211,1)   -- Shadow Bolt
    ,(18214,1)   -- Shadow Bolt
    ,(18217,1)   -- Shadow Bolt
    ,(18276,1)   -- Frost Blast
    ,(18278,1)   -- Silence
    ,(18392,1)   -- Fireball
    ,(18398,1)   -- Frost Blast
    ,(18545,1)   -- Scorpid Sting
    ,(18557,1)   -- Drain Life
    ,(18561,1)   -- Shoot
    ,(18649,1)   -- Shadow Shot
    ,(18651,1)   -- Multi-Shot
    ,(18796,1)   -- Fireball
    ,(18807,1)   -- Mind Flay
    ,(18809,1)   -- Pyroblast
    ,(18817,1)   -- Drain Life
    ,(18819,1)   -- Holy Cleave
    ,(18833,1)   -- Firebolt
    ,(18867,1)   -- Shadowburn
    ,(18868,1)   -- Shadowburn
    ,(18869,1)   -- Shadowburn
    ,(18870,1)   -- Shadowburn
    ,(18871,1)   -- Shadowburn
    ,(18980,1)   -- Lightning
    ,(18984,1)   -- Heal on Kill
    ,(19128,1)   -- Knockdown
    ,(19260,1)   -- Frost Blast
    ,(19306,1)   -- Counterattack
    ,(19319,1)   -- Vicious Bite
    ,(19386,1)   -- Wyvern Sting
    ,(19391,1)   -- Fireball
    ,(19434,1)   -- Aimed Shot
    ,(19463,1)   -- Corrosive Acid Spit
    ,(19472,1)   -- Sinister Strike
    ,(19503,1)   -- Scatter Shot
    ,(19632,1)   -- Cleave
    ,(19639,1)   -- Pummel
    ,(19642,1)   -- Cleave
    ,(19701,1)   -- Boulder
    ,(19715,1)   -- Counterspell
    ,(19725,1)   -- Turn Undead
    ,(19728,1)   -- Shadow Bolt
    ,(19729,1)   -- Shadow Bolt
    ,(19767,1)   -- Aynasha's Bow
    ,(19777,1)   -- Dark Strike
    ,(19781,1)   -- Flame Spear
    ,(19785,1)   -- Throw
    ,(19801,1)   -- Tranquilizing Shot
    ,(19816,1)   -- Fireball
    ,(19874,1)   -- Lightning Bolt
    ,(19983,1)   -- Cleave
    ,(20228,1)   -- Pyroblast
    ,(20240,1)   -- Retaliation
    ,(20243,1)   -- Devastate
    ,(20252,1)   -- Intercept
    ,(20276,1)   -- Knockdown
    ,(20295,1)   -- Lightning Bolt
    ,(20297,1)   -- Frostbolt
    ,(20298,1)   -- Shadow Bolt
    ,(20420,1)   -- Fireball
    ,(20463,1)   -- Shoot
    ,(20535,1)   -- Lightning Breath
    ,(20536,1)   -- Lightning Breath
    ,(20543,1)   -- Lightning Breath
    ,(20559,1)   -- Mocking Blow
    ,(20560,1)   -- Mocking Blow
    ,(20569,1)   -- Cleave
    ,(20605,1)   -- Cleave
    ,(20616,1)   -- Intercept
    ,(20617,1)   -- Intercept
    ,(20627,1)   -- Lightning Breath
    ,(20630,1)   -- Lightning Breath
    ,(20657,1)   -- Acid Spit
    ,(20658,1)   -- Execute
    ,(20660,1)   -- Execute
    ,(20661,1)   -- Execute
    ,(20662,1)   -- Execute
    ,(20666,1)   -- Cleave
    ,(20678,1)   -- Fireball
    ,(20684,1)   -- Cleave
    ,(20691,1)   -- Cleave
    ,(20692,1)   -- Fireball
    ,(20695,1)   -- Holy Smite
    ,(20696,1)   -- Holy Smite
    ,(20698,1)   -- Wrath
    ,(20714,1)   -- Fireball
    ,(20720,1)   -- Arcane Bolt
    ,(20735,1)   -- Multi-Shot
    ,(20736,1)   -- Distracting Shot
    ,(20743,1)   -- Drain Life
    ,(20791,1)   -- Shadow Bolt
    ,(20792,1)   -- Frostbolt
    ,(20793,1)   -- Fireball
    ,(20795,1)   -- Fire Blast
    ,(20797,1)   -- Fireball
    ,(20802,1)   -- Lightning Bolt
    ,(20805,1)   -- Lightning Bolt
    ,(20806,1)   -- Frostbolt
    ,(20807,1)   -- Shadow Bolt
    ,(20808,1)   -- Fireball
    ,(20811,1)   -- Fireball
    ,(20815,1)   -- Fireball
    ,(20816,1)   -- Shadow Bolt
    ,(20819,1)   -- Frostbolt
    ,(20820,1)   -- Holy Smite
    ,(20821,1)   -- Acid Spit
    ,(20822,1)   -- Frostbolt
    ,(20823,1)   -- Fireball
    ,(20824,1)   -- Lightning Bolt
    ,(20825,1)   -- Shadow Bolt
    ,(20828,1)   -- Cone of Cold
    ,(20829,1)   -- Arcane Bolt
    ,(20831,1)   -- Chain Lightning
    ,(20832,1)   -- Fire Blast
    ,(20869,1)   -- Frost Blast
    ,(20883,1)   -- Arcane Blast
    ,(20900,1)   -- Aimed Shot
    ,(20901,1)   -- Aimed Shot
    ,(20902,1)   -- Aimed Shot
    ,(20903,1)   -- Aimed Shot
    ,(20904,1)   -- Aimed Shot
    ,(20909,1)   -- Counterattack
    ,(20910,1)   -- Counterattack
    ,(21008,1)   -- Mocking Blow
    ,(21027,1)   -- Spark
    ,(21047,1)   -- Corrosive Acid Spit
    ,(21059,1)   -- Acid Spit
    ,(21071,1)   -- Boulder
    ,(21072,1)   -- Fireball
    ,(21077,1)   -- Shadow Bolt
    ,(21141,1)   -- Shadow Bolt
    ,(21151,1)   -- Gutgore Ripper
    ,(21159,1)   -- Fireball
    ,(21162,1)   -- Fireball
    ,(21167,1)   -- Snowball
    ,(21170,1)   -- Drain Life
    ,(21343,1)   -- Snowball
    ,(21354,1)   -- Snowball Resistant
    ,(21369,1)   -- Frostbolt
    ,(21390,1)   -- Multi-Shot
    ,(21402,1)   -- Fireball
    ,(21549,1)   -- Fireball
    ,(21551,1)   -- Mortal Strike
    ,(21552,1)   -- Mortal Strike
    ,(21553,1)   -- Mortal Strike
    ,(21667,1)   -- Wrath
    ,(21668,1)   -- Starfire
    ,(21807,1)   -- Wrath
    ,(21832,1)   -- Boulder
    ,(21978,1)   -- Engulfing Shadows
    ,(22088,1)   -- Fireball
    ,(22121,1)   -- Shoot
    ,(22272,1)   -- Arcane Missiles
    ,(22273,1)   -- Arcane Missiles
    ,(22336,1)   -- Shadow Bolt
    ,(22355,1)   -- Chain Lightning
    ,(22357,1)   -- Icebolt
    ,(22411,1)   -- Shoot
    ,(22414,1)   -- Lightning Bolt
    ,(22425,1)   -- Fireball Volley
    ,(22427,1)   -- Concussion Blow
    ,(22568,1)   -- Ferocious Bite
    ,(22570,1)   -- Mangle
    ,(22574,1)   -- Dark Strike
    ,(22643,1)   -- Frostbolt Volley
    ,(22666,1)   -- Silence
    ,(22677,1)   -- Shadow Bolt
    ,(22746,1)   -- Cone of Cold
    ,(22827,1)   -- Ferocious Bite
    ,(22828,1)   -- Ferocious Bite
    ,(22829,1)   -- Ferocious Bite
    ,(22859,1)   -- Mortal Cleave
    ,(22878,1)   -- Shadow Bolt Volley
    ,(22887,1)   -- Throw
    ,(22907,1)   -- Shoot
    ,(22908,1)   -- Volley
    ,(23073,1)   -- Shoot
    ,(23102,1)   -- Frostbolt
    ,(23106,1)   -- Chain Lightning
    ,(23206,1)   -- Chain Lightning
    ,(23267,1)   -- Firebolt
    ,(23391,1)   -- Boulder
    ,(23392,1)   -- Boulder
    ,(23512,1)   -- Fireball Volley
    ,(23592,1)   -- Lightning Bolt
    ,(23601,1)   -- Scatter Shot
    ,(23860,1)   -- Holy Fire
    ,(23881,1)   -- Bloodthirst
    ,(23892,1)   -- Bloodthirst
    ,(23893,1)   -- Bloodthirst
    ,(23894,1)   -- Bloodthirst
    ,(23922,1)   -- Shield Slam
    ,(23923,1)   -- Shield Slam
    ,(23924,1)   -- Shield Slam
    ,(23925,1)   -- Shield Slam
    ,(24049,1)   -- Impale
    ,(24132,1)   -- Wyvern Sting
    ,(24133,1)   -- Wyvern Sting
    ,(24238,1)   -- Test Rip
    ,(24239,1)   -- Hammer of Wrath
    ,(24248,1)   -- Copy of Ferocious Bite
    ,(24274,1)   -- Hammer of Wrath
    ,(24275,1)   -- Hammer of Wrath
    ,(24300,1)   -- Drain Life
    ,(24331,1)   -- Rake
    ,(24332,1)   -- Rake
    ,(24334,1)   -- Acid Spit
    ,(24335,1)   -- Wyvern Sting
    ,(24374,1)   -- Fireball
    ,(24407,1)   -- Overpower
    ,(24583,1)   -- Scorpid Poison
    ,(24585,1)   -- Drain Life
    ,(24586,1)   -- Scorpid Poison
    ,(24587,1)   -- Scorpid Poison
    ,(24619,1)   -- Soul Tap
    ,(24640,1)   -- Scorpid Poison
    ,(24668,1)   -- Shadow Bolt
    ,(24680,1)   -- Chain Lightning
    ,(24844,1)   -- Lightning Breath
    ,(24942,1)   -- Frostbolt
    ,(25008,1)   -- Lightning Breath
    ,(25009,1)   -- Lightning Breath
    ,(25010,1)   -- Lightning Breath
    ,(25011,1)   -- Lightning Breath
    ,(25012,1)   -- Lightning Breath
    ,(25021,1)   -- Chain Lightning
    ,(25052,1)   -- Acid Spit
    ,(25054,1)   -- Holy Smite
    ,(25055,1)   -- Arcane Bolt
    ,(25174,1)   -- Sundering Cleave
    ,(25286,1)   -- Heroic Strike
    ,(25288,1)   -- Revenge
    ,(25294,1)   -- Multi-Shot
    ,(25295,1)   -- Serpent Sting
    ,(25298,1)   -- Starfire
    ,(25300,1)   -- Backstab
    ,(25302,1)   -- Feint
    ,(25304,1)   -- Frostbolt
    ,(25306,1)   -- Fireball
    ,(25307,1)   -- Shadow Bolt
    ,(25309,1)   -- Immolate
    ,(25345,1)   -- Arcane Missiles
    ,(25346,1)   -- Arcane Missiles
    ,(25677,1)   -- Snowball
    ,(25686,1)   -- Super Snowball
    ,(25710,1)   -- Heroic Strike
    ,(25712,1)   -- Heroic Strike
    ,(25783,15)  -- Place Arcanite Buoy
    ,(25902,1)   -- Holy Shock
    ,(25911,1)   -- Holy Shock
    ,(25912,1)   -- Holy Shock
    ,(25995,1)   -- Snowball Visual Test
    ,(26006,1)   -- Shadow Bolt
    ,(26098,1)   -- Lightning Bolt
    ,(26282,1)   -- Shoot Tauren Rifleman
    ,(26350,1)   -- Cleave
    ,(26616,1)   -- Boulder
    ,(26693,1)   -- Drain Life
    ,(27360,1)   -- Instill Lord Valthalak's Spirit DND
    ,(27552,1)   -- Cupid's Arrow
    ,(27554,1)   -- Swipe
    ,(27559,1)   -- Silence
    ,(27567,1)   -- Chain Lightning
    ,(27572,1)   -- Smitten
    ,(27580,1)   -- Mortal Strike
    ,(27581,1)   -- Disarm
    ,(27584,1)   -- Hamstring
    ,(27611,1)   -- Eviscerate
    ,(27615,1)   -- Kidney Shot
    ,(27632,1)   -- Aimed Shot
    ,(27633,1)   -- Wing Clip
    ,(27794,1)   -- Cleave
    ,(27860,1)   -- Engulfing Shadows
    ,(28318,1)   -- Slime Shot
    ,(28412,1)   -- Death Coil
    ,(28478,1)   -- Frostbolt
    ,(28599,1)   -- Shadow Bolt Volley
    ,(29155,1)   -- Drain Life
    ,(29228,1)   -- Flame Shock
    ,(29317,1)   -- Shadow Bolt
    ,(30095,1)   -- Cone of Cold
    ,(31016,1)   -- Eviscerate
    ,(31018,1)   -- Ferocious Bite
;

-- Insert spells considered elixirs ------------------------------------------
INSERT INTO `spell_elixir`
    (`entry`, `mask`)
VALUES
     (673,0)     -- Lesser Armor
    ,(2367,0)    -- Lesser Strength
    ,(2374,0)    -- Lesser Agility
    ,(2378,0)    -- Health
    ,(2380,0)    -- Resistance
    ,(3160,0)    -- Agility
    ,(3164,0)    -- Strength
    ,(3166,0)    -- Lesser Intellect
    ,(3219,0)    -- Regeneration
    ,(3220,0)    -- Armor
    ,(3222,0)    -- Regeneration
    ,(3223,0)    -- Regeneration
    ,(3593,0)    -- Health II
    ,(7844,0)    -- Fire Power
    ,(8212,0)    -- Enlarge
    ,(10667,0)   -- Rage of Ages
    ,(10668,0)   -- Spirit of Boar
    ,(10669,0)   -- Strike of the Scorpok
    ,(10692,0)   -- Infallible Mind
    ,(10693,0)   -- Spiritual Domination
    ,(11319,0)   -- Water Walking
    ,(11328,0)   -- Agility
    ,(11334,0)   -- Greater Agility
    ,(11348,0)   -- Greater Armor
    ,(11349,0)   -- Armor
    ,(11364,0)   -- Resistance
    ,(11371,0)   -- Gift of Arthas
    ,(11390,0)   -- Arcane Elixir
    ,(11396,0)   -- Greater Intellect
    ,(11405,0)   -- Elixir of the Giants
    ,(11406,0)   -- Elixir of Demonslaying
    ,(11474,0)   -- Shadow Power
    ,(15231,0)   -- Crystal Force
    ,(15233,0)   -- Crystal Ward
    ,(16321,0)   -- Juju Escape
    ,(16322,0)   -- Juju Flurry
    ,(16323,0)   -- Juju Power
    ,(16325,0)   -- Juju Chill
    ,(16326,0)   -- Juju Ember
    ,(16327,0)   -- Juju Guile
    ,(16329,0)   -- Juju Might
    ,(17038,0)   -- Winterfall Firewater
    ,(17535,0)   -- Elixir of the Sages
    ,(17537,0)   -- Elixir of Brute Force
    ,(17538,0)   -- Elixir of the Mongoose
    ,(17539,0)   -- Greater Arcane Elixir
    ,(17624,0)   -- Petrification
    ,(17626,0)   -- Flask of the Titans
    ,(17627,0)   -- Distilled Wisdom
    ,(17628,0)   -- Supreme Power
    ,(17629,0)   -- Chromatic Resistance
    ,(21920,0)   -- Frost Power
    ,(24361,0)   -- Regeneration
    ,(24363,0)   -- Mana Regeneration
    ,(24382,0)   -- Spirit of Zanza
    ,(24383,0)   -- Swiftness of Zanza
    ,(24417,0)   -- Sheen of Zanza
    ,(26276,0)   -- Greater Firepower
    ,(27652,0)   -- Elixir of Resistance
    ,(27653,0)   -- Elixir of Dodging
;

-- Insert spell bonus data ---------------------------------------------------
INSERT INTO `spell_bonus_data`
    (`entry`,`direct_bonus`,`dot_bonus`,`ap_bonus`,`ap_dot_bonus`,`comments`)
VALUES
     (116,0.8143,0,0,0,'Mage - Frostbolt (Rank 1)')
    ,(120,0.1357,0,0,0,'Mage - Cone of Cold (Rank 1)')
    ,(133,1,0,0,0,'Mage - Fireball (Rank 1)')
    ,(172,0,0.156,0,0,'Warlock - Corruption (Rank 1)')
    ,(331,0.8571,0,0,0,'Shaman - Healing Wave (Rank 1)')
    ,(339,0,0.1,0,0,'Druid - Entangling Roots (Rank 1)')
    ,(348,0.2,0.2,0,0,'Warlock - Immolate (Rank 1)')
    ,(403,0.7143,0,0,0,'Shaman - Lightning Bolt (Rank 1)')
    ,(421,0.57,0,0,0,'Shaman - Chain Lightning (Rank 1)')
    ,(585,0.714,0,0,0,'Priest - Smite (Rank 1)')
    ,(603,0,2,0,0,'Warlock - Curse of Doom')
    ,(686,0.8571,0,0,0,'Warlock - Shadow Bolt (Rank 1)')
    ,(703,0,0,0,0.03,'Rogue - Garrote (Rank 1)')
    ,(755,0,0.4485,0,0,'Warlock - Health Funnel (Rank 1)')
    ,(980,0,0.1,0,0,'Warlock - Curse of Agony (Rank 1)')
    ,(1120,0,0.4286,0,0,'Warlock - Drain Soul (Rank 1)')
    ,(1454,0.8,0,0,0,'Warlock - Life Tap (Rank 1)')
    ,(1463,0.8053,0,0,0,'Mage - Mana Shield (Rank 1)')
    ,(1949,0,0.0946,0,0,'Warlock - Hellfire (Rank 1)')
    ,(2060,1.2353,0,0,0,'Priest - Greater Heal (Rank 1)')
    ,(2061,0.6177,0,0,0,'Priest - Flash Heal (Rank 1)')
    ,(2120,0.2357,0.122,0,0,'Mage - Flamestrike (Rank 1)')
    ,(3606,0.1667,0,0,0,'Shaman - Attack (Rank 1)')
    ,(5138,0,0,0,0,'Warlock - Drain Mana (Rank 1)')
    ,(5176,0.5714,0,0,0,'Druid - Wrath (Rank 1)')
    ,(5185,1.6104,0,0,0,'Druid - Healing Touch (Rank 1)')
    ,(5570,0,0.127,0,0,'Druid - Insect Swarm (Rank 1)')
    ,(5672,0,0.045,0,0,'Shaman - Healing Stream (Rank 1)')
    ,(5857,0.1428,0,0,0,'Warlock - Hellfire Effect (Rank 1)')
    ,(6350,0.1667,0,0,0,'Shaman - Attack (Rank 2)')
    ,(6351,0.1667,0,0,0,'Shaman - Attack (Rank 3)')
    ,(6352,0.1667,0,0,0,'Shaman - Attack (Rank 4)')
    ,(6353,1.15,0,0,0,'Warlock - Soul Fire (Rank 1)')
    ,(7268,0.2857,0,0,0,'Mage - Arcane Missile (Rank 1)')
    ,(7269,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 2)')
    ,(7270,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 3)')
    ,(8026,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 1)')
    ,(8028,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 2)')
    ,(8029,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 3)')
    ,(8034,0.1,0,0,0,'Shaman - Frostbrand Attack (Rank 1)')
    ,(8042,0.3858,0,0,0,'Shaman - Earth Shock (Rank 1)')
    ,(8050,0.2142,0.1,0,0,'Shaman - Flame Shock (Rank 1)')
    ,(8056,0.3858,0,0,0,'Shaman - Frost Shock (Rank 1)')
    ,(8129,0,0,0,0,'Priest - Mana Burn (Rank 1)')
    ,(8418,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 5)')
    ,(8419,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 4)')
    ,(8443,0.2142,0,0,0,'Shaman - Fire Nova (Rank 1)')
    ,(8504,0.2142,0,0,0,'Shaman - Fire Nova (Rank 2)')
    ,(8505,0.2142,0,0,0,'Shaman - Fire Nova (Rank 3)')
    ,(8921,0.1515,0.13,0,0,'Druid - Moonfire (Rank 1)')
    ,(8936,0.3,0.1,0,0,'Druid - Regrowth (Rank 1)')
    ,(10273,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 6)')
    ,(10274,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 7)')
    ,(10435,0.1667,0,0,0,'Shaman - Attack (Rank 5)')
    ,(10436,0.1667,0,0,0,'Shaman - Attack (Rank 6)')
    ,(10444,0,0,0,0,'Shaman - Flametongue Attack (Rank 3)')
    ,(10445,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 4)')
    ,(11113,0.1357,0,0,0,'Mage - Blast Wave (Rank 1)')
    ,(11310,0.2142,0,0,0,'Shaman - Fire Nova (Rank 4)')
    ,(11311,0.2142,0,0,0,'Shaman - Fire Nova (Rank 5)')
    ,(11681,0.1428,0,0,0,'Warlock - Hellfire Effect (Rank 2)')
    ,(11682,0.1428,0,0,0,'Warlock - Hellfire Effect (Rank 3)')
    ,(14914,0.5711,0.024,0,0,'Priest - Holy Fire (Rank 1)')
    ,(15237,0.1606,0,0,0,'Priest - Holy Nova (Rank 1)')
    ,(15407,0,0.19,0,0,'Priest - Mind Flay (Rank 1)')
    ,(15662,0,0,0,0,'Mage - Fireball')
    ,(16343,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 5)')
    ,(16344,0.1,0,0,0,'Shaman - Flametongue Weapon Proc (Rank 6)')
    ,(18220,0.96,0,0,0,'Warlock - Dark Pact (Rank 1)')
    ,(18562,0,0,0,0,'Druid - Swiftmend')
    ,(18790,0,0,0,0,'Warlock - Fel Stamina')
    ,(20167,0.25,0,0.16,0,'Paladin - Seal of Light (Rank 1)')
    ,(20925,0.09,0,0.056,0,'Paladin - Holy Shield (Rank 1)')
    ,(23455,0.3035,0,0,0,'Priest - Holy Nova (Rank 1)')
    ,(23458,0.3035,0,0,0,'Priest - Holy Nova (Rank 2)')
    ,(23459,0.3035,0,0,0,'Priest - Holy Nova (Rank 3)')
    ,(24275,0.15,0,0.15,0,'Paladin - Hammer of Wrath (Rank 1)')
    ,(25346,0.2857,0,0,0,'Mage - Arcane Missiles (Rank 8)')
    ,(25742,0.07,0,0.039,0,'Paladin - Seal of Righteousness (Rank 1)')
    ,(26363,0.33,0,0,0,'Shaman - Lightning Shield (Rank 7)')
    ,(26364,0.33,0,0,0,'Shaman - Lightning Shield (Rank 1)')
    ,(26365,0.33,0,0,0,'Shaman - Lightning Shield (Rank 2)')
    ,(26366,0.33,0,0,0,'Shaman - Lightning Shield (Rank 3)')
    ,(26367,0.33,0,0,0,'Shaman - Lightning Shield (Rank 4)')
    ,(26369,0.33,0,0,0,'Shaman - Lightning Shield (Rank 5)')
    ,(26370,0.33,0,0,0,'Shaman - Lightning Shield (Rank 6)')
    ,(26573,0,0.04,0,0.04,'Paladin - Consecration (Rank 1)')
    ,(27803,0.3035,0,0,0,'Priest - Holy Nova (Rank 4)')
    ,(27804,0.3035,0,0,0,'Priest - Holy Nova (Rank 5)')
    ,(27805,0.3035,0,0,0,'Priest - Holy Nova (Rank 6)')
;

-- Insert warlock pet auras --------------------------------------------------
INSERT INTO `spell_pet_auras`
    (`spell`, `pet`, `aura`)
VALUES
     (23785, @PLAYER_PET_IMP,        23759) -- Master Demonologist
    ,(23823, @PLAYER_PET_IMP,        23827) -- Master Demonologist
    ,(23825, @PLAYER_PET_IMP,        23829) -- Master Demonologist
    ,(23822, @PLAYER_PET_IMP,        23826) -- Master Demonologist
    ,(23824, @PLAYER_PET_IMP,        23828) -- Master Demonologist
    ,(23825, @PLAYER_PET_FELHUNTER,  23840) -- Master Demonologist
    ,(23822, @PLAYER_PET_FELHUNTER,  23837) -- Master Demonologist
    ,(23785, @PLAYER_PET_FELHUNTER,  23762) -- Master Demonologist
    ,(23823, @PLAYER_PET_FELHUNTER,  23838) -- Master Demonologist
    ,(23824, @PLAYER_PET_FELHUNTER,  23839) -- Master Demonologist
    ,(23825, @PLAYER_PET_VOIDWALKER, 23844) -- Master Demonologist
    ,(23824, @PLAYER_PET_VOIDWALKER, 23843) -- Master Demonologist
    ,(23823, @PLAYER_PET_VOIDWALKER, 23842) -- Master Demonologist
    ,(23822, @PLAYER_PET_VOIDWALKER, 23841) -- Master Demonologist
    ,(23785, @PLAYER_PET_VOIDWALKER, 23760) -- Master Demonologist
    ,(23823, @PLAYER_PET_SUCCUBUS,   23834) -- Master Demonologist
    ,(23822, @PLAYER_PET_SUCCUBUS,   23833) -- Master Demonologist
    ,(23824, @PLAYER_PET_SUCCUBUS,   23835) -- Master Demonologist
    ,(23785, @PLAYER_PET_SUCCUBUS,   23761) -- Master Demonologist
    ,(23825, @PLAYER_PET_SUCCUBUS,   23836) -- Master Demonologist
;

-- Insert spells with modified threat values ---------------------------------
INSERT INTO `spell_threat`
    (`entry`,`Threat`,`multiplier`,`ap_bonus`)
VALUES
     (72,180,1,0)    -- Shield Bash (Rank 1)
    ,(78,20,1,0)     -- Heroic Strike (Rank 1)
    ,(99,15,1,0)     -- Demoralizing Roar (Rank 1)
    ,(284,39,1,0)    -- Heroic Strike (Rank 2)
    ,(285,59,1,0)    -- Heroic Strike (Rank 3)
    ,(770,108,1,0)   -- Faerie Fire (Rank 1)
    ,(845,10,1,0)    -- Cleave (Rank 1)
    ,(1160,43,1,0)   -- Demoralizing Shout (Rank 1)
    ,(1608,78,1,0)   -- Heroic Strike (Rank 4)
    ,(1715,61,1,0)   -- Hamstring (Rank 1)
    ,(1735,25,1,0)   -- Demoralizing Roar (Rank 2)
    ,(2139,300,1,0)  -- Counterspell
    ,(2649,415,1,0)  -- Growl (Rank 1)
    ,(3716,395,1,0)  -- Torment (Rank 1)
    ,(6343,17,1,0)   -- Thunder Clap (Rank 1)
    ,(6572,155,1,0)  -- Revenge (Rank 1)
    ,(6574,195,1,0)  -- Revenge (Rank 2)
    ,(6673,60,1,0)   -- Battle Shout (Rank 1)
    ,(6807,59,1,0)   -- Maul (Rank 1)
    ,(6809,89,1,0)   -- Maul (Rank 3)
    ,(7369,40,1,0)   -- Cleave (Rank 2)
    ,(7372,101,1,0)  -- Hamstring (Rank 2)
    ,(7373,141,1,0)  -- Hamstring (Rank 3)
    ,(7379,235,1,0)  -- Revenge (Rank 3)
    ,(7386,100,1,0)  -- Sunder Armor (Rank 1)
    ,(7405,140,1,0)  -- Sunder Armor (Rank 2)
    ,(8198,40,1,0)   -- Thunder Clap (Rank 2)
    ,(8204,64,1,0)   -- Thunder Clap (Rank 3)
    ,(8205,96,1,0)   -- Thunder Clap (Rank 4)
    ,(8380,180,1,0)  -- Sunder Armor (Rank 3)
    ,(8972,118,1,0)  -- Maul (Rank 4)
    ,(9490,29,1,0)   -- Demoralizing Roar (Rank 3)
    ,(9745,148,1,0)  -- Maul (Rank 5)
    ,(9747,36,1,0)   -- Demoralizing Roar (Rank 4)
    ,(9880,178,1,0)  -- Maul (Rank 6)
    ,(9881,207,1,0)  -- Maul (Rank 7)
    ,(9898,42,1,0)   -- Demoralizing Roar (Rank 5)
    ,(11564,98,1,0)  -- Heroic Strike (Rank 5)
    ,(11565,118,1,0) -- Heroic Strike (Rank 6)
    ,(11566,137,1,0) -- Heroic Strike (Rank 7)
    ,(11567,145,1,0) -- Heroic Strike (Rank 8)
    ,(11580,143,1,0) -- Thunder Clap (Rank 5)
    ,(11581,180,1,0) -- Thunder Clap (Rank 6)
    ,(11596,220,1,0) -- Sunder Armor (Rank 4)
    ,(11597,261,1,0) -- Sunder Armor (Rank 5)
    ,(11600,275,1,0) -- Revenge (Rank 4)
    ,(11601,315,1,0) -- Revenge (Rank 5)
    ,(11608,60,1,0)  -- Cleave (Rank 3)
    ,(11609,70,1,0)  -- Cleave (Rank 4)
    ,(14274,200,1,0) -- Distracting Shot (Rank 2)
    ,(15629,300,1,0) -- Distracting Shot (Rank 3)
    ,(15630,400,1,0) -- Distracting Shot (Rank 4)
    ,(15631,500,1,0) -- Distracting Shot (Rank 5)
    ,(15632,600,1,0) -- Distracting Shot (Rank 6)
    ,(16857,108,1,0) -- Faerie Fire (Feral) (Rank 1)
    ,(17735,200,1,0) -- Suffering (Rank 1)
    ,(17750,300,1,0) -- Suffering (Rank 2)
    ,(17751,450,1,0) -- Suffering (Rank 3)
    ,(17752,600,1,0) -- Suffering (Rank 4)
    ,(20243,101,1,0) -- Devastate (Rank 1)
    ,(20569,100,1,0) -- Cleave (Rank 5)
    ,(20736,100,1,0) -- Distracting Shot (Rank 1)
    ,(20925,20,1,0)  -- Holy Shield (Rank 1)
    ,(20927,30,1,0)  -- Holy Shield (Rank 2)
    ,(20928,40,1,0)  -- Holy Shield (Rank 3)
    ,(23922,160,1,0) -- Shield Slam (Rank 1)
    ,(23923,190,1,0) -- Shield Slam (Rank 2)
    ,(23924,220,1,0) -- Shield Slam (Rank 3)
    ,(23925,250,1,0) -- Shield Slam (Rank 4)
    ,(24394,580,1,0) -- Intimidation
    ,(24640,5,1,0)   -- Scorpid Poison (Rank 1)
    ,(25286,175,1,0) -- Heroic Strike (Rank 9)
    ,(25288,355,1,0) -- Revenge (Rank 6)
;

-- Insert weapon enchant spell procs -----------------------------------------
INSERT INTO `spell_proc_item_enchant`
    (`entry`,`ppmRate`)
VALUES
     (8034,9)    -- Frostbrand Attack (Rank 1)
    ,(13897,6)   -- Fiery Weapon
    ,(20004,6)   -- Life Steal
    ,(20005,1.6) -- Chilled
;

-- Insert target positions for spells ----------------------------------------
INSERT INTO `spell_target_position`
    (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`)
VALUES
     (31,0,-9464,62,56,0)                               -- Teleport Goldshire
    ,(33,0,-10643,1052,34,0)                            -- Teleport Westfall
    ,(34,0,-10368,-422,66,0)                            -- Teleport Duskwood
    ,(35,0,-9104,-70,83,0)                              -- Teleport Elwynn
    ,(427,189,1688.99,1053.48,18.6775,0.00117)          -- Teleport Monastery
    ,(428,0,-11020,1436,44,0)                           -- Teleport Moonbrook
    ,(442,129,2592.55,1107.5,51.29,4.74)                -- Teleport Northshire Abbey
    ,(443,0,16229,16265,14,4.74)                        -- Teleport Barracks
    ,(444,1,-4658.12,-2526.35,82.9671,0)                -- Teleport Lighthouse
    ,(445,0,-10566,-1189,28,0)                          -- Teleport Darkshire
    ,(446,109,-319.24,99.9,-131.85,3.19)                -- Teleport Cemetary
    ,(447,0,16229,16265,14,3.19)                        -- Teleport Treant
    ,(720,531,-8043.01,1254.21,-84.19,0)                -- Entangle
    ,(731,531,-8003,1222.9,-82.1,0)                     -- Entangle
    ,(1121,531,-8022.68,1150.08,-89.33,0)               -- Entangle
    ,(1936,0,16229,16265,14,0)                          -- Teleport Anvilmar
    ,(3561,0,-9003.46,870.031,29.6206,5.28)             -- Teleport: Stormwind
    ,(3562,0,-4613.62,-915.38,501.062,3.88)             -- Teleport: Ironforge
    ,(3563,0,1773.47,61.121,-46.3207,0.54)              -- Teleport: Undercity
    ,(3565,1,9660.81,2513.64,1331.66,3.06)              -- Teleport: Darnassus
    ,(3566,1,-964.98,283.433,111.187,3.02)              -- Teleport: Thunder Bluff
    ,(3567,1,1469.85,-4221.52,58.9939,5.98)             -- Teleport: Orgrimmar
    ,(3721,0,16229,16265,14,3.19)                       -- Teleport Altar of the Tides
    ,(4801,531,-8340.78,2083.81,125.649,0)              -- Teleport
    ,(4996,1,1552.5,-4420.66,8.94802,0)                 -- [PH] Teleport to Orgrimmar
    ,(4997,0,-14457,496.45,39.1392,0)                   -- [PH] Teleport to Booty Bay
    ,(4998,0,-12415,207.618,31.5017,0.124875)           -- [PH] Teleport to Grom'Gol
    ,(4999,1,-998.359,-3827.52,5.44507,4.16654)         -- [PH] Teleport to Ratchet
    ,(6348,0,-3752.81,-851.558,10.1153,0)               -- [PH] Teleport to Menethil Harbor
    ,(6349,1,6581.05,767.5,5.78428,6.01616)             -- [PH] Teleport to Auberdine
    ,(6483,1,5483.9,-749.881,334.621,0)                 -- [PH] Teleport to Felwood
    ,(6714,1,-4884.49,-1596.2,101.2,3.17)               -- Test of Faith
    ,(6719,1,-3615.49,-4467.34,24.3141,0)               -- [PH] Teleport to Theramore
    ,(6766,1,-2354.03,-1902.07,95.78,4.6)               -- Test of Lore
    ,(7136,33,-105.654,2154.98,156.43,1.24782)          -- Shadow Port
    ,(7586,33,-84.99,2151.01,155.62,1.11623)            -- Shadow Port
    ,(7587,33,-103.46,2122.1,155.655,4.4224)            -- Shadow Port
    ,(8136,43,116.35,239.8,-95.08,3.1)                  -- Naralex's Awakening
    ,(8195,531,-8341.55,2118.5,133.058,0)               -- Teleport
    ,(8606,0,325.8,-1481.47,42.68,0.47)                 -- Summon Cyclonian
    ,(8735,48,-151.89,106.96,-39.87,4.53)               -- Blackfathom Teleport
    ,(8995,0,-2646.62,-2455.57,80.87,0)                 -- Shoot (Rank 1)
    ,(8996,0,-2645.25,-2449.5,82.65,0)                  -- Shoot (Rank 1)
    ,(8997,0,-2648.88,-2442.54,80.71,0)                 -- Shoot (Rank 1)
    ,(9002,0,-2625,-2423,79,0)                          -- Coarse Dynamite
    ,(9003,0,-2607,-2434,80,0)                          -- Coarse Dynamite
    ,(9004,0,-2634,-2411,81,0)                          -- Coarse Dynamite
    ,(9055,0,-1350.83,-2740.16,62.74,2.95)              -- Create Witherbark Totem Bundle
    ,(9268,1,8786.36,967.445,30.197,3.39632)            -- Teleport to Darnassus - Event
    ,(11012,1,161,299.05,-51.36,0.37)                   -- Stone Watcher of Norgannon Spawn
    ,(11362,0,-5095,757,261,4.42)                       -- Teleport to Gnomeregan
    ,(11409,0,-14462,460,16,3.49)                       -- Teleport to Booty Bay
    ,(11511,90,-530.754,670.571,-313.784,0)             -- Activate Bomb A
    ,(11795,90,-530.754,670.571,-313.784,0)             -- Activate Bomb B
    ,(12158,90,-478.448,-89.3074,-146.602,0)            -- Explosion
    ,(12159,90,-562.7,-121.674,-150.862,0)              -- Explosion
    ,(12241,1,-3254.76,2022.67,250.716,4.15)            -- Twin Colossals Teleport
    ,(12510,1,3778,-4612,228,4.23263)                   -- Teleport to Azshara Tower
    ,(12520,1,3641,-4702,121,6.25)                      -- Teleport from Azshara Tower
    ,(12885,0,-11238.4,-2831.97,157.93,5.11)            -- Teleport to Razelikh
    ,(13044,0,-11224.8,-2835.35,158.85,3.73)            -- Teleport to Ground
    ,(13142,0,-11238.4,-2831.97,157.93,5.11)            -- Teleport to Razelikh
    ,(13461,0,-11234.8,-2842.52,157.92,1.47)            -- Go Home
    ,(13912,230,1380.58,-819.48,-92.72,4.69)            -- Princess Summons Portal
    ,(14208,1,-6025.75,-1021.17,-216,0)                 -- JD Explosion
    ,(15737,230,611.073,-222.201,-52.6412,0)            -- Arena Flash
    ,(15739,230,600.752,-225.146,-52.6315,0)            -- Arena Flash
    ,(15740,230,630.355,-174.342,-52.6395,0)            -- Arena Flash
    ,(15741,230,633.182,-184.641,-52.6346,0)            -- Arena Flash
    ,(17086,249,25,-216.025,-84.874,3.142)              -- Breath
    ,(17087,249,15,-216.025,-85.8052,3.142)             -- Breath
    ,(17088,249,5,-216.025,-86.0683,3.142)              -- Breath
    ,(17089,249,-5,-216.025,-86.9675,3.142)             -- Breath
    ,(17090,249,-15,-216.025,-88.3522,3.142)            -- Breath
    ,(17091,249,-25,-216.025,-89.2463,3.142)            -- Breath
    ,(17092,249,-35,-216.025,-87.4351,3.142)            -- Breath
    ,(17093,249,-45,-216.025,-86.4653,3.142)            -- Breath
    ,(17094,249,-55,-216.025,-85.3717,3.142)            -- Breath
    ,(17095,249,-65,-216.025,-84.3052,3.142)            -- Breath
    ,(17097,249,-75,-216.025,-83.395,3.142)             -- Breath
    ,(17159,1,6106.4,-4191.1,849.74,0.0201)             -- Port to Haleh
    ,(17160,1,5904.2,-4045.9,596.43,0.0083)             -- Port to Mazthoril
    ,(17237,329,3838,-3500,195,0)                       -- Upgrade Zigguraut
    ,(17239,329,3847,-3748,195,0)                       -- Upgrade Zigguraut
    ,(17240,329,4057,-3665,182,0)                       -- Upgrade Zigguraut
    ,(17278,329,3533.95,-2965.1,125,0)                  -- Cannon Fire
    ,(17334,0,-9003.46,870.031,29.6206,2.28)            -- Portal Effect: Stormwind
    ,(17475,329,4012.92,-3365.7,116.251,5.48)           -- Raise Dead
    ,(17476,329,4009.1,-3352.31,116.712,0.13)           -- Raise Dead
    ,(17477,329,4013.96,-3338.65,116.242,0.72)          -- Raise Dead
    ,(17478,329,4051.75,-3339.05,116.241,3.62)          -- Raise Dead
    ,(17479,329,4055.96,-3351.46,116.586,3.06)          -- Raise Dead
    ,(17480,329,4053.11,-3364.98,116.402,2.45)          -- Raise Dead
    ,(17607,0,-4613.62,-915.38,501.062,3.88)            -- Portal Effect: Ironforge
    ,(17608,1,9660.81,2513.64,1331.66,3.06)             -- Portal Effect: Darnassus
    ,(17609,1,1469.85,-4221.52,58.9939,5.98)            -- Portal Effect: Orgrimmar
    ,(17610,1,-964.98,283.433,111.187,3.02)             -- Portal Effect: Thunder Bluff
    ,(17611,0,1773.47,61.121,-46.3207,0.54)             -- Portal Effect: Undercity
    ,(17863,289,250.07,0.3921,84.8408,3.149)            -- Shadow Portal
    ,(17939,289,181.422,-91.9481,84.841,1.608)          -- Shadow Portal
    ,(17943,289,95.1547,-1.8173,85.2289,0.043)          -- Shadow Portal
    ,(17944,289,250.07,0.3921,72.6722,3.149)            -- Shadow Portal
    ,(17946,289,181.422,-91.9481,70.7734,1.608)         -- Shadow Portal
    ,(17948,289,106.154,-1.8994,75.3663,0.043)          -- Shadow Portal
    ,(18351,249,-68.8342,-215.036,-84.0189,6.28)        -- Breath
    ,(18352,249,-61.8343,-215.052,-84.6734,6.28)        -- Breath
    ,(18353,249,-53.3433,-215.071,-85.5972,6.28)        -- Breath
    ,(18354,249,-42.6193,-215.095,-86.6636,6.28)        -- Breath
    ,(18355,249,-35.8993,-215.11,-87.1965,6.28)         -- Breath
    ,(18356,249,-28.2483,-215.127,-89.1917,6.28)        -- Breath
    ,(18357,249,-20.3244,-215.145,-88.964,6.28)         -- Breath
    ,(18358,249,-11.1894,-215.166,-87.8171,6.28)        -- Breath
    ,(18359,249,-2.04741,-215.186,-86.2797,6.28)        -- Breath
    ,(18360,249,7.47957,-215.208,-86.0755,6.28)         -- Breath
    ,(18361,249,20.7305,-215.238,-85.2544,6.28)         -- Breath
    ,(18564,249,-56.5597,-241.224,-85.4236,0.666)       -- Breath
    ,(18565,249,-51.0675,-228.91,-85.7656,0.666)        -- Breath
    ,(18566,249,-41.7621,-221.897,-86.1141,0.666)       -- Breath
    ,(18567,249,-35.4399,-217.26,-87.3363,0.666)        -- Breath
    ,(18568,249,-29.4959,-213.014,-88.9104,0.666)       -- Breath
    ,(18569,249,-23.6503,-221.969,-89.1727,0.666)       -- Breath
    ,(18570,249,-15.6021,-216.894,-88.4032,0.666)       -- Breath
    ,(18571,249,-14.3212,-199.462,-87.9225,0.666)       -- Breath
    ,(18572,249,-8.4493,-193.958,-87.565,0.666)         -- Breath
    ,(18573,249,-2.52965,-188.69,-87.1729,0.666)        -- Breath
    ,(18574,249,3.86022,-183.227,-86.3754,0.666)        -- Breath
    ,(18575,249,6.01671,-181.306,-85.6546,0.666)        -- Breath
    ,(18576,249,-37.7439,-243.668,-88.2177,1.416)       -- Breath
    ,(18578,249,-35.8053,-232.029,-87.7492,1.416)       -- Breath
    ,(18579,249,-34.0457,-224.715,-85.5295,1.416)       -- Breath
    ,(18580,249,-32.0816,-214.917,-88.3274,1.416)       -- Breath
    ,(18581,249,-36.6117,-202.685,-85.6538,1.416)       -- Breath
    ,(18582,249,-37.0673,-195.759,-87.7458,1.416)       -- Breath
    ,(18583,249,-37.7285,-188.617,-88.0749,1.416)       -- Breath
    ,(18584,249,6.01671,-181.306,-85.6546,3.776)        -- Breath
    ,(18585,249,3.86022,-183.227,-86.3754,3.776)        -- Breath
    ,(18586,249,-2.52965,-188.69,-87.1729,3.776)        -- Breath
    ,(18587,249,-8.4493,-193.958,-87.565,3.776)         -- Breath
    ,(18588,249,-14.3212,-199.462,-87.9225,3.776)       -- Breath
    ,(18589,249,-15.6021,-216.894,-88.4032,3.776)       -- Breath
    ,(18590,249,-23.6503,-221.969,-89.1727,3.776)       -- Breath
    ,(18591,249,-29.4959,-213.014,-88.9104,3.776)       -- Breath
    ,(18592,249,-35.4399,-217.26,-87.3363,3.776)        -- Breath
    ,(18593,249,-41.7621,-221.897,-86.1141,3.776)       -- Breath
    ,(18594,249,-51.0675,-228.91,-85.7656,3.776)        -- Breath
    ,(18595,249,-56.5597,-241.224,-85.4236,3.776)       -- Breath
    ,(18596,249,-58.2509,-189.02,-85.2923,5.587)        -- Breath
    ,(18597,249,-52.0063,-193.797,-85.8088,5.587)       -- Breath
    ,(18598,249,-46.1355,-198.549,-85.9018,5.587)       -- Breath
    ,(18599,249,-40.5002,-203.001,-85.5551,5.587)       -- Breath
    ,(18600,249,-30.9076,-211.058,-88.5921,5.587)       -- Breath
    ,(18601,249,-20.0981,-218.681,-88.9371,5.587)       -- Breath
    ,(18602,249,-12.2232,-224.666,-87.8563,5.587)       -- Breath
    ,(18603,249,-6.4753,-229.099,-87.0764,5.587)        -- Breath
    ,(18604,249,-2.01026,-232.542,-86.9951,5.587)       -- Breath
    ,(18605,249,2.7363,-236.202,-86.7904,5.587)         -- Breath
    ,(18606,249,7.19778,-239.643,-86.3073,5.587)        -- Breath
    ,(18607,249,12.1209,-243.439,-85.8743,5.587)        -- Breath
    ,(18609,249,-37.7285,-188.617,-88.0749,4.526)       -- Breath
    ,(18611,249,-37.0673,-195.759,-87.7458,4.526)       -- Breath
    ,(18612,249,-36.6117,-202.685,-85.6538,4.526)       -- Breath
    ,(18613,249,-32.0816,-214.917,-88.3274,4.526)       -- Breath
    ,(18614,249,-34.0457,-224.715,-85.5295,4.526)       -- Breath
    ,(18615,249,-35.8053,-232.029,-87.7492,4.526)       -- Breath
    ,(18616,249,-37.7439,-243.668,-88.2177,4.526)       -- Breath
    ,(18617,249,12.1209,-243.439,-85.8743,2.428)        -- Breath
    ,(18618,249,-58.2509,-189.02,-85.2923,2.428)        -- Breath
    ,(18619,249,7.19778,-239.643,-86.3073,2.428)        -- Breath
    ,(18620,249,2.7363,-236.202,-86.7904,2.428)         -- Breath
    ,(18621,249,-2.01026,-232.542,-86.9951,2.428)       -- Breath
    ,(18622,249,-6.4753,-229.099,-87.0764,2.428)        -- Breath
    ,(18623,249,-12.2232,-224.666,-87.8563,2.428)       -- Breath
    ,(18624,249,-20.0981,-218.681,-88.9371,2.428)       -- Breath
    ,(18625,249,-30.9076,-211.058,-88.5921,2.428)       -- Breath
    ,(18626,249,-40.5002,-203.001,-85.5551,2.428)       -- Breath
    ,(18627,249,-46.1355,-198.549,-85.9018,2.428)       -- Breath
    ,(18628,249,-52.0063,-193.797,-85.8088,2.428)       -- Breath
    ,(18960,1,7991.88,-2679.84,512.1,0.034183)          -- Teleport: Moonglade
    ,(20449,531,-8318.82,2058.23,133.058,0)             -- Teleport
    ,(20534,409,736.516,-1176.35,-119.006,0)            -- Teleport
    ,(20618,409,736.516,-1176.35,-119.006,0)            -- Teleport
    ,(20682,1,-4018.1,-4525.24,12,6.13)                 -- Teleport
    ,(21128,349,419.84,11.3365,-131.079,0)              -- Maraudon Portal Effect
    ,(21132,249,-120.471,-214.335,-71.9481,3.142)       -- Breath
    ,(21133,249,-142.719,-213.206,-68.8335,3.142)       -- Breath
    ,(21135,249,-162.585,-205.683,-68.7282,3.142)       -- Breath
    ,(21136,249,-194.92,-206.546,-68.7282,3.142)        -- Breath
    ,(21137,249,-173.573,-186.406,-66.1293,3.142)       -- Breath
    ,(21138,249,-164.067,-164.104,-59.5405,3.142)       -- Breath
    ,(21139,249,-144.485,-149.742,-53.8462,3.142)       -- Breath
    ,(22191,249,-42.4794,-270.487,-92.11,0)             -- Heated Ground
    ,(22192,249,-59.0983,-269.976,-94.3079,0)           -- Heated Ground
    ,(22193,249,-72.5971,-264.395,-94.267,0)            -- Heated Ground
    ,(22194,249,-88.7517,-259.617,-93.7426,0)           -- Heated Ground
    ,(22195,249,-104.072,-244.79,-94.0876,0)            -- Heated Ground
    ,(22196,249,-106.875,-223.247,-94.6765,0)           -- Heated Ground
    ,(22197,249,-107.076,-197.489,-94.1113,0)           -- Heated Ground
    ,(22198,249,-102.751,-181.577,-94.06,0)             -- Heated Ground
    ,(22199,249,-89.9793,-171.261,-93.8249,0)           -- Heated Ground
    ,(22200,249,-72.6705,-164.756,-94.2678,0)           -- Heated Ground
    ,(22201,249,-50.8834,-159.992,-93.6519,0)           -- Heated Ground
    ,(22202,249,-40.259,-158.961,-91.75,0)              -- Heated Ground
    ,(22267,249,-85,-216.025,-82.5516,3.142)            -- Breath
    ,(22268,249,-96.8227,-214.425,-82.2065,3.142)       -- Breath
    ,(22563,30,-1345.82,-289.861,90.8835,5.19479)       -- Recall
    ,(22564,30,665.02,-27.7919,50.6199,3.36559)         -- Recall
    ,(22651,429,-25.98,-448.24,-36.09,3.13)             -- Sacrifice
    ,(22668,469,-7581.11,-1216.19,476.8,0)              -- Shadowblink
    ,(22669,469,-7542.47,-1191.92,476.355,0)            -- Shadowblink
    ,(22670,469,-7506.58,-1165.26,476.796,0)            -- Shadowblink
    ,(22671,469,-7561.54,-1244.01,476.8,0)              -- Shadowblink
    ,(22674,469,-7538.63,-1273.64,476.8,0)              -- Shadowblink
    ,(22675,469,-7500.7,-1249.89,476.798,0)             -- Shadowblink
    ,(22676,469,-7469.93,-1227.93,476.777,0)            -- Shadowblink
    ,(22950,429,-37.5643,813.433,-7.43823,4.77)         -- Portal of Immol'thar
    ,(22951,1,-3760.87,1086.28,131.96,1.53)             -- Summon Player
    ,(22972,469,-7538.63,-1277.56,476.799,0)            -- Shadow Flame
    ,(22975,469,-7557.95,-1249.87,476.799,0)            -- Shadow Flame
    ,(22976,469,-7579.59,-1218.76,476.799,0)            -- Shadow Flame
    ,(22977,469,-7599.83,-1190.94,475.472,0)            -- Shadow Flame
    ,(22978,469,-7497.51,-1249.17,476.798,0)            -- Shadow Flame
    ,(22979,469,-7519.9,-1218.85,476.799,0)             -- Shadow Flame
    ,(22980,469,-7540.82,-1190.7,476.355,0)             -- Shadow Flame
    ,(22981,469,-7461.41,-1226.29,476.781,0)            -- Shadow Flame
    ,(22982,469,-7483.16,-1195.39,476.799,0)            -- Shadow Flame
    ,(22983,469,-7504.77,-1164.43,476.797,0)            -- Shadow Flame
    ,(22984,469,-7524.15,-1138.16,473.348,0)            -- Shadow Flame
    ,(22985,469,-7538.63,-1277.56,476.799,0)            -- Shadow Flame
    ,(23441,1,-7109.1,-3825.21,10.151,2.8331)           -- Gadgetzan Transporter
    ,(23442,1,6755.33,-4658.09,724.8,3.4049)            -- Everlook Transporter
    ,(23446,1,-7303,-3545,137,2.8331)                   -- Gadgetzan Transporter Failure
    ,(23460,469,-7672.46,-1107.19,396.65,0.59)          -- Teleport to Blackwing Lair DND
    ,(24228,309,-11516.1,-1605.31,41.3,0)               -- Vanish
    ,(24325,309,-11726.3,-1777.38,10.46,0.16)           -- Pagle's Point Cast - Create Mudskunk Lure
    ,(24593,309,-11726.3,-1777.38,10.46,0.16)           -- Pagle's Point Cast - Create Splash and Quake
    ,(24730,1,-1327.66,85.9815,134.169,0)               -- Cannon Prep
    ,(25139,409,1096,-467,-104.6,3.64)                  -- Teleport to Molten Core DND
    ,(25182,1,-8124.41,1525.13,16.368,3.05)             -- Staghelm Shatters Hammer DND
    ,(25725,509,-9717.2,1517.81,27.6,5.4)               -- Paralyze
    ,(26448,1,7571.95,-2202.04,474.86,5.4358)           -- Holiday - Teleport: Moonglade
    ,(26450,1,10150.1,2602,1330.83,4.80894)             -- Holiday - Lunar Teleport: Darnassus
    ,(26452,0,-4663,-955.663,500.377,0.722862)          -- Holiday - Lunar Teleport: Ironforge
    ,(26453,1,1982.9,-4255.62,31.6692,3.31984)          -- Holiday - Lunar Teleport: Orgrimmar
    ,(26454,0,-8748.48,1073.61,90.4898,5.03789)         -- Holiday - Lunar Teleport: Stormwind
    ,(26455,1,-1031.45,-230.867,160.14,3.28358)         -- Holiday - Lunar Teleport: Thunderbluff
    ,(26456,0,1642.01,239.002,62.5918,3.02316)          -- Holiday - Lunar Teleport: Undercity
    ,(28025,533,2692,-3399.27,267.686,4.70454)          -- Teleport Left
    ,(28026,533,2692,-3321.86,267.686,2.19126)          -- Teleport Right
    ,(28280,533,3125.44,-3309.74,293.251,3.14929)       -- Bombard Slime
    ,(28444,533,3005.74,-3434.27,304.196,0)             -- Portal Effect: Deathknight Wing
    ,(29181,531,-8971.81,1321.47,-104.249,0)            -- Teleport to Twin Emps Effect DND
    ,(29190,531,-8632.84,2055.87,108.86,0)              -- Teleport to Final Chamber Effect DND
    ,(29216,533,2633.49,-3529.56,274.111,0)             -- Teleport
    ,(29217,533,2646.37,-3466.23,263.098,6.17666)       -- Summon Skeleton
    ,(29224,533,2704.86,-3458.79,264.067,5.43839)       -- Summon Skeleton
    ,(29225,533,2725.71,-3463.45,263.415,5.45017)       -- Summon Skeleton
    ,(29226,533,2724.76,-3514.27,263.067,2.87018)       -- Summon Skeleton
    ,(29227,533,2663.92,-3464.7,262.574,5.15958)        -- Summon Skeleton
    ,(29231,533,2685.06,-3502.37,261.315,0)             -- Teleport Return
    ,(29237,533,2648.83,-3467.3,262.399,5.46297)        -- Summon Skeletons
    ,(29238,533,2684.95,-3457.55,262.578,4.62159)       -- Summon Skeleton
    ,(29239,533,2706.78,-3461.59,262.517,4.00358)       -- Summon Skeleton
    ,(29247,533,2646.37,-3466.23,263.098,5.46297)       -- Summon Skeleton
    ,(29248,533,2704.86,-3458.79,264.067,4.31236)       -- Summon Skeleton
    ,(29249,533,2724.76,-3514.27,263.067,3.09084)       -- Summon Skeleton
    ,(29255,533,2704.22,-3461.86,262.546,4.37027)       -- Summon Skeleton
    ,(29256,533,2663.7,-3461.9,263.763,5.07774)         -- Summon Skeleton
    ,(29257,533,2704.86,-3458.79,264.067,3.85584)       -- Summon Skeleton
    ,(29258,533,2722.03,-3514.3,262.354,2.84269)        -- Summon Skeleton
    ,(29262,533,2727.58,-3535.23,263.012,2.60314)       -- Summon Skeleton
    ,(29267,533,2711.72,-3458.56,262.384,4.02864)       -- Summon Skeleton
    ,(29268,533,2646.93,-3470.95,262.427,5.51363)       -- Summon Skeleton
    ,(29273,533,3498.28,-5349.9,144.968,1.31324)        -- Teleport
    ,(29318,533,3493.45,-5375.38,138.168,0)             -- Frost Breath
    ,(30211,533,2794.61,-3707.68,276.552,2.32)          -- Teleport Self
;

-- Insert spells that teach other spells -------------------------------------
INSERT INTO `spell_learn_spell`
    (`entry`,`SpellID`,`Active`)
VALUES
     (2842,8681,1)   -- 'Poisons' teaches 'Instant Poison (Rank 1)'
    ,(5149,1853,1)   -- 'Beast Training' teaches 'Growl (Rank 1)'
    ,(5149,14922,1)  -- 'Beast Training' teaches 'Growl (Rank 2)'
    ,(5784,33388,1)  -- 'Summon Felsteed (Summon)' teaches 'Riding (Apprentice)'
    ,(13819,33388,1) -- 'Summon Warhorse (Summon)' teaches 'Riding (Apprentice)'
    ,(17002,24867,0) -- 'Feline Swiftness' teaches 'Feline Swiftness Passive 1a'
    ,(23161,33391,1) -- 'Summon Dreadsteed (Summon)' teaches 'Riding (Journeyman)'
    ,(23214,33391,1) -- 'Summon Charger (Summon)' teaches 'Riding (Journeyman)'
    ,(24866,24864,0) -- 'Feline Swiftness' teaches 'Feline Swiftness Passive 2a'
;

-- Insert spell chains for ranked spells -------------------------------------
INSERT INTO `spell_chain`
    (`spell_id`,`prev_spell`,`first_spell`,`rank`,`req_spell`)
VALUES
     (10,0,10,1,0)      -- 'Blizzard (Rank 1)'
    ,(17,0,17,1,0)      -- 'Power Word: Shield (Rank 1)'
    ,(116,0,116,1,0)    -- 'Frostbolt (Rank 1)'
    ,(118,0,118,1,0)    -- 'Polymorph (Rank 1)'
    ,(120,0,120,1,0)    -- 'Cone of Cold (Rank 1)'
    ,(122,0,122,1,0)    -- 'Frost Nova (Rank 1)'
    ,(133,0,133,1,0)    -- 'Fireball (Rank 1)'
    ,(136,0,136,1,0)    -- 'Mend Pet (Rank 1)'
    ,(139,0,139,1,0)    -- 'Renew (Rank 1)'
    ,(143,133,133,2,0)    -- 'Fireball (Rank 2)'
    ,(145,143,133,3,0)    -- 'Fireball (Rank 3)'
    ,(168,0,168,1,0)    -- 'Frost Armor (Rank 1)'
    ,(172,0,172,1,0)    -- 'Corruption (Rank 1)'
    ,(205,116,116,2,0)    -- 'Frostbolt (Rank 2)'
    ,(324,0,324,1,0)    -- 'Lightning Shield (Rank 1)'
    ,(325,324,324,2,0)    -- 'Lightning Shield (Rank 2)'
    ,(331,0,331,1,0)    -- 'Healing Wave (Rank 1)'
    ,(332,331,331,2,0)    -- 'Healing Wave (Rank 2)'
    ,(339,0,339,1,0)    -- 'Entangling Roots (Rank 1)'
    ,(348,0,348,1,0)    -- 'Immolate (Rank 1)'
    ,(370,0,370,1,0)    -- 'Purge (Rank 1)'
    ,(403,0,403,1,0)    -- 'Lightning Bolt (Rank 1)'
    ,(421,0,421,1,0)    -- 'Chain Lightning (Rank 1)'
    ,(453,0,453,1,0)    -- 'Mind Soothe (Rank 1)'
    ,(467,0,467,1,0)    -- 'Thorns (Rank 1)'
    ,(498,0,498,1,0)    -- 'Divine Protection (Rank 1)'
    ,(527,0,527,1,0)    -- 'Dispel Magic (Rank 1)'
    ,(529,403,403,2,0)    -- 'Lightning Bolt (Rank 2)'
    ,(543,0,543,1,0)    -- 'Fire Ward (Rank 1)'
    ,(547,332,331,3,0)    -- 'Healing Wave (Rank 3)'
    ,(548,529,403,3,0)    -- 'Lightning Bolt (Rank 3)'
    ,(585,0,585,1,0)    -- 'Smite (Rank 1)'
    ,(586,0,586,1,0)    -- 'Fade (Rank 1)'
    ,(587,0,587,1,0)    -- 'Conjure Food (Rank 1)'
    ,(588,0,588,1,0)    -- 'Inner Fire (Rank 1)'
    ,(589,0,589,1,0)    -- 'Shadow Word: Pain (Rank 1)'
    ,(591,585,585,2,0)    -- 'Smite (Rank 2)'
    ,(592,17,17,2,0)    -- 'Power Word: Shield (Rank 2)'
    ,(594,589,589,2,0)    -- 'Shadow Word: Pain (Rank 2)'
    ,(596,0,596,1,0)    -- 'Prayer of Healing (Rank 1)'
    ,(597,587,587,2,0)    -- 'Conjure Food (Rank 2)'
    ,(598,591,585,3,0)    -- 'Smite (Rank 3)'
    ,(600,592,17,3,0)    -- 'Power Word: Shield (Rank 3)'
    ,(602,7128,588,3,0)    -- 'Inner Fire (Rank 3)'
    ,(604,0,604,1,0)    -- 'Dampen Magic (Rank 1)'
    ,(605,0,605,1,0)    -- 'Mind Control (Rank 1)'
    ,(635,0,635,1,0)    -- 'Holy Light (Rank 1)'
    ,(639,635,635,2,0)    -- 'Holy Light (Rank 2)'
    ,(642,0,642,1,0)    -- 'Divine Shield (Rank 1)'
    ,(647,639,635,3,0)    -- 'Holy Light (Rank 3)'
    ,(686,0,686,1,0)    -- 'Shadow Bolt (Rank 1)'
    ,(687,0,687,1,0)    -- 'Demon Skin (Rank 1)'
    ,(689,0,689,1,0)    -- 'Drain Life (Rank 1)'
    ,(693,0,693,1,0)    -- 'Create Soulstone (Minor)'
    ,(695,686,686,2,0)    -- 'Shadow Bolt (Rank 2)'
    ,(696,687,687,2,0)    -- 'Demon Skin (Rank 2)'
    ,(699,689,689,2,0)    -- 'Drain Life (Rank 2)'
    ,(702,0,702,1,0)    -- 'Curse of Weakness (Rank 1)'
    ,(704,0,704,1,0)    -- 'Curse of Recklessness (Rank 1)'
    ,(705,695,686,3,0)    -- 'Shadow Bolt (Rank 3)'
    ,(706,0,706,1,0)    -- 'Demon Armor (Rank 1)'
    ,(707,348,348,2,0)    -- 'Immolate (Rank 2)'
    ,(709,699,689,3,0)    -- 'Drain Life (Rank 3)'
    ,(710,0,710,1,0)    -- 'Banish (Rank 1)'
    ,(724,0,724,1,0)    -- 'Lightwell (Rank 1)'
    ,(740,0,740,1,0)    -- 'Tranquility (Rank 1)'
    ,(755,0,755,1,0)    -- 'Health Funnel (Rank 1)'
    ,(770,0,770,1,0)    -- 'Faerie Fire (Rank 1)'
    ,(774,0,774,1,0)    -- 'Rejuvenation (Rank 1)'
    ,(778,770,770,2,0)    -- 'Faerie Fire (Rank 2)'
    ,(781,0,781,1,0)    -- 'Disengage (Rank 1)'
    ,(782,467,467,2,0)    -- 'Thorns (Rank 2)'
    ,(837,205,116,3,0)    -- 'Frostbolt (Rank 3)'
    ,(853,0,853,1,0)    -- 'Hammer of Justice (Rank 1)'
    ,(865,122,122,2,0)    -- 'Frost Nova (Rank 2)'
    ,(879,0,879,1,0)    -- 'Exorcism (Rank 1)'
    ,(905,325,324,3,0)    -- 'Lightning Shield (Rank 3)'
    ,(913,547,331,4,0)    -- 'Healing Wave (Rank 4)'
    ,(915,548,403,4,0)    -- 'Lightning Bolt (Rank 4)'
    ,(930,421,421,2,0)    -- 'Chain Lightning (Rank 2)'
    ,(939,913,331,5,0)    -- 'Healing Wave (Rank 5)'
    ,(943,915,403,5,0)    -- 'Lightning Bolt (Rank 5)'
    ,(945,905,324,4,0)    -- 'Lightning Shield (Rank 4)'
    ,(959,939,331,6,0)    -- 'Healing Wave (Rank 6)'
    ,(970,594,589,3,0)    -- 'Shadow Word: Pain (Rank 3)'
    ,(976,0,976,1,0)    -- 'Shadow Protection (Rank 1)'
    ,(980,0,980,1,0)    -- 'Curse of Agony (Rank 1)'
    ,(984,598,585,4,0)    -- 'Smite (Rank 4)'
    ,(988,527,527,2,0)    -- 'Dispel Magic (Rank 2)'
    ,(990,597,587,3,0)    -- 'Conjure Food (Rank 3)'
    ,(992,970,589,4,0)    -- 'Shadow Word: Pain (Rank 4)'
    ,(996,596,596,2,0)    -- 'Prayer of Healing (Rank 2)'
    ,(1004,984,585,5,0)    -- 'Smite (Rank 5)'
    ,(1006,602,588,4,0)    -- 'Inner Fire (Rank 4)'
    ,(1008,0,1008,1,0)    -- 'Amplify Magic (Rank 1)'
    ,(1014,980,980,2,0)    -- 'Curse of Agony (Rank 2)'
    ,(1020,642,642,2,0)    -- 'Divine Shield (Rank 2)'
    ,(1022,0,1022,1,0)    -- 'Blessing of Protection (Rank 1)'
    ,(1026,647,635,4,0)    -- 'Holy Light (Rank 4)'
    ,(1038,0,1038,1,0)    -- 'Blessing of Salvation'
    ,(1042,1026,635,5,0)    -- 'Holy Light (Rank 5)'
    ,(1058,774,774,2,0)    -- 'Rejuvenation (Rank 2)'
    ,(1062,339,339,2,0)    -- 'Entangling Roots (Rank 2)'
    ,(1064,0,1064,1,0)    -- 'Chain Heal (Rank 1)'
    ,(1075,782,467,3,0)    -- 'Thorns (Rank 3)'
    ,(1086,706,706,2,0)    -- 'Demon Armor (Rank 2)'
    ,(1088,705,686,4,0)    -- 'Shadow Bolt (Rank 4)'
    ,(1094,707,348,3,0)    -- 'Immolate (Rank 3)'
    ,(1098,0,1098,1,0)    -- 'Enslave Demon (Rank 1)'
    ,(1106,1088,686,5,0)    -- 'Shadow Bolt (Rank 5)'
    ,(1108,702,702,2,0)    -- 'Curse of Weakness (Rank 2)'
    ,(1120,0,1120,1,0)    -- 'Drain Soul (Rank 1)'
    ,(1126,0,1126,1,0)    -- 'Mark of the Wild (Rank 1)'
    ,(1130,0,1130,1,0)    -- 'Hunter\'s Mark (Rank 1)'
    ,(1243,0,1243,1,0)    -- 'Power Word: Fortitude (Rank 1)'
    ,(1244,1243,1243,2,0)    -- 'Power Word: Fortitude (Rank 2)'
    ,(1245,1244,1243,3,0)    -- 'Power Word: Fortitude (Rank 3)'
    ,(1430,1058,774,3,0)    -- 'Rejuvenation (Rank 3)'
    ,(1449,0,1449,1,0)    -- 'Arcane Explosion (Rank 1)'
    ,(1454,0,1454,1,0)    -- 'Life Tap (Rank 1)'
    ,(1455,1454,1454,2,0)    -- 'Life Tap (Rank 2)'
    ,(1456,1455,1454,3,0)    -- 'Life Tap (Rank 3)'
    ,(1459,0,1459,1,0)    -- 'Arcane Intellect (Rank 1)'
    ,(1460,1459,1459,2,0)    -- 'Arcane Intellect (Rank 2)'
    ,(1461,1460,1459,3,0)    -- 'Arcane Intellect (Rank 3)'
    ,(1463,0,1463,1,0)    -- 'Mana Shield (Rank 1)'
    ,(1490,0,1490,1,0)    -- 'Curse of the Elements (Rank 1)'
    ,(1495,0,1495,1,0)    -- 'Mongoose Bite (Rank 1)'
    ,(1499,0,1499,1,0)    -- 'Freezing Trap (Rank 1)'
    ,(1510,0,1510,1,0)    -- 'Volley (Rank 1)'
    ,(1513,0,1513,1,0)    -- 'Scare Beast (Rank 1)'
    ,(1535,0,1535,1,0)    -- 'Fire Nova Totem (Rank 1)'
    ,(1714,0,1714,1,0)    -- 'Curse of Tongues (Rank 1)'
    ,(1949,0,1949,1,0)    -- 'Hellfire (Rank 1)'
    ,(1978,0,1978,1,0)    -- 'Serpent Sting (Rank 1)'
    ,(2006,0,2006,1,0)    -- 'Resurrection (Rank 1)'
    ,(2008,0,2008,1,0)    -- 'Ancestral Spirit (Rank 1)'
    ,(2010,2006,2006,2,0)    -- 'Resurrection (Rank 2)'
    ,(2050,0,2050,1,0)    -- 'Lesser Heal (Rank 1)'
    ,(2052,2050,2050,2,0)    -- 'Lesser Heal (Rank 2)'
    ,(2053,2052,2050,3,0)    -- 'Lesser Heal (Rank 3)'
    ,(2054,0,2054,1,0)    -- 'Heal (Rank 1)'
    ,(2055,2054,2054,2,0)    -- 'Heal (Rank 2)'
    ,(2060,0,2060,1,0)    -- 'Greater Heal (Rank 1)'
    ,(2061,0,2061,1,0)    -- 'Flash Heal (Rank 1)'
    ,(2090,1430,774,4,0)    -- 'Rejuvenation (Rank 4)'
    ,(2091,2090,774,5,0)    -- 'Rejuvenation (Rank 5)'
    ,(2096,0,2096,1,0)    -- 'Mind Vision (Rank 1)'
    ,(2120,0,2120,1,0)    -- 'Flamestrike (Rank 1)'
    ,(2121,2120,2120,2,0)    -- 'Flamestrike (Rank 2)'
    ,(2136,0,2136,1,0)    -- 'Fire Blast (Rank 1)'
    ,(2137,2136,2136,2,0)    -- 'Fire Blast (Rank 2)'
    ,(2138,2137,2136,3,0)    -- 'Fire Blast (Rank 3)'
    ,(2362,0,2362,1,0)    -- 'Create Spellstone'
    ,(2637,0,2637,1,0)    -- 'Hibernate (Rank 1)'
    ,(2643,0,2643,1,0)    -- 'Multi-Shot (Rank 1)'
    ,(2651,0,2651,1,0)    -- 'Elune\'s Grace (Rank 1)'
    ,(2652,0,2652,1,0)    -- 'Touch of Weakness (Rank 1)'
    ,(2767,992,589,5,0)    -- 'Shadow Word: Pain (Rank 5)'
    ,(2791,1245,1243,4,0)    -- 'Power Word: Fortitude (Rank 4)'
    ,(2812,0,2812,1,0)    -- 'Holy Wrath (Rank 1)'
    ,(2818,0,2818,1,0)    -- 'Deadly Poison (Rank 1)'
    ,(2819,2818,2818,2,0)    -- 'Deadly Poison II (Rank 2)'
    ,(2835,0,2835,1,0)    -- 'Deadly Poison (Rank 1)'
    ,(2837,2835,2835,2,0)    -- 'Deadly Poison II (Rank 2)'
    ,(2860,930,421,3,0)    -- 'Chain Lightning (Rank 3)'
    ,(2878,0,2878,1,0)    -- 'Turn Undead (Rank 1)'
    ,(2908,0,2908,1,0)    -- 'Soothe Animal (Rank 1)'
    ,(2912,0,2912,1,0)    -- 'Starfire (Rank 1)'
    ,(2941,1094,348,4,0)    -- 'Immolate (Rank 4)'
    ,(2944,0,2944,1,0)    -- 'Devouring Plague (Rank 1)'
    ,(2948,0,2948,1,0)    -- 'Scorch (Rank 1)'
    ,(2973,0,2973,1,0)    -- 'Raptor Strike (Rank 1)'
    ,(2974,0,2974,1,0)    -- 'Wing Clip (Rank 1)'
    ,(3034,0,3034,1,0)    -- 'Viper Sting (Rank 1)'
    ,(3044,0,3044,1,0)    -- 'Arcane Shot (Rank 1)'
    ,(3111,136,136,2,0)    -- 'Mend Pet (Rank 2)'
    ,(3140,145,133,4,0)    -- 'Fireball (Rank 4)'
    ,(3420,0,3420,1,0)    -- 'Crippling Poison (Rank 1)'
    ,(3421,3420,3420,2,0)    -- 'Crippling Poison II (Rank 2)'
    ,(3472,1042,635,6,0)    -- 'Holy Light (Rank 6)'
    ,(3599,0,3599,1,0)    -- 'Searing Totem (Rank 1)'
    ,(3627,2091,774,6,0)    -- 'Rejuvenation (Rank 6)'
    ,(3661,3111,136,3,0)    -- 'Mend Pet (Rank 3)'
    ,(3662,3661,136,4,0)    -- 'Mend Pet (Rank 4)'
    ,(3698,755,755,2,0)    -- 'Health Funnel (Rank 2)'
    ,(3699,3698,755,3,0)    -- 'Health Funnel (Rank 3)'
    ,(3700,3699,755,4,0)    -- 'Health Funnel (Rank 4)'
    ,(3747,600,17,4,0)    -- 'Power Word: Shield (Rank 4)'
    ,(5138,0,5138,1,0)    -- 'Drain Mana (Rank 1)'
    ,(5143,0,5143,1,0)    -- 'Arcane Missiles (Rank 1)'
    ,(5144,5143,5143,2,0)    -- 'Arcane Missiles (Rank 2)'
    ,(5145,5144,5143,3,0)    -- 'Arcane Missiles (Rank 3)'
    ,(5176,0,5176,1,0)    -- 'Wrath (Rank 1)'
    ,(5177,5176,5176,2,0)    -- 'Wrath (Rank 2)'
    ,(5178,5177,5176,3,0)    -- 'Wrath (Rank 3)'
    ,(5179,5178,5176,4,0)    -- 'Wrath (Rank 4)'
    ,(5180,5179,5176,5,0)    -- 'Wrath (Rank 5)'
    ,(5185,0,5185,1,0)    -- 'Healing Touch (Rank 1)'
    ,(5186,5185,5185,2,0)    -- 'Healing Touch (Rank 2)'
    ,(5187,5186,5185,3,0)    -- 'Healing Touch (Rank 3)'
    ,(5188,5187,5185,4,0)    -- 'Healing Touch (Rank 4)'
    ,(5189,5188,5185,5,0)    -- 'Healing Touch (Rank 5)'
    ,(5195,1062,339,3,0)    -- 'Entangling Roots (Rank 3)'
    ,(5196,5195,339,4,0)    -- 'Entangling Roots (Rank 4)'
    ,(5232,1126,1126,2,0)    -- 'Mark of the Wild (Rank 2)'
    ,(5234,6756,1126,4,0)    -- 'Mark of the Wild (Rank 4)'
    ,(5394,0,5394,1,0)    -- 'Healing Stream Totem (Rank 1)'
    ,(5484,0,5484,1,0)    -- 'Howl of Terror (Rank 1)'
    ,(5504,0,5504,1,0)    -- 'Conjure Water (Rank 1)'
    ,(5505,5504,5504,2,0)    -- 'Conjure Water (Rank 2)'
    ,(5506,5505,5504,3,0)    -- 'Conjure Water (Rank 3)'
    ,(5570,0,5570,1,0)    -- 'Insect Swarm (Rank 1)'
    ,(5573,498,498,2,0)    -- 'Divine Protection (Rank 2)'
    ,(5588,853,853,2,0)    -- 'Hammer of Justice (Rank 2)'
    ,(5589,5588,853,3,0)    -- 'Hammer of Justice (Rank 3)'
    ,(5599,1022,1022,2,0)    -- 'Blessing of Protection (Rank 2)'
    ,(5614,879,879,2,0)    -- 'Exorcism (Rank 2)'
    ,(5615,5614,879,3,0)    -- 'Exorcism (Rank 3)'
    ,(5627,2878,2878,2,0)    -- 'Turn Undead (Rank 2)'
    ,(5672,0,5672,1,0)    -- 'Healing Stream (Rank 1)'
    ,(5675,0,5675,1,0)    -- 'Mana Spring Totem (Rank 1)'
    ,(5676,0,5676,1,0)    -- 'Searing Pain (Rank 1)'
    ,(5699,6202,6201,3,0)    -- 'Create Healthstone'
    ,(5730,0,5730,1,0)    -- 'Stoneclaw Totem (Rank 1)'
    ,(5740,0,5740,1,0)    -- 'Rain of Fire (Rank 1)'
    ,(5763,0,5763,1,0)    -- 'Mind-numbing Poison (Rank 1)'
    ,(5782,0,5782,1,0)    -- 'Fear (Rank 1)'
    ,(6041,943,403,6,0)    -- 'Lightning Bolt (Rank 6)'
    ,(6060,1004,585,6,0)    -- 'Smite (Rank 6)'
    ,(6063,2055,2054,3,0)    -- 'Heal (Rank 3)'
    ,(6064,6063,2054,4,0)    -- 'Heal (Rank 4)'
    ,(6065,3747,17,5,0)    -- 'Power Word: Shield (Rank 5)'
    ,(6066,6065,17,6,0)    -- 'Power Word: Shield (Rank 6)'
    ,(6074,139,139,2,0)    -- 'Renew (Rank 2)'
    ,(6075,6074,139,3,0)    -- 'Renew (Rank 3)'
    ,(6076,6075,139,4,0)    -- 'Renew (Rank 4)'
    ,(6077,6076,139,5,0)    -- 'Renew (Rank 5)'
    ,(6078,6077,139,6,0)    -- 'Renew (Rank 6)'
    ,(6117,0,6117,1,0)    -- 'Mage Armor (Rank 1)'
    ,(6127,5506,5504,4,0)    -- 'Conjure Water (Rank 4)'
    ,(6129,990,587,4,0)    -- 'Conjure Food (Rank 4)'
    ,(6131,865,122,3,0)    -- 'Frost Nova (Rank 3)'
    ,(6141,10,10,2,0)    -- 'Blizzard (Rank 2)'
    ,(6143,0,6143,1,0)    -- 'Frost Ward (Rank 1)'
    ,(6201,0,6201,1,0)    -- 'Create Healthstone (Minor)'
    ,(6202,6201,6201,2,0)    -- 'Create Healthstone (Lesser)'
    ,(6205,1108,702,3,0)    -- 'Curse of Weakness (Rank 3)'
    ,(6213,5782,5782,2,0)    -- 'Fear (Rank 2)'
    ,(6215,6213,5782,3,0)    -- 'Fear (Rank 3)'
    ,(6217,1014,980,3,0)    -- 'Curse of Agony (Rank 3)'
    ,(6219,5740,5740,2,0)    -- 'Rain of Fire (Rank 2)'
    ,(6222,172,172,2,0)    -- 'Corruption (Rank 2)'
    ,(6223,6222,172,3,0)    -- 'Corruption (Rank 3)'
    ,(6226,5138,5138,2,0)    -- 'Drain Mana (Rank 2)'
    ,(6229,0,6229,1,0)    -- 'Shadow Ward (Rank 1)'
    ,(6353,0,6353,1,0)    -- 'Soul Fire (Rank 1)'
    ,(6363,3599,3599,2,0)    -- 'Searing Totem (Rank 2)'
    ,(6364,6363,3599,3,0)    -- 'Searing Totem (Rank 3)'
    ,(6365,6364,3599,4,0)    -- 'Searing Totem (Rank 4)'
    ,(6366,0,6366,1,0)    -- 'Create Firestone (Lesser)'
    ,(6371,5672,5672,2,0)    -- 'Healing Stream (Rank 2)'
    ,(6372,6371,5672,3,0)    -- 'Healing Stream (Rank 3)'
    ,(6375,5394,5394,2,0)    -- 'Healing Stream Totem (Rank 2)'
    ,(6377,6375,5394,3,0)    -- 'Healing Stream Totem (Rank 3)'
    ,(6390,5730,5730,2,0)    -- 'Stoneclaw Totem (Rank 2)'
    ,(6391,6390,5730,3,0)    -- 'Stoneclaw Totem (Rank 3)'
    ,(6392,6391,5730,4,0)    -- 'Stoneclaw Totem (Rank 4)'
    ,(6756,5232,1126,3,0)    -- 'Mark of the Wild (Rank 3)'
    ,(6778,5189,5185,6,0)    -- 'Healing Touch (Rank 6)'
    ,(6780,5180,5176,6,0)    -- 'Wrath (Rank 6)'
    ,(6789,0,6789,1,0)    -- 'Death Coil (Rank 1)'
    ,(6940,0,6940,1,0)    -- 'Blessing of Sacrifice (Rank 1)'
    ,(7128,588,588,2,0)    -- 'Inner Fire (Rank 2)'
    ,(7300,168,168,2,0)    -- 'Frost Armor (Rank 2)'
    ,(7301,7300,168,3,0)    -- 'Frost Armor (Rank 3)'
    ,(7302,0,7302,1,0)    -- 'Ice Armor (Rank 1)'
    ,(7320,7302,7302,2,0)    -- 'Ice Armor (Rank 2)'
    ,(7322,837,116,4,0)    -- 'Frostbolt (Rank 4)'
    ,(7328,0,7328,1,0)    -- 'Redemption (Rank 1)'
    ,(7641,1106,686,6,0)    -- 'Shadow Bolt (Rank 6)'
    ,(7646,6205,702,4,0)    -- 'Curse of Weakness (Rank 4)'
    ,(7648,6223,172,4,0)    -- 'Corruption (Rank 4)'
    ,(7651,709,689,4,0)    -- 'Drain Life (Rank 4)'
    ,(7658,704,704,2,0)    -- 'Curse of Recklessness (Rank 2)'
    ,(7659,7658,704,3,0)    -- 'Curse of Recklessness (Rank 3)'
    ,(8004,0,8004,1,0)    -- 'Lesser Healing Wave (Rank 1)'
    ,(8005,959,331,7,0)    -- 'Healing Wave (Rank 7)'
    ,(8008,8004,8004,2,0)    -- 'Lesser Healing Wave (Rank 2)'
    ,(8010,8008,8004,3,0)    -- 'Lesser Healing Wave (Rank 3)'
    ,(8012,370,370,2,0)    -- 'Purge (Rank 2)'
    ,(8017,0,8017,1,0)    -- 'Rockbiter Weapon (Rank 1)'
    ,(8018,8017,8017,2,0)    -- 'Rockbiter Weapon (Rank 2)'
    ,(8019,8018,8017,3,0)    -- 'Rockbiter Weapon (Rank 3)'
    ,(8024,0,8024,1,0)    -- 'Flametongue Weapon (Rank 1)'
    ,(8027,8024,8024,2,0)    -- 'Flametongue Weapon (Rank 2)'
    ,(8030,8027,8024,3,0)    -- 'Flametongue Weapon (Rank 3)'
    ,(8033,0,8033,1,0)    -- 'Frostbrand Weapon (Rank 1)'
    ,(8034,0,8034,1,0)    -- 'Frostbrand Attack (Rank 1)'
    ,(8037,8034,8034,2,0)    -- 'Frostbrand Attack (Rank 2)'
    ,(8038,8033,8033,2,0)    -- 'Frostbrand Weapon (Rank 2)'
    ,(8042,0,8042,1,0)    -- 'Earth Shock (Rank 1)'
    ,(8044,8042,8042,2,0)    -- 'Earth Shock (Rank 2)'
    ,(8045,8044,8042,3,0)    -- 'Earth Shock (Rank 3)'
    ,(8046,8045,8042,4,0)    -- 'Earth Shock (Rank 4)'
    ,(8050,0,8050,1,0)    -- 'Flame Shock (Rank 1)'
    ,(8052,8050,8050,2,0)    -- 'Flame Shock (Rank 2)'
    ,(8053,8052,8050,3,0)    -- 'Flame Shock (Rank 3)'
    ,(8056,0,8056,1,0)    -- 'Frost Shock (Rank 1)'
    ,(8058,8056,8056,2,0)    -- 'Frost Shock (Rank 2)'
    ,(8071,0,8071,1,0)    -- 'Stoneskin Totem (Rank 1)'
    ,(8075,0,8075,1,0)    -- 'Strength of Earth Totem (Rank 1)'
    ,(8092,0,8092,1,0)    -- 'Mind Blast (Rank 1)'
    ,(8102,8092,8092,2,0)    -- 'Mind Blast (Rank 2)'
    ,(8103,8102,8092,3,0)    -- 'Mind Blast (Rank 3)'
    ,(8104,8103,8092,4,0)    -- 'Mind Blast (Rank 4)'
    ,(8105,8104,8092,5,0)    -- 'Mind Blast (Rank 5)'
    ,(8106,8105,8092,6,0)    -- 'Mind Blast (Rank 6)'
    ,(8122,0,8122,1,0)    -- 'Psychic Scream (Rank 1)'
    ,(8124,8122,8122,2,0)    -- 'Psychic Scream (Rank 2)'
    ,(8129,0,8129,1,0)    -- 'Mana Burn (Rank 1)'
    ,(8131,8129,8129,2,0)    -- 'Mana Burn (Rank 2)'
    ,(8134,945,324,5,0)    -- 'Lightning Shield (Rank 5)'
    ,(8154,8071,8071,2,0)    -- 'Stoneskin Totem (Rank 2)'
    ,(8155,8154,8071,3,0)    -- 'Stoneskin Totem (Rank 3)'
    ,(8160,8075,8075,2,0)    -- 'Strength of Earth Totem (Rank 2)'
    ,(8161,8160,8075,3,0)    -- 'Strength of Earth Totem (Rank 3)'
    ,(8181,0,8181,1,0)    -- 'Frost Resistance Totem (Rank 1)'
    ,(8184,0,8184,1,0)    -- 'Fire Resistance Totem (Rank 1)'
    ,(8190,0,8190,1,0)    -- 'Magma Totem (Rank 1)'
    ,(8192,453,453,2,0)    -- 'Mind Soothe (Rank 2)'
    ,(8227,0,8227,1,0)    -- 'Flametongue Totem (Rank 1)'
    ,(8232,0,8232,1,0)    -- 'Windfury Weapon (Rank 1)'
    ,(8235,8232,8232,2,0)    -- 'Windfury Weapon (Rank 2)'
    ,(8249,8227,8227,2,0)    -- 'Flametongue Totem (Rank 2)'
    ,(8288,1120,1120,2,0)    -- 'Drain Soul (Rank 2)'
    ,(8289,8288,1120,3,0)    -- 'Drain Soul (Rank 3)'
    ,(8400,3140,133,5,0)    -- 'Fireball (Rank 5)'
    ,(8401,8400,133,6,0)    -- 'Fireball (Rank 6)'
    ,(8402,8401,133,7,0)    -- 'Fireball (Rank 7)'
    ,(8406,7322,116,5,0)    -- 'Frostbolt (Rank 5)'
    ,(8407,8406,116,6,0)    -- 'Frostbolt (Rank 6)'
    ,(8408,8407,116,7,0)    -- 'Frostbolt (Rank 7)'
    ,(8412,2138,2136,4,0)    -- 'Fire Blast (Rank 4)'
    ,(8413,8412,2136,5,0)    -- 'Fire Blast (Rank 5)'
    ,(8416,5145,5143,4,0)    -- 'Arcane Missiles (Rank 4)'
    ,(8417,8416,5143,5,0)    -- 'Arcane Missiles (Rank 5)'
    ,(8422,2121,2120,3,0)    -- 'Flamestrike (Rank 3)'
    ,(8423,8422,2120,4,0)    -- 'Flamestrike (Rank 4)'
    ,(8427,6141,10,3,0)    -- 'Blizzard (Rank 3)'
    ,(8437,1449,1449,2,0)    -- 'Arcane Explosion (Rank 2)'
    ,(8438,8437,1449,3,0)    -- 'Arcane Explosion (Rank 3)'
    ,(8439,8438,1449,4,0)    -- 'Arcane Explosion (Rank 4)'
    ,(8444,2948,2948,2,0)    -- 'Scorch (Rank 2)'
    ,(8445,8444,2948,3,0)    -- 'Scorch (Rank 3)'
    ,(8446,8445,2948,4,0)    -- 'Scorch (Rank 4)'
    ,(8450,604,604,2,0)    -- 'Dampen Magic (Rank 2)'
    ,(8451,8450,604,3,0)    -- 'Dampen Magic (Rank 3)'
    ,(8455,1008,1008,2,0)    -- 'Amplify Magic (Rank 2)'
    ,(8457,543,543,2,0)    -- 'Fire Ward (Rank 2)'
    ,(8458,8457,543,3,0)    -- 'Fire Ward (Rank 3)'
    ,(8461,6143,6143,2,0)    -- 'Frost Ward (Rank 2)'
    ,(8462,8461,6143,3,0)    -- 'Frost Ward (Rank 3)'
    ,(8492,120,120,2,0)    -- 'Cone of Cold (Rank 2)'
    ,(8494,1463,1463,2,0)    -- 'Mana Shield (Rank 2)'
    ,(8495,8494,1463,3,0)    -- 'Mana Shield (Rank 3)'
    ,(8498,1535,1535,2,0)    -- 'Fire Nova Totem (Rank 2)'
    ,(8499,8498,1535,3,0)    -- 'Fire Nova Totem (Rank 3)'
    ,(8512,0,8512,1,0)    -- 'Windfury Totem (Rank 1)'
    ,(8680,0,8680,1,0)    -- 'Instant Poison (Rank 1)'
    ,(8681,0,8681,1,0)    -- 'Instant Poison (Rank 1)'
    ,(8685,8680,8680,2,0)    -- 'Instant Poison II (Rank 2)'
    ,(8687,8681,8681,2,0)    -- 'Instant Poison II (Rank 2)'
    ,(8689,8685,8680,3,0)    -- 'Instant Poison III (Rank 3)'
    ,(8691,8687,8681,3,0)    -- 'Instant Poison III (Rank 3)'
    ,(8694,5763,5763,2,0)    -- 'Mind-numbing Poison II (Rank 2)'
    ,(8835,0,8835,1,0)    -- 'Grace of Air Totem (Rank 1)'
    ,(8903,6778,5185,7,0)    -- 'Healing Touch (Rank 7)'
    ,(8905,6780,5176,7,0)    -- 'Wrath (Rank 7)'
    ,(8907,5234,1126,5,0)    -- 'Mark of the Wild (Rank 5)'
    ,(8910,3627,774,7,0)    -- 'Rejuvenation (Rank 7)'
    ,(8914,1075,467,4,0)    -- 'Thorns (Rank 4)'
    ,(8918,740,740,2,0)    -- 'Tranquility (Rank 2)'
    ,(8921,0,8921,1,0)    -- 'Moonfire (Rank 1)'
    ,(8924,8921,8921,2,0)    -- 'Moonfire (Rank 2)'
    ,(8925,8924,8921,3,0)    -- 'Moonfire (Rank 3)'
    ,(8926,8925,8921,4,0)    -- 'Moonfire (Rank 4)'
    ,(8927,8926,8921,5,0)    -- 'Moonfire (Rank 5)'
    ,(8928,8927,8921,6,0)    -- 'Moonfire (Rank 6)'
    ,(8929,8928,8921,7,0)    -- 'Moonfire (Rank 7)'
    ,(8936,0,8936,1,0)    -- 'Regrowth (Rank 1)'
    ,(8938,8936,8936,2,0)    -- 'Regrowth (Rank 2)'
    ,(8939,8938,8936,3,0)    -- 'Regrowth (Rank 3)'
    ,(8940,8939,8936,4,0)    -- 'Regrowth (Rank 4)'
    ,(8941,8940,8936,5,0)    -- 'Regrowth (Rank 5)'
    ,(8949,2912,2912,2,0)    -- 'Starfire (Rank 2)'
    ,(8950,8949,2912,3,0)    -- 'Starfire (Rank 3)'
    ,(8951,8950,2912,4,0)    -- 'Starfire (Rank 4)'
    ,(8955,2908,2908,2,0)    -- 'Soothe Animal (Rank 2)'
    ,(9035,0,9035,1,0)    -- 'Hex of Weakness (Rank 1)'
    ,(9472,2061,2061,2,0)    -- 'Flash Heal (Rank 2)'
    ,(9473,9472,2061,3,0)    -- 'Flash Heal (Rank 3)'
    ,(9474,9473,2061,4,0)    -- 'Flash Heal (Rank 4)'
    ,(9484,0,9484,1,0)    -- 'Shackle Undead (Rank 1)'
    ,(9485,9484,9484,2,0)    -- 'Shackle Undead (Rank 2)'
    ,(9578,586,586,2,0)    -- 'Fade (Rank 2)'
    ,(9579,9578,586,3,0)    -- 'Fade (Rank 3)'
    ,(9592,9579,586,4,0)    -- 'Fade (Rank 4)'
    ,(9749,778,770,3,0)    -- 'Faerie Fire (Rank 3)'
    ,(9750,8941,8936,6,0)    -- 'Regrowth (Rank 6)'
    ,(9756,8914,467,5,0)    -- 'Thorns (Rank 5)'
    ,(9758,8903,5185,8,0)    -- 'Healing Touch (Rank 8)'
    ,(9787,9785,2018,5,0)    -- 'Weaponsmith (Artisan)'
    ,(9788,9785,2018,5,0)    -- 'Armorsmith (Artisan)'
    ,(9833,8929,8921,8,0)    -- 'Moonfire (Rank 8)'
    ,(9834,9833,8921,9,0)    -- 'Moonfire (Rank 9)'
    ,(9835,9834,8921,10,0)    -- 'Moonfire (Rank 10)'
    ,(9839,8910,774,8,0)    -- 'Rejuvenation (Rank 8)'
    ,(9840,9839,774,9,0)    -- 'Rejuvenation (Rank 9)'
    ,(9841,9840,774,10,0)    -- 'Rejuvenation (Rank 10)'
    ,(9852,5196,339,5,0)    -- 'Entangling Roots (Rank 5)'
    ,(9853,9852,339,6,0)    -- 'Entangling Roots (Rank 6)'
    ,(9856,9750,8936,7,0)    -- 'Regrowth (Rank 7)'
    ,(9857,9856,8936,8,0)    -- 'Regrowth (Rank 8)'
    ,(9858,9857,8936,9,0)    -- 'Regrowth (Rank 9)'
    ,(9862,8918,740,3,0)    -- 'Tranquility (Rank 3)'
    ,(9863,9862,740,4,0)    -- 'Tranquility (Rank 4)'
    ,(9875,8951,2912,5,0)    -- 'Starfire (Rank 5)'
    ,(9876,9875,2912,6,0)    -- 'Starfire (Rank 6)'
    ,(9884,8907,1126,6,0)    -- 'Mark of the Wild (Rank 6)'
    ,(9885,9884,1126,7,0)    -- 'Mark of the Wild (Rank 7)'
    ,(9888,9758,5185,9,0)    -- 'Healing Touch (Rank 9)'
    ,(9889,9888,5185,10,0)    -- 'Healing Touch (Rank 10)'
    ,(9901,8955,2908,3,0)    -- 'Soothe Animal (Rank 3)'
    ,(9907,9749,770,4,0)    -- 'Faerie Fire (Rank 4)'
    ,(9910,9756,467,6,0)    -- 'Thorns (Rank 6)'
    ,(9912,8905,5176,8,0)    -- 'Wrath (Rank 8)'
    ,(10138,6127,5504,5,0)    -- 'Conjure Water (Rank 5)'
    ,(10139,10138,5504,6,0)    -- 'Conjure Water (Rank 6)'
    ,(10140,10139,5504,7,0)    -- 'Conjure Water (Rank 7)'
    ,(10144,6129,587,5,0)    -- 'Conjure Food (Rank 5)'
    ,(10145,10144,587,6,0)    -- 'Conjure Food (Rank 6)'
    ,(10148,8402,133,8,0)    -- 'Fireball (Rank 8)'
    ,(10149,10148,133,9,0)    -- 'Fireball (Rank 9)'
    ,(10150,10149,133,10,0)    -- 'Fireball (Rank 10)'
    ,(10151,10150,133,11,0)    -- 'Fireball (Rank 11)'
    ,(10156,1461,1459,4,0)    -- 'Arcane Intellect (Rank 4)'
    ,(10157,10156,1459,5,0)    -- 'Arcane Intellect (Rank 5)'
    ,(10159,8492,120,3,0)    -- 'Cone of Cold (Rank 3)'
    ,(10160,10159,120,4,0)    -- 'Cone of Cold (Rank 4)'
    ,(10161,10160,120,5,0)    -- 'Cone of Cold (Rank 5)'
    ,(10169,8455,1008,3,0)    -- 'Amplify Magic (Rank 3)'
    ,(10170,10169,1008,4,0)    -- 'Amplify Magic (Rank 4)'
    ,(10173,8451,604,4,0)    -- 'Dampen Magic (Rank 4)'
    ,(10174,10173,604,5,0)    -- 'Dampen Magic (Rank 5)'
    ,(10177,8462,6143,4,0)    -- 'Frost Ward (Rank 4)'
    ,(10179,8408,116,8,0)    -- 'Frostbolt (Rank 8)'
    ,(10180,10179,116,9,0)    -- 'Frostbolt (Rank 9)'
    ,(10181,10180,116,10,0)    -- 'Frostbolt (Rank 10)'
    ,(10185,8427,10,4,0)    -- 'Blizzard (Rank 4)'
    ,(10186,10185,10,5,0)    -- 'Blizzard (Rank 5)'
    ,(10187,10186,10,6,0)    -- 'Blizzard (Rank 6)'
    ,(10191,8495,1463,4,0)    -- 'Mana Shield (Rank 4)'
    ,(10192,10191,1463,5,0)    -- 'Mana Shield (Rank 5)'
    ,(10193,10192,1463,6,0)    -- 'Mana Shield (Rank 6)'
    ,(10197,8413,2136,6,0)    -- 'Fire Blast (Rank 6)'
    ,(10199,10197,2136,7,0)    -- 'Fire Blast (Rank 7)'
    ,(10201,8439,1449,5,0)    -- 'Arcane Explosion (Rank 5)'
    ,(10202,10201,1449,6,0)    -- 'Arcane Explosion (Rank 6)'
    ,(10205,8446,2948,5,0)    -- 'Scorch (Rank 5)'
    ,(10206,10205,2948,6,0)    -- 'Scorch (Rank 6)'
    ,(10207,10206,2948,7,0)    -- 'Scorch (Rank 7)'
    ,(10211,8417,5143,6,0)    -- 'Arcane Missiles (Rank 6)'
    ,(10212,10211,5143,7,0)    -- 'Arcane Missiles (Rank 7)'
    ,(10215,8423,2120,5,0)    -- 'Flamestrike (Rank 5)'
    ,(10216,10215,2120,6,0)    -- 'Flamestrike (Rank 6)'
    ,(10219,7320,7302,3,0)    -- 'Ice Armor (Rank 3)'
    ,(10220,10219,7302,4,0)    -- 'Ice Armor (Rank 4)'
    ,(10223,8458,543,4,0)    -- 'Fire Ward (Rank 4)'
    ,(10225,10223,543,5,0)    -- 'Fire Ward (Rank 5)'
    ,(10230,6131,122,4,0)    -- 'Frost Nova (Rank 4)'
    ,(10278,5599,1022,3,0)    -- 'Blessing of Protection (Rank 3)'
    ,(10308,5589,853,4,0)    -- 'Hammer of Justice (Rank 4)'
    ,(10312,5615,879,4,0)    -- 'Exorcism (Rank 4)'
    ,(10313,10312,879,5,0)    -- 'Exorcism (Rank 5)'
    ,(10314,10313,879,6,0)    -- 'Exorcism (Rank 6)'
    ,(10318,2812,2812,2,0)    -- 'Holy Wrath (Rank 2)'
    ,(10322,7328,7328,2,0)    -- 'Redemption (Rank 2)'
    ,(10324,10322,7328,3,0)    -- 'Redemption (Rank 3)'
    ,(10326,5627,2878,3,0)    -- 'Turn Undead (Rank 3)'
    ,(10328,3472,635,7,0)    -- 'Holy Light (Rank 7)'
    ,(10329,10328,635,8,0)    -- 'Holy Light (Rank 8)'
    ,(10391,6041,403,7,0)    -- 'Lightning Bolt (Rank 7)'
    ,(10392,10391,403,8,0)    -- 'Lightning Bolt (Rank 8)'
    ,(10395,8005,331,8,0)    -- 'Healing Wave (Rank 8)'
    ,(10396,10395,331,9,0)    -- 'Healing Wave (Rank 9)'
    ,(10399,8019,8017,4,0)    -- 'Rockbiter Weapon (Rank 4)'
    ,(10406,8155,8071,4,0)    -- 'Stoneskin Totem (Rank 4)'
    ,(10407,10406,8071,5,0)    -- 'Stoneskin Totem (Rank 5)'
    ,(10408,10407,8071,6,0)    -- 'Stoneskin Totem (Rank 6)'
    ,(10412,8046,8042,5,0)    -- 'Earth Shock (Rank 5)'
    ,(10413,10412,8042,6,0)    -- 'Earth Shock (Rank 6)'
    ,(10414,10413,8042,7,0)    -- 'Earth Shock (Rank 7)'
    ,(10427,6392,5730,5,0)    -- 'Stoneclaw Totem (Rank 5)'
    ,(10428,10427,5730,6,0)    -- 'Stoneclaw Totem (Rank 6)'
    ,(10431,8134,324,6,0)    -- 'Lightning Shield (Rank 6)'
    ,(10432,10431,324,7,0)    -- 'Lightning Shield (Rank 7)'
    ,(10437,6365,3599,5,0)    -- 'Searing Totem (Rank 5)'
    ,(10438,10437,3599,6,0)    -- 'Searing Totem (Rank 6)'
    ,(10442,8161,8075,4,0)    -- 'Strength of Earth Totem (Rank 4)'
    ,(10447,8053,8050,4,0)    -- 'Flame Shock (Rank 4)'
    ,(10448,10447,8050,5,0)    -- 'Flame Shock (Rank 5)'
    ,(10456,8038,8033,3,0)    -- 'Frostbrand Weapon (Rank 3)'
    ,(10458,8037,8034,3,0)    -- 'Frostbrand Attack (Rank 3)'
    ,(10460,6372,5672,4,0)    -- 'Healing Stream (Rank 4)'
    ,(10461,10460,5672,5,0)    -- 'Healing Stream (Rank 5)'
    ,(10462,6377,5394,4,0)    -- 'Healing Stream Totem (Rank 4)'
    ,(10463,10462,5394,5,0)    -- 'Healing Stream Totem (Rank 5)'
    ,(10466,8010,8004,4,0)    -- 'Lesser Healing Wave (Rank 4)'
    ,(10467,10466,8004,5,0)    -- 'Lesser Healing Wave (Rank 5)'
    ,(10468,10467,8004,6,0)    -- 'Lesser Healing Wave (Rank 6)'
    ,(10472,8058,8056,3,0)    -- 'Frost Shock (Rank 3)'
    ,(10473,10472,8056,4,0)    -- 'Frost Shock (Rank 4)'
    ,(10478,8181,8181,2,0)    -- 'Frost Resistance Totem (Rank 2)'
    ,(10479,10478,8181,3,0)    -- 'Frost Resistance Totem (Rank 3)'
    ,(10486,8235,8232,3,0)    -- 'Windfury Weapon (Rank 3)'
    ,(10495,5675,5675,2,0)    -- 'Mana Spring Totem (Rank 2)'
    ,(10496,10495,5675,3,0)    -- 'Mana Spring Totem (Rank 3)'
    ,(10497,10496,5675,4,0)    -- 'Mana Spring Totem (Rank 4)'
    ,(10526,8249,8227,3,0)    -- 'Flametongue Totem (Rank 3)'
    ,(10537,8184,8184,2,0)    -- 'Fire Resistance Totem (Rank 2)'
    ,(10538,10537,8184,3,0)    -- 'Fire Resistance Totem (Rank 3)'
    ,(10585,8190,8190,2,0)    -- 'Magma Totem (Rank 2)'
    ,(10586,10585,8190,3,0)    -- 'Magma Totem (Rank 3)'
    ,(10587,10586,8190,4,0)    -- 'Magma Totem (Rank 4)'
    ,(10595,0,10595,1,0)    -- 'Nature Resistance Totem (Rank 1)'
    ,(10600,10595,10595,2,0)    -- 'Nature Resistance Totem (Rank 2)'
    ,(10601,10600,10595,3,0)    -- 'Nature Resistance Totem (Rank 3)'
    ,(10605,2860,421,4,0)    -- 'Chain Lightning (Rank 4)'
    ,(10613,8512,8512,2,0)    -- 'Windfury Totem (Rank 2)'
    ,(10614,10613,8512,3,0)    -- 'Windfury Totem (Rank 3)'
    ,(10622,1064,1064,2,0)    -- 'Chain Heal (Rank 2)'
    ,(10623,10622,1064,3,0)    -- 'Chain Heal (Rank 3)'
    ,(10627,8835,8835,2,0)    -- 'Grace of Air Totem (Rank 2)'
    ,(10656,10662,2108,5,0)    -- 'Dragonscale Leatherworking'
    ,(10658,10662,2108,5,0)    -- 'Elemental Leatherworking'
    ,(10660,10662,2108,5,0)    -- 'Tribal Leatherworking'
    ,(10797,0,10797,1,0)    -- 'Starshards (Rank 1)'
    ,(10874,8131,8129,3,0)    -- 'Mana Burn (Rank 3)'
    ,(10875,10874,8129,4,0)    -- 'Mana Burn (Rank 4)'
    ,(10876,10875,8129,5,0)    -- 'Mana Burn (Rank 5)'
    ,(10880,2010,2006,3,0)    -- 'Resurrection (Rank 3)'
    ,(10881,10880,2006,4,0)    -- 'Resurrection (Rank 4)'
    ,(10888,8124,8122,3,0)    -- 'Psychic Scream (Rank 3)'
    ,(10890,10888,8122,4,0)    -- 'Psychic Scream (Rank 4)'
    ,(10892,2767,589,6,0)    -- 'Shadow Word: Pain (Rank 6)'
    ,(10893,10892,589,7,0)    -- 'Shadow Word: Pain (Rank 7)'
    ,(10894,10893,589,8,0)    -- 'Shadow Word: Pain (Rank 8)'
    ,(10898,6066,17,7,0)    -- 'Power Word: Shield (Rank 7)'
    ,(10899,10898,17,8,0)    -- 'Power Word: Shield (Rank 8)'
    ,(10900,10899,17,9,0)    -- 'Power Word: Shield (Rank 9)'
    ,(10901,10900,17,10,0)    -- 'Power Word: Shield (Rank 10)'
    ,(10909,2096,2096,2,0)    -- 'Mind Vision (Rank 2)'
    ,(10911,605,605,2,0)    -- 'Mind Control (Rank 2)'
    ,(10912,10911,605,3,0)    -- 'Mind Control (Rank 3)'
    ,(10915,9474,2061,5,0)    -- 'Flash Heal (Rank 5)'
    ,(10916,10915,2061,6,0)    -- 'Flash Heal (Rank 6)'
    ,(10917,10916,2061,7,0)    -- 'Flash Heal (Rank 7)'
    ,(10927,6078,139,7,0)    -- 'Renew (Rank 7)'
    ,(10928,10927,139,8,0)    -- 'Renew (Rank 8)'
    ,(10929,10928,139,9,0)    -- 'Renew (Rank 9)'
    ,(10933,6060,585,7,0)    -- 'Smite (Rank 7)'
    ,(10934,10933,585,8,0)    -- 'Smite (Rank 8)'
    ,(10937,2791,1243,5,0)    -- 'Power Word: Fortitude (Rank 5)'
    ,(10938,10937,1243,6,0)    -- 'Power Word: Fortitude (Rank 6)'
    ,(10941,9592,586,5,0)    -- 'Fade (Rank 5)'
    ,(10942,10941,586,6,0)    -- 'Fade (Rank 6)'
    ,(10945,8106,8092,7,0)    -- 'Mind Blast (Rank 7)'
    ,(10946,10945,8092,8,0)    -- 'Mind Blast (Rank 8)'
    ,(10947,10946,8092,9,0)    -- 'Mind Blast (Rank 9)'
    ,(10951,1006,588,5,0)    -- 'Inner Fire (Rank 5)'
    ,(10952,10951,588,6,0)    -- 'Inner Fire (Rank 6)'
    ,(10953,8192,453,3,0)    -- 'Mind Soothe (Rank 3)'
    ,(10955,9485,9484,3,0)    -- 'Shackle Undead (Rank 3)'
    ,(10957,976,976,2,0)    -- 'Shadow Protection (Rank 2)'
    ,(10958,10957,976,3,0)    -- 'Shadow Protection (Rank 3)'
    ,(10960,996,596,3,0)    -- 'Prayer of Healing (Rank 3)'
    ,(10961,10960,596,4,0)    -- 'Prayer of Healing (Rank 4)'
    ,(10963,2060,2060,2,0)    -- 'Greater Heal (Rank 2)'
    ,(10964,10963,2060,3,0)    -- 'Greater Heal (Rank 3)'
    ,(10965,10964,2060,4,0)    -- 'Greater Heal (Rank 4)'
    ,(11113,0,11113,1,0)    -- 'Blast Wave (Rank 1)'
    ,(11314,8499,1535,4,0)    -- 'Fire Nova Totem (Rank 4)'
    ,(11315,11314,1535,5,0)    -- 'Fire Nova Totem (Rank 5)'
    ,(11335,8689,8680,4,0)    -- 'Instant Poison IV (Rank 4)'
    ,(11336,11335,8680,5,0)    -- 'Instant Poison V (Rank 5)'
    ,(11337,11336,8680,6,0)    -- 'Instant Poison VI (Rank 6)'
    ,(11341,8691,8681,4,0)    -- 'Instant Poison IV (Rank 4)'
    ,(11342,11341,8681,5,0)    -- 'Instant Poison V (Rank 5)'
    ,(11343,11342,8681,6,0)    -- 'Instant Poison VI (Rank 6)'
    ,(11353,2819,2818,3,0)    -- 'Deadly Poison III (Rank 3)'
    ,(11354,11353,2818,4,0)    -- 'Deadly Poison IV (Rank 4)'
    ,(11357,2837,2835,3,0)    -- 'Deadly Poison III (Rank 3)'
    ,(11358,11357,2835,4,0)    -- 'Deadly Poison IV (Rank 4)'
    ,(11366,0,11366,1,0)    -- 'Pyroblast (Rank 1)'
    ,(11400,8694,5763,3,0)    -- 'Mind-numbing Poison III (Rank 3)'
    ,(11426,0,11426,1,0)    -- 'Ice Barrier (Rank 1)'
    ,(11659,7641,686,7,0)    -- 'Shadow Bolt (Rank 7)'
    ,(11660,11659,686,8,0)    -- 'Shadow Bolt (Rank 8)'
    ,(11661,11660,686,9,0)    -- 'Shadow Bolt (Rank 9)'
    ,(11665,2941,348,5,0)    -- 'Immolate (Rank 5)'
    ,(11667,11665,348,6,0)    -- 'Immolate (Rank 6)'
    ,(11668,11667,348,7,0)    -- 'Immolate (Rank 7)'
    ,(11671,7648,172,5,0)    -- 'Corruption (Rank 5)'
    ,(11672,11671,172,6,0)    -- 'Corruption (Rank 6)'
    ,(11675,8289,1120,4,0)    -- 'Drain Soul (Rank 4)'
    ,(11677,6219,5740,3,0)    -- 'Rain of Fire (Rank 3)'
    ,(11678,11677,5740,4,0)    -- 'Rain of Fire (Rank 4)'
    ,(11683,1949,1949,2,0)    -- 'Hellfire (Rank 2)'
    ,(11684,11683,1949,3,0)    -- 'Hellfire (Rank 3)'
    ,(11687,1456,1454,4,0)    -- 'Life Tap (Rank 4)'
    ,(11688,11687,1454,5,0)    -- 'Life Tap (Rank 5)'
    ,(11689,11688,1454,6,0)    -- 'Life Tap (Rank 6)'
    ,(11693,3700,755,5,0)    -- 'Health Funnel (Rank 5)'
    ,(11694,11693,755,6,0)    -- 'Health Funnel (Rank 6)'
    ,(11695,11694,755,7,0)    -- 'Health Funnel (Rank 7)'
    ,(11699,7651,689,5,0)    -- 'Drain Life (Rank 5)'
    ,(11700,11699,689,6,0)    -- 'Drain Life (Rank 6)'
    ,(11703,6226,5138,3,0)    -- 'Drain Mana (Rank 3)'
    ,(11704,11703,5138,4,0)    -- 'Drain Mana (Rank 4)'
    ,(11707,7646,702,5,0)    -- 'Curse of Weakness (Rank 5)'
    ,(11708,11707,702,6,0)    -- 'Curse of Weakness (Rank 6)'
    ,(11711,6217,980,4,0)    -- 'Curse of Agony (Rank 4)'
    ,(11712,11711,980,5,0)    -- 'Curse of Agony (Rank 5)'
    ,(11713,11712,980,6,0)    -- 'Curse of Agony (Rank 6)'
    ,(11717,7659,704,4,0)    -- 'Curse of Recklessness (Rank 4)'
    ,(11719,1714,1714,2,0)    -- 'Curse of Tongues (Rank 2)'
    ,(11721,1490,1490,2,0)    -- 'Curse of the Elements (Rank 2)'
    ,(11722,11721,1490,3,0)    -- 'Curse of the Elements (Rank 3)'
    ,(11725,1098,1098,2,0)    -- 'Enslave Demon (Rank 2)'
    ,(11726,11725,1098,3,0)    -- 'Enslave Demon (Rank 3)'
    ,(11729,5699,6201,4,0)    -- 'Create Healthstone (Greater)'
    ,(11730,11729,6201,5,0)    -- 'Create Healthstone (Major)'
    ,(11733,1086,706,3,0)    -- 'Demon Armor (Rank 3)'
    ,(11734,11733,706,4,0)    -- 'Demon Armor (Rank 4)'
    ,(11735,11734,706,5,0)    -- 'Demon Armor (Rank 5)'
    ,(11739,6229,6229,2,0)    -- 'Shadow Ward (Rank 2)'
    ,(11740,11739,6229,3,0)    -- 'Shadow Ward (Rank 3)'
    ,(12505,11366,11366,2,0)    -- 'Pyroblast (Rank 2)'
    ,(12522,12505,11366,3,0)    -- 'Pyroblast (Rank 3)'
    ,(12523,12522,11366,4,0)    -- 'Pyroblast (Rank 4)'
    ,(12524,12523,11366,5,0)    -- 'Pyroblast (Rank 5)'
    ,(12525,12524,11366,6,0)    -- 'Pyroblast (Rank 6)'
    ,(12526,12525,11366,7,0)    -- 'Pyroblast (Rank 7)'
    ,(12824,118,118,2,0)    -- 'Polymorph (Rank 2)'
    ,(12825,12824,118,3,0)    -- 'Polymorph (Rank 3)'
    ,(12826,12825,118,4,0)    -- 'Polymorph (Rank 4)'
    ,(12880,0,12880,1,0)    -- 'Enrage (Rank 1)'
    ,(13018,11113,11113,2,0)    -- 'Blast Wave (Rank 2)'
    ,(13019,13018,11113,3,0)    -- 'Blast Wave (Rank 3)'
    ,(13020,13019,11113,4,0)    -- 'Blast Wave (Rank 4)'
    ,(13021,13020,11113,5,0)    -- 'Blast Wave (Rank 5)'
    ,(13031,11426,11426,2,0)    -- 'Ice Barrier (Rank 2)'
    ,(13032,13031,11426,3,0)    -- 'Ice Barrier (Rank 3)'
    ,(13033,13032,11426,4,0)    -- 'Ice Barrier (Rank 4)'
    ,(13165,0,13165,1,0)    -- 'Aspect of the Hawk (Rank 1)'
    ,(13218,0,13218,1,0)    -- 'Wound Poison (Rank 1)'
    ,(13220,0,13220,1,0)    -- 'Wound Poison (Rank 1)'
    ,(13222,13218,13218,2,0)    -- 'Wound Poison (Rank 2)'
    ,(13223,13222,13218,3,0)    -- 'Wound Poison (Rank 3)'
    ,(13224,13223,13218,4,0)    -- 'Wound Poison (Rank 4)'
    ,(13228,13220,13220,2,0)    -- 'Wound Poison II (Rank 2)'
    ,(13229,13228,13220,3,0)    -- 'Wound Poison III (Rank 3)'
    ,(13230,13229,13220,4,0)    -- 'Wound Poison IV (Rank 4)'
    ,(13542,3662,136,5,0)    -- 'Mend Pet (Rank 5)'
    ,(13543,13542,136,6,0)    -- 'Mend Pet (Rank 6)'
    ,(13544,13543,136,7,0)    -- 'Mend Pet (Rank 7)'
    ,(13549,1978,1978,2,0)    -- 'Serpent Sting (Rank 2)'
    ,(13550,13549,1978,3,0)    -- 'Serpent Sting (Rank 3)'
    ,(13551,13550,1978,4,0)    -- 'Serpent Sting (Rank 4)'
    ,(13552,13551,1978,5,0)    -- 'Serpent Sting (Rank 5)'
    ,(13553,13552,1978,6,0)    -- 'Serpent Sting (Rank 6)'
    ,(13554,13553,1978,7,0)    -- 'Serpent Sting (Rank 7)'
    ,(13555,13554,1978,8,0)    -- 'Serpent Sting (Rank 8)'
    ,(13795,0,13795,1,0)    -- 'Immolation Trap (Rank 1)'
    ,(13797,0,13797,1,0)    -- 'Immolation Trap Effect (Rank 1)'
    ,(13812,0,13812,1,0)    -- 'Explosive Trap Effect (Rank 1)'
    ,(13813,0,13813,1,0)    -- 'Explosive Trap (Rank 1)'
    ,(13896,0,13896,1,0)    -- 'Feedback (Rank 1)'
    ,(13908,0,13908,1,0)    -- 'Desperate Prayer (Rank 1)'
    ,(14201,12880,12880,2,0)    -- 'Enrage (Rank 2)'
    ,(14202,14201,12880,3,0)    -- 'Enrage (Rank 3)'
    ,(14203,14202,12880,4,0)    -- 'Enrage (Rank 4)'
    ,(14204,14203,12880,5,0)    -- 'Enrage (Rank 5)'
    ,(14260,2973,2973,2,0)    -- 'Raptor Strike (Rank 2)'
    ,(14261,14260,2973,3,0)    -- 'Raptor Strike (Rank 3)'
    ,(14262,14261,2973,4,0)    -- 'Raptor Strike (Rank 4)'
    ,(14263,14262,2973,5,0)    -- 'Raptor Strike (Rank 5)'
    ,(14264,14263,2973,6,0)    -- 'Raptor Strike (Rank 6)'
    ,(14265,14264,2973,7,0)    -- 'Raptor Strike (Rank 7)'
    ,(14266,14265,2973,8,0)    -- 'Raptor Strike (Rank 8)'
    ,(14267,2974,2974,2,0)    -- 'Wing Clip (Rank 2)'
    ,(14268,14267,2974,3,0)    -- 'Wing Clip (Rank 3)'
    ,(14269,1495,1495,2,0)    -- 'Mongoose Bite (Rank 2)'
    ,(14270,14269,1495,3,0)    -- 'Mongoose Bite (Rank 3)'
    ,(14271,14270,1495,4,0)    -- 'Mongoose Bite (Rank 4)'
    ,(14272,781,781,2,0)    -- 'Disengage (Rank 2)'
    ,(14273,14272,781,3,0)    -- 'Disengage (Rank 3)'
    ,(14274,20736,20736,2,0)    -- 'Distracting Shot (Rank 2)'
    ,(14279,3034,3034,2,0)    -- 'Viper Sting (Rank 2)'
    ,(14280,14279,3034,3,0)    -- 'Viper Sting (Rank 3)'
    ,(14281,3044,3044,2,0)    -- 'Arcane Shot (Rank 2)'
    ,(14282,14281,3044,3,0)    -- 'Arcane Shot (Rank 3)'
    ,(14283,14282,3044,4,0)    -- 'Arcane Shot (Rank 4)'
    ,(14284,14283,3044,5,0)    -- 'Arcane Shot (Rank 5)'
    ,(14285,14284,3044,6,0)    -- 'Arcane Shot (Rank 6)'
    ,(14286,14285,3044,7,0)    -- 'Arcane Shot (Rank 7)'
    ,(14287,14286,3044,8,0)    -- 'Arcane Shot (Rank 8)'
    ,(14288,2643,2643,2,0)    -- 'Multi-Shot (Rank 2)'
    ,(14289,14288,2643,3,0)    -- 'Multi-Shot (Rank 3)'
    ,(14290,14289,2643,4,0)    -- 'Multi-Shot (Rank 4)'
    ,(14294,1510,1510,2,0)    -- 'Volley (Rank 2)'
    ,(14295,14294,1510,3,0)    -- 'Volley (Rank 3)'
    ,(14298,13797,13797,2,0)    -- 'Immolation Trap Effect (Rank 2)'
    ,(14299,14298,13797,3,0)    -- 'Immolation Trap Effect (Rank 3)'
    ,(14300,14299,13797,4,0)    -- 'Immolation Trap Effect (Rank 4)'
    ,(14301,14300,13797,5,0)    -- 'Immolation Trap Effect (Rank 5)'
    ,(14302,13795,13795,2,0)    -- 'Immolation Trap (Rank 2)'
    ,(14303,14302,13795,3,0)    -- 'Immolation Trap (Rank 3)'
    ,(14304,14303,13795,4,0)    -- 'Immolation Trap (Rank 4)'
    ,(14305,14304,13795,5,0)    -- 'Immolation Trap (Rank 5)'
    ,(14310,1499,1499,2,0)    -- 'Freezing Trap (Rank 2)'
    ,(14311,14310,1499,3,0)    -- 'Freezing Trap (Rank 3)'
    ,(14314,13812,13812,2,0)    -- 'Explosive Trap Effect (Rank 2)'
    ,(14315,14314,13812,3,0)    -- 'Explosive Trap Effect (Rank 3)'
    ,(14316,13813,13813,2,0)    -- 'Explosive Trap (Rank 2)'
    ,(14317,14316,13813,3,0)    -- 'Explosive Trap (Rank 3)'
    ,(14318,13165,13165,2,0)    -- 'Aspect of the Hawk (Rank 2)'
    ,(14319,14318,13165,3,0)    -- 'Aspect of the Hawk (Rank 3)'
    ,(14320,14319,13165,4,0)    -- 'Aspect of the Hawk (Rank 4)'
    ,(14321,14320,13165,5,0)    -- 'Aspect of the Hawk (Rank 5)'
    ,(14322,14321,13165,6,0)    -- 'Aspect of the Hawk (Rank 6)'
    ,(14323,1130,1130,2,0)    -- 'Hunter\'s Mark (Rank 2)'
    ,(14324,14323,1130,3,0)    -- 'Hunter\'s Mark (Rank 3)'
    ,(14325,14324,1130,4,0)    -- 'Hunter\'s Mark (Rank 4)'
    ,(14326,1513,1513,2,0)    -- 'Scare Beast (Rank 2)'
    ,(14327,14326,1513,3,0)    -- 'Scare Beast (Rank 3)'
    ,(14752,0,14752,1,0)    -- 'Divine Spirit (Rank 1)'
    ,(14818,14752,14752,2,0)    -- 'Divine Spirit (Rank 2)'
    ,(14819,14818,14752,3,0)    -- 'Divine Spirit (Rank 3)'
    ,(14914,0,14914,1,0)    -- 'Holy Fire (Rank 1)'
    ,(15107,0,15107,1,0)    -- 'Windwall Totem (Rank 1)'
    ,(15111,15107,15107,2,0)    -- 'Windwall Totem (Rank 2)'
    ,(15112,15111,15107,3,0)    -- 'Windwall Totem (Rank 3)'
    ,(15207,10392,403,9,0)    -- 'Lightning Bolt (Rank 9)'
    ,(15208,15207,403,10,0)    -- 'Lightning Bolt (Rank 10)'
    ,(15237,0,15237,1,0)    -- 'Holy Nova (Rank 1)'
    ,(15261,15267,14914,8,0)    -- 'Holy Fire (Rank 8)'
    ,(15262,14914,14914,2,0)    -- 'Holy Fire (Rank 2)'
    ,(15263,15262,14914,3,0)    -- 'Holy Fire (Rank 3)'
    ,(15264,15263,14914,4,0)    -- 'Holy Fire (Rank 4)'
    ,(15265,15264,14914,5,0)    -- 'Holy Fire (Rank 5)'
    ,(15266,15265,14914,6,0)    -- 'Holy Fire (Rank 6)'
    ,(15267,15266,14914,7,0)    -- 'Holy Fire (Rank 7)'
    ,(15407,0,15407,1,0)    -- 'Mind Flay (Rank 1)'
    ,(15430,15237,15237,2,0)    -- 'Holy Nova (Rank 2)'
    ,(15431,15430,15237,3,0)    -- 'Holy Nova (Rank 3)'
    ,(15629,14274,20736,3,0)    -- 'Distracting Shot (Rank 3)'
    ,(15630,15629,20736,4,0)    -- 'Distracting Shot (Rank 4)'
    ,(15631,15630,20736,5,0)    -- 'Distracting Shot (Rank 5)'
    ,(15632,15631,20736,6,0)    -- 'Distracting Shot (Rank 6)'
    ,(16190,0,16190,1,0)    -- 'Mana Tide Totem (Rank 1)'
    ,(16314,10399,8017,5,0)    -- 'Rockbiter Weapon (Rank 5)'
    ,(16315,16314,8017,6,0)    -- 'Rockbiter Weapon (Rank 6)'
    ,(16316,16315,8017,7,0)    -- 'Rockbiter Weapon (Rank 7)'
    ,(16339,8030,8024,4,0)    -- 'Flametongue Weapon (Rank 4)'
    ,(16341,16339,8024,5,0)    -- 'Flametongue Weapon (Rank 5)'
    ,(16342,16341,8024,6,0)    -- 'Flametongue Weapon (Rank 6)'
    ,(16352,10458,8034,4,0)    -- 'Frostbrand Attack (Rank 4)'
    ,(16353,16352,8034,5,0)    -- 'Frostbrand Attack (Rank 5)'
    ,(16355,10456,8033,4,0)    -- 'Frostbrand Weapon (Rank 4)'
    ,(16356,16355,8033,5,0)    -- 'Frostbrand Weapon (Rank 5)'
    ,(16362,10486,8232,4,0)    -- 'Windfury Weapon (Rank 4)'
    ,(16387,10526,8227,4,0)    -- 'Flametongue Totem (Rank 4)'
    ,(16689,0,16689,1,339)    -- 'Nature\'s Grasp (Rank 1)'
    ,(16810,16689,16689,2,1062)    -- 'Nature\'s Grasp (Rank 2)'
    ,(16811,16810,16689,3,5195)    -- 'Nature\'s Grasp (Rank 3)'
    ,(16812,16811,16689,4,5196)    -- 'Nature\'s Grasp (Rank 4)'
    ,(16813,16812,16689,5,9852)    -- 'Nature\'s Grasp (Rank 5)'
    ,(16857,0,16857,1,0)    -- 'Faerie Fire (Feral) (Rank 1)'
    ,(16914,0,16914,1,0)    -- 'Hurricane (Rank 1)'
    ,(17039,9787,2018,6,0)    -- 'Master Swordsmith'
    ,(17040,9787,2018,6,0)    -- 'Master Hammersmith'
    ,(17041,9787,2018,6,0)    -- 'Master Axesmith'
    ,(17311,15407,15407,2,0)    -- 'Mind Flay (Rank 2)'
    ,(17312,17311,15407,3,0)    -- 'Mind Flay (Rank 3)'
    ,(17313,17312,15407,4,0)    -- 'Mind Flay (Rank 4)'
    ,(17314,17313,15407,5,0)    -- 'Mind Flay (Rank 5)'
    ,(17329,16813,16689,6,9853)    -- 'Nature\'s Grasp (Rank 6)'
    ,(17354,16190,16190,2,0)    -- 'Mana Tide Totem (Rank 2)'
    ,(17359,17354,16190,3,0)    -- 'Mana Tide Totem (Rank 3)'
    ,(17390,16857,16857,2,0)    -- 'Faerie Fire (Feral) (Rank 2)'
    ,(17391,17390,16857,3,0)    -- 'Faerie Fire (Feral) (Rank 3)'
    ,(17392,17391,16857,4,0)    -- 'Faerie Fire (Feral) (Rank 4)'
    ,(17401,16914,16914,2,0)    -- 'Hurricane (Rank 2)'
    ,(17402,17401,16914,3,0)    -- 'Hurricane (Rank 3)'
    ,(17727,2362,2362,2,0)    -- 'Create Spellstone (Greater)'
    ,(17728,17727,2362,3,0)    -- 'Create Spellstone (Major)'
    ,(17862,0,17862,1,0)    -- 'Curse of Shadow (Rank 1)'
    ,(17877,0,17877,1,0)    -- 'Shadowburn (Rank 1)'
    ,(17919,5676,5676,2,0)    -- 'Searing Pain (Rank 2)'
    ,(17920,17919,5676,3,0)    -- 'Searing Pain (Rank 3)'
    ,(17921,17920,5676,4,0)    -- 'Searing Pain (Rank 4)'
    ,(17922,17921,5676,5,0)    -- 'Searing Pain (Rank 5)'
    ,(17923,17922,5676,6,0)    -- 'Searing Pain (Rank 6)'
    ,(17924,6353,6353,2,0)    -- 'Soul Fire (Rank 2)'
    ,(17925,6789,6789,2,0)    -- 'Death Coil (Rank 2)'
    ,(17926,17925,6789,3,0)    -- 'Death Coil (Rank 3)'
    ,(17928,5484,5484,2,0)    -- 'Howl of Terror (Rank 2)'
    ,(17937,17862,17862,2,0)    -- 'Curse of Shadow (Rank 2)'
    ,(17951,6366,6366,2,0)    -- 'Create Firestone'
    ,(17952,17951,6366,3,0)    -- 'Create Firestone (Greater)'
    ,(17953,17952,6366,4,0)    -- 'Create Firestone (Major)'
    ,(17962,0,17962,1,0)    -- 'Conflagrate (Rank 1)'
    ,(18137,0,18137,1,0)    -- 'Shadowguard (Rank 1)'
    ,(18220,0,18220,1,0)    -- 'Dark Pact (Rank 1)'
    ,(18265,0,18265,1,0)    -- 'Siphon Life (Rank 1)'
    ,(18647,710,710,2,0)    -- 'Banish (Rank 2)'
    ,(18657,2637,2637,2,0)    -- 'Hibernate (Rank 2)'
    ,(18658,18657,2637,3,0)    -- 'Hibernate (Rank 3)'
    ,(18807,17314,15407,6,0)    -- 'Mind Flay (Rank 6)'
    ,(18809,12526,11366,8,0)    -- 'Pyroblast (Rank 8)'
    ,(18867,17877,17877,2,0)    -- 'Shadowburn (Rank 2)'
    ,(18868,18867,17877,3,0)    -- 'Shadowburn (Rank 3)'
    ,(18869,18868,17877,4,0)    -- 'Shadowburn (Rank 4)'
    ,(18870,18869,17877,5,0)    -- 'Shadowburn (Rank 5)'
    ,(18871,18870,17877,6,0)    -- 'Shadowburn (Rank 6)'
    ,(18879,18265,18265,2,0)    -- 'Siphon Life (Rank 2)'
    ,(18880,18879,18265,3,0)    -- 'Siphon Life (Rank 3)'
    ,(18881,18880,18265,4,0)    -- 'Siphon Life (Rank 4)'
    ,(18930,17962,17962,2,0)    -- 'Conflagrate (Rank 2)'
    ,(18931,18930,17962,3,0)    -- 'Conflagrate (Rank 3)'
    ,(18932,18931,17962,4,0)    -- 'Conflagrate (Rank 4)'
    ,(18937,18220,18220,2,0)    -- 'Dark Pact (Rank 2)'
    ,(18938,18937,18220,3,0)    -- 'Dark Pact (Rank 3)'
    ,(19236,13908,13908,2,0)    -- 'Desperate Prayer (Rank 2)'
    ,(19238,19236,13908,3,0)    -- 'Desperate Prayer (Rank 3)'
    ,(19240,19238,13908,4,0)    -- 'Desperate Prayer (Rank 4)'
    ,(19241,19240,13908,5,0)    -- 'Desperate Prayer (Rank 5)'
    ,(19242,19241,13908,6,0)    -- 'Desperate Prayer (Rank 6)'
    ,(19243,19242,13908,7,0)    -- 'Desperate Prayer (Rank 7)'
    ,(19261,2652,2652,2,0)    -- 'Touch of Weakness (Rank 2)'
    ,(19262,19261,2652,3,0)    -- 'Touch of Weakness (Rank 3)'
    ,(19264,19262,2652,4,0)    -- 'Touch of Weakness (Rank 4)'
    ,(19265,19264,2652,5,0)    -- 'Touch of Weakness (Rank 5)'
    ,(19266,19265,2652,6,0)    -- 'Touch of Weakness (Rank 6)'
    ,(19271,13896,13896,2,0)    -- 'Feedback (Rank 2)'
    ,(19273,19271,13896,3,0)    -- 'Feedback (Rank 3)'
    ,(19274,19273,13896,4,0)    -- 'Feedback (Rank 4)'
    ,(19275,19274,13896,5,0)    -- 'Feedback (Rank 5)'
    ,(19276,2944,2944,2,0)    -- 'Devouring Plague (Rank 2)'
    ,(19277,19276,2944,3,0)    -- 'Devouring Plague (Rank 3)'
    ,(19278,19277,2944,4,0)    -- 'Devouring Plague (Rank 4)'
    ,(19279,19278,2944,5,0)    -- 'Devouring Plague (Rank 5)'
    ,(19280,19279,2944,6,0)    -- 'Devouring Plague (Rank 6)'
    ,(19281,9035,9035,2,0)    -- 'Hex of Weakness (Rank 2)'
    ,(19282,19281,9035,3,0)    -- 'Hex of Weakness (Rank 3)'
    ,(19283,19282,9035,4,0)    -- 'Hex of Weakness (Rank 4)'
    ,(19284,19283,9035,5,0)    -- 'Hex of Weakness (Rank 5)'
    ,(19285,19284,9035,6,0)    -- 'Hex of Weakness (Rank 6)'
    ,(19289,2651,2651,2,0)    -- 'Elune\'s Grace (Rank 2)'
    ,(19291,19289,2651,3,0)    -- 'Elune\'s Grace (Rank 3)'
    ,(19292,19291,2651,4,0)    -- 'Elune\'s Grace (Rank 4)'
    ,(19293,19292,2651,5,0)    -- 'Elune\'s Grace (Rank 5)'
    ,(19296,10797,10797,2,0)    -- 'Starshards (Rank 2)'
    ,(19299,19296,10797,3,0)    -- 'Starshards (Rank 3)'
    ,(19302,19299,10797,4,0)    -- 'Starshards (Rank 4)'
    ,(19303,19302,10797,5,0)    -- 'Starshards (Rank 5)'
    ,(19304,19303,10797,6,0)    -- 'Starshards (Rank 6)'
    ,(19305,19304,10797,7,0)    -- 'Starshards (Rank 7)'
    ,(19306,0,19306,1,0)    -- 'Counterattack (Rank 1)'
    ,(19308,18137,18137,2,0)    -- 'Shadowguard (Rank 2)'
    ,(19309,19308,18137,3,0)    -- 'Shadowguard (Rank 3)'
    ,(19310,19309,18137,4,0)    -- 'Shadowguard (Rank 4)'
    ,(19311,19310,18137,5,0)    -- 'Shadowguard (Rank 5)'
    ,(19312,19311,18137,6,0)    -- 'Shadowguard (Rank 6)'
    ,(19386,0,19386,1,0)    -- 'Wyvern Sting (Rank 1)'
    ,(19434,0,19434,1,0)    -- 'Aimed Shot (Rank 1)'
    ,(19506,0,19506,1,0)    -- 'Trueshot Aura (Rank 1)'
    ,(19740,0,19740,1,0)    -- 'Blessing of Might (Rank 1)'
    ,(19742,0,19742,1,0)    -- 'Blessing of Wisdom (Rank 1)'
    ,(19750,0,19750,1,0)    -- 'Flash of Light (Rank 1)'
    ,(19834,19740,19740,2,0)    -- 'Blessing of Might (Rank 2)'
    ,(19835,19834,19740,3,0)    -- 'Blessing of Might (Rank 3)'
    ,(19836,19835,19740,4,0)    -- 'Blessing of Might (Rank 4)'
    ,(19837,19836,19740,5,0)    -- 'Blessing of Might (Rank 5)'
    ,(19838,19837,19740,6,0)    -- 'Blessing of Might (Rank 6)'
    ,(19850,19742,19742,2,0)    -- 'Blessing of Wisdom (Rank 2)'
    ,(19852,19850,19742,3,0)    -- 'Blessing of Wisdom (Rank 3)'
    ,(19853,19852,19742,4,0)    -- 'Blessing of Wisdom (Rank 4)'
    ,(19854,19853,19742,5,0)    -- 'Blessing of Wisdom (Rank 5)'
    ,(19939,19750,19750,2,0)    -- 'Flash of Light (Rank 2)'
    ,(19940,19939,19750,3,0)    -- 'Flash of Light (Rank 3)'
    ,(19941,19940,19750,4,0)    -- 'Flash of Light (Rank 4)'
    ,(19942,19941,19750,5,0)    -- 'Flash of Light (Rank 5)'
    ,(19943,19942,19750,6,0)    -- 'Flash of Light (Rank 6)'
    ,(19977,0,19977,1,0)    -- 'Blessing of Light (Rank 1)'
    ,(19978,19977,19977,2,0)    -- 'Blessing of Light (Rank 2)'
    ,(19979,19978,19977,3,0)    -- 'Blessing of Light (Rank 3)'
    ,(20043,0,20043,1,0)    -- 'Aspect of the Wild (Rank 1)'
    ,(20116,26573,26573,2,0)    -- 'Consecration (Rank 2)'
    ,(20162,21082,21082,2,0)    -- 'Seal of the Crusader (Rank 2)'
    ,(20165,0,20165,1,0)    -- 'Seal of Light (Rank 1)'
    ,(20166,0,20166,1,0)    -- 'Seal of Wisdom (Rank 1)'
    ,(20190,20043,20043,2,0)    -- 'Aspect of the Wild (Rank 2)'
    ,(20217,0,20217,1,0)    -- 'Blessing of Kings'
    ,(20219,12656,4036,5,0)    -- 'Gnomish Engineer'
    ,(20222,12656,4036,5,0)    -- 'Goblin Engineer'
    ,(20287,21084,20154,3,0)    -- 'Seal of Righteousness (Rank 2)'
    ,(20288,20287,20154,4,0)    -- 'Seal of Righteousness (Rank 3)'
    ,(20289,20288,20154,5,0)    -- 'Seal of Righteousness (Rank 4)'
    ,(20290,20289,20154,6,0)    -- 'Seal of Righteousness (Rank 5)'
    ,(20291,20290,20154,7,0)    -- 'Seal of Righteousness (Rank 6)'
    ,(20292,20291,20154,8,0)    -- 'Seal of Righteousness (Rank 7)'
    ,(20293,20292,20154,9,0)    -- 'Seal of Righteousness (Rank 8)'
    ,(20305,20162,21082,3,0)    -- 'Seal of the Crusader (Rank 3)'
    ,(20306,20305,21082,4,0)    -- 'Seal of the Crusader (Rank 4)'
    ,(20307,20306,21082,5,0)    -- 'Seal of the Crusader (Rank 5)'
    ,(20308,20307,21082,6,0)    -- 'Seal of the Crusader (Rank 6)'
    ,(20347,20165,20165,2,0)    -- 'Seal of Light (Rank 2)'
    ,(20348,20347,20165,3,0)    -- 'Seal of Light (Rank 3)'
    ,(20349,20348,20165,4,0)    -- 'Seal of Light (Rank 4)'
    ,(20356,20166,20166,2,0)    -- 'Seal of Wisdom (Rank 2)'
    ,(20357,20356,20166,3,0)    -- 'Seal of Wisdom (Rank 3)'
    ,(20375,0,20375,1,0)    -- 'Seal of Command (Rank 1)'
    ,(20473,0,20473,1,0)    -- 'Holy Shock (Rank 1)'
    ,(20484,0,20484,1,0)    -- 'Rebirth (Rank 1)'
    ,(20609,2008,2008,2,0)    -- 'Ancestral Spirit (Rank 2)'
    ,(20610,20609,2008,3,0)    -- 'Ancestral Spirit (Rank 3)'
    ,(20729,6940,6940,2,0)    -- 'Blessing of Sacrifice (Rank 2)'
    ,(20736,0,20736,1,0)    -- 'Distracting Shot (Rank 1)'
    ,(20739,20484,20484,2,0)    -- 'Rebirth (Rank 2)'
    ,(20742,20739,20484,3,0)    -- 'Rebirth (Rank 3)'
    ,(20747,20742,20484,4,0)    -- 'Rebirth (Rank 4)'
    ,(20748,20747,20484,5,0)    -- 'Rebirth (Rank 5)'
    ,(20752,693,693,2,0)    -- 'Create Soulstone (Lesser)'
    ,(20755,20752,693,3,0)    -- 'Create Soulstone'
    ,(20756,20755,693,4,0)    -- 'Create Soulstone (Greater)'
    ,(20757,20756,693,5,0)    -- 'Create Soulstone (Major)'
    ,(20770,10881,2006,5,0)    -- 'Resurrection (Rank 5)'
    ,(20772,10324,7328,4,0)    -- 'Redemption (Rank 4)'
    ,(20773,20772,7328,5,0)    -- 'Redemption (Rank 5)'
    ,(20776,20610,2008,4,0)    -- 'Ancestral Spirit (Rank 4)'
    ,(20777,20776,2008,5,0)    -- 'Ancestral Spirit (Rank 5)'
    ,(20900,19434,19434,2,0)    -- 'Aimed Shot (Rank 2)'
    ,(20901,20900,19434,3,0)    -- 'Aimed Shot (Rank 3)'
    ,(20902,20901,19434,4,0)    -- 'Aimed Shot (Rank 4)'
    ,(20903,20902,19434,5,0)    -- 'Aimed Shot (Rank 5)'
    ,(20904,20903,19434,6,0)    -- 'Aimed Shot (Rank 6)'
    ,(20905,19506,19506,2,0)    -- 'Trueshot Aura (Rank 2)'
    ,(20906,20905,19506,3,0)    -- 'Trueshot Aura (Rank 3)'
    ,(20909,19306,19306,2,0)    -- 'Counterattack (Rank 2)'
    ,(20910,20909,19306,3,0)    -- 'Counterattack (Rank 3)'
    ,(20911,0,20911,1,0)    -- 'Blessing of Sanctuary (Rank 1)'
    ,(20912,20911,20911,2,0)    -- 'Blessing of Sanctuary (Rank 2)'
    ,(20913,20912,20911,3,0)    -- 'Blessing of Sanctuary (Rank 3)'
    ,(20914,20913,20911,4,0)    -- 'Blessing of Sanctuary (Rank 4)'
    ,(20915,20375,20375,2,0)    -- 'Seal of Command (Rank 2)'
    ,(20918,20915,20375,3,0)    -- 'Seal of Command (Rank 3)'
    ,(20919,20918,20375,4,0)    -- 'Seal of Command (Rank 4)'
    ,(20920,20919,20375,5,0)    -- 'Seal of Command (Rank 5)'
    ,(20922,20116,26573,3,0)    -- 'Consecration (Rank 3)'
    ,(20923,20922,26573,4,0)    -- 'Consecration (Rank 4)'
    ,(20924,20923,26573,5,0)    -- 'Consecration (Rank 5)'
    ,(20925,0,20925,1,0)    -- 'Holy Shield (Rank 1)'
    ,(20927,20925,20925,2,0)    -- 'Holy Shield (Rank 2)'
    ,(20928,20927,20925,3,0)    -- 'Holy Shield (Rank 3)'
    ,(20929,20473,20473,2,0)    -- 'Holy Shock (Rank 2)'
    ,(20930,20929,20473,3,0)    -- 'Holy Shock (Rank 3)'
    ,(21082,0,21082,1,0)    -- 'Seal of the Crusader (Rank 1)'
    ,(21562,0,21562,1,0)    -- 'Prayer of Fortitude (Rank 1)'
    ,(21564,21562,21562,2,0)    -- 'Prayer of Fortitude (Rank 2)'
    ,(21849,0,21849,1,0)    -- 'Gift of the Wild (Rank 1)'
    ,(21850,21849,21849,2,0)    -- 'Gift of the Wild (Rank 2)'
    ,(22782,6117,6117,2,0)    -- 'Mage Armor (Rank 2)'
    ,(22783,22782,6117,3,0)    -- 'Mage Armor (Rank 3)'
    ,(24132,19386,19386,2,0)    -- 'Wyvern Sting (Rank 2)'
    ,(24133,24132,19386,3,0)    -- 'Wyvern Sting (Rank 3)'
    ,(24239,24274,24275,3,0)    -- 'Hammer of Wrath (Rank 3)'
    ,(24274,24275,24275,2,0)    -- 'Hammer of Wrath (Rank 2)'
    ,(24275,0,24275,1,0)    -- 'Hammer of Wrath (Rank 1)'
    ,(24974,5570,5570,2,0)    -- 'Insect Swarm (Rank 2)'
    ,(24975,24974,5570,3,0)    -- 'Insect Swarm (Rank 3)'
    ,(24976,24975,5570,4,0)    -- 'Insect Swarm (Rank 4)'
    ,(24977,24976,5570,5,0)    -- 'Insect Swarm (Rank 5)'
    ,(25290,19854,19742,6,0)    -- 'Blessing of Wisdom (Rank 6)'
    ,(25291,19838,19740,7,0)    -- 'Blessing of Might (Rank 7)'
    ,(25292,10329,635,9,0)    -- 'Holy Light (Rank 9)'
    ,(25294,14290,2643,5,0)    -- 'Multi-Shot (Rank 5)'
    ,(25295,13555,1978,9,0)    -- 'Serpent Sting (Rank 9)'
    ,(25296,14322,13165,7,0)    -- 'Aspect of the Hawk (Rank 7)'
    ,(25297,9889,5185,11,0)    -- 'Healing Touch (Rank 11)'
    ,(25298,9876,2912,7,0)    -- 'Starfire (Rank 7)'
    ,(25299,9841,774,11,0)    -- 'Rejuvenation (Rank 11)'
    ,(25304,10181,116,11,0)    -- 'Frostbolt (Rank 11)'
    ,(25306,10151,133,12,0)    -- 'Fireball (Rank 12)'
    ,(25307,11661,686,10,0)    -- 'Shadow Bolt (Rank 10)'
    ,(25309,11668,348,8,0)    -- 'Immolate (Rank 8)'
    ,(25311,11672,172,7,0)    -- 'Corruption (Rank 7)'
    ,(25314,10965,2060,5,0)    -- 'Greater Heal (Rank 5)'
    ,(25315,10929,139,10,0)    -- 'Renew (Rank 10)'
    ,(25316,10961,596,5,0)    -- 'Prayer of Healing (Rank 5)'
    ,(25345,10212,5143,8,0)    -- 'Arcane Missiles (Rank 8)'
    ,(25347,11358,2835,5,0)    -- 'Deadly Poison V (Rank 5)'
    ,(25349,11354,2818,5,0)    -- 'Deadly Poison V (Rank 5)'
    ,(25357,10396,331,10,0)    -- 'Healing Wave (Rank 10)'
    ,(25359,10627,8835,3,0)    -- 'Grace of Air Totem (Rank 3)'
    ,(25361,10442,8075,5,0)    -- 'Strength of Earth Totem (Rank 5)'
    ,(25782,0,25782,1,19838)    -- 'Greater Blessing of Might (Rank 1)'
    ,(25890,0,25890,1,19979)    -- 'Greater Blessing of Light (Rank 1)'
    ,(25894,0,25894,1,19854)    -- 'Greater Blessing of Wisdom (Rank 1)'
    ,(25895,0,25895,1,1038)    -- 'Greater Blessing of Salvation'
    ,(25898,0,25898,1,20217)    -- 'Greater Blessing of Kings'
    ,(25899,0,25899,1,20914)    -- 'Greater Blessing of Sanctuary (Rank 1)'
    ,(25916,25782,25782,2,25291)    -- 'Greater Blessing of Might (Rank 2)'
    ,(25918,25894,25894,2,25290)    -- 'Greater Blessing of Wisdom (Rank 2)'
    ,(26573,0,26573,1,0)    -- 'Consecration (Rank 1)'
    ,(27681,14752,14752,2,0)    -- 'Prayer of Spirit (Rank 1)'
    ,(27685,26201,7371,6,0)    -- 'Charge (Rank 6)'
    ,(27799,15431,15237,4,0)    -- 'Holy Nova (Rank 4)'
    ,(27800,27799,15237,5,0)    -- 'Holy Nova (Rank 5)'
    ,(27801,27800,15237,6,0)    -- 'Holy Nova (Rank 6)'
    ,(27841,14819,14752,4,0)    -- 'Divine Spirit (Rank 4)'
    ,(27870,724,724,2,0)    -- 'Lightwell (Rank 2)'
    ,(27871,27870,724,3,0)    -- 'Lightwell (Rank 3)'
    ,(28609,10177,6143,5,0)    -- 'Frost Ward (Rank 5)'
    ,(28610,11740,6229,4,0)    -- 'Shadow Ward (Rank 4)'
    ,(28612,10145,587,7,0)    -- 'Conjure Food (Rank 7)'
    ,(29228,10448,8050,6,0)    -- 'Flame Shock (Rank 6)'
    ,(33388,0,33388,1,0)    -- 'Riding (Apprentice)'
    ,(33391,33388,33388,2,0)    -- 'Riding (Journeyman)'
;

-- Insert proc events for spells ---------------------------------------------
INSERT INTO `spell_proc_event`
    (`entry`,`SchoolMask`,`SpellFamilyName`,`SpellFamilyMask0`,`SpellFamilyMask1`,`SpellFamilyMask2`,`procFlags`,`procEx`,`ppmRate`,`CustomChance`,`Cooldown`)
VALUES
     (324,0,0,0,0,0,0,0,0,0,3)    -- 'Lightning Shield (Rank 1)'
    ,(2565,0,0,0,0,0,0,64,0,0,0)    -- 'Shield Block'
    ,(6346,127,0,0,0,0,0,256,0,0,0)    -- 'Fear Ward'
    ,(6866,0,0,0,0,0,0,112,0,0,0)    -- 'Moss Covered Hands'
    ,(7131,0,0,0,0,0,8,32,0,0,0)    -- 'Illusion Passive'
    ,(9452,0,0,0,0,0,0,0,3,0,0)    -- 'Vindication (Rank 1)'
    ,(9782,0,0,0,0,0,0,64,0,0,0)    -- 'Mithril Shield Spike'
    ,(9784,0,0,0,0,0,0,64,0,0,0)    -- 'Iron Shield Spike'
    ,(9799,0,0,0,0,0,0,2,0,0,0)    -- 'Eye for an Eye (Rank 1)'
    ,(11103,4,0,0,0,0,0,0,0,0,0)    -- 'Impact (Rank 1)'
    ,(11119,4,0,0,0,0,0,2,0,0,0)    -- 'Ignite (Rank 1)'
    ,(11129,4,0,0,0,0,0,0,0,0,0)    -- 'Combustion'
    ,(11180,16,0,0,0,0,0,0,0,0,0)    -- 'Winter's Chill (Rank 1)'
    ,(11185,0,3,128,128,128,327680,0,0,0,0)    -- 'Improved Blizzard (Rank 1)'
    ,(11255,0,3,16384,16384,16384,0,0,0,0,0)    -- 'Improved Counterspell (Rank 1)'
    ,(12099,0,0,0,0,0,0,64,0,0,0)    -- 'Shield Spike'
    ,(12169,0,0,0,0,0,0,64,0,0,0)    -- 'Shield Block'
    ,(12284,0,0,0,0,0,0,0,0.33252,0,3)    -- 'Mace Specialization (Rank 1)'
    ,(12289,0,0,2,2,2,0,0,0,0,0)    -- 'Improved Hamstring (Rank 1)'
    ,(12298,0,0,0,0,0,0,64,0,0,0)    -- 'Shield Specialization (Rank 1)'
    ,(12311,0,4,2048,2048,2048,0,0,0,0,0)    -- 'Improved Shield Bash (Rank 1)'
    ,(12317,0,0,0,0,0,0,2,0,0,0)    -- 'Enrage (Rank 1)'
    ,(12319,0,0,0,0,0,0,2,0,0,0)    -- 'Flurry (Rank 1)'
    ,(12322,0,0,0,0,0,0,0,2,0,3)    -- 'Unbridled Wrath (Rank 1)'
    ,(12701,0,0,0,0,0,0,0,0.66504,0,3)    -- 'Mace Specialization (Rank 2)'
    ,(12702,0,0,0,0,0,0,0,0.99756,0,3)    -- 'Mace Specialization (Rank 3)'
    ,(12703,0,0,0,0,0,0,0,1.33008,0,3)    -- 'Mace Specialization (Rank 4)'
    ,(12704,0,0,0,0,0,0,0,1.6626,0,3)    -- 'Mace Specialization (Rank 5)'
    ,(12782,0,0,0,0,0,0,64,0,0,0)    -- 'Shield Spike'
    ,(12797,0,0,1024,1024,1024,0,0,0,0,0)    -- 'Improved Revenge (Rank 1)'
    ,(12834,0,0,0,0,0,0,2,0,0,0)    -- 'Deep Wounds (Rank 1)'
    ,(12880,0,0,0,0,0,0,65536,0,0,0)    -- 'Enrage (Rank 1)'
    ,(12966,0,0,0,0,0,0,65536,0,0,0)    -- 'Flurry (Rank 1)'
    ,(12999,0,0,0,0,0,0,0,4,0,3)    -- 'Unbridled Wrath (Rank 2)'
    ,(13000,0,0,0,0,0,0,0,6,0,3)    -- 'Unbridled Wrath (Rank 3)'
    ,(13001,0,0,0,0,0,0,0,8,0,3)    -- 'Unbridled Wrath (Rank 4)'
    ,(13002,0,0,0,0,0,0,0,10,0,3)    -- 'Unbridled Wrath (Rank 5)'
    ,(13754,0,0,16,16,16,0,0,0,0,0)    -- 'Improved Kick (Rank 1)'
    ,(13983,0,0,0,0,0,0,24,0,0,0)    -- 'Setup (Rank 1)'
    ,(14076,0,8,128,128,128,0,0,0,0,0)    -- 'Improved Sap (Rank 1)'
    ,(14156,0,0,4063232,4063232,4063232,0,0,0,0,0)    -- 'Ruthlessness (Rank 1)'
    ,(14186,0,8,1082131720,1082131720,1082131720,0,2,0,0,0)    -- 'Seal Fate (Rank 1)'
    ,(14531,0,0,0,0,0,0,2,0,0,0)    -- 'Martyrdom (Rank 1)'
    ,(14892,0,6,17448312320,17448312320,17448312320,0,2,0,0,0)    -- 'Inspiration (Rank 1)'
    ,(15088,0,0,0,0,0,0,2,0,0,0)    -- 'Flurry'
    ,(15268,0,6,41984016,41984016,41984016,0,0,0,0,0)    -- 'Blackout (Rank 1)'
    ,(15277,0,0,0,0,0,0,0,6,0,3)    -- 'Seal of Reckoning'
    ,(15286,32,0,0,0,0,0,0,0,0,0)    -- 'Vampiric Embrace'
    ,(15346,0,0,0,0,0,0,0,6,0,3)    -- 'Seal of Reckoning'
    ,(15600,0,0,0,0,0,0,0,0.6,0,3)    -- 'Hand of Justice'
    ,(16164,28,0,0,0,0,0,0,0,0,0)    -- 'Elemental Focus'
    ,(16176,0,11,448,448,448,0,2,0,0,0)    -- 'Ancestral Healing (Rank 1)'
    ,(16256,0,0,0,0,0,0,2,0,0,0)    -- 'Flurry (Rank 1)'
    ,(16257,0,0,0,0,0,0,65536,0,0,0)    -- 'Flurry (Rank 1)'
    ,(16487,0,0,0,0,0,0,2,0,0,0)    -- 'Blood Craze (Rank 1)'
    ,(16620,0,0,0,0,0,0,0,0,0,30)    -- 'Proc Self Invulnerability'
    ,(16624,0,0,0,0,0,0,64,0,0,0)    -- 'Thorium Shield Spike'
    ,(16850,0,0,4,4,4,0,0,0,0,0)    -- 'Improved Starfire (Rank 1)'
    ,(16864,0,0,0,0,0,0,0,2,0,3)    -- 'Omen of Clarity'
    ,(16880,0,0,0,0,0,0,2,0,0,0)    -- 'Nature's Grace'
    ,(16952,0,0,4398046744576,4398046744576,4398046744576,0,2,0,0,0)    -- 'Blood Frenzy (Rank 1)'
    ,(16958,0,0,0,0,0,0,2,0,0,0)    -- 'Primal Fury (Rank 1)'
    ,(17079,0,7,524288,524288,524288,0,0,0,0,0)    -- 'Improved Enrage (Rank 1)'
    ,(17364,8,0,0,0,0,0,0,0,0,0)    -- 'Stormstrike (Rank 1)'
    ,(17495,0,0,0,0,0,0,64,0,0,0)    -- 'Crest of Retribution'
    ,(17670,0,0,0,0,0,8,0,0,0,0)    -- 'Argent Dawn Commission'
    ,(17687,0,0,0,0,0,0,116,0,0,0)    -- 'Flurry'
    ,(17793,0,5,1,1,1,0,2,0,0,0)    -- 'Improved Shadow Bolt (Rank 1)'
    ,(18094,0,5,10,10,10,0,0,0,0,0)    -- 'Nightfall (Rank 1)'
    ,(18096,0,0,549755813984,549755813984,549755813984,0,0,0,0,0)    -- 'Pyroclasm (Rank 1)'
    ,(18119,0,5,9189,9189,9189,0,0,0,0,0)    -- 'Aftermath (Rank 1)'
    ,(18137,0,0,0,0,0,0,0,0,0,3)    -- 'Shadowguard (Rank 1)'
    ,(18765,0,0,0,0,0,0,116,0,0,0)    -- 'Sweeping Strikes'
    ,(18800,0,0,0,0,0,8,0,0,0,0)    -- 'Light Test'
    ,(19228,0,0,64,64,64,0,0,0,0,0)    -- 'Improved Wing Clip (Rank 1)'
    ,(19407,0,0,512,512,512,0,0,0,0,0)    -- 'Improved Concussive Shot (Rank 1)'
    ,(19552,0,0,0,0,0,64,0,0,0,0)    -- 'Improved Aspect of the Hawk (Rank 1)'
    ,(19572,0,9,8388608,8388608,8388608,16384,0,0,0,0)    -- 'Improved Mend Pet (Rank 1)'
    ,(20049,0,0,0,0,0,0,2,0,0,0)    -- 'Vengeance (Rank 1)'
    ,(20127,0,0,0,0,0,0,2,0,0,0)    -- 'Redoubt (Rank 1)'
    ,(20128,0,0,0,0,0,0,64,0,0,0)    -- 'Redoubt'
    ,(20131,0,0,0,0,0,0,64,0,0,0)    -- 'Redoubt'
    ,(20132,0,0,0,0,0,0,64,0,0,0)    -- 'Redoubt'
    ,(20133,0,0,0,0,0,0,64,0,0,0)    -- 'Redoubt'
    ,(20134,0,0,0,0,0,0,64,0,0,0)    -- 'Redoubt'
    ,(20164,0,0,0,0,0,0,0,5,0,3)    -- 'Seal of Justice'
    ,(20165,0,0,0,0,0,0,0,20,0,3)    -- 'Seal of Light (Rank 1)'
    ,(20166,0,0,0,0,0,0,0,20,0,3)    -- 'Seal of Wisdom (Rank 1)'
    ,(20177,0,0,0,0,0,0,2,0,0,0)    -- 'Reckoning (Rank 1)'
    ,(20210,0,10,3223322624,3223322624,3223322624,0,2,0,0,0)    -- 'Illumination (Rank 1)'
    ,(20234,0,0,32768,32768,32768,0,0,0,0,0)    -- 'Improved Lay on Hands (Rank 1)'
    ,(20375,0,0,0,0,0,0,0,7,0,3)    -- 'Seal of Command (Rank 1)'
    ,(20500,0,4,268435456,268435456,268435456,0,0,0,0,0)    -- 'Improved Berserker Rage (Rank 1)'
    ,(20725,0,0,0,0,0,0,2,0,0,0)    -- 'Greater Dragon Slayer 25'
    ,(20784,0,0,0,0,0,0,2,0,0,0)    -- 'Tamed Pet Passive (DND)'
    ,(20891,0,0,0,0,0,0,2,0,0,0)    -- 'Greater Beast Slayer 25'
    ,(20911,0,0,0,0,0,0,64,0,0,0)    -- 'Blessing of Sanctuary (Rank 1)'
    ,(20925,0,0,0,0,0,0,64,0,0,0)    -- 'Holy Shield (Rank 1)'
    ,(21185,0,0,0,0,0,0,0,0,0,10)    -- 'Spinal Reaper'
    ,(21882,0,0,0,0,0,0,2,0,0,0)    -- 'Judgement Smite'
    ,(21890,0,4,3763103747823,3763103747823,3763103747823,0,0,0,0,0)    -- 'Warrior's Wrath'
    ,(22007,0,0,2099233,2099233,2099233,0,0,0,0,0)    -- 'Netherwind Focus'
    ,(22618,0,0,0,0,0,0,64,0,0,0)    -- 'Force Reactive Disk'
    ,(22620,0,0,0,0,0,0,64,0,0,0)    -- 'Force Reactive Disk'
    ,(22648,0,0,0,0,0,0,2,0,0,0)    -- 'Call of Eskhandar'
    ,(23547,0,0,0,0,0,0,32,0,0,0)    -- 'Parry'
    ,(23548,0,0,0,0,0,0,64,0,0,0)    -- 'Parry'
    ,(23551,0,0,192,192,192,0,0,0,0,0)    -- 'Lightning Shield'
    ,(23552,0,0,0,0,0,0,0,0,0,3)    -- 'Lightning Shield'
    ,(23572,0,0,192,192,192,0,0,0,0,0)    -- 'Mana Surge'
    ,(23578,0,0,0,0,0,0,0,2,0,3)    -- 'Expose Weakness'
    ,(23581,0,0,0,0,0,0,0,2,0,3)    -- 'Bloodfang'
    ,(23582,0,8,2048,2048,2048,16384,0,0,0,0)    -- 'Clean Escape'
    ,(23686,0,0,0,0,0,0,0,2,0,3)    -- 'Lightning Strike'
    ,(23689,0,0,0,0,0,0,0,4,0,3)    -- 'Heroism'
    ,(23721,0,0,2048,2048,2048,0,0,0,0,0)    -- 'Arcane Infused'
    ,(24658,0,0,0,0,0,82192,0,0,0,0)    -- 'Unstable Power'
    ,(25669,0,0,0,0,0,0,0,1,0,3)    -- 'Decapitate'
    ,(25899,0,0,0,0,0,0,64,0,0,0)    -- 'Greater Blessing of Sanctuary (Rank 1)'
    ,(26107,0,7,549764202496,549764202496,549764202496,0,116,0,0,0)    -- 'Symbols of Unending Life Finisher Bonus'
    ,(26119,0,11,2416967683,2416967683,2416967683,0,0,0,0,0)    -- 'Stormcaller Spelldamage Bonus'
    ,(26128,0,0,0,0,0,0,8,0,0,0)    -- 'Enigma Resist Bonus'
    ,(26135,0,0,8388608,8388608,8388608,0,0,0,0,0)    -- 'Battlegear of Eternal Justice'
    ,(26480,0,0,0,0,0,0,0,3,0,0)    -- 'Badge of the Swarmguard'
    ,(27419,0,0,0,0,0,0,0,3,0,0)    -- 'Warrior's Resolve'
    ,(27498,0,0,0,0,0,0,0,3,0,0)    -- 'Crusader's Wrath'
    ,(27656,0,0,0,0,0,0,0,3,0,0)    -- 'Flame Lash'
    ,(27787,0,0,0,0,0,0,0,3,0,0)    -- 'Rogue Armor Energize'
    ,(27811,0,0,0,0,0,0,2,0,0,0)    -- 'Blessed Recovery (Rank 1)'
    ,(28716,0,7,16,16,16,294912,0,0,0,0)    -- 'Rejuvenation'
    ,(28719,0,7,32,32,32,0,2,0,0,0)    -- 'Healing Touch'
    ,(28744,0,7,64,64,64,278528,0,0,0,0)    -- 'Regrowth'
    ,(28752,0,0,0,0,0,0,2,0,0,0)    -- 'Adrenaline Rush'
    ,(28789,0,10,24576,24576,24576,0,0,0,0,0)    -- 'Holy Power'
    ,(28809,0,0,4096,4096,4096,0,2,0,0,0)    -- 'Greater Heal'
    ,(28812,0,0,0,0,0,0,2,0,0,0)    -- 'Head Rush'
    ,(28816,0,0,0,0,0,0,0,3,0,0)    -- 'Invigorate'
    ,(28823,0,0,192,192,192,0,0,0,0,0)    -- 'Totemic Power'
    ,(28847,0,7,32,32,32,0,0,0,0,0)    -- 'Healing Touch Refund'
    ,(28849,0,11,128,128,128,0,0,0,0,0)    -- 'Lesser Healing Wave'
    ,(29062,0,0,0,0,0,0,2,0,0,0)    -- 'Eye of the Storm (Rank 1)'
    ,(29074,20,0,0,0,0,0,2,0,0,0)    -- 'Master of Elements (Rank 1)'
    ,(29150,0,0,0,0,0,0,0,3,0,0)    -- 'Electric Discharge'
    ,(29441,0,0,0,0,0,0,8,0,0,1)    -- 'Magic Absorption (Rank 1)'
    ,(29501,0,0,0,0,0,0,0,3,0,0)    -- 'Frost Arrow'
    ,(29624,0,0,0,0,0,0,0,3,0,0)    -- 'Searing Arrow'
    ,(29625,0,0,0,0,0,0,0,3,0,0)    -- 'Flaming Cannonball'
    ,(29626,0,0,0,0,0,0,0,3,0,0)    -- 'Shadowbolt'
    ,(29632,0,0,0,0,0,0,0,3,0,0)    -- 'Shadow Shot'
    ,(29633,0,0,0,0,0,0,0,3,0,0)    -- 'Fire Blast'
    ,(29634,0,0,0,0,0,0,0,3,0,0)    -- 'Quill Shot'
    ,(29635,0,0,0,0,0,0,0,3,0,0)    -- 'Flaming Shell'
    ,(29636,0,0,0,0,0,0,0,3,0,0)    -- 'Venom Shot'
    ,(29637,0,0,0,0,0,0,0,3,0,0)    -- 'Keeper's Sting'
    ,(30003,0,0,0,0,0,0,2048,0,0,0)    -- 'Sheen of Zanza'
    ,(30160,0,0,0,0,0,0,2,0,0,0)    -- 'Elemental Devastation (Rank 1)'
    ,(30802,0,0,0,0,0,0,2,0,0,0)    -- 'Unleashed Rage (Rank 1)'
    ,(30808,0,0,0,0,0,0,2,0,0,0)    -- 'Unleashed Rage (Rank 2)'
    ,(30809,0,0,0,0,0,0,2,0,0,0)    -- 'Unleashed Rage (Rank 3)'
    ,(30810,0,0,0,0,0,0,2,0,0,0)    -- 'Unleashed Rage (Rank 4)'
    ,(30811,0,0,0,0,0,0,2,0,0,0)    -- 'Unleashed Rage (Rank 5)'
;
