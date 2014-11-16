-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_creature` (`entry`) SELECT `Entry` FROM `creature_template`;

-- - Insert localized creature template strings ------------------------------
UPDATE `locales_creature` SET `name_loc3` = "Wegpunkt", `subname_loc3` = "GM Sichtkontrolle" WHERE `entry` = 1;
UPDATE `locales_creature` SET `name_loc3` = "Spawnpunkt", `subname_loc3` = "GM Sichtkontrolle" WHERE `entry` = 2;
UPDATE `locales_creature` SET `name_loc3` = "Höllenbestie" WHERE `entry` = 89;
UPDATE `locales_creature` SET `name_loc3` = "Wichtel" WHERE `entry` = 416;
UPDATE `locales_creature` SET `name_loc3` = "Teufelsjäger" WHERE `entry` = 417;
UPDATE `locales_creature` SET `name_loc3` = "Reitgreif" WHERE `entry` = 541;
UPDATE `locales_creature` SET `name_loc3` = "Leerwandler" WHERE `entry` = 1860;
UPDATE `locales_creature` SET `name_loc3` = "Sukkubus" WHERE `entry` = 1863;
UPDATE `locales_creature` SET `name_loc3` = "Windfahrer" WHERE `entry` = 2224;
UPDATE `locales_creature` SET `name_loc3` = "Fledermausreittier" WHERE `entry` = 3574;
UPDATE `locales_creature` SET `name_loc3` = "Hippogryphenreittier" WHERE `entry` = 3837;
UPDATE `locales_creature` SET `name_loc3` = "Bärengestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 4253;
UPDATE `locales_creature` SET `name_loc3` = "Bärengestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 4261;
UPDATE `locales_creature` SET `name_loc3` = "Auge von Kilrogg" WHERE `entry` = 4277;
UPDATE `locales_creature` SET `name_loc3` = "Wassergestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 4408;
UPDATE `locales_creature` SET `name_loc3` = "Wassergestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 4410;
UPDATE `locales_creature` SET `name_loc3` = "Wächter von Blizzard" WHERE `entry` = 5764;
UPDATE `locales_creature` SET `name_loc3` = "Geistheiler" WHERE `entry` = 6491;
UPDATE `locales_creature` SET `name_loc3` = "Katzengestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 6571;
UPDATE `locales_creature` SET `name_loc3` = "Katzengestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 6572;
UPDATE `locales_creature` SET `name_loc3` = "Reisegestalt", `subname_loc3` = "Druide" WHERE `entry` = 6573;
UPDATE `locales_creature` SET `name_loc3` = "Irrwisch", `subname_loc3` = "Geist Sichtkontrolle" WHERE `entry` = 12861;
UPDATE `locales_creature` SET `name_loc3` = "Mondkingestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 15313;
UPDATE `locales_creature` SET `name_loc3` = "Mondkingestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 15314;
