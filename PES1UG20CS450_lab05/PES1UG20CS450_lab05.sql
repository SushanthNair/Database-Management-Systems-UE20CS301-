/*question-1*/
CREATE VIEW view1 AS
SELECT ticket_details.pnr, ticket_details.train_no, ticket_details.departure, ticket_details.arrival,
route_Info.Distance, fare_table.fare_per_km
FROM ticket_details, route_info, fare_table
WHERE (ticket_details.train_no = route_info.train_no AND
ticket_details.departure = route_info.from_station_name AND
ticket_details.arrival = route_info.to_station_name AND
fare_table.train_type=ticket_details.train_type AND
fare_table.compartment_type =ticket_details.compartment_type);

CREATE VIEW view2 AS select PNR, count(PNR) as numbers from
ticket_passenger group by PNR;

UPDATE payment_Info AS p 
INNER JOIN view1 AS v1 ON p.PNR = v1.PNR 
INNER JOIN view2 AS v2 ON v1.PNR = v2.PNR SET p.price = v1.distance * v1.fare_per_km * v2.numbers;

/*Question-2*/
SELECT T.Train_No , T.Train_Name , R.from_station_no , R.to_Station_no , R.to_station_name , R.distance 
from train as T Natural JOIN route_Info as R
where R.to_station_no-R.from_station_no =1
order by 1;

/*Question-3*/
SELECT Train.Train_No from Train inner join compartment 
where Train.Train_No=compartment.train_number and compartment.availability>10
and Train.source='Bengaluru' and destination='Chennai';

/*Question-4*/
SELECT DISTINCT ticket_passenger.name 
from ticket_passenger INNER JOIN payment_info 
where payment_info.price>500;

/*Question-5*/
SELECT DISTINCT firstname, lastname, dob, ticket_details.pnr 
from train_user join ticket_details on train_user.user_id=ticket_details.passenger_id;

/*Question-6*/
SELECT Distinct train_user.firstname, train_user.lastname 
from train_user left outer join ticket_details on train_user.user_id!=ticket_details.passenger_id;

/*Question-7*/
SELECT ticket_details.pnr,ticket_details.train_no,ticket_details.travel_date,train_user.firstname,train_user.lastname 
from train_user right outer join ticket_details on train_user.user_id=ticket_details.passenger_id;

/*Question-8*/
SELECT ticket_details.passenger_id, train.Train_No, train.Train_Name 
from ticket_details right outer join train on ticket_details.train_no=train.Train_No;

/*Question-9*/
SELECT train.train_no, train.train_name from train where train_no in (
select train_no
from ticket_details 
where Train_No in (
select Train_No 
from  route_info 
where distance>100) 
and Departure_Time!="20:30:00") 
and destination!="Mangaluru";

/*Question-10*/
SELECT DISTINCT ticket_details.passenger_id 
from ticket_details join payment_info 
where payment_info.price>(select AVG(payment_info.price) 
from payment_info);