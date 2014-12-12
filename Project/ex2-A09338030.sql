/*
Jay Ceballos
A09338030
*/

-- 2a View: bandFans

CREATE VIEW bandFans AS
(SELECT 
  fan."fanName", 
  band."bandName", 
  fan."fanID", 
  band."bandID"
FROM 
  public.fan, 
  public.band
WHERE 
  fan."fanID" = band."bandID");

-- 2b View: fanLikeCount

CREATE VIEW fanLikeCount AS
(SELECT COUNT(fanID) AS bandNum
FROM fan, band
WHERE fan.fanID = band.bandID);

-- 2c View: hateRockBands

CREATE VIEW hateRockBands AS
(SELECT fanID, fanName
FROM fan, band
WHERE band.genre <> 'rock');

-- 2d i View: rareGenresWithMin

CREATE VIEW rareGenresWithMin AS
(SELECT MIN(genre) 
FROM band);

/*
-- 2d ii View: rareGenresWithoutMin

CREATE VIEW rareGenresWithoutMin AS
(SELECT 
);
*/

-- 2e i View: fansAllRockWithNotIn

CREATE VIEW fansAllRockWithNotIn AS
(SELECT fanID, fanName 
FROM fan, band
WHERE band.bandID NOT IN
	(SELECT bandID 
	FROM band
	WHERE band.genre <> 'rock')
);

/*

-- 2e ii View: fansAllRockWithNotExists

CREATE VIEW fansAllRockWithNotExists AS
(SELECT fanID, fanName 
FROM fan, band
WHERE band.genre NOT EXISTS 
);

-- 2e iii View: fansAllRockWithCount

CREATE VIEW fansAllRockWithCount AS
(SELECT fanID, fanName 
FROM fan, band
WHERE band.genre  );


-- 2f View: bandLowerThanAvgFans

CREATE VIEW bandLowerThanAvgFans AS
(SELECT bandID, bandName
FROM band
WHERE 
);


-- 2g View: sameBands

CREATE VIEW sameBands AS
(SELECT 

FROM 

WHERE 
 );

*/