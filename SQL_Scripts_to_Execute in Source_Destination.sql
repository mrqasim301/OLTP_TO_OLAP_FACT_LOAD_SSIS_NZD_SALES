/****** Object:  Table [dbo].[LatestCurrencyRate]   Script Date: 04/02/2021 21:56:16 ******/

--Note: Please read the instuction in green and execute the scripts individually as mentioned below.
-- Restore source AdventureWorks2014 database with this name and execute following file
-- OLTP Source
USE [AdventureWorks2014]
GO

CREATE TABLE [dbo].[LatestCurrencyRate](
	[CurrencyRateID] int identity(1,1),
	[CurrencyCode] [varchar](50) NULL,
	[rates] [real] NULL,
	[base] [nvarchar](50) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[FactNewZealandSales]    Script Date: 07/02/2021 21:20:31 ******/

-- Restore Target [AdventureWorksDW2014] database with this name and execute following file
-- OLAP Destination

USE [AdventureWorksDW2014]
GO

DROP TABLE [dbo].[FactNewZealandSales]
GO

CREATE TABLE [dbo].[FactNewZealandSales](
	[ProductNumber] [nvarchar](100) NOT NULL,
	[CurrencyCode] [varchar](50) NOT NULL,
	[SALES_AMOUNT] [numeric](38, 6) NOT NULL,
	[NZD_TOTAL] [numeric](38, 6) NULL,
	[OrderDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
-----Now execute the SSIS package either from "SSISSourceCode" folder or from deployment file "TEST_PROJECT" after deployment in "SSISDB" in "Integration Services Catalog".
------Query to execute after complition on SSIS package
--------Execute Following query on Target OLAP "[AdventureWorksDW2014]" Database to get the Sales quentity and amount

SELECT 
d.CalendarYear,
P.Color AS PRODUCT_COLOR ,
COUNT(S.[OrderDate]) AS Quantity,
SUM(S.NZD_TOTAL) AS NewZealand_Sales
FROM FactNewZealandSales S
INNER JOIN DimProduct P
ON S.[ProductNumber]=P.ProductAlternateKey
inner join DimDate d
on d.FullDateAlternateKey = s.OrderDate
group by d.CalendarYear, P.Color
order by 1, 3


---------------Thank you-----------------