-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add inns to the world database
--
-- This update will populate the world database with data required to rest in
-- inns all over the world.
--

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.1.3 (dev-0009)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.1.3 (dev-0009)'
WHERE
    `version`             = 'mangos-zero - version 0.1.3 (dev-0008)'
;

-- Insert rest area triggers -------------------------------------------------
INSERT INTO `areatrigger_tavern`
    (`id`,  `name`)
VALUES
     (  71, 'Westfall - Sentinel Hill Inn')
    ,( 178, 'Strahnbrad')
    ,( 562, 'Elwynn Forest - Goldshire - Lion\'s Pride Inn')
    ,( 682, 'Redridge Mountains - Lakeshire Inn')
    ,( 707, 'Duskwood - Darkshire - Scarlet Raven Inn')
    ,( 708, 'Hillsbrad Foothills - Southshore Inn')
    ,( 709, 'Dustwallow Marsh - Theramore Isle')
    ,( 710, 'Dun Morogh - Kharanos - Thunderbrew Distillery')
    ,( 712, 'Loch Modan - Thelsamar - Stoutlager Inn')
    ,( 713, 'Wetlands - Menethil Harbor - Deepwater Tavern')
    ,( 715, 'Teldrassil - Dolanaar')
    ,( 716, 'Darkshore - Auberdine')
    ,( 717, 'Ashenvale - Astranaar')
    ,( 719, 'Tirisfal Glades - Brill - Gallows\' End Tavern')
    ,( 720, 'Silverpine Forest ')
    ,( 721, 'Hillsbrad Foothills ')
    ,( 722, 'Mulgore ')
    ,( 742, 'The Barrens ')
    ,( 743, 'The Barrens ')
    ,( 843, 'Durotar ')
    ,( 844, 'Swamp of Sorrows ')
    ,( 862, 'Stranglethorn Vale ')
    ,( 982, 'The Barrens ')
    ,(1022, 'Stonetalon Mountains ')
    ,(1023, 'Tanaris ')
    ,(1024, 'Feralas ')
    ,(1025, 'Feralas ')
    ,(1042, 'Wildhammer Keep')
    ,(1606, 'Badlands ')
    ,(1646, 'Arathi Highlands ')
    ,(2266, 'Desolace ')
    ,(2267, 'Desolace ')
    ,(2286, 'Thousand Needles ')
    ,(2287, 'Winterspring ')
    ,(2610, 'Ashenvale ')
    ,(2786, 'Stormwind backup rest')
    ,(3547, 'The Undercity')
    ,(3690, 'Revantusk Village')
    ,(3886, 'Grom\'gol Base Camp')
    ,(3985, 'Cenarion Hold')
    ,(4058, 'Light\'s Hope Chapel')
    ,(4090, 'Stonetalon Peak')
;