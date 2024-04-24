USE [Northwind];
GO

-- 1 Show first name last name and date of birth employees that are Sales Managers ordered by date of birth.
SELECT
	e.FirstName AS 'First name',
	e.LastName AS 'Last name',
	FORMAT(e.BirthDate, 'dd-mm-yyyy', 'pt-PT') AS 'Birth date'
FROM
	[dbo].[Employees] AS e
ORDER BY
	'Birth date';
GO

/*
2 Create a list of employees with the employee full name in upper case in one column and create an 
output column name gender based on the Title of Courtesy field (Mrs. and Ms. are females and Mr. 
are males). Consider that may be an employee with no gender that should appear as Unknown.
*/
SELECT
		UPPER(CONCAT_WS(' ', e.FirstName, e.LastName)) AS 'Full name',
		IIF(e.TitleOfCourtesy IN('Mrs.', 'Ms.'), 'Female', IIF(e.TitleOfCourtesy = 'Mr.', 'Male', 'Unknown')) AS 'Gender'
FROM
	[dbo].[Employees] AS e
GO

-- 3 Select all suppliers companies and contact person that are from Germany.
SELECT
	s.CompanyName AS 'Company name',
	s.ContactName AS 'Contact name'
FROM
	[dbo].[Suppliers] AS s
WHERE
	s.Country = 'Germany';
GO

-- 4 Create a list of all suppliers company name and its’ contact person that are not from United States.
SELECT
	s.CompanyName AS 'Company name',
	s.ContactName AS 'Contact name'
FROM
	[dbo].[Suppliers] AS s
WHERE
	s.Country <> 'USA';
GO

-- 5 Select all the customers id and name that are from UK and London
SELECT
	c.CustomerID AS 'Customer ID',
	c.CompanyName AS 'Customer name'
FROM
	[dbo].[Customers] AS c
WHERE
	c.Country = 'UK' AND c.City = 'London';
GO

-- 6 Who are the customers from UK but are not based in London.SELECT
	c.CustomerID AS 'Customer ID',
	c.CompanyName AS 'Customer name'
FROM
	[dbo].[Customers] AS c
WHERE
	c.Country = 'UK' AND c.City <> 'London';
GO

-- 7 Which are the suppliers contact person who’s contact title starts with ‘Marketing’ or ends with ‘Marketing’.
SELECT
	s.ContactName AS 'Supplier contact',
	s.ContactTitle AS 'Contact title'
FROM
	[dbo].[Suppliers] AS s
WHERE
	s.ContactTitle LIKE 'Marketing%' OR
	s.ContactTitle LIKE '%Marketing';
GO

-- 8 Show all suppliers that are Japanese and work in marketing or all suppliers that are the business owners.
SELECT
	s.CompanyName AS 'Supplier name'
FROM
	[dbo].[Suppliers] AS s
WHERE
	(s.Country = 'Japane' AND s.ContactTitle LIKE '%Marketing%') OR
	s.ContactTitle = 'Owner';
GO

-- 9 Create a list of customers with the customer name in one column, country, region and city. When the region field is null show ‘Region Not Set’
SELECT
	c.CompanyName AS 'Customer',
	c.Country AS 'Country',
	COALESCE(c.Region, 'Region Not Set') AS 'Region',
	c.City AS 'City'
FROM
	[dbo].[Customers] AS c;
GO

-- 10 Which suppliers do we work with that don’t have a Web site neither have a fax number?SELECT
    s.CompanyName AS 'Supplier'
FROM
    [dbo].[Suppliers] AS s
WHERE
    s.HomePage IS NULL AND s.Fax IS NULL;
GO

-- 11 . Select all customers that are from Norway, Sweden or Denmark.
SELECT
	[CompanyName] AS 'Customer'
FROM
	[dbo].[Customers] AS c
WHERE
	c.Country IN ('Norway', 'Sweden', 'Denmark');
GO

-- 12 Select all the customers that are not from Italy, France or Spain.
SELECT
	[CompanyName] AS 'Customer'
FROM
	[dbo].[Customers] AS c
WHERE
	c.Country NOT IN ('Italy', 'France', 'Spain');
GO

-- 13 Show all the suppliers company name and contact person name and the contact title, considering that the ones that are Owners should appear ‘Owner- Not Specified‘.
SELECT
	s.CompanyName AS 'Company name',
	s.ContactName AS 'Contact name',
	IIF(s.ContactTitle = 'Owner', 'Owner- Not Specified', s.ContactTitle) AS 'Contact title'
FROM
	[dbo].[Suppliers] AS s;
GO

-- 14 Show all orders that Freight value is greater or equal to 5 and less or equal to 10, and were shipped to United States and we already know the shipped date
SELECT
	o.Freight
FROM
	[dbo].[Orders] AS o
WHERE
	o.Freight BETWEEN 5 AND 10 AND
	o.ShipCountry = 'USA' AND 
	o.ShippedDate IS NOT NULL;
GO