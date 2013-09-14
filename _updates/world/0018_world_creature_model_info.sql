-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add character and game system data to world database
--
-- We will add creature model info used by character
-- spell or in game systems.
--

-- Provide variables for gender
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Insert model information: these are creatures used by game systems --------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`,           `modelid_other_gender`, `modelid_other_team`)
VALUES
     (1566,      0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
    ,(1825,      2,                  2.56,           @MODEL_GENDER_NONE, 0,                      0)
    ,(1936,      0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
    ,(6851,      0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
    ,(6852,      0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
;

-- Insert model information: these are creatures summoned by Warlocks --------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`,           `modelid_other_gender`, `modelid_other_team`)
VALUES
     (169,       0.903,              2,              @MODEL_GENDER_NONE, 0,                      0)
    ,(850,       0.2429,             1.05,           @MODEL_GENDER_NONE, 0,                      0)
    ,(1132,      0.8,                2,              @MODEL_GENDER_NONE, 0,                      0)
    ,(1912,      0.9168,             1.8,            @MODEL_GENDER_NONE, 0,                      0)
    ,(2421,      1,                  1,              @MODEL_GENDER_NONE, 0,                      0)
    ,(4162,      0.403,              1.5,            @MODEL_GENDER_NONE, 0,                      0)
    ,(4449,      0.5,                0.75,           @MODEL_GENDER_NONE, 0,                      0)
;

-- Insert model information: these are forms assumed by Druids ---------------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`,           `modelid_other_gender`, `modelid_other_team`)
VALUES
     (892,       0.315,              1.35,           @MODEL_GENDER_NONE, 0,                      0)
    ,(918,       0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
    ,(1058,      0.91425,            1.725,          @MODEL_GENDER_NONE, 0,                      0)
    ,(2281,      0.35,               1,              @MODEL_GENDER_NONE, 0,                      0)
    ,(2289,      0.408,              1.2,            @MODEL_GENDER_NONE, 0,                      0)
    ,(2428,      0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
    ,(15374,     2,                  1,              @MODEL_GENDER_NONE, 0,                      0)
    ,(15375,     0,                  0,              @MODEL_GENDER_NONE, 0,                      0)
;
