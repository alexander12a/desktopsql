USE [PizzaItalia]
GO

/****** Object:  View [dbo].[QUANT_TOTALS]    Script Date: 11/14/2022 9:00:02 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[QUANT_TOTALS] AS
SELECT  A.[id]
	  ,B.NAME
      ,A.[QUANTITY_BASE]
      ,A.[QUANT_EXCLUSIONS]
      ,A.[QUANT_EXTRAS],
	   TOTAL=[QUANTITY_BASE] + [QUANT_EXTRAS] - [QUANT_EXCLUSIONS]
  FROM [PizzaItalia].[dbo].[QUANT_BEFORE_TOTALS] A INNER JOIN INGREDIENTS B ON A.ID = B.ID
GO


