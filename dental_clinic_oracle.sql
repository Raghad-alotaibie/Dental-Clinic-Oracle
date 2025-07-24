-- ===========================
-- Dental Clinic Database Project - Oracle SQL
-- ===========================

-- ==============
-- TABLES
-- ==============

-- Patients Table
CREATE TABLE Patients (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  date_of_birth DATE,
  gender VARCHAR2(10),
  phone_number VARCHAR2(20)
);

-- Dentists Table
CREATE TABLE Dentists (
  dentist_id INT PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  specialization VARCHAR2(50),
  phone_number VARCHAR2(20),
  email VARCHAR2(100)
);

-- Employees Table
CREATE TABLE Employees (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR2(50),
  last_name VARCHAR2(50),
  position VARCHAR2(50),
  phone_number VARCHAR2(20)
);

-- Appointments Table
CREATE TABLE Appointments (
  appointment_id INT PRIMARY KEY,
  patient_id INT,
  dentist_id INT,
  appointment_date DATE,
  duration_minutes INT,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
  FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id)
);

-- Treatments Table
CREATE TABLE Treatments (
  treatment_id INT PRIMARY KEY,
  treatment_name VARCHAR2(100),
  description VARCHAR2(200),
  price DECIMAL(18, 2)
);

-- Payments Table
CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  patient_id INT,
  amount DECIMAL(10, 2),
  payment_date DATE,
  FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- ===================
-- INSERT Sample Data
-- ===================

-- Patients
INSERT INTO Patients VALUES (1, 'Mansour', 'Abdullah', '01-JAN-1985', 'Male', '966-5904');
INSERT INTO Patients VALUES (2, 'Sara', 'Khaled', '06-MAY-1990', 'Female', '966-5049');
INSERT INTO Patients VALUES (3, 'Nawaf', 'Faisal', '08-MAR-1970', 'Male', '966-5039');
INSERT INTO Patients VALUES (4, 'Norah', 'Saud', '08-FEB-1975', 'Female', '966-5937');
INSERT INTO Patients VALUES (5, 'Talal', 'Fahad', '03-NOV-1999', 'Male', '966-5041');
INSERT INTO Patients VALUES (6, 'Haya', 'Abdulrahman', '05-OCT-1996', 'Female', '966-5027');
INSERT INTO Patients VALUES (7, 'Abdullah', 'Sultan', '08-APR-1965', 'Male', '966-5957');
INSERT INTO Patients VALUES (8, 'Rawan', 'Mohammed', '26-JUN-1994', 'Female', '966-5062');
INSERT INTO Patients VALUES (9, 'Ibrahim', 'Abdulaziz', '15-AUG-1997', 'Male', '966-5023');
INSERT INTO Patients VALUES (10, 'Munira', 'Abdullah', '18-JUL-1993', 'Female', '966-5052');

-- Dentists
INSERT INTO Dentists VALUES (1, 'Sara', 'Fahad', 'Dental Public', '966-2131', 'j@gmail.com');
INSERT INTO Dentists VALUES (2, 'Shahad', 'Aliy', 'Dental Public', '966-2545', 's@gmail.com');
INSERT INTO Dentists VALUES (3, 'Nora', 'Sami', 'Oral Radiology', '966-1275', 'n@gmail.com');
INSERT INTO Dentists VALUES (4, 'Fahad', 'Aliy', 'Oral Radiology', '966-1125', 'f@gmail.com');
INSERT INTO Dentists VALUES (5, 'Asma', 'Nawaf', 'Orthodontics', '966-8785', 'a@gmail.com');
INSERT INTO Dentists VALUES (6, 'Sultan', 'Omar', 'Orthodontics', '966-2325', 'su@gmail.com');
INSERT INTO Dentists VALUES (7, 'Joud', 'Mohamed', 'Orthodontics', '966-2995', 'jo@gmail.com');
INSERT INTO Dentists VALUES (8, 'Adm', 'Yazeed', 'Orthodontics', '966-9095', 'y@gmail.com');
INSERT INTO Dentists VALUES (9, 'Shaden', 'Khaled', 'Pedodontics', '966-2325', 'su@gmail.com');
INSERT INTO Dentists VALUES (10, 'Amjad', 'Salem', 'Pedodontics', '966-2005', 'am@gmail.com');

-- Employees
INSERT INTO Employees VALUES (1, 'Sara', 'Fahad', 'Dentist', '966-2131');
INSERT INTO Employees VALUES (2, 'Fahad', 'Ali', 'Hygienist', '966-5678');
INSERT INTO Employees VALUES (3, 'Nora', 'Fahad', 'Assistant', '966-9876');
INSERT INTO Employees VALUES (4, 'Sultan', 'Omar', 'Receptionist', '966-4321');
INSERT INTO Employees VALUES (5, 'Shahad', 'Nawaf', 'Hygienist', '966-2345');
INSERT INTO Employees VALUES (6, 'Asma', 'Khaled', 'Assistant', '966-6789');
INSERT INTO Employees VALUES (7, 'Joud', 'Sami', 'Receptionist', '966-5432');
INSERT INTO Employees VALUES (8, 'Rayan', 'Salem', 'Hygienist', '966-3210');
INSERT INTO Employees VALUES (9, 'Shahad', 'Aliy', 'Dentist', '966-2545');
INSERT INTO Employees VALUES (10, 'Nora', 'Sami', 'Dentist', '966-1275');

-- Treatments
INSERT INTO Treatments VALUES (1, 'Teeth Cleaning', 'Regular cleaning and plaque removal', 75.00);
INSERT INTO Treatments VALUES (2, 'Fillings', 'Restoration of decayed teeth', 150.00);
INSERT INTO Treatments VALUES (3, 'Extraction', 'Removal of damaged or unnecessary teeth', 120.00);
INSERT INTO Treatments VALUES (4, 'Root Canal', 'Treatment of infected tooth pulp', 250.00);
INSERT INTO Treatments VALUES (5, 'Braces', 'Orthodontic treatment for teeth alignment', 2000.00);
INSERT INTO Treatments VALUES (6, 'Dental Crown', 'Restoration of damaged tooth with a crown', 300.00);
INSERT INTO Treatments VALUES (7, 'Dentures', 'Artificial teeth for missing natural teeth', 500.00);
INSERT INTO Treatments VALUES (8, 'Tooth Whitening', 'Cosmetic procedure to whiten teeth', 100.00);
INSERT INTO Treatments VALUES (9, 'Dental Implant', 'Replacement of missing tooth with an implant', 800.00);
INSERT INTO Treatments VALUES (10, 'Gum Surgery', 'Surgical procedures for gum issues', 350.00);

-- Payments
INSERT INTO Payments VALUES (1, 1, 10.20, '08-NOV-2024');
INSERT INTO Payments VALUES (2, 2, 75.00, '02-DEC-2024');
INSERT INTO Payments VALUES (3, 3, 100.00, '22-NOV-2024');
INSERT INTO Payments VALUES (4, 4, 120.00, '12-OCT-2024');
INSERT INTO Payments VALUES (5, 5, 90.00, '15-APR-2024');
INSERT INTO Payments VALUES (6, 6, 110.00, '08-SEP-2024');
INSERT INTO Payments VALUES (7, 7, 80.00, '20-SEP-2024');
INSERT INTO Payments VALUES (8, 8, 60.00, '09-OCT-2024');
INSERT INTO Payments VALUES (9, 9, 70.00, '10-SEP-2024');

-- Appointments
INSERT INTO Appointments VALUES (1, 1, 1, '08-NOV-2024', 60);
INSERT INTO Appointments VALUES (2, 2, 2, '02-DEC-2024', 45);
INSERT INTO Appointments VALUES (3, 3, 3, '22-NOV-2024', 30);
INSERT INTO Appointments VALUES (4, 4, 4, '12-SEP-2024', 60);
INSERT INTO Appointments VALUES (5, 5, 5, '15-APR-2024', 45);
INSERT INTO Appointments VALUES (6, 6, 6, '08-SEP-2024', 30);
INSERT INTO Appointments VALUES (7, 7, 7, '20-SEP-2024', 60);
INSERT INTO Appointments VALUES (8, 8, 8, '09-OCT-2024', 45);
INSERT INTO Appointments VALUES (9, 9, 9, '10-SEP-2024', 30);
INSERT INTO Appointments VALUES (10, 10, 10, '10-SEP-2024', 30);

-- 1. Show all patients with their first name, last name, birthdate, gender, and phone number
SELECT first_name, last_name, date_of_birth, gender, phone_number
FROM Patients;

-- 2. Display all dentists with their first name, last name, and specialization
SELECT first_name, last_name, specialization
FROM Dentists;

-- 3. List all appointments with the patient name, appointment date, and duration
SELECT p.first_name AS patient_first_name, 
       p.last_name AS patient_last_name,
       a.appointment_date, 
       a.duration_minutes
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id;

-- 4. Show all treatments with their name and price
SELECT treatment_name, price
FROM Treatments;

-- 5. Calculate the total amount of payments from all patients
SELECT SUM(amount) AS total_payments
FROM Payments;

-- 6. Count how many patients are registered in the system
SELECT COUNT(*) AS number_of_patients
FROM Patients;

-- 7. List all employees and their job titles
SELECT first_name, last_name, job_title
FROM Employees;

-- 8. Show the names of patients who had a treatment called 'Cleaning'
SELECT DISTINCT p.first_name, p.last_name
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Treatments t ON a.treatment_id = t.treatment_id
WHERE t.treatment_name = 'Cleaning';

-- 9. Display all upcoming appointments sorted by date (from today forward)
SELECT *
FROM Appointments
WHERE appointment_date >= SYSDATE
ORDER BY appointment_date ASC;

-- 10. Count how many appointments each dentist has
SELECT d.first_name || ' ' || d.last_name AS dentist_name, 
       COUNT(a.appointment_id) AS total_appointments
FROM Dentists d
LEFT JOIN Appointments a ON d.dentist_id = a.dentist_id
GROUP BY d.first_name, d.last_name;

-- 11. Show each patient's total payments
SELECT p.first_name, p.last_name, SUM(pay.amount) AS total_paid
FROM Patients p
JOIN Payments pay ON p.patient_id = pay.patient_id
GROUP BY p.first_name, p.last_name;

-- 12. List all treatments that cost more than 1000
SELECT treatment_name, price
FROM Treatments
WHERE price > 1000;

-- 13. List all employees ordered by their job title and last name
SELECT first_name, last_name, job_title
FROM Employees
ORDER BY job_title ASC, last_name ASC;