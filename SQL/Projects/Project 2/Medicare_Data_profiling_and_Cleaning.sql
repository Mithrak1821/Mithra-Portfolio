# This will Count the number of records in that table
SELECT COUNT(*) AS Total_Hospitals FROM Hospitals;
SELECT COUNT(*) FROM Departments;
SELECT COUNT(*) FROM Doctors;
SELECT COUNT(*) FROM Patients;
SELECT COUNT(*) FROM Rooms;
SELECT COUNT(*) FROM Appointments;
SELECT COUNT(*) FROM Admissions;
SELECT COUNT(*) FROM Treatments;
SELECT COUNT(*) FROM Insurance;
SELECT COUNT(*) FROM Medicines;
SELECT COUNT(*) FROM Pharmacy;
SELECT COUNT(*) FROM Laboratory;
SELECT COUNT(*) FROM Employees;
SELECT COUNT(*) FROM Billing;
SELECT COUNT(*) FROM Payments;

# To identify the NULL values in tables
SELECT *
FROM Patients
WHERE patient_id IS NULL
   OR first_name IS NULL
   OR last_name IS NULL
   OR gender IS NULL
   OR date_of_birth IS NULL
   OR age IS NULL
   OR city IS NULL
   OR state IS NULL
   OR phone_number IS NULL
   OR email IS NULL
   OR blood_group IS NULL
   OR registration_date IS NULL;
   
# To identify the duplicates
SELECT department_id, COUNT(*)
FROM Doctors
GROUP BY department_id
HAVING COUNT(*) > 1;

# To retrieve all datas top 5
SELECT * FROM Hospitals LIMIT 5;

# Duplicate check - Hospital
SELECT hospital_id, COUNT(*) AS Count
FROM Hospitals
GROUP BY hospital_id
HAVING COUNT(*) = 1;

# Check null values - Department
SELECT * FROM Departments WHERE head_doctor_id IS NULL;

SELECT * FROM Doctors;

# Display the first occurence of data 
SELECT DISTINCT gender FROM Doctors;

# Count the gender in different formats and group them 
SELECT gender, COUNT(*) 
FROM Doctors 
group by gender;

SELECT gender,doctor_id FROM Doctors;

# Preview the male and female and change them 
SELECT gender, 
CASE 
WHEN LOWER(TRIM(gender)) IN ('male','m')
THEN 'Male'
WHEN LOWER(TRIM(gender)) IN ('female','f')
THEN 'Female'
ELSE gender
END AS Cleaned_gender
FROM Doctors;

Select Cleaned_gender FROM (
Select 
CASE 
WHEN LOWER(TRIM(gender)) IN ('male','m')
THEN 'Male'
WHEN LOWER(TRIM(gender)) IN ('female','f')
THEN 'Female'
ELSE gender
END AS Cleaned_gender
FROM Doctors
) AS D;




# set sql_SAFE_UPDATES=0;

# =========================================================================================================================================================================================
# Data Profiling
#====================================================================================================================================================================================================
# 1. Departments table- head_doctor_id is null
SELECT * from Departments where head_doctor_id is null ;

# 2. Doctors - gender is in different formats
SELECT DISTINCT gender, COUNT(*)
from Doctors
Group by gender;

# 3. Doctors - department_id is blank
SELECT * FROM Doctors where department_id IS NULL;

# 4. Doctors - email is blank
SELECT * FROM Doctors where email IS NULL;
# 5. Check email format
SELECT * FROM Doctors where email NOT REGEXP '^[A-Za-z0-9_%.-]+@[A-Za-z0-9-_.]+\\.[A-Za-z]{2,}$';

# 6. Patients - Traling and leading spaces in first name
SELECT * from Patients where first_name <> ltrim(first_name);

# 7. Patients - gender in different formats
SELECT gender, count(*) 
FROM Patients 
group by gender;

# 8. Patient - Check for email blanks
SELECT * FROM Patients where email is null;
# 9. to check the email format 
SELECT * from Patients where email not regexp '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\\.[a-zA-Z]{2,}';
SELECT * from Patients where email NOT like '%@%.%'; # this is another method to find invalid email, % includes any character

# 10. Admissions - check for blanks in department_id
SELECT * from Admissions where department_id is null;

# 11. Admissions - check for blanks in discharge_date
SELECT * from Admissions where discharge_date is null;

# 12. Treatments - check for blanks in Admission_id
SELECT  * FROM Treatments where Admission_id is null;

# 13. Insurance - check for blanks in insurance_provider
SELECT  * FROM Insurance where insurance_provider is null;

# 14. Employee gender different formats 
SELECT gender, count(*) 
from Employee
group by gender;

# 15. Employees - blanks in department_id
SELECT * FROM Employees where department_id is null;


# 16. Billing - blanks in admission_id
SELECT * FROM Billing where admission_id is null;

# 17. Employees - blanks in appointment_id
SELECT * FROM Billing where appointment_id is null;

# ==============================================================================================================================================================================================
# Data Cleaning
#=====================================================================================================================================================================================================
# 2. Update the changed male and female column in the tables - Doctors
 UPDATE Doctors 
 SET gender=
 CASE 
WHEN LOWER(TRIM(gender)) IN ('male','m')
THEN 'Male'
WHEN LOWER(TRIM(gender)) IN ('female','f')
THEN 'Female'
ELSE gender
END;

# 5. Doctors - Cleaning the emails which are in wrong format
# This is previewing
SELECT 
email AS old_email,
CASE
WHEN email LIKE '%gmail.com' AND email NOT LIKE '%@%'
THEN REPLACE(email,'gmail.com','@gmail.com') 
WHEN email LIKE '%@gmail'
THEN REPLACE(email,'@gmail','@gmail.com') # THEN CONCAT(email,'.com')
WHEN email LIKE '%@@gmail.com' 
THEN REPLACE(email,'@@gmail.com','@gmail.com')
ELSE email
END AS new_email
FROM Doctors;

# Updating
update Doctors 
SET email=
CASE
WHEN email LIKE '%gmail.com' AND email NOT LIKE '%@%'
THEN REPLACE(email,'gmail.com','@gmail.com') 
WHEN email LIKE '%@gmail'
THEN REPLACE(email,'@gmail','@gmail.com') # THEN CONCAT(email,'.com')
WHEN email LIKE '%@@gmail.com' 
THEN REPLACE(email,'@@gmail.com','@gmail.com')
ELSE email
END 
WHERE email not like '%@%.%' or
	email like '%@@%.%';
#SET SQL_SAFE_UPDATES = 0; - When using the Upadate query where condition is applicable for id alone but when we try to use other columns in where condition then it shows sql safe error so to fix it we use this query 

# 6. Patients - Trim the first_name column
UPDATE Patients 
SET first_name=ltrim(first_name)
WHERE first_name <> LTRIM(first_name);

# 7. Patients - gender in different format
SELECT DISTINCT gender from Patients;
# Preview
SELECT gender ,
CASE
WHEN lower(trim(gender)) in ('m','male')
THEN 'Male'
WHEN lower(trim(gender)) in ('f','female')
THEN 'Female'
END
FROM Patients;

# Update 
update Patients 
set gender =
CASE
WHEN lower(trim(gender)) in ('m','male')
THEN 'Male'
WHEN lower(trim(gender)) in ('f','female')
THEN 'Female'
ELSE gender
END;

# 9. Patients - email format is not correct
SELECT email AS old_email, 
CASE
WHEN email LIKE '%gmail.com' AND email not like '%@%'
THEN REPLACE(email,'%gmail.com','%@gmail.com')
WHEN email like '%gmail'
then concat(email,'.com')
else email
end as new_email
FROM Patients;

# Update 
UPDATE Patients 
set email=
CASE
WHEN email LIKE '%gmail.com' AND email not like '%@%'
THEN REPLACE(email,'gmail.com','@gmail.com')
WHEN email like '%gmail'
then concat(email,'.com')
else email
end
where email not like '%@%.%';

# 14. Employee - gender in different format 
select distinct gender from Employees;
UPDATE Employees
set gender =
CASE
when lower(trim(gender)) in ('male','m')
then 'Male'
when lower(trim(gender)) in ('female','f')
then 'Female'
else gender
end;

