#=======================================================================================================================================
#Data analysis
#================================================================================================================================================

#1. What is the total number of members, and how are they distributed across membership types and gender?
select membership_type,gender,count(*)
from Members
group by membership_type,gender
order by count(member_id) desc;

#2.Which cities have the highest number of members?
SELECT city,COUNT(*) AS total_members
FROM Members
GROUP BY city
ORDER BY total_members DESC;

#3. What is the total revenue generated, average bill value, and contribution of consultation, laboratory and medicine charges?
SELECT
COUNT(*) AS total_bills,
ROUND(SUM(total_amount), 2) AS total_revenue,
ROUND(AVG(total_amount), 2) AS average_bill_value,
ROUND(SUM(consultation_charges), 2) AS consultation_revenue,
ROUND(SUM(lab_charges), 2) AS lab_revenue,
ROUND(SUM(medicine_charges), 2) AS medicine_revenue
FROM Billing;

# 4. How many specialists are there?
SELECT COUNT(*) AS Total_no_of_Specialists
FROM Specialists;

# 5. What is the total revenue generated from billing?
SELECT SUM(total_amount) AS Total_Revenue
FROM Billing;

#6. What is the highest and lowest billing amount?
SELECT 
MAX(total_amount) AS Highest_Bill,
MIN(total_amount) AS Lowest_Bill
FROM Billing;

#7. How many members are there in each membership type?
SELECT membership_type,COUNT(member_id) AS Total_Members
FROM Members
GROUP BY membership_type;

#8. How many consultations are there for each consultation mode?
SELECT consultation_mode,COUNT(consultation_id) AS Total_Consultations
FROM Consultations
GROUP BY consultation_mode;

#9. How many consultations are there for each consultation status?
SELECT status,COUNT(consultation_id) AS Total_Consultations
FROM Consultations
GROUP BY status;

#10. Which specializations have more than 100 consultations?
SELECT s.specialization,COUNT(c.consultation_id) AS Total_Consultations
FROM Specialists s
INNER JOIN Consultations c
ON s.specialist_id = c.specialist_id
GROUP BY s.specialization
HAVING COUNT(c.consultation_id) > 100
ORDER BY Total_Consultations DESC;

#11. Which are the top 5 clinics based on number of consultations?
SELECT cl.clinic_name, COUNT(c.consultation_id) AS Total_Consultations
FROM Clinics cl
INNER JOIN Consultations c ON cl.clinic_id = c.clinic_id
GROUP BY cl.clinic_name
ORDER BY Total_Consultations DESC
LIMIT 5;

#12. Rank specialists based on consultation fee from highest to lowest.
SELECT first_name,last_name,specialization,consultation_fee,
ROW_NUMBER() OVER (ORDER BY consultation_fee DESC) AS rnk
FROM Specialists;

#13. Rank specialists based on consultation fee within each specialization.
SELECT first_name,last_name,specialization,consultation_fee,
ROW_NUMBER() OVER (PARTITION BY specialization ORDER BY consultation_fee DESC) AS rnk
FROM Specialists;

#14. Display the previous consultation fee for each specialist.
SELECT first_name,last_name,specialization,consultation_fee,
LAG(consultation_fee) OVER (ORDER BY consultation_fee DESC) 
FROM Specialists;

# 15. Display the next consultation fee for each specialist.
SELECT first_name,last_name,specialization,consultation_fee,
LEAD(consultation_fee) OVER (ORDER BY consultation_fee DESC) 
FROM Specialists;

# 16. What is the total number of members
SELECT COUNT(*) AS Total_Members
FROM Members;

#17. What is the average bill value
SELECT ROUND(AVG(total_amount), 2) AS Average_Bill_Value
FROM Billing;

#18. How many consultations are there?
SELECT COUNT(*) AS Total_Consultations
FROM Consultations;

#19. How many consultations does each member have on average?
SELECT 
    ROUND(COUNT(c.consultation_id) / COUNT(DISTINCT m.member_id), 2)
        AS avg_consultations_per_member
FROM Members m
LEFT JOIN Consultations c
    ON m.member_id = c.member_id;
    
#20. Which reasons for visit are most common?
SELECT 
    reason_for_visit,
    COUNT(*) AS consultation_count
FROM Consultations
GROUP BY reason_for_visit
ORDER BY consultation_count DESC;

# 21. How many consultations have associated telemedicine sessions?
SELECT 
    COUNT(DISTINCT t.consultation_id) AS consultations_with_telemedicine
FROM Telemedicine_Sessions t;

#22. Which chronic conditions have the highest enrollment?
SELECT 
    condition_name,
    COUNT(*) AS program_count
FROM Chronic_Care_Programs
GROUP BY condition_name
ORDER BY program_count DESC;

#23. What is the payment-status distribution of package subscriptions?
SELECT 
    payment_status,
    COUNT(*) AS subscription_count
FROM Package_Subscriptions
GROUP BY payment_status
ORDER BY subscription_count DESC;

#24. Which industries have the greatest corporate participation?
SELECT 
    co.industry,
    COUNT(DISTINCT co.corporate_id) AS corporate_count,
    COUNT(cm.member_id) AS enrolled_members
FROM Corporates co
LEFT JOIN Corporate_Members cm
    ON co.corporate_id = cm.corporate_id
GROUP BY co.industry
ORDER BY enrolled_members DESC;

#25. Which medicines are prescribed most frequently?
SELECT 
    medicine_name,
    COUNT(*) AS prescription_count
FROM Prescriptions
GROUP BY medicine_name
ORDER BY prescription_count DESC
LIMIT 10;

#26. Which lab tests generate the highest total cost?
SELECT 
    test_name,
    COUNT(*) AS test_count,
    ROUND(SUM(test_cost), 2) AS total_test_cost
FROM Lab_Tests
GROUP BY test_name
ORDER BY total_test_cost DESC;

#27. What is the total and average claim amount?
SELECT
    COUNT(*) AS total_claims,
    ROUND(SUM(claim_amount), 2) AS total_claim_amount,
    ROUND(AVG(claim_amount), 2) AS average_claim_amount
FROM Claims;

#28. What is the total payment amount by payment status?
SELECT 
    payment_status,
    COUNT(*) AS payment_count,
    ROUND(SUM(payment_amount), 2) AS total_payment_amount
FROM Payments
GROUP BY payment_status
ORDER BY total_payment_amount DESC;

#21. What is the average consultation rating?
SELECT 
    ROUND(AVG(rating), 2) AS average_rating
FROM Feedback;

#22.How many staff members work in each clinic?
SELECT 
    cl.clinic_name,
    COUNT(s.staff_id) AS staff_count
FROM Clinics cl
LEFT JOIN Staff s
    ON cl.clinic_id = s.clinic_id
GROUP BY cl.clinic_name
ORDER BY staff_count DESC;