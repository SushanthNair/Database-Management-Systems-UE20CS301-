/*Name: Sushanth M Nair
SRN:PES1UG20CS450
Section: H
Roll No: 50
*/
DELIMITER $$
CREATE FUNCTION is_ticket_limit(UserID varchar(255))
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50);
    DECLARE count_ticket int;
    
    SELECT count(PNR) into count_ticket FROM ticket_details WHERE passenger_id = UserID AND 
    MONTH(travel_date) = MONTH(sysdate()) AND YEAR(travel_date) = YEAR(sysdate());
    
	IF count_ticket > 3 THEN
		SET result = 'cannot purchase tickets current limit is over';
	ELSE
		SET result = 'can purchase tickets';
	END IF;
		RETURN result;
END; $$
DELIMITER ;
SELECT user_id, is_ticket_limit(user_id) FROM train_user;