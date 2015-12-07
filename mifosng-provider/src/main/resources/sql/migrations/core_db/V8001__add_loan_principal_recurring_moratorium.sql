
  ALTER TABLE m_loan
  ADD COLUMN `recurring_grace_on_principal_periods` SMALLINT(5) NULL AFTER `grace_on_principal_periods` ;
 
  ALTER TABLE m_product_loan
  ADD COLUMN `recurring_grace_on_principal_periods` SMALLINT(5) NULL AFTER `grace_on_principal_periods` ; 
 
 
 
  update m_product_loan set recurring_grace_on_principal_periods = grace_on_principal_periods where is_grace_on_principal_recurring = 1;

  update m_loan set recurring_grace_on_principal_periods = grace_on_principal_periods where is_grace_on_principal_recurring = 1; 