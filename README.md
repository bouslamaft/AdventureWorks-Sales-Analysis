# AdventureWorks-Sales-Analysis

## Project Overview
This project involves analyzing sales data from the AdventureWorks database, a sample database provided by Microsoft for learning and demonstration purposes. The aim is to extract insights regarding sales trends, product performance, and salesperson achievements.

## Technologies Used
- SQL Server: Database management and querying
- Power BI: Data modeling, visualization, and reporting

## Steps Involved
1. **Database Restoration**
   - Restore the AdventureWorks database on a local SQL Server instance to access and manipulate the data.

2. **Data Preparation and Dimensional Modeling**
   - Execute SQL queries to create dimensional tables (`Dim_Customer`, `Dim_Product`, `Dim_SalesPerson`, `Dim_Date`) and a fact table (`Fact_Sales`).
   - Establish a direct connection from Power BI to SQL Server and construct a dimensional (star schema) model by defining relationships among the tables.

3. **Data Visualization**
   - Develop various visualizations in Power BI to highlight key metrics and trends.
   - Visuals include sales performance over time, product category comparisons, and salesperson rankings.

4. **Publishing**
   - Publish the Power BI report to Power BI Service to make the insights accessible online and enable scheduled refreshes.

## Repository Structure

/AdventureWorks-Sales-Analysis

/sql_queries # SQL scripts for creating tables and extracting data

/docs # Additional documentation and resources

/images # Screenshots of the dashboards and visualizations

README.md
