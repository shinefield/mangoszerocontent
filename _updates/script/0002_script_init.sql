-- Host: localhost    Database: script
-- ---------------------------------------------------------------------------
-- Add initial data to script database
--
-- We will add a few default entries upon which ScriptDev2
-- relies in case of errors.
--

-- Insert generic text strings for errors and common creature behavior -------
INSERT IGNORE INTO `script_texts`
    (`entry`, `content_default`, `sound`, `type`, `language`, `emote`, `comment`)
VALUES
     (-1000000,'<ScriptDev2 Text Entry Missing!>',0,0,0,0,'DEFAULT_TEXT')
    ,(-1000001,'%s goes into a killing frenzy!',0,2,0,0,'EMOTE_GENERIC_FRENZY_KILL')
    ,(-1000002,'%s goes into a frenzy!',0,2,0,0,'EMOTE_GENERIC_FRENZY')
    ,(-1000003,'%s becomes enraged!',0,2,0,0,'EMOTE_GENERIC_ENRAGED')
    ,(-1000004,'%s goes into a berserker rage!',0,2,0,0,'EMOTE_GENERIC_BERSERK')
    ,(-1000005,'%s goes into a frenzy!',0,3,0,0,'EMOTE_BOSS_GENERIC_FRENZY')
    ,(-1000006,'%s becomes enraged!',0,3,0,0,'EMOTE_BOSS_GENERIC_ENRAGED')
;

INSERT IGNORE INTO `gossip_texts`
    (`entry`, `content_default`, `comment`)
VALUES
     (-3000000, '[PH] SD2 unknown text', 'GOSSIP_ID_UNKNOWN_TEXT')
 ;

-- Insert script library database version ------------------------------------
INSERT IGNORE INTO `sd2_db_version`
VALUES
    ('ScriptDev2 - Version 0.1.0 (Community Rebuild)')
;
