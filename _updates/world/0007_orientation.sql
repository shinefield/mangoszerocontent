-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add signs to the world database
--
-- This update will populate the world database with data required to
-- highlight locations on posts and signs.
--
-- Global Unique Identifier ranges used:
--
-- - Signs, Azeroth: 501-2500

-- Provide variables for game objects ----------------------------------------
SET @GO_TYPE_GENERIC                            = 5;

-- Insert sign templates -----------------------------------------------------
INSERT INTO `gameobject_template`
    (`entry`, `type`,                `displayId`, `name`)
VALUES
     (    80,   @GO_TYPE_GENERIC,    22,          "Old Coast Road")
    ,(    81,   @GO_TYPE_GENERIC,    22,          "Sentinel Hill")
    ,(    82,   @GO_TYPE_GENERIC,    22,          "Elwynn Forest")
    ,(    83,   @GO_TYPE_GENERIC,    22,          "Jangolode Mine")
    ,(    84,   @GO_TYPE_GENERIC,    22,          "Old Coast Road")
    ,(    85,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(    86,   @GO_TYPE_GENERIC,    22,          "Elwynn Forest")
    ,(    87,   @GO_TYPE_GENERIC,    22,          "Moonbrook")
    ,(    88,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(    89,   @GO_TYPE_GENERIC,    26,          "Northshire Abbey")
    ,(    90,   @GO_TYPE_GENERIC,    26,          "Stormwind City")
    ,(    91,   @GO_TYPE_GENERIC,    26,          "Northshire Abbey")
    ,(    92,   @GO_TYPE_GENERIC,    26,          "Stormwind City")
    ,(    93,   @GO_TYPE_GENERIC,    26,          "Westbrook Garrison")
    ,(    94,   @GO_TYPE_GENERIC,    26,          "Westfall")
    ,(    95,   @GO_TYPE_GENERIC,    26,          "Eastvale Logging Camp")
    ,(    96,   @GO_TYPE_GENERIC,    26,          "Redridge")
    ,(    97,   @GO_TYPE_GENERIC,    26,          "Goldshire")
    ,(    98,   @GO_TYPE_GENERIC,    26,          "Stormwind City")
    ,(    99,   @GO_TYPE_GENERIC,    26,          "Redridge")
    ,(   100,   @GO_TYPE_GENERIC,    26,          "Eastvale Logging Camp")
    ,(   101,   @GO_TYPE_GENERIC,    27,          "Stranglethorn")
    ,(   102,   @GO_TYPE_GENERIC,    27,          "Raven Hill")
    ,(   103,   @GO_TYPE_GENERIC,    27,          "Deadwind Pass")
    ,(   104,   @GO_TYPE_GENERIC,    27,          "Redridge")
    ,(   105,   @GO_TYPE_GENERIC,    27,          "Stranglethorn")
    ,(   106,   @GO_TYPE_GENERIC,    27,          "Westfall")
    ,(   107,   @GO_TYPE_GENERIC,    27,          "Darkshire")
    ,(   108,   @GO_TYPE_GENERIC,    27,          "Raven Hill")
    ,(   109,   @GO_TYPE_GENERIC,    27,          "Westfall")
    ,(   110,   @GO_TYPE_GENERIC,    27,          "Stranglethorn")
    ,(   111,   @GO_TYPE_GENERIC,    27,          "Raven Hill")
    ,(   112,   @GO_TYPE_GENERIC,    27,          "Darkshire")
    ,(   113,   @GO_TYPE_GENERIC,    26,          "Duskwood")
    ,(   114,   @GO_TYPE_GENERIC,    26,          "Lakeshire")
    ,(   115,   @GO_TYPE_GENERIC,    26,          "Elwynn")
    ,(   116,   @GO_TYPE_GENERIC,    26,          "Stonewatch Keep")
    ,(   117,   @GO_TYPE_GENERIC,    26,          "Lakeshire")
    ,(   118,   @GO_TYPE_GENERIC,    26,          "Stonewatch Keep")
    ,(   121,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(   122,   @GO_TYPE_GENERIC,    22,          "Sentinel Hill")
    ,(   123,   @GO_TYPE_GENERIC,    22,          "Elwynn Forest")
    ,(   124,   @GO_TYPE_GENERIC,    22,          "Moonbrook")
    ,(   298,   @GO_TYPE_GENERIC,    26,          "Thelsamar")
    ,(   299,   @GO_TYPE_GENERIC,    26,          "Searing Gorge")
    ,(   301,   @GO_TYPE_GENERIC,    26,          "Wetlands")
    ,(   302,   @GO_TYPE_GENERIC,    26,          "Dun Morogh")
    ,(   303,   @GO_TYPE_GENERIC,    26,          "Dun Morogh")
    ,(   304,   @GO_TYPE_GENERIC,    26,          "Wetlands")
    ,(   305,   @GO_TYPE_GENERIC,    26,          "Thelsamar")
    ,(   306,   @GO_TYPE_GENERIC,    26,          "Thelsamar")
    ,(   307,   @GO_TYPE_GENERIC,    26,          "Searing Gorge")
    ,(   308,   @GO_TYPE_GENERIC,    26,          "Dun Morogh")
    ,(   309,   @GO_TYPE_GENERIC,    26,          "Anvilmar")
    ,(   310,   @GO_TYPE_GENERIC,    26,          "Ironforge")
    ,(   311,   @GO_TYPE_GENERIC,    26,          "Loch Modan")
    ,(   312,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(   313,   @GO_TYPE_GENERIC,    26,          "Anvilmar")
    ,(   314,   @GO_TYPE_GENERIC,    26,          "Ironforge")
    ,(   315,   @GO_TYPE_GENERIC,    26,          "Ironforge")
    ,(   316,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(   317,   @GO_TYPE_GENERIC,    26,          "Anvilmar")
    ,(   318,   @GO_TYPE_GENERIC,    26,          "Loch Modan")
    ,(   376,   @GO_TYPE_GENERIC,    22,          "Dun Modr")
    ,(   377,   @GO_TYPE_GENERIC,    22,          "Menethil")
    ,(   378,   @GO_TYPE_GENERIC,    22,          "Loch Modan")
    ,(   379,   @GO_TYPE_GENERIC,    22,          "Loch Modan")
    ,(   380,   @GO_TYPE_GENERIC,    22,          "Menethil")
    ,(   381,   @GO_TYPE_GENERIC,    22,          "Grim Batol")
    ,(   382,   @GO_TYPE_GENERIC,    22,          "Dun Modr")
    ,(   387,   @GO_TYPE_GENERIC,    22,          "Loch Modan")
    ,(   388,   @GO_TYPE_GENERIC,    22,          "Arathi Highlands")
    ,(   389,   @GO_TYPE_GENERIC,    22,          "Dun Modr")
    ,(  1162,   @GO_TYPE_GENERIC,    22,          "Menethil Harbor")
    ,(  1564,   @GO_TYPE_GENERIC,    26,          "Ironforge")
    ,(  1565,   @GO_TYPE_GENERIC,    26,          "Loch Modan")
    ,(  1566,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(  1567,   @GO_TYPE_GENERIC,    26,          "Loch Modan")
    ,(  1568,   @GO_TYPE_GENERIC,    26,          "Loch Modan")
    ,(  1569,   @GO_TYPE_GENERIC,    26,          "Ironforge")
    ,(  1570,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(  1572,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(  1573,   @GO_TYPE_GENERIC,    26,          "Kharanos")
    ,(  1595,   @GO_TYPE_GENERIC,    26,          "Westbrook Garrison")
    ,(  1596,   @GO_TYPE_GENERIC,    26,          "Westfall")
    ,(  1597,   @GO_TYPE_GENERIC,    26,          "Stormwind City")
    ,(  1598,   @GO_TYPE_GENERIC,    26,          "Goldshire")
    ,(  1630,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1631,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  1632,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1633,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1634,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  1638,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  1639,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  1643,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1644,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  1645,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  1646,   @GO_TYPE_GENERIC,    27,          "Silverpine")
    ,(  1647,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  1648,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  1649,   @GO_TYPE_GENERIC,    27,          "Monastery")
    ,(  1650,   @GO_TYPE_GENERIC,    27,          "Plaguelands")
    ,(  1651,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  1652,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1653,   @GO_TYPE_GENERIC,    27,          "Silverpine")
    ,(  1654,   @GO_TYPE_GENERIC,    27,          "Silverpine")
    ,(  1655,   @GO_TYPE_GENERIC,    27,          "Monastery")
    ,(  1656,   @GO_TYPE_GENERIC,    27,          "Plaguelands")
    ,(  1657,   @GO_TYPE_GENERIC,    27,          "Monastery")
    ,(  1658,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  1659,   @GO_TYPE_GENERIC,    27,          "Plaguelands")
    ,(  1660,   @GO_TYPE_GENERIC,    27,          "Silverpine")
    ,(  1661,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1662,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1663,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1664,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1665,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1666,   @GO_TYPE_GENERIC,    27,          "The Undercity")
    ,(  1668,   @GO_TYPE_GENERIC,    22,          "Dun Algaz")
    ,(  1669,   @GO_TYPE_GENERIC,    22,          "Dun Algaz")
    ,(  1674,   @GO_TYPE_GENERIC,    26,          "Gnomeregan")
    ,(  1675,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1676,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1677,   @GO_TYPE_GENERIC,    150,         "Tirisfal")
    ,(  1678,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  1679,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1680,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1681,   @GO_TYPE_GENERIC,    150,         "Tirisfal")
    ,(  1686,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1687,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1688,   @GO_TYPE_GENERIC,    150,         "Tirisfal")
    ,(  1689,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  1690,   @GO_TYPE_GENERIC,    150,         "Pyrewood")
    ,(  1691,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1692,   @GO_TYPE_GENERIC,    150,         "Deep Elem Mine")
    ,(  1693,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  1694,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1695,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1696,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1697,   @GO_TYPE_GENERIC,    150,         "Tirisfal")
    ,(  1698,   @GO_TYPE_GENERIC,    150,         "Gilneas")
    ,(  1699,   @GO_TYPE_GENERIC,    150,         "Hillsbrad Plains")
    ,(  1700,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1701,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1702,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1703,   @GO_TYPE_GENERIC,    150,         "Gilneas")
    ,(  1704,   @GO_TYPE_GENERIC,    150,         "Hillsbrad Plains")
    ,(  1705,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1706,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1707,   @GO_TYPE_GENERIC,    150,         "Gilneas")
    ,(  1708,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  1709,   @GO_TYPE_GENERIC,    150,         "The Sepulcher")
    ,(  1710,   @GO_TYPE_GENERIC,    150,         "Hillsbrad Foothills")
    ,(  1711,   @GO_TYPE_GENERIC,    150,         "Gilneas")
    ,(  1712,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  1713,   @GO_TYPE_GENERIC,    150,         "Hillsbrad Plains")
    ,(  1714,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  1715,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  1771,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  1772,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  1773,   @GO_TYPE_GENERIC,    195,         "Hillsbrad")
    ,(  1774,   @GO_TYPE_GENERIC,    195,         "Silverpine Forest")
    ,(  1775,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  1776,   @GO_TYPE_GENERIC,    195,         "Durnholde Keep")
    ,(  1777,   @GO_TYPE_GENERIC,    195,         "Silverpine Forest")
    ,(  1778,   @GO_TYPE_GENERIC,    195,         "Hillsbrad")
    ,(  1779,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  1780,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  1781,   @GO_TYPE_GENERIC,    195,         "Alterac Mountains")
    ,(  1782,   @GO_TYPE_GENERIC,    195,         "Hillsbrad")
    ,(  1783,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  1784,   @GO_TYPE_GENERIC,    195,         "Dun Garok")
    ,(  1785,   @GO_TYPE_GENERIC,    195,         "Durnholde Keep")
    ,(  1786,   @GO_TYPE_GENERIC,    195,         "Dun Garok")
    ,(  1787,   @GO_TYPE_GENERIC,    195,         "Arathi Highlands")
    ,(  1788,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  1789,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  1790,   @GO_TYPE_GENERIC,    195,         "Durnholde Keep")
    ,(  1791,   @GO_TYPE_GENERIC,    195,         "Arathi Highlands")
    ,(  1792,   @GO_TYPE_GENERIC,    195,         "Durnholde Keep")
    ,(  1793,   @GO_TYPE_GENERIC,    195,         "Dun Garok")
    ,(  1794,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  1795,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  2016,   @GO_TYPE_GENERIC,    195,         "Tarren Mill")
    ,(  2017,   @GO_TYPE_GENERIC,    195,         "Alterac Mountains")
    ,(  2018,   @GO_TYPE_GENERIC,    195,         "Alterac City")
    ,(  2019,   @GO_TYPE_GENERIC,    195,         "Strahnbrad")
    ,(  2020,   @GO_TYPE_GENERIC,    195,         "Durnholde Keep")
    ,(  2021,   @GO_TYPE_GENERIC,    195,         "Hillsbrad")
    ,(  2022,   @GO_TYPE_GENERIC,    195,         "Southshore")
    ,(  2023,   @GO_TYPE_GENERIC,    203,         "Strahnbrad")
    ,(  2024,   @GO_TYPE_GENERIC,    203,         "Andorhal")
    ,(  2025,   @GO_TYPE_GENERIC,    203,         "Alterac City")
    ,(  2026,   @GO_TYPE_GENERIC,    203,         "Hillsbrad Foothills")
    ,(  2027,   @GO_TYPE_GENERIC,    203,         "Andorhal")
    ,(  2028,   @GO_TYPE_GENERIC,    203,         "Strahnbrad")
    ,(  2029,   @GO_TYPE_GENERIC,    203,         "Alterac City")
    ,(  2030,   @GO_TYPE_GENERIC,    203,         "Alterac City")
    ,(  2031,   @GO_TYPE_GENERIC,    203,         "Andorhal")
    ,(  2032,   @GO_TYPE_GENERIC,    22,          "Warning!!!! Plaguelands")
    ,(  2033,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  2034,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  2035,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  2036,   @GO_TYPE_GENERIC,    27,          "Agamand Mills")
    ,(  2037,   @GO_TYPE_GENERIC,    27,          "Deathknell")
    ,(  2038,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(  2048,   @GO_TYPE_GENERIC,    150,         "Hillsbrad Foothills")
    ,(  2049,   @GO_TYPE_GENERIC,    150,         "Gilneas")
    ,(  2050,   @GO_TYPE_GENERIC,    150,         "Pyrewood Village")
    ,(  2051,   @GO_TYPE_GENERIC,    150,         "Shadowfang Keep")
    ,(  2052,   @GO_TYPE_GENERIC,    150,         "Ambermill")
    ,(  2096,   @GO_TYPE_GENERIC,    27,          "Trade District")
    ,(  2098,   @GO_TYPE_GENERIC,    27,          "Cathedral Square")
    ,(  2099,   @GO_TYPE_GENERIC,    27,          "Cathedral Square")
    ,(  2100,   @GO_TYPE_GENERIC,    27,          "Old Town")
    ,(  2101,   @GO_TYPE_GENERIC,    27,          "Mage Quarter")
    ,(  2102,   @GO_TYPE_GENERIC,    27,          "Cathedral Square")
    ,(  2105,   @GO_TYPE_GENERIC,    27,          "Cathedral Square")
    ,(  2106,   @GO_TYPE_GENERIC,    27,          "Cathedral Square")
    ,(  2108,   @GO_TYPE_GENERIC,    27,          "Trade District")
    ,(  2109,   @GO_TYPE_GENERIC,    169,         "Fragrant Flowers")
    ,(  2110,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2111,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2112,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2113,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2115,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2116,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2117,   @GO_TYPE_GENERIC,    26,          "Stormwind Keep")
    ,(  2119,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2120,   @GO_TYPE_GENERIC,    26,          "Stormwind Keep")
    ,(  2122,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2123,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2124,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2125,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2127,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2128,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2129,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2130,   @GO_TYPE_GENERIC,    170,         "The Wine Cask")
    ,(  2131,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2133,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2134,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2136,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2138,   @GO_TYPE_GENERIC,    172,         "The Empty Quiver")
    ,(  2139,   @GO_TYPE_GENERIC,    173,         "Weller's Arsenal")
    ,(  2140,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2141,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2142,   @GO_TYPE_GENERIC,    26,          "Goldshire")
    ,(  2143,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2145,   @GO_TYPE_GENERIC,    175,         "Stormwind Counting House")
    ,(  2146,   @GO_TYPE_GENERIC,    176,         "Everyday Merchandise")
    ,(  2148,   @GO_TYPE_GENERIC,    178,         "The Cheese Cutters")
    ,(  2149,   @GO_TYPE_GENERIC,    174,         "The Seven Deadly Venoms")
    ,(  2150,   @GO_TYPE_GENERIC,    171,         "The Silver Shield")
    ,(  2151,   @GO_TYPE_GENERIC,    179,         "Thane's Boots and Shoulderpads")
    ,(  2152,   @GO_TYPE_GENERIC,    180,         "Pig and Whistle Tavern")
    ,(  2153,   @GO_TYPE_GENERIC,    173,         "Heavy Handed Weapons")
    ,(  2154,   @GO_TYPE_GENERIC,    171,         "The Protective Hide")
    ,(  2155,   @GO_TYPE_GENERIC,    173,         "Honest Blades")
    ,(  2156,   @GO_TYPE_GENERIC,    171,         "Limited Immunity")
    ,(  2157,   @GO_TYPE_GENERIC,    173,         "Just Maces")
    ,(  2158,   @GO_TYPE_GENERIC,    171,         "Righteous Plates")
    ,(  2159,   @GO_TYPE_GENERIC,    177,         "City Hall")
    ,(  2160,   @GO_TYPE_GENERIC,    177,         "The Argent Dawn")
    ,(  2161,   @GO_TYPE_GENERIC,    179,         "Duncan's Textiles")
    ,(  2162,   @GO_TYPE_GENERIC,    173,         "Stormwind Staves")
    ,(  2163,   @GO_TYPE_GENERIC,    174,         "Essential Components")
    ,(  2164,   @GO_TYPE_GENERIC,    180,         "The Slaughtered Lamb")
    ,(  2165,   @GO_TYPE_GENERIC,    174,         "Pyrotechnics")
    ,(  2166,   @GO_TYPE_GENERIC,    174,         "Alchemy Needs")
    ,(  2167,   @GO_TYPE_GENERIC,    176,         "Ancient Curios")
    ,(  2169,   @GO_TYPE_GENERIC,    180,         "The Blue Recluse")
    ,(  2171,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2173,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2175,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2176,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2177,   @GO_TYPE_GENERIC,    179,         "The Finest Thread")
    ,(  2178,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2179,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2181,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(  2182,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2186,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2187,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2188,   @GO_TYPE_GENERIC,    26,          "Mage Quarters")
    ,(  2189,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(  2190,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(  2191,   @GO_TYPE_GENERIC,    26,          "Trade District")
    ,(  2670,   @GO_TYPE_GENERIC,    195,         "Wetlands")
    ,(  2672,   @GO_TYPE_GENERIC,    195,         "Stromgarde")
    ,(  2673,   @GO_TYPE_GENERIC,    195,         "Thandol Span")
    ,(  2674,   @GO_TYPE_GENERIC,    195,         "Wetlands")
    ,(  2675,   @GO_TYPE_GENERIC,    195,         "Stromgarde")
    ,(  2676,   @GO_TYPE_GENERIC,    195,         "Thandol Span")
    ,(  2677,   @GO_TYPE_GENERIC,    195,         "Wetlands")
    ,(  2678,   @GO_TYPE_GENERIC,    195,         "Hillsbrad Plains")
    ,(  2679,   @GO_TYPE_GENERIC,    195,         "Stromgarde")
    ,(  2680,   @GO_TYPE_GENERIC,    195,         "Hammerfall")
    ,(  2681,   @GO_TYPE_GENERIC,    195,         "Hammerfall")
    ,(  2682,   @GO_TYPE_GENERIC,    195,         "Stromgarde")
    ,(  2683,   @GO_TYPE_GENERIC,    195,         "Hammerfall")
    ,(  2684,   @GO_TYPE_GENERIC,    195,         "Stromgarde")
    ,(  2685,   @GO_TYPE_GENERIC,    22,          "Refuge Pointe")
    ,(  2968,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  2969,   @GO_TYPE_GENERIC,    308,         "Thunder Bluff")
    ,(  2970,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  2971,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,(  2972,   @GO_TYPE_GENERIC,    308,         "Camp Narache")
    ,(  2973,   @GO_TYPE_GENERIC,    308,         "Camp Narache")
    ,(  2974,   @GO_TYPE_GENERIC,    308,         "Thunder Bluff")
    ,(  2975,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  2976,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,(  2977,   @GO_TYPE_GENERIC,    308,         "Camp Narache")
    ,(  2978,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  3194,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  3195,   @GO_TYPE_GENERIC,    308,         "Thunder Bluff")
    ,(  3196,   @GO_TYPE_GENERIC,    308,         "Thunder Bluff")
    ,(  3197,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  3198,   @GO_TYPE_GENERIC,    308,         "Bloodhoof Village")
    ,(  3199,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,(  3202,   @GO_TYPE_GENERIC,    309,         "Grom'gol")
    ,(  3203,   @GO_TYPE_GENERIC,    309,         "Arena")
    ,(  3204,   @GO_TYPE_GENERIC,    309,         "Booty Bay")
    ,(  3205,   @GO_TYPE_GENERIC,    22,          "Arena")
    ,(  3206,   @GO_TYPE_GENERIC,    22,          "Booty Bay")
    ,(  3207,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(  3208,   @GO_TYPE_GENERIC,    309,         "Booty Bay")
    ,(  3209,   @GO_TYPE_GENERIC,    309,         "Grom'Gol")
    ,(  3210,   @GO_TYPE_GENERIC,    309,         "Arena")
    ,(  3211,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(  3212,   @GO_TYPE_GENERIC,    22,          "Booty Bay")
    ,(  3213,   @GO_TYPE_GENERIC,    22,          "Arena")
    ,(  3214,   @GO_TYPE_GENERIC,    309,         "Arena")
    ,(  3215,   @GO_TYPE_GENERIC,    309,         "Grom'Gol")
    ,(  3216,   @GO_TYPE_GENERIC,    22,          "Arena")
    ,(  3217,   @GO_TYPE_GENERIC,    22,          "Duskwood")
    ,(  3224,   @GO_TYPE_GENERIC,    309,         "Razor Hill")
    ,(  3225,   @GO_TYPE_GENERIC,    309,         "Razor Hill")
    ,(  3226,   @GO_TYPE_GENERIC,    309,         "Orgrimmar")
    ,(  3227,   @GO_TYPE_GENERIC,    309,         "The Den")
    ,(  3228,   @GO_TYPE_GENERIC,    309,         "The Barrens")
    ,(  3229,   @GO_TYPE_GENERIC,    309,         "The Den")
    ,(  3230,   @GO_TYPE_GENERIC,    309,         "Razor Hill")
    ,(  3231,   @GO_TYPE_GENERIC,    309,         "Razor Hill")
    ,(  3232,   @GO_TYPE_GENERIC,    309,         "Razor Hill")
    ,(  3233,   @GO_TYPE_GENERIC,    309,         "The Den")
    ,(  3234,   @GO_TYPE_GENERIC,    309,         "Orgrimmar")
    ,(  3235,   @GO_TYPE_GENERIC,    309,         "Orgrimmar")
    ,(  3276,   @GO_TYPE_GENERIC,    309,         "Sen'jin Village")
    ,(  3314,   @GO_TYPE_GENERIC,    309,         "The Barrens")
    ,(  4097,   @GO_TYPE_GENERIC,    308,         "Ratchet")
    ,(  4098,   @GO_TYPE_GENERIC,    308,         "Durotar")
    ,(  4099,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,(  4100,   @GO_TYPE_GENERIC,    308,         "Stonetalon Mountains")
    ,(  4101,   @GO_TYPE_GENERIC,    308,         "Crossroads")
    ,(  4102,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,(  4103,   @GO_TYPE_GENERIC,    308,         "Stonetalon Mountains")
    ,(  4104,   @GO_TYPE_GENERIC,    308,         "Ashenvale")
    ,(  4105,   @GO_TYPE_GENERIC,    308,         "Dustwallow Marsh")
    ,(  4106,   @GO_TYPE_GENERIC,    308,         "Thousand Needles")
    ,(  4115,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,(  4116,   @GO_TYPE_GENERIC,    308,         "Dustwallow Marsh")
    ,(  4117,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,(  4118,   @GO_TYPE_GENERIC,    308,         "Thousand Needles")
    ,(  4119,   @GO_TYPE_GENERIC,    308,         "Durotar")
    ,(  4120,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,(  4121,   @GO_TYPE_GENERIC,    308,         "Dustwallow Marsh")
    ,(  4122,   @GO_TYPE_GENERIC,    308,         "Thousand Needles")
    ,(  4123,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,(  4132,   @GO_TYPE_GENERIC,    308,         "Ashenvale")
    ,(  4133,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,(  4134,   @GO_TYPE_GENERIC,    308,         "Durotar")
    ,(  4135,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,(  4136,   @GO_TYPE_GENERIC,    308,         "Durotar")
    ,(  4137,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,(  4138,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,( 10082,   @GO_TYPE_GENERIC,    26,          "Stormwind")
    ,( 10083,   @GO_TYPE_GENERIC,    26,          "Goldshire")
    ,( 12351,   @GO_TYPE_GENERIC,    386,         "Dolanaar")
    ,( 12352,   @GO_TYPE_GENERIC,    386,         "Starbreeze Village")
    ,( 12353,   @GO_TYPE_GENERIC,    386,         "Shadowglen")
    ,( 12354,   @GO_TYPE_GENERIC,    386,         "Aldrassil")
    ,( 12355,   @GO_TYPE_GENERIC,    386,         "Starbreeze Village")
    ,( 12356,   @GO_TYPE_GENERIC,    386,         "Dolanaar")
    ,( 12357,   @GO_TYPE_GENERIC,    386,         "Darnassus")
    ,( 12358,   @GO_TYPE_GENERIC,    386,         "Starbreeze Village")
    ,( 12359,   @GO_TYPE_GENERIC,    386,         "Shadowglen")
    ,( 12360,   @GO_TYPE_GENERIC,    386,         "The Oracle Glade")
    ,( 12361,   @GO_TYPE_GENERIC,    386,         "Dolanaar")
    ,( 12362,   @GO_TYPE_GENERIC,    386,         "Aldrassil")
    ,( 12363,   @GO_TYPE_GENERIC,    386,         "Darnassus")
    ,( 12364,   @GO_TYPE_GENERIC,    386,         "Dolanaar")
    ,( 12365,   @GO_TYPE_GENERIC,    386,         "The Oracle Glade")
    ,( 12366,   @GO_TYPE_GENERIC,    386,         "Darnassus")
    ,( 12893,   @GO_TYPE_GENERIC,    388,         "Grove of the Ancients")
    ,( 12894,   @GO_TYPE_GENERIC,    388,         "Ameth'Aran")
    ,( 12895,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,( 12896,   @GO_TYPE_GENERIC,    388,         "Auberdine")
    ,( 12897,   @GO_TYPE_GENERIC,    388,         "Ameth'Aran")
    ,( 12898,   @GO_TYPE_GENERIC,    388,         "Grove of the Ancients")
    ,( 12899,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,( 12900,   @GO_TYPE_GENERIC,    388,         "Bashal'Aran")
    ,( 12901,   @GO_TYPE_GENERIC,    388,         "Auberdine")
    ,( 12902,   @GO_TYPE_GENERIC,    388,         "Bashal'Aran")
    ,( 12903,   @GO_TYPE_GENERIC,    388,         "Mathystra")
    ,( 12904,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,( 12907,   @GO_TYPE_GENERIC,    388,         "Mathystra")
    ,( 12908,   @GO_TYPE_GENERIC,    388,         "Auberdine")
    ,( 12909,   @GO_TYPE_GENERIC,    388,         "Bashal'Aran")
    ,( 13348,   @GO_TYPE_GENERIC,    386,         "Darkshore")
    ,( 13349,   @GO_TYPE_GENERIC,    386,         "Astranaar")
    ,( 13350,   @GO_TYPE_GENERIC,    386,         "Astranaar")
    ,( 13351,   @GO_TYPE_GENERIC,    386,         "Darkshore")
    ,( 13352,   @GO_TYPE_GENERIC,    386,         "The Shrine of Aessina")
    ,( 13353,   @GO_TYPE_GENERIC,    386,         "The Shrine of Aessina")
    ,( 13354,   @GO_TYPE_GENERIC,    386,         "The Shrine of Aessina")
    ,( 13355,   @GO_TYPE_GENERIC,    386,         "Darkshore")
    ,( 13356,   @GO_TYPE_GENERIC,    386,         "The Barrens")
    ,( 13357,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,( 13358,   @GO_TYPE_GENERIC,    386,         "Azshara")
    ,( 13405,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,( 13406,   @GO_TYPE_GENERIC,    386,         "Astranaar")
    ,( 13407,   @GO_TYPE_GENERIC,    386,         "The Barrens")
    ,( 13408,   @GO_TYPE_GENERIC,    386,         "Azshara")
    ,( 13409,   @GO_TYPE_GENERIC,    386,         "Azshara")
    ,( 13410,   @GO_TYPE_GENERIC,    386,         "The Barrens")
    ,( 13411,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,( 13412,   @GO_TYPE_GENERIC,    386,         "Astranaar")
    ,( 16396,   @GO_TYPE_GENERIC,    22,          "Moonbrook")
    ,( 18033,   @GO_TYPE_GENERIC,    308,         "Mulgore")
    ,( 18034,   @GO_TYPE_GENERIC,    308,         "The Crossroads")
    ,( 19028,   @GO_TYPE_GENERIC,    22,          "Scarlet Watch Post")
    ,( 19033,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,( 19545,   @GO_TYPE_GENERIC,    386,         "The Oracle Glade")
    ,( 19546,   @GO_TYPE_GENERIC,    386,         "Dolanaar")
    ,( 19553,   @GO_TYPE_GENERIC,    22,          "Greatwood Vale")
    ,( 19554,   @GO_TYPE_GENERIC,    22,          "Stonetalon Peak")
    ,( 19555,   @GO_TYPE_GENERIC,    22,          "Windshear Crag")
    ,( 19556,   @GO_TYPE_GENERIC,    22,          "The Charred Vale")
    ,( 19557,   @GO_TYPE_GENERIC,    22,          "Welcome")
    ,( 19558,   @GO_TYPE_GENERIC,    22,          "Windshear Crag")
    ,( 19559,   @GO_TYPE_GENERIC,    22,          "Sun Rock Retreat")
    ,( 19560,   @GO_TYPE_GENERIC,    22,          "Stonetalon Peak")
    ,( 19561,   @GO_TYPE_GENERIC,    22,          "Greatwood Vale")
    ,( 19562,   @GO_TYPE_GENERIC,    22,          "The Barrens")
    ,( 19563,   @GO_TYPE_GENERIC,    22,          "Windshear Crag")
    ,( 19564,   @GO_TYPE_GENERIC,    22,          "Greatwood Vale")
    ,( 19565,   @GO_TYPE_GENERIC,    22,          "Sun Rock Retreat")
    ,( 19566,   @GO_TYPE_GENERIC,    22,          "Desolace")
    ,( 19567,   @GO_TYPE_GENERIC,    22,          "Stonetalon Peak")
    ,( 19568,   @GO_TYPE_GENERIC,    22,          "The Barrens")
    ,( 19569,   @GO_TYPE_GENERIC,    22,          "End of Venture Co. Lands")
    ,( 19570,   @GO_TYPE_GENERIC,    22,          "DANGER!")
    ,( 19571,   @GO_TYPE_GENERIC,    22,          "KEEP OUT!")
    ,( 19572,   @GO_TYPE_GENERIC,    388,         "Desolace")
    ,( 19573,   @GO_TYPE_GENERIC,    388,         "Stonetalon Peak")
    ,( 19574,   @GO_TYPE_GENERIC,    388,         "Windshear Crag")
    ,( 19575,   @GO_TYPE_GENERIC,    388,         "Greatwood Vale")
    ,( 19576,   @GO_TYPE_GENERIC,    388,         "The Barrens")
    ,( 19577,   @GO_TYPE_GENERIC,    22,          "The Charred Vale")
    ,( 19578,   @GO_TYPE_GENERIC,    388,         "Windshear Crag")
    ,( 19579,   @GO_TYPE_GENERIC,    388,         "Desolace")
    ,( 19580,   @GO_TYPE_GENERIC,    388,         "Greatwood Vale")
    ,( 19581,   @GO_TYPE_GENERIC,    388,         "Stonetalon Peak")
    ,( 19582,   @GO_TYPE_GENERIC,    309,         "Goblin Shredder Suit")
    ,( 19583,   @GO_TYPE_GENERIC,    309,         "Sun Rock Retreat")
    ,( 19585,   @GO_TYPE_GENERIC,    22,          "Venture Co. Stonetalon Mtns. Project")
    ,( 19839,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,( 19840,   @GO_TYPE_GENERIC,    308,         "Freewind Post")
    ,( 19841,   @GO_TYPE_GENERIC,    308,         "The Shimmering Flats")
    ,( 19842,   @GO_TYPE_GENERIC,    308,         "Feralas")
    ,( 19843,   @GO_TYPE_GENERIC,    308,         "Freewind Post")
    ,( 19844,   @GO_TYPE_GENERIC,    308,         "The Great Lift")
    ,( 19845,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,( 19846,   @GO_TYPE_GENERIC,    308,         "The Shimmering Flats")
    ,( 19847,   @GO_TYPE_GENERIC,    388,         "Thalanaar")
    ,( 19848,   @GO_TYPE_GENERIC,    308,         "Freewind Post")
    ,( 19849,   @GO_TYPE_GENERIC,    308,         "The Shimmering Flats")
    ,( 19850,   @GO_TYPE_GENERIC,    308,         "Tanaris")
    ,( 19851,   @GO_TYPE_GENERIC,    308,         "The Great Lift")
    ,( 19852,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,( 19853,   @GO_TYPE_GENERIC,    308,         "Freewind Post")
    ,( 19854,   @GO_TYPE_GENERIC,    308,         "The Barrens")
    ,( 19855,   @GO_TYPE_GENERIC,    308,         "Tanaris")
    ,( 19856,   @GO_TYPE_GENERIC,    388,         "The Barrens")
    ,( 19857,   @GO_TYPE_GENERIC,    388,         "The Shimmering Flats")
    ,( 19858,   @GO_TYPE_GENERIC,    388,         "Thalanaar")
    ,( 19859,   @GO_TYPE_GENERIC,    388,         "Feralas")
    ,( 19863,   @GO_TYPE_GENERIC,    386,         "Maestra's Post")
    ,( 21053,   @GO_TYPE_GENERIC,    150,         "Sentry Point")
    ,( 21054,   @GO_TYPE_GENERIC,    150,         "North Point Tower")
    ,( 21055,   @GO_TYPE_GENERIC,    150,         "The Barrens")
    ,( 21056,   @GO_TYPE_GENERIC,    150,         "Theramore Isle")
    ,( 21057,   @GO_TYPE_GENERIC,    26,          "Foothold Citadel")
    ,( 21058,   @GO_TYPE_GENERIC,    26,          "The Docks")
    ,( 21059,   @GO_TYPE_GENERIC,    26,          "Dustwallow Marsh")
    ,( 21060,   @GO_TYPE_GENERIC,    26,          "The Docks")
    ,( 21061,   @GO_TYPE_GENERIC,    26,          "Foothold Citadel")
    ,( 21062,   @GO_TYPE_GENERIC,    26,          "Dustwallow Marsh")
    ,( 21063,   @GO_TYPE_GENERIC,    26,          "Foothold Citadel")
    ,( 21064,   @GO_TYPE_GENERIC,    26,          "Dustwallow Marsh")
    ,( 21065,   @GO_TYPE_GENERIC,    26,          "The Docks")
    ,( 21066,   @GO_TYPE_GENERIC,    26,          "The Docks")
    ,( 21067,   @GO_TYPE_GENERIC,    26,          "Foothold Citadel")
    ,( 21068,   @GO_TYPE_GENERIC,    26,          "Dustwallow Marsh")
    ,( 21069,   @GO_TYPE_GENERIC,    150,         "Theramore Isle")
    ,( 21070,   @GO_TYPE_GENERIC,    150,         "Sentry Point")
    ,( 21071,   @GO_TYPE_GENERIC,    150,         "North Point Tower")
    ,( 21072,   @GO_TYPE_GENERIC,    150,         "The Barrens")
    ,( 21073,   @GO_TYPE_GENERIC,    150,         "Sentry Point")
    ,( 21074,   @GO_TYPE_GENERIC,    150,         "Theramore Isle")
    ,( 21075,   @GO_TYPE_GENERIC,    150,         "North Point Tower")
    ,( 21076,   @GO_TYPE_GENERIC,    150,         "The Barrens")
    ,( 21077,   @GO_TYPE_GENERIC,    150,         "Shady Rest Inn")
    ,( 21078,   @GO_TYPE_GENERIC,    150,         "North Point Tower")
    ,( 21079,   @GO_TYPE_GENERIC,    150,         "Theramore Isle")
    ,( 21080,   @GO_TYPE_GENERIC,    150,         "Shady Rest Inn")
    ,( 21081,   @GO_TYPE_GENERIC,    150,         "The Barrens")
    ,( 21082,   @GO_TYPE_GENERIC,    309,         "Brackenwall Village")
    ,( 21083,   @GO_TYPE_GENERIC,    309,         "The Barrens")
    ,( 21084,   @GO_TYPE_GENERIC,    309,         "Stonemaul")
    ,( 21085,   @GO_TYPE_GENERIC,    309,         "The Barrens")
    ,( 21086,   @GO_TYPE_GENERIC,    309,         "Brackenwall Village")
    ,( 21087,   @GO_TYPE_GENERIC,    309,         "Stonemaul")
    ,( 21088,   @GO_TYPE_GENERIC,    309,         "BEWARE!")
    ,( 21089,   @GO_TYPE_GENERIC,    309,         "You are entering the Dragonmurk")
    ,( 21509,   @GO_TYPE_GENERIC,    538,         "The Shady Rest Inn")
    ,( 23295,   @GO_TYPE_GENERIC,    179,         "Canal Tailor and Fit Shop")
    ,( 23296,   @GO_TYPE_GENERIC,    179,         "Larson Clothiers")
    ,( 23299,   @GO_TYPE_GENERIC,    27,          "The Park")
    ,( 23300,   @GO_TYPE_GENERIC,    27,          "The Park")
    ,( 23301,   @GO_TYPE_GENERIC,    27,          "The Park")
    ,( 24715,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 24717,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 24718,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 24719,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 24720,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 24721,   @GO_TYPE_GENERIC,    26,          "The Park")
    ,( 25328,   @GO_TYPE_GENERIC,    174,         "Pestle's Apothecary")
    ,( 25334,   @GO_TYPE_GENERIC,    630,         "Industrial District")
    ,( 25336,   @GO_TYPE_GENERIC,    631,         "Old Town")
    ,( 25337,   @GO_TYPE_GENERIC,    631,         "Old Town")
    ,( 25338,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 25339,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 25340,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 25341,   @GO_TYPE_GENERIC,    633,         "The Park")
    ,( 25342,   @GO_TYPE_GENERIC,    633,         "The Park")
    ,( 25346,   @GO_TYPE_GENERIC,    631,         "Old Town")
    ,( 25347,   @GO_TYPE_GENERIC,    631,         "Old Town")
    ,( 25348,   @GO_TYPE_GENERIC,    634,         "Mage Quarter")
    ,( 25349,   @GO_TYPE_GENERIC,    634,         "Mage Quarter")
    ,( 25350,   @GO_TYPE_GENERIC,    634,         "Mage Quarter")
    ,( 25351,   @GO_TYPE_GENERIC,    634,         "Mage Quarter")
    ,( 25352,   @GO_TYPE_GENERIC,    633,         "The Park")
    ,( 25353,   @GO_TYPE_GENERIC,    633,         "The Park")
    ,( 25354,   @GO_TYPE_GENERIC,    633,         "The Park")
    ,( 25355,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 25356,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 25357,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 26480,   @GO_TYPE_GENERIC,    635,         "Craghelm's Plate and Chain")
    ,( 26482,   @GO_TYPE_GENERIC,    636,         "Goldfury's Hunting Supplies")
    ,( 26483,   @GO_TYPE_GENERIC,    637,         "Fizzlespinner's General Goods")
    ,( 26485,   @GO_TYPE_GENERIC,    636,         "Thundershot Guns 'n Ammo")
    ,( 26486,   @GO_TYPE_GENERIC,    639,         "The Stonefire Tavern")
    ,( 26487,   @GO_TYPE_GENERIC,    640,         "Barim's Reagents")
    ,( 26488,   @GO_TYPE_GENERIC,    638,         "Timberline Arms")
    ,( 26489,   @GO_TYPE_GENERIC,    639,         "Bruuk's Corner")
    ,( 26490,   @GO_TYPE_GENERIC,    641,         "Ironforge Visitor's Center")
    ,( 26491,   @GO_TYPE_GENERIC,    637,         "Pithwick's Bags and Supplies")
    ,( 26492,   @GO_TYPE_GENERIC,    641,         "Farmountain Maps")
    ,( 26493,   @GO_TYPE_GENERIC,    642,         "Stonebranch Herbalist")
    ,( 26497,   @GO_TYPE_GENERIC,    641,         "Deep Mountain Mining Guild")
    ,( 26498,   @GO_TYPE_GENERIC,    643,         "The Bronze Kettle")
    ,( 28027,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28028,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28029,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28030,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28031,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28032,   @GO_TYPE_GENERIC,    26,          "Dwarven District")
    ,( 28033,   @GO_TYPE_GENERIC,    27,          "Dwarven District")
    ,( 28034,   @GO_TYPE_GENERIC,    27,          "Dwarven District")
    ,( 28035,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28036,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28037,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28038,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28039,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28040,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28041,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28042,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28043,   @GO_TYPE_GENERIC,    26,          "Stormwind Gate")
    ,( 28044,   @GO_TYPE_GENERIC,    630,         "Dwarven District")
    ,( 28045,   @GO_TYPE_GENERIC,    630,         "Dwarven District")
    ,( 28046,   @GO_TYPE_GENERIC,    630,         "Dwarven District")
    ,( 28047,   @GO_TYPE_GENERIC,    630,         "Dwarven District")
    ,( 32348,   @GO_TYPE_GENERIC,    635,         "Flinthammer's Armorer and Clothier")
    ,( 32350,   @GO_TYPE_GENERIC,    656,         "Finespindle's Leather Goods")
    ,( 32351,   @GO_TYPE_GENERIC,    656,         "Stonebrow's Clothier")
    ,( 32352,   @GO_TYPE_GENERIC,    657,         "Traveling Fisherman")
    ,( 32353,   @GO_TYPE_GENERIC,    658,         "Springspindle's Gadgets")
    ,( 32354,   @GO_TYPE_GENERIC,    659,         "Things That Go Boom!")
    ,( 32355,   @GO_TYPE_GENERIC,    660,         "Ironforge Main Gate")
    ,( 32356,   @GO_TYPE_GENERIC,    660,         "Hall of Explorers")
    ,( 32357,   @GO_TYPE_GENERIC,    660,         "The Commerce Ward")
    ,( 32359,   @GO_TYPE_GENERIC,    660,         "The Military Ward")
    ,( 32362,   @GO_TYPE_GENERIC,    660,         "The Mystic Ward")
    ,( 32364,   @GO_TYPE_GENERIC,    660,         "Market Walk")
    ,( 32372,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,( 32377,   @GO_TYPE_GENERIC,    660,         "Vault of Ironforge")
    ,( 32381,   @GO_TYPE_GENERIC,    660,         "The Forlorn Caverns")
    ,( 32383,   @GO_TYPE_GENERIC,    660,         "The Forlorn Cavern")
    ,( 32385,   @GO_TYPE_GENERIC,    660,         "The Military Ward")
    ,( 32386,   @GO_TYPE_GENERIC,    660,         "Hall of Mysteries")
    ,( 32390,   @GO_TYPE_GENERIC,    660,         "Hall of Arms")
    ,( 32419,   @GO_TYPE_GENERIC,    660,         "Gnomes")
    ,( 32424,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,( 32427,   @GO_TYPE_GENERIC,    660,         "The Mystic Ward")
    ,( 32431,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,( 33998,   @GO_TYPE_GENERIC,    663,         "Sewers")
    ,( 33999,   @GO_TYPE_GENERIC,    663,         "Sewers")
    ,( 34012,   @GO_TYPE_GENERIC,    663,         "Sewers")
    ,( 34013,   @GO_TYPE_GENERIC,    663,         "Sewers")
    ,( 34357,   @GO_TYPE_GENERIC,    666,         "BerryFizz Potions and Mixed Drinks")
    ,( 36070,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,( 36071,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,( 36072,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,( 36073,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,( 36077,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,( 36078,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36079,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,( 36080,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36082,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 36083,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36085,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36086,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 36090,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 36091,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36092,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 36093,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 36094,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,( 36095,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36096,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36098,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,( 36102,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36105,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36113,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36118,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 36126,   @GO_TYPE_GENERIC,    663,         "Royal Quarter")
    ,( 36127,   @GO_TYPE_GENERIC,    663,         "Royal Quarter")
    ,( 36397,   @GO_TYPE_GENERIC,    663,         "Royal Quarter")
    ,( 36398,   @GO_TYPE_GENERIC,    663,         "Royal Quarter")
    ,( 38927,   @GO_TYPE_GENERIC,    150,         "Newman's Landing")
    ,( 41195,   @GO_TYPE_GENERIC,    681,         "Southshore Town Hall")
    ,( 50484,   @GO_TYPE_GENERIC,    686,         "Cloudweaver's Baskets")
    ,( 50485,   @GO_TYPE_GENERIC,    687,         "Dawnstrider Enchanters")
    ,( 50486,   @GO_TYPE_GENERIC,    688,         "Bena's Alchemy")
    ,( 50487,   @GO_TYPE_GENERIC,    689,         "Holistic Herbalism")
    ,( 50488,   @GO_TYPE_GENERIC,    690,         "Thunder Bluff Armorers")
    ,( 50489,   @GO_TYPE_GENERIC,    691,         "Thunderhorn's Archery")
    ,( 50490,   @GO_TYPE_GENERIC,    692,         "Fruits and Vegetables")
    ,( 50491,   @GO_TYPE_GENERIC,    692,         "Breads and Grains")
    ,( 50492,   @GO_TYPE_GENERIC,    693,         "Thunder Bluff Bank")
    ,( 50493,   @GO_TYPE_GENERIC,    694,         "Karn's Smithy")
    ,( 50494,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50495,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50496,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50497,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50498,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50499,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50500,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50501,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50502,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50503,   @GO_TYPE_GENERIC,    695,         "Thunder Bluff Weapons")
    ,( 50504,   @GO_TYPE_GENERIC,    694,         "Stonehoof Geology")
    ,( 50505,   @GO_TYPE_GENERIC,    686,         "Thunder Bluff Civic Information")
    ,( 50506,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50507,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50508,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50509,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50510,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50511,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50512,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50513,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50514,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50515,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50516,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50517,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50518,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50519,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50520,   @GO_TYPE_GENERIC,    686,         "Elder Rise Drums")
    ,( 50521,   @GO_TYPE_GENERIC,    692,         "Kodo Steak and Ribs")
    ,( 50522,   @GO_TYPE_GENERIC,    692,         "Mountaintop Bait & Tackle")
    ,( 50523,   @GO_TYPE_GENERIC,    695,         "Winterhoof Totems")
    ,( 50524,   @GO_TYPE_GENERIC,    692,         "Aska's Kitchen")
    ,( 50525,   @GO_TYPE_GENERIC,    691,         "Thunderhoof's Firearms")
    ,( 50526,   @GO_TYPE_GENERIC,    308,         "Spirit Rise")
    ,( 50527,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50528,   @GO_TYPE_GENERIC,    308,         "Elevator to Mulgore")
    ,( 50529,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50530,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50531,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50532,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50533,   @GO_TYPE_GENERIC,    308,         "Hunter Rise")
    ,( 50534,   @GO_TYPE_GENERIC,    308,         "Elder Rise")
    ,( 50535,   @GO_TYPE_GENERIC,    695,         "Rainsticks")
    ,( 50536,   @GO_TYPE_GENERIC,    691,         "Hunter's Hall")
    ,( 50537,   @GO_TYPE_GENERIC,    689,         "Hall of Elders")
    ,( 50538,   @GO_TYPE_GENERIC,    688,         "Hall of Spirits")
    ,( 55774,   @GO_TYPE_GENERIC,    695,         "Ragetotem Arms")
    ,( 56898,   @GO_TYPE_GENERIC,    718,         "Plate-n-Chain")
    ,( 56901,   @GO_TYPE_GENERIC,    720,         "Tan-Your-Hide Leatherworks")
    ,( 56903,   @GO_TYPE_GENERIC,    722,         "Good Food")
    ,( 56905,   @GO_TYPE_GENERIC,    724,         "Swift Flights")
    ,( 56910,   @GO_TYPE_GENERIC,    728,         "The Salty Sailor Tavern")
    ,( 56911,   @GO_TYPE_GENERIC,    729,         "Stranglethorn Trust Bank")
    ,( 58596,   @GO_TYPE_GENERIC,    733,         "Weapons")
    ,( 58597,   @GO_TYPE_GENERIC,    734,         "Bat Handler")
    ,( 58598,   @GO_TYPE_GENERIC,    735,         "General Goods")
    ,( 58599,   @GO_TYPE_GENERIC,    735,         "General Goods")
    ,( 58600,   @GO_TYPE_GENERIC,    736,         "Light Armor")
    ,( 58601,   @GO_TYPE_GENERIC,    737,         "Bank")
    ,( 58602,   @GO_TYPE_GENERIC,    737,         "Bank")
    ,( 58603,   @GO_TYPE_GENERIC,    737,         "Bank")
    ,( 58604,   @GO_TYPE_GENERIC,    737,         "Bank")
    ,( 58605,   @GO_TYPE_GENERIC,    736,         "Heavy Armor")
    ,( 58606,   @GO_TYPE_GENERIC,    738,         "Cooking")
    ,( 58607,   @GO_TYPE_GENERIC,    739,         "Tabards")
    ,( 58608,   @GO_TYPE_GENERIC,    734,         "Guild Creation")
    ,( 58609,   @GO_TYPE_GENERIC,    735,         "Engineering")
    ,( 58610,   @GO_TYPE_GENERIC,    740,         "Alchemist")
    ,( 58611,   @GO_TYPE_GENERIC,    734,         "Relic Vendor")
    ,( 58612,   @GO_TYPE_GENERIC,    734,         "Reagent Vendor")
    ,( 58613,   @GO_TYPE_GENERIC,    740,         "Alchemist")
    ,( 58614,   @GO_TYPE_GENERIC,    734,         "Enchantment")
    ,( 58615,   @GO_TYPE_GENERIC,    741,         "Herbalist")
    ,( 58616,   @GO_TYPE_GENERIC,    733,         "Weapons Merchants")
    ,( 58617,   @GO_TYPE_GENERIC,    742,         "Blacksmith")
    ,( 58618,   @GO_TYPE_GENERIC,    743,         "Bow Merchant")
    ,( 58619,   @GO_TYPE_GENERIC,    734,         "Gunsmith")
    ,( 58620,   @GO_TYPE_GENERIC,    744,         "Mining")
    ,( 58621,   @GO_TYPE_GENERIC,    733,         "Daggers")
    ,( 58622,   @GO_TYPE_GENERIC,    739,         "Leather Work")
    ,( 58623,   @GO_TYPE_GENERIC,    739,         "First Aid")
    ,( 58624,   @GO_TYPE_GENERIC,    745,         "Bag Vendor")
    ,( 58625,   @GO_TYPE_GENERIC,    746,         "Poison")
    ,( 58626,   @GO_TYPE_GENERIC,    734,         "Cartography")
    ,( 58627,   @GO_TYPE_GENERIC,    734,         "Book Dealer")
    ,( 58629,   @GO_TYPE_GENERIC,    747,         "Staff Merchant")
    ,( 59517,   @GO_TYPE_GENERIC,    721,         "All Things Flora")
    ,( 59518,   @GO_TYPE_GENERIC,    723,         "Nautical Needs")
    ,( 59845,   @GO_TYPE_GENERIC,    681,         "The Old Port Authority")
    ,( 59846,   @GO_TYPE_GENERIC,    681,         "Kalimdor Airlines")
    ,( 59847,   @GO_TYPE_GENERIC,    725,         "Cuts-N-Bruises Incorporated")
    ,( 59848,   @GO_TYPE_GENERIC,    681,         "Southern Skies Platform")
    ,( 59850,   @GO_TYPE_GENERIC,    751,         "Boucher's Cauldron")
    ,( 59851,   @GO_TYPE_GENERIC,    719,         "A Tailor to Cities")
    ,( 59852,   @GO_TYPE_GENERIC,    752,         "The Happy Bobber")
    ,( 61918,   @GO_TYPE_GENERIC,    718,         "Deep South Tannery")
    ,( 63195,   @GO_TYPE_GENERIC,    177,         "Stormwind Visitor's Center")
    ,( 63197,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 63198,   @GO_TYPE_GENERIC,    632,         "Cathedral Square")
    ,( 66780,   @GO_TYPE_GENERIC,    171,         "Lionheart Armory")
    ,( 74091,   @GO_TYPE_GENERIC,    728,         "The Salty Sailor Tavern")
    ,( 91692,   @GO_TYPE_GENERIC,    726,         "Boomstick Imports East")
    ,( 92524,   @GO_TYPE_GENERIC,    953,         "Guild")
    ,( 92525,   @GO_TYPE_GENERIC,    953,         "Argent Dawn")
    ,( 92526,   @GO_TYPE_GENERIC,    952,         "Alchemy")
    ,( 92527,   @GO_TYPE_GENERIC,    954,         "Bags")
    ,( 92528,   @GO_TYPE_GENERIC,    948,         "General Goods")
    ,( 92529,   @GO_TYPE_GENERIC,    949,         "Enchanting")
    ,( 92530,   @GO_TYPE_GENERIC,    949,         "Enchanting")
    ,( 92531,   @GO_TYPE_GENERIC,    959,         "Robe")
    ,( 92532,   @GO_TYPE_GENERIC,    960,         "Staff")
    ,( 92533,   @GO_TYPE_GENERIC,    947,         "Leatherworking")
    ,( 92534,   @GO_TYPE_GENERIC,    947,         "Tailoring")
    ,( 92535,   @GO_TYPE_GENERIC,    948,         "General Trade")
    ,( 92536,   @GO_TYPE_GENERIC,    948,         "General Trade")
    ,( 92537,   @GO_TYPE_GENERIC,    950,         "First Aid")
    ,( 92538,   @GO_TYPE_GENERIC,    951,         "Cooking")
    ,( 92539,   @GO_TYPE_GENERIC,    955,         "Weapons")
    ,( 92540,   @GO_TYPE_GENERIC,    955,         "Weapons")
    ,( 92541,   @GO_TYPE_GENERIC,    955,         "Weapons")
    ,( 92542,   @GO_TYPE_GENERIC,    955,         "Weapons")
    ,( 92543,   @GO_TYPE_GENERIC,    955,         "Thrown Weapons")
    ,( 92544,   @GO_TYPE_GENERIC,    956,         "Fletcher")
    ,( 92545,   @GO_TYPE_GENERIC,    958,         "Mail Armor")
    ,( 92546,   @GO_TYPE_GENERIC,    957,         "Shields")
    ,( 92547,   @GO_TYPE_GENERIC,    957,         "Shields")
    ,( 92548,   @GO_TYPE_GENERIC,    958,         "Mail Armor")
    ,( 92549,   @GO_TYPE_GENERIC,    959,         "Cloth Armor")
    ,( 92550,   @GO_TYPE_GENERIC,    958,         "Leather Armor")
    ,( 92551,   @GO_TYPE_GENERIC,    955,         "Two Handed Weapons")
    ,( 92552,   @GO_TYPE_GENERIC,    955,         "Two Handed Weapons")
    ,( 92693,   @GO_TYPE_GENERIC,    948,         "General Goods")
    ,( 92694,   @GO_TYPE_GENERIC,    954,         "Bags")
    ,( 92695,   @GO_TYPE_GENERIC,    956,         "Fletcher")
    ,( 92696,   @GO_TYPE_GENERIC,    955,         "Thrown Weapons")
    ,( 92699,   @GO_TYPE_GENERIC,    947,         "Leatherworking")
    ,( 92700,   @GO_TYPE_GENERIC,    947,         "Tailoring")
    ,( 95449,   @GO_TYPE_GENERIC,    959,         "Cloth Armor")
    ,( 98343,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,( 98347,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 98348,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 98349,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,( 98350,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,( 98351,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,( 98354,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,(103793,   @GO_TYPE_GENERIC,    26,          "Mage Quarter")
    ,(103794,   @GO_TYPE_GENERIC,    26,          "Cathedral Square")
    ,(103795,   @GO_TYPE_GENERIC,    26,          "Griffon Roost")
    ,(103796,   @GO_TYPE_GENERIC,    26,          "Old Town")
    ,(105188,   @GO_TYPE_GENERIC,    178,         "Trias' Cheese")
    ,(111094,   @GO_TYPE_GENERIC,    170,         "Gallina Winery")
    ,(112898,   @GO_TYPE_GENERIC,    180,         "The Gilded Rose")
    ,(113528,   @GO_TYPE_GENERIC,    689,         "Spiritual Healing")
    ,(113568,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(113569,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(113570,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,(113571,   @GO_TYPE_GENERIC,    663,         "The Apothecarium")
    ,(113572,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,(113574,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,(113575,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(113576,   @GO_TYPE_GENERIC,    663,         "Magic Quarter")
    ,(113577,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(113752,   @GO_TYPE_GENERIC,    734,         "Inn")
    ,(113755,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(113756,   @GO_TYPE_GENERIC,    663,         "Rogues' Quarter")
    ,(126046,   @GO_TYPE_GENERIC,    630,         "Dwarven District")
    ,(130125,   @GO_TYPE_GENERIC,    174,         "The Five Deadly Venoms")
    ,(136101,   @GO_TYPE_GENERIC,    739,         "Tailor")
    ,(137644,   @GO_TYPE_GENERIC,    660,         "The Forlorn Cavern")
    ,(137646,   @GO_TYPE_GENERIC,    660,         "The Military Ward")
    ,(141076,   @GO_TYPE_GENERIC,    309,         "Sun Rock Retreat")
    ,(141077,   @GO_TYPE_GENERIC,    309,         "Greatwood Vale")
    ,(142339,   @GO_TYPE_GENERIC,    660,         "The Mystic Ward")
    ,(142341,   @GO_TYPE_GENERIC,    656,         "Maeva's Mystical Apparel")
    ,(142838,   @GO_TYPE_GENERIC,    660,         "The Mystic Ward")
    ,(142873,   @GO_TYPE_GENERIC,    657,         "Traveling Fisherman")
    ,(142874,   @GO_TYPE_GENERIC,    2027,        "Stoneblade's")
    ,(143249,   @GO_TYPE_GENERIC,    635,         "Craghelm's Plate and Chain")
    ,(143251,   @GO_TYPE_GENERIC,    636,         "Goldfury's Hunting Supplies")
    ,(143253,   @GO_TYPE_GENERIC,    640,         "Barim's Reagents")
    ,(143254,   @GO_TYPE_GENERIC,    638,         "Timberline Arms")
    ,(143255,   @GO_TYPE_GENERIC,    639,         "Bruuk's Corner")
    ,(143256,   @GO_TYPE_GENERIC,    638,         "The Fighting Wizard")
    ,(143317,   @GO_TYPE_GENERIC,    639,         "The Stonefire Tavern")
    ,(143321,   @GO_TYPE_GENERIC,    637,         "Fizzlespinner's General Goods")
    ,(143322,   @GO_TYPE_GENERIC,    641,         "Ironforge Visitor's Center")
    ,(143324,   @GO_TYPE_GENERIC,    638,         "Steelfury's Weapon Emporium")
    ,(143333,   @GO_TYPE_GENERIC,    643,         "The Bronze Kettle")
    ,(143334,   @GO_TYPE_GENERIC,    656,         "Finespindle's Leather Goods")
    ,(143336,   @GO_TYPE_GENERIC,    642,         "Ironforge Physician")
    ,(143338,   @GO_TYPE_GENERIC,    640,         "Thistlefuzz Arcanery")
    ,(143343,   @GO_TYPE_GENERIC,    656,         "Stonebrow's Clothier")
    ,(143344,   @GO_TYPE_GENERIC,    641,         "Deep Mountain Mining Guild")
    ,(143399,   @GO_TYPE_GENERIC,    681,         "Broken Keel Tavern")
    ,(144162,   @GO_TYPE_GENERIC,    658,         "Springspindle's Gadgets")
    ,(146079,   @GO_TYPE_GENERIC,    27,          "Plaguelands")
    ,(146080,   @GO_TYPE_GENERIC,    27,          "Undercity")
    ,(146081,   @GO_TYPE_GENERIC,    27,          "Brill")
    ,(146096,   @GO_TYPE_GENERIC,    953,         "Sentinel's Bunkhouse")
    ,(148423,   @GO_TYPE_GENERIC,    2330,        "Inn")
    ,(148424,   @GO_TYPE_GENERIC,    686,         "Kuruk's Goods")
    ,(148425,   @GO_TYPE_GENERIC,    686,         "Trade Goods and Supplies")
    ,(148426,   @GO_TYPE_GENERIC,    690,         "Hewa's Armory")
    ,(149024,   @GO_TYPE_GENERIC,    26,          "Gol'Bolar Quarry")
    ,(150087,   @GO_TYPE_GENERIC,    637,         "Burbik's Supplies")
    ,(151974,   @GO_TYPE_GENERIC,    22,          "Gadgetzan")
    ,(151975,   @GO_TYPE_GENERIC,    22,          "Steamwheedle Port")
    ,(151976,   @GO_TYPE_GENERIC,    22,          "Shimmering Flats")
    ,(151977,   @GO_TYPE_GENERIC,    22,          "Shimmering Flats")
    ,(151978,   @GO_TYPE_GENERIC,    22,          "Gadgetzan")
    ,(151979,   @GO_TYPE_GENERIC,    22,          "Steamwheedle Port")
    ,(151980,   @GO_TYPE_GENERIC,    22,          "Shimmering Flats")
    ,(151981,   @GO_TYPE_GENERIC,    22,          "Steamwheedle Port")
    ,(151982,   @GO_TYPE_GENERIC,    22,          "Gadgetzan")
    ,(151983,   @GO_TYPE_GENERIC,    22,          "Gadgetzan")
    ,(151984,   @GO_TYPE_GENERIC,    22,          "Steamwheedle Port")
    ,(152574,   @GO_TYPE_GENERIC,    388,         "The Twin Colossals")
    ,(152575,   @GO_TYPE_GENERIC,    388,         "Desolace")
    ,(152576,   @GO_TYPE_GENERIC,    388,         "Feathermoon Stronghold")
    ,(152577,   @GO_TYPE_GENERIC,    388,         "High Wilderness")
    ,(152578,   @GO_TYPE_GENERIC,    388,         "Lower Wilds")
    ,(152579,   @GO_TYPE_GENERIC,    388,         "Thousand Needles")
    ,(152580,   @GO_TYPE_GENERIC,    388,         "Ravenwind")
    ,(152581,   @GO_TYPE_GENERIC,    388,         "Feathermoon Stronghold")
    ,(152582,   @GO_TYPE_GENERIC,    388,         "Desolace")
    ,(152584,   @GO_TYPE_GENERIC,    308,         "High Wilderness")
    ,(152585,   @GO_TYPE_GENERIC,    308,         "The Twin Colossals")
    ,(152586,   @GO_TYPE_GENERIC,    308,         "Desolace")
    ,(152587,   @GO_TYPE_GENERIC,    308,         "Thousand Needles")
    ,(164908,   @GO_TYPE_GENERIC,    179,         "Thane's Boots")
    ,(165549,   @GO_TYPE_GENERIC,    309,         "Maiden's Fancy - Round trips to Booty Bay")
    ,(165557,   @GO_TYPE_GENERIC,    309,         "Zeppelin Landing Tower")
    ,(165558,   @GO_TYPE_GENERIC,    27,          "Zeppelin Landing ")
    ,(169967,   @GO_TYPE_GENERIC,    196,         "Booty Bay Blacksmith")
    ,(170354,   @GO_TYPE_GENERIC,    663,         "War Quarter")
    ,(170355,   @GO_TYPE_GENERIC,    663,         "Trade Quarter")
    ,(171524,   @GO_TYPE_GENERIC,    660,         "Tinker Town")
    ,(171525,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,(171526,   @GO_TYPE_GENERIC,    660,         "Ironforge Main Gate")
    ,(171527,   @GO_TYPE_GENERIC,    660,         "Tinker Town")
    ,(171528,   @GO_TYPE_GENERIC,    660,         "Tinker Town")
    ,(171529,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,(171530,   @GO_TYPE_GENERIC,    660,         "The Forlorn Cavern")
    ,(171531,   @GO_TYPE_GENERIC,    660,         "The Library")
    ,(171532,   @GO_TYPE_GENERIC,    660,         "Hall of Explorers")
    ,(171533,   @GO_TYPE_GENERIC,    660,         "The Military Ward")
    ,(171534,   @GO_TYPE_GENERIC,    660,         "The Mystic Ward")
    ,(171704,   @GO_TYPE_GENERIC,    635,         "Ironforge Armory")
    ,(171708,   @GO_TYPE_GENERIC,    660,         "The Military Ward")
    ,(171709,   @GO_TYPE_GENERIC,    660,         "The High Seat")
    ,(171710,   @GO_TYPE_GENERIC,    660,         "Hall of Explorers")
    ,(171711,   @GO_TYPE_GENERIC,    660,         "The High Seat")
    ,(171712,   @GO_TYPE_GENERIC,    660,         "Hall of Explorers")
    ,(171748,   @GO_TYPE_GENERIC,    666,         "Berryfizz's Potions and Mixed Drinks")
    ,(171749,   @GO_TYPE_GENERIC,    659,         "Things That Go Boom!")
    ,(171766,   @GO_TYPE_GENERIC,    660,         "The Great Forge")
    ,(171770,   @GO_TYPE_GENERIC,    640,         "Longberry's Reagents")
    ,(172957,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172958,   @GO_TYPE_GENERIC,    309,         "Valley of Honor")
    ,(172959,   @GO_TYPE_GENERIC,    309,         "The Drag")
    ,(172960,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172961,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172962,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172963,   @GO_TYPE_GENERIC,    309,         "The Drag")
    ,(172964,   @GO_TYPE_GENERIC,    309,         "Valley of Honor")
    ,(172965,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172966,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172967,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172968,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172969,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172970,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172971,   @GO_TYPE_GENERIC,    309,         "Talon Gate")
    ,(172972,   @GO_TYPE_GENERIC,    309,         "Talon Gate")
    ,(172973,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172974,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172975,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172976,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172977,   @GO_TYPE_GENERIC,    309,         "The Drag")
    ,(172978,   @GO_TYPE_GENERIC,    309,         "Thrall's Fortress")
    ,(172979,   @GO_TYPE_GENERIC,    309,         "The Drag")
    ,(172980,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172981,   @GO_TYPE_GENERIC,    309,         "Valley of Honor")
    ,(172982,   @GO_TYPE_GENERIC,    309,         "Valley of Strength")
    ,(172983,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172984,   @GO_TYPE_GENERIC,    309,         "Valley of Honor")
    ,(172985,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172986,   @GO_TYPE_GENERIC,    309,         "Orgrimmar Main Gate")
    ,(172987,   @GO_TYPE_GENERIC,    309,         "Cleft of Shadow")
    ,(172988,   @GO_TYPE_GENERIC,    309,         "Valley of Strength")
    ,(172989,   @GO_TYPE_GENERIC,    309,         "Valley of Honor")
    ,(172990,   @GO_TYPE_GENERIC,    309,         "Valley of Wisdom")
    ,(172991,   @GO_TYPE_GENERIC,    309,         "Orgrimmar Main Gate")
    ,(172992,   @GO_TYPE_GENERIC,    309,         "The Drag")
    ,(172993,   @GO_TYPE_GENERIC,    309,         "Valley of Strength")
    ,(172994,   @GO_TYPE_GENERIC,    309,         "Orgrimmar Main Gate")
    ,(172995,   @GO_TYPE_GENERIC,    309,         "Valley of Spirits")
    ,(172996,   @GO_TYPE_GENERIC,    309,         "Valley of Strength")
    ,(172997,   @GO_TYPE_GENERIC,    309,         "Orgrimmar Main Gate")
    ,(173005,   @GO_TYPE_GENERIC,    714,         "Darkfire Enclave")
    ,(173006,   @GO_TYPE_GENERIC,    711,         "Spiritfury Reagents")
    ,(173016,   @GO_TYPE_GENERIC,    709,         "Borstan's Firepit")
    ,(173017,   @GO_TYPE_GENERIC,    710,         "Gotri's Travelling Gear")
    ,(173018,   @GO_TYPE_GENERIC,    712,         "Magar's Cloth Goods")
    ,(173020,   @GO_TYPE_GENERIC,    713,         "Jandi's Arboretum")
    ,(173021,   @GO_TYPE_GENERIC,    711,         "Yelmak's Alchemy and Potions")
    ,(173022,   @GO_TYPE_GENERIC,    714,         "Godan's Runeworks")
    ,(173024,   @GO_TYPE_GENERIC,    710,         "Droffers And Sons Salvage")
    ,(173025,   @GO_TYPE_GENERIC,    709,         "Stranglethorn Imported Fruits")
    ,(173044,   @GO_TYPE_GENERIC,    712,         "Kodohide Leatherworkers")
    ,(173056,   @GO_TYPE_GENERIC,    710,         "Asoran's Market")
    ,(173078,   @GO_TYPE_GENERIC,    707,         "Arms of Legend")
    ,(173079,   @GO_TYPE_GENERIC,    707,         "Kiro's Harnesses")
    ,(173080,   @GO_TYPE_GENERIC,    715,         "Orgrimmar Bowyer")
    ,(173081,   @GO_TYPE_GENERIC,    716,         "Red Canyon Mining")
    ,(173082,   @GO_TYPE_GENERIC,    716,         "Nogg's Machine Shop")
    ,(173083,   @GO_TYPE_GENERIC,    716,         "The Burning Anvil")
    ,(173084,   @GO_TYPE_GENERIC,    707,         "Hall of the Brave")
    ,(173085,   @GO_TYPE_GENERIC,    707,         "Hunter's Hall")
    ,(173086,   @GO_TYPE_GENERIC,    709,         "Lumak's Fishing")
    ,(173157,   @GO_TYPE_GENERIC,    707,         "Skyfury Staves")
    ,(173160,   @GO_TYPE_GENERIC,    714,         "Spirit Lodge")
    ,(173161,   @GO_TYPE_GENERIC,    714,         "Darkbriar Lodge")
    ,(173162,   @GO_TYPE_GENERIC,    711,         "Survival of the Fittest")
    ,(173168,   @GO_TYPE_GENERIC,    707,         "The Slow Blade")
    ,(173169,   @GO_TYPE_GENERIC,    713,         "Rekkul's Poisons")
    ,(173170,   @GO_TYPE_GENERIC,    707,         "Shadowswift Brotherhood")
    ,(173173,   @GO_TYPE_GENERIC,    714,         "Shadowdeep Reagents")
    ,(173174,   @GO_TYPE_GENERIC,    713,         "Dark Earth Fungus and Mushrooms")
    ,(173177,   @GO_TYPE_GENERIC,    707,         "Ironwood Staves and Wands")
    ,(173202,   @GO_TYPE_GENERIC,    717,         "Soran's Leather and Steel Armory")
    ,(173203,   @GO_TYPE_GENERIC,    710,         "Orgrimmar General Store")
    ,(173215,   @GO_TYPE_GENERIC,    707,         "The Shattered Axe")
    ,(173216,   @GO_TYPE_GENERIC,    708,         "Bank of Orgrimmar")
    ,(173217,   @GO_TYPE_GENERIC,    709,         "The Chophouse")
    ,(173218,   @GO_TYPE_GENERIC,    707,         "Boomstick Imports")
    ,(173219,   @GO_TYPE_GENERIC,    710,         "The Skytower")
    ,(173220,   @GO_TYPE_GENERIC,    710,         "Horde Embassy")
    ,(173222,   @GO_TYPE_GENERIC,    710,         "Orgrimmar Auction House")
    ,(174857,   @GO_TYPE_GENERIC,    726,         "Jazzik's General Goods")
    ,(174858,   @GO_TYPE_GENERIC,    725,         "Ironzar's Imported Weaponry")
    ,(175319,   @GO_TYPE_GENERIC,    714,         "Darkfire Enclave")
    ,(175433,   @GO_TYPE_GENERIC,    26,          "Festival Lane")
    ,(175434,   @GO_TYPE_GENERIC,    26,          "Crusaders' Square")
    ,(175435,   @GO_TYPE_GENERIC,    26,          "King's Square")
    ,(175436,   @GO_TYPE_GENERIC,    26,          "Festival Lane")
    ,(175437,   @GO_TYPE_GENERIC,    26,          "Crusaders' Square")
    ,(175438,   @GO_TYPE_GENERIC,    26,          "Market Row")
    ,(175439,   @GO_TYPE_GENERIC,    26,          "King's Square")
    ,(175440,   @GO_TYPE_GENERIC,    26,          "Elders' Square")
    ,(175441,   @GO_TYPE_GENERIC,    26,          "Elders' Square")
    ,(175442,   @GO_TYPE_GENERIC,    26,          "Festival Lane")
    ,(175443,   @GO_TYPE_GENERIC,    26,          "Market Row")
    ,(175444,   @GO_TYPE_GENERIC,    26,          "Main Gate")
    ,(175445,   @GO_TYPE_GENERIC,    26,          "Market Row")
    ,(175447,   @GO_TYPE_GENERIC,    26,          "Main Gate")
    ,(175449,   @GO_TYPE_GENERIC,    26,          "Slaughter Square")
    ,(175450,   @GO_TYPE_GENERIC,    26,          "Elders' Square")
    ,(175454,   @GO_TYPE_GENERIC,    26,          "Elders' Square")
    ,(175455,   @GO_TYPE_GENERIC,    26,          "Slaughter Square")
    ,(175457,   @GO_TYPE_GENERIC,    26,          "Crusaders' Square")
    ,(175458,   @GO_TYPE_GENERIC,    26,          "Market Row")
    ,(175459,   @GO_TYPE_GENERIC,    26,          "To Stranglethorn Vale")
    ,(175460,   @GO_TYPE_GENERIC,    26,          "Market Row")
    ,(175461,   @GO_TYPE_GENERIC,    26,          "Service Entrance")
    ,(175462,   @GO_TYPE_GENERIC,    26,          "The Gauntlet")
    ,(175463,   @GO_TYPE_GENERIC,    26,          "Festival Lane")
    ,(175466,   @GO_TYPE_GENERIC,    3673,        "Kirtonos Bros. Funeral Home")
    ,(175467,   @GO_TYPE_GENERIC,    3672,        "Goodman's General Store")
    ,(175469,   @GO_TYPE_GENERIC,    3673,        "Pierce's Pistols")
    ,(175470,   @GO_TYPE_GENERIC,    3671,        "Angelista's Boutique")
    ,(175471,   @GO_TYPE_GENERIC,    3671,        "The Stone Crow Tavern")
    ,(175472,   @GO_TYPE_GENERIC,    3673,        "Leeka's Shields & Maces")
    ,(175474,   @GO_TYPE_GENERIC,    3671,        "The Bayberry Inn")
    ,(175477,   @GO_TYPE_GENERIC,    3673,        "Enoyls Engineering, Inc.")
    ,(175478,   @GO_TYPE_GENERIC,    3671,        "Chilton's Magic Shop")
    ,(175479,   @GO_TYPE_GENERIC,    3671,        "Legacy of Steel - Fine Weaponry")
    ,(175481,   @GO_TYPE_GENERIC,    3673,        "Cash & Sons - Pawn Brokers")
    ,(175483,   @GO_TYPE_GENERIC,    3672,        "The Orphanage")
    ,(175484,   @GO_TYPE_GENERIC,    3671,        "Fras Siabi's Premium Tobacco")
    ,(175824,   @GO_TYPE_GENERIC,    26,          "Crusaders' Square")
    ,(175825,   @GO_TYPE_GENERIC,    26,          "Crusaders' Square")
    ,(176364,   @GO_TYPE_GENERIC,    388,         "Boat to Menethil")
    ,(176365,   @GO_TYPE_GENERIC,    388,         "Boat to Teldrassil")
    ,(176369,   @GO_TYPE_GENERIC,    195,         "Boat to Theramore")
    ,(176370,   @GO_TYPE_GENERIC,    195,         "Boat to Auberdine")
    ,(176794,   @GO_TYPE_GENERIC,    308,         "Windshear Crag")
    ,(176795,   @GO_TYPE_GENERIC,    308,         "Stonetalon Peak")
    ,(176796,   @GO_TYPE_GENERIC,    308,         "Desolace")
    ,(176797,   @GO_TYPE_GENERIC,    308,         "The Charred Vale")
    ,(176798,   @GO_TYPE_GENERIC,    308,         "Sun Rock Retreat")
    ,(176799,   @GO_TYPE_GENERIC,    308,         "Sun Rock Retreat")
    ,(176800,   @GO_TYPE_GENERIC,    308,         "Windshear Crag")
    ,(176801,   @GO_TYPE_GENERIC,    308,         "Stonetalon Peak")
    ,(176945,   @GO_TYPE_GENERIC,    309,         "Camp Mojache")
    ,(176946,   @GO_TYPE_GENERIC,    309,         "Shadowprey Village")
    ,(176947,   @GO_TYPE_GENERIC,    309,         "Ghost Walker Post")
    ,(176948,   @GO_TYPE_GENERIC,    388,         "Nijel's Point")
    ,(176949,   @GO_TYPE_GENERIC,    388,         "Feathermoon Stronghold")
    ,(176950,   @GO_TYPE_GENERIC,    309,         "Ghost Walker Post")
    ,(176958,   @GO_TYPE_GENERIC,    388,         "Nijel's Point")
    ,(176959,   @GO_TYPE_GENERIC,    388,         "Stonetalon Mountains")
    ,(176960,   @GO_TYPE_GENERIC,    309,         "Ghost Walker Post")
    ,(176961,   @GO_TYPE_GENERIC,    309,         "Shadowprey Village")
    ,(176967,   @GO_TYPE_GENERIC,    4531,        "Stratholme")
    ,(176968,   @GO_TYPE_GENERIC,    4531,        "Terrordale")
    ,(176969,   @GO_TYPE_GENERIC,    4531,        "Quel'Thalas")
    ,(176970,   @GO_TYPE_GENERIC,    4531,        "Corin's Crossing")
    ,(176971,   @GO_TYPE_GENERIC,    4531,        "Quel'Thalas")
    ,(176972,   @GO_TYPE_GENERIC,    4531,        "Stratholme")
    ,(176973,   @GO_TYPE_GENERIC,    4531,        "Tyr's Hand")
    ,(176978,   @GO_TYPE_GENERIC,    4531,        "Quel'Thalas")
    ,(176979,   @GO_TYPE_GENERIC,    4531,        "Stratholme")
    ,(176980,   @GO_TYPE_GENERIC,    4531,        "Tyr's Hand")
    ,(176981,   @GO_TYPE_GENERIC,    4531,        "Darrowshire")
    ,(176982,   @GO_TYPE_GENERIC,    4531,        "Andorhal")
    ,(176983,   @GO_TYPE_GENERIC,    4531,        "Andorhal")
    ,(176984,   @GO_TYPE_GENERIC,    4531,        "Corin's Crossing")
    ,(176985,   @GO_TYPE_GENERIC,    4531,        "Stratholme")
    ,(176986,   @GO_TYPE_GENERIC,    4531,        "Darrowshire")
    ,(176987,   @GO_TYPE_GENERIC,    4531,        "Hearthglen")
    ,(176988,   @GO_TYPE_GENERIC,    4531,        "Andorhal")
    ,(176989,   @GO_TYPE_GENERIC,    4531,        "Tirisfal Glades")
    ,(176990,   @GO_TYPE_GENERIC,    4531,        "Darrowshire")
    ,(176991,   @GO_TYPE_GENERIC,    4531,        "Tirisfal")
    ,(176992,   @GO_TYPE_GENERIC,    4531,        "Darrowshire")
    ,(176993,   @GO_TYPE_GENERIC,    4531,        "Andorhal")
    ,(176994,   @GO_TYPE_GENERIC,    4531,        "Hearthglen")
    ,(177064,   @GO_TYPE_GENERIC,    734,         "Mordan's Reagents")
    ,(177104,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,(177105,   @GO_TYPE_GENERIC,    388,         "Jaedenar")
    ,(177106,   @GO_TYPE_GENERIC,    388,         "Talonbranch Glade")
    ,(177107,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,(177108,   @GO_TYPE_GENERIC,    388,         "Talonbranch Glade")
    ,(177109,   @GO_TYPE_GENERIC,    388,         "Moonglade")
    ,(177110,   @GO_TYPE_GENERIC,    388,         "Jaedenar")
    ,(177111,   @GO_TYPE_GENERIC,    388,         "Moonglade")
    ,(177112,   @GO_TYPE_GENERIC,    388,         "Winterspring")
    ,(177113,   @GO_TYPE_GENERIC,    388,         "Ashenvale")
    ,(177114,   @GO_TYPE_GENERIC,    388,         "Jaedenar")
    ,(177115,   @GO_TYPE_GENERIC,    388,         "Talonbranch Glade")
    ,(177116,   @GO_TYPE_GENERIC,    386,         "Stormrage Barrow Dens")
    ,(177117,   @GO_TYPE_GENERIC,    386,         "Shrine of Remulos")
    ,(177118,   @GO_TYPE_GENERIC,    386,         "Nighthaven")
    ,(177119,   @GO_TYPE_GENERIC,    386,         "Winterspring")
    ,(177120,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,(177121,   @GO_TYPE_GENERIC,    386,         "Nighthaven")
    ,(177122,   @GO_TYPE_GENERIC,    386,         "Shrine of Remulos")
    ,(177123,   @GO_TYPE_GENERIC,    386,         "Stormrage Barrow Dens")
    ,(177124,   @GO_TYPE_GENERIC,    386,         "Winterspring")
    ,(177125,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,(177126,   @GO_TYPE_GENERIC,    386,         "Winterspring")
    ,(177127,   @GO_TYPE_GENERIC,    386,         "Nighthaven")
    ,(177128,   @GO_TYPE_GENERIC,    386,         "Felwood")
    ,(177129,   @GO_TYPE_GENERIC,    386,         "Shrine of Remulos")
    ,(177130,   @GO_TYPE_GENERIC,    386,         "Stormrage Barrow Dens")
    ,(177131,   @GO_TYPE_GENERIC,    388,         "Kel'Theril")
    ,(177132,   @GO_TYPE_GENERIC,    388,         "Starfall Village")
    ,(177133,   @GO_TYPE_GENERIC,    388,         "Everlook")
    ,(177134,   @GO_TYPE_GENERIC,    388,         "Moonglade")
    ,(177135,   @GO_TYPE_GENERIC,    388,         "Felwood")
    ,(177136,   @GO_TYPE_GENERIC,    388,         "Starfall Village")
    ,(177137,   @GO_TYPE_GENERIC,    388,         "Everlook")
    ,(177138,   @GO_TYPE_GENERIC,    388,         "Kel'Theril")
    ,(177139,   @GO_TYPE_GENERIC,    388,         "Starfall Village")
    ,(177140,   @GO_TYPE_GENERIC,    388,         "Frostsaber Rock")
    ,(177141,   @GO_TYPE_GENERIC,    388,         "Kel'Theril")
    ,(177142,   @GO_TYPE_GENERIC,    388,         "Moonglade")
    ,(177143,   @GO_TYPE_GENERIC,    388,         "Felwood")
    ,(177144,   @GO_TYPE_GENERIC,    388,         "Everlook")
    ,(177145,   @GO_TYPE_GENERIC,    388,         "Mount Hyjal")
    ,(177146,   @GO_TYPE_GENERIC,    388,         "Everlook")
    ,(177147,   @GO_TYPE_GENERIC,    388,         "Kel'Theril")
    ,(177148,   @GO_TYPE_GENERIC,    388,         "Frostsaber Rock")
    ,(177149,   @GO_TYPE_GENERIC,    388,         "Starfall Village")
    ,(177150,   @GO_TYPE_GENERIC,    388,         "Mount Hyjal")
    ,(177151,   @GO_TYPE_GENERIC,    388,         "Starfall Village")
    ,(177152,   @GO_TYPE_GENERIC,    388,         "Kel'Theril")
    ,(177153,   @GO_TYPE_GENERIC,    388,         "Everlook")
    ,(177154,   @GO_TYPE_GENERIC,    388,         "Moonglade")
    ,(177155,   @GO_TYPE_GENERIC,    388,         "Felwood")
    ,(177185,   @GO_TYPE_GENERIC,    4651,        "Abandon hope, all ye who enter here.")
    ,(177186,   @GO_TYPE_GENERIC,    4651,        "Turn Back!")
    ,(177265,   @GO_TYPE_GENERIC,    4716,        "Bridge to Spirit Rise")
    ,(177266,   @GO_TYPE_GENERIC,    4717,        "Bridge to Elder Rise")
    ,(177267,   @GO_TYPE_GENERIC,    4717,        "Bridge to Elder Rise")
    ,(177268,   @GO_TYPE_GENERIC,    4718,        "Bridge to Hunter Rise")
    ,(177269,   @GO_TYPE_GENERIC,    4716,        "Bridge to Spirit Rise")
    ,(177270,   @GO_TYPE_GENERIC,    4718,        "Bridge to Hunter Rise")
    ,(178911,   @GO_TYPE_GENERIC,    665,         "Frostwolf Supplies")
    ,(179144,   @GO_TYPE_GENERIC,    3291,        "Danger! Crystalvein Mine closed!")
    ,(179224,   @GO_TYPE_GENERIC,    3291,        "Crystalvein Mine - Keep Out!")
    ,(179725,   @GO_TYPE_GENERIC,    26,          "Champions' Hall")
    ,(179726,   @GO_TYPE_GENERIC,    26,          "Champions' Hall")
    ,(179727,   @GO_TYPE_GENERIC,    26,          "Champions' Hall")
    ,(179728,   @GO_TYPE_GENERIC,    26,          "Champions' Hall")
    ,(179729,   @GO_TYPE_GENERIC,    26,          "Command Center")
    ,(179730,   @GO_TYPE_GENERIC,    26,          "Command Center")
    ,(179731,   @GO_TYPE_GENERIC,    26,          "Command Center")
    ,(179732,   @GO_TYPE_GENERIC,    26,          "SI:7")
    ,(179733,   @GO_TYPE_GENERIC,    26,          "SI:7")
    ,(179734,   @GO_TYPE_GENERIC,    26,          "SI:7")
    ,(179736,   @GO_TYPE_GENERIC,    173,         "Champions' Hall")
    ,(179737,   @GO_TYPE_GENERIC,    173,         "SI:7")
    ,(179738,   @GO_TYPE_GENERIC,    173,         "Command Center")
    ,(179739,   @GO_TYPE_GENERIC,    309,         "Hall of Legends")
    ,(179740,   @GO_TYPE_GENERIC,    309,         "Hall of Legends")
    ,(179742,   @GO_TYPE_GENERIC,    707,         "Hall of Legends")
    ,(179743,   @GO_TYPE_GENERIC,    26,          "Command Center")
    ,(179744,   @GO_TYPE_GENERIC,    26,          "SI:7")
    ,(179963,   @GO_TYPE_GENERIC,    22,          "OUT OF ORDER! Use Postman instead - your GM's")
;

-- Configure sign templates --------------------------------------------------
UPDATE `gameobject_template`
SET
    `data0`   = 1, -- floating tooltip
    `data1`   = 1, -- highlight
    `size`    = 1
WHERE
    `entry` IN (
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97,
    98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112,
    113, 114, 115, 116, 117, 118, 121, 122, 123, 124, 298, 299, 301, 302, 303,
    304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318,
    376, 377, 378, 379, 380, 381, 382, 387, 388, 389, 1162, 1564, 1565, 1566,
    1567, 1568, 1569, 1570, 1572, 1573, 1595, 1596, 1597, 1598, 1630, 1631,
    1632, 1633, 1634, 1638, 1639, 1643, 1644, 1645, 1646, 1647, 1648, 1649,
    1650, 1651, 1652, 1653, 1654, 1655, 1656, 1657, 1658, 1659, 1660, 1661,
    1662, 1663, 1664, 1665, 1666, 1668, 1669, 1674, 1675, 1676, 1677, 1678,
    1679, 1680, 1681, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694,
    1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706,
    1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1771, 1772, 1773,
    1774, 1775, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785,
    1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 2016, 2017,
    2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029,
    2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2048, 2049, 2050,
    2051, 2052, 2096, 2098, 2099, 2100, 2101, 2102, 2105, 2106, 2108, 2109,
    2110, 2111, 2112, 2113, 2115, 2116, 2117, 2119, 2120, 2122, 2123, 2124,
    2125, 2127, 2128, 2129, 2130, 2131, 2133, 2134, 2136, 2138, 2139, 2140,
    2141, 2142, 2143, 2145, 2146, 2148, 2149, 2150, 2151, 2152, 2153, 2154,
    2155, 2156, 2157, 2158, 2159, 2160, 2161, 2162, 2163, 2164, 2165, 2166,
    2167, 2169, 2171, 2173, 2175, 2176, 2177, 2178, 2179, 2181, 2182, 2186,
    2187, 2188, 2189, 2190, 2191, 2670, 2672, 2673, 2674, 2675, 2676, 2677,
    2678, 2679, 2680, 2681, 2682, 2683, 2684, 2685, 2968, 2969, 2970, 2971,
    2972, 2973, 2974, 2975, 2976, 2977, 2978, 3194, 3195, 3196, 3197, 3198,
    3199, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3210, 3211, 3212,
    3213, 3214, 3215, 3216, 3217, 3224, 3225, 3226, 3227, 3228, 3229, 3230,
    3231, 3232, 3233, 3234, 3235, 3276, 3314, 4097, 4098, 4099, 4100, 4101,
    4102, 4103, 4104, 4105, 4106, 4115, 4116, 4117, 4118, 4119, 4120, 4121,
    4122, 4123, 4132, 4133, 4134, 4135, 4136, 4137, 4138, 10082, 10083,
    12351, 12352, 12353, 12354, 12355, 12356, 12357, 12358, 12359, 12360,
    12361, 12362, 12363, 12364, 12365, 12366, 12893, 12894, 12895, 12896,
    12897, 12898, 12899, 12900, 12901, 12902, 12903, 12904, 12907, 12908,
    12909, 13348, 13349, 13350, 13351, 13352, 13353, 13354, 13355, 13356,
    13357, 13358, 13405, 13406, 13407, 13408, 13409, 13410, 13411, 13412,
    16396, 18033, 18034, 19028, 19033, 19545, 19546, 19553, 19554, 19555,
    19556, 19557, 19558, 19559, 19560, 19561, 19562, 19563, 19564, 19565,
    19566, 19567, 19568, 19569, 19570, 19571, 19572, 19573, 19574, 19575,
    19576, 19577, 19578, 19579, 19580, 19581, 19582, 19583, 19585, 19839,
    19840, 19841, 19842, 19843, 19844, 19845, 19846, 19847, 19848, 19849,
    19850, 19851, 19852, 19853, 19854, 19855, 19856, 19857, 19858, 19859,
    19863, 21053, 21054, 21055, 21056, 21057, 21058, 21059, 21060, 21061,
    21062, 21063, 21064, 21065, 21066, 21067, 21068, 21069, 21070, 21071,
    21072, 21073, 21074, 21075, 21076, 21077, 21078, 21079, 21080, 21081,
    21082, 21083, 21084, 21085, 21086, 21087, 21088, 21089, 21509, 23295,
    23296, 23299, 23300, 23301, 24715, 24717, 24718, 24719, 24720, 24721,
    25328, 25334, 25336, 25337, 25338, 25339, 25340, 25341, 25342, 25346,
    25347, 25348, 25349, 25350, 25351, 25352, 25353, 25354, 25355, 25356,
    25357, 26480, 26482, 26483, 26485, 26486, 26487, 26488, 26489, 26490,
    26491, 26492, 26493, 26497, 26498, 28027, 28028, 28029, 28030, 28031,
    28032, 28033, 28034, 28035, 28036, 28037, 28038, 28039, 28040, 28041,
    28042, 28043, 28044, 28045, 28046, 28047, 32348, 32350, 32351, 32352,
    32353, 32354, 32355, 32356, 32357, 32359, 32362, 32364, 32372, 32377,
    32381, 32383, 32385, 32386, 32390, 32419, 32424, 32427, 32431, 33998,
    33999, 34012, 34013, 34357, 36070, 36071, 36072, 36073, 36077, 36078,
    36079, 36080, 36082, 36083, 36085, 36086, 36090, 36091, 36092, 36093,
    36094, 36095, 36096, 36098, 36102, 36105, 36113, 36118, 36126, 36127,
    36397, 36398, 38927, 41195, 50484, 50485, 50486, 50487, 50488, 50489,
    50490, 50491, 50492, 50493, 50494, 50495, 50496, 50497, 50498, 50499,
    50500, 50501, 50502, 50503, 50504, 50505, 50506, 50507, 50508, 50509,
    50510, 50511, 50512, 50513, 50514, 50515, 50516, 50517, 50518, 50519,
    50520, 50521, 50522, 50523, 50524, 50525, 50526, 50527, 50528, 50529,
    50530, 50531, 50532, 50533, 50534, 50535, 50536, 50537, 50538, 55774,
    56898, 56901, 56903, 56905, 56910, 56911, 58596, 58597, 58598, 58599,
    58600, 58601, 58602, 58603, 58604, 58605, 58606, 58607, 58608, 58609,
    58610, 58611, 58612, 58613, 58614, 58615, 58616, 58617, 58618, 58619,
    58620, 58621, 58622, 58623, 58624, 58625, 58626, 58627, 58629, 59517,
    59518, 59845, 59846, 59847, 59848, 59850, 59851, 59852, 61918, 63195,
    63197, 63198, 66780, 74091, 91692, 92524, 92525, 92526, 92527, 92528,
    92529, 92530, 92531, 92532, 92533, 92534, 92535, 92536, 92537, 92538,
    92539, 92540, 92541, 92542, 92543, 92544, 92545, 92546, 92547, 92548,
    92549, 92550, 92551, 92552, 92693, 92694, 92695, 92696, 92699, 92700,
    95449, 98343, 98347, 98348, 98349, 98350, 98351, 98354, 103793, 103794,
    103795, 103796, 105188, 111094, 112898, 113528, 113568, 113569, 113570,
    113571, 113572, 113574, 113575, 113576, 113577, 113752, 113755, 113756,
    126046, 130125, 136101, 137644, 137646, 141076, 141077, 142339, 142341,
    142838, 142873, 142874, 143249, 143251, 143253, 143254, 143255, 143256,
    143317, 143321, 143322, 143324, 143333, 143334, 143336, 143338, 143343,
    143344, 143399, 144162, 146079, 146080, 146081, 146096, 148423, 148424,
    148425, 148426, 149024, 150087, 151974, 151975, 151976, 151977, 151978,
    151979, 151980, 151981, 151982, 151983, 151984, 152574, 152575, 152576,
    152577, 152578, 152579, 152580, 152581, 152582, 152584, 152585, 152586,
    152587, 164908, 165549, 165557, 165558, 169967, 170354, 170355, 171524,
    171525, 171526, 171527, 171528, 171529, 171530, 171531, 171532, 171533,
    171534, 171704, 171708, 171709, 171710, 171711, 171712, 171748, 171749,
    171766, 171770, 172957, 172958, 172959, 172960, 172961, 172962, 172963,
    172964, 172965, 172966, 172967, 172968, 172969, 172970, 172971, 172972,
    172973, 172974, 172975, 172976, 172977, 172978, 172979, 172980, 172981,
    172982, 172983, 172984, 172985, 172986, 172987, 172988, 172989, 172990,
    172991, 172992, 172993, 172994, 172995, 172996, 172997, 173005, 173006,
    173016, 173017, 173018, 173020, 173021, 173022, 173024, 173025, 173044,
    173056, 173078, 173079, 173080, 173081, 173082, 173083, 173084, 173085,
    173086, 173157, 173160, 173161, 173162, 173168, 173169, 173170, 173173,
    173174, 173177, 173202, 173203, 173215, 173216, 173217, 173218, 173219,
    173220, 173222, 174857, 174858, 175319, 175433, 175434, 175435, 175436,
    175437, 175438, 175439, 175440, 175441, 175442, 175443, 175444, 175445,
    175447, 175449, 175450, 175454, 175455, 175457, 175458, 175459, 175460,
    175461, 175462, 175463, 175466, 175467, 175469, 175470, 175471, 175472,
    175474, 175477, 175478, 175479, 175481, 175483, 175484, 175824, 175825,
    176364, 176365, 176369, 176370, 176794, 176795, 176796, 176797, 176798,
    176799, 176800, 176801, 176945, 176946, 176947, 176948, 176949, 176950,
    176958, 176959, 176960, 176961, 176967, 176968, 176969, 176970, 176971,
    176972, 176973, 176978, 176979, 176980, 176981, 176982, 176983, 176984,
    176985, 176986, 176987, 176988, 176989, 176990, 176991, 176992, 176993,
    176994, 177064, 177104, 177105, 177106, 177107, 177108, 177109, 177110,
    177111, 177112, 177113, 177114, 177115, 177116, 177117, 177118, 177119,
    177120, 177121, 177122, 177123, 177124, 177125, 177126, 177127, 177128,
    177129, 177130, 177131, 177132, 177133, 177134, 177135, 177136, 177137,
    177138, 177139, 177140, 177141, 177142, 177143, 177144, 177145, 177146,
    177147, 177148, 177149, 177150, 177151, 177152, 177153, 177154, 177155,
    177185, 177186, 177265, 177266, 177267, 177268, 177269, 177270, 178911,
    179224, 179725, 179726, 179727, 179728, 179729, 179730, 179144, 179731,
    179732, 179733, 179734, 179736, 179737, 179738, 179739, 179740, 179742,
    179743, 179744, 179963
    )
;

UPDATE `gameobject_template`
SET
    `faction`    = 83   -- Horde Generic
WHERE
    `entry` IN (
        3202, 3203, 3204, 3208, 3209, 3210, 3214, 3215, 3224, 3225, 3226,
        3227, 3228, 3229, 3230, 3231, 3232, 3233, 3234, 3235, 3276, 3314,
        18033, 18034, 19033, 19583
    )
;

UPDATE `gameobject_template`
SET
    `faction`    = 84   -- Alliance Generic
WHERE
    `entry` IN (
        3205, 3206, 3207, 3211, 3212, 3213, 3216, 3217, 12893, 12894, 12895,
        12896, 12897, 12898, 12899, 12900, 12901, 12902, 12903, 12904, 12907,
        12908, 12909, 13348, 13349, 13350, 13351, 13352, 13353, 13354, 13355,
        13356, 13357, 13358, 13405, 13406, 13407, 13408, 13409, 13410, 13411,
        13412, 19545, 19546, 19572, 19573, 19574, 19575, 19576, 19578, 19579,
        19580, 19581
    )
;

UPDATE `gameobject_template`
SET
    `data3`     = 1     -- large
WHERE
    `entry` IN (179963)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.19
WHERE
    `entry` IN (177186)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.21
WHERE
    `entry` IN (177185)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.24
WHERE
    `entry` IN (21509)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.3
WHERE
    `entry` IN (41195)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.387597
WHERE
    `entry` IN (56898)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.392912
WHERE
    `entry` IN (59848)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.4
WHERE
    `entry` IN (179963)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.411929
WHERE
    `entry` IN (59851)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.420168
WHERE
    `entry` IN (61918)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.453139
WHERE
    `entry` IN (59846)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.457242
WHERE
    `entry` IN (59850)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.498125
WHERE
    `entry` IN (33999, 34012, 34013, 36126, 36127, 36398)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.500729
WHERE
    `entry` IN (174857)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.502513
WHERE
    `entry` IN (91692)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.503145
WHERE
    `entry` IN (36070, 36071, 36077, 36079, 36082, 36086, 36091, 36093, 36094, 36095, 36096, 36098, 36102, 36105, 36113, 36118, 98343, 98347, 98348, 98349, 98350, 98351, 98354, 113575, 113577, 113755, 113756, 170355)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.507614
WHERE
    `entry` IN (174858)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.518242
WHERE
    `entry` IN (56905)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.518987
WHERE
    `entry` IN (59845, 143399)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.531011
WHERE
    `entry` IN (59847)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.554324
WHERE
    `entry` IN (56903)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.659019
WHERE
    `entry` IN (33998, 36072, 36078, 36080, 36083, 36085, 36090, 36092, 113568, 113569, 113571, 113574, 170354)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.67
WHERE
    `entry` IN (19028)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.712318
WHERE
    `entry` IN (36073, 36397, 113570, 113572, 113576)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.745879
WHERE
    `entry` IN (179737, 179738)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.77
WHERE
    `entry` IN (19577)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.813008
WHERE
    `entry` IN (179736)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.819672
WHERE
    `entry` IN (112898)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.84
WHERE
    `entry` IN (2032)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.869565
WHERE
    `entry` IN (58623)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.877193
WHERE
    `entry` IN (144162)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.943396
WHERE
    `entry` IN (58616)
;

UPDATE `gameobject_template`
SET
    `size`     = 0.99
WHERE
    `entry` IN (58610, 58613)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.09
WHERE
    `entry` IN (25338, 25355, 63197)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.1
WHERE
    `entry` IN (58617, 58622, 58625, 136101)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.18
WHERE
    `entry` IN (179144, 179224)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.28319
WHERE
    `entry` IN (2101)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.3298
WHERE
    `entry` IN (25339, 25340, 25356, 25357, 63198)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.33
WHERE
    `entry` IN (173006, 173016, 173017, 173018, 173020, 173021, 173022, 173024, 173025, 173044, 173056, 173078, 173079, 173080, 173081, 173082, 173083, 173084, 173085, 173086, 173157, 173160, 173161, 173162, 173168, 173169, 173170, 173173, 173174, 173177, 173202, 173203, 173215, 173216, 173217, 173218, 173219, 173220, 173222, 175319, 179742)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.33028
WHERE
    `entry` IN (2100)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.34
WHERE
    `entry` IN (2110, 2111, 2112, 2113, 2115, 2116, 2117, 2119, 2120, 2122, 2123, 2124, 2125, 2127, 2128, 2129, 2131, 2133, 2134, 2136, 2140, 2141, 2142, 2143, 2171, 2173, 2175, 2176, 2178, 2179, 2181, 2182, 2186, 2187, 2189, 2190, 2191, 10082, 10083, 24715, 24717, 24718, 24719, 24720, 24721, 28027, 28028, 28029, 28030, 28031, 28032, 28035, 28036, 28037, 28038, 28039, 28040, 28041, 28042, 28043, 103793, 103794, 103795, 103796, 179725, 179726, 179727, 179728, 179729, 179730, 179731, 179732, 179733, 179734, 179743, 179744)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.35
WHERE
    `entry` IN (25336, 25337, 25346, 25347)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.38
WHERE
    `entry` IN (25348, 25349, 25350, 25351, 28044, 28045, 28046, 126046)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.43
WHERE
    `entry` IN (74091)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.44
WHERE
    `entry` IN (25341, 25352, 25354)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.45
WHERE
    `entry` IN (2096, 2098, 2099, 2102, 2105, 2108, 23299, 23300, 23301, 28033)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.46104
WHERE
    `entry` IN (56901)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.5228
WHERE
    `entry` IN (2106, 28034)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.573
WHERE
    `entry` IN (56910)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.77781
WHERE
    `entry` IN (59517)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.86
WHERE
    `entry` IN (59518)
;

UPDATE `gameobject_template`
SET
    `size`     = 1.89684
WHERE
    `entry` IN (59852)
;

UPDATE `gameobject_template`
SET
    `size`     = 2
WHERE
    `entry` IN (92524, 92525, 92526, 92527, 92528, 92529, 92530, 92531, 92532, 92533, 92534, 92535, 92536, 92537, 92538, 92539, 92540, 92541, 92542, 92543, 92544, 92545, 92546, 92547, 92548, 92549, 92550, 92551, 92552, 92693, 92694, 92695, 92696, 92699, 92700, 95449, 148423)
;

UPDATE `gameobject_template`
SET
    `size`     = 2.38
WHERE
    `entry` IN (146096)
;

UPDATE `gameobject_template`
SET
    `size`     = 2.41
WHERE
    `entry` IN (169967)
;

UPDATE `gameobject_template`
SET
    `size`     = 2.97
WHERE
    `entry` IN (56911)
;

-- Spawn signs ---------------------------------------------------------------
INSERT INTO `gameobject`
    (`guid`,       `id`, `map`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`)
VALUES
     (501,80,0,-9979.13,1007.33,32.7588,0.099154,0.100685,-0.025144,0.052291,0.993225)
    ,(502,81,0,-9978.25,1006.51,31.7592,-3.13445,0.009525,0.056056,0.998374,-0.00411)
    ,(503,82,0,-9978.59,1007.75,32.2856,-1.4199,0.080983,-0.024926,-0.651451,0.753944)
    ,(504,83,0,-9977.34,1009.86,31.4688,-1.47952,0.219706,-0.685921,0.160016,0.675008)
    ,(505,84,0,-10912,1420.35,42.5259,-0.131043,-0.056856,0.000639,-0.065544,0.996228)
    ,(506,85,0,-10910.9,1420.14,43.482,3.01751,-0.018991,0.090445,0.993666,0.063928)
    ,(507,86,0,-10670.3,1022.06,32.6104,-1.90211,0.032457,-0.007081,-0.813898,0.580057)
    ,(508,87,0,-10670.6,1020.86,33.4143,1.23197,-0.003461,0.00463,0.577755,0.81619)
    ,(509,88,0,-10670.6,1020.91,31.5826,1.23918,0,0,0.580703,0.814116)
    ,(510,89,0,-9430.91,62.5356,56.7788,3.14159,0,0,1,0)
    ,(511,90,0,-9430.87,64.5112,56.7852,0,0,0,0,1)
    ,(512,91,0,-9499.41,66.8215,56.012,-1.83259,0,0,-0.793353,0.608761)
    ,(513,92,0,-9499.42,66.8299,56.5678,-1.83259,0,0,-0.793353,0.608762)
    ,(514,93,0,-9500.09,68.0035,56.5492,-0.261799,0,0,-0.130526,0.991445)
    ,(515,94,0,-9500.08,67.9826,55.993,-0.261799,0,0,-0.130526,0.991445)
    ,(516,95,0,-9500.56,66.0789,56.5629,2.87979,0,0,0.991445,0.130526)
    ,(517,96,0,-9500.54,66.0703,56.0072,2.87979,0,0,0.991445,0.130526)
    ,(518,97,0,-9647.84,-1335.74,49.6839,-0.261799,0,0,-0.130526,0.991445)
    ,(519,98,0,-9647.84,-1335.76,49.1314,-0.261799,0,0,-0.130526,0.991445)
    ,(520,99,0,-9648.32,-1337.66,49.6781,2.87979,0,0,0.991445,0.130526)
    ,(521,100,0,-9647.18,-1336.91,49.6778,-1.83259,0,0,-0.793353,0.608761)
    ,(522,101,0,-10542.5,-1180.26,27.8265,1.29154,0,0,0.601815,0.798635)
    ,(523,102,0,-10542.6,-1180.24,26.4931,1.29154,0,0,0.601815,0.798635)
    ,(524,103,0,-10541.7,-1181.69,27.835,2.86234,0,0,0.990268,0.139173)
    ,(525,104,0,-10540.3,-1180.84,27.8421,-1.85005,0,0,-0.798635,0.601815)
    ,(526,105,0,-10812.5,304.43,31.44,-2.86234,0,0,0.990268,-0.139173)
    ,(527,106,0,-10813.3,306.68,31.4738,0.279252,0,0,0.139173,0.990268)
    ,(528,107,0,-10812.5,304.343,30.0518,-2.86234,0,0,0.990268,-0.139173)
    ,(529,108,0,-10811.8,305.896,31.4382,-1.29154,0,0,-0.601815,0.798636)
    ,(530,109,0,-10891.9,-366.62,37.3369,-0.287978,0,0,-0.143492,0.989651)
    ,(531,110,0,-10893.4,-367.545,38.7449,1.28282,0,0,0.598325,0.801253)
    ,(532,111,0,-10892,-366.709,38.7285,-0.287978,0,0,-0.143492,0.989651)
    ,(533,112,0,-10892.6,-368.997,38.7303,2.85361,0,0,0.989651,0.143493)
    ,(534,113,0,-9590.62,-1929.1,63.4876,1.89368,0,0,0.811574,0.58425)
    ,(535,114,0,-9589.4,-1929.75,63.4401,-2.81871,0,0,0.986996,-0.160743)
    ,(536,115,0,-9588.76,-1928.54,63.4444,-1.24791,0,0,-0.58425,0.811574)
    ,(537,116,0,-9589.39,-1929.77,62.8871,-2.81871,0,0,0.986996,-0.160743)
    ,(538,117,0,-9635.47,-2087.19,61.2531,-1.98095,0,0,-0.836286,0.548293)
    ,(539,118,0,-9637.23,-2086.35,61.294,1.16064,0,0,0.548293,0.836286)
    ,(540,121,0,-10924.2,995.367,34.9543,3.1406,0.004356,0.056692,0.998382,0.000247)
    ,(541,122,0,-10925,996.34,34.5069,-1.5708,0,0,-0.707107,0.707107)
    ,(542,123,0,-10924.8,996.455,35.6767,-1.48353,0.035104,-0.026255,-0.675081,0.73644)
    ,(543,124,0,-10925,994.95,36.3558,0.083313,-0.090912,-0.016617,0.040289,0.994905)
    ,(544,298,0,-5409.05,-2879.46,342.589,3.14159,0,0,1,0)
    ,(545,299,0,-5409.98,-2878.57,342.565,1.5708,0,0,0.707107,0.707107)
    ,(546,301,0,-5408.02,-2878.55,342.552,-1.5708,0,0,-0.707107,0.707107)
    ,(547,302,0,-5409.98,-2878.56,342.065,1.5708,0,0,0.707107,0.707107)
    ,(548,303,0,-4899.1,-2720.52,329.917,0.575958,0,0,0.284015,0.95882)
    ,(549,304,0,-4898.03,-2722.11,329.891,-2.56563,0,0,0.95882,-0.284015)
    ,(550,305,0,-4899.37,-2721.83,329.864,2.14675,0,0,0.878817,0.477159)
    ,(551,306,0,-5795.8,-2629.07,319.944,-2.46091,0,0,0.942641,-0.333807)
    ,(552,307,0,-5797.04,-2627.59,319.921,0.680678,0,0,0.333807,0.942641)
    ,(553,308,0,-5795.63,-2627.75,319.933,-0.890118,0,0,-0.430511,0.902585)
    ,(554,309,0,-5594.03,-489.786,397.693,1.5708,0,0,0.707107,0.707107)
    ,(555,310,0,-5592.13,-489.765,397.682,-1.5708,0,0,-0.707107,0.707107)
    ,(556,311,0,-5356.59,-529.636,391.713,-2.41728,0,0,0.935135,-0.354291)
    ,(557,312,0,-5357.91,-528.192,391.713,0.724311,0,0,0.354291,0.935135)
    ,(558,313,0,-5357.88,-528.19,391.211,0.724311,0,0,0.354291,0.935135)
    ,(559,314,0,-5356.56,-528.312,391.688,-0.846485,0,0,-0.410719,0.911762)
    ,(560,315,0,-5263.36,-484.306,387.127,-2.80998,0,0,0.986286,-0.165048)
    ,(561,316,0,-5264.51,-483.682,387.144,1.90241,0,0,0.814116,0.580703)
    ,(562,317,0,-5264.56,-483.69,386.592,1.90241,0,0,0.814116,0.580703)
    ,(563,318,0,-5264.58,-483.697,386.039,1.90241,0,0,0.814116,0.580703)
    ,(564,376,0,-3231.32,-2453.92,15.5055,-1.75406,0,0,-0.768842,0.639439)
    ,(565,377,0,-3231.99,-2454.2,13.4941,-0.183258,0,0,-0.091501,0.995805)
    ,(566,378,0,-3231.02,-2454.87,14.9369,2.95833,0.001724,0.113517,0.989276,0.091894)
    ,(567,379,0,-3597.21,-2714.68,19.6138,2.522,0.029386,0.07754,0.949226,0.30347)
    ,(568,380,0,-3597.88,-2713.78,18.8364,-0.671953,0,0,-0.329691,0.944089)
    ,(569,381,0,-3600.88,-2714.84,18.5583,-3.14152,0.69436,0.117214,0.700446,-0.116196)
    ,(570,382,0,-3597.65,-2713.63,18.2805,-0.654499,0.038501,-0.022276,-0.320761,0.946115)
    ,(571,387,0,-2620.74,-2491.65,79.4416,1.66679,0,0,0.740218,0.672367)
    ,(572,388,0,-2620.21,-2490.75,78.7749,-1.4748,0.04784,-0.096226,-0.665556,0.738571)
    ,(573,389,0,-2621.4,-2491.45,80.2191,0.095993,0,0,0.047978,0.998848)
    ,(574,1162,0,-2621.21,-2491.46,77.9969,1.66679,0.089823,0.053697,0.738207,0.666407)
    ,(575,1564,0,-5507.56,-2050.34,399.597,0,0,0,0,1)
    ,(576,1565,0,-5508.53,-2051.25,399.61,1.5708,0,0,0.707107,0.707107)
    ,(577,1566,0,-5507.55,-2050.3,399.042,0,0,0,0,1)
    ,(578,1567,0,-5592.13,-489.771,397.072,-1.5708,0,0,-0.707107,0.707107)
    ,(579,1568,0,-5608.29,-1503.12,399.519,3.14159,0,0,1,0)
    ,(580,1569,0,-5608.28,-1501.34,399.493,0,0,0,0,1)
    ,(581,1570,0,-5608.29,-1501.34,398.99,0,0,0,0,1)
    ,(582,1572,0,-6239.47,315.57,383.198,1.5708,0,0,0.707107,0.707107)
    ,(583,1573,0,-5910.55,57.5189,372.987,3.14159,0,0,1,0)
    ,(584,1595,0,-9752.12,683.759,27.399,-1.50971,0,0,-0.685183,0.728371)
    ,(585,1596,0,-9753.13,684.66,27.4324,0.061086,0,0,0.030538,0.999534)
    ,(586,1597,0,-9752.96,682.686,27.4112,-3.0805,0,0,0.999534,-0.030539)
    ,(587,1598,0,-9752.95,682.683,26.8579,-3.0805,0,0,0.999534,-0.030539)
    ,(588,1630,0,1938.4,1584.38,81.9161,-1.85878,0,0,-0.801254,0.598324)
    ,(589,1631,0,2199.82,1182.34,31.6977,2.13803,0,0,0.876727,0.480989)
    ,(590,1632,0,2199.82,1182.32,30.3105,2.13803,0,0,0.876727,0.480989)
    ,(591,1633,0,2208.14,1053.3,29.4228,2.08567,0,0,0.863836,0.503774)
    ,(592,1634,0,2210.21,1054.52,29.4134,-1.05592,0,0,-0.503774,0.863836)
    ,(593,1638,0,2200.22,1183.99,31.7502,0.558505,0,0,0.275637,0.961262)
    ,(594,1639,0,2208.55,1054.92,29.3639,0.532325,0,0,0.263031,0.964787)
    ,(595,1643,0,2188.94,660.645,33.1658,-2.522,0,0,0.952396,-0.304864)
    ,(596,1644,0,2187.56,662.604,31.8218,0.619591,0,0,0.304864,0.952396)
    ,(597,1645,0,2187.58,662.574,33.1829,0.619591,0,0,0.304864,0.952396)
    ,(598,1646,0,2217.73,259.581,32.9658,2.11185,0,0,0.870356,0.492424)
    ,(599,1647,0,2219.78,260.826,34.2528,-1.02975,0,0,-0.492424,0.870356)
    ,(600,1648,0,2219.77,260.808,32.9195,-1.02975,0,0,-0.492424,0.870356)
    ,(601,1649,0,2037.2,155.574,33.9039,2.31256,0,0,0.915311,0.402747)
    ,(602,1650,0,2037.14,155.523,32.5716,2.31256,0,0,0.915311,0.402747)
    ,(603,1651,0,2038.91,157.136,32.5245,-0.829032,0,0,-0.402747,0.915312)
    ,(604,1652,0,2038.89,157.162,33.8562,-0.829032,0,0,-0.402747,0.915312)
    ,(605,1653,0,2037.23,157.224,32.5644,0.741765,0,0,0.362438,0.932008)
    ,(606,1654,0,2028.62,53.3835,32.5893,0,0,0,0,1)
    ,(607,1655,0,2029.8,52.2057,33.867,-1.5708,0,0,-0.707107,0.707107)
    ,(608,1656,0,2028.64,51.0382,33.8673,3.14159,0,0,1,0)
    ,(609,1657,0,2659.37,-639.66,109.284,-2.81871,0,0,0.986996,-0.160743)
    ,(610,1658,0,1981.24,248.245,36.9923,-2.62672,0,0,0.967046,-0.254602)
    ,(611,1659,0,1981.36,248.159,35.5948,-2.62672,0,0,0.967046,-0.254602)
    ,(612,1660,0,1980.1,250.336,37.0608,0.514872,0,0,0.254602,0.967046)
    ,(613,1661,0,2208.14,1053.3,28.0898,2.08567,0,0,0.863836,0.503774)
    ,(614,1662,0,2188.92,660.634,31.8302,-2.522,0,0,0.952396,-0.304864)
    ,(615,1663,0,2217.72,259.555,34.2424,2.11185,0,0,0.870356,0.492424)
    ,(616,1664,0,2037.23,157.224,33.8977,0.741765,0,0,0.362438,0.932008)
    ,(617,1665,0,2028.6,53.3481,33.8673,0,0,0,0,1)
    ,(618,1666,0,1979.63,248.687,37.0391,2.08567,0,0,0.863835,0.503775)
    ,(619,1668,0,-3597.3,-2714.84,17.5196,2.47837,0.032618,0.09473,0.940761,0.32393)
    ,(620,1669,0,-3231.02,-2454.8,14.3332,2.95833,0.00877,0.095444,0.99122,0.09108)
    ,(621,1674,0,-5262.73,-483.056,387.135,-1.23918,0,0,-0.580703,0.814115)
    ,(622,1675,0,1292.7,1078.13,53.6442,0.724311,0,0,0.354291,0.935135)
    ,(623,1676,0,1292.71,1078.12,53.1458,0.733039,0,0,0.358368,0.933581)
    ,(624,1677,0,1292.74,1078.11,53.6475,-2.41728,0,0,0.935135,-0.354291)
    ,(625,1678,0,639.812,1290.94,86.0389,2.19039,0,0,0.889017,0.457874)
    ,(626,1679,0,639.842,1290.95,85.5373,2.19039,0,0,0.889017,0.457874)
    ,(627,1680,0,639.839,1290.94,85.0389,2.19039,0,0,0.889017,0.457874)
    ,(628,1681,0,639.938,1291.03,86.034,-0.951205,0,0,-0.457874,0.889017)
    ,(629,1686,0,639.83,1291,86.0111,0.610866,0,0,0.300706,0.953717)
    ,(630,1687,0,342.817,1249.18,81.2382,-1.8675,0,0,-0.803857,0.594823)
    ,(631,1688,0,342.817,1249.18,80.7382,-1.8675,0,0,-0.803857,0.594823)
    ,(632,1689,0,342.653,1249.23,81.2299,1.27409,0,0,0.594823,0.803857)
    ,(633,1690,0,342.674,1249.23,80.7299,1.27409,0,0,0.594823,0.803857)
    ,(634,1691,0,342.674,1249.23,80.2299,1.27409,0,0,0.594823,0.803857)
    ,(635,1692,0,340.22,1249.68,80.8974,2.76636,0.68659,0.001571,0.72691,0.013906)
    ,(636,1693,0,-138.245,1182.22,63.9376,3.14159,0,0,1,0)
    ,(637,1694,0,-138.215,1182.31,63.9358,-1.5708,0,0,-0.707107,0.707107)
    ,(638,1695,0,-138.358,1182.31,63.9459,1.5708,0,0,0.707107,0.707107)
    ,(639,1696,0,-138.333,1182.32,63.4442,1.5708,0,0,0.707107,0.707107)
    ,(640,1697,0,-138.235,1182.3,63.4372,-1.5708,0,0,-0.707107,0.707107)
    ,(641,1698,0,-138.331,1182.32,62.944,1.5708,0,0,0.707107,0.707107)
    ,(642,1699,0,-138.325,1182.32,62.4436,1.5708,0,0,0.707107,0.707107)
    ,(643,1700,0,-140.429,872.05,63.2351,0,0,0,0,1)
    ,(644,1701,0,-140.427,872.057,62.7348,0,0,0,0,1)
    ,(645,1702,0,-140.42,872.052,62.2349,0,0,0,0,1)
    ,(646,1703,0,-140.413,872.051,61.7348,0,0,0,0,1)
    ,(647,1704,0,-140.519,871.971,63.2393,1.5708,0,0,0.707107,0.707107)
    ,(648,1705,0,-362.578,1185.08,65.4052,0,0,0,0,1)
    ,(649,1706,0,-362.583,1185.07,64.9056,0,0,0,0,1)
    ,(650,1707,0,-362.572,1185.07,64.405,0,0,0,0,1)
    ,(651,1708,0,-362.612,1185.03,65.4082,-1.5708,0,0,-0.707107,0.707107)
    ,(652,1709,0,-362.617,1185.01,64.9082,-1.5708,0,0,-0.707107,0.707107)
    ,(653,1710,0,-362.606,1185.03,65.4072,1.5708,0,0,0.707107,0.707107)
    ,(654,1711,0,-358.386,1313.26,36.0851,2.02458,0,0,0.848048,0.529919)
    ,(655,1712,0,-358.349,1313.27,36.0801,-2.68781,0,0,0.97437,-0.224951)
    ,(656,1713,0,-358.349,1313.27,35.5801,-2.68781,0,0,0.97437,-0.224951)
    ,(657,1714,0,-358.347,1313.35,36.0834,-1.11701,0,0,-0.529919,0.848048)
    ,(658,1715,0,-358.347,1313.35,35.5834,-1.11701,0,0,-0.529919,0.848048)
    ,(659,1771,0,-679.388,39.5997,47.5202,-3.0456,0,0,0.998848,-0.047978)
    ,(660,1772,0,-679.393,39.6136,46.963,-3.0456,0,0,0.998848,-0.047978)
    ,(661,1773,0,-679.173,39.7183,47.5566,-1.4748,0,0,-0.672367,0.740218)
    ,(662,1774,0,-679.382,39.8115,47.5202,0.095993,0,0,0.047978,0.998848)
    ,(663,1775,0,-429.708,-582.91,53.8973,3.14159,0,0,1,0)
    ,(664,1776,0,-429.721,-582.906,53.3415,3.14159,0,0,1,0)
    ,(665,1777,0,-429.705,-582.695,53.3441,0,0,0,0,1)
    ,(666,1778,0,-429.692,-582.698,53.9003,0,0,0,0,1)
    ,(667,1779,0,-429.868,-582.82,53.896,1.5708,0,0,0.707107,0.707107)
    ,(668,1780,0,-373.458,-771.21,54.5725,-2.12057,0,0,0.872496,-0.488621)
    ,(669,1781,0,-373.472,-771.203,54.0186,-2.12057,0,0,0.872496,-0.488621)
    ,(670,1782,0,-373.617,-771.097,54.0285,1.02102,0,0,0.488621,0.872496)
    ,(671,1783,0,-373.603,-771.104,54.5824,1.02102,0,0,0.488621,0.872496)
    ,(672,1784,0,-373.597,-771.243,54.0235,2.59181,0,0,0.962455,0.271441)
    ,(673,1785,0,-373.583,-771.25,54.5791,2.59181,0,0,0.962455,0.271441)
    ,(674,1786,0,-668.673,-1308.53,66.5191,2.57436,0,0,0.96005,0.279829)
    ,(675,1787,0,-668.68,-1308.52,65.908,2.57436,0,0,0.96005,0.279829)
    ,(676,1788,0,-668.593,-1308.38,65.9064,-0.567232,0,0,-0.279829,0.96005)
    ,(677,1789,0,-668.587,-1308.38,66.5175,-0.567232,0,0,-0.279829,0.96005)
    ,(678,1790,0,-668.587,-1308.5,66.5191,-2.13803,0,0,0.876727,-0.480989)
    ,(679,1791,0,-777.357,-1471.55,61.619,3.14159,0,0,1,0)
    ,(680,1792,0,-777.273,-1471.47,61.6364,-1.5708,0,0,-0.707107,0.707107)
    ,(681,1793,0,-777.486,-1471.47,61.6132,1.5708,0,0,0.707107,0.707107)
    ,(682,1794,0,-777.275,-1471.47,61.136,-1.5708,0,0,-0.707107,0.707107)
    ,(683,1795,0,-777.275,-1471.47,60.636,-1.5708,0,0,-0.707107,0.707107)
    ,(684,2016,0,-19.9443,-709.556,70.3188,3.14159,0,0,1,0)
    ,(685,2017,0,-19.8913,-709.505,70.3253,-1.5708,0,0,-0.707107,0.707107)
    ,(686,2018,0,-19.9027,-709.516,69.8239,-1.5708,0,0,-0.707107,0.707107)
    ,(687,2019,0,-19.9224,-709.515,69.2672,-1.5708,0,0,-0.707107,0.707107)
    ,(688,2020,0,-20.01,-709.538,69.2886,1.5708,0,0,0.707107,0.707107)
    ,(689,2021,0,-19.9902,-709.539,69.8441,1.5708,0,0,0.707107,0.707107)
    ,(690,2022,0,-19.9788,-709.529,70.318,1.5708,0,0,0.707107,0.707107)
    ,(691,2023,0,455.827,-628.813,167.55,2.96706,0,0,0.996195,0.087156)
    ,(692,2024,0,452.427,-629.573,166.348,2.90598,0.576802,-0.173584,0.779713,0.170927)
    ,(693,2025,0,455.836,-628.784,167.56,-0.18326,0,0,-0.091502,0.995805)
    ,(694,2026,0,455.859,-628.778,167.57,1.38754,0,0,0.639439,0.768842)
    ,(695,2027,0,638.134,-966.654,164.827,3.14159,0,0,1,0)
    ,(696,2028,0,638.187,-966.647,164.827,-1.5708,0,0,-0.707107,0.707107)
    ,(697,2029,0,638.149,-966.611,164.826,0,0,0,0,1)
    ,(698,2030,0,758.712,-1467.83,78.6684,1.4399,0,0,0.659346,0.75184)
    ,(699,2031,0,758.73,-1467.82,78.6634,-1.7017,0,0,-0.75184,0.659346)
    ,(700,2032,0,758.998,-1467.18,78.8067,3.01942,-0.010186,-0.095401,0.993556,0.060349)
    ,(701,2033,0,2374.47,1263.36,31.3438,2.7838,0,0,0.984041,0.177944)
    ,(702,2034,0,2374.4,1263.28,29.9549,2.7838,0,0,0.984041,0.177944)
    ,(703,2035,0,2373.78,1264.78,31.3421,1.213,0,0,0.569997,0.821647)
    ,(704,2036,0,2349.64,1071.89,39.3799,-1.5708,0,0,-0.707107,0.707107)
    ,(705,2037,0,2347.31,1071.91,39.3924,1.5708,0,0,0.707107,0.707107)
    ,(706,2038,0,2347.27,1071.89,38.0578,1.5708,0,0,0.707107,0.707107)
    ,(707,2048,0,-549.538,727.129,91.1026,2.90597,0,0,0.993068,0.117537)
    ,(708,2049,0,-549.49,727.23,91.0993,-0.235619,0,0,-0.117537,0.993068)
    ,(709,2050,0,-549.49,727.23,90.5437,-0.235619,0,0,-0.117537,0.993068)
    ,(710,2051,0,-549.466,727.231,89.9898,-0.235619,0,0,-0.117537,0.993068)
    ,(711,2052,0,-549.489,727.179,91.1012,-1.80642,0,0,-0.785317,0.619094)
    ,(712,2096,0,-8912.03,793.973,87.402,-2.46964,0,0,0.944089,-0.329691)
    ,(713,2098,0,-8439.52,650.014,93.5751,0.663226,0,0,0.325568,0.945518)
    ,(714,2099,0,-8779.16,666.68,104.139,-0.898844,0,0,-0.434445,0.900698)
    ,(715,2100,0,-8773.94,612.498,97.9492,-2.35619,0,0,0.923879,-0.382684)
    ,(716,2101,0,-8822.23,673.832,98.4552,0.471239,0,0,0.233446,0.97237)
    ,(717,2102,0,-8559.69,670.721,97.824,0.663226,0,0,0.325568,0.945518)
    ,(718,2105,0,-8701.68,712.724,97.6471,-0.90757,0,0,-0.438371,0.898794)
    ,(719,2106,0,-8685.02,880.659,97.0163,3.81599,0,0,0.944089,-0.329691)
    ,(720,2108,0,-8690.85,472.162,96.2616,0.663226,0,0,0.325568,0.945518)
    ,(721,2109,0,-8816.2,498.888,101.957,-0.898844,0,0,-0.434445,0.900698)
    ,(722,2110,0,-8828.66,616.828,94.162,-0.898844,0,0,-0.434445,0.900698)
    ,(723,2110,0,-8825.39,957.519,99.1419,0,0,0,0.941176,-0.337917)
    ,(724,2110,0,-8726.26,892.714,100.373,0,0,0,0.941176,-0.337917)
    ,(725,2110,0,-8704.89,865.731,96.3459,0,0,0,0.941176,-0.337917)
    ,(726,2110,0,-8508.42,659.92,100.065,0,0,0,0.296542,0.95502)
    ,(727,2111,0,-8752.45,551.908,96.9932,0.916297,0,0,0.442288,0.896873)
    ,(728,2111,0,-8706.68,866.017,97.2,0,0,0,0.904455,0.426568)
    ,(729,2112,0,-8828.86,614.998,93.5619,-2.46964,0,0,0.944089,-0.329691)
    ,(730,2112,0,-8508.63,658.015,99.8079,0,0,0,0.884987,0.465615)
    ,(731,2113,0,-8735.72,704.757,98.0946,-2.45219,0,0,0.941176,-0.337917)
    ,(732,2115,0,-8723.86,517.518,96.5355,0.637046,0,0,0.313164,0.949699)
    ,(733,2116,0,-8750.63,552.148,97.5932,-0.654498,0,0,-0.321439,0.94693)
    ,(734,2117,0,-8615.97,520.134,102.477,-2.36492,0,0,0.92554,-0.378649)
    ,(735,2119,0,-8750.38,550.322,96.9932,-2.2253,0,0,0.896873,-0.442288)
    ,(736,2120,0,-8577.29,534.76,101.237,-2.6529,0,0,0.970296,-0.241922)
    ,(737,2122,0,-8839.73,728.599,97.0075,-2.62672,0,0,0.967046,-0.254602)
    ,(738,2123,0,-8798.77,580.375,95.4652,-0.898844,0,0,-0.434445,0.900698)
    ,(739,2124,0,-8845.37,923.024,101.638,1.96351,0,0,0.831475,0.555563)
    ,(740,2124,0,-8830.48,617.036,93.5619,0.671952,0,0,0.329691,0.944089)
    ,(741,2124,0,-8827,957.504,99.847,2.26,0,0,0.904455,0.426568)
    ,(742,2124,0,-8727.91,892.832,100.376,0,0,0,0.904455,0.426568)
    ,(743,2125,0,-8617.8,521.992,102.477,0.776672,0,0,0.378649,0.925541)
    ,(744,2127,0,-8737.38,706.766,98.0946,0.689406,0,0,0.337917,0.941176)
    ,(745,2128,0,-8843.62,922.392,101.183,-2.64417,0,0,-0.969231,0.246154)
    ,(746,2129,0,-8578.51,537.059,101.237,0.488692,0,0,0.241922,0.970296)
    ,(747,2131,0,-8508.36,659.896,99.9641,0.602138,0,0,0.296541,0.95502)
    ,(748,2133,0,-8538.78,681.127,97.7989,2.2602,0,0,0.904455,0.426568)
    ,(749,2134,0,-8839.24,730.373,97.2851,-1.05592,0,0,-0.503774,0.863836)
    ,(750,2136,0,-8722.32,515.438,96.7327,-2.50455,0,0,0.949699,-0.313164)
    ,(751,2138,0,-8801.26,685.201,105.043,-1.7366,0,0,-0.763232,0.646124)
    ,(752,2139,0,-8800.81,629.267,97.3194,2.25147,0,0,0.902585,0.430511)
    ,(753,2140,0,-8538.6,682.959,97.1988,0.689406,0,0,0.337917,0.941176)
    ,(754,2141,0,-8728.06,892.761,101.164,2.2602,0,0,0.904455,0.426568)
    ,(755,2142,0,-8830.69,615.207,94.162,2.24275,0,0,0.900698,0.434445)
    ,(756,2143,0,-8617.82,520.15,103.077,2.34747,0,0,0.922201,0.386711)
    ,(757,2145,0,-8877.12,644.33,99.9724,0.471239,0,0,0.233446,0.97237)
    ,(758,2146,0,-8834.74,613.107,100.341,2.46092,0,0,0.942642,0.333806)
    ,(759,2150,0,-8664.27,496.432,104.12,-1.69297,0,0,-0.748956,0.66262)
    ,(760,2152,0,-8636.66,427.751,107.94,2.23402,0,0,0.898794,0.438371)
    ,(761,2153,0,-8649.6,433.767,107.404,-0.898844,0,0,-0.434445,0.900698)
    ,(762,2154,0,-8715.09,457.635,102.051,-0.90757,0,0,-0.438371,0.898794)
    ,(763,2155,0,-8673.01,402.956,108.793,2.24275,0,0,0.900698,0.434446)
    ,(764,2156,0,-8706.44,400.225,105.812,1.02974,0,0,0.492424,0.870356)
    ,(765,2157,0,-8616.35,872.018,106,0,0,0,0,1)
    ,(766,2157,0,-8616.12,872.51,99.485,-0.898843,0,0,-0.434445,0.900699)
    ,(767,2158,0,-8661.74,779.927,102.73,-0.898844,0,0,-0.434445,0.900698)
    ,(768,2159,0,-8565.34,738.994,103.01,2.24275,0,0,0.900698,0.434446)
    ,(769,2160,0,-8575.77,719.845,98.2461,2.24275,0,0,0.900698,0.434446)
    ,(770,2161,0,-8936.26,778.732,90.6729,-1.309,0,0,-0.608762,0.793353)
    ,(771,2162,0,-8882.87,813.153,93.5343,2.97579,0,0,0.996565,0.082808)
    ,(772,2163,0,-8957.49,888.772,108.748,-2.53073,0,0,0.953717,-0.300706)
    ,(773,2164,0,-8943.47,981.937,123.953,-0.942478,0,0,-0.453991,0.891007)
    ,(774,2165,0,-8902,975.424,131.756,0,0,0,1,0)
    ,(775,2166,0,-8979.59,771.453,97.1008,0.951204,0,0,0.457874,0.889017)
    ,(776,2167,0,-9005.54,948.967,118.524,2.61799,0,0,0.965926,0.258819)
    ,(777,2169,0,-9036.7,842.991,109.076,0.410153,0,0,0.203642,0.979045)
    ,(778,2171,0,-8827.23,957.506,99.847,2.2602,0,0,0.904454,0.426571)
    ,(779,2173,0,-8735.54,706.589,98.6947,-0.881392,0,0,-0.426569,0.904455)
    ,(780,2175,0,-8711.34,725.77,97.6882,-0.881392,0,0,-0.426569,0.904455)
    ,(781,2176,0,-8873.72,752.429,96.1492,-2.3911,0,0,0.930417,-0.366501)
    ,(782,2177,0,-8704,860.712,100.741,2.243,0,0,0.900698,0.434446)
    ,(783,2178,0,-8845.38,922.915,101.783,2.06821,0,0,0.859406,0.511295)
    ,(784,2179,0,-8704.93,865.783,96.7633,-2.45218,0,0,-0.941175,0.33792)
    ,(785,2181,0,-8875.49,754.334,95.8672,0.750492,0,0,0.366501,0.930417)
    ,(786,2182,0,-8737.55,704.933,98.6947,2.2602,0,0,0.904455,0.426568)
    ,(787,2186,0,-8726.22,892.585,100.563,-2.45218,0,0,-0.941175,0.337918)
    ,(788,2187,0,-8713.35,724.114,97.6882,2.2602,0,0,0.904455,0.426568)
    ,(789,2189,0,-8579.05,535.299,101.837,2.05949,0,0,0.857167,0.515038)
    ,(790,2190,0,-8798.77,580.375,96.7434,-0.898844,0,0,-0.434445,0.900698)
    ,(791,2191,0,-8706.76,865.96,97.3634,2.2602,0,0,0.904455,0.426569)
    ,(792,2670,0,-2227.42,-2459.27,81.662,1.7017,0,0,0.75184,0.659346)
    ,(793,2672,0,-2227.2,-2459.25,81.6604,-1.4399,0,0,-0.659346,0.75184)
    ,(794,2673,0,-1553.61,-2490.54,55.0079,1.69297,0,0,0.748956,0.66262)
    ,(795,2674,0,-1553.61,-2490.55,54.4507,1.69297,0,0,0.748956,0.66262)
    ,(796,2675,0,-1553.37,-2490.52,54.991,-1.44862,0,0,-0.66262,0.748956)
    ,(797,2676,0,-1322.22,-1848.66,63.2896,2.76635,0,0,0.98245,0.186524)
    ,(798,2677,0,-1322.22,-1848.65,62.7341,2.76635,0,0,0.98245,0.186524)
    ,(799,2678,0,-1322.17,-1848.47,63.3045,-0.375246,0,0,-0.186524,0.98245)
    ,(800,2679,0,-1322.29,-1848.53,63.3485,1.19555,0,0,0.562805,0.82659)
    ,(801,2680,0,-1553.45,-2490.7,54.9662,-3.0456,0,0,0.998848,-0.047978)
    ,(802,2681,0,-1566.79,-2697.94,34.7449,-3.13287,0,0,0.99999,-0.004363)
    ,(803,2682,0,-1566.79,-2697.78,34.7197,0.008726,0,0,0.004363,0.99999)
    ,(804,2683,0,-1246.21,-3229.96,35.0624,-2.19912,0,0,0.891007,-0.45399)
    ,(805,2684,0,-1246.41,-3229.84,35.0363,0.942479,0,0,0.453991,0.891007)
    ,(806,2685,0,-1456.39,-2432.93,59.1948,-2.87979,0.022529,0.02936,0.990676,-0.131116)
    ,(807,2968,1,-1416.95,87.1512,18.7106,0.767946,0,0,0.374607,0.927184)
    ,(808,2969,1,-2309.82,-599.078,-7.03527,-2.34747,0,0,0.922201,-0.38671)
    ,(809,2970,1,-2311.99,-599.909,-7.03527,-0.209441,0,0,-0.104529,0.994522)
    ,(810,2971,1,-2310.76,-601.521,-7.03527,1.51844,0,0,0.688354,0.725374)
    ,(811,2972,1,-2311.98,-599.904,-7.8686,-0.209441,0,0,-0.104529,0.994522)
    ,(812,2973,1,-2472.82,-492.043,-6.20265,-0.811578,0,0,-0.394744,0.918791)
    ,(813,2974,1,-2470.78,-493.887,-6.20265,2.33001,0,0,0.918791,0.394745)
    ,(814,2975,1,-2470.91,-491.974,-6.20265,-2.38238,0,0,0.92881,-0.370557)
    ,(815,2976,1,-2470.78,-493.885,-7.03598,2.33001,0,0,0.918791,0.394745)
    ,(816,2977,1,-2969.98,200.04,74.8646,0.523597,0,0,0.258818,0.965926)
    ,(817,2978,1,-2967.69,201.644,74.8337,-2.618,0,0,0.965926,-0.258818)
    ,(818,3194,1,-2965.6,-263.16,55.3713,-0.07854,0,0,-0.03926,0.999229)
    ,(819,3195,1,-1415.05,89.3264,18.658,-2.36492,0,0,0.925541,-0.378648)
    ,(820,3196,1,-1793,-17.6701,-7.20197,-2.85361,0,0,0.989651,-0.143493)
    ,(821,3197,1,-1795.67,-18.6726,-7.14825,0.28798,0,0,0.143493,0.989651)
    ,(822,3198,1,-2376.43,-901.556,-6.59151,-1.72788,0,0,-0.760406,0.649448)
    ,(823,3199,1,-2376.61,-904.266,-6.53595,1.41372,0,0,0.649448,0.760406)
    ,(824,3202,0,-12167.9,-229.592,33.2801,2.57436,0,0,0.96005,0.279829)
    ,(825,3203,0,-12167.7,-230.059,32.3428,-2.01586,0,0,-0.845728,0.533615)
    ,(826,3204,0,-12167.7,-230.078,33.2859,-2.01586,0,0,-0.845728,0.533615)
    ,(827,3205,0,-12205.8,-536.642,29.1945,2.47837,0.05583,0.08211,0.94166,0.321586)
    ,(828,3206,0,-12205.6,-536.295,27.9034,2.47837,0.033132,0.002429,0.945127,0.32501)
    ,(829,3207,0,-12205.7,-535.45,29.8627,-0.663225,0.062972,-0.044691,-0.323067,0.94322)
    ,(830,3208,0,-13338.2,67.869,25.7289,2.29511,0,0,0.911762,0.410719)
    ,(831,3209,0,-13337.7,67.4761,25.6483,-0.846485,0,0,-0.410719,0.911762)
    ,(832,3210,0,-13337.6,67.9838,25.7992,0.724311,0,0,0.354291,0.935135)
    ,(833,3211,0,-13331.6,62.018,23.2462,-2.41728,0,0,0.935135,-0.354291)
    ,(834,3212,0,-13332.1,61.8614,21.7726,0.776671,0.08197,-0.0511,0.380991,0.919519)
    ,(835,3213,0,-13332.6,62.0445,22.5802,-0.846485,0,0,-0.410719,0.911762)
    ,(836,3214,0,-14253.9,301.953,30.4719,-1.49226,0,0,-0.678801,0.734323)
    ,(837,3215,0,-14253.9,301.969,29.6402,-1.49226,0,0,-0.678801,0.734323)
    ,(838,3216,0,-14238.8,301.408,27.872,3.12414,0,0,0.999962,0.008727)
    ,(839,3217,0,-14238.8,301.05,27.1206,3.12414,-0.003861,0.056728,0.998342,0.00896)
    ,(840,3224,1,1303.61,-4397.36,29.1405,-3.11541,0,0,0.999914,-0.01309)
    ,(841,3225,1,285.148,-3992.02,36.1008,-1.66679,0,0,-0.740218,0.672367)
    ,(842,3226,1,306.623,-4741.73,12.8672,0.034906,0,0,0.017452,0.999848)
    ,(843,3227,1,305.829,-4741.75,12.8513,-3.10669,0,0,0.999848,-0.017452)
    ,(844,3228,1,306.174,-4741.32,12.8754,1.6057,0,0,0.71934,0.694658)
    ,(845,3229,1,-94.8737,-4739.08,24.7169,3.14159,0,0,1,1.26759E-006)
    ,(846,3230,1,-94.0994,-4739,24.664,0,0,0,0,1)
    ,(847,3231,1,-591.935,-4300.3,40.3764,-1.71915,0,0,-0.757565,0.65276)
    ,(848,3232,1,-602.694,-4708.82,38.039,-0.610866,0,0,-0.300706,0.953717)
    ,(849,3233,1,-603.055,-4708.28,38.1149,1.75406,0,0,0.768842,0.639439)
    ,(850,3234,1,285.149,-3991.99,35.321,-1.66679,0,0,-0.740218,0.672367)
    ,(851,3235,1,-94.1309,-4739,23.8332,0,0,0,0,1)
    ,(852,3276,1,-603.328,-4708.8,38.0548,-2.85361,0,0,0.989651,-0.143493)
    ,(853,3314,1,285.201,-3991.19,36.0398,1.4748,0,0,0.672367,0.740218)
    ,(854,4097,1,-452.225,-2664.52,98.1168,1.5708,0,0,0.707107,0.707107)
    ,(855,4098,1,-450.996,-2663.02,98.0716,3.14159,0,0,1,0)
    ,(856,4099,1,-453.703,-2663.27,98.0783,0,0,0,0,1)
    ,(857,4100,1,-452.417,-2661.85,98.0802,-1.5708,0,0,-0.707107,0.707107)
    ,(858,4101,1,-958.231,-3680.35,10.4625,-1.6057,0,0,-0.71934,0.694658)
    ,(859,4102,1,-532.68,-1571.91,94.0003,1.5708,0,0,0.707107,0.707107)
    ,(860,4103,1,-532.872,-1569.25,94.0003,-1.5708,0,0,-0.707107,0.707107)
    ,(861,4104,1,-450.997,-2663.03,97.2389,3.14159,0,0,1,0)
    ,(862,4105,1,-453.739,-2663.27,97.2993,0,0,0,0,1)
    ,(863,4106,1,-453.727,-2663.26,96.4664,0,0,0,0,1)
    ,(864,4115,1,-2286.44,-2170.93,98.5244,2.58309,0,0,0.961262,0.275637)
    ,(865,4116,1,-2288.93,-2171.02,98.5914,0.41888,0,0,0.207912,0.978148)
    ,(866,4117,1,-2287.78,-2168.84,98.638,-1.56207,0,0,-0.704015,0.710185)
    ,(867,4118,1,-2288.92,-2171.02,97.758,0.41888,0,0,0.207912,0.978148)
    ,(868,4119,1,-2286.46,-2170.92,97.7478,2.58309,0,0,0.961262,0.275637)
    ,(869,4120,1,-3475.83,-2045.37,99.081,3.14159,0,0,1,0)
    ,(870,4121,1,-3477.1,-2046.78,99.0788,1.5708,0,0,0.707107,0.707107)
    ,(871,4122,1,-3478.57,-2045.6,99.0567,0,0,0,0,1)
    ,(872,4123,1,-3475.8,-2045.37,98.2476,3.14159,0,0,1,0)
    ,(873,4132,1,48.1721,-2707.77,94.0063,3.14159,0,0,1,0)
    ,(874,4133,1,45.4641,-2708.02,94.0023,0,0,0,0,1)
    ,(875,4134,1,46.9428,-2709.26,94.0014,1.5708,0,0,0.707107,0.707107)
    ,(876,4135,1,313.794,-3599.11,29.2574,-0.820305,0,0,-0.398749,0.91706)
    ,(877,4136,1,314.786,-3601.51,29.3037,1.53589,0,0,0.694658,0.71934)
    ,(878,4137,1,313.828,-3599.14,28.4809,-0.829032,0,0,-0.402747,0.915311)
    ,(879,4138,1,45.4774,-2708.01,93.169,0,0,0,0,1)
    ,(880,10082,0,-8879.98,567.066,93.3457,-0.898844,0,0,-0.434445,0.900698)
    ,(881,10083,0,-8882.02,565.445,93.3457,2.24275,0,0,0.900698,0.434445)
    ,(882,12351,1,10374.6,743.243,1322.15,2.25147,0,0,0.902585,0.430511)
    ,(883,12352,1,10374.6,743.265,1321.53,2.25147,0,0,0.902585,0.430511)
    ,(884,12353,1,9955.03,659.749,1310.21,-2.33001,0,0,0.918791,-0.394744)
    ,(885,12354,1,9955.03,659.749,1309.54,-2.33001,0,0,0.918791,-0.394744)
    ,(886,12355,1,9954.96,659.806,1310.21,2.38238,0,0,0.92881,0.370557)
    ,(887,12356,1,9955.04,659.796,1310.21,0.811578,0,0,0.394744,0.918791)
    ,(888,12357,1,9955.04,659.783,1309.6,0.811578,0,0,0.394744,0.918791)
    ,(889,12358,1,9891.84,919.78,1307.56,-2.81871,0,0,0.986996,-0.160743)
    ,(890,12359,1,9891.84,919.77,1306.89,-2.81871,0,0,0.986996,-0.160743)
    ,(891,12360,1,9891.9,919.854,1306.9,0.322885,0,0,0.160742,0.986996)
    ,(892,12361,1,9891.89,919.883,1307.56,0.322885,0,0,0.160742,0.986996)
    ,(893,12362,1,9891.83,919.75,1306.17,-2.81871,0,0,0.986996,-0.160743)
    ,(894,12363,1,9891.89,919.882,1306.23,0.322885,0,0,0.160742,0.986996)
    ,(895,12364,1,10019.2,1825.5,1319.69,-2.46091,0,0,0.942641,-0.333807)
    ,(896,12365,1,10019.2,1825.55,1319.68,-0.890118,0,0,-0.430511,0.902585)
    ,(897,12366,1,10019.2,1825.56,1319.68,0.680678,0,0,0.333807,0.942641)
    ,(898,12893,1,4982.94,218.76,38.9663,3.14159,0,0,1,0)
    ,(899,12894,1,4983.03,218.745,38.9569,-1.5708,0,0,-0.707107,0.707107)
    ,(900,12895,1,4982.93,218.837,38.97,1.58825,0,0,0.71325,0.700909)
    ,(901,12896,1,4983.03,218.735,38.4009,-1.5708,0,0,-0.707107,0.707107)
    ,(902,12897,1,5633.76,324.24,19.9109,3.08923,0,0,0.999657,0.026177)
    ,(903,12898,1,5633.67,324.349,19.9763,1.51844,0,0,0.688355,0.725374)
    ,(904,12899,1,5633.67,324.349,19.3097,1.51844,0,0,0.688355,0.725374)
    ,(905,12900,1,5633.85,324.271,19.2931,-1.62315,0,0,-0.725374,0.688355)
    ,(906,12901,1,5633.85,324.271,19.9598,-1.62315,0,0,-0.725374,0.688355)
    ,(907,12902,1,6303.99,325.891,24.2252,3.14159,0,0,1,0)
    ,(908,12903,1,6303.99,325.891,23.6697,3.14159,0,0,1,0)
    ,(909,12904,1,6303.93,326.031,24.2229,1.5708,0,0,0.707107,0.707107)
    ,(910,12907,1,6817.33,48.4149,16.8365,3.14159,0,0,1,0)
    ,(911,12908,1,6817.33,48.5573,16.8473,0,0,0,0,1)
    ,(912,12909,1,6817.28,48.5405,16.8449,1.5708,0,0,0.707107,0.707107)
    ,(913,13348,1,3230.7,233.382,10.2093,-1.5708,0,0,-0.707107,0.707107)
    ,(914,13349,1,3230.65,233.422,10.2228,1.5708,0,0,0.707107,0.707107)
    ,(915,13350,1,2834.15,158.17,102.281,2.74017,0,0,0.979925,0.199368)
    ,(916,13351,1,2834.15,158.123,102.271,-0.401426,0,0,-0.199368,0.979925)
    ,(917,13352,1,2834.15,158.17,102.281,1.16937,0,0,0.551937,0.833886)
    ,(918,13353,1,3230.65,233.422,9.33445,1.5708,0,0,0.707107,0.707107)
    ,(919,13354,1,2797.61,-298.651,107.244,-0.497418,0,0,-0.246153,0.969231)
    ,(920,13355,1,2797.62,-298.643,106.633,-0.497418,0,0,-0.246153,0.969231)
    ,(921,13356,1,2667.99,-417.024,107.425,2.19039,0,0,0.889017,0.457874)
    ,(922,13357,1,2668,-417.037,106.812,2.19039,0,0,0.889017,0.457874)
    ,(923,13358,1,2668.04,-416.99,106.094,2.19039,0,0,0.889017,0.457874)
    ,(924,13405,1,2270.18,-1739.42,112.596,-2.92343,0,0,0.994056,-0.108867)
    ,(925,13406,1,2270.15,-1739.35,112.6,0.218166,0,0,0.108867,0.994056)
    ,(926,13407,1,2270.17,-1739.4,112.596,1.78896,0,0,0.779884,0.625924)
    ,(927,13408,1,2270.17,-1739.39,111.986,1.78896,0,0,0.779884,0.625924)
    ,(928,13409,1,1937.49,-2172,94.4651,3.14159,0,0,1,0)
    ,(929,13410,1,1937.48,-2171.9,94.4654,1.5708,0,0,0.707107,0.707107)
    ,(930,13411,1,1937.5,-2171.93,94.4663,0,0,0,0,1)
    ,(931,13412,1,1937.5,-2171.93,93.8552,0,0,0,0,1)
    ,(932,16396,0,-9979.23,1007.14,31.1373,0.02618,0.087148,0.001141,0.01304,0.996109)
    ,(933,18033,1,-2348.22,-1910.58,98.1714,-1.5708,0,0,-0.707107,0.707107)
    ,(934,18034,1,-2348,-1913.21,98.1968,1.5708,0,0,0.707107,0.707107)
    ,(935,19028,0,2654.7,-633.416,108.547,0.209439,0,0,0.104528,0.994522)
    ,(936,19033,1,-1795.64,-18.6446,-8.20775,0.305432,0,0,0.152123,0.988362)
    ,(937,19545,1,9988.92,1958.52,1326.17,3.14159,0,0,1,0)
    ,(938,19546,1,9988.91,1958.51,1325.56,3.14159,0,0,1,0)
    ,(939,19553,1,-247.695,-990.196,18.3119,-0.226892,0.077955,-0.008882,-0.112854,0.990509)
    ,(940,19554,1,-247.79,-990.699,16.2164,-0.174534,0,0,-0.087156,0.996195)
    ,(941,19555,1,-247.686,-990.168,17.7513,-0.226892,0.077955,-0.008882,-0.112854,0.990509)
    ,(942,19556,1,-247.622,-990.052,17.2348,-0.226892,0.10287,-0.020455,-0.111672,0.988195)
    ,(943,19557,1,-249.25,-992.101,16.4972,-1.22173,-0.143518,-0.084764,-0.574212,0.80156)
    ,(944,19558,1,92.3087,-55.575,22.1523,-0.698132,0.073728,-0.026835,-0.340966,0.936796)
    ,(945,19559,1,92.3294,-55.5541,21.6017,-0.698132,0.073728,-0.026835,-0.340966,0.936796)
    ,(946,19560,1,92.4392,-55.4797,21.1166,-0.69813,0.095253,-0.043904,-0.339276,0.934821)
    ,(947,19561,1,92.5894,-56.8869,19.968,2.36492,0.019279,0.081575,0.921872,0.378319)
    ,(948,19562,1,92.1316,-57.3277,19.4242,2.36492,0.063403,0.166318,0.910467,0.373321)
    ,(949,19563,1,603.942,326.386,47.2019,-3.01069,-0.005131,0.078291,0.994783,-0.065202)
    ,(950,19564,1,603.019,325.876,46.7247,1.67552,0.081867,0.084447,0.73833,0.664105)
    ,(951,19565,1,602.858,327.266,45.5181,0.095993,0.118016,-0.007345,0.049178,0.991766)
    ,(952,19566,1,602.785,327.066,44.9758,0.052359,0.082431,0.015208,0.025001,0.996167)
    ,(953,19567,1,602.769,327.7,44.4997,0.05236,0.177768,0.00895,0.024983,0.983715)
    ,(954,19568,1,603.36,325.836,46.0544,1.67552,0.034697,0.045045,0.741777,0.668232)
    ,(955,19569,1,633.42,359.589,52.0103,-3.08923,0.139589,0.115725,0.982528,-0.041978)
    ,(956,19570,1,633.265,359.896,51.3748,-3.08923,0.145749,0.068523,0.986307,-0.035498)
    ,(957,19571,1,633.123,359.458,50.9136,-3.08923,0.142918,0.137158,0.979124,-0.045578)
    ,(958,19572,1,1576.59,1026.5,137.053,-0.069812,0,0,-0.034899,0.999391)
    ,(959,19573,1,1576.64,1026.36,137.726,-1.64061,0,0,-0.731354,0.681998)
    ,(960,19574,1,1576.49,1026.46,137.741,1.50098,0,0,0.681998,0.731354)
    ,(961,19575,1,1576.49,1026.45,137.074,1.50098,0,0,0.681998,0.731354)
    ,(962,19576,1,1576.5,1026.46,136.404,1.50098,0,0,0.681998,0.731354)
    ,(963,19577,1,1576.05,1027.92,138.641,-0.122174,0,0,-0.061049,0.998135)
    ,(964,19578,1,2397.4,1168.34,311.887,-3.13287,0,0,0.99999,-0.004363)
    ,(965,19579,1,2397.41,1168.34,311.221,-3.13287,0,0,0.99999,-0.004363)
    ,(966,19580,1,2397.39,1168.35,310.554,-3.13287,0,0,0.99999,-0.004363)
    ,(967,19581,1,2397.48,1168.49,311.887,0.008726,0,0,0.004363,0.99999)
    ,(968,19583,1,101.517,-244.563,8.88794,3.14159,0,0,1,0)
    ,(969,19585,1,-248.933,-992.051,15.8189,-1.22173,-0.087965,-0.103015,-0.569735,0.810588)
    ,(970,19839,1,-4731.76,-1811.68,-43.1678,2.74889,0,0,0.980785,0.19509)
    ,(971,19840,1,-4734.31,-1810.87,-43.1542,-0.392698,0,0,-0.19509,0.980785)
    ,(972,19841,1,-4734.33,-1810.85,-44.0448,-0.392698,0,0,-0.19509,0.980785)
    ,(973,19842,1,-4971.38,-1716.99,-59.3457,-2.37365,0,0,0.927184,-0.374607)
    ,(974,19843,1,-4973.21,-1719.14,-59.3188,0.767946,0,0,0.374607,0.927184)
    ,(975,19844,1,-4971.3,-1718.92,-59.3792,2.33874,0,0,0.920505,0.390731)
    ,(976,19845,1,-4971.33,-1718.9,-60.2077,2.33874,0,0,0.920505,0.390731)
    ,(977,19846,1,-4973.23,-1719.17,-60.1576,0.767946,0,0,0.374607,0.927184)
    ,(978,19847,1,-4971.37,-1714.06,-61.3412,-0.802852,-0.314157,0.070458,-0.38768,0.863739)
    ,(979,19848,1,-5342.75,-2338.28,-44.836,0.122174,0,0,0.061049,0.998135)
    ,(980,19849,1,-5341.05,-2339.33,-44.8772,1.69297,0,0,0.748956,0.66262)
    ,(981,19850,1,-5341.03,-2339.36,-45.7039,1.69297,0,0,0.748956,0.66262)
    ,(982,19851,1,-5341.59,-2336.64,-44.8335,-1.44862,0,0,-0.66262,0.748956)
    ,(983,19852,1,-5341.58,-2336.67,-45.6602,-1.44862,0,0,-0.66262,0.748956)
    ,(984,19853,1,-5643.92,-3489.95,-54.9022,-2.11185,0,0,0.870356,-0.492423)
    ,(985,19854,1,-5643.93,-3489.95,-55.7911,-2.11185,0,0,0.870356,-0.492423)
    ,(986,19855,1,-5645.22,-3492.39,-54.9217,1.02975,0,0,0.492424,0.870356)
    ,(987,19856,1,-4389.27,-875.876,-57.4125,2.53073,0,0,0.953717,0.300706)
    ,(988,19857,1,-4389.27,-875.87,-58.0236,2.53073,0,0,0.953717,0.300706)
    ,(989,19858,1,-4389.35,-875.717,-57.478,0.959932,0,0,0.461749,0.887011)
    ,(990,19859,1,-4389.22,-875.852,-57.4648,-0.610866,0,0,-0.300706,0.953717)
    ,(991,19863,1,3230.68,233.375,10.2096,3.14159,0,0,1,0)
    ,(992,21053,1,-3583.8,-4305.53,6.54785,-1.00356,0,0,-0.480989,0.876727)
    ,(993,21054,1,-3583.81,-4305.52,5.9923,-1.00356,0,0,-0.480989,0.876727)
    ,(994,21055,1,-3583.81,-4305.49,5.4384,-1.00356,0,0,-0.480989,0.876727)
    ,(995,21056,1,-3583.86,-4305.61,6.53555,2.13803,0,0,0.876727,0.480989)
    ,(996,21057,1,-3677.8,-4399.56,11.2071,3.14159,0,0,1,0)
    ,(997,21058,1,-3677.79,-4399.55,10.7048,3.14159,0,0,1,0)
    ,(998,21059,1,-3677.09,-4397.97,11.1617,-0.837759,0,0,-0.406737,0.913545)
    ,(999,21060,1,-3687.77,-4472.92,12.3284,2.40855,0,0,0.93358,0.358368)
    ,(1000,21061,1,-3686.36,-4472.84,12.3634,-2.30383,0,0,0.913545,-0.406737)
    ,(1001,21062,1,-3686.51,-4471.49,12.3284,-0.698132,0,0,-0.34202,0.939693)
    ,(1002,21063,1,-3790.34,-4507.05,11.9246,-2.37365,0,0,0.927184,-0.374607)
    ,(1003,21064,1,-3790.35,-4507.04,11.369,-2.37365,0,0,0.927184,-0.374607)
    ,(1004,21065,1,-3791.75,-4507.05,11.8198,2.33874,0,0,0.920505,0.390731)
    ,(1005,21066,1,-3795.56,-4403.87,11.1222,2.31256,0,0,0.915312,0.402747)
    ,(1006,21067,1,-3795.58,-4403.87,10.5699,2.31256,0,0,0.915312,0.402747)
    ,(1007,21068,1,-3794.17,-4402.55,11.1374,-0.829032,0,0,-0.402747,0.915312)
    ,(1008,21069,1,-3417.2,-4173.47,10.3423,2.26893,0,0,0.906308,0.422618)
    ,(1009,21070,1,-3417.16,-4173.41,10.3418,0.698132,0,0,0.34202,0.939693)
    ,(1010,21071,1,-3417.04,-4173.36,10.2917,-0.872664,0,0,-0.422618,0.906308)
    ,(1011,21072,1,-3417.03,-4173.34,9.79174,-0.872664,0,0,-0.422618,0.906308)
    ,(1012,21073,1,-2822.02,-3416.97,34.1203,2.97579,0,0,0.996566,0.082808)
    ,(1013,21074,1,-2822.02,-3416.97,33.6203,2.97579,0,0,0.996566,0.082808)
    ,(1014,21075,1,-2822.12,-3416.87,34.1319,1.40499,0,0,0.646124,0.763233)
    ,(1015,21076,1,-2822.02,-3416.86,34.1365,-0.165806,0,0,-0.082808,0.996566)
    ,(1016,21077,1,-2822.03,-3416.84,33.6391,-0.165806,0,0,-0.082808,0.996566)
    ,(1017,21078,1,-3649.7,-2729.78,33.7866,-1.5708,0,0,-0.707107,0.707107)
    ,(1018,21079,1,-3649.69,-2729.78,33.2319,-1.5708,0,0,-0.707107,0.707107)
    ,(1019,21080,1,-3649.81,-2729.7,33.789,0,0,0,0,1)
    ,(1020,21081,1,-3649.81,-2729.71,33.2418,0,0,0,0,1)
    ,(1021,21082,1,-3367.02,-3031.36,34.2687,0.331614,0,0,0.165048,0.986286)
    ,(1022,21083,1,-3367.53,-3031.18,34.2382,1.90241,0,0,0.814116,0.580703)
    ,(1023,21084,1,-3367.55,-3031.16,33.4034,1.90241,0,0,0.814116,0.580703)
    ,(1024,21085,1,-3937.7,-2767.51,36.686,0,0,0,0,1)
    ,(1025,21086,1,-3937.73,-2767.52,35.7915,0,0,0,0,1)
    ,(1026,21087,1,-3938.55,-2767.51,36.6889,-3.13287,0,0,0.99999,-0.004363)
    ,(1027,21088,1,-4108.34,-2756.56,35.6594,1.44862,0,0,0.66262,0.748956)
    ,(1028,21089,1,-4108.27,-2756.6,34.7191,1.44862,0,0,0.66262,0.748956)
    ,(1029,21509,1,-3695.83,-2517.3,69.235,0.087266,0,0,0.043619,0.999048)
    ,(1030,23295,0,-8754.73,723.02,101.395,0.733039,0,0,0.358368,0.93358)
    ,(1031,23296,0,-8980.3,823.3,113,2.286,0,0,0.858475,0.512855)
    ,(1032,23299,0,-8898,909.436,110.7,-1,0,0,-0.515038,0.857167)
    ,(1033,23299,0,-8707,909.093,102.03,0.681,0,0,0.333807,0.942642)
    ,(1034,23300,0,-8897.94,909.438,110.7,-1.0821,0,0,-0.515038,0.857168)
    ,(1035,23301,0,-8808,938.99,101.841,-0.90757,0,0,-0.438371,0.898794)
    ,(1036,24715,0,-8873.65,754.27,96.4673,-0.820306,0,0,-0.39875,0.91706)
    ,(1037,24715,0,-8825.26,958.985,98.9105,0,0,0,-0.426569,0.904455)
    ,(1038,24715,0,-8727.75,894.541,101,0,0,0,0.337917,0.941176)
    ,(1039,24715,0,-8706.5,867.59,96.763,0,0,0,0.337917,0.941176)
    ,(1040,24717,0,-8713.17,725.947,97.0882,0.689406,0,0,0.337917,0.941176)
    ,(1041,24718,0,-8706.59,867.792,96.7633,0.689404,0,0,0.337916,0.941176)
    ,(1042,24719,0,-8727.88,894.594,100.563,0.689404,0,0,0.337916,0.941176)
    ,(1043,24720,0,-8825.22,959.163,99.847,-0.88139,0,0,-0.426568,0.904455)
    ,(1044,24721,0,-8843.1,924.157,101.783,-1.07338,0,0,-0.511292,0.859407)
    ,(1045,25328,0,-8859.34,609.421,96.9478,-1.20428,0,0,-0.566406,0.824127)
    ,(1046,25336,0,-8620.57,515.031,115.383,0.671952,0,0,0.329691,0.944089)
    ,(1047,25337,0,-8604.14,494.379,115.383,0.671952,0,0,0.329691,0.944089)
    ,(1048,25338,0,-8688,885.325,103.556,2.243,0,0,0.900698,0.434446)
    ,(1049,25338,0,-8556.2,666.571,103.701,-0.898844,0,0,-0.434445,0.900698)
    ,(1050,25339,0,-8688,863.742,109.421,2.243,0,0,0.900698,0.434446)
    ,(1051,25339,0,-8667,880.121,109.421,2.243,0,0,0.900698,0.434446)
    ,(1052,25339,0,-8576.98,671.775,109.566,-0.898844,0,0,-0.434445,0.900698)
    ,(1053,25340,0,-8684.51,709.816,109.421,-2.46964,0,0,0.944089,-0.329691)
    ,(1054,25341,0,-8807,956.344,112.986,-2,0,0,0.944089,-0.329691)
    ,(1055,25341,0,-8791,935.929,112.986,-2,0,0,0.944089,-0.329691)
    ,(1056,25341,0,-8704,926.338,113.227,-1,0,0,-0.434445,0.900698)
    ,(1057,25342,0,-8812,935.573,108.294,-2,0,0,0.944089,-0.329691)
    ,(1058,25342,0,-8704,904.836,108.535,-1,0,0,-0.434445,0.900698)
    ,(1059,25346,0,-8730.09,500.055,107.884,2.24275,0,0,0.900698,0.434446)
    ,(1060,25347,0,-8709.44,516.483,107.884,2.24275,0,0,0.900698,0.434446)
    ,(1061,25348,0,-8893.7,749.804,105.477,-0.898844,0,0,-0.434445,0.900698)
    ,(1062,25348,0,-8864,943.259,114.328,0.506,0,0,0.25038,0.968148)
    ,(1063,25348,0,-8851,920.186,114.328,0.506,0,0,0.25038,0.968148)
    ,(1064,25349,0,-8873.05,766.226,105.477,-0.898844,0,0,-0.434445,0.900698)
    ,(1065,25350,0,-8863.89,943.261,114.328,0.506145,0,0,0.25038,0.968148)
    ,(1066,25351,0,-8851.11,920.188,114.328,0.506145,0,0,0.25038,0.968148)
    ,(1067,25353,0,-8812.22,935.575,108.294,-2.46964,0,0,-0.944089,0.329691)
    ,(1068,25354,0,-8790.71,935.931,112.986,-2.46964,0,0,-0.944089,0.329691)
    ,(1069,28027,0,-8722.04,517.246,96.743,-0.933752,0,0,-0.450099,0.892979)
    ,(1070,28027,0,-8506.57,659.499,99.8,5.29496,0,0,0.47425,-0.88039)
    ,(1071,28028,0,-8615.96,521.976,103.077,-0.794124,0,0,-0.386711,0.922201)
    ,(1072,28029,0,-8576.75,536.521,101.837,-1.0821,0,0,-0.515038,0.857167)
    ,(1073,28030,0,-8506.89,657.75,99.9641,-2.53945,0,0,0.95502,-0.296542)
    ,(1074,28031,0,-8536.95,680.95,97.1988,-2.45219,0,0,0.941176,-0.337917)
    ,(1075,28032,0,-8711.52,723.938,97.0882,-2.45219,0,0,0.941176,-0.337917)
    ,(1076,28033,0,-8649.44,475.237,102.919,-0.90757,0,0,-0.438371,0.898794)
    ,(1077,28034,0,-8547.07,499.24,99.3676,-0.898844,0,0,-0.434445,0.900698)
    ,(1078,28035,0,-8830.74,615.172,93.0378,2.24275,0,0,0.900698,0.434445)
    ,(1079,28035,0,-8706.7,866.008,96.167,0,0,0,0.904455,0.426568)
    ,(1080,28036,0,-8752.45,551.908,95.784,0.916297,0,0,0.442288,0.896873)
    ,(1081,28037,0,-8737.6,704.899,97.6625,2.2602,0,0,0.904455,0.426568)
    ,(1082,28038,0,-8538.83,681.087,96.6712,2.2602,0,0,0.904455,0.426568)
    ,(1083,28039,0,-8706.82,865.91,96.1668,2.2602,0,0,0.904455,0.426569)
    ,(1084,28040,0,-8713.38,724.094,96.6248,2.2602,0,0,0.904455,0.426568)
    ,(1085,28041,0,-8723.89,517.549,95.3567,0.637046,0,0,0.313164,0.949699)
    ,(1086,28042,0,-8873.67,752.364,95.1353,-2.3911,0,0,0.930417,-0.366501)
    ,(1087,28043,0,-8839.73,728.599,95.9198,-2.62672,0,0,0.967046,-0.254602)
    ,(1088,28044,0,-8530,495.845,111.292,-2,0,0,0.944089,-0.329691)
    ,(1089,28044,0,-8480,679.042,111.569,2.243,0,0,0.900698,0.434446)
    ,(1090,28044,0,-8459,695.656,111.569,2.243,0,0,0.900698,0.434446)
    ,(1091,28045,0,-8529.82,495.847,111.292,-2.46964,0,0,-0.944089,0.329691)
    ,(1092,28046,0,-8458.72,695.658,111.569,2.24275,0,0,0.900699,0.434444)
    ,(1093,28047,0,-8551.27,495.747,105.725,-2.46964,0,0,0.944089,-0.329691)
    ,(1094,32355,0,-4676.6,-938.842,503.998,-2.45219,0,0,0.941176,-0.337917)
    ,(1095,32383,0,-4675.36,-940.242,504.033,0.689404,0,0,0.337916,0.941176)
    ,(1096,32385,0,-4892.57,-899.248,504.012,-1.22173,0,0,-0.573576,0.819152)
    ,(1097,32424,0,-4890.83,-898.608,503.168,1.91986,0,0,0.819152,0.573576)
    ,(1098,32427,0,-4981.57,-972.54,504.03,2.53945,0,0,0.95502,0.296542)
    ,(1099,32431,0,-4982.63,-974.1,503.184,-0.602139,0,0,-0.296542,0.95502)
    ,(1100,33998,0,1595.85,382.093,-59.5498,-0.061087,0,0,-0.030539,0.999534)
    ,(1101,33999,0,1569.15,413.038,-58.5007,-1.52717,0,0,-0.691514,0.722363)
    ,(1102,34012,0,1520.24,365.819,-50.7368,-1.05592,0,0,-0.503774,0.863836)
    ,(1103,34013,0,1515.52,391.034,-49.425,-2.55691,0,0,0.957571,-0.288196)
    ,(1104,34357,369,146.438,27.883,0,-2,0,0,0.932796,-0.360404)
    ,(1105,36070,0,1596.28,300.245,-58.2333,-1.57952,0,0,-0.710186,0.704014)
    ,(1106,36071,0,1655.01,239.622,-59.6427,3.13287,0,0,0.99999,0.004363)
    ,(1107,36072,0,1595.68,382.005,-57.3161,-0.061087,0,0,-0.030539,0.999534)
    ,(1108,36073,0,1581.75,219.832,-56.0906,0.767946,0,0,0.374607,0.927184)
    ,(1109,36077,0,1596.33,300.568,-59.8403,-1.57952,0,0,-0.710186,0.704014)
    ,(1110,36078,0,1457.71,240.692,-58.0024,3.12414,0,0,0.999962,0.008726)
    ,(1111,36079,0,1540.27,292.398,-59.8545,0.776671,0,0,0.378648,0.925541)
    ,(1112,36080,0,1597.27,380.382,-58.0024,1.55334,0,0,0.700909,0.71325)
    ,(1113,36082,0,1650,184.332,-58.2235,0.776671,0,0,0.378648,0.925541)
    ,(1114,36083,0,1733.97,238.875,-58.0024,-0.069812,0,0,-0.034899,0.999391)
    ,(1115,36085,0,1594.94,102.178,-58.0024,-1.57952,0,0,-0.710186,0.704014)
    ,(1116,36086,0,1651.47,185.828,-59.8545,-2.36492,0,0,0.925541,-0.378648)
    ,(1117,36090,0,1735.61,237.529,-59.0787,1.55334,0,0,0.700909,0.71325)
    ,(1118,36091,0,1653.59,238.433,-58.9002,1.56207,0,0,0.704015,0.710185)
    ,(1119,36092,0,1596.68,100.578,-57.3161,3.10668,0,0,0.999848,0.017453)
    ,(1120,36093,0,1654.68,239.625,-58.2235,3.13287,0,0,0.99999,0.004363)
    ,(1121,36094,0,1541.74,293.894,-58.2235,-2.36492,0,0,0.925541,-0.378648)
    ,(1122,36095,0,1653.47,240.713,-58.4937,-1.57952,0,0,-0.710186,0.704014)
    ,(1123,36096,0,1594.15,182.202,-59.025,-0.008727,0,0,-0.004363,0.99999)
    ,(1124,36098,0,1536.05,240.635,-59.9186,-0.008727,0,0,-0.004363,0.99999)
    ,(1125,36102,0,1650.48,293.54,-58.4937,0.776671,0,0,0.378648,0.925541)
    ,(1126,36105,0,1649.9,186.003,-58.4937,-0.794124,0,0,-0.386711,0.922201)
    ,(1127,36113,0,1541.11,186.008,-58.4937,-2.36492,0,0,0.925541,-0.378648)
    ,(1128,36118,0,1596.36,182.127,-59.1923,3.13287,0,0,0.99999,0.004363)
    ,(1129,36126,0,1513.67,389.707,-49.8204,0.584686,0,0,0.288197,0.957571)
    ,(1130,36127,0,1450.02,331.97,-49.425,-2.07694,0,0,-0.861629,0.507539)
    ,(1131,36397,0,1474.84,364.133,-57.9933,-0.724311,0,0,-0.354291,0.935135)
    ,(1132,36398,0,1520.36,365.522,-49.2209,-1.05592,0,0,-0.503774,0.863836)
    ,(1133,41195,0,-876.553,-520.646,12.5021,-1.54462,0,0,-0.697791,0.716302)
    ,(1134,50484,1,-1091.05,-0.080078,140.534,3.06305,0,0,0.999229,0.03926)
    ,(1135,50485,1,-1118.26,38.2847,141.303,-3.05433,0,0,0.999048,-0.043619)
    ,(1136,50486,1,-1103.19,20.7839,140.441,-2.67036,0,0,0.97237,-0.233445)
    ,(1137,50487,1,-1114.59,5.88769,141.813,0.279252,0,0,0.139173,0.990268)
    ,(1138,50488,1,-1139.79,49.5422,143.75,-0.401426,0,0,-0.199368,0.979925)
    ,(1139,50489,1,-1161.03,29.599,145.611,1.24791,0,0,0.58425,0.811574)
    ,(1140,50490,1,-1148.18,27.096,144.995,1.4748,0,0,0.672367,0.740218)
    ,(1141,50491,1,-1225.58,81.0292,130.295,1.91986,0,0,0.819152,0.573576)
    ,(1142,50492,1,-1254.99,51.566,126.546,1.8675,0,0,0.803857,0.594823)
    ,(1143,50493,1,-1235.28,83.7881,130.113,-0.741765,0,0,-0.362438,0.932008)
    ,(1144,50494,1,-1266.58,52.5069,129.362,0.375246,0,0,0.186524,0.98245)
    ,(1145,50495,1,-1264.08,53.5709,129.373,-2.90597,0,0,0.993068,-0.117537)
    ,(1146,50496,1,-1265.76,54.3763,129.309,-1.29154,0,0,-0.601815,0.798635)
    ,(1147,50497,1,-1202.19,123.823,137.11,-1.59698,0,0,-0.716302,0.697791)
    ,(1148,50498,1,-1202.21,121.164,137.06,1.28282,0,0,0.598325,0.801254)
    ,(1149,50499,1,-1203.34,123.01,136.207,-0.523599,0,0,-0.258819,0.965926)
    ,(1150,50500,1,-1284.06,121.827,133.544,-2.84489,0,0,0.989016,-0.147809)
    ,(1151,50501,1,-1285.62,120.101,133.552,1.13446,0,0,0.5373,0.843391)
    ,(1152,50502,1,-1285.61,122.699,133.55,-1.33518,0,0,-0.619094,0.785317)
    ,(1153,50503,1,-1277.98,81.1389,128.42,0.907571,0,0,0.438371,0.898794)
    ,(1154,50504,1,-1244.41,137.311,132.628,-1.52716,0,0,-0.691513,0.722364)
    ,(1155,50505,1,-1289.74,131.923,131.151,0.706858,0,0,0.346117,0.938191)
    ,(1156,50506,1,-1102.72,-1.18169,143.546,2.97579,0,0,0.996566,0.082808)
    ,(1157,50507,1,-1103.97,-2.26058,143.614,1.64061,0,0,0.731354,0.681998)
    ,(1158,50508,1,-1145.24,35.1853,146.767,2.49582,0,0,0.948324,0.317305)
    ,(1159,50509,1,-1145.23,35.1779,145.933,2.49582,0,0,0.948324,0.317305)
    ,(1160,50510,1,-1145.61,37.0554,146.802,-2.25147,0,0,0.902585,-0.430511)
    ,(1161,50511,1,-1128.39,57.3023,145.36,-1.89368,0,0,-0.811574,0.58425)
    ,(1162,50512,1,-1128.13,54.9449,145.34,1.88496,0,0,0.809017,0.587785)
    ,(1163,50513,1,-1128.16,54.9897,144.568,1.88496,0,0,0.809017,0.587785)
    ,(1164,50514,1,-1104.79,0.156684,143.593,-1.14319,0,0,-0.540974,0.841039)
    ,(1165,50515,1,-1091.14,80.9375,142.446,-1.87623,0,0,-0.806445,0.59131)
    ,(1166,50516,1,-1090.91,78.4277,142.445,1.84132,0,0,0.796002,0.605294)
    ,(1167,50517,1,-1090.92,78.4328,141.613,1.84132,0,0,0.796002,0.605294)
    ,(1168,50518,1,-1092.57,78.8691,142.465,0.497418,0,0,0.246153,0.969231)
    ,(1169,50519,1,-1200.83,122.655,137.046,3.14159,0,0,1,0)
    ,(1170,50520,1,-1041.88,-214.582,159.212,2.90597,0,0,0.993068,0.117537)
    ,(1171,50521,1,-1186.86,-37.3856,162.934,-2.58309,0,0,0.961262,-0.275637)
    ,(1172,50522,1,-1174.24,-73.9032,162.241,-3.06305,0,0,0.999229,-0.03926)
    ,(1173,50523,1,-1183.08,-56.2882,161.635,3.14159,0,0,1,0)
    ,(1174,50524,1,-1213.34,-11.336,165.761,-0.113447,0,0,-0.056693,0.998392)
    ,(1175,50525,1,-1236,-57.0156,162.787,-0.07854,0,0,-0.03926,0.999229)
    ,(1176,50526,1,-1238.72,68.1509,130.345,-2.30383,0,0,0.913545,-0.406737)
    ,(1177,50527,1,-1240.78,66.2866,130.394,0.584685,0,0,0.288196,0.957571)
    ,(1178,50528,1,-1240.99,67.5453,130.413,-0.375246,0,0,-0.186524,0.98245)
    ,(1179,50529,1,-1200.58,-29.923,166.106,2.26893,0,0,0.906308,0.422618)
    ,(1180,50530,1,-1202.63,-29.7456,166.015,0.584685,0,0,0.288196,0.957571)
    ,(1181,50531,1,-1225.7,-85.6491,164.649,0.584685,0,0,0.288196,0.957571)
    ,(1182,50532,1,-1223.62,-86.0525,164.629,2.08567,0,0,0.863836,0.503774)
    ,(1183,50533,1,-1193.06,-88.0565,164.628,0.959932,0,0,0.461749,0.887011)
    ,(1184,50534,1,-1191.07,-87.3614,164.684,2.67908,0,0,0.973379,0.2292)
    ,(1185,50535,1,-1192.99,-6.21354,165.471,2.97579,0,0,0.996566,0.082808)
    ,(1186,50536,1,-1407.07,-110.36,158.879,-0.497418,0,0,-0.246153,0.969231)
    ,(1187,50537,1,-1064.84,-241.505,158.863,1.56207,0,0,0.704015,0.710185)
    ,(1188,50538,1,-1001.31,230.705,134.871,-2.08567,0,0,-0.863836,0.503774)
    ,(1189,55774,1,-1231.24,-42.5523,164.349,-0.427606,0,0,-0.212178,0.977231)
    ,(1190,56898,0,-14361.5,378.579,25.0536,2.11763,-0.052664,0.015878,0.870771,0.488602)
    ,(1191,56898,1,-975.077,-3673.82,10.5245,0.791182,-0.031724,0.044935,0.385364,0.921124)
    ,(1192,56901,0,-14458.7,423.209,26.2772,2.32129,0,0,0.91706,0.398749)
    ,(1193,56903,0,-14333.7,418.923,9.13584,1.13446,0,0,0.5373,0.843392)
    ,(1194,56905,0,-14342.3,412.672,11.0856,0.368054,0.017814,0.002414,0.182976,0.982953)
    ,(1195,56910,0,-14461,479.117,28.5625,-1.06465,0,0,-0.507539,0.861629)
    ,(1196,56911,0,-14421.7,523.763,8.9874,0.654499,0,0,0.32144,0.94693)
    ,(1197,58596,0,1609.45,275.395,-34.4713,-1.97222,0,0,-0.833886,0.551936)
    ,(1198,58597,0,1569.9,267.807,-30.3544,-0.794124,0,0,-0.386711,0.922201)
    ,(1199,58598,0,1569.12,213.633,-30.3544,0.776673,0,0,0.378649,0.92554)
    ,(1200,58599,0,1560.44,255.524,-34.2867,-0.532326,0,0,-0.263031,0.964787)
    ,(1201,58600,0,1631.32,254.778,-34.3416,-2.62672,0,0,0.967046,-0.254602)
    ,(1202,58601,0,1606.12,240.152,-42.7427,-0.008727,0,0,-0.004363,0.99999)
    ,(1203,58602,0,1585.13,240.335,-42.7427,3.13287,0,0,0.99999,0.004363)
    ,(1204,58603,0,1595.72,250.741,-42.7427,1.56207,0,0,0.704015,0.710185)
    ,(1205,58604,0,1595.53,229.746,-42.7427,-1.57952,0,0,-0.710186,0.704014)
    ,(1206,58605,0,1622.15,267.302,-30.4093,-2.36492,0,0,0.925541,-0.378648)
    ,(1207,58606,0,1596.14,269.916,-53.1671,-1.57952,0,0,-0.710186,0.704014)
    ,(1208,58607,0,1591.61,210.289,-53.1671,1.56207,0,0,0.704015,0.710185)
    ,(1209,58608,0,1600.37,210.108,-53.283,1.56207,0,0,0.704015,0.710185)
    ,(1210,58609,0,1409.79,144.261,-50.9751,-2.66163,0,0,0.971342,-0.237686)
    ,(1211,58610,0,1406.44,414.359,-80.2099,-0.794124,0,0,-0.386711,0.922201)
    ,(1212,58611,0,1753.62,60.143,-55.9975,2.34747,0,0,0.922201,0.38671)
    ,(1213,58612,0,1774.65,80.8117,-55.9975,2.34747,0,0,0.922201,0.38671)
    ,(1214,58613,0,1403.93,380.684,-55.4364,-2.3911,0,0,0.930418,-0.3665)
    ,(1215,58614,0,1487.24,285.943,-58.2546,-0.392699,0,0,-0.19509,0.980785)
    ,(1216,58615,0,1551.94,349.372,-57.73,-1.18682,0,0,-0.559193,0.829038)
    ,(1217,58616,0,1672.61,316.299,-54.0445,-0.794124,0,0,-0.386711,0.922201)
    ,(1218,58617,0,1694.62,286.703,-56.5023,0.445059,0,0,0.220697,0.975342)
    ,(1219,58618,0,1641.27,349.046,-58.439,-1.97222,0,0,-0.833886,0.551936)
    ,(1220,58619,0,1705.15,284.347,-58.439,-2.75762,0,0,0.981627,-0.190809)
    ,(1221,58620,0,1643.31,338.249,-55.7215,1.09956,0,0,0.522498,0.85264)
    ,(1222,58621,0,1550.34,131.823,-58.0667,1.16937,0,0,0.551937,0.833886)
    ,(1223,58622,0,1496.89,194.178,-54.0023,-2.69653,0,0,0.975342,-0.220697)
    ,(1224,58623,0,1518.91,163.899,-53.5867,2.33874,0,0,0.920505,0.390731)
    ,(1225,58624,0,1486.69,196.506,-57.9991,0.392699,0,0,0.19509,0.980785)
    ,(1226,58625,0,1548.17,142.028,-56.9035,-2.03331,0,0,-0.850352,0.526214)
    ,(1227,58626,0,1641.53,141.79,-55.9469,-1.11701,0,0,-0.529919,0.848048)
    ,(1228,58627,0,1639.7,131.31,-58.0613,1.95477,0,0,0.829038,0.559192)
    ,(1229,58629,0,1704.1,194.835,-57.7369,2.74889,0,0,0.980785,0.195091)
    ,(1230,59517,0,-14476.7,456.361,31.7622,1.98095,0,0,0.836286,0.548293)
    ,(1231,59518,0,-14342.2,425.575,9.87468,-1.23046,0,0,-0.577145,0.816642)
    ,(1232,59845,0,-14356.3,432.063,9.79371,2.25147,0,0,0.902585,0.430512)
    ,(1233,59846,0,-14435.3,502.054,26.8738,-0.733205,0.025159,0.04637,-0.358283,0.932122)
    ,(1234,59847,0,-14373.4,410.816,11.0642,-1.43117,0.06288,0.072336,-0.653038,0.751235)
    ,(1235,59848,0,-14471,456.058,33.6628,-0.173167,0.035615,0.038017,-0.087673,0.994786)
    ,(1236,59850,0,-14478.3,431.756,36.1966,0.837757,0,0,0.406736,0.913546)
    ,(1237,59851,0,-14439,396.752,34.2593,2.30383,0,0,0.913545,0.406737)
    ,(1238,59852,0,-14447.1,462.52,4.69969,2.46964,0,0,0.944089,0.329691)
    ,(1239,61918,0,-14450.3,416.907,26.9884,0.741717,-0.019393,0.04861,0.361942,0.930731)
    ,(1240,63195,0,-8885.46,594.829,97.6335,-1.0821,0,0,-0.515038,0.857167)
    ,(1241,63197,0,-8705.89,709.368,103.556,-2.46964,0,0,0.944089,-0.329691)
    ,(1242,63198,0,-8700.69,730.154,109.421,-2.46964,0,0,0.944089,-0.329691)
    ,(1243,66780,0,-8785.44,638.509,100.472,1.8675,0,0,0.803857,0.594823)
    ,(1244,74091,0,-14459.8,481.603,16.0718,-0.602137,0,0,-0.296541,0.95502)
    ,(1245,91692,0,-14373.2,404.304,11.1115,2.59181,0,0,0.962455,0.271441)
    ,(1246,92524,1,10064,2203.44,1353.7,-1.36136,0,0,-0.62932,0.777146)
    ,(1247,92525,1,10082.9,2373.48,1325.63,-2.10312,0,0,0.868199,-0.496217)
    ,(1248,92526,1,10083.5,2372.12,1319.9,-2.40856,0,0,0.933581,-0.358367)
    ,(1249,92527,1,9868.65,2265.52,1337.69,-3.02815,0,0,0.998392,-0.056693)
    ,(1250,92528,1,9869.1,2266.21,1331.78,2.87107,0,0,0.990866,0.134851)
    ,(1251,92529,1,10115.9,2330.27,1332.65,0.846485,0,0,0.410719,0.911762)
    ,(1252,92530,1,10161.6,2299.91,1332.65,-2.18166,0,0,0.887011,-0.461748)
    ,(1253,92531,1,9611.41,2358.19,1330.18,-2.64417,0,0,0.969231,-0.246154)
    ,(1254,92532,1,9618.83,2344.52,1330.18,-2.64417,0,0,0.969231,-0.246154)
    ,(1255,92533,1,10069.7,2284.09,1339.18,-2.53945,0,0,0.95502,-0.296541)
    ,(1256,92534,1,10069.6,2284.99,1333.32,-2.86234,0,0,0.990268,-0.139173)
    ,(1257,92535,1,10100.2,2296.36,1332.39,-2.81871,0,0,0.986996,-0.160742)
    ,(1258,92536,1,10121.3,2271.02,1331.63,-2.60927,0,0,0.964787,-0.263031)
    ,(1259,92537,1,10136.4,2384.61,1322.11,-2.79253,0,0,0.984808,-0.173648)
    ,(1260,92538,1,10095.9,2409.81,1319.99,-1.31772,0,0,-0.612218,0.790689)
    ,(1261,92539,1,9836.77,2276.82,1331.92,-0.28798,0,0,-0.143493,0.989651)
    ,(1262,92540,1,9836.27,2275.65,1337.8,0.069813,0,0,0.034899,0.999391)
    ,(1263,92541,1,9813.07,2227.17,1338.58,3.00197,0,0,0.997564,0.069756)
    ,(1264,92542,1,9812.34,2226.13,1332.6,2.64418,0,0,0.969231,0.246153)
    ,(1265,92543,1,9756.98,2263.91,1337.06,2.68781,0,0,0.97437,0.224952)
    ,(1266,92544,1,9773.75,2292.04,1331.17,-0.715585,0,0,-0.350207,0.936672)
    ,(1267,92545,1,9675.29,2335.09,1331.86,2.05949,0,0,0.857167,0.515038)
    ,(1268,92546,1,9676.28,2335.45,1337.59,2.48709,0,0,0.94693,0.321439)
    ,(1269,92547,1,9703.56,2352.39,1337.63,-0.759219,0,0,-0.370558,0.928809)
    ,(1270,92548,1,9704.57,2352.65,1331.86,-1.18682,0,0,-0.559193,0.829038)
    ,(1271,92549,1,9739.85,2330.08,1332.28,-0.933751,0,0,-0.450098,0.892979)
    ,(1272,92550,1,9700.54,2375.63,1332.55,-1.00356,0,0,-0.480988,0.876727)
    ,(1273,92551,1,9738.89,2329.4,1338.33,2.522,0,0,0.952396,0.304864)
    ,(1274,92552,1,9716.33,2278.2,1338.33,-0.593412,0,0,-0.292372,0.956305)
    ,(1275,92693,1,9863.03,2229.16,1331.83,-0.34034,0,0,-0.16935,0.985556)
    ,(1276,92694,1,9863.43,2230.25,1337.63,0.043631,0,0,0.021814,0.999762)
    ,(1277,92695,1,9755.96,2263.14,1331.22,2.33001,0,0,0.918791,0.394744)
    ,(1278,92696,1,9772.81,2291.17,1337.12,-0.261799,0,0,-0.130526,0.991445)
    ,(1279,92699,1,10087.5,2233.9,1339.2,0.637045,0,0,0.313164,0.949699)
    ,(1280,92700,1,10087.8,2232.85,1333.18,0.314159,0,0,0.156434,0.987688)
    ,(1281,95449,1,9715.39,2277.49,1332.28,2.23402,0,0,0.898794,0.438371)
    ,(1282,98343,0,1652.15,293.64,-58.2235,2.34747,0,0,0.922201,0.38671)
    ,(1283,98347,0,1595.21,299.206,-59.0186,-0.008727,0,0,-0.004363,0.99999)
    ,(1284,98348,0,1537.42,239.507,-59.0969,1.56207,0,0,0.704015,0.710185)
    ,(1285,98349,0,1650.65,295.105,-59.8545,-0.794127,0,0,-0.386712,0.922201)
    ,(1286,98350,0,1597.47,299.311,-59.4108,3.13287,0,0,0.99999,0.004363)
    ,(1287,98351,0,1595.26,180.821,-59.8467,1.56207,0,0,0.704015,0.710185)
    ,(1288,98354,0,1541.84,292.223,-58.4937,2.34747,0,0,0.922201,0.38671)
    ,(1289,103793,0,-8841.02,730.865,96.6851,0.514872,0,0,0.254602,0.967046)
    ,(1290,103794,0,-8825.4,957.33,99.247,-2.45218,0,0,-0.941175,0.337918)
    ,(1291,103795,0,-8800.81,578.754,96.7434,2.24275,0,0,0.900698,0.434445)
    ,(1292,103796,0,-8508.7,658.086,100.564,2.17293,0,0,0.884987,0.465617)
    ,(1293,105188,0,-8859.88,584.693,97.7821,2.37365,0,0,0.927184,0.374607)
    ,(1294,111094,0,-8892.59,697.523,101.537,2.14675,0,0,0.878817,0.477159)
    ,(1295,112898,0,-8855.54,661.93,100.128,-0.986112,0,0,-0.47332,0.880891)
    ,(1296,113528,1,-992.869,211.094,135.373,2.09439,0,0,0.866025,0.5)
    ,(1297,113568,0,1456.08,238.96,-57.3161,1.51844,0,0,0.688354,0.725375)
    ,(1298,113569,0,1593.69,100.517,-59.0787,0.008725,0,0,0.004363,0.99999)
    ,(1299,113570,0,1575.17,253.843,-56.0906,-0.802852,0,0,-0.390731,0.920505)
    ,(1300,113571,0,1456.07,241.95,-59.0787,-1.57952,0,0,-0.710186,0.704014)
    ,(1301,113572,0,1609.18,260.417,-56.0906,-2.37365,0,0,0.927184,-0.374606)
    ,(1302,113574,0,1735.62,240.519,-57.3161,-1.63188,0,0,-0.728371,0.685183)
    ,(1303,113575,0,1536.38,240.581,-58.3116,-0.008727,0,0,-0.004363,0.99999)
    ,(1304,113576,0,1615.76,226.406,-56.0906,2.33874,0,0,0.920505,0.390731)
    ,(1305,113577,0,1595.32,181.144,-58.2397,1.56207,0,0,0.704015,0.710185)
    ,(1306,113752,0,1630.96,225.036,-33.7029,2.66163,0,0,0.971342,0.237686)
    ,(1307,113755,0,1539.44,185.908,-58.2235,-0.794124,0,0,-0.386711,0.922201)
    ,(1308,113756,0,1540.93,184.443,-59.8545,2.34747,0,0,0.922201,0.386711)
    ,(1309,126046,0,-8546.43,516.733,111.292,-2.46964,0,0,0.944089,-0.329691)
    ,(1310,130125,0,-8670.68,447.147,101.64,2.2253,0,0,0.896873,0.442288)
    ,(1311,136101,0,1693.92,192.593,-56.0891,-0.462512,0,0,-0.2292,0.973379)
    ,(1312,137644,0,-4890.83,-898.596,503.95,1.91986,0,0,0.819152,0.573576)
    ,(1313,137646,0,-4982.57,-974.01,504.853,-0.602139,0,0,-0.296542,0.95502)
    ,(1314,142339,0,-4780.96,-1039.14,504.487,2.87979,0,0,0.991445,0.130526)
    ,(1315,142341,0,-4608.83,-1008.52,504.586,1.85005,0,0,0.798635,0.601815)
    ,(1316,142838,0,-4890.85,-898.615,504.856,1.91986,0,0,0.819152,0.573576)
    ,(1317,142873,0,-4617.49,-1099.35,503.07,3.12414,0,0,0.999962,0.008726)
    ,(1318,142874,0,-4621.22,-1063.72,510.227,3.01942,0,0,0.998135,0.061049)
    ,(1319,143249,0,-5023.99,-1156.32,505.413,-1.32645,0,0,-0.615661,0.788011)
    ,(1320,143251,0,-4925.65,-1269.89,506.538,1.89368,0,0,0.811574,0.58425)
    ,(1321,143253,0,-4871.01,-885.149,505.421,-1.38754,0,0,-0.639439,0.768842)
    ,(1322,143254,0,-5028.5,-1187.64,506.21,0.5236,0,0,0.25882,0.965926)
    ,(1323,143255,0,-4955.59,-1270.56,508.418,1.00356,0,0,0.480989,0.876727)
    ,(1324,143256,0,-4672.83,-900.158,506.812,-2.28638,0,0,0.909962,-0.414693)
    ,(1325,143317,0,-4845.3,-882.304,504.685,-1.48353,0,0,-0.67559,0.737277)
    ,(1326,143321,0,-4973.72,-1003.04,510.542,2.618,0,0,0.965926,0.258818)
    ,(1327,143322,0,-5004.72,-1012.77,510.462,-0.392699,0,0,-0.19509,0.980785)
    ,(1328,143324,0,-4926.93,-987.719,506.647,2.46964,0,0,0.944089,0.32969)
    ,(1329,143333,0,-4783.12,-1179,504.877,1.87623,0,0,0.806445,0.59131)
    ,(1330,143334,0,-4763.4,-1036.58,512.188,-2.23402,0,0,0.898794,-0.438371)
    ,(1331,143336,0,-4862.73,-1148.93,506.687,0.418879,0,0,0.207912,0.978148)
    ,(1332,143338,0,-4810.88,-1177.32,505.397,1.50098,0,0,0.681999,0.731353)
    ,(1333,143343,0,-4737.59,-1060.55,509.893,-2.58309,0,0,0.961262,-0.275638)
    ,(1334,143344,0,-4730.05,-1124.32,511.342,2.94961,0,0,0.995396,0.095845)
    ,(1335,143399,1,-1044.14,-3683.34,26.778,-1.42244,0,0,-0.65276,0.757565)
    ,(1336,144162,0,-4811.68,-1252.72,503.011,-2.46091,0,0,0.942641,-0.333807)
    ,(1337,146079,0,1802.23,-364.975,32.4969,2.2253,0,0,0.896873,0.442289)
    ,(1338,146080,0,1804.02,-363.637,32.4961,-0.916299,0,0,-0.442289,0.896873)
    ,(1339,146081,0,1804.01,-363.649,31.1078,-0.916299,0,0,-0.442289,0.896873)
    ,(1340,146096,1,9663.7,2300.64,1340.52,-0.925026,0,0,-0.446198,0.894934)
    ,(1341,148423,1,10132.9,2235.49,1339.2,-2.53073,0,0,0.953717,-0.300705)
    ,(1342,148424,1,-1292.92,113.572,130.947,-0.174534,0,0,-0.087156,0.996195)
    ,(1343,148425,1,-1294.68,99.045,130.24,0.36652,0,0,0.182236,0.983255)
    ,(1344,148426,1,-1227.56,45.3586,127.677,1.59698,0,0,0.716302,0.69779)
    ,(1345,149024,0,-5609.25,-1502.27,399.519,1.5708,0,0,0.707107,0.707107)
    ,(1346,150087,0,-4725.75,-1090.37,505.937,-2.93215,0,0,0.994522,-0.104528)
    ,(1347,151974,1,-6947.41,-3722.05,47.185,0.270526,0,0,0.134851,0.990866)
    ,(1348,151975,1,-6947.56,-3721.54,46.5766,0.270526,0.09497,0.012925,0.13423,0.986304)
    ,(1349,151976,1,-6946.26,-3722.2,45.8472,-2.87107,-0.012925,0.09497,0.986304,-0.13423)
    ,(1350,151977,1,-7070.47,-3756.78,8.57002,-0.095995,0.095735,-0.004599,-0.047758,0.99425)
    ,(1351,151978,1,-7070.33,-3757.64,9.19417,1.4748,0.070947,0.064444,0.669271,0.73681)
    ,(1352,151979,1,-7069.45,-3757.33,9.71333,3.0456,0,0,0.998848,0.047978)
    ,(1353,151980,1,-7079.28,-3799.45,8.11913,0.1309,0.095641,0.006269,0.065102,0.993265)
    ,(1354,151981,1,-7078.09,-3800.28,9.22767,-3.01069,-0.006269,0.095641,0.993265,-0.065102)
    ,(1355,151982,1,-7078.33,-3800.17,8.55443,1.7017,0,0,0.75184,0.659346)
    ,(1356,151983,1,-6949.26,-4786.35,6.18454,0.375245,0.094164,0.017878,0.185665,0.977927)
    ,(1357,151984,1,-6948.1,-4786.37,6.89922,-2.76635,0,0,0.98245,-0.186524)
    ,(1358,152574,1,-4446.32,2055.25,46.2946,-1.20428,0,0,-0.566406,0.824126)
    ,(1359,152575,1,-4446.34,2055.23,45.5724,-1.20428,0,0,-0.566406,0.824126)
    ,(1360,152576,1,-4446.4,2055.31,46.2764,0.401426,0,0,0.199368,0.979925)
    ,(1361,152577,1,-4446.41,2055.24,46.2863,1.97222,0,0,0.833886,0.551937)
    ,(1362,152578,1,-4446.41,2055.24,45.6197,1.97222,0,0,0.833886,0.551937)
    ,(1363,152579,1,-4446.38,2055.25,44.954,1.97222,0,0,0.833886,0.551937)
    ,(1364,152580,1,-4445.28,2058.18,44.9976,-0.767946,0.468413,0.332221,-0.472813,0.668331)
    ,(1365,152581,1,-2481.32,2319.05,117.022,3.14159,0,0,1,0)
    ,(1366,152582,1,-2481.34,2319.08,117.023,-1.44862,0,0,-0.66262,0.748956)
    ,(1367,152584,1,-4394.5,193.806,27.9585,-1.78024,0,0,-0.777146,0.62932)
    ,(1368,152585,1,-4394.48,193.833,27.1208,-1.74533,0,0,-0.766044,0.642788)
    ,(1369,152586,1,-4394.51,193.683,26.249,-1.7366,0,0,-0.763232,0.646124)
    ,(1370,152587,1,-4394.08,191.27,27.9996,1.91114,0,0,0.816642,0.577145)
    ,(1371,164908,0,-8673.33,489.992,102.188,2.24275,0,0,0.900698,0.434446)
    ,(1372,165549,1,-953.994,-3760.74,8.04848,2.64417,0,0,0.969231,0.246153)
    ,(1373,165557,1,1303.94,-4397.75,29.1688,-1.51844,0,0,-0.688354,0.725375)
    ,(1374,165558,0,1981.64,249.839,36.9705,-1.0472,0,0,-0.5,0.866026)
    ,(1375,169967,0,-14373.2,375.782,28.66,2.9147,0,0,0.993572,0.113203)
    ,(1376,170354,0,1598.8,381.962,-58.4576,3.12414,0,0,0.999962,0.008726)
    ,(1377,170355,0,1537.4,241.815,-59.0969,-1.57952,0,0,-0.710186,0.704014)
    ,(1378,171524,0,-4982.6,-974.077,503.974,-0.602139,0,0,-0.296542,0.95502)
    ,(1379,171525,0,-4979.23,-1197.92,503.924,2.2602,0,0,0.904455,0.426569)
    ,(1380,171526,0,-4980.52,-1197.82,504.024,-2.45219,0,0,0.941176,-0.337917)
    ,(1381,171527,0,-4979.33,-1199.22,504.024,0.689404,0,0,0.337916,0.941176)
    ,(1382,171528,0,-4709.26,-1213.95,504.161,-0.890117,0,0,-0.430511,0.902585)
    ,(1383,171529,0,-4709.14,-1212.74,504.276,-2.46091,0,0,0.942641,-0.333807)
    ,(1384,171530,0,-4707.88,-1212.86,504.103,2.25148,0,0,0.902585,0.430511)
    ,(1385,171531,0,-4707.97,-1214.16,504.101,0.68068,0,0,0.333807,0.942641)
    ,(1386,171532,0,-4751.98,-1142.97,504.487,0.733039,0,0,0.358368,0.93358)
    ,(1387,171533,0,-4753.31,-1142.94,504.587,-0.881391,0,0,-0.426569,0.904455)
    ,(1388,171534,0,-4751.91,-1141.76,504.587,2.2602,0,0,0.904455,0.426569)
    ,(1389,171704,0,-4887.03,-954.818,510.13,1.84132,0,0,0.796002,0.605294)
    ,(1390,171708,0,-4866.08,-1108.47,504.454,-1.36136,0,0,-0.62932,0.777146)
    ,(1391,171709,0,-4865.38,-1107.33,504.554,-2.97579,0,0,0.996566,-0.082808)
    ,(1392,171710,0,-4865.06,-1109.14,504.554,0.165807,0,0,0.082809,0.996565)
    ,(1393,171711,0,-4782.01,-1039.75,504.587,-1.87623,0,0,-0.806445,0.591309)
    ,(1394,171712,0,-4780.26,-1040.27,504.587,1.26536,0,0,0.591309,0.806445)
    ,(1395,171748,0,-4845.31,-1247.75,506.022,-0.994838,0,0,-0.477159,0.878817)
    ,(1396,171749,0,-4844.61,-1282.68,505.197,1.40499,0,0,0.646124,0.763232)
    ,(1397,171766,0,-4676.62,-940.112,503.998,-0.881391,0,0,-0.426569,0.904455)
    ,(1398,171770,0,-4710.98,-941.688,504.887,0.959931,0,0,0.461749,0.887011)
    ,(1399,172957,1,1494.56,-4423.78,26.7795,0.139626,0,0,0.069757,0.997564)
    ,(1400,172958,1,1494.56,-4423.78,25.6983,0.139626,0,0,0.069757,0.997564)
    ,(1401,172959,1,1494.66,-4423.75,24.5874,0.139626,0,0,0.069757,0.997564)
    ,(1402,172960,1,1500.39,-4423.78,26.1478,-0.07854,0,0,-0.03926,0.999229)
    ,(1403,172961,1,1500.39,-4423.78,25.0666,-0.07854,0,0,-0.03926,0.999229)
    ,(1404,172962,1,1724.03,-4375.56,34.4044,-1.27409,0,0,-0.594822,0.803857)
    ,(1405,172963,1,1724.03,-4375.56,33.3232,-1.27409,0,0,-0.594822,0.803857)
    ,(1406,172964,1,1724.08,-4375.65,32.2123,-1.27409,0,0,-0.594822,0.803857)
    ,(1407,172965,1,1666.79,-4391.71,24.9046,1.72788,0,0,0.760406,0.649447)
    ,(1408,172966,1,1665.11,-4318.87,65.0044,1.53589,0,0,0.694658,0.71934)
    ,(1409,172967,1,1732.3,-4357.58,34.2807,1.31772,0,0,0.612217,0.790689)
    ,(1410,172968,1,1695.05,-4290.51,34.2448,1.48353,0,0,0.67559,0.737277)
    ,(1411,172969,1,1675.1,-4248.63,54.8454,-2.74017,0,0,0.979925,-0.199368)
    ,(1412,172970,1,1568.39,-4200.61,46.2452,-3.11541,0,0,0.999914,-0.01309)
    ,(1413,172971,1,1569.01,-4200.2,45.2461,1.24791,0,0,0.58425,0.811574)
    ,(1414,172972,1,1675.07,-4248.65,52.8461,-2.74017,0,0,0.979925,-0.199368)
    ,(1415,172973,1,1675.93,-4248.12,53.7104,0.663224,0,0,0.325568,0.945519)
    ,(1416,172974,1,1675.95,-4248.22,54.6432,0.575958,0,0,0.284015,0.95882)
    ,(1417,172975,1,1766.85,-4223.18,43.53,-1.51844,0,0,-0.688354,0.725375)
    ,(1418,172976,1,1767.18,-4222.86,44.4628,-0.445059,0,0,-0.220697,0.975342)
    ,(1419,172977,1,1767.18,-4222.86,42.9965,-0.445059,0,0,-0.220697,0.975342)
    ,(1420,172978,1,1918,-4294.39,31.2142,1.39626,0,0,0.642787,0.766045)
    ,(1421,172979,1,1918.12,-4295.11,31.0715,-1.01229,0,0,-0.48481,0.874619)
    ,(1422,172980,1,1917.55,-4294.4,30.7439,2.35619,0,0,0.92388,0.382683)
    ,(1423,172981,1,1918.19,-4295.18,29.9851,-1.13446,0,0,-0.5373,0.843391)
    ,(1424,172982,1,1880.33,-4535.97,30.8068,3.05433,0,0,0.999048,0.043619)
    ,(1425,172983,1,1880.71,-4535.49,30.3436,1.78024,0,0,0.777146,0.629321)
    ,(1426,172984,1,1881.27,-4536.24,29.5848,-0.654499,0,0,-0.32144,0.94693)
    ,(1427,172985,1,1881.18,-4535.69,30.8138,0.733039,0,0,0.358368,0.93358)
    ,(1428,172986,1,1880.33,-4535.97,29.7158,3.05433,0,0,0.999048,0.043619)
    ,(1429,172987,1,1886.24,-4484.23,23.6871,1.51844,0,0,0.688355,0.725374)
    ,(1430,172988,1,1885.63,-4484.75,24.1503,-3.00197,0,0,0.997564,-0.069757)
    ,(1431,172989,1,1886.38,-4485.16,22.9283,-1.213,0,0,-0.569997,0.821647)
    ,(1432,172990,1,1886.59,-4484.65,24.1573,0.174533,0,0,0.087156,0.996195)
    ,(1433,172991,1,1885.63,-4484.75,23.0593,-3.00197,0,0,0.997564,-0.069757)
    ,(1434,172992,1,1917.91,-4659.26,33.4919,1.78024,0,0,0.777146,0.629321)
    ,(1435,172993,1,1766.42,-4222.41,44.3204,2.60927,0,0,0.964787,0.263032)
    ,(1436,172994,1,1766.42,-4222.41,43.3518,2.60927,0,0,0.964787,0.263032)
    ,(1437,172995,1,1766.28,-4222.36,42.281,2.60927,0,0,0.964787,0.263032)
    ,(1438,172996,1,1569.15,-4200.98,46.1592,-0.98611,0,0,-0.473319,0.880891)
    ,(1439,172997,1,1569.15,-4200.98,44.8386,-0.98611,0,0,-0.473319,0.880891)
    ,(1440,173006,1,1729.76,-4315.75,29.0657,-1.41372,0,0,-0.649448,0.760406)
    ,(1441,173016,1,1763.44,-4494.94,44.3103,2.6529,0,0,0.970296,0.241922)
    ,(1442,173017,1,1761.81,-4511.88,26.4703,2.41728,0,0,0.935135,0.354291)
    ,(1443,173018,1,1814.15,-4540.27,21.1759,1.45735,0,0,0.665882,0.746057)
    ,(1444,173020,1,1885.8,-4454.53,50.8345,2.97579,0,0,0.996566,0.082808)
    ,(1445,173021,1,1942.49,-4481.45,25.3917,2.94088,0,0,0.994969,0.100188)
    ,(1446,173022,1,1927.56,-4421.84,22.5502,0.05236,0,0,0.026177,0.999657)
    ,(1447,173024,1,1925.88,-4502,27.052,2.29511,0,0,0.911762,0.410719)
    ,(1448,173025,1,1773.82,-4215.27,39.221,2.618,0,0,0.965926,0.258819)
    ,(1449,173044,1,1837.78,-4552.43,22.9879,1.95477,0,0,0.829037,0.559193)
    ,(1450,173056,1,1910.85,-4321.73,21.5496,-0.122173,0,0,-0.061048,0.998135)
    ,(1451,173078,1,2083.53,-4820.11,23.5203,2.39983,0,0,0.932008,0.362438)
    ,(1452,173079,1,1884.89,-4686.29,36.5732,0.663224,0,0,0.325568,0.945519)
    ,(1453,173080,1,1918.08,-4754.23,33.5792,-0.541054,0,0,-0.267239,0.96363)
    ,(1454,173081,1,2012.51,-4709.56,25.5909,2.99324,0,0,0.99725,0.074108)
    ,(1455,173082,1,2038.61,-4729.11,25.4759,2.81871,0,0,0.986996,0.160743)
    ,(1456,173083,1,2069.84,-4823.96,23.3434,1.27409,0,0,0.594823,0.803856)
    ,(1457,173084,1,1951.54,-4737.43,48.9539,1.94604,0,0,0.826589,0.562806)
    ,(1458,173085,1,2096.93,-4652.21,49.4049,-1.39626,0,0,-0.642788,0.766044)
    ,(1459,173086,1,1999.51,-4644.98,25.6883,2.95833,0,0,0.995805,0.091502)
    ,(1460,173157,1,1594.85,-4106.7,32.9556,-1.16937,0,0,-0.551937,0.833886)
    ,(1461,173160,1,1543.78,-4173.82,40.1643,0.087267,0,0,0.04362,0.999048)
    ,(1462,173161,1,1524.85,-4219.19,41.2429,0.584686,0,0,0.288197,0.957571)
    ,(1463,173162,1,1476.59,-4146.67,40.3848,-0.279252,0,0,-0.139173,0.990268)
    ,(1464,173168,1,1763.93,-4317.85,6.20181,0.567231,0,0,0.279829,0.96005)
    ,(1465,173169,1,1807.5,-4290.3,5.73174,-2.54818,0,0,0.956305,-0.292372)
    ,(1466,173170,1,1770.24,-4294.3,6.66837,-1.29154,0,0,-0.601815,0.798635)
    ,(1467,173173,1,1831.88,-4339.11,-15.613,-2.54818,0,0,0.956305,-0.292372)
    ,(1468,173174,1,1780.97,-4365.1,-16.1336,-0.017453,0,0,-0.008727,0.999962)
    ,(1469,173177,1,1818.26,-4316.23,-11.8271,-2.46092,0,0,0.942642,-0.333806)
    ,(1470,173202,1,1585.99,-4449.31,5.97885,2.2602,0,0,0.904455,0.426569)
    ,(1471,173203,1,1526.93,-4366.51,17.8723,-0.811576,0,0,-0.394743,0.918792)
    ,(1472,173215,1,1613.34,-4346.47,4.10269,2.7838,0,0,0.984041,0.177944)
    ,(1473,173216,1,1613.29,-4388.24,10.1155,-2.6529,0,0,0.970296,-0.241922)
    ,(1474,173217,1,1625.36,-4322.42,1.77007,-2.38238,0,0,0.92881,-0.370557)
    ,(1475,173218,1,1677.2,-4410.67,19.351,-2.67036,0,0,0.97237,-0.233445)
    ,(1476,173219,1,1653.82,-4350.22,26.8253,-2.03331,0,0,-0.850352,0.526214)
    ,(1477,173220,1,1573.01,-4308.58,22.6325,-2.34747,0,0,0.922201,-0.386711)
    ,(1478,173222,1,1671.67,-4426.38,17.9437,1.95477,0,0,0.829038,0.559193)
    ,(1479,174857,1,-1002.34,-3664.53,25.7661,-1.00356,0,0,-0.480988,0.876727)
    ,(1480,174858,1,-933.02,-3685.36,13.8213,-2.74889,0,0,0.980785,-0.195091)
    ,(1481,175319,1,1836.03,-4364.47,-15.0451,2.95833,0,0,0.995805,0.091502)
    ,(1482,175433,329,3707.61,-3402.7,132.405,-2.9723,0,-0.173648,0.98106,-0.085832)
    ,(1483,175434,329,3707.41,-3402.1,132.437,0.174533,0,0,0.087156,0.996195)
    ,(1484,175435,329,3652.91,-3325.34,123.989,2.09439,0,0,0.866026,0.5)
    ,(1485,175436,329,3654.43,-3325.95,123.541,-2.61799,-0.01129,0.042133,0.965006,-0.258573)
    ,(1486,175437,329,3655.42,-3323.93,124.336,-1.0472,0.113039,-0.065263,-0.495723,0.858616)
    ,(1487,175438,329,3649.88,-3496.59,137.059,-1.48353,0.096234,-0.088182,-0.66981,0.73097)
    ,(1488,175439,329,3647.01,-3496.81,136.712,1.65806,0,0,0.737278,0.67559)
    ,(1489,175440,329,3648.13,-3498,136.264,-3.05433,-0.001903,0.043578,0.998097,-0.043578)
    ,(1490,175441,329,3524.13,-3377.81,133.013,2.96706,-0.003802,-0.043453,0.995247,0.087073)
    ,(1491,175442,329,3524.41,-3376.47,132.171,2.96706,-0.018864,-0.215616,0.972581,0.08509)
    ,(1492,175443,329,3524.43,-3376.18,133.056,-0.174533,0,0,-0.087156,0.996195)
    ,(1493,175444,329,3523.58,-3377.04,132.509,1.39627,-0.033414,-0.028038,0.642176,0.765315)
    ,(1494,175445,329,3558.12,-3320.44,130.295,-1.8326,0.079459,-0.103553,-0.786566,0.603553)
    ,(1495,175447,329,3555.99,-3321.16,129.5,2.87979,0.005693,0.043246,0.990501,0.130402)
    ,(1496,175449,329,3812.27,-3615.74,145.239,-0.837757,0.039848,-0.017742,-0.406349,0.912676)
    ,(1497,175450,329,3810.09,-3615.18,146.034,0.733039,0.121857,0.046776,0.355302,0.925593)
    ,(1498,175454,329,3993.23,-3547.21,124.481,1.94604,0,0,0.82659,0.562805)
    ,(1499,175455,329,3994.78,-3546.62,124.439,-1.19555,-0.036055,0.024549,-0.562269,0.825803)
    ,(1500,175457,329,3704.02,-3246.32,127.442,0.698131,0,0,0.34202,0.939693)
    ,(1501,175458,329,3704.12,-3247.53,126.895,2.26893,-0.018434,-0.039533,0.905445,0.422216)
    ,(1502,175459,329,3446.54,-3370.09,140.956,1.65806,0,0,0.737278,0.67559)
    ,(1503,175460,329,3447.17,-3369.94,140.925,-1.48877,-0.117315,0.128027,-0.665327,0.726076)
    ,(1504,175461,329,3683.66,-3612.59,138.91,1.8326,0.079459,0.103553,0.786567,0.603553)
    ,(1505,175462,329,3686.45,-3611.89,138.563,-1.309,0,0,-0.608762,0.793353)
    ,(1506,175463,329,3685.14,-3610.9,138.115,0.2618,0.043246,0.005693,0.130402,0.990501)
    ,(1507,175466,329,3670.92,-3333.54,138.502,-3.05433,0,0,0.999048,-0.043619)
    ,(1508,175467,329,3730.97,-3493.46,144.672,2.30383,0,0,0.913545,0.406737)
    ,(1509,175469,329,3661.27,-3479.86,153.273,-1.48353,0,0,-0.675591,0.737277)
    ,(1510,175470,329,3686.23,-3499.92,148.561,2.23402,0,0,0.898794,0.438371)
    ,(1511,175471,329,3506.49,-3395.26,147.507,1.13446,0,0,0.5373,0.843391)
    ,(1512,175472,329,3550.09,-3383.72,144.137,2.96706,0,0,0.996195,0.087156)
    ,(1513,175474,329,4065.84,-3449.08,132.23,2.00713,0,0,0.843391,0.5373)
    ,(1514,175477,329,3876.35,-3588.01,151.74,2.53073,0,0,0.953717,0.300706)
    ,(1515,175478,329,3887.01,-3571.79,156.622,2.40856,0,0,0.93358,0.358368)
    ,(1516,175479,329,3802.17,-3648.13,162.065,0.488692,0,0,0.241922,0.970296)
    ,(1517,175481,329,3830.23,-3704.26,153.273,-0.261799,0,0,-0.130526,0.991445)
    ,(1518,175483,329,3477.52,-3359.29,151.06,-1.5708,0,0,-0.707107,0.707107)
    ,(1519,175484,329,3473.01,-3294.13,147.507,-1.13446,0,0,-0.5373,0.843391)
    ,(1520,175824,329,3524.5,-3375.93,132.258,-0.174117,0.034767,0.003042,-0.087103,0.995588)
    ,(1521,175825,329,3557.53,-3320.44,129.254,-1.828,0.003704,-0.045229,-0.790561,0.6107)
    ,(1522,176364,1,6509.15,799.206,8.21766,1.28282,0,0,0.598325,0.801254)
    ,(1523,176365,1,6509.15,799.073,8.22928,-1.85878,0,0,-0.801254,0.598325)
    ,(1524,176369,0,-3776.21,-731.847,8.31114,2.10312,0,0,0.868199,0.496216)
    ,(1525,176370,0,-3776.13,-731.8,8.2887,-1.03847,0,0,-0.496217,0.868199)
    ,(1526,176794,1,930.339,1054.16,107.735,1.64934,0,0,0.734322,0.678801)
    ,(1527,176795,1,930.321,1054.17,106.791,1.64934,0,0,0.734322,0.678801)
    ,(1528,176796,1,930.02,1056.91,106.819,-1.51844,0,0,-0.688354,0.725374)
    ,(1529,176797,1,930.038,1056.9,107.762,-1.51844,0,0,-0.688354,0.725374)
    ,(1530,176798,1,704.612,1375.84,13.5887,0.558505,0,0,0.275637,0.961262)
    ,(1531,176799,1,913.059,643.425,99.9028,-1.51844,0,0,-0.688354,0.725374)
    ,(1532,176800,1,911.736,641.804,99.8028,0.095993,0,0,0.047978,0.998848)
    ,(1533,176801,1,914.527,642.2,99.8821,-3.13287,0,0,0.99999,-0.004363)
    ,(1534,176945,1,-1903,2449.26,62.189,2.89961,0,0,0.992689,0.120697)
    ,(1535,176946,1,-1902.63,2449.51,62.1889,1.47717,0,0,0.673241,0.739423)
    ,(1536,176947,1,-1902.75,2448.83,62.2104,-1.65712,0,0,-0.736959,0.675937)
    ,(1537,176948,1,-1885.88,2431.31,59.8215,2.80998,0,0,0.986286,0.165048)
    ,(1538,176949,1,-1886,2431.38,59.8215,1.28282,0,0,0.598325,0.801254)
    ,(1539,176950,1,-1434.61,1564.88,61.1024,0.253073,0,0,0.126199,0.992005)
    ,(1540,176958,1,-253.204,1391.27,95.3264,2.7838,0,0,0.984041,0.177944)
    ,(1541,176959,1,-253.149,1391.28,95.3277,-1.8675,0,0,-0.803857,0.594823)
    ,(1542,176960,1,-507.224,1424.25,92.629,-2.19912,0,0,0.891007,-0.45399)
    ,(1543,176961,1,-507.222,1424.26,91.6278,-2.19912,0,0,0.891007,-0.45399)
    ,(1544,176967,0,3140.37,-3411.06,141.124,-1.29154,0,0,-0.601815,0.798635)
    ,(1545,176968,0,3140.33,-3411,141.125,0.279252,0,0,0.139173,0.990268)
    ,(1546,176969,0,3140.27,-3411.11,141.12,1.85005,0,0,0.798636,0.601814)
    ,(1547,176970,0,2849.59,-4406.55,88.4945,2.58309,0,0,0.961262,0.275637)
    ,(1548,176971,0,2849.66,-4406.57,88.5517,-2.1293,0,0,0.87462,-0.48481)
    ,(1549,176972,0,2849.63,-4406.45,88.4929,-0.558507,0,0,-0.275638,0.961262)
    ,(1550,176973,0,2849.58,-4406.56,87.1056,2.58309,0,0,0.961262,0.275637)
    ,(1551,176978,0,2046.41,-4509.19,73.7033,-2.28638,0,0,0.909961,-0.414694)
    ,(1552,176979,0,2046.41,-4509.19,72.3702,-2.28638,0,0,0.909961,-0.414693)
    ,(1553,176980,0,2046.34,-4509.18,73.7058,2.42601,0,0,0.936672,0.350207)
    ,(1554,176981,0,2046.29,-4509.09,73.71,0.855211,0,0,0.414693,0.909961)
    ,(1555,176982,0,2046.28,-4509.09,72.3769,0.855211,0,0,0.414693,0.909961)
    ,(1556,176983,0,1751.66,-3623.24,119.84,-0.026181,0,0,-0.01309,0.999914)
    ,(1557,176984,0,1751.66,-3623.41,119.835,3.11541,0,0,0.999914,0.01309)
    ,(1558,176985,0,1751.66,-3623.4,118.502,3.11541,0,0,0.999914,0.01309)
    ,(1559,176986,0,1751.62,-3623.34,119.835,1.54462,0,0,0.69779,0.716302)
    ,(1560,176987,0,1689.41,-1361.88,70.1315,-2.85361,0,0,0.989651,-0.143493)
    ,(1561,176988,0,1689.29,-1361.82,70.1216,1.85005,0,0,0.798635,0.601816)
    ,(1562,176989,0,1689.36,-1361.75,70.1265,0.279252,0,0,0.139173,0.990268)
    ,(1563,176990,0,1689.39,-1361.88,68.7965,-2.85361,0,0,0.989651,-0.143493)
    ,(1564,176991,0,1754.6,-1735.33,59.2001,0.209439,0,0,0.104528,0.994522)
    ,(1565,176992,0,1754.62,-1735.46,60.5517,-2.94088,0,0,0.994969,-0.100188)
    ,(1566,176993,0,1754.59,-1735.33,60.5318,0.209439,0,0,0.104528,0.994522)
    ,(1567,176994,0,1754.7,-1735.39,60.5517,-1.37008,0,0,-0.632705,0.774393)
    ,(1568,177064,0,1622,213.146,-30.3544,2.34747,0,0,0.922201,0.38671)
    ,(1569,177104,1,3905.77,-1264.39,223.469,2.46964,0,0,0.944089,0.329691)
    ,(1570,177105,1,3905.86,-1264.31,223.462,-0.671953,0,0,-0.329691,0.944089)
    ,(1571,177106,1,3905.89,-1264.29,222.636,-0.671953,0,0,-0.329691,0.944089)
    ,(1572,177107,1,4925.45,-741.677,306.536,1.57952,0,0,0.710185,0.704015)
    ,(1573,177108,1,4925.57,-741.689,306.577,-1.56207,0,0,-0.704015,0.710185)
    ,(1574,177109,1,4925.6,-741.705,305.747,-1.56207,0,0,-0.704015,0.710185)
    ,(1575,177110,1,4925.55,-741.613,306.553,-0.017454,0,0,-0.008727,0.999962)
    ,(1576,177111,1,6559.18,-1957.39,548.924,-2.93215,0,0,0.994522,-0.104529)
    ,(1577,177112,1,6559.15,-1957.41,548.203,-2.93215,0,0,0.994522,-0.104529)
    ,(1578,177113,1,6559.17,-1957.31,548.214,0.209439,0,0,0.104528,0.994522)
    ,(1579,177114,1,6559.19,-1957.29,548.935,0.209439,0,0,0.104528,0.994522)
    ,(1580,177115,1,6559.15,-1957.32,548.909,1.78024,0,0,0.777146,0.62932)
    ,(1581,177116,1,7612.76,-2293.37,457.737,2.46964,0,0,0.944089,0.329691)
    ,(1582,177117,1,7612.83,-2293.32,457.791,-0.671953,0,0,-0.329691,0.944089)
    ,(1583,177118,1,7612.83,-2293.33,457.125,-0.671953,0,0,-0.329691,0.944089)
    ,(1584,177119,1,7612.75,-2293.34,457.126,0.898844,0,0,0.434445,0.900698)
    ,(1585,177120,1,7612.75,-2293.33,457.793,0.898844,0,0,0.434445,0.900698)
    ,(1586,177121,1,7637.17,-2227.66,462.563,-1.69297,0,0,-0.748956,0.66262)
    ,(1587,177122,1,7637.18,-2227.68,463.224,-1.69297,0,0,-0.748956,0.66262)
    ,(1588,177123,1,7637.11,-2227.73,463.229,3.01942,0,0,0.998135,0.061049)
    ,(1589,177124,1,7637.1,-2227.71,462.568,-0.122174,0,0,-0.061049,0.998135)
    ,(1590,177125,1,7637.14,-2227.65,463.182,-0.122174,0,0,-0.061049,0.998135)
    ,(1591,177126,1,7811.76,-2309.9,454.961,1.05592,0,0,0.503774,0.863836)
    ,(1592,177127,1,7811.78,-2309.92,455.63,-2.08567,0,0,-0.863836,0.503774)
    ,(1593,177128,1,7811.72,-2309.84,455.566,1.05592,0,0,0.503774,0.863836)
    ,(1594,177129,1,7811.76,-2309.84,455.625,-0.514872,0,0,-0.254602,0.967046)
    ,(1595,177130,1,7811.76,-2309.91,454.406,1.05592,0,0,0.503774,0.863836)
    ,(1596,177131,1,6500.37,-2444.44,574.968,3.14159,0,0,1,0)
    ,(1597,177132,1,6500.39,-2444.46,574.35,3.14159,0,0,1,0)
    ,(1598,177133,1,6500.39,-2444.41,573.692,3.14159,0,0,1,0)
    ,(1599,177134,1,6500.38,-2444.44,574.966,-1.5708,0,0,-0.707107,0.707107)
    ,(1600,177135,1,6500.4,-2444.47,574.35,-1.5708,0,0,-0.707107,0.707107)
    ,(1601,177136,1,6674.08,-3655.81,696.485,3.14159,0,0,1,0)
    ,(1602,177137,1,6674.1,-3655.84,695.882,3.14159,0,0,1,0)
    ,(1603,177138,1,6674.08,-3655.81,696.483,1.5708,0,0,0.707107,0.707107)
    ,(1604,177139,1,6915.43,-4129.61,694.543,-1.07338,0,0,-0.511293,0.859406)
    ,(1605,177140,1,6915.42,-4129.64,693.94,-1.07338,0,0,-0.511293,0.859406)
    ,(1606,177141,1,6915.44,-4129.6,694.541,0.497418,0,0,0.246153,0.969231)
    ,(1607,177142,1,6915.43,-4129.63,693.938,0.497418,0,0,0.246153,0.969231)
    ,(1608,177143,1,6915.46,-4129.6,693.267,0.497418,0,0,0.246153,0.969231)
    ,(1609,177144,1,6915.42,-4129.61,694.54,2.06821,0,0,0.859406,0.511293)
    ,(1610,177145,1,6915.41,-4129.63,693.938,2.06821,0,0,0.859406,0.511293)
    ,(1611,177146,1,7167.97,-4150.65,706.979,1.58825,0,0,0.71325,0.700909)
    ,(1612,177147,1,7167.95,-4150.67,706.367,1.58825,0,0,0.71325,0.700909)
    ,(1613,177148,1,7167.99,-4150.65,706.98,-1.55334,0,0,-0.700909,0.71325)
    ,(1614,177149,1,7167.99,-4150.65,706.98,0.017454,0,0,0.008727,0.999962)
    ,(1615,177150,1,6652.97,-4557.89,717.693,3.05433,0,0,0.999048,0.04362)
    ,(1616,177151,1,6652.98,-4557.87,717.693,-0.087266,0,0,-0.043619,0.999048)
    ,(1617,177152,1,6652.96,-4557.85,717.088,-0.087266,0,0,-0.043619,0.999048)
    ,(1618,177153,1,6652.98,-4557.89,717.691,-1.65806,0,0,-0.737277,0.67559)
    ,(1619,177154,1,6674.19,-3655.81,696.534,0,0,0,0,1)
    ,(1620,177155,1,6674.21,-3655.83,695.932,0,0,0,0,1)
    ,(1621,177185,0,-10451.6,-1721.82,86.4445,-1.06465,0,0,-0.507538,0.861629)
    ,(1622,177186,0,-10451.5,-1721.78,87.8886,1.80642,0.07195,0.020943,0.784755,0.61526)
    ,(1623,177265,1,-1123.41,66.3221,149.444,-1.85878,0,0,-0.801254,0.598324)
    ,(1624,177266,1,-1108.16,-11.2957,148.629,1.84132,0,0,0.796002,0.605294)
    ,(1625,177267,1,-1179.59,-93.4133,168.539,2.53945,0,0,0.95502,0.296542)
    ,(1626,177268,1,-1237.66,-90.5948,169.033,0.488692,0,0,0.241922,0.970296)
    ,(1627,177269,1,-1204.25,134.805,140.694,-2.44346,0,0,0.939692,-0.34202)
    ,(1628,177270,1,-1278.97,49.2355,135.326,0.471238,0,0,0.233445,0.97237)
    ,(1629,179144,0,-13275.8,-167.005,15.9875,0.331614,0,0,0.165048,0.986286)
    ,(1630,179224,0,-13179.5,-278.016,7.58482,0.610866,0,0,0.300706,0.953717)
    ,(1631,179725,0,-8722.25,515.349,94.4307,-2.50455,0,0,0.949699,-0.313164)
    ,(1632,179726,0,-8730.57,405.352,96.401,2.25147,0,0,0.902585,0.430511)
    ,(1633,179727,0,-8648.57,417.319,101.026,2.25147,0,0,0.902585,0.430511)
    ,(1634,179728,0,-8677.26,484.272,96.7433,2.25147,0,0,0.902585,0.430511)
    ,(1635,179729,0,-8730.51,405.396,98.1411,2.25147,0,0,0.902585,0.430511)
    ,(1636,179730,0,-8648.52,417.363,102.766,2.25147,0,0,0.902585,0.430511)
    ,(1637,179731,0,-8677.2,484.316,98.4834,2.25147,0,0,0.902585,0.430511)
    ,(1638,179732,0,-8677.29,484.241,97.6425,2.25147,0,0,0.902585,0.430511)
    ,(1639,179733,0,-8648.61,417.288,101.926,2.25147,0,0,0.902585,0.430511)
    ,(1640,179734,0,-8730.61,405.321,97.3002,2.25147,0,0,0.902585,0.430511)
    ,(1641,179736,0,-8750.65,406.218,107.633,-0.898844,0,0,-0.434445,0.900698)
    ,(1642,179737,0,-8759.01,381.722,108.044,-0.898844,0,0,-0.434445,0.900698)
    ,(1643,179738,0,-8746.64,375.573,108.044,0.671952,0,0,0.329691,0.944089)
    ,(1644,179739,1,1695.05,-4290.51,33.2556,1.48353,0,0,0.67559,0.737277)
    ,(1645,179740,1,1675.1,-4248.63,53.8335,-2.74017,0,0,0.979925,-0.199368)
    ,(1646,179742,1,1636.25,-4262.48,49.5421,-2.11185,0,0,0.870355,-0.492424)
    ,(1647,179743,0,-8722.29,515.4,95.9646,-2.50455,0,0,0.949699,-0.313164)
    ,(1648,179744,0,-8722.26,515.362,95.1963,-2.50455,0,0,0.949699,-0.313164)
;

UPDATE `gameobject`
SET
    `spawntimesecs` = 900,
    `animprogress`  = 100,
    `state`         = 1
WHERE
    `id` IN (
    80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97,
    98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112,
    113, 114, 115, 116, 117, 118, 121, 122, 123, 124, 298, 299, 301, 302, 303,
    304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318,
    376, 377, 378, 379, 380, 381, 382, 387, 388, 389, 1162, 1564, 1565, 1566,
    1567, 1568, 1569, 1570, 1572, 1573, 1595, 1596, 1597, 1598, 1630, 1631,
    1632, 1633, 1634, 1638, 1639, 1643, 1644, 1645, 1646, 1647, 1648, 1649,
    1650, 1651, 1652, 1653, 1654, 1655, 1656, 1657, 1658, 1659, 1660, 1661,
    1662, 1663, 1664, 1665, 1666, 1668, 1669, 1674, 1675, 1676, 1677, 1678,
    1679, 1680, 1681, 1686, 1687, 1688, 1689, 1690, 1691, 1692, 1693, 1694,
    1695, 1696, 1697, 1698, 1699, 1700, 1701, 1702, 1703, 1704, 1705, 1706,
    1707, 1708, 1709, 1710, 1711, 1712, 1713, 1714, 1715, 1771, 1772, 1773,
    1774, 1775, 1776, 1777, 1778, 1779, 1780, 1781, 1782, 1783, 1784, 1785,
    1786, 1787, 1788, 1789, 1790, 1791, 1792, 1793, 1794, 1795, 2016, 2017,
    2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025, 2026, 2027, 2028, 2029,
    2030, 2031, 2032, 2033, 2034, 2035, 2036, 2037, 2038, 2048, 2049, 2050,
    2051, 2052, 2096, 2098, 2099, 2100, 2101, 2102, 2105, 2106, 2108, 2109,
    2110, 2111, 2112, 2113, 2115, 2116, 2117, 2119, 2120, 2122, 2123, 2124,
    2125, 2127, 2128, 2129, 2130, 2131, 2133, 2134, 2136, 2138, 2139, 2140,
    2141, 2142, 2143, 2145, 2146, 2148, 2149, 2150, 2151, 2152, 2153, 2154,
    2155, 2156, 2157, 2158, 2159, 2160, 2161, 2162, 2163, 2164, 2165, 2166,
    2167, 2169, 2171, 2173, 2175, 2176, 2177, 2178, 2179, 2181, 2182, 2186,
    2187, 2188, 2189, 2190, 2191, 2670, 2672, 2673, 2674, 2675, 2676, 2677,
    2678, 2679, 2680, 2681, 2682, 2683, 2684, 2685, 2968, 2969, 2970, 2971,
    2972, 2973, 2974, 2975, 2976, 2977, 2978, 3194, 3195, 3196, 3197, 3198,
    3199, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3210, 3211, 3212,
    3213, 3214, 3215, 3216, 3217, 3224, 3225, 3226, 3227, 3228, 3229, 3230,
    3231, 3232, 3233, 3234, 3235, 3276, 3314, 4097, 4098, 4099, 4100, 4101,
    4102, 4103, 4104, 4105, 4106, 4115, 4116, 4117, 4118, 4119, 4120, 4121,
    4122, 4123, 4132, 4133, 4134, 4135, 4136, 4137, 4138, 10082, 10083,
    12351, 12352, 12353, 12354, 12355, 12356, 12357, 12358, 12359, 12360,
    12361, 12362, 12363, 12364, 12365, 12366, 12893, 12894, 12895, 12896,
    12897, 12898, 12899, 12900, 12901, 12902, 12903, 12904, 12907, 12908,
    12909, 13348, 13349, 13350, 13351, 13352, 13353, 13354, 13355, 13356,
    13357, 13358, 13405, 13406, 13407, 13408, 13409, 13410, 13411, 13412,
    16396, 18033, 18034, 19028, 19033, 19545, 19546, 19553, 19554, 19555,
    19556, 19557, 19558, 19559, 19560, 19561, 19562, 19563, 19564, 19565,
    19566, 19567, 19568, 19569, 19570, 19571, 19572, 19573, 19574, 19575,
    19576, 19577, 19578, 19579, 19580, 19581, 19582, 19583, 19585, 19839,
    19840, 19841, 19842, 19843, 19844, 19845, 19846, 19847, 19848, 19849,
    19850, 19851, 19852, 19853, 19854, 19855, 19856, 19857, 19858, 19859,
    19863, 21053, 21054, 21055, 21056, 21057, 21058, 21059, 21060, 21061,
    21062, 21063, 21064, 21065, 21066, 21067, 21068, 21069, 21070, 21071,
    21072, 21073, 21074, 21075, 21076, 21077, 21078, 21079, 21080, 21081,
    21082, 21083, 21084, 21085, 21086, 21087, 21088, 21089, 21509, 23295,
    23296, 23299, 23300, 23301, 24715, 24717, 24718, 24719, 24720, 24721,
    25328, 25334, 25336, 25337, 25338, 25339, 25340, 25341, 25342, 25346,
    25347, 25348, 25349, 25350, 25351, 25352, 25353, 25354, 25355, 25356,
    25357, 26480, 26482, 26483, 26485, 26486, 26487, 26488, 26489, 26490,
    26491, 26492, 26493, 26497, 26498, 28027, 28028, 28029, 28030, 28031,
    28032, 28033, 28034, 28035, 28036, 28037, 28038, 28039, 28040, 28041,
    28042, 28043, 28044, 28045, 28046, 28047, 32348, 32350, 32351, 32352,
    32353, 32354, 32355, 32356, 32357, 32359, 32362, 32364, 32372, 32377,
    32381, 32383, 32385, 32386, 32390, 32419, 32424, 32427, 32431, 33998,
    33999, 34012, 34013, 34357, 36070, 36071, 36072, 36073, 36077, 36078,
    36079, 36080, 36082, 36083, 36085, 36086, 36090, 36091, 36092, 36093,
    36094, 36095, 36096, 36098, 36102, 36105, 36113, 36118, 36126, 36127,
    36397, 36398, 38927, 41195, 50484, 50485, 50486, 50487, 50488, 50489,
    50490, 50491, 50492, 50493, 50494, 50495, 50496, 50497, 50498, 50499,
    50500, 50501, 50502, 50503, 50504, 50505, 50506, 50507, 50508, 50509,
    50510, 50511, 50512, 50513, 50514, 50515, 50516, 50517, 50518, 50519,
    50520, 50521, 50522, 50523, 50524, 50525, 50526, 50527, 50528, 50529,
    50530, 50531, 50532, 50533, 50534, 50535, 50536, 50537, 50538, 55774,
    56898, 56901, 56903, 56905, 56910, 56911, 58596, 58597, 58598, 58599,
    58600, 58601, 58602, 58603, 58604, 58605, 58606, 58607, 58608, 58609,
    58610, 58611, 58612, 58613, 58614, 58615, 58616, 58617, 58618, 58619,
    58620, 58621, 58622, 58623, 58624, 58625, 58626, 58627, 58629, 59517,
    59518, 59845, 59846, 59847, 59848, 59850, 59851, 59852, 61918, 63195,
    63197, 63198, 66780, 74091, 91692, 92524, 92525, 92526, 92527, 92528,
    92529, 92530, 92531, 92532, 92533, 92534, 92535, 92536, 92537, 92538,
    92539, 92540, 92541, 92542, 92543, 92544, 92545, 92546, 92547, 92548,
    92549, 92550, 92551, 92552, 92693, 92694, 92695, 92696, 92699, 92700,
    95449, 98343, 98347, 98348, 98349, 98350, 98351, 98354, 103793, 103794,
    103795, 103796, 105188, 111094, 112898, 113528, 113568, 113569, 113570,
    113571, 113572, 113574, 113575, 113576, 113577, 113752, 113755, 113756,
    126046, 130125, 136101, 137644, 137646, 141076, 141077, 142339, 142341,
    142838, 142873, 142874, 143249, 143251, 143253, 143254, 143255, 143256,
    143317, 143321, 143322, 143324, 143333, 143334, 143336, 143338, 143343,
    143344, 143399, 144162, 146079, 146080, 146081, 146096, 148423, 148424,
    148425, 148426, 149024, 150087, 151974, 151975, 151976, 151977, 151978,
    151979, 151980, 151981, 151982, 151983, 151984, 152574, 152575, 152576,
    152577, 152578, 152579, 152580, 152581, 152582, 152584, 152585, 152586,
    152587, 164908, 165549, 165557, 165558, 169967, 170354, 170355, 171524,
    171525, 171526, 171527, 171528, 171529, 171530, 171531, 171532, 171533,
    171534, 171704, 171708, 171709, 171710, 171711, 171712, 171748, 171749,
    171766, 171770, 172957, 172958, 172959, 172960, 172961, 172962, 172963,
    172964, 172965, 172966, 172967, 172968, 172969, 172970, 172971, 172972,
    172973, 172974, 172975, 172976, 172977, 172978, 172979, 172980, 172981,
    172982, 172983, 172984, 172985, 172986, 172987, 172988, 172989, 172990,
    172991, 172992, 172993, 172994, 172995, 172996, 172997, 173005, 173006,
    173016, 173017, 173018, 173020, 173021, 173022, 173024, 173025, 173044,
    173056, 173078, 173079, 173080, 173081, 173082, 173083, 173084, 173085,
    173086, 173157, 173160, 173161, 173162, 173168, 173169, 173170, 173173,
    173174, 173177, 173202, 173203, 173215, 173216, 173217, 173218, 173219,
    173220, 173222, 174857, 174858, 175319, 175433, 175434, 175435, 175436,
    175437, 175438, 175439, 175440, 175441, 175442, 175443, 175444, 175445,
    175447, 175449, 175450, 175454, 175455, 175457, 175458, 175459, 175460,
    175461, 175462, 175463, 175466, 175467, 175469, 175470, 175471, 175472,
    175474, 175477, 175478, 175479, 175481, 175483, 175484, 175824, 175825,
    176364, 176365, 176369, 176370, 176794, 176795, 176796, 176797, 176798,
    176799, 176800, 176801, 176945, 176946, 176947, 176948, 176949, 176950,
    176958, 176959, 176960, 176961, 176967, 176968, 176969, 176970, 176971,
    176972, 176973, 176978, 176979, 176980, 176981, 176982, 176983, 176984,
    176985, 176986, 176987, 176988, 176989, 176990, 176991, 176992, 176993,
    176994, 177064, 177104, 177105, 177106, 177107, 177108, 177109, 177110,
    177111, 177112, 177113, 177114, 177115, 177116, 177117, 177118, 177119,
    177120, 177121, 177122, 177123, 177124, 177125, 177126, 177127, 177128,
    177129, 177130, 177131, 177132, 177133, 177134, 177135, 177136, 177137,
    177138, 177139, 177140, 177141, 177142, 177143, 177144, 177145, 177146,
    177147, 177148, 177149, 177150, 177151, 177152, 177153, 177154, 177155,
    177185, 177186, 177265, 177266, 177267, 177268, 177269, 177270, 178911,
    179144, 179224, 179725, 179726, 179727, 179728, 179729, 179730, 179731,
    179732, 179733, 179734, 179736, 179737, 179738, 179739, 179740, 179742,
    179743, 179744, 179963
    )
;
