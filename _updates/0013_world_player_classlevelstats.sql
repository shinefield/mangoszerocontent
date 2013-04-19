-- Add initial data to world database
--
-- We will add player information for stat increases upon leveling.
--

-- Select world database
USE `zp_world`;

-- Provide variables for classes
SET @CLASS_WARRIOR                              = 1;
SET @CLASS_PALADIN                              = 2;
SET @CLASS_HUNTER                               = 3;
SET @CLASS_ROGUE                                = 4;
SET @CLASS_PRIEST                               = 5;
SET @CLASS_SHAMAN                               = 7;
SET @CLASS_MAGE                                 = 8;
SET @CLASS_WARLOCK                              = 9;
SET @CLASS_DRUID                                = 11;

-- Insert creation information for player character stat increases upon leveling
INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_WARRIOR, 1, 20, 0),
    (@CLASS_WARRIOR, 2, 29, 0),
    (@CLASS_WARRIOR, 3, 38, 0),
    (@CLASS_WARRIOR, 4, 47, 0),
    (@CLASS_WARRIOR, 5, 56, 0),
    (@CLASS_WARRIOR, 6, 65, 0),
    (@CLASS_WARRIOR, 7, 74, 0),
    (@CLASS_WARRIOR, 8, 83, 0),
    (@CLASS_WARRIOR, 9, 92, 0),
    (@CLASS_WARRIOR, 10, 101, 0),
    (@CLASS_WARRIOR, 11, 100, 0),
    (@CLASS_WARRIOR, 12, 109, 0),
    (@CLASS_WARRIOR, 13, 118, 0),
    (@CLASS_WARRIOR, 14, 128, 0),
    (@CLASS_WARRIOR, 15, 139, 0),
    (@CLASS_WARRIOR, 16, 151, 0),
    (@CLASS_WARRIOR, 17, 154, 0),
    (@CLASS_WARRIOR, 18, 168, 0),
    (@CLASS_WARRIOR, 19, 168, 0),
    (@CLASS_WARRIOR, 20, 199, 0),
    (@CLASS_WARRIOR, 21, 206, 0),
    (@CLASS_WARRIOR, 22, 224, 0),
    (@CLASS_WARRIOR, 23, 243, 0),
    (@CLASS_WARRIOR, 24, 253, 0),
    (@CLASS_WARRIOR, 25, 274, 0),
    (@CLASS_WARRIOR, 26, 296, 0),
    (@CLASS_WARRIOR, 27, 309, 0),
    (@CLASS_WARRIOR, 28, 333, 0),
    (@CLASS_WARRIOR, 29, 348, 0),
    (@CLASS_WARRIOR, 30, 374, 0),
    (@CLASS_WARRIOR, 31, 401, 0),
    (@CLASS_WARRIOR, 32, 419, 0),
    (@CLASS_WARRIOR, 33, 448, 0),
    (@CLASS_WARRIOR, 34, 468, 0),
    (@CLASS_WARRIOR, 35, 499, 0),
    (@CLASS_WARRIOR, 36, 521, 0),
    (@CLASS_WARRIOR, 37, 545, 0),
    (@CLASS_WARRIOR, 38, 581, 0),
    (@CLASS_WARRIOR, 39, 609, 0),
    (@CLASS_WARRIOR, 40, 649, 0),
    (@CLASS_WARRIOR, 41, 681, 0),
    (@CLASS_WARRIOR, 42, 715, 0),
    (@CLASS_WARRIOR, 43, 761, 0),
    (@CLASS_WARRIOR, 44, 799, 0),
    (@CLASS_WARRIOR, 45, 839, 0),
    (@CLASS_WARRIOR, 46, 881, 0),
    (@CLASS_WARRIOR, 47, 935, 0),
    (@CLASS_WARRIOR, 48, 981, 0),
    (@CLASS_WARRIOR, 49, 1029, 0),
    (@CLASS_WARRIOR, 50, 1079, 0),
    (@CLASS_WARRIOR, 51, 1131, 0),
    (@CLASS_WARRIOR, 52, 1185, 0),
    (@CLASS_WARRIOR, 53, 1241, 0),
    (@CLASS_WARRIOR, 54, 1299, 0),
    (@CLASS_WARRIOR, 55, 1359, 0),
    (@CLASS_WARRIOR, 56, 1421, 0),
    (@CLASS_WARRIOR, 57, 1485, 0),
    (@CLASS_WARRIOR, 58, 1551, 0),
    (@CLASS_WARRIOR, 59, 1619, 0),
    (@CLASS_WARRIOR, 60, 1689, 0);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_PALADIN, 1, 28, 59),
    (@CLASS_PALADIN, 2, 26, 64),
    (@CLASS_PALADIN, 3, 34, 84),
    (@CLASS_PALADIN, 4, 42, 90),
    (@CLASS_PALADIN, 5, 50, 112),
    (@CLASS_PALADIN, 6, 58, 120),
    (@CLASS_PALADIN, 7, 66, 129),
    (@CLASS_PALADIN, 8, 84, 154),
    (@CLASS_PALADIN, 9, 92, 165),
    (@CLASS_PALADIN, 10, 100, 192),
    (@CLASS_PALADIN, 11, 108, 205),
    (@CLASS_PALADIN, 12, 116, 219),
    (@CLASS_PALADIN, 13, 124, 249),
    (@CLASS_PALADIN, 14, 132, 265),
    (@CLASS_PALADIN, 15, 131, 282),
    (@CLASS_PALADIN, 16, 141, 315),
    (@CLASS_PALADIN, 17, 152, 334),
    (@CLASS_PALADIN, 18, 164, 354),
    (@CLASS_PALADIN, 19, 177, 390),
    (@CLASS_PALADIN, 20, 191, 412),
    (@CLASS_PALADIN, 21, 206, 435),
    (@CLASS_PALADIN, 22, 222, 459),
    (@CLASS_PALADIN, 23, 239, 499),
    (@CLASS_PALADIN, 24, 247, 525),
    (@CLASS_PALADIN, 25, 266, 552),
    (@CLASS_PALADIN, 26, 286, 579),
    (@CLASS_PALADIN, 27, 307, 621),
    (@CLASS_PALADIN, 28, 329, 648),
    (@CLASS_PALADIN, 29, 342, 675),
    (@CLASS_PALADIN, 30, 366, 702),
    (@CLASS_PALADIN, 31, 391, 729),
    (@CLASS_PALADIN, 32, 407, 756),
    (@CLASS_PALADIN, 33, 434, 798),
    (@CLASS_PALADIN, 34, 462, 825),
    (@CLASS_PALADIN, 35, 481, 852),
    (@CLASS_PALADIN, 36, 511, 879),
    (@CLASS_PALADIN, 37, 542, 906),
    (@CLASS_PALADIN, 38, 564, 933),
    (@CLASS_PALADIN, 39, 597, 960),
    (@CLASS_PALADIN, 40, 621, 987),
    (@CLASS_PALADIN, 41, 656, 1014),
    (@CLASS_PALADIN, 42, 682, 1041),
    (@CLASS_PALADIN, 43, 719, 1068),
    (@CLASS_PALADIN, 44, 747, 1110),
    (@CLASS_PALADIN, 45, 786, 1137),
    (@CLASS_PALADIN, 46, 816, 1164),
    (@CLASS_PALADIN, 47, 857, 1176),
    (@CLASS_PALADIN, 48, 889, 1203),
    (@CLASS_PALADIN, 49, 922, 1230),
    (@CLASS_PALADIN, 50, 966, 1257),
    (@CLASS_PALADIN, 51, 1001, 1284),
    (@CLASS_PALADIN, 52, 1037, 1311),
    (@CLASS_PALADIN, 53, 1084, 1338),
    (@CLASS_PALADIN, 54, 1122, 1365),
    (@CLASS_PALADIN, 55, 1161, 1392),
    (@CLASS_PALADIN, 56, 1201, 1419),
    (@CLASS_PALADIN, 57, 1252, 1446),
    (@CLASS_PALADIN, 58, 1294, 1458),
    (@CLASS_PALADIN, 59, 1337, 1485),
    (@CLASS_PALADIN, 60, 1381, 1512);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_HUNTER, 1, 26, 63),
    (@CLASS_HUNTER, 2, 33, 70),
    (@CLASS_HUNTER, 3, 40, 91),
    (@CLASS_HUNTER, 4, 57, 98),
    (@CLASS_HUNTER, 5, 64, 121),
    (@CLASS_HUNTER, 6, 71, 130),
    (@CLASS_HUNTER, 7, 78, 155),
    (@CLASS_HUNTER, 8, 85, 166),
    (@CLASS_HUNTER, 9, 92, 193),
    (@CLASS_HUNTER, 10, 109, 206),
    (@CLASS_HUNTER, 11, 116, 235),
    (@CLASS_HUNTER, 12, 123, 250),
    (@CLASS_HUNTER, 13, 130, 266),
    (@CLASS_HUNTER, 14, 138, 298),
    (@CLASS_HUNTER, 15, 147, 316),
    (@CLASS_HUNTER, 16, 157, 350),
    (@CLASS_HUNTER, 17, 168, 370),
    (@CLASS_HUNTER, 18, 180, 391),
    (@CLASS_HUNTER, 19, 193, 428),
    (@CLASS_HUNTER, 20, 207, 451),
    (@CLASS_HUNTER, 21, 222, 475),
    (@CLASS_HUNTER, 22, 238, 515),
    (@CLASS_HUNTER, 23, 255, 541),
    (@CLASS_HUNTER, 24, 273, 568),
    (@CLASS_HUNTER, 25, 292, 611),
    (@CLASS_HUNTER, 26, 312, 640),
    (@CLASS_HUNTER, 27, 333, 670),
    (@CLASS_HUNTER, 28, 355, 715),
    (@CLASS_HUNTER, 29, 378, 745),
    (@CLASS_HUNTER, 30, 402, 775),
    (@CLASS_HUNTER, 31, 417, 805),
    (@CLASS_HUNTER, 32, 443, 850),
    (@CLASS_HUNTER, 33, 470, 880),
    (@CLASS_HUNTER, 34, 498, 910),
    (@CLASS_HUNTER, 35, 527, 940),
    (@CLASS_HUNTER, 36, 547, 970),
    (@CLASS_HUNTER, 37, 578, 1015),
    (@CLASS_HUNTER, 38, 610, 1045),
    (@CLASS_HUNTER, 39, 643, 1075),
    (@CLASS_HUNTER, 40, 667, 1105),
    (@CLASS_HUNTER, 41, 702, 1135),
    (@CLASS_HUNTER, 42, 738, 1180),
    (@CLASS_HUNTER, 43, 775, 1210),
    (@CLASS_HUNTER, 44, 803, 1240),
    (@CLASS_HUNTER, 45, 842, 1270),
    (@CLASS_HUNTER, 46, 872, 1300),
    (@CLASS_HUNTER, 47, 913, 1330),
    (@CLASS_HUNTER, 48, 955, 1360),
    (@CLASS_HUNTER, 49, 988, 1390),
    (@CLASS_HUNTER, 50, 1032, 1420),
    (@CLASS_HUNTER, 51, 1067, 1450),
    (@CLASS_HUNTER, 52, 1113, 1480),
    (@CLASS_HUNTER, 53, 1150, 1510),
    (@CLASS_HUNTER, 54, 1198, 1540),
    (@CLASS_HUNTER, 55, 1237, 1570),
    (@CLASS_HUNTER, 56, 1287, 1600),
    (@CLASS_HUNTER, 57, 1328, 1630),
    (@CLASS_HUNTER, 58, 1370, 1660),
    (@CLASS_HUNTER, 59, 1423, 1690),
    (@CLASS_HUNTER, 60, 1467, 1720);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_ROGUE, 1, 25, 0),
    (@CLASS_ROGUE, 2, 32, 0),
    (@CLASS_ROGUE, 3, 49, 0),
    (@CLASS_ROGUE, 4, 56, 0),
    (@CLASS_ROGUE, 5, 63, 0),
    (@CLASS_ROGUE, 6, 80, 0),
    (@CLASS_ROGUE, 7, 87, 0),
    (@CLASS_ROGUE, 8, 104, 0),
    (@CLASS_ROGUE, 9, 111, 0),
    (@CLASS_ROGUE, 10, 118, 0),
    (@CLASS_ROGUE, 11, 125, 0),
    (@CLASS_ROGUE, 12, 142, 0),
    (@CLASS_ROGUE, 13, 149, 0),
    (@CLASS_ROGUE, 14, 156, 0),
    (@CLASS_ROGUE, 15, 173, 0),
    (@CLASS_ROGUE, 16, 181, 0),
    (@CLASS_ROGUE, 17, 190, 0),
    (@CLASS_ROGUE, 18, 200, 0),
    (@CLASS_ROGUE, 19, 221, 0),
    (@CLASS_ROGUE, 20, 233, 0),
    (@CLASS_ROGUE, 21, 246, 0),
    (@CLASS_ROGUE, 22, 260, 0),
    (@CLASS_ROGUE, 23, 275, 0),
    (@CLASS_ROGUE, 24, 301, 0),
    (@CLASS_ROGUE, 25, 318, 0),
    (@CLASS_ROGUE, 26, 336, 0),
    (@CLASS_ROGUE, 27, 355, 0),
    (@CLASS_ROGUE, 28, 375, 0),
    (@CLASS_ROGUE, 29, 396, 0),
    (@CLASS_ROGUE, 30, 428, 0),
    (@CLASS_ROGUE, 31, 451, 0),
    (@CLASS_ROGUE, 32, 475, 0),
    (@CLASS_ROGUE, 33, 500, 0),
    (@CLASS_ROGUE, 34, 526, 0),
    (@CLASS_ROGUE, 35, 553, 0),
    (@CLASS_ROGUE, 36, 581, 0),
    (@CLASS_ROGUE, 37, 610, 0),
    (@CLASS_ROGUE, 38, 640, 0),
    (@CLASS_ROGUE, 39, 671, 0),
    (@CLASS_ROGUE, 40, 703, 0),
    (@CLASS_ROGUE, 41, 736, 0),
    (@CLASS_ROGUE, 42, 770, 0),
    (@CLASS_ROGUE, 43, 805, 0),
    (@CLASS_ROGUE, 44, 841, 0),
    (@CLASS_ROGUE, 45, 878, 0),
    (@CLASS_ROGUE, 46, 916, 0),
    (@CLASS_ROGUE, 47, 955, 0),
    (@CLASS_ROGUE, 48, 995, 0),
    (@CLASS_ROGUE, 49, 1026, 0),
    (@CLASS_ROGUE, 50, 1068, 0),
    (@CLASS_ROGUE, 51, 1111, 0),
    (@CLASS_ROGUE, 52, 1155, 0),
    (@CLASS_ROGUE, 53, 1200, 0),
    (@CLASS_ROGUE, 54, 1246, 0),
    (@CLASS_ROGUE, 55, 1283, 0),
    (@CLASS_ROGUE, 56, 1331, 0),
    (@CLASS_ROGUE, 57, 1380, 0),
    (@CLASS_ROGUE, 58, 1430, 0),
    (@CLASS_ROGUE, 59, 1471, 0),
    (@CLASS_ROGUE, 60, 1523, 0);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_PRIEST, 1, 31, 110),
    (@CLASS_PRIEST, 2, 37, 165),
    (@CLASS_PRIEST, 3, 42, 189),
    (@CLASS_PRIEST, 4, 57, 200),
    (@CLASS_PRIEST, 5, 72, 197),
    (@CLASS_PRIEST, 6, 77, 210),
    (@CLASS_PRIEST, 7, 92, 224),
    (@CLASS_PRIEST, 8, 107, 239),
    (@CLASS_PRIEST, 9, 112, 255),
    (@CLASS_PRIEST, 10, 127, 272),
    (@CLASS_PRIEST, 11, 132, 275),
    (@CLASS_PRIEST, 12, 147, 294),
    (@CLASS_PRIEST, 13, 162, 314),
    (@CLASS_PRIEST, 14, 167, 320),
    (@CLASS_PRIEST, 15, 182, 342),
    (@CLASS_PRIEST, 16, 187, 365),
    (@CLASS_PRIEST, 17, 202, 389),
    (@CLASS_PRIEST, 18, 217, 399),
    (@CLASS_PRIEST, 19, 222, 425),
    (@CLASS_PRIEST, 20, 237, 437),
    (@CLASS_PRIEST, 21, 242, 465),
    (@CLASS_PRIEST, 22, 258, 494),
    (@CLASS_PRIEST, 23, 265, 509),
    (@CLASS_PRIEST, 24, 283, 540),
    (@CLASS_PRIEST, 25, 292, 557),
    (@CLASS_PRIEST, 26, 312, 590),
    (@CLASS_PRIEST, 27, 333, 609),
    (@CLASS_PRIEST, 28, 345, 644),
    (@CLASS_PRIEST, 29, 368, 665),
    (@CLASS_PRIEST, 30, 382, 687),
    (@CLASS_PRIEST, 31, 407, 725),
    (@CLASS_PRIEST, 32, 423, 749),
    (@CLASS_PRIEST, 33, 450, 788),
    (@CLASS_PRIEST, 34, 468, 812),
    (@CLASS_PRIEST, 35, 497, 836),
    (@CLASS_PRIEST, 36, 517, 860),
    (@CLASS_PRIEST, 37, 538, 899),
    (@CLASS_PRIEST, 38, 570, 923),
    (@CLASS_PRIEST, 39, 593, 947),
    (@CLASS_PRIEST, 40, 627, 971),
    (@CLASS_PRIEST, 41, 652, 1010),
    (@CLASS_PRIEST, 42, 688, 1034),
    (@CLASS_PRIEST, 43, 715, 1058),
    (@CLASS_PRIEST, 44, 753, 1082),
    (@CLASS_PRIEST, 45, 782, 1106),
    (@CLASS_PRIEST, 46, 812, 1130),
    (@CLASS_PRIEST, 47, 853, 1154),
    (@CLASS_PRIEST, 48, 885, 1178),
    (@CLASS_PRIEST, 49, 918, 1202),
    (@CLASS_PRIEST, 50, 962, 1226),
    (@CLASS_PRIEST, 51, 997, 1250),
    (@CLASS_PRIEST, 52, 1043, 1274),
    (@CLASS_PRIEST, 53, 1080, 1298),
    (@CLASS_PRIEST, 54, 1118, 1322),
    (@CLASS_PRIEST, 55, 1167, 1331),
    (@CLASS_PRIEST, 56, 1207, 1355),
    (@CLASS_PRIEST, 57, 1248, 1379),
    (@CLASS_PRIEST, 58, 1290, 1403),
    (@CLASS_PRIEST, 59, 1343, 1412),
    (@CLASS_PRIEST, 60, 1387, 1436);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_SHAMAN, 1, 27, 53),
    (@CLASS_SHAMAN, 2, 34, 61),
    (@CLASS_SHAMAN, 3, 41, 68),
    (@CLASS_SHAMAN, 4, 48, 91),
    (@CLASS_SHAMAN, 5, 65, 100),
    (@CLASS_SHAMAN, 6, 72, 110),
    (@CLASS_SHAMAN, 7, 79, 121),
    (@CLASS_SHAMAN, 8, 86, 133),
    (@CLASS_SHAMAN, 9, 93, 161),
    (@CLASS_SHAMAN, 10, 100, 175),
    (@CLASS_SHAMAN, 11, 107, 190),
    (@CLASS_SHAMAN, 12, 114, 206),
    (@CLASS_SHAMAN, 13, 121, 223),
    (@CLASS_SHAMAN, 14, 128, 241),
    (@CLASS_SHAMAN, 15, 135, 260),
    (@CLASS_SHAMAN, 16, 142, 280),
    (@CLASS_SHAMAN, 17, 150, 301),
    (@CLASS_SHAMAN, 18, 159, 323),
    (@CLASS_SHAMAN, 19, 169, 346),
    (@CLASS_SHAMAN, 20, 180, 370),
    (@CLASS_SHAMAN, 21, 192, 395),
    (@CLASS_SHAMAN, 22, 205, 456),
    (@CLASS_SHAMAN, 23, 219, 448),
    (@CLASS_SHAMAN, 24, 234, 476),
    (@CLASS_SHAMAN, 25, 240, 505),
    (@CLASS_SHAMAN, 26, 257, 579),
    (@CLASS_SHAMAN, 27, 275, 566),
    (@CLASS_SHAMAN, 28, 294, 598),
    (@CLASS_SHAMAN, 29, 314, 631),
    (@CLASS_SHAMAN, 30, 335, 718),
    (@CLASS_SHAMAN, 31, 347, 699),
    (@CLASS_SHAMAN, 32, 370, 733),
    (@CLASS_SHAMAN, 33, 394, 767),
    (@CLASS_SHAMAN, 34, 419, 786),
    (@CLASS_SHAMAN, 35, 435, 820),
    (@CLASS_SHAMAN, 36, 462, 854),
    (@CLASS_SHAMAN, 37, 490, 888),
    (@CLASS_SHAMAN, 38, 509, 922),
    (@CLASS_SHAMAN, 39, 539, 941),
    (@CLASS_SHAMAN, 40, 570, 975),
    (@CLASS_SHAMAN, 41, 592, 1009),
    (@CLASS_SHAMAN, 42, 625, 1028),
    (@CLASS_SHAMAN, 43, 649, 1062),
    (@CLASS_SHAMAN, 44, 684, 1096),
    (@CLASS_SHAMAN, 45, 710, 1115),
    (@CLASS_SHAMAN, 46, 747, 1149),
    (@CLASS_SHAMAN, 47, 775, 1183),
    (@CLASS_SHAMAN, 48, 814, 1202),
    (@CLASS_SHAMAN, 49, 844, 1236),
    (@CLASS_SHAMAN, 50, 885, 1255),
    (@CLASS_SHAMAN, 51, 917, 1289),
    (@CLASS_SHAMAN, 52, 960, 1313),
    (@CLASS_SHAMAN, 53, 994, 1342),
    (@CLASS_SHAMAN, 54, 1029, 1376),
    (@CLASS_SHAMAN, 55, 1075, 1395),
    (@CLASS_SHAMAN, 56, 1112, 1414),
    (@CLASS_SHAMAN, 57, 1150, 1448),
    (@CLASS_SHAMAN, 58, 1199, 1467),
    (@CLASS_SHAMAN, 59, 1239, 1501),
    (@CLASS_SHAMAN, 60, 1280, 1520);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_MAGE, 1, 31, 100),
    (@CLASS_MAGE, 2, 37, 170),
    (@CLASS_MAGE, 3, 42, 181),
    (@CLASS_MAGE, 4, 57, 178),
    (@CLASS_MAGE, 5, 72, 191),
    (@CLASS_MAGE, 6, 87, 205),
    (@CLASS_MAGE, 7, 92, 220),
    (@CLASS_MAGE, 8, 107, 221),
    (@CLASS_MAGE, 9, 122, 238),
    (@CLASS_MAGE, 10, 127, 256),
    (@CLASS_MAGE, 11, 142, 275),
    (@CLASS_MAGE, 12, 157, 280),
    (@CLASS_MAGE, 13, 162, 301),
    (@CLASS_MAGE, 14, 177, 323),
    (@CLASS_MAGE, 15, 192, 331),
    (@CLASS_MAGE, 16, 197, 355),
    (@CLASS_MAGE, 17, 212, 365),
    (@CLASS_MAGE, 18, 227, 391),
    (@CLASS_MAGE, 19, 232, 403),
    (@CLASS_MAGE, 20, 247, 431),
    (@CLASS_MAGE, 21, 262, 445),
    (@CLASS_MAGE, 22, 267, 475),
    (@CLASS_MAGE, 23, 282, 491),
    (@CLASS_MAGE, 24, 288, 523),
    (@CLASS_MAGE, 25, 305, 541),
    (@CLASS_MAGE, 26, 323, 575),
    (@CLASS_MAGE, 27, 332, 595),
    (@CLASS_MAGE, 28, 352, 616),
    (@CLASS_MAGE, 29, 363, 652),
    (@CLASS_MAGE, 30, 385, 673),
    (@CLASS_MAGE, 31, 408, 694),
    (@CLASS_MAGE, 32, 422, 730),
    (@CLASS_MAGE, 33, 447, 751),
    (@CLASS_MAGE, 34, 463, 772),
    (@CLASS_MAGE, 35, 490, 793),
    (@CLASS_MAGE, 36, 508, 814),
    (@CLASS_MAGE, 37, 537, 850),
    (@CLASS_MAGE, 38, 567, 871),
    (@CLASS_MAGE, 39, 588, 892),
    (@CLASS_MAGE, 40, 620, 913),
    (@CLASS_MAGE, 41, 643, 934),
    (@CLASS_MAGE, 42, 677, 955),
    (@CLASS_MAGE, 43, 702, 976),
    (@CLASS_MAGE, 44, 738, 997),
    (@CLASS_MAGE, 45, 765, 1018),
    (@CLASS_MAGE, 46, 803, 1039),
    (@CLASS_MAGE, 47, 832, 1060),
    (@CLASS_MAGE, 48, 872, 1081),
    (@CLASS_MAGE, 49, 903, 1102),
    (@CLASS_MAGE, 50, 945, 1108),
    (@CLASS_MAGE, 51, 978, 1129),
    (@CLASS_MAGE, 52, 1022, 1150),
    (@CLASS_MAGE, 53, 1057, 1171),
    (@CLASS_MAGE, 54, 1093, 1177),
    (@CLASS_MAGE, 55, 1140, 1198),
    (@CLASS_MAGE, 56, 1178, 1219),
    (@CLASS_MAGE, 57, 1227, 1225),
    (@CLASS_MAGE, 58, 1267, 1246),
    (@CLASS_MAGE, 59, 1318, 1252),
    (@CLASS_MAGE, 60, 1360, 1273);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_WARLOCK, 1, 23, 59),
    (@CLASS_WARLOCK, 2, 28, 98),
    (@CLASS_WARLOCK, 3, 43, 107),
    (@CLASS_WARLOCK, 4, 48, 117),
    (@CLASS_WARLOCK, 5, 63, 128),
    (@CLASS_WARLOCK, 6, 68, 140),
    (@CLASS_WARLOCK, 7, 83, 153),
    (@CLASS_WARLOCK, 8, 88, 167),
    (@CLASS_WARLOCK, 9, 103, 182),
    (@CLASS_WARLOCK, 10, 108, 198),
    (@CLASS_WARLOCK, 11, 123, 200),
    (@CLASS_WARLOCK, 12, 128, 218),
    (@CLASS_WARLOCK, 13, 143, 237),
    (@CLASS_WARLOCK, 14, 148, 257),
    (@CLASS_WARLOCK, 15, 153, 278),
    (@CLASS_WARLOCK, 16, 168, 300),
    (@CLASS_WARLOCK, 17, 173, 308),
    (@CLASS_WARLOCK, 18, 189, 332),
    (@CLASS_WARLOCK, 19, 196, 357),
    (@CLASS_WARLOCK, 20, 204, 383),
    (@CLASS_WARLOCK, 21, 223, 395),
    (@CLASS_WARLOCK, 22, 233, 423),
    (@CLASS_WARLOCK, 23, 244, 452),
    (@CLASS_WARLOCK, 24, 266, 467),
    (@CLASS_WARLOCK, 25, 279, 498),
    (@CLASS_WARLOCK, 26, 293, 530),
    (@CLASS_WARLOCK, 27, 318, 548),
    (@CLASS_WARLOCK, 28, 334, 582),
    (@CLASS_WARLOCK, 29, 351, 602),
    (@CLASS_WARLOCK, 30, 379, 638),
    (@CLASS_WARLOCK, 31, 398, 674),
    (@CLASS_WARLOCK, 32, 418, 695),
    (@CLASS_WARLOCK, 33, 439, 731),
    (@CLASS_WARLOCK, 34, 471, 752),
    (@CLASS_WARLOCK, 35, 494, 788),
    (@CLASS_WARLOCK, 36, 518, 809),
    (@CLASS_WARLOCK, 37, 543, 830),
    (@CLASS_WARLOCK, 38, 569, 866),
    (@CLASS_WARLOCK, 39, 606, 887),
    (@CLASS_WARLOCK, 40, 634, 923),
    (@CLASS_WARLOCK, 41, 663, 944),
    (@CLASS_WARLOCK, 42, 693, 965),
    (@CLASS_WARLOCK, 43, 724, 1001),
    (@CLASS_WARLOCK, 44, 756, 1022),
    (@CLASS_WARLOCK, 45, 799, 1043),
    (@CLASS_WARLOCK, 46, 823, 1064),
    (@CLASS_WARLOCK, 47, 868, 1100),
    (@CLASS_WARLOCK, 48, 904, 1121),
    (@CLASS_WARLOCK, 49, 941, 1142),
    (@CLASS_WARLOCK, 50, 979, 1163),
    (@CLASS_WARLOCK, 51, 1018, 1184),
    (@CLASS_WARLOCK, 52, 1058, 1205),
    (@CLASS_WARLOCK, 53, 1089, 1226),
    (@CLASS_WARLOCK, 54, 1131, 1247),
    (@CLASS_WARLOCK, 55, 1184, 1268),
    (@CLASS_WARLOCK, 56, 1228, 1289),
    (@CLASS_WARLOCK, 57, 1273, 1310),
    (@CLASS_WARLOCK, 58, 1319, 1331),
    (@CLASS_WARLOCK, 59, 1366, 1352),
    (@CLASS_WARLOCK, 60, 1414, 1373);

INSERT INTO `player_classlevelstats` VALUES
    (@CLASS_DRUID, 1, 33, 17),
    (@CLASS_DRUID, 2, 41, 57),
    (@CLASS_DRUID, 3, 58, 65),
    (@CLASS_DRUID, 4, 65, 74),
    (@CLASS_DRUID, 5, 82, 84),
    (@CLASS_DRUID, 6, 89, 95),
    (@CLASS_DRUID, 7, 96, 107),
    (@CLASS_DRUID, 8, 113, 120),
    (@CLASS_DRUID, 9, 120, 134),
    (@CLASS_DRUID, 10, 137, 149),
    (@CLASS_DRUID, 11, 144, 165),
    (@CLASS_DRUID, 12, 151, 182),
    (@CLASS_DRUID, 13, 168, 200),
    (@CLASS_DRUID, 14, 175, 219),
    (@CLASS_DRUID, 15, 182, 239),
    (@CLASS_DRUID, 16, 199, 260),
    (@CLASS_DRUID, 17, 206, 282),
    (@CLASS_DRUID, 18, 214, 305),
    (@CLASS_DRUID, 19, 233, 329),
    (@CLASS_DRUID, 20, 243, 354),
    (@CLASS_DRUID, 21, 254, 380),
    (@CLASS_DRUID, 22, 266, 392),
    (@CLASS_DRUID, 23, 289, 420),
    (@CLASS_DRUID, 24, 303, 449),
    (@CLASS_DRUID, 25, 318, 479),
    (@CLASS_DRUID, 26, 334, 509),
    (@CLASS_DRUID, 27, 361, 524),
    (@CLASS_DRUID, 28, 379, 554),
    (@CLASS_DRUID, 29, 398, 584),
    (@CLASS_DRUID, 30, 418, 614),
    (@CLASS_DRUID, 31, 439, 629),
    (@CLASS_DRUID, 32, 461, 659),
    (@CLASS_DRUID, 33, 494, 689),
    (@CLASS_DRUID, 34, 518, 704),
    (@CLASS_DRUID, 35, 543, 734),
    (@CLASS_DRUID, 36, 569, 749),
    (@CLASS_DRUID, 37, 596, 779),
    (@CLASS_DRUID, 38, 624, 809),
    (@CLASS_DRUID, 39, 653, 824),
    (@CLASS_DRUID, 40, 683, 854),
    (@CLASS_DRUID, 41, 714, 869),
    (@CLASS_DRUID, 42, 746, 899),
    (@CLASS_DRUID, 43, 779, 914),
    (@CLASS_DRUID, 44, 823, 944),
    (@CLASS_DRUID, 45, 858, 959),
    (@CLASS_DRUID, 46, 894, 989),
    (@CLASS_DRUID, 47, 921, 1004),
    (@CLASS_DRUID, 48, 959, 1019),
    (@CLASS_DRUID, 49, 998, 1049),
    (@CLASS_DRUID, 50, 1038, 1064),
    (@CLASS_DRUID, 51, 1079, 1079),
    (@CLASS_DRUID, 52, 1121, 1109),
    (@CLASS_DRUID, 53, 1164, 1124),
    (@CLASS_DRUID, 54, 1208, 1139),
    (@CLASS_DRUID, 55, 1253, 1154),
    (@CLASS_DRUID, 56, 1299, 1169),
    (@CLASS_DRUID, 57, 1346, 1199),
    (@CLASS_DRUID, 58, 1384, 1214),
    (@CLASS_DRUID, 59, 1433, 1229),
    (@CLASS_DRUID, 60, 1483, 1244);
