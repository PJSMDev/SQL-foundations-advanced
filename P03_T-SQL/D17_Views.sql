USE [Northwind];
GO

SELECT * FROM [dbo].[Alphabetical list of products];

SELECT * FROM [dbo].[Invoices];

SELECT * FROM [dbo].[Products by Category];

SELECT * FROM [dbo].[Sales Totals by Amount];

-- view
SELECT * FROM [dbo].[vOrders] ORDER BY 'Order Date' DESC;	-- usar o alias para o ORDER
-- se quizer fazer o WHERE não posso usar alias

SELECT 
	* 
FROM 
	[dbo].[vOrders]
WHERE
	[OrderDate] BETWEEN '1997-12-01' AND  '1997-12-31';
--ORDER BY 'Order Date';
-- precisa de stored procedures por causa dos alias