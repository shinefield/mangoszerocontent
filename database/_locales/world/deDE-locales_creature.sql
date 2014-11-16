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
UPDATE `locales_creature` SET `name_loc3` = "Alamar Grimm", `subname_loc3` = "Hexenmeisterlehrer" WHERE `entry` = 460;
UPDATE `locales_creature` SET `name_loc3` = "Reitgreif" WHERE `entry` = 541;
UPDATE `locales_creature` SET `name_loc3` = "Sten Starkarm" WHERE `entry` = 658;
UPDATE `locales_creature` SET `name_loc3` = "Struppiger Waldwolf" WHERE `entry` = 704;
UPDATE `locales_creature` SET `name_loc3` = "Struppiger junger Wolf" WHERE `entry` = 705;
UPDATE `locales_creature` SET `name_loc3` = "Trollwelpe der Frostmähnen" WHERE `entry` = 706;
UPDATE `locales_creature` SET `name_loc3` = "Trogg der Felsenkiefer" WHERE `entry` = 707;
UPDATE `locales_creature` SET `name_loc3` = "Kleiner Klippeneber" WHERE `entry` = 708;
UPDATE `locales_creature` SET `name_loc3` = "Balir Frosthammer" WHERE `entry` = 713;
UPDATE `locales_creature` SET `name_loc3` = "Talin Kühnauge" WHERE `entry` = 714;
UPDATE `locales_creature` SET `name_loc3` = "Bulliger Trogg der Felsenkiefer" WHERE `entry` = 724;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger von Eisenschmiede" WHERE `entry` = 727;
UPDATE `locales_creature` SET `name_loc3` = "Grelin Weißbart" WHERE `entry` = 786;
UPDATE `locales_creature` SET `name_loc3` = "Grik'nir der Kalte" WHERE `entry` = 808;
UPDATE `locales_creature` SET `name_loc3` = "Adlin Stolzmut", `subname_loc3` = "Gemischtwaren" WHERE `entry` = 829;
UPDATE `locales_creature` SET `name_loc3` = "Durnan Pelznaht", `subname_loc3` = "Tuch- & Lederrüstungshändler" WHERE `entry` = 836;
UPDATE `locales_creature` SET `name_loc3` = "Branstock Khalder", `subname_loc3` = "Priesterlehrer" WHERE `entry` = 837;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger der Eisklamm" WHERE `entry` = 853;
UPDATE `locales_creature` SET `name_loc3` = "Thorgas Grimson", `subname_loc3` = "Jägerlehrer" WHERE `entry` = 895;
UPDATE `locales_creature` SET `name_loc3` = "Thran Khorman", `subname_loc3` = "Kriegerlehrer" WHERE `entry` = 912;
UPDATE `locales_creature` SET `name_loc3` = "Solm Hargrin", `subname_loc3` = "Schurkenlehrer" WHERE `entry` = 916;
UPDATE `locales_creature` SET `name_loc3` = "Bromos Grummler", `subname_loc3` = "Paladinlehrer" WHERE `entry` = 926;
UPDATE `locales_creature` SET `name_loc3` = "Marryk Nurribit", `subname_loc3` = "Magielehrer" WHERE `entry` = 944;
UPDATE `locales_creature` SET `name_loc3` = "Rybrad Kaltufer", `subname_loc3` = "Waffenschmied" WHERE `entry` = 945;
UPDATE `locales_creature` SET `name_loc3` = "Novize der Frostmähnen" WHERE `entry` = 946;
UPDATE `locales_creature` SET `name_loc3` = "Grundel Harkin", `subname_loc3` = "Rüstungsschmied" WHERE `entry` = 1104;
UPDATE `locales_creature` SET `name_loc3` = "Schädelhauer der Felsenkiefer" WHERE `entry` = 1115;
UPDATE `locales_creature` SET `name_loc3` = "Wegelagerer der Felsenkiefer" WHERE `entry` = 1116;
UPDATE `locales_creature` SET `name_loc3` = "Knochenknacker der Felsenkiefer" WHERE `entry` = 1117;
UPDATE `locales_creature` SET `name_loc3` = "Kreuzbrecher der Felsenkiefer" WHERE `entry` = 1118;
UPDATE `locales_creature` SET `name_loc3` = "Baumfaust" WHERE `entry` = 1119;
UPDATE `locales_creature` SET `name_loc3` = "Troll der Frostmähnen" WHERE `entry` = 1120;
UPDATE `locales_creature` SET `name_loc3` = "Schneeschreiter der Frostmähnen" WHERE `entry` = 1121;
UPDATE `locales_creature` SET `name_loc3` = "Balgabzieher der Frostmähnen" WHERE `entry` = 1122;
UPDATE `locales_creature` SET `name_loc3` = "Kopfjäger der Frostmähnen" WHERE `entry` = 1123;
UPDATE `locales_creature` SET `name_loc3` = "Schattenzauberer der Frostmähnen" WHERE `entry` = 1124;
UPDATE `locales_creature` SET `name_loc3` = "Klippeneber" WHERE `entry` = 1125;
UPDATE `locales_creature` SET `name_loc3` = "Großer Klippeneber" WHERE `entry` = 1126;
UPDATE `locales_creature` SET `name_loc3` = "Alter Klippeneber" WHERE `entry` = 1127;
UPDATE `locales_creature` SET `name_loc3` = "Junger Schwarzbär" WHERE `entry` = 1128;
UPDATE `locales_creature` SET `name_loc3` = "Schwarzbär" WHERE `entry` = 1129;
UPDATE `locales_creature` SET `name_loc3` = "Bjarn" WHERE `entry` = 1130;
UPDATE `locales_creature` SET `name_loc3` = "Winterwolf" WHERE `entry` = 1131;
UPDATE `locales_creature` SET `name_loc3` = "Holzkopf" WHERE `entry` = 1132;
UPDATE `locales_creature` SET `name_loc3` = "Verhungernder Winterwolf" WHERE `entry` = 1133;
UPDATE `locales_creature` SET `name_loc3` = "Junger Wendigo" WHERE `entry` = 1134;
UPDATE `locales_creature` SET `name_loc3` = "Wendigo" WHERE `entry` = 1135;
UPDATE `locales_creature` SET `name_loc3` = "Edan der Heuler" WHERE `entry` = 1137;
UPDATE `locales_creature` SET `name_loc3` = "Eisklauenbär" WHERE `entry` = 1196;
UPDATE `locales_creature` SET `name_loc3` = "Halbwüchsiger Schneeleopard" WHERE `entry` = 1199;
UPDATE `locales_creature` SET `name_loc3` = "Schneeleopard" WHERE `entry` = 1201;
UPDATE `locales_creature` SET `name_loc3` = "Lepragnom" WHERE `entry` = 1211;
UPDATE `locales_creature` SET `name_loc3` = "Maxan Anvol", `subname_loc3` = "Priesterlehrer" WHERE `entry` = 1226;
UPDATE `locales_creature` SET `name_loc3` = "Magis Funkelmantel", `subname_loc3` = "Magielehrer" WHERE `entry` = 1228;
UPDATE `locales_creature` SET `name_loc3` = "Granis Flinkaxt", `subname_loc3` = "Kriegerlehrer" WHERE `entry` = 1229;
UPDATE `locales_creature` SET `name_loc3` = "Grif Wildherz", `subname_loc3` = "Jägerlehrer" WHERE `entry` = 1231;
UPDATE `locales_creature` SET `name_loc3` = "Azar Hammerkraft", `subname_loc3` = "Paladinlehrer" WHERE `entry` = 1232;
UPDATE `locales_creature` SET `name_loc3` = "Hogral Bakkan", `subname_loc3` = "Schurkenlehrer" WHERE `entry` = 1234;
UPDATE `locales_creature` SET `name_loc3` = "Kazan Mogosh", `subname_loc3` = "Lebensmittel- & Getränkehändler" WHERE `entry` = 1237;
UPDATE `locales_creature` SET `name_loc3` = "Gamili Eisfell", `subname_loc3` = "Tuch- & Lederrüstungshändler" WHERE `entry` = 1238;
UPDATE `locales_creature` SET `name_loc3` = "Boran Eisenklirr", `subname_loc3` = "Rüstungsschmied" WHERE `entry` = 1240;
UPDATE `locales_creature` SET `name_loc3` = "Tognus Funkenfeuer", `subname_loc3` = "Schmiedekunstlehrer" WHERE `entry` = 1241;
UPDATE `locales_creature` SET `name_loc3` = "Hegnar Schlingerschuss", `subname_loc3` = "Schusswaffenschmied" WHERE `entry` = 1243;
UPDATE `locales_creature` SET `name_loc3` = "Kogan Schmiedestein" WHERE `entry` = 1245;
UPDATE `locales_creature` SET `name_loc3` = "Gastwirt Belm", `subname_loc3` = "Gastwirt" WHERE `entry` = 1247;
UPDATE `locales_creature` SET `name_loc3` = "Senir Weißbart" WHERE `entry` = 1252;
UPDATE `locales_creature` SET `name_loc3` = "Vater Gavin", `subname_loc3` = "Die Argentumdämmerung" WHERE `entry` = 1253;
UPDATE `locales_creature` SET `name_loc3` = "Großknecht Steinbraue", `subname_loc3` = "Minenarbeiterliga" WHERE `entry` = 1254;
UPDATE `locales_creature` SET `name_loc3` = "Ausgrabungsleiter Gehn", `subname_loc3` = "Forscherliga" WHERE `entry` = 1255;
UPDATE `locales_creature` SET `name_loc3` = "Steinbruchmeister Thesten", `subname_loc3` = "Minenarbeiterliga" WHERE `entry` = 1256;
UPDATE `locales_creature` SET `name_loc3` = "Altvater Arktikus" WHERE `entry` = 1260;
UPDATE `locales_creature` SET `name_loc3` = "Veron Bernruh", `subname_loc3` = "Widderzüchter" WHERE `entry` = 1261;
UPDATE `locales_creature` SET `name_loc3` = "Yarlyn Bernruh" WHERE `entry` = 1263;
UPDATE `locales_creature` SET `name_loc3` = "Rudra Bernruh" WHERE `entry` = 1265;
UPDATE `locales_creature` SET `name_loc3` = "Tundra MacGrann" WHERE `entry` = 1266;
UPDATE `locales_creature` SET `name_loc3` = "Ragnar Donnerbräu" WHERE `entry` = 1267;
UPDATE `locales_creature` SET `name_loc3` = "Ozzie Wechselvolt" WHERE `entry` = 1268;
UPDATE `locales_creature` SET `name_loc3` = "Razzle Flinkspross" WHERE `entry` = 1269;
UPDATE `locales_creature` SET `name_loc3` = "Eisbart der Alte" WHERE `entry` = 1271;
UPDATE `locales_creature` SET `name_loc3` = "Grawn Thromwyn", `subname_loc3` = "Waffenschmied" WHERE `entry` = 1273;
UPDATE `locales_creature` SET `name_loc3` = "Lehrling Soren" WHERE `entry` = 1354;
UPDATE `locales_creature` SET `name_loc3` = "Koch Ghilm", `subname_loc3` = "Kochkunstlehrer" WHERE `entry` = 1355;
UPDATE `locales_creature` SET `name_loc3` = "Minenarbeiter Grothor" WHERE `entry` = 1358;
UPDATE `locales_creature` SET `name_loc3` = "Minenarbeiter Grumnal" WHERE `entry` = 1360;
UPDATE `locales_creature` SET `name_loc3` = "Jarven Donnerbräu" WHERE `entry` = 1373;
UPDATE `locales_creature` SET `name_loc3` = "Rejold Gerstenbräu" WHERE `entry` = 1374;
UPDATE `locales_creature` SET `name_loc3` = "Marleth Gerstenbräu" WHERE `entry` = 1375;
UPDATE `locales_creature` SET `name_loc3` = "Beldin Stahlrost" WHERE `entry` = 1376;
UPDATE `locales_creature` SET `name_loc3` = "Pilot Steinsegel" WHERE `entry` = 1377;
UPDATE `locales_creature` SET `name_loc3` = "Pilot Bellfiz" WHERE `entry` = 1378;
UPDATE `locales_creature` SET `name_loc3` = "Vagash" WHERE `entry` = 1388;
UPDATE `locales_creature` SET `name_loc3` = "Seher der Frostmähnen" WHERE `entry` = 1397;
UPDATE `locales_creature` SET `name_loc3` = "Avarus Kharag" WHERE `entry` = 1679;
UPDATE `locales_creature` SET `name_loc3` = "Vernarbter Klippeneber" WHERE `entry` = 1689;
UPDATE `locales_creature` SET `name_loc3` = "Thrawn Boltar", `subname_loc3` = "Schmiedekunstbedarf" WHERE `entry` = 1690;
UPDATE `locales_creature` SET `name_loc3` = "Kreg Bilmn", `subname_loc3` = "Gemischtwaren" WHERE `entry` = 1691;
UPDATE `locales_creature` SET `name_loc3` = "Golorn Frostbart", `subname_loc3` = "Handwerker" WHERE `entry` = 1692;
UPDATE `locales_creature` SET `name_loc3` = "Loslor Rudge", `subname_loc3` = "Ingenieursbedarf" WHERE `entry` = 1694;
UPDATE `locales_creature` SET `name_loc3` = "Keeg Gibn", `subname_loc3` = "Bier & Wein" WHERE `entry` = 1697;
UPDATE `locales_creature` SET `name_loc3` = "Frast Dokner", `subname_loc3` = "Waffenschmiedlehrling" WHERE `entry` = 1698;
UPDATE `locales_creature` SET `name_loc3` = "Gremlock Pilsnor", `subname_loc3` = "Kochkunstlehrer" WHERE `entry` = 1699;
UPDATE `locales_creature` SET `name_loc3` = "Paxton Ganter", `subname_loc3` = "Angellehrer" WHERE `entry` = 1700;
UPDATE `locales_creature` SET `name_loc3` = "Dank Feinschliff", `subname_loc3` = "Bergbaulehrer" WHERE `entry` = 1701;
UPDATE `locales_creature` SET `name_loc3` = "Bronk Muffenschlinger", `subname_loc3` = "Ingenieurslehrer" WHERE `entry` = 1702;
UPDATE `locales_creature` SET `name_loc3` = "Räuber der Felsenkiefer" WHERE `entry` = 1718;
UPDATE `locales_creature` SET `name_loc3` = "Leerwandler" WHERE `entry` = 1860;
UPDATE `locales_creature` SET `name_loc3` = "Sukkubus" WHERE `entry` = 1863;
UPDATE `locales_creature` SET `name_loc3` = "Tharek Schwarzstein" WHERE `entry` = 1872;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger Gerstenbräu" WHERE `entry` = 1959;
UPDATE `locales_creature` SET `name_loc3` = "Pilot Hammerfuß" WHERE `entry` = 1960;
UPDATE `locales_creature` SET `name_loc3` = "Marterklaue" WHERE `entry` = 1961;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger Thalos" WHERE `entry` = 1965;
UPDATE `locales_creature` SET `name_loc3` = "Senator Mehr Steingunst" WHERE `entry` = 1977;
UPDATE `locales_creature` SET `name_loc3` = "Windfahrer" WHERE `entry` = 2224;
UPDATE `locales_creature` SET `name_loc3` = "Thamner Pol", `subname_loc3` = "Arzt" WHERE `entry` = 2326;
UPDATE `locales_creature` SET `name_loc3` = "Peria Lamenur", `subname_loc3` = "Tierausbilderin" WHERE `entry` = 2878;
UPDATE `locales_creature` SET `name_loc3` = "Brudrak Harglhelm", `subname_loc3` = "Lederrüstungshändler" WHERE `entry` = 3162;
UPDATE `locales_creature` SET `name_loc3` = "Turuk Bernruh", `subname_loc3` = "Zwergenwaffenschmied" WHERE `entry` = 3177;
UPDATE `locales_creature` SET `name_loc3` = "Fledermausreittier" WHERE `entry` = 3574;
UPDATE `locales_creature` SET `name_loc3` = "Hippogryphenreittier" WHERE `entry` = 3837;
UPDATE `locales_creature` SET `name_loc3` = "Bärengestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 4253;
UPDATE `locales_creature` SET `name_loc3` = "Bärengestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 4261;
UPDATE `locales_creature` SET `name_loc3` = "Auge von Kilrogg" WHERE `entry` = 4277;
UPDATE `locales_creature` SET `name_loc3` = "Wassergestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 4408;
UPDATE `locales_creature` SET `name_loc3` = "Wassergestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 4410;
UPDATE `locales_creature` SET `name_loc3` = "Ultham Eisenhorn", `subname_loc3` = "Reitlehrer" WHERE `entry` = 4772;
UPDATE `locales_creature` SET `name_loc3` = "Yarr Hammerstein", `subname_loc3` = "Bergbaulehrer" WHERE `entry` = 5392;
UPDATE `locales_creature` SET `name_loc3` = "Gefangener Lepragnom" WHERE `entry` = 5568;
UPDATE `locales_creature` SET `name_loc3` = "Wache von Eisenschmiede" WHERE `entry` = 5595;
UPDATE `locales_creature` SET `name_loc3` = "Gimrizz Schattenrad", `subname_loc3` = "Hexenmeisterlehrer" WHERE `entry` = 5612;
UPDATE `locales_creature` SET `name_loc3` = "Wächter von Blizzard" WHERE `entry` = 5764;
UPDATE `locales_creature` SET `name_loc3` = "Vejrek" WHERE `entry` = 6113;
UPDATE `locales_creature` SET `name_loc3` = "Tog Rostspross" WHERE `entry` = 6119;
UPDATE `locales_creature` SET `name_loc3` = "Spion der Dunkeleisenzwerge" WHERE `entry` = 6123;
UPDATE `locales_creature` SET `name_loc3` = "Hauptmann Beld", `subname_loc3` = "Hauptmann der Dunkeleisenzwerge" WHERE `entry` = 6124;
UPDATE `locales_creature` SET `name_loc3` = "Narm Faulk" WHERE `entry` = 6177;
UPDATE `locales_creature` SET `name_loc3` = "Jordan Stillbrunn" WHERE `entry` = 6181;
UPDATE `locales_creature` SET `name_loc3` = "Dannie Zischelwizz", `subname_loc3` = "Dämonenausbilder" WHERE `entry` = 6328;
UPDATE `locales_creature` SET `name_loc3` = "Geistheiler" WHERE `entry` = 6491;
UPDATE `locales_creature` SET `name_loc3` = "Katzengestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 6571;
UPDATE `locales_creature` SET `name_loc3` = "Katzengestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 6572;
UPDATE `locales_creature` SET `name_loc3` = "Reisegestalt", `subname_loc3` = "Druide" WHERE `entry` = 6573;
UPDATE `locales_creature` SET `name_loc3` = "Hands Federspross" WHERE `entry` = 6782;
UPDATE `locales_creature` SET `name_loc3` = "Tannok Frosthammer", `subname_loc3` = "Gastwirtsgehilfe" WHERE `entry` = 6806;
UPDATE `locales_creature` SET `name_loc3` = "Onin MacHammar" WHERE `entry` = 6886;
UPDATE `locales_creature` SET `name_loc3` = "Gnomereganevakuierter" WHERE `entry` = 7843;
UPDATE `locales_creature` SET `name_loc3` = "Binjy Federpfiff", `subname_loc3` = "Roboschreiterpilot" WHERE `entry` = 7954;
UPDATE `locales_creature` SET `name_loc3` = "Milli Federpfiff", `subname_loc3` = "Roboschreiterhändlerin" WHERE `entry` = 7955;
UPDATE `locales_creature` SET `name_loc3` = "Felix Windenbolz" WHERE `entry` = 8416;
UPDATE `locales_creature` SET `name_loc3` = "Frickelwelk" WHERE `entry` = 8503;
UPDATE `locales_creature` SET `name_loc3` = "Gretta Ganter", `subname_loc3` = "Angelbedarf" WHERE `entry` = 8508;
UPDATE `locales_creature` SET `name_loc3` = "Shelby Steinsplint", `subname_loc3` = "Stallmeisterin" WHERE `entry` = 9980;
UPDATE `locales_creature` SET `name_loc3` = "Angus", `subname_loc3` = "Zwergenmörsertrupp" WHERE `entry` = 10610;
UPDATE `locales_creature` SET `name_loc3` = "Stöpsel", `subname_loc3` = "Zwergenmörsertrupp" WHERE `entry` = 10611;
UPDATE `locales_creature` SET `name_loc3` = "Scharfschütze Wagner" WHERE `entry` = 10803;
UPDATE `locales_creature` SET `name_loc3` = "Scharfschütze Mittlager" WHERE `entry` = 10804;
UPDATE `locales_creature` SET `name_loc3` = "Späher Klemmy" WHERE `entry` = 10805;
UPDATE `locales_creature` SET `name_loc3` = "Tristane Schattenstein" WHERE `entry` = 11807;
UPDATE `locales_creature` SET `name_loc3` = "Yori Bruchhelm" WHERE `entry` = 11941;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger der Sturmlanzen" WHERE `entry` = 12047;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger Dolf" WHERE `entry` = 12427;
UPDATE `locales_creature` SET `name_loc3` = "Nori Stolzmut" WHERE `entry` = 12738;
UPDATE `locales_creature` SET `name_loc3` = "Irrwisch", `subname_loc3` = "Geist Sichtkontrolle" WHERE `entry` = 12861;
UPDATE `locales_creature` SET `name_loc3` = "Berittener Gebirgsjäger von Eisenschmiede" WHERE `entry` = 12996;
UPDATE `locales_creature` SET `name_loc3` = "Gnomeningenieur" WHERE `entry` = 13000;
UPDATE `locales_creature` SET `name_loc3` = "Gebirgsjäger von Dun Morogh" WHERE `entry` = 13076;
UPDATE `locales_creature` SET `name_loc3` = "Mondkingestalt", `subname_loc3` = "Nachtelfen Druide" WHERE `entry` = 15313;
UPDATE `locales_creature` SET `name_loc3` = "Mondkingestalt", `subname_loc3` = "Tauren Druide" WHERE `entry` = 15314;
