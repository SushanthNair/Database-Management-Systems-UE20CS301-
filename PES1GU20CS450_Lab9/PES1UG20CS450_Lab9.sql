/*Name: Sushanth M Nair
SRN: PES1UG20CS450
Section: H
Roll No:50
*/

/*Task-1*/
SET FOREIGN_KEY_CHECKS=0;
DELIMITER $$
CREATE TRIGGER check_compartment_no
BEFORE INSERT
ON compartment FOR EACH ROW
BEGIN
 DECLARE error_msg VARCHAR(255);
 declare count int;
 SET error_msg = ('Cannot have more than four compartment');
 IF (select count(*) from compartment where train_number = new.train_number) > 4 THEN
 SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT = error_msg;
 END IF;
END $$
DELIMITER ;

/*create backup table*/
CREATE TABLE PAYMENT_BACK ( Transaction_ID varchar(30) PRIMARY KEY,
Bank varchar(30),
 Card_No varchar(16),
 Price int,
 PNR varchar(10) NOT NULL);


/*Task-2*/
DELIMITER $$
CREATE TRIGGER backup_payments
BEFORE DELETE
ON ticket_details FOR EACH ROW
BEGIN
Insert into payment_back select * from payment_info where PNR = old.PNR;
delete from payment_info where PNR = old.PNR;
 delete from ticket_passenger where PNR = old.PNR;
END $$
DELIMITER ;