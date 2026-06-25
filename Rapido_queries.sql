CREATE database Uber;
Use Uber;
SELECT * From Bookings;

#Retrieve all successful bookings:
Create View Successful_Booking AS 
SELECT *FROM bookings 
WHERE Booking_Status ="Success";
SELECT *FROM Successful_Booking;
DROP VIEW Successful_Booking;

#Find the average ride distance for each vehicle type:
CREATE VIEW ride_distance_for_each_vehicle AS
SELECT Vehicle_type, AVG(Ride_Distance)
as Average_distance FROM bookings
group by Vehicle_type;
SELECT * FROM  ride_distance_for_each_vehicle;

#Get the total number of cancelled rides by customers
SELECT COUNT(*) FROM bookings
where Booking_Status = 'Canceled by Customer';

# the top 5 customers who booked the highest number of rides:
CREATE VIEW top_5_customers AS 
SELECT Customer_ID ,COUNT(Booking_ID) AS total_booking
FROM bookings
GROUP BY Customer_ID
ORDER BY total_booking DESC
LIMIT 5;
SELECT * FROM top_5_customers;

#Get the number of rides cancelled by drivers due to personal and car-related issues:
SELECT COUNT(*) FROM bookings
WHERE canceled_Rides_by_Driver='Personal & Car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create View Max_Min_Driver_Rating As
SELECT MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';
SELECT * FROM Max_Min_Driver_Rating;

#7. Retrieve all rides where payment was made using UPI:
Create View UPI_Payment As
SELECT*FROM bookings
WHERE Payment_Method = 'UPI';
SELECT * FROM UPI_Payment ;

#8. Find the average customer rating per vehicle type:
Create View AVG_Cust_Rating As
SELECT Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
FROM bookings
GROUP BY Vehicle_Type;
SELECT * FROM AVG_Cust_Rating ;

#9. Calculate the total booking value of rides completed successfully:
Create View total_successful_ride_value As
SELECT SUM(Booking_Value) AS total_succesful_ride_value
FROM bookings 
WHERE Booking_Status ='Success';
SELECT * FROM  total_successful_ride_value;

#10. List all incomplete rides along with the reason:
Create View Incomplete_Rides_Reason As
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings 
WHERE Incomplete_Rides ='Yes';
SELECT * FROM Incomplete_Rides_Reason ;

select count(*) from bookings;
