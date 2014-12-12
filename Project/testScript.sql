-- Table fan
SELECT fanID, fanName
FROM fan;

-- Table band
SELECT bandID, bandName, genre, year
FROM band;

-- Table bandMember
SELECT memID, memName, bandID, nationality
FROM bandMember;

-- Table likes
SELECT fanID, bandID
FROM likes;

DELETE FROM likes;
DELETE FROM bandMember;
DELETE FROM fan;
DELETE FROM band;

INSERT INTO fan VALUES(2222, 'a');
INSERT INTO band VALUES(2222, 'a', 'a', 2222);
INSERT INTO likes VALUES(2222, 2222);
INSERT INTO bandMember VALUES(2222, 'a', 2222, 'a');

-- View bandFans
SELECT fanID, fanName, bandID, bandName
FROM bandFans;

-- View fanLikeCount
SELECT fanID, fanName, bandNum
FROM fanLikeCount;

-- View hateRockbands
SELECT fanID, fanName
FROM hateRockBands;

-- View rareGenresWithMin
SELECT genre
FROM rareGenresWithMin;

-- View rareGenresWithoutMin
SELECT genre
FROM rareGenresWithoutMin;

-- View fansAllRockWithNotIn
SELECT fanID, fanName
FROM fansAllRockWithNotIn;

-- View fansAllRockWithNotExists
SELECT fanID, fanName
FROM fansAllRockWithNotExists;

-- View fansAllRockWithCount
SELECT fanID, fanName
FROM fansAllRockWithCount;

-- View bandLowerThanAvgFans
SELECT bandID, bandName
FROM bandLowerThanAvgFans;

-- View sameBands
SELECT fanID1, fanName1, fanID2, fanName2
FROM sameBands;