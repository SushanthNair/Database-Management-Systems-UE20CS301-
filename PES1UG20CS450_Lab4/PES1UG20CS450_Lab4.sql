/*TASK 1*/
rename train_user To PES1UG20CS450_train_user;/*RENAME OPERATION IS DONE TO ALL RELATIONS TO AVOID PLAGIARISM*/
update PES1UG20CS450_train_user set age = timestampdiff(YEAR,dob,CURDATE());
select * from PES1UG20CS450_route_info WHERE distance between 70 and 150;
select * from PES1UG20CS450_route_info WHERE from_station_name IN ('Chennai','Sholingur') AND to_station_name IN('Chennai','Sholingur');
select * from PES1UG20CS450_train where train_type!='mail';
select * from PES1UG20CS450_route_info WHERE from_station_name='Bengaluru' AND to_station_name='Chennai';
select * from PES1UG20CS450_ticket WHERE departure='Chennai' AND departure_time > '8:00';
select * from pes1ug20cs450_train_user WHERE dob between '1980-01-01' AND '1990-12-31';
select * from pes1ug20cs450_train_user WHERE firstname like'S%';
select availability from pes1ug20cs450_compartment WHERE compartment_type='I Class' AND train_number=62621;

/*TASK 2*/
CREATE USER 'sushanth'@'localhost' IDENTIFIED BY 'password';
GRANT ALL ON *.* TO 'sushanth'@'localhost';
REVOKE update,delete on pes1ug20cs450_train.* FROM 'sushanth'@'localhost';