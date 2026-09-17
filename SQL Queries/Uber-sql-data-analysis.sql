create database Uber;
use Uber;
SELECT * FROM Uber;

#1. Retrieve all successful bookings.
SELECT * FROM successful_bookings;

CREATE VIEW successful_bookings AS
SELECT * FROM Uber
WHERE BOOKING_Status='Success';

#2. Find the average ride distance for each vehicle type.
SELECT * FROM avg_ride_distance_for_each_vehicle;

CREATE VIEW avg_ride_distance_for_each_vehicle AS
SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),1) AS Avg_Distance FROM Uber
GROUP BY Vehicle_Type;

#3. Get the total number of cancelled rides by customers.
SELECT * FROM cancelled_rides_by_customers;

CREATE VIEW cancelled_rides_by_customers AS
SELECT COUNT(BOOKING_Status) Canceled_by_Customer FROM Uber
WHERE BOOKING_Status='Canceled by Customer';

#4. List the top 5 customers who booked the highest number of rides.
SELECT * FROM Top_5_Customers;

CREATE VIEW Top_5_Customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS Bookings FROM UBER
GROUP BY Customer_ID
ORDER BY Bookings DESC
LIMIT 5;

#5. Get the number of rides cancelled by drivers due to personal and car-related issues.
SELECT * FROM Rides_Cancelled_by_Drivers;

CREATE VIEW Rides_Cancelled_by_Drivers AS
SELECT COUNT(Canceled_Rides_by_Driver) AS Total_Cancellation FROM Uber
WHERE Canceled_Rides_by_Driver='Personal & car related issue';

#6. Find the maximum and minimum driver ratings for Prime Sedan bookings.
SELECT * FROM Min_Max_driver_ratings_prime_sedan;

CREATE VIEW Min_Max_driver_ratings_prime_sedan AS
SELECT MAX(driver_ratings) AS Maximum_Rating,
MIN(driver_ratings) AS Minimum_Rating FROM Uber
WHERE vehicle_type='prime sedan';

#7. Retrieve all rides where payment was made using UPI.
SELECT * FROM UPI_Payments;

CREATE VIEW UPI_Payments AS
SELECT * FROM Uber
WHERE payment_method='UPI';

#8. Find the average customer rating per vehicle type.
SELECT * FROM Avg_Customer_Rating;

CREATE VIEW Avg_Customer_Rating AS
SELECT Vehicle_Type, ROUND(AVG(customer_rating),2) AS Avg_Cust_Rating FROM Uber
GROUP BY Vehicle_Type;

#9. Calculate the total booking value of rides completed successfully.
SELECT * FROM Total_Completed_Rides_Value;

CREATE VIEW Total_Completed_Rides_Value AS
SELECT SUM(booking_value) AS Total_Bookings_Amount FROM Uber
WHERE incomplete_rides='NO';

#10. List all incomplete rides along with the reason.
SELECT * FROM Incomplete_Rides_Reason;

CREATE VIEW Incomplete_Rides_Reason AS
SELECT Booking_ID, Incomplete_Rides_Reason FROM Uber
WHERE incomplete_rides='YES';
