USE [PizzaItalia]
GO

/****** Object:  View [dbo].[QUANT_BEFORE_TOTALS]    Script Date: 11/14/2022 8:52:37 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[QUANT_BEFORE_TOTALS] AS

SELECT  [id]
      ,[quantity] AS QUANTITY_BASE,
	  CASE 
	  WHEN NOT lEN(B.QUANT_EXCLUSIONS) > 0 THEN 0
	  WHEN B.QUANT_EXCLUSIONS IS NULL THEN 0
	  ELSE
	  B.QUANT_EXCLUSIONS
	  END QUANT_EXCLUSIONS,
	  CASE 
	  WHEN NOT lEN(C.QUANT_EXTRAS) > 0 THEN 0
	  WHEN C.QUANT_EXTRAS IS NULL THEN 0
	  ELSE
	  C.QUANT_EXTRAS
	  END QUANT_EXTRAS
	  FROM [PizzaItalia].[dbo].[ingredients_base] A left join [PizzaItalia].[dbo].[QUANT_EXCLUSIONS_VIEW] B
  on A.id = B.EXCLUSIONS  left join [PizzaItalia].[dbo].[QUANT_EXTRAS_VIEW] C  ON A.id = C.EXTRAS
GO


