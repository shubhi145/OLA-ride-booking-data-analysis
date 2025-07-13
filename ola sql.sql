create database ola;
use ola;

# reterieve all successful bookings
create view Successful_Bookings as 
select * from bookings
where Booking_Status = "Success";

#1 reterieve all successful bookings

select * from Successful_Bookings;

#2 find average ride distance for each vehicle type

create view  ride_distance_for_each_vehicle 
as
select Vehicle_Type, avg(Ride_Distance)
as avg_distance from bookings
group by Vehicle_Type;

select * from ride_distance_for_each_vehicle;

#3 get the total no. of canceled ride by customer

create view canceled_ride_by_customer
as
select count(*) from bookings
where booking_status = "Canceled by Customer";


#4 list the top 5 customer who booked highest number of rides

create view top_5_customer_who_booked_highest_number_of_rides
as
select Customer_ID,count(Booking_ID) as total_rides
from bookings
group  by Customer_ID
order by total_rides Desc limit 5;

select * from top_5_customer_who_booked_highest_number_of_rides;

#5 get the no. of rides canceled by driver due to personal & car related issue;

create view rides_canceled_by_driver_due_to_personal_and_car_related_issue
as
select count(*) from bookings
where Canceled_Rides_By_Driver = "Personal & Car related issue";

select * from rides_canceled_by_driver_due_to_personal_and_car_related_issue;


# 6 find the max and nim driver rating for prime sedan bookings

create view max_and_min_rating_for_prime_sedan
as
select max(Driver_Ratings) as max_rating,
min(Driver_Ratings) as min_rating
from bookings where Vehicle_Type = "Prime Sedan";

select * from max_and_min_rating_for_prime_sedan;

#7 reterieve all rides where payments was made using upi

create view UPI_payments
as
select * from bookings
where Payment_method = "UPI";


#8 calculate the total booking value of rides completed succesfully

create view total_successful_ride_fare as
select sum(Booking_Value) as total_successful_ride_fare
from bookings
where Booking_Status = "Success";

select * from total_successful_ride_fare;

#9 find the avg customer rating per vehicle type

create view avg_cust_rating as 
select Vehicle_Type, avg(Customer_Rating)
as avg_rating
from bookings 
group by Vehicle_Type;

select * from avg_cust_rating;

#10 list all incomplete rides along with reason

create view incomplete_rides as
select Booking_ID, Incomplete_Rides_Reason
 from bookings
 where Incomplete_Rides = "Yes";
 
 select * from incomplete_rides;
 
 