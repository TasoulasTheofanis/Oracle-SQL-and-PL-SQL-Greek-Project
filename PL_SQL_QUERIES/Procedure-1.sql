CREATE OR REPLACE PROCEDURE DELETE_SINCE(V_DATE IN DATE) AS
BEGIN
    DELETE FROM INCLUDED WHERE INCLUDED.Voucher_Submission_Date < V_DATE;
    DELETE FROM REGISTERED WHERE REGISTERED.Registration_Date < V_DATE;
    DELETE FROM SEL WHERE SEL.Date_of_Issue < V_DATE;
    DELETE FROM PARTICIPATES WHERE PARTICIPATES.Registration_Date < V_DATE;
    DBMS_OUTPUT.PUT_LINE('DATES DELETED');
END;

-- Δοκιμή με τον παρακάτω κώδικα –
BEGIN
DELETE_SINCE(TO_DATE ('1/4/2016', 'DD/MM/YYYY'));
END;
