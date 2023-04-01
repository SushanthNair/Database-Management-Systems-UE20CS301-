/*Join Queries*/
SELECT passenger1.pid,passenger2.fname,passenger2.lname,passenger2.address
FROM passenger1 INNER JOIN passenger2 ON passenger1.passportno =passenger2.passportno;

SELECT DISTINCT airline.AL_NAME, airline.three_digit_code,contains.ap_name
FROM airline INNER JOIN contains ON airline.airlineid = contains.airlineid;

SELECT e1.ssn,e1.fname,e1.lname,e2.salary FROM employee1 as e1 INNER JOIN
employee2 as e2 ON e1.jobtype = e2.jobtype;

SELECT
passenger1.pid,passenger2.fname,passenger2.lname,passenger2.passportno,serves.s
sn,employee1.fname,employee1.lname FROM passenger1 INNER JOIN passenger2
ON passenger1.passportno = passenger2.passportno INNER JOIN serves ON
serves.pid = passenger1.pid INNER JOIN employee1 ON serves.ssn = employee1.ssn;

/*Aggregate Functions*/
SELECT jobtype, count(*) FROM employee1 GROUP BY jobtype;

SELECT flight_code,flighttype,duration FROM flight INNER JOIN (SELECT flighttype as
ft,max(duration) as maxd FROM flight GROUP BY flighttype) as f1 ON flight.flighttype =
f1.ft AND flight.duration = f1.maxd;

SELECT sex, AVG(age) FROM passenger2 WHERE age > 17 GROUP BY sex;

SELECT COUNT (distinct airlineid) FROM flight;

/*Set Operations*/
SELECT ssn,fname,jobtype FROM employee1 WHERE
jobtype="Traffic Monitor" UNION SELECT ssn,fname,jobtype FROM
employee1 WHERE jobtype="engineer";

SELECT * FROM flight where no_of_stops=0 INTERSECT
SELECT * FROM flight WHERE flighttype="direct";

SELECT * FROM ticket1 where destination="DEL"
INTERSECT SELECT * FROM ticket1 WHERE class="economy";

SELECT * FROM passenger2 where sex="F" EXCEPT
SELECT * FROM passenger2 WHERE passportno like "B%";

/*Function*/
DELIMITER //
CREATE FUNCTION no_of_hours(date1 time,date2 time) RETURNS int DETERMINISTIC
BEGIN
RETURN select abs(timestampdiff(minute,date1,date2));
END
//DELIMITER;

/*Procedure*/
DELIMITER $$
CREATE PROCEDURE OrderEmployeeSSN()
BEGIN
SELECT ssn,fname,lname,address FROM employee1 order by ssn asc;
END;$$

/*Trigger*/
DELIMITER $$
CREATE OR REPLACE TRIGGER DELAYEDFLIGHTS
BEFORE INSERT
ON FLIGHT FOR EACH ROW
BEGIN
DECLARE msg VARCHAR(255);
SET msg = ('No more delayed flights can be entered');
IF new.STATUS ='delayed' THEN
SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT = msg;
END IF;
END
$$
DELIMITER;

/*Cursor*/
delimiter //
CREATE PROCEDURE firstCurs()
BEGIN
DECLARE d INT DEFAULT 0;
DECLARE c_name, c_address VARCHAR(150);
DECLARE Get_cur CURSOR FOR SELECT fname,address FROM passenger2;
DECLARE CONTINUE HANDLER FOR SQLSTATE '02000'
SET d = 1;
DECLARE CONTINUE HANDLER FOR SQLSTATE '23000'
SET d = 1;
OPEN Get_cur;
lbl: LOOP
IF d = 1 THEN
LEAVE lbl;
END IF;
IF NOT d = 1 THEN
FETCH Get_cur INTO c_name, c_address;
INSERT INTO passenger4 VALUES(c_name,c_address);
END IF;
END LOOP;
CLOSE Get_cur;
END
//
