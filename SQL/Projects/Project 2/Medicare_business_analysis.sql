#===================================================================================================================================================================
# Data Analysis
#========================================================================================================================================================================
# 1. List the unique hospital names 
SELECT distinct hospital_name from Hospitals;

# 2. How many hospitals are there in medicare
SELECT Count(*) as Total_no_of_Hospitals From Hospitals;

# 3. How many DOctors are there in medicare
SELECT Count(*) as Total_no_of_Doctors From Doctors;

# 4. How many Departments are there in medicare
SELECT Count(*) as Total_no_of_Department From Departments;

# 5. Number of doctors have experience > 10
SELECT Count(*) as Experience_more_than_10_years FROM Doctors where experience_years > 10;

# 6. Total number of bed capacity in all hospitals
SELECT sum(bed_capacity) from Hospitals; 

# 7. Average consultation fee 
SELECT round(AVG(consultation_fee),2) from Doctors;

# 8. What is the lowest consultation fee?
select min(consultation_fee) from Doctors;

# 9. What is the highest hospital bed capacity?
select max(bed_capacity) from Hospitals;

# 10. How many doctors are there in each specialization?
select count(*),specialization from doctors
group by specialization;

# 11. How many beds does each hospital have?
select sum(bed_capacity) as B_cp,hospital_name  from Hospitals
group by hospital_name
having B_cp>300;

# 12. Show me only specializations that have more than 20 doctors
select specialization,count(doctor_id) as d_id from Doctors 
group by specialization
having d_id > 20;

# 13. Show me the top 5 specializations based on number of doctors
select specialization, count(doctor_id) as top_5 from Doctors
group by specialization
order by top_5 desc limit 5;

# 14. Give me each department along with the hospital it belongs to.
select Departments.department_name, Hospitals.hospital_name
from Departments
INNER JOIN Hospitals ON Departments.hospital_id=Hospitals.hospital_id;

# 15. How many doctors are associated with each hospital?
select count(Doctors.doctor_id) , Hospitals.hospital_id , Hospitals.hospital_name
from Doctors inner join Hospitals On Doctors.hospital_id = Hospitals.hospital_id 
group by Doctors.hospital_id;

# 16. Show only specializations having more than 20 doctors, ranked highest first.
select Hospitals.hospital_name,Departments.department_name 
from Hospitals 
left join Departments on Hospitals.hospital_id = Departments.hospital_id;

# 17. How many doctors does each hospital have ?
select Hospitals.hospital_name, count(Doctors.doctor_id)
from Hospitals 
left join Doctors on Hospitals.hospital_id = Doctors.hospital_id
group by Hospitals.hospital_id;

# 18. How many hospitals have more then 20 doctors
select Hospitals.hospital_name, count(Doctors.doctor_id)
from Hospitals 
left join Doctors on Hospitals.hospital_id = Doctors.hospital_id
group by Hospitals.hospital_id
having count(Doctors.doctor_id) > 20;

# 19. Which specialization has highest number of doctors
select specialization,count(doctor_id) as m
from Doctors
group by specialization 
order by m desc limit 5;

# 20. what is the avg consultation fee by specialization
select specialization, avg(consultation_fee) as m
from Doctors
group by specialization;

# 21. How many appointments does each doctor have ?
select doctor_id,count(appointment_id)
from Appointments 
group by doctor_id; 

# 22. Rank the consulatation fee from higher to lower 
select Doctors.first_name, Doctors.consultation_fee,specialization,row_number() 
over (order by Doctors.consultation_fee desc) as rnk
from Doctors;

# 23. Rank the consultation fee from higher to lower based on specialization
select Doctors.first_name, Doctors.consultation_fee,specialization,row_number() 
over (partition by specialization order by Doctors.consultation_fee desc) as rnk
from Doctors;

# 24. Rank the consultation fee from higher to lower based on specialization.Rank will use the same number for same numbers 
select Doctors.first_name, Doctors.consultation_fee,specialization,rank() 
over (partition by specialization order by Doctors.consultation_fee desc) as rnk
from Doctors;

# 25. Display the previous data 
select Doctors.first_name, Doctors.consultation_fee,specialization, lag(Doctors.consultation_fee) 
over (order by Doctors.consultation_fee desc) as rnk
from Doctors;

# 26. Display the data after this row
select Doctors.first_name, Doctors.consultation_fee,specialization, lead(Doctors.consultation_fee) 
over (order by Doctors.consultation_fee desc) as rnk
from Doctors;

# 27. Rank the data based on consultation fee by departments
select Departments.department_name , Doctors.first_name, Doctors.consultation_fee,row_number() 
over (partition by Departments.department_name order by Doctors.consultation_fee desc) as rnk
from Departments inner join Doctors
on Doctors.hospital_id = Departments.hospital_id;

# 28. Rank the data by consultation fee
select Departments.department_name, Doctors.first_name, Doctors.consultation_fee, row_number()
over (order by Doctors.consultation_fee desc) as rnk
from Departments inner join Doctors
on Doctors.hospital_id = Departments.hospital_id;

# 29. Top 5 hospital name based on number of doctors
select Hospitals.hospital_name,count(Doctors.doctor_id) as c_d
from Hospitals inner join Doctors on Hospitals.hospital_id = Doctors.hospital_id
Group by Hospitals.hospital_name
order by c_d desc limit 5;

# 30. Display hospital with most doctors
select Hospitals.hospital_name,count(Doctors.doctor_id) as c_d
from Hospitals inner join Doctors on Hospitals.hospital_id = Doctors.hospital_id
Group by Hospitals.hospital_name
order by c_d desc limit 1;

# 31. Which departments have the highest appointment workload?
SELECT d.department_name,COUNT(a.appointment_id) AS total_appointments
FROM Appointments a
JOIN Doctors dr
ON a.doctor_id = dr.doctor_id
JOIN Departments d
ON dr.department_id = d.department_id
GROUP BY d.department_id, d.department_name
ORDER BY total_appointments DESC;

# 32. Which hospitals have the highest number of admissions?
SELECT h.hospital_name, COUNT(ad.admission_id) AS total_admissions
FROM Admissions ad
JOIN Hospitals h
ON ad.hospital_id = h.hospital_id
GROUP BY h.hospital_id, h.hospital_name
ORDER BY total_admissions DESC;

#33. What are the admission type patterns?
SELECT admission_type,COUNT(*) AS total_admissions
FROM Admissions
GROUP BY admission_type
ORDER BY total_admissions DESC;

#34/ What are the admission status patterns?
SELECT admission_status,COUNT(*) AS total_admissions
FROM Admissions
GROUP BY admission_status
ORDER BY total_admissions DESC;

#35. What is the average patient length of stay?

SELECT
    ROUND(
        AVG(DATEDIFF(discharge_date, admission_date)),
        2
    ) AS average_length_of_stay_days
FROM Admissions
WHERE discharge_date IS NOT NULL
  AND discharge_date >= admission_date;
  
# 36. How are rooms distributed by type?
SELECT
    room_type,
    COUNT(room_id) AS total_rooms
FROM Rooms
GROUP BY room_type
ORDER BY total_rooms DESC;

# 37.  Which treatments have the highest activity?
SELECT
    treatment_name,
    COUNT(treatment_id) AS treatment_count
FROM Treatments
GROUP BY treatment_name
ORDER BY treatment_count DESC;

# 38. Which laboratory tests have the highest volume?
SELECT
    test_name,
    COUNT(lab_test_id) AS test_volume
FROM Laboratory
GROUP BY test_name
ORDER BY test_volume DESC;

# 39. Which medicine categories generate the highest sales?
SELECT
    m.category,
    SUM(p.quantity) AS total_quantity_sold,
    ROUND(SUM(p.total_price), 2) AS total_sales
FROM Pharmacy p
JOIN Medicines m
    ON p.medicine_id = m.medicine_id
GROUP BY m.category
ORDER BY total_sales DESC;

# 40. What is the total billed amount?
SELECT ROUND(SUM(total_amount), 2) AS total_billed_amount
FROM Billing;

# 41. Which billing components contribute the most?
SELECT
    ROUND(SUM(room_charges), 2) AS room_charges,
    ROUND(SUM(doctor_charges), 2) AS doctor_charges,
    ROUND(SUM(medicine_charges), 2) AS medicine_charges,
    ROUND(SUM(lab_charges), 2) AS lab_charges,
    ROUND(SUM(other_charges), 2) AS other_charges,
    ROUND(SUM(total_amount), 2) AS total_billed
FROM Billing;

# 42. What is the total payment collected?
SELECT
    ROUND(SUM(payment_amount), 2) AS total_payment_collected
FROM Payments
WHERE payment_status = 'Success';

# 43. What is the gap between billed and collected amounts?
SELECT SUM(b.total_amount) - SUM(p.payment_amount)
FROM Billing b
JOIN Payments p ON b.bill_id = p.bill_id;