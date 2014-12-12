-- a
CREATE VIEW bandFans AS
SELECT fanID, fanName, bandID, bandName
FROM fan NATURAL INNER JOIN likes NATURAL INNER JOIN band;

-- b
CREATE VIEW fanLikeCount AS
SELECT fanID, fanName, COUNT(bandID) AS bandNum
FROM fan NATURAL LEFT OUTER JOIN likes
GROUP BY fanID, fanName;

-- c
CREATE VIEW hateRockBands AS
SELECT fanID, fanName
FROM fan
WHERE fanID NOT IN
(SELECT fanID
FROM fan NATURAL INNER JOIN likes NATURAL INNER JOIN band
WHERE genre = 'rock');

-- d-a
CREATE VIEW genreCount AS
SELECT genre, COUNT(*) AS countNum
FROM band
GROUP BY genre;

CREATE VIEW rareGenresWithMin AS
SELECT genre
FROM genreCount
WHERE countNum = (SELECT MIN(countNum) FROM genreCount); 

-- d-b
CREATE VIEW rareGenresWithoutMin AS
SELECT genre
FROM genreCount
WHERE countNum <= ALL (SELECT countNum FROM genreCount);

-- e-a
CREATE VIEW fansAllRockWithNotIn AS
SELECT fanID, fanName
FROM fan
WHERE fanID NOT IN
(SELECT fanID
FROM fan f, band
WHERE genre = 'rock' AND bandID NOT IN
(SELECT bandID
FROM likes
WHERE fanID = f.fanID));

-- e-b
CREATE VIEW fansAllRockWithNotExists AS
SELECT fanID, fanName
FROM fan f
WHERE NOT EXISTS
(SELECT *
FROM band b
WHERE genre = 'rock' AND NOT EXISTS
(SELECT *
FROM likes
WHERE fanID = f.fanID AND bandID = b.bandID));

-- e-c
CREATE VIEW fansAllRockWithCount AS
SELECT fanID, fanName
FROM fan f
WHERE (SELECT COUNT(*) FROM likes NATURAL INNER JOIN band WHERE fanID = f.fanID AND genre = 'rock') =
(SELECT COUNT(*) FROM band WHERE genre = 'rock');

-- f
CREATE VIEW fansPerBand AS
SELECT bandID, bandName, genre, COUNT(*) AS countNum
FROM band NATURAL LEFT OUTER JOIN likes
GROUP BY bandID, bandName, genre;

CREATE VIEW avgFansPerGenre AS
SELECT genre, AVG(countNum) AS avgNum
FROM fansPerBand
GROUP BY genre;

CREATE VIEW bandLowerThanAvgFans AS
SELECT bandID, bandName
FROM fansPerBand f
WHERE countNum < (SELECT avgNum FROM avgFansPerGenre WHERE genre = f.genre);

-- g
CREATE VIEW sameBands AS
SELECT f1.fanID AS fanID1, f1.fanName AS fanName1, f2.fanID AS fanID2, f2.fanName AS fanName2
FROM fan f1, fan f2
WHERE
NOT EXISTS
(SELECT bandID
FROM likes
WHERE fanID = f1.fanID AND bandID NOT IN (SELECT bandID FROM likes WHERE fanID = f2.fanID))
AND
NOT EXISTS
(SELECT bandID
FROM likes
WHERE fanID = f2.fanID AND bandID NOT IN (SELECT bandID FROM likes WHERE fanID = f1.fanID))
AND
f1.fanID < f2.fanID;