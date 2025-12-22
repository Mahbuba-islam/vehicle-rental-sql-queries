-- users table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    userRole VARCHAR(20) 
    CHECK (userRole IN ('Admin', 'Customer')) 
    NOT NULL,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phoneNumber VARCHAR(20)
   
);


-- vehicles table

CREATE TABLE vehicles (
    vehicle_id SERIAL PRIMARY KEY,
    vehicleName VARCHAR(100) NOT NULL,
    vehicleType VARCHAR(20) CHECK (vehicleType IN ('car', 'bike', 'truck')),
    model VARCHAR(100) NOT NULL,
    registrationNumber VARCHAR(50) UNIQUE NOT NULL,
    rentalPricePerDay DECIMAL(10,2) NOT NULL CHECK (rentalPricePerDay >= 0),
    availabilityStatus VARCHAR(20) 
        CHECK (availabilityStatus IN ('available', 'rented', 'maintenance'))
        
);



-- bookings table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    endDate DATE NOT NULL,
    bookingStatus VARCHAR(20)
     CHECK (bookingStatus IN ('pending', 'confirmed', 'completed', 'cancelled')),
    totalCost DECIMAL(10,2) NOT NULL CHECK (totalCost >= 0),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(vehicle_id)
);

INSERT INTO users (userRole, name, email, password, phoneNumber) VALUES
('Admin', 'Mahbuba Rahman', 'mahbuba.admin@dropzet.com', '$2a$10$A1b2C3d4E5f6G7h8I9j0', '01711-123456'),
('Customer', 'Arif Hossain', 'arif.hossain@example.com', '$2a$10$K1l2M3n4O5p6Q7r8S9t0', '01822-987654'),
('Customer', 'Sadia Akter', 'sadia.akter@example.com', '$2a$10$Z1y2X3w4V5u6T7s8R9q0', '01933-456789'),
('Admin', 'Jamal Uddin', 'jamal.uddin@dropzet.com', '$2a$10$M1n2B3v4C5x6Z7l8K9j0', '01644-112233'),
('Customer', 'Nusrat Jahan', 'nusrat.jahan@example.com', '$2a$10$P1o2I3u4Y5t6R7e8W9q0', '01555-998877'),
('Customer', 'Tanvir Ahmed', 'tanvir.ahmed@example.com', '$2a$10$Q1w2E3r4T5y6U7i8O9p0', '01766-223344'),
('Customer', 'Rafiul Islam', 'rafiul.islam@example.com', '$2a$10$H1g2F3d4S5a6Q7w8E9r0', '01877-334455'),
('Admin', 'Shamima Sultana', 'shamima.sultana@dropzet.com', '$2a$10$V1b2N3m4K5j6H7g8F9d0', '01988-445566'),
('Customer', 'Mehedi Hasan', 'mehedi.hasan@example.com', '$2a$10$C1v2X3z4L5k6J7h8G9f0', '01699-556677'),
('Customer', 'Farhana Kabir', 'farhana.kabir@example.com', '$2a$10$T1r2E3w4Q5a6S7d8F9g0', '01500-667788');



INSERT INTO vehicles 
(vehicleName, vehicleType, model, registrationNumber, rentalPricePerDay, availabilityStatus) 
VALUES
('Toyota Axio', 'car', '2018', 'DHAKA-METRO-GA-112233', 2500.00, 'available'),
('Honda Civic', 'car', '2020', 'DHAKA-METRO-GA-445566', 3500.00, 'rented'),
('Suzuki Gixxer', 'bike', '2019', 'DHAKA-METRO-HA-778899', 800.00, 'available'),
('Yamaha FZS', 'bike', '2021', 'DHAKA-METRO-HA-990011', 900.00, 'maintenance'),
('Tata Ace Mini Truck', 'truck', '2017', 'DHAKA-METRO-TA-223344', 4000.00, 'available'),
('Nissan X‑Trail', 'car', '2022', 'DHAKA-METRO-GA-556677', 4200.00, 'rented'),
('Hero Splendor', 'bike', '2018', 'DHAKA-METRO-HA-334455', 700.00, 'available'),
('Ashok Leyland Cargo', 'truck', '2019', 'DHAKA-METRO-TA-667788', 5000.00, 'maintenance'),
('Hyundai Tucson', 'car', '2021', 'DHAKA-METRO-GA-889900', 3800.00, 'available'),
('TVS Apache RTR', 'bike', '2020', 'DHAKA-METRO-HA-112244', 850.00, 'rented');



---------------------------------------------------------------

--queries 

--1--- Retrieve booking information along with:

SELECT name, vehicleName FROM bookings 
INNER JOIN customers using(user_id) 
INNER JOIN vehicles using(vehicle_id)


-- Query 2: EXISTS
-- Find all vehicles that have never been booked.

SELECT * FROM vehicles as v
WHERE NOT EXISTS 
(SELECT * FROM bookings as b WHERE v.vehicle_id = b.vehicle_id)
