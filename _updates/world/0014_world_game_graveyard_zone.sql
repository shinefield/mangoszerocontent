-- Host: localhost    Database: world
-- ------------------------------------------------------
-- Add initial data to world database
--
-- We will add graveyard data for determining where dead players should
-- be transported upon death.
--

-- Provide variables for graveyard faction
SET @FACTION_ANY                                = 0;
SET @FACTION_ALLIANCE                           = 469;
SET @FACTION_HORDE                              = 67;

-- Provide variables for zones
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

-- Insert graveyard data for each zone
INSERT INTO `game_graveyard_zone` VALUES
    (3,     @ZONE_DUSKWOOD,                     @FACTION_ALLIANCE),
    (4,     @ZONE_WESTFALL,                     @FACTION_ANY),
    (4,     @ZONE_THE_DEADMINES,                @FACTION_ANY),
    (6,     @ZONE_LOCH_MODAN,                   @FACTION_ALLIANCE),
    (7,     @ZONE_DUN_MOROGH,                   @FACTION_HORDE),
    (7,     @ZONE_WETLANDS,                     @FACTION_ANY),
    (7,     @ZONE_LOCH_MODAN,                   @FACTION_HORDE),
    (8,     @ZONE_BADLANDS,                     @FACTION_ANY),
    (8,     @ZONE_LOCH_MODAN,                   @FACTION_HORDE),
    (8,     @ZONE_ULDAMAN,                      @FACTION_ANY),
    (10,    @ZONE_THE_BARRENS,                  @FACTION_HORDE),
    (10,    @ZONE_WAILING_CAVERNS,              @FACTION_ANY),
    (31,    @ZONE_DESOLACE,                     @FACTION_ANY),
    (31,    @ZONE_MARAUDON,                     @FACTION_ANY),
    (32,    @ZONE_DUROTAR,                      @FACTION_ANY),
    (34,    @ZONE_MULGORE,                      @FACTION_HORDE),
    (35,    @ZONE_DARKSHORE,                    @FACTION_ALLIANCE),
    (36,    @ZONE_DEADWIND_PASS,                @FACTION_ANY),
    (39,    @ZONE_THOUSAND_NEEDLES,             @FACTION_ANY),
    (39,    @ZONE_RAZORFEN_KRAUL,               @FACTION_ANY),
    (39,    @ZONE_RAZORFEN_DOWNS,               @FACTION_ANY),
    (70,    @ZONE_SILITHUS,                     @FACTION_ANY),
    (89,    @ZONE_MULGORE,                      @FACTION_HORDE),
    (90,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE),
    (90,    @ZONE_DARNASSUS,                    @FACTION_ALLIANCE),
    (91,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE),
    (92,    @ZONE_ASHENVALE,                    @FACTION_ANY),
    (92,    @ZONE_BLACKFATHOM_DEEPS,            @FACTION_ANY),
    (93,    @ZONE_TELDRASSIL,                   @FACTION_ALLIANCE),
    (94,    @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE),
    (96,    @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE),
    (97,    @ZONE_SILVERPINE_FOREST,            @FACTION_HORDE),
    (97,    @ZONE_SHADOWFANG_KEEP,              @FACTION_ANY),
    (98,    @ZONE_ALTERAC_MOUNTAINS,            @FACTION_HORDE),
    (98,    @ZONE_HILLSBRAD_FOOTHILLS,          @FACTION_HORDE),
    (99,    @ZONE_ARATHI_HIGHLANDS,             @FACTION_ANY),
    (100,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE),
    (101,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE),
    (101,   @ZONE_GNOMEREGAN,                   @FACTION_ANY),
    (103,   @ZONE_BADLANDS,                     @FACTION_HORDE),
    (104,   @ZONE_DUSKWOOD,                     @FACTION_HORDE),
    (104,   @ZONE_REDRIDGE_MOUNTAINS,           @FACTION_ANY),
    (105,   @ZONE_ELWYNN_FOREST,                @FACTION_ALLIANCE),
    (106,   @ZONE_ELWYNN_FOREST,                @FACTION_ALLIANCE),
    (106,   @ZONE_THE_STOCKADE,                 @FACTION_ANY),
    (107,   @ZONE_STORMWIND_CITY,               @FACTION_ALLIANCE),
    (107,   @ZONE_DEEPRUN_TRAM,                 @FACTION_ANY),
    (107,   @ZONE_CHAMPIONS_HALL,               @FACTION_ANY),
    (108,   @ZONE_SWAMP_OF_SORROWS,             @FACTION_HORDE),
    (108,   @ZONE_SUNKEN_TEMPLE,                @FACTION_ANY),
    (108,   @ZONE_THE_TEMPLE_OF_ATALHAKKAR,     @FACTION_ANY),
    (109,   @ZONE_STRANGLETHORN_VALE,           @FACTION_ANY),
    (149,   @ZONE_ALTERAC_MOUNTAINS,            @FACTION_ALLIANCE),
    (149,   @ZONE_SILVERPINE_FOREST,            @FACTION_ALLIANCE),
    (149,   @ZONE_SHADOWFANG_KEEP,              @FACTION_ANY),
    (149,   @ZONE_HILLSBRAD_FOOTHILLS,          @FACTION_ALLIANCE),
    (169,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY),
    (189,   @ZONE_DUSTWALLOW_MARSH,             @FACTION_ALLIANCE),
    (189,   @ZONE_ONYXIAS_LAIR,                 @FACTION_ALLIANCE),
    (209,   @ZONE_TANARIS,                      @FACTION_ANY),
    (209,   @ZONE_ZULFARRAK,                    @FACTION_ANY),
    (209,   @ZONE_CAVERNS_OF_TIME,              @FACTION_ANY),
    (229,   @ZONE_THE_BARRENS,                  @FACTION_ANY),
    (249,   @ZONE_THE_BARRENS,                  @FACTION_HORDE),
    (249,   @ZONE_MULGORE,                      @FACTION_ALLIANCE),
    (249,   @ZONE_THUNDER_BLUFF,                @FACTION_ALLIANCE),
    (289,   @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE),
    (309,   @ZONE_FERALAS,                      @FACTION_ALLIANCE),
    (309,   @ZONE_THE_TEMPLE_OF_ATALHAKKAR,     @FACTION_ANY),
    (310,   @ZONE_FERALAS,                      @FACTION_HORDE),
    (329,   @ZONE_THOUSAND_NEEDLES,             @FACTION_ANY),
    (349,   @ZONE_THE_HINTERLANDS,              @FACTION_ALLIANCE),
    (369,   @ZONE_AZSHARA,                      @FACTION_ANY),
    (370,   @ZONE_BLASTED_LANDS,                @FACTION_ANY),
    (370,   @ZONE_SWAMP_OF_SORROWS,             @FACTION_ALLIANCE),
    (389,   @ZONE_STRANGLETHORN_VALE,           @FACTION_ANY),
    (389,   @ZONE_THE_DEADMINES,                @FACTION_ANY),
    (389,   @ZONE_ZULGURUB,                     @FACTION_ANY),
    (409,   @ZONE_STONETALON_MOUNTAINS,         @FACTION_ANY),
    (429,   @ZONE_SCARLET_MONASTERY,            @FACTION_ANY),
    (429,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY),
    (449,   @ZONE_FELWOOD,                      @FACTION_ANY),
    (450,   @ZONE_UNGORO_CRATER,                @FACTION_ANY),
    (469,   @ZONE_TELDRASSIL,                   @FACTION_HORDE),
    (469,   @ZONE_DARKSHORE,                    @FACTION_ALLIANCE),
    (469,   @ZONE_DARNASSUS,                    @FACTION_HORDE),
    (489,   @ZONE_WETLANDS,                     @FACTION_ANY),
    (509,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_ALLIANCE),
    (510,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY),
    (511,   @ZONE_WINTERSPRING,                 @FACTION_ANY),
    (512,   @ZONE_THE_BARRENS,                  @FACTION_ALLIANCE),
    (512,   @ZONE_DARKSHORE,                    @FACTION_HORDE),
    (512,   @ZONE_ASHENVALE,                    @FACTION_ANY),
    (512,   @ZONE_BLACKFATHOM_DEEPS,            @FACTION_ANY),
    (512,   @ZONE_ORGRIMMAR,                    @FACTION_ALLIANCE),
    (529,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY),
    (569,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_HORDE),
    (569,   @ZONE_TIRISFAL_GLADES,              @FACTION_HORDE),
    (609,   @ZONE_AZSHARA,                      @FACTION_ANY),
    (610,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE),
    (611,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE),
    (629,   @ZONE_TIRISFAL_GLADES,              @FACTION_ALLIANCE),
    (629,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY),
    (630,   @ZONE_AZSHARA,                      @FACTION_ANY),
    (631,   @ZONE_DUSTWALLOW_MARSH,             @FACTION_HORDE),
    (631,   @ZONE_ONYXIAS_LAIR,                 @FACTION_HORDE),
    (632,   @ZONE_BURNING_STEPPES,              @FACTION_ANY),
    (633,   @ZONE_MOONGLADE,                    @FACTION_ANY),
    (634,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY),
    (635,   @ZONE_FELWOOD,                      @FACTION_ANY),
    (636,   @ZONE_SEARING_GORGE,                @FACTION_ANY),
    (636,   @ZONE_BLACKROCK_DEPTHS,             @FACTION_ANY),
    (636,   @ZONE_BLACKROCK_MOUNTAIN,           @FACTION_ANY),
    (636,   @ZONE_BLACKROCK_SPIRE,              @FACTION_ANY),
    (636,   @ZONE_MOLTEN_CORE,                  @FACTION_ANY),
    (636,   @ZONE_BLACKWING_LAIR,               @FACTION_ANY),
    (649,   @ZONE_DUROTAR,                      @FACTION_HORDE),
    (669,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY),
    (670,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY),
    (671,   @ZONE_PROGRAMMER_ISLE,              @FACTION_ANY),
    (689,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY),
    (709,   @ZONE_DUROTAR,                      @FACTION_HORDE),
    (729,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE),
    (749,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE),
    (750,   @ZONE_ALTERAC_VALLEY,               @FACTION_HORDE),
    (751,   @ZONE_ALTERAC_VALLEY,               @FACTION_ALLIANCE),
    (769,   @ZONE_WARSONG_GULCH,                @FACTION_ALLIANCE),
    (770,   @ZONE_WARSONG_GULCH,                @FACTION_HORDE),
    (771,   @ZONE_WARSONG_GULCH,                @FACTION_ALLIANCE),
    (772,   @ZONE_WARSONG_GULCH,                @FACTION_HORDE),
    (789,   @ZONE_THE_HINTERLANDS,              @FACTION_HORDE),
    (809,   @ZONE_WARSONG_GULCH,                @FACTION_ANY),
    (810,   @ZONE_WARSONG_GULCH,                @FACTION_ANY),
    (829,   @ZONE_WESTERN_PLAGUELANDS,          @FACTION_ANY),
    (829,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY),
    (830,   @ZONE_ALTERAC_VALLEY,               @FACTION_ANY),
    (849,   @ZONE_FERALAS,                      @FACTION_ANY),
    (849,   @ZONE_DIRE_MAUL,                    @FACTION_ANY),
    (850,   @ZONE_DUROTAR,                      @FACTION_HORDE),
    (850,   @ZONE_ORGRIMMAR,                    @FACTION_HORDE),
    (850,   @ZONE_RAGEFIRE_CHASM,               @FACTION_ANY),
    (850,   @ZONE_HALL_OF_LEGENDS,              @FACTION_HORDE),
    (851,   @ZONE_MULGORE,                      @FACTION_HORDE),
    (851,   @ZONE_THUNDER_BLUFF,                @FACTION_HORDE),
    (852,   @ZONE_DUN_MOROGH,                   @FACTION_ALLIANCE),
    (854,   @ZONE_ELWYNN_FOREST,                @FACTION_ANY),
    (854,   @ZONE_STORMWIND_CITY,               @FACTION_HORDE),
    (869,   @ZONE_SCHOLOMANCE,                  @FACTION_ANY),
    (889,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE),
    (890,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE),
    (891,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY),
    (892,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY),
    (893,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE),
    (894,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY),
    (895,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE),
    (896,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY),
    (897,   @ZONE_ARATHI_BASIN,                 @FACTION_ANY),
    (898,   @ZONE_ARATHI_BASIN,                 @FACTION_ALLIANCE),
    (899,   @ZONE_ARATHI_BASIN,                 @FACTION_HORDE),
    (909,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY),
    (909,   @ZONE_STRATHOLME,                   @FACTION_ANY),
    (909,   @ZONE_NAXXRAMAS,                    @FACTION_ANY),
    (910,   @ZONE_SILITHUS,                     @FACTION_ANY),
    (911,   @ZONE_DUSKWOOD,                     @FACTION_ANY),
    (913,   @ZONE_SILITHUS,                     @FACTION_ANY),
    (913,   @ZONE_AHNQIRAJ,                     @FACTION_ANY),
    (913,   @ZONE_GATES_OF_AHNQIRAJ,            @FACTION_ANY),
    (927,   @ZONE_EASTERN_PLAGUELANDS,          @FACTION_ANY);
