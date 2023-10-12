/*Project DBF 12- DDL*/

/* DROP statements to clean up objects from previous run */


---TRIGGERS
DROP TRIGGER TR_Guest;
DROP TRIGGER TR_Res;
DROP TRIGGER TR_Rooms;
DROP TRIGGER TR_Pricing;
DROP TRIGGER TR_Payment;
---SEQUENCES
DROP SEQUENCE SEQ_Guest_ID;
DROP SEQUENCE SEQ_Res_No;
DROP SEQUENCE SEQ_Pricing_ID;
DROP SEQUENCE SEQ_Pmt_ID;
---VIEWS
DROP VIEW GuestInfo;
DROP VIEW ReservationInfo;
DROP VIEW RoomsInfo;
DROP VIEW PricingInfo;
DROP VIEW PaymentInfo;

---INDEXES
DROP INDEX IDX_Guest_FName;
DROP INDEX IDX_Guest_Age;
DROP INDEX IDX_Guest_Platinum_Membership;
DROP INDEX IDX_Reservation_No_of_Nights ;
DROP INDEX IDX_Reservation_No_of_TP_Tickets; 
DROP INDEX IDX_Room_View ;
DROP INDEX IDX_Room_Rate;
DROP INDEX IDX_Pricing_Discount;
DROP INDEX IDX_Pricing_Discount_Type;
DROP INDEX IDX_Payment_Name_on_Card;
DROP INDEX IDX_Payment_Card_number;
DROP INDEX IDX_Payment_Res_No;
DROP INDEX IDX_Paymnet_Pricing_ID;


---TABLES
DROP TABLE Guest;
DROP TABLE Reservation;
DROP TABLE Rooms;
DROP TABLE Pricing;
DROP TABLE Payment;


/* Create tables based on entities */
CREATE TABLE Guest
(
Guest_ID         INTEGER             NOT NULL,
F_Name           VARCHAR(25)         NOT NULL,
L_Name           VARCHAR(25)         NOT NULL,
AGE              INTEGER             NOT NULL,
Email_ID         VARCHAR(40)         NOT NULL,
Phone            VARCHAR(20)         NOT NULL,
Platinum_Member  VARCHAR(3)          NOT NULL,
CONSTRAINT PK_Guest PRIMARY KEY (Guest_ID)
);
CREATE TABLE Reservation
(
Res_no           INTEGER             NOT NULL,
Guest_ID         INTEGER             NOT NULL,
Checkin_Dt       DATE                NOT NULL,
Checkout_Dt      DATE                NOT NULL,
No_of_Nights     INTEGER             AS (Checkout_Dt - Checkin_Dt),
Res_Status       VARCHAR(50)         NOT NULL,
No_of_Guests     INTEGER             NOT NULL,
No_of_TP_Tickets INTEGER             NOT NULL,
Res_Date         DATE                NOT NULL,
CONSTRAINT PK_Reservation PRIMARY KEY (Res_no),
CONSTRAINT FK_Reservation FOREIGN KEY (Guest_ID) REFERENCES Guest
);

Create TABLE Rooms
(
Room_No           INTEGER               NOT NULL,
Res_No            INTEGER               NOT NULL,
Room_Category     VARCHAR(30)           NOT NULL,
Room_Type         VARCHAR(30)           NOT NULL,
Room_View         VARCHAR(30)           NOT NULL,
Breakfast         VARCHAR(5)            NOT NULL,
Room_Rate         VARCHAR(15)           NOT NULL,
CONSTRAINT PK_Rooms PRIMARY KEY (Room_No),
CONSTRAINT FK_Rooms FOREIGN KEY (Res_No) REFERENCES Reservation
);

CREATE TABLE Pricing
(
Pricing_ID           INTEGER         NOT NULL,
Discount_Code        VARCHAR(4)      NOT NULL,
Discount_Type        VARCHAR(35)     NOT NULL,
Discount_percent     INTEGER         NOT NULL,
Theme_Park_Price     INTEGER         NOT NULL,
Room_Tax_Rate        INTEGER         NOT NULL,
TP_Ticket_Tax_Rate   INTEGER         NOT NULL,
CONSTRAINT PK_Pricing PRIMARY KEY (Pricing_ID)
);

CREATE TABLE Payment
(
Pmt_ID               INTEGER         NOT NULL,
Res_No               INTEGER         NOT NULL,
Pricing_ID           INTEGER         NOT NULL,
Pmt_Method           VARCHAR(35)     NOT NULL,
Card_Number          VARCHAR(16)     NOT NULL,
Type_of_Card         VARCHAR(16)     NOT NULL,
Name_on_Card         VARCHAR(50)     NOT NULL,
Exp_Date             VARCHAR(7)      NOT NULL,
Pmt_Status           VARCHAR(20)     NOT NULL,
CONSTRAINT PK_Payment PRIMARY KEY (Pmt_ID),
CONSTRAINT FK_Payment FOREIGN KEY (Res_No) REFERENCES Reservation,
CONSTRAINT FK2_Payment FOREIGN KEY (Pricing_ID) REFERENCES Pricing
);




/* Create indices for natural keys, foreign keys, and frequently-queried columns */
--Guest
-- Natural keys
CREATE INDEX IDX_Guest_FName ON Guest (F_Name);
-- Frequently-queried columns
CREATE INDEX IDX_Guest_Age ON Guest (Age);
CREATE INDEX IDX_Guest_Platinum_Membership  ON Guest (Platinum_Member);
--Reservation
-- Frequently-queried columns
CREATE INDEX IDX_Reservation_No_of_Nights ON Reservation (No_of_Nights);
CREATE INDEX IDX_Reservation_No_of_TP_Tickets  ON Reservation (No_of_TP_Tickets);
-- Foreign Key
CREATE INDEX IDX_Guest_ID ON Reservation (Guest_ID);
--Rooms
-- Frequently-queried columns
CREATE INDEX IDX_Room_View ON Rooms (Room_View);
CREATE INDEX IDX_Room_Rate ON Rooms (Room_Rate);
--Pricing
-- Frequently-queried columns
CREATE INDEX IDX_Pricing_Discount ON Pricing (Discount_percent);
CREATE INDEX IDX_Pricing_Discount_Type ON Pricing (Discount_Type);
--Payment
-- Natural keys
CREATE INDEX IDX_Payment_Name_on_Card ON Payment (Name_on_Card);
-- Frequently-queried columns
CREATE INDEX IDX_Payment_Card_number ON Payment (Card_Number);
-- Foreign Keys
CREATE INDEX IDX_Payment_Res_No ON Payment (Res_No);
CREATE INDEX IDX_Paymnet_Pricing_ID ON Payment (Pricing_ID);



/* Alter Tables by adding Audit Columns */
ALTER TABLE Guest 
ADD (
created_by VARCHAR2(30), date_created DATE, modified_by VARCHAR2(30), date_modified DATE
);
ALTER TABLE Reservation 
ADD (
created_by VARCHAR2(30), date_created DATE, modified_by VARCHAR2(30), date_modified DATE
);
ALTER TABLE Rooms 
ADD (
created_by VARCHAR2(30), date_created DATE, modified_by VARCHAR2(30), date_modified DATE
);
ALTER TABLE Pricing
ADD (
created_by VARCHAR2(30), date_created DATE, modified_by VARCHAR2(30), date_modified DATE
);
ALTER TABLE Payment
ADD (
created_by VARCHAR2(30), date_created DATE, modified_by VARCHAR2(30), date_modified DATE
);

/* Create Views */
-- Business purpose: The GuestInfo view will be used primarily for quickly searching information about individual guests for populating their Age and whether they are a Platinum member or not for computing discounts.
CREATE OR REPLACE VIEW GuestInfo AS
SELECT Guest_ID, F_Name, L_Name, Age, Platinum_Member
FROM Guest;
-- Business purpose: The ReservationInfo view will be used primarily for quickly searching information about individual guests for populating the number of theme park tickets they purchased and the number of nights they would be staying at the hotel to compute the payment amount for them 
CREATE OR REPLACE VIEW ReservationInfo AS
SELECT Res_no, Guest_ID, No_of_Nights,No_of_TP_Tickets
FROM Reservation;
-- Business purpose: The RoomsInfo view will be used primarily for quickly searching about individual guests for populating the room type and room view and the price of the room
CREATE OR REPLACE VIEW RoomsInfo AS
SELECT Room_No, Room_Category, Room_Type, Room_View, Room_Rate
FROM Rooms;
-- Business purpose: The PricingInfo view will be used primarily for quickly searching information about the Discount Code and Discount Type to derive the Pricing_ID.
CREATE OR REPLACE VIEW PricingInfo AS
SELECT Pricing_ID, Discount_Type, Discount_percent
FROM Pricing;
-- Business purpose: The PaymentInfo view will be used primarily for quickly searching informarion about the name of card holder and respective Pmt_ID and Res_No associated with it.
CREATE OR REPLACE VIEW PaymentInfo AS
SELECT Pmt_ID, Res_No, Name_on_Card
FROM Payment;

/* Create Sequences */
CREATE SEQUENCE SEQ_Guest_ID increment by 1 start with 101;
CREATE SEQUENCE SEQ_Res_No increment by 1 start with 10025;
CREATE SEQUENCE SEQ_Pricing_ID increment by 1 start with 1;
CREATE SEQUENCE SEQ_Pmt_ID increment by 1 start with 130045;

/* Create Triggers */
-- Business purpose: The TR_Guest trigger automatically assigns a sequential Guest ID to a newly-inserted row in the Guest table, assigning appropriate values to the created_by and date_created fields. If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. 
CREATE OR REPLACE TRIGGER TR_Guest
BEFORE INSERT OR UPDATE ON Guest
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.Guest_ID IS NULL THEN
   :NEW.Guest_ID :=SEQ_Guest_ID.NEXTVAL;
    END IF;
    IF :NEW.created_by IS NULL THEN
       :NEW.created_by := USER;
    END IF;
    IF :NEW.date_created IS NULL THEN
       :NEW.date_created := SYSDATE;
    END IF;
END IF;
IF INSERTING OR UPDATING THEN
    :NEW.modified_by := USER;
    :NEW.date_modified := SYSDATE;
    END IF;
END;

-- Business purpose: The TR_Res trigger automatically assigns a sequential Reservation Number to a newly-inserted row in the Reservation table, assigning appropriate values to the created_by and date_created fields. If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. 
CREATE OR REPLACE TRIGGER TR_Res
BEFORE INSERT OR UPDATE ON Reservation
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.Res_No IS NULL THEN
   :NEW.Res_No :=SEQ_Res_No.NEXTVAL;
    END IF;
    IF :NEW.created_by IS NULL THEN
       :NEW.created_by := USER;
    END IF;
    IF :NEW.date_created IS NULL THEN
       :NEW.date_created := SYSDATE;
    END IF;
END IF;
IF INSERTING OR UPDATING THEN
    :NEW.modified_by := USER;
    :NEW.date_modified := SYSDATE;
    END IF;
END;

-- Business purpose: The TR_Rooms trigger automatically assigns appropriate values to the created_by and date_created fields. If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. 
CREATE OR REPLACE TRIGGER TR_Rooms
BEFORE INSERT OR UPDATE ON Rooms
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.created_by IS NULL THEN
       :NEW.created_by := USER;
    END IF;
    IF :NEW.date_created IS NULL THEN
       :NEW.date_created := SYSDATE;
    END IF;
END IF;
IF INSERTING OR UPDATING THEN
    :NEW.modified_by := USER;
    :NEW.date_modified := SYSDATE;
    END IF;
END;

-- Business purpose: The TR_Pricing trigger automatically assigns a sequential Pricing ID to a newly-inserted row in the Pricing table, assigning appropriate values to the created_by and date_created fields. If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. 
CREATE OR REPLACE TRIGGER TR_Pricing
BEFORE INSERT OR UPDATE ON Pricing
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.Pricing_ID IS NULL THEN
   :NEW.Pricing_ID :=SEQ_Pricing_ID.NEXTVAL;
    END IF;
    IF :NEW.created_by IS NULL THEN
       :NEW.created_by := USER;
    END IF;
    IF :NEW.date_created IS NULL THEN
       :NEW.date_created := SYSDATE;
    END IF;
END IF;
IF INSERTING OR UPDATING THEN
    :NEW.modified_by := USER;
    :NEW.date_modified := SYSDATE;
    END IF;
END;

-- Business purpose: The TR_Payment trigger automatically assigns a sequential Pmt ID to a newly-inserted row in the Payment table, assigning appropriate values to the created_by and date_created fields. If the record is being inserted or updated, appropriate values are assigned to the modified_by and modified_date fields. 
CREATE OR REPLACE TRIGGER TR_Payment
BEFORE INSERT OR UPDATE ON Payment
FOR EACH ROW
BEGIN
IF INSERTING THEN
    IF :NEW.Pmt_ID IS NULL THEN
   :NEW.Pmt_ID :=SEQ_Pmt_ID.NEXTVAL;
    END IF;
    IF :NEW.created_by IS NULL THEN
       :NEW.created_by := USER;
    END IF;
    IF :NEW.date_created IS NULL THEN
       :NEW.date_created := SYSDATE;
    END IF;
END IF;
IF INSERTING OR UPDATING THEN
    :NEW.modified_by := USER;
    :NEW.date_modified := SYSDATE;
    END IF;
END;



