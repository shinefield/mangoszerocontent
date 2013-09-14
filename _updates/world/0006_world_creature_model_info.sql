-- Host: localhost    Database: world
-- ---------------------------------------------------------------------------
-- Add initial data to world database
--
-- We will add model information used to display player characters.
--

-- Provide variables for gender ----------------------------------------------
SET @MODEL_GENDER_MALE                          = 0;
SET @MODEL_GENDER_FEMALE                        = 1;
SET @MODEL_GENDER_NONE                          = 2;

-- Insert creature model information for player characters -------------------
INSERT INTO `creature_model_info`
    (`modelid`, `bounding_radius`, `combat_reach`, `gender`, `modelid_other_gender`, `modelid_other_team`)
VALUES
     (49,   0.306,  1.5, @MODEL_GENDER_MALE,   50,   0)
    ,(50,   0.208,  1.5, @MODEL_GENDER_FEMALE, 49,   0)
    ,(51,   0.372,  1.5, @MODEL_GENDER_MALE,   52,   0)
    ,(52,   0.236,  1.5, @MODEL_GENDER_FEMALE, 51,   0)
    ,(53,   0.347,  1.5, @MODEL_GENDER_MALE,   54,   0)
    ,(54,   0.347,  1.5, @MODEL_GENDER_FEMALE, 53,   0)
    ,(55,   0.389,  1.5, @MODEL_GENDER_MALE,   56,   0)
    ,(56,   0.306,  1.5, @MODEL_GENDER_FEMALE, 55,   0)
    ,(57,   0.383,  1.5, @MODEL_GENDER_MALE,   58,   0)
    ,(58,   0.383,  1.5, @MODEL_GENDER_FEMALE, 57,   0)
    ,(59,   0.9747, 1.5, @MODEL_GENDER_MALE,   60,   0)
    ,(60,   0.8725, 1.5, @MODEL_GENDER_FEMALE, 59,   0)
    ,(1478, 0.306,  1.5, @MODEL_GENDER_MALE,   1479, 0)
    ,(1479, 0.306,  1.5, @MODEL_GENDER_FEMALE, 1478, 0)
    ,(1563, 0.3519, 1.5, @MODEL_GENDER_MALE,   1564, 0)
    ,(1564, 0.3519, 1.5, @MODEL_GENDER_FEMALE, 1563, 0)
;
