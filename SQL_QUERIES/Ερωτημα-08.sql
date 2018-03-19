SELECT BENEFICIARY.Tax_ID, FULL_NAME
FROM VOUCHER_CALL JOIN VOUCHER_CLASS ON VOUCHER_CALL.Call_ID = VOUCHER_CLASS.Call_ID JOIN REGISTERED ON VOUCHER_CLASS.Class_ID = REGISTERED.Class_ID JOIN BENEFICIARY ON BENEFICIARY.Tax_ID = REGISTERED.Tax_ID
WHERE STATUS='Σε Υλοποίηση' GROUP BY BENEFICIARY.Tax_ID, FULL_NAME  HAVING COUNT(VOUCHER_CLASS.Class_ID)>1;
