
 ALTER TABLE m_loan
 ADD COLUMN `is_grace_on_principal_recurring` TINYINT(1) NOT NULL DEFAULT '0' AFTER `grace_on_principal_periods` ;
 
 ALTER TABLE m_product_loan
 ADD COLUMN `is_grace_on_principal_recurring` TINYINT(1) NOT NULL DEFAULT '0' AFTER `grace_on_principal_periods` ; 