USE [New Database]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SelectALLSuppliers]
		@City = N'Tokyo'

SELECT	'Return Value' = @return_value

GO
