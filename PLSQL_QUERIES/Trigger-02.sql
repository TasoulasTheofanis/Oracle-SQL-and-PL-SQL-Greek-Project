CREATE OR REPLACE TRIGGER AFTER_UPDATE_SEL
AFTER INSERT ON SEL

BEGIN
--Όταν εκχωρηθούν νέες τιμές στους επιλεγόμενους, τότε θα ανανεωθούν οι αριθμοί συμμετοχών των ωφελουμένων--

UPDATE BENEFICIARY
SET NUM_PARTICIPATIONS=(
   SELECT COUNT(CALL_ID)
   FROM SEL
   WHERE BENEFICIARY.TAX_ID=SEL.TAX_ID
   GROUP BY TAX_ID);

END;

--Δοκιμή με τον παρακάτω κώδικα, όπου Tax_ID ο ΑΦΜ του Τασούλα Θεοφάνη--
INSERT INTO SEL (Tax_ID, Call_ID, Voucher_ID, Date_of_Issue, End_Date)
VALUES(0, 5, 98765, to_date('1/11/2016', 'dd/mm/yyyy'), to_date('31/12/2016', 'dd/mm/yyyy'));
