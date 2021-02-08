# OLTP_TO_OLAP_FACT_LOAD_SSIS_NZD_SALES
OLTP (AdventureWorks2014) to OLAP (AdventureWorksDW2014) Fact table load using SSIS to calculate sales in New Zealand dollars
----******Sales in New Zealand dollars by Muhammad Qasim Data Engineer--******-- Sunday 07-Feb-2021
-----******* [AdventureWorks2014] to [AdventureWorksDW2014]--*******--

Tools used for this solution:
1) SQL Server 2014
2) SQL Server Data Tool for visual studio 2013 -for SSIS
3) Python 3 - to get the latest currency rates in .CSV file
4) Adventureworks 2014 - As OLTP Source database
5) AdventureworksDW 2014 - As OLAP Destination

Q1- How to build and run the solution:

1- Execute Python file "GET_LATEST_CURRENCY_RATES.py" in Juypter Notebook to get and export "latest_currency_rates.csv" from https://exchangeratesapi.io/ in .CSV file in D: drive. (Script will delete the file if already exists in next execution)
2- Execute "Scripts_to_Execute in Source_Destination.sql" file in SOurce "[AdventureWorks2014]" and Target "[AdventureWorksDW2014]" databases as per the instructions mentioned in the file.
3- Execute SSIS package to load data from OLTP source "[AdventureWorks2014]" to Destination "[AdventureWorksDW2014]" database.


Q2- Following assumptions has been made during this assignment:

1- Base amount is in USD in OLTP database
2- Person executing scripts has access to D: drive because "latest_currency_rates.csv" is being exported on that path.
3- I have made manual code as USD, which I am considering as base. (See "Data Flow Task" source query in "OLTP to OLAP- Insert Into FactNewZealand" in SSIS package)



Q3- How your solution could be made better

1- Instead of natural key, we can use "Lookup Transformation" available in SSIS to make Surrogate key in target database
2- We can use C# to get latest currency rates
3- Structural scripts (executed at step Q1-2) can be executed at using SSIS
4- Fact table can be made in SSIS package to reduce the overhead and execution cost.
5- Python script (in Windows Dos/Linux) and SSIS package (on "SSISDB" in SQL Server "Integration Services Catalogs") can be scheduled to execute for certain time as per the business requirements.
6- Slowly Changing Dimension (SCD) Type 2 can be used to keep historical attributes and make the solution more efficient.


Note: Please execute the last part of SQL "Scripts_to_Execute in Source_Destination.sql" to get the quantity, sales amount and product Color in New Zealand dollars.



Kind Regards,
Muhammad Qasim
