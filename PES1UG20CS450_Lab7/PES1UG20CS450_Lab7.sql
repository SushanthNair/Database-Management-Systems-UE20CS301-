/*task1*/
Select u.user_id,u.user_type,u.firstname,u.lastname from train_user as u,ticket_details as p WHERE (u.user_id = p.passenger_id AND p.departure = 'Bengaluru' AND p.arrival='Chennai' AND (p.travel_date like '2022-08%' OR p.travel_date like '2021-10%'));

/*task2*/
Select u.user_id,u.user_type,u.firstname,u.lastname from train_user as u,ticket_details as p WHERE (u.user_id = p.passenger_id AND p.departure = 'Bengaluru' AND p.arrival='Chennai' AND (p.travel_date like '2022-08%' AND p.travel_date like '2021-10%'));

/*task3*/
Select u.user_id,u.user_type,u.firstname,u.lastname from train_user as u,ticket_details as p WHERE (u.user_id = p.passenger_id AND p.departure = 'Bengaluru' AND p.arrival='Chennai' AND (p.travel_date like '2022-08%')) 
except select user_id,user_type,firstname,lastname from train_user,ticket_details where arrival='Chennai' AND departure='Bengaluru' AND travel_date like '2021-10%' AND user_id=passenger_id;

/*task4*/
select user_id,user_type,firstname,lastname from(select * from
(select passenger_id,travel_date as tt1 from ticket_details where departure='Bengaluru' and arrival='Chennai') as b1 
inner join 
(select travel_date as tt2 from ticket_details where departure='Chennai' and arrival='Bengaluru') as b2 
on b2.tt2<=b1.tt1 + 7) as t1 
inner join train_user as t on t.user_id = t1.passenger_id;

/*task5*/
select t.user_id,t.user_type,t.firstname,t.lastname from
(select passenger_id from ticket_details where departure='Bengaluru' and arrival='Chennai' 
EXCEPT 
select passenger_id from ticket_details where departure='Chennai' and arrival='Bengaluru') as k 
inner join train_user as t on k.passenger_id=t.user_id;