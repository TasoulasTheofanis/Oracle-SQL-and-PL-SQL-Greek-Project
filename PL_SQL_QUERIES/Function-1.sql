CREATE OR REPLACE FUNCTION totalRegistersAtYear (Year_Variable IN number)
RETURN number IS 
   total number(4) := 0; 
BEGIN 

   SELECT COUNT(REGISTRATION_DATE) into total 
   FROM REGISTERED
   WHERE Year_Variable = EXTRACT(YEAR FROM REGISTRATION_DATE); 
   --Επέλεξε το άθροισμα από τις ημερομηνίες, όπου η χρονιά που δόθηκε είναι ίση με τη χρονιά της ημερομηνίας εγγραφής--
   RETURN total; 
END; 

-- Δοκιμή με τους παρακάτω κώδικες --
BEGIN
DBMS_OUTPUT.PUT_LINE (totalRegistersAtYear(2015));
END;

SELECT DISTINCT totalRegistersAtYear(2015), totalRegistersAtYear(2016)
FROM REGISTERED;
