# FreshMart COO Business Performance Dashboard

## Business Problem

FreshMart management does not have a single consolidated view of
business performance and therefore cannot easily determine which stores,
products, customer segments, and sales channels are driving profitable
growth and which areas require management attention.

The dashboard addresses this problem by bringing cleaned transaction
data into one interactive Microsoft Excel view covering overall
performance, trends, store performance, product performance, customer
membership, and returns.

### Business Objective

Develop an Excel-based management dashboard that enables FreshMart to:

-   Monitor overall sales, profit, profitability, transaction volume,
    units and returns.
-   Compare performance across stores, products, customer membership and
    sales channels.
-   Identify major sales and profit contributors.
-   Monitor monthly sales and profit movement.
-   Provide interactive filtering for management review.
-   Support data-driven areas for further investigation and action.

### Business Questions

The dashboard and supporting analysis are designed to answer the
following questions:

1.  **What are FreshMart's overall sales, profit, profit margin,
    transactions and units sold?**
2.  **How are sales and profit trending over time?**
3.  **Which stores are driving sales and profit?**
4.  **Which products are driving sales and profit?**
5.  **How do customer memberships contribute to sales and profit?**
6.  **What is the return status of transactions?**
7.  **How do sales channels contribute to overall sales and profit?**
8.  **Which areas require further management attention based on the
    available data?**

------------------------------------------------------------------------

## Dataset / Source Details

The project uses the provided **FreshMart sales transaction workbook**
in Microsoft Excel.

### Workbook Structure

  -----------------------------------------------------------------------
  Sheet                               Purpose
  ----------------------------------- -----------------------------------
  `Sales_Transactions`                Cleaned transaction-level source
                                      data used for analysis

  `sales`                             Consolidated transaction data with
                                      product, store, customer, employee
                                      and year attributes

  `Stores`                            Store details including region,
                                      city, store type, monthly target
                                      and status

  `Products`                          Product, category, subcategory,
                                      brand, price and supplier details

  `customers`                         Customer details including
                                      membership information

  `Employees`                         Employee and store-assignment
                                      information

  `Suppliers`                         Supplier reference information

  `PVT_executive`                     Executive KPI calculations

  `PVT_Analysis`                      Supporting PivotTable analysis for
                                      trends, stores, products,
                                      membership, channels and returns

 
  -----------------------------------------------------------------------

The cleaned transaction data contains **2,500 transaction records**. The
`Sales_Transactions` sheet contains **18 transaction-level analytical
columns**, while the consolidated `sales` sheet contains additional
descriptive fields brought in from the related product, store, customer
and employee data.

Key analytical fields include transaction date, customer, product,
store, employee, quantity, unit price, discount, sales amount, cost,
profit, payment mode, return status, sales channel, order time and day
type.

------------------------------------------------------------------------

## Dashboard

The final dashboard is designed from a **COO / management perspective**
with a single consolidated view.

It contains:

-   Executive KPI cards
-   Five interactive slicers
-   Five business-question-driven charts
-   A compact one-page management layout

![FreshMart COO Dashboard](Dashboard/FreshMart_Dashboard.png)

### Dashboard Filters

The dashboard provides interactive slicers for:

-   **Year**
-   **Month**
-   **Store Region**
-   **Product Category**
-   **Sales Channel**

These filters allow management to review performance from different
business perspectives.

------------------------------------------------------------------------

## Tools / Excel Techniques Used

The project was developed using **Microsoft Excel** and the following
techniques:

-   Excel Tables
-   Power Query
-   Data cleaning and consolidation
-   Data type validation and standardization
-   Data-model relationships
-   PivotTables
-   PivotCharts
-   Calculated fields
-   Slicers
-   KPI cards
-   Sales and profit aggregation
-   Monthly trend analysis
-   Store performance analysis
-   Product performance analysis
-   Customer membership analysis
-   Sales-channel analysis
-   Return analysis
-   Interactive dashboard design

------------------------------------------------------------------------

## Data Cleaning / Preparation

The data was prepared before dashboard development to create a
consistent analysis source.

### Preparation Performed

1.  **Data consolidation**
    -   Transaction data was combined with relevant product, store,
        customer and employee attributes using common identifiers.
2.  **Data standardization**
    -   Fields used for analysis were checked for appropriate text,
        numeric and date formats.
    -   Business categories and descriptive fields were standardized
        where required.
3.  **Data validation**
    -   Sales Amount, Cost Amount, Profit and Quantity were reviewed as
        numerical measures.
    -   Transaction Date was prepared for time-based analysis.
    -   Return Status and Sales Channel were reviewed for categorical
        analysis.
4.  **Relationship preparation**
    -   Common identifiers such as Customer ID, Product ID, Store ID and
        Employee ID were used to connect related datasets.
5.  **Analysis preparation**
    -   PivotTables were created for executive KPIs, monthly trends,
        store performance, product performance, customer membership,
        channel performance and return analysis.

The prepared transaction data was then used as the source for the final
dashboard and supporting analysis.

------------------------------------------------------------------------

## KPIs / Features Explained

The dashboard contains six executive KPI cards.

### Total Sales

**₹28,68,432.60**

Represents the total Sales Amount across the 2,500 transaction records
analyzed.

### Total Profit

**₹7,37,358.89**

Represents the total recorded profit after the recorded cost amount.

### Profit Margin

**25.7%**

Calculated as Profit divided by Sales Amount.

### Transactions

**2,500**

Represents the count of Invoice Number records included in the analysis.
Invoice-number uniqueness should be validated before interpreting this
as a distinct-order count.

### Total Units

**9,823**

Represents the total quantity sold across the analyzed transaction
records.

### Return Rate

**4.6%**

Calculated as returned transaction records divided by total transaction
records:

**114 / 2,500 = 4.56%**, rounded to **4.6%**.

------------------------------------------------------------------------

## Dashboard Features

The dashboard uses business questions instead of generic chart headings
so that each visualization directly supports a management question.

### How are Sales and Profit Trending Over Time?

A monthly combination chart compares Sales Amount and Profit from the
available transaction period.

**Business use:**

-   Monitor monthly sales movement.
-   Compare sales movement with profit movement.
-   Identify stronger and weaker periods for further investigation.

The highest full month in the available data is **October 2025**, with
approximately **₹4.45 lakh in sales** and **₹1.15 lakh in profit**.

### Which Stores Are Driving Sales and Profit?

A Top 5 store comparison displays Sales Amount and Profit for the
highest-sales stores.

The current Top 5 by Sales Amount are:

-   Freshmart Ahmedabad Complex
-   Freshmart Ahmedabad Hub
-   Freshmart Bengaluru Circle
-   Freshmart Coimbatore Plaza
-   Freshmart Hyderabad Main Road

**Business use:**

-   Compare store-level sales contribution.
-   Compare sales with profit contribution.
-   Identify stores for further performance review.

### Which Products Are Driving Sales and Profit?

A Top 5 product comparison displays Sales Amount and Profit for the
highest-sales products.

The current Top 5 by Sales Amount are:

-   Coca-Cola Coffee 500g
-   Harvest Gold Rusk 1kg
-   Nescafe Coffee 1kg
-   Nescafe Soft Drinks Pack
-   Nestle Curd 1kg

**Business use:**

-   Identify products contributing strongly to revenue.
-   Compare product sales with profitability.
-   Support inventory and promotional review.

### How Do Customer Memberships Contribute to Sales and Profit?

A membership comparison evaluates Sales Amount and Profit across:

-   Gold
-   Silver
-   Bronze

**Business use:**

-   Understand the contribution of membership groups.
-   Compare sales contribution with profit contribution.
-   Support customer and membership-focused analysis.

### What Is the Return Status of Transactions?

A return-status chart compares:

-   Not Returned
-   Returned

The analysis records **2,386 not-returned transactions** and **114
returned transactions**.

**Business use:**

-   Monitor the proportion of returned transactions.
-   Track return activity alongside the Return Rate KPI.
-   Identify the need for further return-related investigation.

### Supporting Sales-Channel Analysis

Sales-channel performance is available in the supporting PivotTable
analysis.

  Sales Channel             Sales         Profit   Transaction Records
  --------------- --------------- -------------- ---------------------
  In-Store          ₹19,69,380.30   ₹5,04,060.82                 1,738
  Online             ₹6,12,494.35   ₹1,59,190.44                   525
  Mobile App         ₹2,86,557.95     ₹74,107.63                   237

------------------------------------------------------------------------

## Key Insights

Based on the cleaned transaction data and the completed dashboard
analysis:

### 1. Overall business performance

FreshMart recorded **₹28.68 lakh in sales** and **₹7.37 lakh in
profit**, resulting in a **25.7% profit margin** across 2,500
transaction records.

### 2. In-Store is the largest sales channel

In-Store generated approximately **₹19.69 lakh in sales** and **₹5.04
lakh in profit**. Online generated approximately **₹6.12 lakh in
sales**, while Mobile App generated approximately **₹2.87 lakh**.

This shows that the physical-store channel contributes the largest share
of recorded sales and profit.

### 3. Gold membership contributes the largest membership sales

Gold members generated approximately **₹17.06 lakh in sales** and
**₹4.80 lakh in profit**, compared with Silver at approximately **₹6.77
lakh sales** and Bronze at approximately **₹4.74 lakh sales**.

Gold therefore represents the largest sales and profit contribution
among the membership groups shown in the dashboard.

### 4. Sales leadership and profit leadership can differ

The category-level supporting analysis shows **Beverages** as the
highest-sales category at approximately **₹4.71 lakh**, while **Bakery**
generates the highest category profit at approximately **₹1.49 lakh**.

This reinforces the business requirement to evaluate sales together with
profitability rather than using sales alone.

### 5. Top products make a meaningful contribution

The five products displayed in the dashboard's Top 5 product analysis
together generate approximately **₹3.48 lakh in sales** and **₹98.66K in
profit**.

These products can be monitored for availability, demand and
profitability.

### 6. Monthly performance varies

Sales and profit fluctuate across the available months. October 2025
records the highest full-month Sales Amount and Profit in the current
analysis.

Monthly monitoring is therefore useful for identifying changes in
business performance rather than relying only on overall totals.

### 7. Returns represent a measurable operational area

There are **114 returned transaction records out of 2,500**, giving a
**4.6% return rate**.

Return activity should be monitored together with sales and profit to
understand whether particular products, stores, channels or customer
groups require additional investigation.

------------------------------------------------------------------------

## Recommendations / Conclusion

### Recommendations

Based on the available analysis, FreshMart management can:

-   Maintain availability of products that contribute strongly to sales
    and profit.
-   Evaluate products using both Sales Amount and Profit before
    prioritizing promotions.
-   Review the performance of the Top 5 stores and investigate
    differences between sales and profit contribution.
-   Continue monitoring the In-Store channel while reviewing
    opportunities to strengthen Online and Mobile App contribution.
-   Use membership-level analysis to understand the contribution of
    Gold, Silver and Bronze customers.
-   Monitor monthly sales and profit trends to identify weaker periods
    early.
-   Track returned transactions and investigate recurring return
    patterns by product, store or channel.
-   Use the dashboard slicers to drill into Year, Month, Region,
    Category and Sales Channel combinations.
-   Use target-related conclusions only after validating that Monthly
    Target periods align correctly with the transaction dates.

### Conclusion

The FreshMart dashboard provides a consolidated Excel-based view of
business performance across sales, profitability, stores, products,
customer membership, channels and returns.

The analysis shows that overall performance is positive in terms of
recorded sales and profit, while contribution varies across business
dimensions. Comparing **Sales Amount with Profit** helps management
distinguish revenue contribution from profitability and identify areas
that require further investigation.

The dashboard therefore serves as a management decision-support tool by
converting cleaned transaction data into **KPIs, trends, comparisons and
interactive business insights**.

------------------------------------------------------------------------

## Assumptions / Limitations

-   The analysis is based on the supplied FreshMart datasets and the
    prepared transaction data.
-   Transaction count is based on **Count of Invoice Number**. Distinct
    transaction conclusions should be made only after Invoice Number
    uniqueness is validated.
-   Return Rate uses the available `Return_Status` classification.
-   Monthly target achievement should not be concluded formally until
    target-period alignment is validated.
-   The analysis identifies patterns and associations; it does not
    establish causation.
-   Supplier information is treated as descriptive context unless
    additional procurement or inventory data is available.

------------------------------------------------------------------------

## Project Outcome

This project demonstrates practical skills in:

-   Excel data cleaning and preparation
-   Power Query
-   Data consolidation
-   PivotTables and PivotCharts
-   KPI development
-   Slicer-based interactivity
-   Sales and profitability analysis
-   Store and product performance analysis
-   Customer membership analysis
-   Sales-channel analysis
-   Return analysis
-   Executive dashboard design
-   Business insight generation
-   Data-driven recommendations

The final output is an interactive **FreshMart COO Business Performance
Dashboard** designed to help management understand **where sales are
generated, where profit is generated, how performance changes over time,
and which areas require further business attention**.
