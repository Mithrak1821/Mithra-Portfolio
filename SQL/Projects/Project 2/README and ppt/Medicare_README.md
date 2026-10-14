# Medicare Healthcare Database Analysis

## Business Problem

### How can Medicare improve hospital capacity planning, patient care delivery and revenue collection by understanding doctor availability, patient admissions and billing performance?

Medicare is a multi-hospital healthcare network, and every patient journey, from appointment and admission to treatment, billing and payment, creates data that is not yet answering key questions. It is unclear which hospitals and specializations carry the most doctors and appointments, how admissions are distributed, and how billed revenue splits across room, doctor, medicine, laboratory and other charges. It is also unclear how much of the billed amount is actually collected. Data quality issues such as inconsistent gender values, malformed emails and missing department, admission and insurance details make reporting less reliable. This SQL project cleans the data and analyzes capacity, admissions and billing performance to help Medicare plan resources and manage revenue.

### Business Objective

**Understand hospital capacity, doctor distribution, patient admissions and billing performance to support better healthcare operations planning and revenue management.**

### Solution

Medicare can use the analysis to:

1. **Improve data quality and reporting trust**
   - Identify inconsistent, missing and malformed values in doctors, patients, employees, admissions, treatments, insurance and billing.
   - Standardize gender values and correct malformed email addresses.
   - Remove leading spaces from patient names.
   - Flag records with missing head doctors, department IDs, admission IDs, discharge dates and insurance providers for follow-up.

2. **Understand the hospital network and its capacity**
   - Count hospitals, departments, doctors and total bed capacity.
   - Identify the hospital with the highest bed capacity and the hospitals with more than 300 beds.
   - Map every department to the hospital it belongs to.
   - Review how rooms are distributed by room type.

3. **Optimize doctor and specialization capacity**
   - Identify the number of doctors in each specialization and the top 5 specializations.
   - Find specializations with more than 20 doctors and doctors with more than 10 years of experience.
   - Identify the top hospitals by number of doctors and the hospitals with more than 20 doctors.
   - Compare average consultation fees by specialization and rank doctors by consultation fee.

4. **Strengthen patient care and admission management**
   - Measure appointment workload per doctor and per department.
   - Identify the hospitals with the highest number of admissions.
   - Analyze admission type and admission status patterns.
   - Calculate the average patient length of stay.

5. **Improve clinical services**
   - Identify the treatments with the highest activity.
   - Identify the laboratory tests with the highest volume.
   - Identify the medicine categories with the highest quantity sold and sales value.

6. **Strengthen revenue, billing and payment management**
   - Monitor the total billed amount.
   - Separate room, doctor, medicine, laboratory and other charges.
   - Track the total payment collected.
   - Measure the gap between the billed and collected amounts.

---

## Dataset / Database Structure

The Medicare project uses a relational healthcare database containing information about hospitals, departments, doctors, patients, rooms, appointments, admissions, treatments, insurance, pharmacy, laboratory, employees, billing and payments.

### Main Tables

| Table | Purpose |
|---|---|
| `Hospitals` | Hospital name, type, city, state, region, bed capacity and established year |
| `Departments` | Department name, floor number, hospital and head doctor details |
| `Doctors` | Doctor details, specialization, qualification, experience and consultation fees |
| `Patients` | Patient demographic, city, state, blood group and registration details |
| `Rooms` | Room type, floor number, daily charge and room status by hospital |
| `Appointments` | Appointment date, time, status and reason for visit |
| `Admissions` | Admission and discharge dates, admission type and admission status |
| `Treatments` | Treatment name, date, cost and status |
| `Insurance` | Insurance provider, policy number, coverage amount and claim status |
| `Medicines` | Medicine name, category, manufacturer, unit price and stock quantity |
| `Pharmacy` | Medicine sales quantity, sale date and total price |
| `Laboratory` | Lab test names, results, costs and status |
| `Employees` | Employee designation, employment type, salary and department |
| `Billing` | Room, doctor, medicine, laboratory and other charges with total billed amount |
| `Payments` | Payment amounts, modes and status against bills |

The database is analyzed using SQL queries to understand hospital operations and financial performance.

---

## SQL Analysis

The SQL analysis focuses on the following business areas:

### Hospital and Department Analysis
- Count total hospitals, departments and doctors.
- List the unique hospital names.
- Calculate total bed capacity and identify the highest hospital bed capacity.
- Identify hospitals with more than 300 beds.
- Display each department along with the hospital it belongs to.

### Doctor and Specialization Analysis
- Count doctors by specialization.
- Identify specializations with more than 20 doctors.
- Identify the top 5 specializations by number of doctors.
- Count doctors with more than 10 years of experience.
- Calculate the average and lowest consultation fee.
- Calculate the average consultation fee by specialization.

### Hospital Doctor Distribution Analysis
- Count doctors associated with each hospital.
- Identify hospitals with more than 20 doctors.
- Identify the top 5 hospitals by number of doctors.
- Display the hospital with the most doctors.
- Use `LEFT JOIN` to include hospitals with no matching departments or doctors.

### Ranking and Window Function Analysis
- Rank doctors by consultation fee overall using `ROW_NUMBER()`.
- Rank doctors by consultation fee within each specialization.
- Use `RANK()` to give the same rank to equal consultation fees.
- Use `LAG()` and `LEAD()` to compare the previous and next consultation fee.
- Rank doctors by consultation fee with their department names.

### Appointment and Admission Analysis
- Count appointments for each doctor.
- Identify the departments with the highest appointment workload.
- Identify the hospitals with the highest number of admissions.
- Analyze admission type and admission status patterns.
- Calculate the average patient length of stay.

### Clinical Services Analysis
- Analyze room distribution by room type.
- Identify the treatments with the highest activity.
- Identify the laboratory tests with the highest volume.
- Identify the medicine categories generating the highest quantity sold and sales value.

### Billing and Payments Analysis
- Calculate the total billed amount.
- Analyze room, doctor, medicine, laboratory and other charges.
- Calculate the total payment collected from successful payments.
- Calculate the gap between the billed and collected amounts.

---

## Tools & Technologies

The project was developed using **MySQL** and SQL-based analytical techniques.

### Technologies
- MySQL
- SQL
- Relational Database Management System

### SQL Techniques
- `CREATE DATABASE` / `CREATE TABLE`
- `PRIMARY KEY` and `FOREIGN KEY` constraints
- `INSERT INTO`
- `ALTER TABLE`
- `SHOW TABLES`, `DESCRIBE` and `SHOW CREATE TABLE`
- `SELECT`
- `DISTINCT`
- `WHERE`
- `LIKE`, `REGEXP` and `IS NULL`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- Aggregate Functions
- `COUNT()`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `ROUND()`
- Date Function: `DATEDIFF()`
- `INNER JOIN`
- `LEFT JOIN`
- Multi-table Joins
- `CASE` expressions
- Subqueries
- String Functions: `LOWER()`, `TRIM()`, `LTRIM()`, `REPLACE()`, `CONCAT()`
- `UPDATE`
- Window Functions
- `ROW_NUMBER()`
- `RANK()`
- `LAG()`
- `LEAD()`

---

## Data Profiling / Preparation

Before performing the analysis, the Medicare tables were profiled to identify data quality issues, and the key issues were cleaned.

The analysis included:

- Counting the records in every table.
- Identifying blank `head_doctor_id` values in `Departments`.
- Reviewing distinct values of categorical fields such as gender in `Doctors`, `Patients` and `Employees`.
- Identifying blank `department_id` and blank email values in `Doctors`.
- Checking email formats in `Doctors` and `Patients` using `REGEXP` and `LIKE`.
- Identifying leading spaces in `first_name` in `Patients`.
- Identifying blank email values in `Patients`.
- Identifying blank `department_id` and blank `discharge_date` values in `Admissions`.
- Identifying blank `admission_id` values in `Treatments`.
- Identifying blank `insurance_provider` values in `Insurance`.
- Identifying blank `department_id` values in `Employees`.
- Identifying blank `admission_id` and `appointment_id` values in `Billing`.
- Standardizing gender values to `Male` and `Female` using `CASE`, `LOWER()` and `TRIM()`.
- Correcting malformed email addresses using `CASE` and `REPLACE()`.
- Removing leading spaces from patient first names using `LTRIM()`.

The SQL queries were then used to transform the relational data into analysis-ready results.

---

## Key Metrics / Analysis Areas

The project evaluates several important healthcare metrics:

### Total Hospitals
Measures the size of the Medicare hospital network.

### Total Departments
Measures the number of departments available across hospitals.

### Total Doctors
Measures the doctor capacity available.

### Total Bed Capacity
Measures the total bed capacity across all hospitals.

### Average Consultation Fee
Provides an indication of the typical doctor consultation fee.

### Doctors by Specialization and Hospital
Identifies where doctor capacity is concentrated.

### Appointment Workload
Shows which doctors and departments handle the highest number of appointments.

### Admissions
Measures admission volume by hospital, admission type and admission status.

### Average Length of Stay
Shows how long patients stay in the hospital on average.

### Clinical Service Volume
Identifies the most frequent treatments and laboratory tests and the highest-selling medicine categories.

### Total Billed Amount
Measures the overall revenue billed.

### Billing Components
Separates room, doctor, medicine, laboratory and other charges.

### Payment Collected and Collection Gap
Shows how much of the billed amount has been collected and how much remains outstanding.

---

## Key Insights

Based on the SQL analysis:

### 1. Data quality issues needed correction before reporting

Inconsistent gender values, malformed emails and leading spaces in patient names were standardized. Missing head doctors, department IDs, admission IDs, discharge dates and insurance providers were identified as gaps that can affect staffing, admission, treatment and billing reporting.

### 2. Hospital capacity varies across the network

The analysis of hospitals, departments and bed capacity shows how capacity is distributed and which hospitals have the largest bed capacity.

### 3. Doctor availability is concentrated in specific specializations and hospitals

The specialization counts and the hospital-wise doctor counts show where doctor capacity is concentrated and which specializations and hospitals have the strongest doctor availability.

### 4. Consultation fees vary across doctors and specializations

Average fee by specialization, overall and within-specialization fee rankings, together with `LAG()` and `LEAD()` comparisons, highlight differences in consultation pricing.

### 5. Appointment workload is uneven across doctors and departments

Appointment counts per doctor and per department show where workload is highest and where capacity may be under pressure.

### 6. Admission patterns show how hospitals are used

Admissions by hospital, admission type and admission status, together with the average length of stay, show how patients use inpatient care and how long beds are occupied.

### 7. Treatments, laboratory tests and medicines show clinical service demand

The most frequent treatments, the laboratory tests with the highest volume and the medicine categories with the highest sales indicate where clinical demand is concentrated.

### 8. Revenue comes from multiple healthcare services

The billing analysis separates room, doctor, medicine, laboratory and other charges, allowing Medicare to understand how each component contributes to the total billed amount.

### 9. Billed and collected amounts reveal a collection gap

Comparing the total billed amount with the payments collected highlights outstanding amounts that need financial follow-up.

---

## Recommendations / Conclusion

### Recommendations

Based on the analysis, Medicare should:

- Fix the data quality gaps at source, with mandatory department, admission and appointment IDs for billing and treatments, and validation for email, gender and insurance provider at entry.
- Review hospitals and departments with high appointment workload and admission volume for staffing and bed planning.
- Balance doctor availability across hospitals and specializations, and review specializations with fewer doctors.
- Monitor consultation fee variation across and within specializations.
- Use admission type, admission status and length of stay patterns to improve bed and room planning.
- Plan treatment, laboratory and pharmacy capacity around the most common treatments, tests and medicine categories.
- Track room, doctor, medicine, laboratory and other charges separately to understand where revenue comes from.
- Monitor the gap between billed and collected amounts to improve collections and reduce outstanding payments.

### Conclusion

The Medicare SQL analysis provides a structured view of data quality, hospital capacity, doctor distribution, patient appointments and admissions, clinical services, billing and payments.

The analysis helps Medicare move beyond basic reporting by connecting **data quality → hospital capacity → doctor distribution → appointments and admissions → clinical services → billing and payments → revenue collection**.

This provides a foundation for data-driven decisions related to hospital capacity planning, doctor allocation, service delivery and revenue management.

---

## Project Outcome

This project demonstrates practical skills in:

- Relational database design (tables, primary keys, foreign keys)
- Data insertion and database setup in MySQL
- Data profiling
- Data cleaning and standardization
- KPI definition
- Data aggregation
- Multi-table joins
- Grouping and filtering
- Window functions
- Ranking analysis
- Healthcare data analysis
- Admission, billing and payment analysis
- Business insight generation
- Data-driven recommendations

The final output is a SQL-based **Medicare Healthcare Database Analysis** designed to convert relational healthcare data into clean, meaningful operational and financial insights and support data-driven healthcare decisions.
