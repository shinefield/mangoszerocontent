-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add holiday and event schedules
--
-- This update will populate the world database with holiday and event dates,
-- allowing us to added event content in future updates.
--
-- Global Unique Identifier ranges used:
--
-- - Events, seasonal: 1-50
-- - Events, weekly:   51-100
-- - Events, monthly:  101-150

-- Update world database version ---------------------------------------------
UPDATE `db_version`
SET
    `version`             = 'mangos-zero - version 0.1.3 (dev-0010)',
    `creature_ai_version` = 'mangos-zero Artificial Creature Intelligence - version 0.1.3 (dev-0010)'
WHERE
    `version`             = 'mangos-zero - version 0.1.3 (dev-0009)'
;

-- Insert recurring seasonal events ------------------------------------------
INSERT INTO `game_event`
    (`entry`,`start_time`,          `end_time`,             `occurence`,`length`, `holiday`, `description`)
VALUES
     (  1,   '2006-01-27 00:00:00', '2020-12-31 22:59:59',  525600,     28800,    327,       'Lunar Festival')
    ,(  2,   '2006-02-10 00:00:00', '2020-12-31 22:59:59',  525600,     5760,     335,       'Love is in the Air')
    ,(  3,   '2006-04-12 00:00:00', '2020-12-31 22:59:59',  524160,     7200,     181,       'Noblegarden')
    ,(  4,   '2006-05-01 00:00:00', '2020-12-31 22:59:59',  525600,     11520,    201,       'Children\' s Week ')
    ,(  5,   '2006-06-21 00:00:00', '2020-12-31 22:59:59',  525600,     20160,    341,       'Midsummer Fire Festival')
    ,(  6,   '2006-09-30 00:00:00', '2020-12-31 22:59:59',  525600,      1440,     62,       'Peon Day')
    ,(  7,   '2006-10-06 00:00:00', '2020-12-31 22:59:59',  525600,     10080,    321,       'Harvest Festival')
    ,(  8,   '2006-10-18 00:00:00', '2020-12-31 22:59:59',  525600,     21600,    324,       'Hallow\'s End')
    ,(  9,   '2006-12-15 00:00:00', '2020-12-31 22:59:59',  525600,     27360,    141,       'Feast of Winter Veil' )
;

-- Insert weekly events ------------------------------------------------------
INSERT INTO `game_event`
    (`entry`,`start_time`,          `end_time`,             `occurence`,`length`, `holiday`, `description`)
VALUES
     ( 51,   '2006-01-19 23:00:00', '2020-12-31 22:59:59',  40320,      6240,     283,       'Call to Arms: Alterac Valley!')
    ,( 52,   '2006-01-26 23:00:00', '2020-12-31 22:59:59',  40320,      6240,     284,       'Call to Arms: Warsong Gulch!')
    ,( 53,   '2006-01-05 23:00:00', '2020-12-31 22:59:59',  40320,      6240,     285,       'Call to Arms: Arathi Basin!')
    ,( 54,   '2006-01-01 11:00:00', '2020-12-31 22:59:59',  10080,      120,      301,       'Fishing Extravaganza')
    ,( 55,   '2006-01-04 14:00:00', '2020-12-30 23:00:00',  10080,      180,      301,       'Fishing Extravaganza (Turn-in)')
;

-- Insert monthly events -----------------------------------------------------
INSERT INTO `game_event`
    (`entry`,`start_time`,          `end_time`,             `occurence`,`length`, `holiday`, `description`)
VALUES
     (101,    '2006-02-05 23:00:00', '2020-12-31 22:59:59',  131040,     4320,     374,       'Darkmoon Faire Building (Elwynn)')
    ,(102,    '2006-02-08 23:00:00', '2020-12-31 22:59:59',  96480,      10080,    374,       'Darkmoon Faire (Elwynn)')
    ,(103,    '2006-01-05 23:00:00', '2020-12-31 22:59:59',  131040,     4320,     374,       'Darkmoon Faire Building (Mulgore)')
    ,(104,    '2006-01-08 23:00:00', '2020-12-31 22:59:59',  96480,      10080,    375,       'Darkmoon Faire (Mulgore)')
;
