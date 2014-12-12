-- a
UPDATE bandMember
SET nationality = 'british-temp'
WHERE nationality = 'british';

UPDATE bandMember
SET nationality = 'british'
WHERE nationality = 'us';

UPDATE bandMember
SET nationality = 'us'
WHERE nationality = 'british-temp';

-- b
DELETE
FROM likes
WHERE bandID IN (SELECT bandID FROM band WHERE genre = 'rock');

DELETE
FROM bandMember
WHERE bandID IN (SELECT bandID FROM band WHERE genre = 'rock');

DELETE
FROM band
WHERE genre = 'rock';