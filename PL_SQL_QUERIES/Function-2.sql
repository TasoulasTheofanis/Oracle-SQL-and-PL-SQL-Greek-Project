CREATE OR REPLACE FUNCTION AverageOfStatus (GIVEN_STATUS IN VARCHAR2)
RETURN number IS 
   average number(6,2); 
   total_status number (6);
BEGIN 
   --Επέλεξε το άθροισμα των καταστάσεων, όπου η κατάσταση είναι ίδια με την δοθείσα--
   SELECT DISTINCT COUNT(STATUS) INTO average  
   FROM VOUCHER_CLASS
   WHERE STATUS = GIVEN_STATUS;   

   --Επέλεξε το άθροισμα των καταστάσεων--
   SELECT DISTINCT COUNT(STATUS) INTO total_status 
   FROM VOUCHER_CLASS; 
   
   --Επέστρεψε το μέσο όρο--
   average := average / total_status * 100;
   RETURN average ; 
END; 

-- Δοκιμή με τους παρακάτω κώδικες --
BEGIN
DBMS_OUTPUT.PUT_LINE (AverageOfStatus('Σε Υλοποίηση'));
END;

SELECT DISTINCT AverageOfStatus('Ολοκληρωμένο')
FROM VOUCHER_CLASS
