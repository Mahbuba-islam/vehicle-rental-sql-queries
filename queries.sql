-- users table
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
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
    id SERIAL PRIMARY KEY,
    vehicleName VARCHAR(100) NOT NULL,
    vehicleType VARCHAR(20) CHECK (vehicleType IN ('car', 'bike', 'truck')),
    model VARCHAR(100) NOT NULL,
    registrationNumber VARCHAR(50) UNIQUE NOT NULL,
    rentalPricePerDay DECIMAL(10,2) NOT NULL CHECK (rentalPricePerDay >= 0),
    availabilityStatus VARCHAR(20) 
        CHECK (availabilityStatus IN ('available', 'rented', 'maintenance'))
        DEFAULT 'available'
);




-- bookings table
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    vehicle_id INT NOT NULL,
    start_date DATE NOT NULL,
    endDate DATE NOT NULL,
    bookingStatus VARCHAR(20)
     CHECK (bookingStatus IN ('pending', 'confirmed', 'completed', 'cancelled'))
     DEFAULT 'pending',
    total_cost DECIMAL(10,2) NOT NULL CHECK (total_cost >= 0),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (vehicle_id) REFERENCES vehicles(id)
);

