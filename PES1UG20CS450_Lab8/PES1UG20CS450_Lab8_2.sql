/*Name: Sushanth M Nair
SRN:PES1UG20CS450
Section: H
Roll No: 50
*/
DELIMITER $$
CREATE procedure find_age(IN UserID varchar(30), IN DOB DATE)
BEGIN
DECLARE age_value int; 
SET age_value = FLOOR(DATEDIFF(CURRENT_DATE,DOB)/365);
UPDATE train_user set age = age_value where user_id = UserID;
END; $$
DELIMITER ;

SELECT user_id,age,dob from train_user WHERE user_id='ADM_001' ;
CALL find_age('ADM_001','1989-04-14');
/*after updating*/
SELECT user_id,age,dob from train_user WHERE user_id='ADM_001' ;