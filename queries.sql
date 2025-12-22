---------------------------------------------------------------

--queries 

--1--- Retrieve booking information along with:

SELECT booking_id, name, vehicleName, start_Date, endDate, bookingStatus from bookings 
INNER JOIN users using(user_id)
INNER JOIN vehicles using(vehicle_id)


-- Query 2: EXISTS
-- Find all vehicles that have never been booked.

SELECT * FROM vehicles as v
WHERE NOT EXISTS 
(SELECT * FROM bookings as b 
WHERE v.vehicle_id = b.vehicle_id)


-- Query 3: Retrieve all available vehicles of a specific type (e.g. cars).

SELECT * FROM vehicles 
WHERE vehicletype = 'car'



-- Query 4: Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

SELECT vehicle_id, 
count(*) as total_bookings 
FROM bookings GROUP BY vehicle_id 
HAVING count(*) > 1


----------------------------------------------------------------------------------------------------------------------