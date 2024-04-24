USE [Northwind];
GO

BEGIN TRY
	-- Colocar aqui os comandos que possam dar erro
	--SELECT 10 + 10;
	SELECT 10 / 0;	-- a ordem importa
	SELECT 10 + 10;	-- a ordem importa
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS [Nº erro], ERROR_MESSAGE() AS [Mensagem erro];
END CATCH;
GO

SELECT * FROM dbo.Orders;	-- 831
BEGIN TRY
	BEGIN TRAN InsertOrders	-- transaction
		INSERT INTO dbo.Orders(CustomerID, EmployeeID, orderdate)
			VALUES ('BOLIDD', 9, '2006-07-15');
	   	COMMIT TRANSACTION;	-- gravar
END TRY
BEGIN CATCH
	SELECT ERROR_NUMBER() AS ErrNum, ERROR_MESSAGE() AS ErrMsg;
	ROLLBACK TRANSACTION	-- anular
END CATCH;
GO
SELECT * FROM dbo.Customers WHERE CustomerID = 'Teste';
GO









