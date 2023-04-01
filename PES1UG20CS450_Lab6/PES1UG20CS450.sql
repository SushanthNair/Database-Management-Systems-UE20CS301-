/*task1*/
select t.train_no, avg(distance) from train as t natural join route_info as r where r.to_station_no -1 = r.from_station_no
group by train_no;

/*task2*/
select t.train_no, avg(distance) from train as t natural join route_info as r where r.to_station_no -1 = r.from_station_no
group by train_no order by avg(distance)desc;

/*task3*/
select train_no, distance from train natural join route_info where source=from_station_name and destination=to_station_name group by train_no order by distance desc;

/*task4*/
/*min compartments*/
create view compartment_num as select train_name, count(*) as count from train, compartment where train_no=train_number group by train_number order by count;
select * from compartment_num limit 1;
/*max compartments*/
create view compartment_num_max as select train_name, count(*) as count from train, compartment where train_no=train_number group by train_number order by count desc;
select * from compartment_num_max limit 1;

/*task5*/
select user_id, count(user_id) as no_phone_num from user_phone where user_id in ('ADM_001','USR_006','USR_010') group by user_id;

/*task6*/
select Train_Type, AVG(Fare_Per_KM)from fare_table group by Train_Type order by AVG(Fare_Per_KM) desc;

/*task7*/
select * from ticket_passenger where age = (select MAX(age) from ticket_passenger);

/*task8*/
select * from ticket_passenger where name like '%Ullal%';