/*
Jay Ceballos
A09338030
*/

-- 3 a

UPDATE bandMembers
SET nationality='tempus',
WHERE nationality='british';

UPDATE bandMembers
SET nationality='british',
WHERE nationality='us';

UPDATE bandMembers
SET nationality='us',
WHERE nationality='tempus';

-- 3 b

DELETE bandID, fanID
FROM likes, fan
WHERE genre='rock' AND fan.fanID = likes.fanID;