-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add German locale strings to world database
--
-- This update will populate the world database with German locale strings.

-- - Ensure locale templates exist -------------------------------------------
INSERT IGNORE INTO `locales_item` (`entry`) SELECT `entry` FROM `item_template`;

-- - Insert localized item template strings ----------------------------------
UPDATE `locales_item` SET `name_loc3` = "Abgenutztes Kurzschwert" WHERE `entry` = 25;
UPDATE `locales_item` SET `name_loc3` = "Gebogener Stab" WHERE `entry` = 35;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzter Streitkolben" WHERE `entry` = 36;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzte Axt" WHERE `entry` = 37;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenhemd" WHERE `entry` = 38;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenhose" WHERE `entry` = 39;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenstiefel" WHERE `entry` = 40;
UPDATE `locales_item` SET `name_loc3` = "Knappenstiefel" WHERE `entry` = 43;
UPDATE `locales_item` SET `name_loc3` = "Knappenhose" WHERE `entry` = 44;
UPDATE `locales_item` SET `name_loc3` = "Knappenhemd" WHERE `entry` = 45;
UPDATE `locales_item` SET `name_loc3` = "Straßenräuberschuhe" WHERE `entry` = 47;
UPDATE `locales_item` SET `name_loc3` = "Straßenräuberhose" WHERE `entry` = 48;
UPDATE `locales_item` SET `name_loc3` = "Straßenräuberhemd" WHERE `entry` = 49;
UPDATE `locales_item` SET `name_loc3` = "Neophytenstiefel" WHERE `entry` = 51;
UPDATE `locales_item` SET `name_loc3` = "Neophytenhose" WHERE `entry` = 52;
UPDATE `locales_item` SET `name_loc3` = "Neophytenhemd" WHERE `entry` = 53;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingsstiefel" WHERE `entry` = 55;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingsrobe" WHERE `entry` = 56;
UPDATE `locales_item` SET `name_loc3` = "Akolytenrobe" WHERE `entry` = 57;
UPDATE `locales_item` SET `name_loc3` = "Akolytenschuhe" WHERE `entry` = 59;
UPDATE `locales_item` SET `name_loc3` = "Zähes Stockfleisch" WHERE `entry` = 117;
UPDATE `locales_item` SET `name_loc3` = "Rohlingshose" WHERE `entry` = 120;
UPDATE `locales_item` SET `name_loc3` = "Rohlingsstiefel" WHERE `entry` = 121;
UPDATE `locales_item` SET `name_loc3` = "Fallenstellerhemd" WHERE `entry` = 127;
UPDATE `locales_item` SET `name_loc3` = "Unverwüstliche Fallenstellerstiefel" WHERE `entry` = 129;
UPDATE `locales_item` SET `name_loc3` = "Muskelprotzhose" WHERE `entry` = 139;
UPDATE `locales_item` SET `name_loc3` = "Muskelprotzstiefel" WHERE `entry` = 140;
UPDATE `locales_item` SET `name_loc3` = "Unverwüstliche Fallenstellerhose" WHERE `entry` = 147;
UPDATE `locales_item` SET `name_loc3` = "Unverwüstliches Fallenstellerhemd" WHERE `entry` = 148;
UPDATE `locales_item` SET `name_loc3` = "Primitiver Kilt" WHERE `entry` = 153;
UPDATE `locales_item` SET `name_loc3` = "Primitiver Mantel" WHERE `entry` = 154;
UPDATE `locales_item` SET `name_loc3` = "Erfrischendes Quellwasser" WHERE `entry` = 159;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingshose" WHERE `entry` = 1395;
UPDATE `locales_item` SET `name_loc3` = "Akolytenhose" WHERE `entry` = 1396;
UPDATE `locales_item` SET `name_loc3` = "Darnassischer Blauschimmelkäse" WHERE `entry` = 2070;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzter Dolch" WHERE `entry` = 2092;
UPDATE `locales_item` SET `name_loc3` = "Leichter Köcher" WHERE `entry` = 2101;
UPDATE `locales_item` SET `name_loc3` = "Kleiner Munitionsbeutel" WHERE `entry` = 2102;
UPDATE `locales_item` SET `name_loc3` = "Rohlingshemd" WHERE `entry` = 2105;
UPDATE `locales_item` SET `name_loc3` = "Kampferprobter Hammer" WHERE `entry` = 2361;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzter Holzschild" WHERE `entry` = 2362;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzter Kurzbogen" WHERE `entry` = 2504;
UPDATE `locales_item` SET `name_loc3` = "Alte Donnerbüchse" WHERE `entry` = 2508;
UPDATE `locales_item` SET `name_loc3` = "Rauer Pfeil" WHERE `entry` = 2512;
UPDATE `locales_item` SET `name_loc3` = "Leichtes Geschoss" WHERE `entry` = 2516;
UPDATE `locales_item` SET `name_loc3` = "Zerbrochenes kleines Wurfmesser" WHERE `entry` = 2947;
UPDATE `locales_item` SET `name_loc3` = "Zerbrochene kunstlose Wurfaxt" WHERE `entry` = 3111;
UPDATE `locales_item` SET `name_loc3` = "Handgefertigter Stab" WHERE `entry` = 3661;
UPDATE `locales_item` SET `name_loc3` = "Glänzender roter Apfel" WHERE `entry` = 4536;
UPDATE `locales_item` SET `name_loc3` = "Zäher Brocken Brot" WHERE `entry` = 4540;
UPDATE `locales_item` SET `name_loc3` = "Waldpilzkappe" WHERE `entry` = 4604;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingshemd" WHERE `entry` = 6096;
UPDATE `locales_item` SET `name_loc3` = "Akolytenhemd" WHERE `entry` = 6097;
UPDATE `locales_item` SET `name_loc3` = "Neophytenrobe" WHERE `entry` = 6098;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingsrobe" WHERE `entry` = 6116;
UPDATE `locales_item` SET `name_loc3` = "Knappenhemd" WHERE `entry` = 6117;
UPDATE `locales_item` SET `name_loc3` = "Knappenhose" WHERE `entry` = 6118;
UPDATE `locales_item` SET `name_loc3` = "Neophytenrobe" WHERE `entry` = 6119;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenhemd" WHERE `entry` = 6120;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenhose" WHERE `entry` = 6121;
UPDATE `locales_item` SET `name_loc3` = "Rekrutenstiefel" WHERE `entry` = 6122;
UPDATE `locales_item` SET `name_loc3` = "Novizenrobe" WHERE `entry` = 6123;
UPDATE `locales_item` SET `name_loc3` = "Novizenhose" WHERE `entry` = 6124;
UPDATE `locales_item` SET `name_loc3` = "Muskelprotzharnisch" WHERE `entry` = 6125;
UPDATE `locales_item` SET `name_loc3` = "Fallenstellerhose" WHERE `entry` = 6126;
UPDATE `locales_item` SET `name_loc3` = "Fallenstellerstiefel" WHERE `entry` = 6127;
UPDATE `locales_item` SET `name_loc3` = "Akolytenrobe" WHERE `entry` = 6129;
UPDATE `locales_item` SET `name_loc3` = "Primitiver Mantel" WHERE `entry` = 6134;
UPDATE `locales_item` SET `name_loc3` = "Primitiver Kilt" WHERE `entry` = 6135;
UPDATE `locales_item` SET `name_loc3` = "Rohlingshemd" WHERE `entry` = 6136;
UPDATE `locales_item` SET `name_loc3` = "Rohlingshose" WHERE `entry` = 6137;
UPDATE `locales_item` SET `name_loc3` = "Rohlingsstiefel" WHERE `entry` = 6138;
UPDATE `locales_item` SET `name_loc3` = "Novizenrobe" WHERE `entry` = 6139;
UPDATE `locales_item` SET `name_loc3` = "Lehrlingsrobe" WHERE `entry` = 6140;
UPDATE `locales_item` SET `name_loc3` = "Neophytenrobe" WHERE `entry` = 6144;
UPDATE `locales_item` SET `name_loc3` = "Angelrute" WHERE `entry` = 6256;
UPDATE `locales_item` SET `name_loc3` = "Ruhestein" WHERE `entry` = 6948;
UPDATE `locales_item` SET `name_loc3` = "Test Stationery" WHERE `entry` = 8164;
UPDATE `locales_item` SET `name_loc3` = "Schreibwaren" WHERE `entry` = 9311;
UPDATE `locales_item` SET `name_loc3` = "Abgenutzte Streitaxt" WHERE `entry` = 12282;
UPDATE `locales_item` SET `name_loc3` = "Blizzard Briefpapier" WHERE `entry` = 18154;
UPDATE `locales_item` SET `name_loc3` = "Auktionspapiere" WHERE `entry` = 21140;
UPDATE `locales_item` SET `name_loc3` = "Valentinsbriefpapier" WHERE `entry` = 22058;
