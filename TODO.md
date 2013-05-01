Creature templates, game event
==============================

Creature templates, critters
============================

Creature templates, zone 1
==========================

    SELECT
        `entry`,
        `modelid_1`,
        `modelid_2`,
        `name`,
        `subname`,
        `faction_A`,
        `faction_H`,
        `type`,
        `family`,
        `unit_class`,
        `rank`,
        `minlevel`,
        `maxlevel`,
        `minhealth`,
        `maxhealth`,
        `minmana`,
        `maxmana`,
        `dmgschool`,
        `attackpower`,
        `baseattacktime`,
        `mindmg`,
        `maxdmg`,
        `minrangedmg`,
        `maxrangedmg`,
        `rangeattacktime`,
        `rangedattackpower`,
        `speed_walk`,
        `speed_run`
    FROM `creature_template`
    WHERE `entry` IN ()
    ORDER BY `entry`

