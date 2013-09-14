-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- We will add item templates used for character creation.
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
SET @ITEM_QUALITY_POOR                          = 0;        -- Color: Grey
SET @ITEM_QUALITY_COMMON                        = 1;        -- Color: White
SET @ITEM_QUALITY_UNCOMMON                      = 2;        -- Color: Green
SET @ITEM_QUALITY_RARE                          = 3;        -- Color: Blue
SET @ITEM_QUALITY_EPIC                          = 4;        -- Color: Purple
SET @ITEM_QUALITY_LEGENDARY                     = 5;        -- Color: Orange
SET @ITEM_QUALITY_ARTIFACT                      = 6;        -- Color: Red

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
SET @ITEM_EXTRA_FLAG_REALTIME_DURATION          = 2;        -- Item exires with real time instead of game time

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

-- -> Damage schools ---------------------------------------------------------
SET @DMG_PHYSICAL                               = 0;
SET @DMG_HOLY                                   = 1;
SET @DMG_FIRE                                   = 2;
SET @DMG_NATURE                                 = 3;
SET @DMG_FROST                                  = 4;
SET @DMG_SHADOW                                 = 5;
SET @DMG_ARCANE                                 = 6;

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

-- -> Sheath type
SET @SHEATHETYPE_NONE                           = 0;
SET @SHEATHETYPE_MAINHAND                       = 1;
SET @SHEATHETYPE_OFFHAND                        = 2;
SET @SHEATHETYPE_LARGEWEAPONLEFT                = 3;
SET @SHEATHETYPE_LARGEWEAPONRIGHT               = 4;
SET @SHEATHETYPE_HIPWEAPONLEFT                  = 5;
SET @SHEATHETYPE_HIPWEAPONRIGHT                 = 6;
SET @SHEATHETYPE_SHIELD                         = 7;

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
    `BuyCount` = 1, `BuyPrice` = 10, `SellPrice` = 2, `stackable` = 10
WHERE `entry` = 8164;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP, `PageMaterial` = @PAGEMAT_PARCHMENT,
    `BuyCount` = 1, `BuyPrice` = 0, `SellPrice` = 0, `stackable` = 1
WHERE `entry` = 9311;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `BuyCount` = 1, `BuyPrice` = 0, `SellPrice` = 0, `stackable` = 1
WHERE `entry` = 18154;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP,
    `BuyCount` = 1, `BuyPrice` = 0, `SellPrice` = 0, `stackable` = 1
WHERE `entry` = 21140;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_NON_EQUIP, `PageMaterial` = @PAGEMAT_VALENTINE,
    `BuyCount` = 1, `BuyPrice` = 0, `SellPrice` = 0, `stackable` = 1
WHERE `entry` = 22058;

-- Adjust item properties for start outfits ----------------------------------
UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 35, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @DMG_PHYSICAL, `delay` = 1900,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 25;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 47, `SellPrice` = 9,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_OFFHAND
WHERE `entry` = 35;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 38, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @DMG_PHYSICAL, `delay` = 1900,
    `sheath` = @SHEATHETYPE_LARGEWEAPONLEFT
WHERE `entry` = 36;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_WEAPONMAINHAND, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 38, `SellPrice` = 7,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2000,
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
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @DMG_PHYSICAL, `delay` = 1600,
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
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2900,
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
    `dmg_min1` = 2, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2300,
    `ammo_type` = 2, `RangedModRange` = 100
WHERE `entry` = 2504;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_RANGEDRIGHT, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 20,
    `BuyPrice` = 27, `SellPrice` = 5,
    `dmg_min1` = 2, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2300,
    `ammo_type` = 3, `RangedModRange` = 100
WHERE `entry` = 2508;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_AMMO, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 10, `stackable` = 200,
    `BagFamily` = 1, `ContainerSlots` = 0,
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @DMG_PHYSICAL, `delay` = 3000
WHERE `entry` = 2512;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_AMMO, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 5, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 10, `stackable` = 200,
    `BagFamily` = 2, `ContainerSlots` = 0,
    `dmg_min1` = 1, `dmg_max1` = 2, `dmg_type1` = @DMG_PHYSICAL, `delay` = 3000
WHERE `entry` = 2516;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_THROWN, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 3, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 15, `stackable` = 200,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2000,
    `ammo_type` = 4, `RangedModRange` = 100
WHERE `entry` = 2947;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_THROWN, `Material` = @MATERIAL_METAL,
    `ItemLevel` = 3, `RequiredLevel` = 1,
    `BuyCount` = 200, `BuyPrice` = 15, `stackable` = 200,
    `dmg_min1` = 1, `dmg_max1` = 3, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2000,
    `ammo_type` = 4, `RangedModRange` = 100
WHERE `entry` = 3111;

UPDATE `item_template`
SET
    `InventoryType` = @INVTYPE_2HWEAPON, `Material` = @MATERIAL_WOOD,
    `ItemLevel` = 2, `RequiredLevel` = 1,
    `MaxDurability` = 25,
    `BuyPrice` = 45, `SellPrice` = 9,
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2900,
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
    `dmg_min1` = 3, `dmg_max1` = 5, `dmg_type1` = @DMG_PHYSICAL, `delay` = 2900,
    `sheath` = @SHEATHETYPE_MAINHAND
WHERE `entry` = 12282;
