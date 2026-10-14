#1. What is the total revenue generated
SELECT SUM(total_amount) AS Total_Revenue
FROM Billing;

# 2. How many specialists are there?
SELECT COUNT(*) AS Total_no_of_Specialists
FROM Specialists;

# 3. What is the total number of members
SELECT COUNT(*) AS Total_Members
FROM Members;

# 4. What is the average bill value
SELECT ROUND(AVG(total_amount), 2) AS Average_Bill_Value
FROM Billing;

#5. How many consultations are there?
SELECT COUNT(*) AS Total_Consultations
FROM Consultations;