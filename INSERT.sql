
-- INSERT INTO SELECT, TABLE_2 must exists
INSERT INTO TABLE_2
SELECT *
FROM TABLE_1

-- SELECT INTO FROM, TABLE_2 must not exists
SELECT *
INTO TABLE_2
FROM TABLE_1
