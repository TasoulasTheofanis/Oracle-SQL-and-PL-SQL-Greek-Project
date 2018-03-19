CREATE OR REPLACE TRIGGER EASY_DELETE_BENEFICIARY
    BEFORE DELETE ON BENEFICIARY
FOR EACH ROW
WHEN (old.Tax_ID IS NOT NULL)
DECLARE
    DELETED_TAX_ID beneficiary.tax_id%type := :old.Tax_ID;
BEGIN
-- Διαγράφουμε τις στήλες όπου ο ΑΦΜ είναι ίδιος με τον ΑΦΜ της στήλης που διαγράφθηκε --
    DELETE INCLUDED      WHERE Tax_ID = DELETED_TAX_ID;
    DELETE REGISTERED WHERE Tax_ID = DELETED_TAX_ID;
    DELETE SEL                  WHERE Tax_ID = DELETED_TAX_ID;
    DBMS_OUTPUT.PUT_LINE('BENEFICIARY DELETED');
END;

--Δοκιμή με τον παρακάτω κώδικα--
DELETE BENEFICIARY WHERE Tax_ID = 47096457
