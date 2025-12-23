
# 📘 Vehicle Booking System — SQL Query Project  
A structured SQL project demonstrating JOIN operations, subqueries, 
filtering, and aggregation within a vehicle booking system. 

---

# 📂 Project Overview  
This project contains four SQL queries written for a database consisting of three main tables:

- **users**
- **vehicles**
- **bookings**

Each query highlights a different SQL concept, including:

- INNER JOIN  
- EXISTS / NOT EXISTS  
- Filtering with WHERE  
- Aggregation with GROUP BY  
- Post‑aggregation filtering using HAVING  

---

# 🧩 Database Tables (Assumed Structure)

### **users**
| Column     | Type        | Description |
|------------|-------------|-------------|
| user_id    | INT (PK)    | Unique user identifier |
| name       | VARCHAR     | User's full name |

### **vehicles**
| Column       | Type        | Description |
|--------------|-------------|-------------|
| vehicle_id   | INT (PK)    | Unique vehicle identifier |
| vehicleName  | VARCHAR     | Name/model of the vehicle |
| vehicleType  | VARCHAR     | Type of vehicle (car, bike, van, etc.) |

### **bookings**
| Column        | Type        | Description |
|---------------|-------------|-------------|
| booking_id    | INT (PK)    | Unique booking identifier |
| user_id       | INT (FK)    | References users.user_id |
| vehicle_id    | INT (FK)    | References vehicles.vehicle_id |
| start_date    | DATE        | Booking start date |
| endDate       | DATE        | Booking end date |
| bookingStatus | VARCHAR     | Status of booking |

---

# 📝 Queries and Explanations

## **1️⃣ Retrieve Booking Information with User & Vehicle Details**

### **Purpose:**  
To display complete booking information by joining all related tables.

### **Query:**
```sql
SELECT booking_id, name, vehicleName, start_Date, endDate, bookingStatus 
FROM bookings 
INNER JOIN users USING(user_id)
INNER JOIN vehicles USING(vehicle_id);
```

### **Explanation:**  
- `INNER JOIN` connects bookings with users and vehicles.  
- `USING(user_id)` and `USING(vehicle_id)` simplify join conditions.  
- The result shows who booked which vehicle and for what duration.

---

## **2️⃣ Find Vehicles That Have Never Been Booked (Using NOT EXISTS)**

### **Purpose:**  
To identify vehicles that have **zero bookings**.

### **Query:**
```sql
SELECT * 
FROM vehicles AS v
WHERE NOT EXISTS (
    SELECT * 
    FROM bookings AS b 
    WHERE v.vehicle_id = b.vehicle_id
);
```

### **Explanation:**  
- `NOT EXISTS` checks for the absence of related records.  
- If no booking references a vehicle, it appears in the result.  
- Useful for identifying idle or available vehicles.

---

## **3️⃣ Retrieve All Available Vehicles of a Specific Type**

### **Purpose:**  
To filter vehicles based on their type (e.g., `'car'`, `'bike'`, `'van'`).

### **Query:**
```sql
SELECT * 
FROM vehicles 
WHERE vehicleType = 'car';
```

### **Explanation:**  
- Simple filtering using `WHERE`.  
- Returns all vehicles of the specified type.

---

## **4️⃣ Count Total Bookings Per Vehicle (Only Vehicles with More Than 2 Bookings)**

### **Purpose:**  
To analyze booking frequency and display only vehicles with **more than 2 bookings**.

### **Query:**
```sql
SELECT vehicle_id, 
       COUNT(*) AS total_bookings
FROM bookings 
GROUP BY vehicle_id
HAVING COUNT(*) > 2;
```

### **Explanation:**  
- `GROUP BY` groups bookings by vehicle.  
- `COUNT(*)` counts total bookings per vehicle.  
- `HAVING` filters aggregated results (unlike WHERE).  
- Only vehicles with more than 2 bookings are shown.

---



### **ERD Link**  
https://drawsql.app/teams/next-level-web-dev-1/diagrams/vehicle-rental-system

### **Viva Video Link**  
https://www.youtube.com/watch?v=XJlI5ciQY6Y

---

