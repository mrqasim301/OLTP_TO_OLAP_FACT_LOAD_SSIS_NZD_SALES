# AdventureWorks2014 OLTP to AdventureWorksDW2014 OLAP Fact table load using SSIS to calculate sales in New Zealand dollars
In this demo project I have used Python to get latest currency rates from web API (from https://exchangeratesapi.io/) and load that file in AdventureWorks2014 OLTP database 
using SSIS and populated a new Fact table in AdventureWorksDW2014 database to calculate total sales amount in New Zealand dollars (existing base rate is USD).

By Muhammad Qasim - Data Engineer -- Monday 15-Feb-2021

# Tools used for this solution:
SQL Server 2014
SQL Server Data Tool for visual studio 2013 -for SSIS
Python 3 - to get the latest currency rates in .CSV file
Adventureworks 2014 - As OLTP Source database
AdventureworksDW 2014 - As OLAP Destination

# How to build and run the solution:
1- Execute Python file "GET_LATEST_CURRENCY_RATES.py" in Juypter Notebook to get and export "latest_currency_rates.csv" from https://exchangeratesapi.io/ in .CSV file in D: drive. (Script will delete the file if already exists in next execution). 2- Execute "Scripts_to_Execute in Source_Destination.sql" file in Source "[AdventureWorks2014]" and Target "[AdventureWorksDW2014]" databases as per the instructions mentioned in the file. 3- Execute SSIS package to load data from OLTP source "[AdventureWorks2014]" to Destination "[AdventureWorksDW2014]" database.

# Following assumptions has been made during this project:
1- Base amount is in USD in OLTP database. 
2- Person executing scripts has access to D: drive because "latest_currency_rates.csv" is being exported on that path. 
3- I have made manual code as USD, which I am considering as base. (See "Data Flow Task" source query in "OLTP to OLAP- Insert Into FactNewZealand" in SSIS package).

# Solution could be made better
1- Instead of natural key, we can use "Lookup Transformation" available in SSIS to make Surrogate key in target database. 
2- We can use C# to get latest currency rates. 
3- Structural scripts (executed at step Q1-2) can be executed at using SSIS. 
4- Fact table can be made in SSIS package to reduce the overhead and execution cost. 
5- Python script (in Windows Dos/Linux) and SSIS package (on "SSISDB" in SQL Server "Integration Services Catalogs") can be scheduled to execute for certain time as per the business requirements. 6- Slowly Changing Dimension (SCD) Type 2 can be used to keep historical attributes and make the solution more efficient. 7- Checkpoint file can be configured in SSIS package/s to restart from the point of failure. 8- Database constraints can be enforced to remove the inconsistencies and anomalies in data.
6- I am working to move this project to Microsoft Azure cloud.

Note: Execute the last part of SQL "Scripts_to_Execute in Source_Destination.sql" to get the quantity, sales amount and product Color in New Zealand dollars.

Kind Regards, 
Muhammad Qasim
Copyright - This demo is prepared by me and no one is authorized to publish it without my consent.
