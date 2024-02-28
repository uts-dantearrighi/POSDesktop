USE [POSUTSimplex]
GO
/****** Object:  StoredProcedure [dbo].[getProximoNumeradorProveedor]    Script Date: 22/02/2024 17:07:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getNumeradorCodigoProveedor]
    @pProveedor NVARCHAR(100),
    @pCodigoProveedor NVARCHAR(100)

AS
BEGIN
declare @numero int;
declare @prefix varchar(2);
   
  set @numero= (SELECT TOP 1 cast(SUBSTRING(codigo,3,5) as integer) codigo
  from articulos where marca=@pProveedor and CODIGO_ARTI_PROVEEDOR = @pCodigoProveedor
  order by 1 desc)
  set @prefix= (SELECT TOP 1 SUBSTRING(codigo,1,2) codigo
  from articulos where marca=@pProveedor and CODIGO_ARTI_PROVEEDOR = @pCodigoProveedor)
  SELECT @prefix +''+ RIGHT(REPLICATE('0', 5) + CAST(@numero AS VARCHAR), 5) as codigo
END
