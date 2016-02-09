SET @s = (SELECT IF(
    (SELECT COUNT(*)
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE table_name = 'm_group'
        AND table_schema = DATABASE()
        AND column_name = 'account_no'
    ) > 0,
    "SELECT 1",
    "ALTER TABLE m_group ADD COLUMN `account_no` VARCHAR(20) NOT NULL; UPDATE m_group set account_no = lpad(id,9,0);"
));