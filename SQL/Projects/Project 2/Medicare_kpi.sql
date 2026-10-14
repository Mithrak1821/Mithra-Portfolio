#=====================================================================================================================
#KPI
#======================================================================================================================
# 1. How many hospitals are there in medicare
SELECT Count(*) as Total_no_of_Hospitals From Hospitals;

# 2. How many Departments are there in medicare
SELECT Count(*) as Total_no_of_Department From Departments;

# 3. How many Doctors are there in medicare
SELECT Count(*) as Total_no_of_Doctors From Doctors;

# 4. Total number of bed capacity in all hospitals
SELECT sum(bed_capacity) from Hospitals; 

# 5. Average consultation fee 
SELECT round(AVG(consultation_fee),2) from Doctors;