CREATE TABLE VOUCHER_CALL (
Call_ID NUMBER NOT NULL,
Description VARCHAR2(300) NOT NULL UNIQUE,
Budget NUMBER NOT NULL,
Voucher_Value NUMBER NOT NULL,
PRIMARY KEY(Call_ID)
);

INSERT INTO VOUCHER_CALL(Call_ID, Description, Budget, Voucher_Value)
VALUES(1, 'Κατάρτιση ανέργων σε θέματα μεταρρύθμισης για το
πρωτοβάθμιο εθνικό δίκτυο υγείας', 14400000, 12000);

INSERT INTO VOUCHER_CALL(Call_ID, Description, Budget, Voucher_Value)
VALUES(2, 'Επιταγή διασύνδεσης με την αγορά εργασίας ανέργων
αποφοίτων Πανεπιστήμιων και Τ.Ε.Ι.', 45000000, 1680);

INSERT INTO VOUCHER_CALL(Call_ID, Description, Budget, Voucher_Value)
VALUES(3, 'Επιταγή εισόδου για νέους ηλικίας από 25 έως 29 ετών σε
ιδιωτικές επιχειρήσεις για απόκτηση εργασιακής εμπειρίας', 108000000, 4000);

INSERT INTO VOUCHER_CALL(Call_ID, Description, Budget, Voucher_Value)
VALUES(4, 'Επιταγή επαγγελματικής κατάρτισης φορτοεκφορτωτών
ξηράς - λιμένος', 6435000, 1200);

INSERT INTO VOUCHER_CALL(Call_ID, Description, Budget, Voucher_Value)
VALUES(5, 'Επιταγή κατάρτισης ανέργων σε τομείς οικονομικής
δραστηριότητας με υποχρεωτική εγγυημένη απασχόληση', 112000000, 5400);



CREATE TABLE BENEFICIARY (
Tax_ID VARCHAR2(50) NOT NULL,
Unemployment_Card VARCHAR2(50) NOT NULL UNIQUE,
Full_Name VARCHAR2(50) NOT NULL,
Birth_Year NUMBER NOT NULL,
Sex VARCHAR2(50) NOT NULL CHECK(Sex IN
('Α','Θ')),
Home_Address VARCHAR2(50),
PRIMARY KEY(Tax_ID)
);

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('049036418', '1254785219635425', 'Ιωάννης Τέλογλου', 1972, 'Α', 'Καλλίπου 26, Περιστέρι');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('047096457', '0102050504050505', 'Τρύφωνας Μπαλτέας', 1975, 'Α', 'Μπουμπουλίνας 12,
Αχαρνές');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('059056316', '7852469785214563', 'Μαρία Χριστοδούλου', 1991, 'Θ', 'Μαιζώνος 22, Πάτρα');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('035678456', '9526458952014560', 'Ελένη Αυγερίου', 1988, 'Θ', 'Παπαφλέσσα 12,
Νέο Ψυχικό');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('058245987', '1426569845632156', 'Λάζαρος Χριστίδης', 1993, 'Α', 'Κορίνθου 346,
Πάτρα');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('056047895', '1265487596214568', 'Βασιλική Καντόρου', 1990, 'Θ', 'Αργαλαστής 46,
Βύρωνας');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('051045617', '8546982159759751', 'Αγγελική
Ευθυμιοπούλου', 1987, 'Θ', 'Καρατζά 53, Άνω Πατήσια');

INSERT INTO BENEFICIARY(Tax_ID, Unemployment_Card, Full_Name, Birth_Year, Sex, Home_Address)
VALUES('048046418', '6542848965123568', 'Αριστείδης Τρικόπουλος', 1990, 'Α', NULL);



CREATE TABLE VOUCHER_CLASS (
Class_ID NUMBER NOT NULL,
Time_Zone VARCHAR2(50) NOT NULL CHECK(Time_Zone IN ('Πρωινό',
'Απογευματινό', 'Βραδινό')),
Status VARCHAR2(50) NOT NULL CHECK(Status IN('Ολοκληρωμένο',
'Σε Υλοποίηση', 'Σε Προγραμματισμό')),
Start_Date DATE NOT NULL,
End_Date DATE NOT NULL,
Call_ID NUMBER NOT NULL,
PRIMARY KEY(Class_ID),
FOREIGN KEY(Call_ID) REFERENCES VOUCHER_CALL(Call_ID)
);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(11, 'Πρωινό', 'Ολοκληρωμένο', to_date('1/3/2014', 'dd/mm/yyyy'), to_date('30/6/2016', 
'dd/mm/yyyy'), 1);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(12, 'Πρωινό', 'Σε Υλοποίηση', to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('30/6/2017', 'dd/mm/yyyy'), 1);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(13, 'Απογευματινό', 'Σε Προγραμματισμό',
to_date('1/7/2017', 'dd/mm/yyyy'), to_date('31/10/2017', 'dd/mm/yyyy'), 1);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(21, 'Βραδινό', 'Ολοκληρωμένο', to_date('1/1/2016', 'dd/mm/yyyy'),
 to_date('31/3/2016', 'dd/mm/yyyy'), 2);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(22, 'Απογευματινό', 'Ολοκληρωμένο', to_date('1/4/2016', 'dd/mm/yyyy'),
 to_date('30/6/2016', 'dd/mm/yyyy'), 2);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(23, 'Πρωινό', 'Σε Προγραμματισμό', to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('31/7/2017', 'dd/mm/yyyy'), 2);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(31, 'Πρωινό', 'Ολοκληρωμένο', to_date('1/1/2016', 'dd/mm/yyyy'),
 to_date('31/5/2016', 'dd/mm/yyyy'), 3);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(32, 'Πρωινό', 'Σε Υλοποίηση', to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('31/5/2017', 'dd/mm/yyyy'), 3);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(34, 'Απογευματινό', 'Ολοκληρωμένο', to_date('1/7/2016', 'dd/mm/yyyy'),
 to_date('30/11/2016', 'dd/mm/yyyy'), 3);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(41, 'Βραδινό', 'Σε Υλοποίηση', to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('31/3/2017', 'dd/mm/yyyy'), 4);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(42, 'Βραδινό', 'Σε Υλοποίηση', to_date('15/3/2017', 'dd/mm/yyyy'),
 to_date('15/4/2017', 'dd/mm/yyyy'), 4);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(51, 'Απογευματινό', 'Σε Υλοποίηση', to_date('15/2/2017', 'dd/mm/yyyy'),
 to_date('15/7/2017', 'dd/mm/yyyy'), 5);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(52, 'Πρωινό', 'Σε Υλοποίηση', to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('31/7/2017', 'dd/mm/yyyy'), 5);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(53, 'Πρωινό', 'Σε Προγραμματισμό', to_date('1/7/2017', 'dd/mm/yyyy'),
 to_date('30/11/2017', 'dd/mm/yyyy'), 5);

INSERT INTO VOUCHER_CLASS(Class_ID, Time_Zone, Status, Start_Date, End_Date, Call_ID)
VALUES(54, 'Απογευματινό', 'Σε Προγραμματισμό', to_date('1/7/2017', 'dd/mm/yyyy'),
 to_date('30/11/2017', 'dd/mm/yyyy'), 5);



CREATE TABLE TRAINING_CENTER (
Center_ID NUMBER NOT NULL,
Title VARCHAR2(50) NOT NULL UNIQUE,
Address VARCHAR2(50) NOT NULL,
ZIP NUMBER NOT NULL,
City VARCHAR2(50) NOT NULL,
PRIMARY KEY(Center_ID)
);

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(122, 'Εκπαιδευτική Α.Ε.', 'Αγίας Ειρήνης 46', 12137, 'Περιστέρι');

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(126, 'Κατάρτιση Α.Ε.', 'Αλεξανδρείας 22', 14342, 'Νέα Φιλαδέλφεια');

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(313, 'Επιμόρφωση Ε.Π.Ε.', 'Αλαμάρα 85', 15236, 'Πεντέλη');

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(380, 'Αθηναϊκή Ο.Ε.', 'Αίγλης 99', 15451, 'Νέο Ψυχικό');

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(512, 'Ορίζοντες Α.Ε.', 'Παπαφλέσσα 12', 26504, 'Πάτρα');

INSERT INTO TRAINING_CENTER(Center_ID, Title, Address, ZIP, City)
VALUES(622, 'Μέλλον Ε.Π.Ε.', 'Γούναρη 41', 26221, 'Πάτρα');



CREATE TABLE SEL (
Tax_ID VARCHAR2(50) NOT NULL,
Call_ID NUMBER NOT NULL,
Voucher_ID NUMBER NOT NULL UNIQUE,
Date_of_Issue DATE NOT NULL,
End_Date DATE NOT NULL,
PRIMARY KEY(Tax_ID,Call_ID),
FOREIGN KEY(Tax_ID) REFERENCES BENEFICIARY(Tax_ID),
FOREIGN KEY(Call_ID) REFERENCES VOUCHER_CALL(Call_ID)
);

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('049036418', 1, 45789, to_date('1/1/2016', 'dd/mm/yyyy'),
 to_date('15/2/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('049036418', 2, 48895, to_date('1/10/2015', 'dd/mm/yyyy'),
 to_date('15/12/2015', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('049036418', 4, 55895, to_date('1/1/2017', 'dd/mm/yyyy'), 
to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('049036418', 5, 66589, to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('047096457', 1, 45898, to_date('1/1/2016', 'dd/mm/yyyy'),
 to_date('15/2/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('047096457', 2, 73542, to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('047096457', 3, 46587, to_date('1/10/2015', 'dd/mm/yyyy'),
 to_date('15/12/2015', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('047096457', 4, 67894, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('059056316', 1, 67859, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('059056316', 2, 54784, to_date('1/2/2016', 'dd/mm/yyyy'),
 to_date('31/3/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('059056316', 3, 46789, to_date('1/3/2016', 'dd/mm/yyyy'),
 to_date('30/4/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('059056316', 4, 69999, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('059056316', 5, 56412, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('035678456', 1, 56478, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('035678456', 2, 49731, to_date('1/2/2016', 'dd/mm/yyyy'),
 to_date('31/3/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('035678456', 3, 41562, to_date('1/10/2015', 'dd/mm/yyyy'),
 to_date('15/12/2015', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('035678456', 4, 72456, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('035678456', 5, 55456, to_date('1/11/2016', 'dd/mm/yyyy'),
 to_date('31/12/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('058245987', 1, 41123, to_date('1/1/2016', 'dd/mm/yyyy'),
 to_date('15/2/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('058245987', 2, 42156, to_date('1/10/2015', 'dd/mm/yyyy'),
 to_date('15/12/2015', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('058245987', 3, 67891, to_date('1/10/2016', 'dd/mm/yyyy'),
 to_date('15/12/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('058245987', 4, 69811, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('058245987', 5, 73125, to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('30/4/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('056047895', 1, 69696, to_date('1/1/2017', 'dd/mm/yyyy'),
 to_date('15/2/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('056047895', 2, 45621, to_date('1/10/2015', 'dd/mm/yyyy'),
 to_date('15/12/2015', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('056047895', 5, 69396, to_date('1/11/2016', 'dd/mm/yyyy'),
 to_date('31/12/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('051045617', 1, 70562, to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('30/4/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('051045617', 2, 71123, to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('30/4/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('051045617', 3, 65512, to_date('1/10/2016', 'dd/mm/yyyy'),
 to_date('15/12/2016', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('051045617', 5, 69879, to_date('1/3/2017', 'dd/mm/yyyy'),
 to_date('30/4/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('048046418', 1, 58568, to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('30/4/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('048046418', 2, 69785, to_date('1/2/2017', 'dd/mm/yyyy'),
 to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO SEL(Tax_ID, Call_ID, Voucher_ID, Date_of_issue, End_Date)
VALUES('048046418', 3, 55897, to_date('1/3/2016', 'dd/mm/yyyy'),
 to_date('30/4/2016', 'dd/mm/yyyy'));



CREATE TABLE PARTICIPATES (
Call_ID NUMBER NOT NULL,
Center_ID NUMBER NOT NULL,
Registration_Date DATE NOT NULL,
PRIMARY KEY(Call_ID,Center_ID),
FOREIGN KEY(Call_ID) REFERENCES VOUCHER_CALL(Call_ID),
FOREIGN KEY(Center_ID) REFERENCES TRAINING_CENTER(Center_ID)
);

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(1, 122, to_date('1/1/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(1, 126, to_date('15/1/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(1, 512, to_date('1/1/2017', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(2, 122, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(2, 313, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(2, 380, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(2, 622, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 122, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 126, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 313, to_date('1/9/2015', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 380, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 512, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(3, 622, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(4, 126, to_date('1/1/2017', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(4, 512, to_date('1/1/2017', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(5, 313, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(5, 380, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(5, 512, to_date('1/9/2016', 'dd/mm/yyyy'));

INSERT INTO PARTICIPATES(Call_ID, Center_ID, Registration_Date)
VALUES(5, 622, to_date('1/9/2016', 'dd/mm/yyyy'));



CREATE TABLE REGISTERED (
Tax_ID VARCHAR2(50) NOT NULL,
Class_ID NUMBER NOT NULL,
Registration_Date DATE NOT NULL,
PRIMARY KEY(Tax_ID,Class_ID),
FOREIGN KEY(Tax_ID) REFERENCES BENEFICIARY(Tax_ID),
FOREIGN KEY(Class_ID) REFERENCES VOUCHER_CLASS(Class_ID)
);

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('049036418', 11, to_date('06/2/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('049036418', 21, to_date('1/11/2015', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('049036418', 41, to_date('12/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('049036418', 53, to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('047096457', 11, to_date('8/2/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('047096457', 23, to_date('26/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('047096457', 31, to_date('3/10/2015', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('047096457', 42, to_date('22/1/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('059056316', 12, to_date('1/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('059056316', 22, to_date('15/2/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('059056316', 34, to_date('15/3/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('059056316', 52, to_date('31/1/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('035678456', 12, to_date('3/1/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('035678456', 22, to_date('16/2/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('035678456', 31, to_date('15/10/2015', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('035678456', 51, to_date('18/11/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('058245987', 11, to_date('1/2/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('058245987', 21, to_date('31/10/2015', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('058245987', 32, to_date('15/12/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('058245987', 42, to_date('31/1/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('058245987', 53, to_date('3/3/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('056047895', 12, to_date('20/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('056047895', 21, to_date('11/10/2015', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('056047895', 51, to_date('31/12/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('051045617', 13, to_date('3/3/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('051045617', 23, to_date('28/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('051045617', 32, to_date('6/10/2016', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('051045617', 53, to_date('1/4/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('048046418', 13, to_date('10/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('048046418', 23, to_date('11/2/2017', 'dd/mm/yyyy'));

INSERT INTO REGISTERED(Tax_ID, Class_ID, Registration_Date)
VALUES('048046418', 34, to_date('30/4/2016', 'dd/mm/yyyy'));



CREATE TABLE INCLUDED (
Tax_ID VARCHAR2(50) NOT NULL,
Center_ID NUMBER NOT NULL,
Call_ID NUMBER NOT NULL,
Voucher_Submission_Date DATE NOT NULL,
PRIMARY KEY(Tax_ID,Call_ID),
FOREIGN KEY(Tax_ID) REFERENCES BENEFICIARY(Tax_ID),
FOREIGN KEY(Center_ID) REFERENCES TRAINING_CENTER(Center_ID),
FOREIGN KEY(Call_ID) REFERENCES VOUCHER_CALL(Call_ID)
);

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('049036418', 122, 1, to_date('8/2/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('049036418', 380, 2, to_date('31/10/2015', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('049036418', 126, 4, to_date('10/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('049036418', 622, 5, to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('047096457', 122, 1, to_date('6/2/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('047096457', 380, 2, to_date('16/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('047096457', 313, 3, to_date('2/10/2015', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('047096457', 512, 4, to_date('21/1/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('059056316', 512, 1, to_date('31/1/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('059056316', 622, 2, to_date('10/2/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('059056316', 126, 3, to_date('12/3/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('059056316', 512, 5, to_date('25/1/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('035678456', 122, 1, to_date('2/1/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('035678456', 380, 2, to_date('15/2/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('035678456', 313, 3, to_date('10/10/2015', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('035678456', 380, 5, to_date('15/11/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('058245987', 122, 1, to_date('31/1/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('058245987', 313, 2, to_date('22/10/2015', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('058245987', 512, 3, to_date('1/12/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('058245987', 512, 4, to_date('15/1/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('058245987', 622, 5, to_date('2/3/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('056047895', 126, 1, to_date('18/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('056047895', 380, 2, to_date('8/10/2015', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('056047895', 313, 5, to_date('22/11/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('051045617', 126, 1, to_date('2/3/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('051045617', 380, 2, to_date('21/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('051045617', 126, 3, to_date('5/10/2016', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('051045617', 622, 5, to_date('31/3/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('048046418', 512, 1, to_date('2/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('048046418', 122, 2, to_date('11/2/2017', 'dd/mm/yyyy'));

INSERT INTO INCLUDED(Tax_ID, Center_ID, Call_ID, Voucher_Submission_Date)
VALUES('048046418', 313, 3, to_date('29/4/2016', 'dd/mm/yyyy'));

