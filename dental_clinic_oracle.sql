-- =====================================================
-- Dental Clinic Database - Oracle SQL
-- Description: This script contains table creation, data insertion, and queries.
-- =====================================================


-- ==========  CREATE TABLES ==========
CREATE TABLE Patients (
    patient_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    date_of_birth DATE,
    gender VARCHAR2(10),
    phone_number VARCHAR2(15)
);

CREATE TABLE Dentists (
    dentist_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    specialization VARCHAR2(50)
);

CREATE TABLE Treatments (
    treatment_id NUMBER PRIMARY KEY,
    treatment_name VARCHAR2(50),
    price NUMBER(10,2)
);

CREATE TABLE Appointments (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER,
    dentist_id NUMBER,
    treatment_id NUMBER,
    appointment_date DATE,
    duration_minutes NUMBER,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (dentist_id) REFERENCES Dentists(dentist_id),
    FOREIGN KEY (treatment_id) REFERENCES Treatments(treatment_id)
);

CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    patient_id NUMBER,
    amount NUMBER(10,2),
    payment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    job_title VARCHAR2(50)
);


-- ==========  INSERT DATA ==========

INSERT INTO Patients VALUES (1, 'Sara', 'Ahmed', TO_DATE('1990-05-10', 'YYYY-MM-DD'), 'Female', '0551234567');
INSERT INTO Patients VALUES (2, 'Ali', 'Hassan', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Male', '0559876543');

INSERT INTO Dentists VALUES (1, 'Dr. Aisha', 'Khalid', 'Orthodontics');
INSERT INTO Dentists VALUES (2, 'Dr. Omar', 'Saleh', 'Endodontics');

INSERT INTO Treatments VALUES (1, 'Cleaning', 300);
INSERT INTO Treatments VALUES (2, 'Filling', 500);

INSERT INTO Appointments VALUES (1, 1, 1, 1, TO_DATE('2025-08-01', 'YYYY-MM-DD'), 30);
INSERT INTO Appointments VALUES (2, 2, 2, 2, TO_DATE('2025-08-02', 'YYYY-MM-DD'), 45);

INSERT INTO Payments VALUES (1, 1, 300, TO_DATE('2025-08-01', 'YYYY-MM-DD'));
INSERT INTO Payments VALUES (2, 2, 500, TO_DATE('2025-08-02', 'YYYY-MM-DD'));

INSERT INTO Employees VALUES (1, 'Mona', 'Fahad', 'Receptionist');
INSERT INTO Employees VALUES (2, 'Hani', 'Yousef', 'Assistant');


-- ==========  SELECT QUERIES ==========

-- 1. Show all patients
SELECT first_name, last_name, date_of_birth, gender, phone_number FROM Patients;

-- 2. Show all dentists
SELECT first_name, last_name, specialization FROM Dentists;

-- 3. List appointments with patient name and date
SELECT p.first_name, p.last_name, a.appointment_date, a.duration_minutes
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id;

-- 4. Show treatments and prices
SELECT treatment_name, price FROM Treatments;

-- 5. Total payments
SELECT SUM(amount) AS total_payments FROM Payments;

-- 6. Count of patients
SELECT COUNT(*) AS number_of_patients FROM Patients;

-- 7. Employees list
SELECT first_name, last_name, job_title FROM Employees;

-- 8. Patients who got a 'Cleaning'
SELECT DISTINCT p.first_name, p.last_name
FROM Patients p
JOIN Appointments a ON p.patient_id = a.patient_id
JOIN Treatments t ON a.treatment_id = t.treatment_id
WHERE t.treatment_name = 'Cleaning';

-- 9. Upcoming appointments
SELECT * FROM Appointments
WHERE appointment_date >= SYSDATE
ORDER BY appointment_date;

-- 10. Appointments per dentist
SELECT d.first_name || ' ' || d.last_name AS dentist_name,
       COUNT(a.appointment_id) AS total_appointments
FROM Dentists d
LEFT JOIN Appointments a ON d.dentist_id = a.dentist_id
GROUP BY d.first_name, d.last_name;

-- 11. Total paid by each patient
SELECT p.first_name, p.last_name, SUM(pay.amount) AS total_paid
FROM Patients p
JOIN Payments pay ON p.patient_id = pay.patient_id
GROUP BY p.first_name, p.last_name;

-- 12. Expensive treatments
SELECT treatment_name, price FROM Treatments WHERE price > 1000;

-- 13. Employees sorted
SELECT first_name, last_name, job_title FROM Employees ORDER BY job_title, last_name;
