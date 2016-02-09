
SET @s = (SELECT IF(
    (SELECT COUNT(*)
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE table_name = 'm_loan'
        AND table_schema = DATABASE()
        AND column_name = 'recurring_grace_on_principal_periods'
    ) > 0,
    "SELECT 1",
    "ALTER TABLE m_loan ADD recurring_grace_on_principal_periods SMALLINT(5) NULL AFTER `grace_on_principal_periods`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @s = (SELECT IF(
    (SELECT COUNT(*)
        FROM INFORMATION_SCHEMA.COLUMNS
        WHERE table_name = 'm_product_loan'
        AND table_schema = DATABASE()
        AND column_name = 'recurring_grace_on_principal_periods'
    ) > 0,
    "SELECT 1",
    "ALTER TABLE m_product_loan ADD recurring_grace_on_principal_periods SMALLINT(5) NULL AFTER `grace_on_principal_periods`"
));

PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
  
  
 