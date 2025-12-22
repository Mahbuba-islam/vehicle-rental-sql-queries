
# 📘 SQL Query  — Vehicle Rental System  
A collection of SQL queries demonstrating **JOIN**, **EXISTS**, **filtering**, and **aggregation** within a simple vehicle booking system.  
This project is designed for learning and assignment submission purposes.

---

## 📂 Project Overview  
This project contains four SQL queries that operate on three tables:

- **users**
- **vehicles**
- **bookings**


## 🧩 Table Structure (Assumed)
Although the full schema is not required, the queries assume the following key fields:

### **users**
- `user_id`
- `name`

### **vehicles**
- `vehicle_id`
- `vehicleName`
- `vehicleType`

### **bookings**
- `booking_id`
- `user_id`
- `vehicle_id`
- `start_date`
- `endDate`
- `bookingStatus`

---

# 🔍 Queries Included


## **1️⃣ Retrieve Booking Information with User & Vehicle Details**

### **Purpose:**  
To display complete booking information by joining the `bookings`, `users`, and `vehicles` tables.


## **2️⃣ Find Vehicles That Have Never Been Booked (Using NOT EXISTS)**

### **Purpose:**  
To identify vehicles that are available but have **zero bookings**.


## **4️⃣ Count Total Bookings Per Vehicle (Only Vehicles with More Than 2 Bookings)**

### **Purpose:**  
To analyze booking frequency and display only vehicles with **more than 2 bookings**.


# 🧠 Concepts Demonstrated

| Concept | Description |
|--------|-------------|
| **INNER JOIN** | Combines related data from multiple tables |
| **EXISTS / NOT EXISTS** | Checks presence or absence of related records |
| **Filtering** | Using `WHERE` to select specific data |
| **Aggregation** | Using `COUNT()` to summarize data |
| **HAVING** | Filters grouped results after aggregation |

---

# 🚀 How to Use  
1. Import your database schema.  
2. Insert sample data into `users`, `vehicles`, and `bookings`.  
3. Run each query individually to observe the output.  
4. Use the results to understand JOINs, filtering, and aggregation.

---