# HealthPlus Healthcare Database Analysis

## Business Problem

### How can HealthPlus improve healthcare utilization and revenue by understanding member demand, consultation activity and billing performance?

HealthPlus is a healthcare provider that serves members through a network of clinics and specialists. Every member visit creates data, from registration to consultation to billing, but this data is not yet being used to answer key business questions. It is unclear which cities and membership types drive the most demand, which clinics and specializations handle the highest consultation volumes, and how revenue splits across consultation, laboratory and medicine charges. Data quality issues such as inconsistent gender values and malformed emails also make reporting less reliable. This SQL project cleans the data and analyzes member demand, consultation activity and billing performance to help HealthPlus plan clinic and specialist capacity and manage revenue more effectively.

### Business Objective

**Understand member demand, consultation activity and billing performance to support better healthcare service planning and revenue management.**

### Solution

HealthPlus can use the analysis to:

1. **Improve data quality and reporting trust**
   - Identify inconsistent, missing and malformed values in members, claims, billing and payments.
   - Standardize gender values and correct malformed email addresses.
   - Flag records with missing consultation links, insurance providers and payment modes for follow-up.

2. **Understand member demand**
   - Identify cities and membership types with the highest member concentration.
   - Analyze the distribution of members by gender and membership type.
   - Measure average consultations per member.

3. **Optimize clinic and specialist capacity**
   - Identify the top clinics by consultation volume.
   - Find specializations handling more than 100 consultations.
   - Rank specialists by consultation fee overall and within each specialization.
   - Understand staff distribution across clinics.

4. **Strengthen service delivery**
   - Analyze consultation modes, statuses and the most common reasons for visit.
   - Measure how many consultations have telemedicine sessions.
   - Track chronic-condition enrollment in chronic care programs.
   - Identify the most prescribed medicines and the lab tests with the highest total cost.

5. **Grow packages and corporate partnerships**
   - Review the payment-status distribution of health package subscriptions.
   - Identify industries with the strongest corporate participation and enrolled members.

6. **Strengthen revenue, claims and payment management**
   - Monitor total revenue, average bill value, and highest and lowest bills.
   - Separate consultation, laboratory and medicine revenue.
   - Track total and average insurance claim amounts.
   - Analyze payment amounts by payment status.

7. **Improve member experience**
   - Monitor the average consultation rating from member feedback.

---

## Dataset / Database Structure

The HealthPlus project uses a relational healthcare database containing information about members, clinics, specialists, consultations, billing, claims, payments and related healthcare services.

### Main Tables

| Table | Purpose |
|---|---|
| `Clinics` | Clinic name, type, city and state details |
| `Specialists` | Specialist details, specialization, experience and consultation fees |
| `Members` | Member demographic, city and membership information |
| `Corporates` | Corporate partner and industry information |
| `Corporate_Members` | Members enrolled through corporate partners |
| `Consultations` | Consultation records, consultation mode, status and reason for visit |
| `Telemedicine_Sessions` | Telemedicine platform, connection quality and session status |
| `Chronic_Care_Programs` | Chronic condition enrollment and program status |
| `Health_Packages` | Health package type, price and validity |
| `Package_Subscriptions` | Member package subscriptions and payment status |
| `Prescriptions` | Medicines prescribed, dosage and duration |
| `Lab_Tests` | Lab test names, results, costs and status |
| `Claims` | Insurance claim amounts, status and providers |
| `Staff` | Clinic staff designation, employment type and salary |
| `Billing` | Consultation, laboratory and medicine charges used to analyze revenue |
| `Payments` | Payment amounts, modes and status against bills |
| `Feedback` | Member ratings and feedback for consultations |

The database is analyzed using SQL queries to understand healthcare utilization and financial performance.

---

## SQL Analysis

The SQL analysis focuses on the following business areas:

### Member Analysis
- Count total members.
- Analyze members by membership type and gender.
- Analyze member distribution by city.
- Calculate average consultations per member.

### Consultation Analysis
- Count total consultations.
- Count consultations by mode and by status.
- Identify the most common reasons for visit.
- Identify specializations with more than 100 consultations.
- Identify the top 5 clinics by consultation volume.
- Count consultations with associated telemedicine sessions.

### Specialist and Clinic Analysis
- Count specialists.
- Rank specialists by consultation fee.
- Rank specialists by consultation fee within each specialization.
- Use `LAG()` and `LEAD()` to compare the previous and next consultation fee.
- Count staff members per clinic.

### Clinical Services Analysis
- Identify the chronic conditions with the highest program enrollment.
- Identify the most frequently prescribed medicines.
- Identify the lab tests generating the highest total cost.

### Packages and Corporate Analysis
- Analyze the payment-status distribution of package subscriptions.
- Identify industries with the highest corporate participation and enrolled members.

### Billing, Claims and Payments Analysis
- Calculate total revenue and average bill value.
- Identify the highest and lowest billing amounts.
- Analyze consultation, laboratory and medicine revenue.
- Calculate total and average claim amounts.
- Analyze payment count and amount by payment status.

### Feedback Analysis
- Calculate the average consultation rating.

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
- `SELECT`
- `DISTINCT`
- `WHERE`
- `LIKE` and `IS NULL`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `LIMIT`
- Aggregate Functions
- `COUNT()` and `COUNT(DISTINCT)`
- `SUM()`
- `AVG()`
- `MIN()`
- `MAX()`
- `ROUND()`
- `INNER JOIN`
- `LEFT JOIN`
- `CASE` expressions
- String Functions: `LOWER()`, `TRIM()`, `REPLACE()`
- `UPDATE`
- Window Functions
- `ROW_NUMBER()`
- `LAG()`
- `LEAD()`

---

## Data Profiling / Preparation

Before performing the analysis, the HealthPlus tables were profiled to identify data quality issues, and the key issues were cleaned.

The analysis included:

- Reviewing distinct values of categorical fields such as gender in `Members`.
- Identifying blank email values and emails in invalid formats in `Members`.
- Identifying blank `consultation_id` values in `Claims` and `Billing`.
- Identifying blank `insurance_provider` values in `Claims`.
- Identifying blank `payment_mode` values in `Payments`.
- Standardizing gender values to `Male` and `Female` using `CASE`, `LOWER()` and `TRIM()`.
- Correcting malformed email addresses using `CASE` and `REPLACE()`.

The SQL queries were then used to transform the relational data into analysis-ready results.

---

## Key Metrics / Analysis Areas

The project evaluates several important healthcare metrics:

### Total Members
Measures the size of the HealthPlus member base.

### Total Consultations
Measures overall consultation activity across the network.

### Total Specialists
Measures the specialist capacity available.

### Total Revenue
Measures the overall billing revenue generated.

### Average Bill Value
Provides an indication of the average value of a billing transaction.

### Service Revenue
Separates revenue contributions from consultation, laboratory and medicine services.

### Consultations per Member
Shows how actively members use consultation services.

### Clinic and Specialization Volume
Identifies where consultation demand is concentrated.

### Consultation Fee
Supports comparison of specialist fees across and within specializations.

### Claim Amount
Measures total and average insurance claim value.

### Payment Status Distribution
Shows how much payment value is in each payment status.

### Average Consultation Rating
Provides an indicator of member satisfaction.

---

## Key Insights

Based on the SQL analysis:

### 1. Data quality issues needed correction before reporting

Inconsistent gender values and malformed emails were standardized. Missing consultation links in claims and billing, missing insurance providers and missing payment modes were identified as gaps that can affect revenue, claims and payment reporting.

### 2. Member demand varies by city, membership type and gender

The analysis identifies the cities and membership types with higher member concentration, providing a basis for service planning and targeted member engagement.

### 3. Consultation demand is concentrated in specific clinics and specializations

The top 5 clinics and the specializations with more than 100 consultations show where healthcare demand and specialist workload are concentrated.

### 4. Consultation channels and reasons for visit show how members use services

Consultation mode, status, reason for visit and telemedicine session counts show how members access care and how many consultations are supported by virtual sessions.

### 5. Specialist consultation fees vary

Overall and within-specialization fee rankings, together with `LAG()` and `LEAD()` comparisons, highlight differences in consultation pricing.

### 6. Revenue comes from multiple healthcare services

The billing analysis separates consultation, laboratory and medicine revenue, allowing HealthPlus to understand how each service contributes to total revenue and average bill value.

### 7. Prescriptions, lab tests and chronic care show clinical service demand

The most prescribed medicines, the lab tests with the highest total cost and the chronic conditions with the highest enrollment indicate where clinical demand and cost are concentrated.

### 8. Corporate and package segments offer growth opportunities

Industry-level corporate participation and package subscription payment status show which partnerships are driving enrollment and where payment follow-up may be needed.

### 9. Claims and payments reveal financial follow-up areas

Total and average claim amounts, together with the payment amount by payment status, help HealthPlus monitor insurance activity and collections.

### 10. Feedback provides a member-experience indicator

The average consultation rating gives a baseline for tracking service quality over time.

---

## Recommendations / Conclusion

### Recommendations

Based on the analysis, HealthPlus should:

- Fix the data quality gaps at source, with mandatory consultation IDs for billing and claims, and validation for email, insurance provider and payment mode at entry.
- Focus service capacity and engagement on cities and membership segments with higher member concentration.
- Review high-volume clinics and specializations for staffing and specialist availability.
- Monitor specialist consultation-fee variation across and within specializations.
- Use consultation mode, status and reason-for-visit patterns to improve service delivery and expand telemedicine where it suits member demand.
- Plan chronic care, pharmacy and laboratory capacity around the most common conditions, medicines and tests.
- Strengthen corporate partnerships in high-participation industries and follow up on pending package payments.
- Track consultation, laboratory and medicine revenue separately, and monitor average bill value together with total revenue.
- Monitor claim amounts and payment-status distribution to improve collections and reduce outstanding payments.
- Track consultation ratings regularly and link low ratings to clinics and specialists for service improvement.

### Conclusion

The HealthPlus SQL analysis provides a structured view of data quality, member demand, consultation utilization, clinic and specialist capacity, clinical services, corporate and package activity, claims, payments and revenue performance.

The analysis helps HealthPlus move beyond basic reporting by connecting **data quality → member demand → consultation activity → clinic and specialist capacity → clinical services → billing and payments → member satisfaction**.

This provides a foundation for data-driven decisions related to healthcare service planning, specialist allocation, revenue management and member experience.

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
- Revenue, claims and payment analysis
- Business insight generation
- Data-driven recommendations

The final output is a SQL-based **HealthPlus Healthcare Database Analysis** designed to convert relational healthcare data into clean, meaningful operational and financial insights and support data-driven healthcare decisions.
