/*Project DBF 12 - DML and Query*/

/* Populate all tables */

--Guest table

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Gasan', 'Elkhodari', 42, 'gasan.elkhodari@utdallas.edu', '(972)883-4779', 'Yes');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Sai Suma', 'Maguluri', 24, 'saisuma.maguluri@utdallas.edu', '(972)883-2705', 'Yes');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('John', 'Doe', 69, 'john.doe@gmail.com', '(469)850-5189', 'No');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Jacob', 'Foster', 31, 'jacob.foster@gmail.com', '(214)573-7890', 'Yes');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('John', 'Smith', 26,'john.smith@yahoo.com', '(469)650-9879', 'No');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Andrea', 'Jones', 55, 'andreajones@hotmail.com', '(630)639-2914', 'No');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Taylor', 'Anderson', 74,'taylor.anderson@gmail.com', '(469)879-0770', 'No');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Aman', 'Sharma', 23,'sharmaaman@yahoo.com', '(847)245-0990', 'Yes');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Kyle', 'Cunningham', 45,'cunninghamk@gmail.com', '(202)230-8970', 'Yes');  

INSERT INTO Guest (F_Name, L_Name, Age, Email_ID, Phone, Platinum_Member)
VALUES ('Mehnaz', 'Mahmood', 51, 'mmahmood@yahoo.com', '(449)517-9809', 'No'); 

-- Reservation table
INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests, No_of_TP_Tickets, Res_Date)
VALUES (101,'24/OCT/2022','27/OCT/2022','Confirmed',1,0,'14/OCT/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (102,'29/SEP/2022','3/OCT/2022','Confirmed',5,5,'10/SEP/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (103,'21/OCT/2022','26/OCT/2022','Confirmed',4,4,'11/OCT/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (104,'14/NOV/2022','19/NOV/2022','Confirmed',2,2,'30/OCT/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (105,'27/NOV/2022','1/DEC/2022','Confirmed',2,2,'20/NOV/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (106,'8/DEC/2022','12/DEC/2022','Confirmed',2,2,'15/NOV/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (107,'12/DEC/2022','15/DEC/2022','Confirmed',3,2,'10/NOV/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (108,'15/DEC/2022','18/DEC/2022','Waiting_for_Room Availability',4,3,'14/NOV/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (109,'23/DEC/2022','25/DEC/2022','Waiting_for_Room Availability',3,3,'22/NOV/2022');

INSERT INTO Reservation (Guest_ID, Checkin_Dt,Checkout_Dt, Res_Status, No_of_Guests,No_of_TP_Tickets, Res_Date)
VALUES (110,'25/DEC/2022','30/DEC/2022','Waiting_for_Room Availability',2,2,'15/DEC/2022');


-- Rooms Table
INSERT INTO Rooms (Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES ('401', '10025', 'Standard King', 'Non-Smoking', 'Street View', 'No', '$160');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('302', '10026', 'Standard Queen', 'Smoking', 'Themepark View', 'Yes', '$170');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('203', '10027', 'Standard Twin', 'Non-Smoking', 'Pool View', 'Yes', '$140');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('504', '10028', 'Executive Suite', 'Smoking', 'Pool View', 'Yes', '$225');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('305', '10029',	'Standard Queen', 'Smoking', 'Pool View', 'Yes', '$165');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('206', '10030', 'Standard Twin', 'Non-Smoking', 'Themepark View', 'No', '$135');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('507', '10031', 'Executive Suite', 'Smoking', 'Themepark View', 'Yes', '$230');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('408', '10032', 'Standard King', 'Smoking', 'Garden View', 'Yes', '$180');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('209', '10033', 'Standard Twin', 'Non-Smoking', 'Pool View', 'Yes', '$140');

INSERT INTO Rooms(Room_No, Res_No, Room_Category, Room_Type, Room_View, Breakfast, Room_Rate)
VALUES('510', '10034', 'Executive Suite', 'Smoking', 'Themepark View', 'Yes', '$230');


--Pricing Table
 
INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('EB', 'Early Bird', 10, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('RT', 'Room Theme Park Combo', 20, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('SC', 'Senior Citizen Discount', 10, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('PM', 'Platinum Member', 15, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('T3', 'More than 2 Theme Park Tickets', 5, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('EXEM', 'Tax Exempt', 0, 55, 0, 0); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('VET', 'Veteran', 7, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('RES', 'Local Texas Resident', 2, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('RSF', 'Room Service Food Order', 2, 55, 13, 8.25); 

INSERT INTO Pricing (Discount_Code, Discount_Type, Discount_percent, Theme_Park_Price, Room_Tax_Rate, TP_Ticket_Tax_Rate)
VALUES ('CS', 'College Student', 3, 55, 13, 8.25); 

--Payment table

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10025,6,'Credit Card',4044120045673450,'Visa','Gasan Elkhodari','04/2026','Paid');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10026,2,'Debit Card',5002341245783458,'Mastercard','Sai Suma Maguluri','05/2025','Paid');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10027,2,'Credit Card',4232456789762345,'Visa','John Doe','04/2023','Paid');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10028,2,'Credit Card',4908789067534573,'Visa','Jacob Foster','09/2026','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10029,2,'Credit Card',5590898765456723,'Mastercard','John Smith','07/2025','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10030,2,'Credit Card',4890654323455789,'Visa','Andrea Jones','12/2026','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10031,2,'Credit Card',4509897654231257,'Visa','Taylor Anderson','11/2025','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10032,2,'Credit Card',4123578974562345,'Visa','Aman Sharma','03/2024','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10033,2,'Debit Card',4678657089234452,'Visa','Kyle Cunningham','05/2024','Balance Due');

INSERT INTO Payment (Res_No, Pricing_ID, Pmt_Method, Card_Number, Type_of_Card, Name_on_Card, Exp_Date, Pmt_Status)
VALUES (10034,2,'Credit Card',5890786543218764,'Mastercard','Mehnaz Mahmood','12/2023','Balance Due');

