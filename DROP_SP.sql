
-- Find user created stored procedures
SELECT NAME
FROM [DATABASE].sys.procedures
WHERE TYPE = 'P'
AND IS_MS_SHIPPED = 0
AND LEFT(NAME, 3) != 'sp_'

-- Drop

