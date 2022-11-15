DECLARE @TOP_INGREDIENTS varchar(MAX);
SET @TOP_INGREDIENTS= ''
SELECT top 5 @TOP_INGREDIENTS = @TOP_INGREDIENTS + CONVERT(varchar, id) + ','
FROM [PizzaItalia].[dbo].[QUANT_TOTALS] ORDER BY total DESC
-- Remove last comma
INSERT INTO [PizzaItalia].[dbo].[Pizza]
 ([id]
 ,[name]
 ,[ingredients])
SELECT 4,'Combination Pizza',LEFT(@TOP_INGREDIENTS, LEN(@TOP_INGREDIENTS) - 1)



-- Registration of the Order

DECLARE @TOP_INGREDIENTS varchar(MAX);
USE [PizzaItalia]
GO
INSERT INTO [dbo].[Orders]
 ([order_id]
 ,[customer_id]
 ,[pizza_id]
 ,[exclusions]
 ,[extras]
 ,[order_time])
 VALUES
 (12
 ,117
 ,4
 ,'null'
 ,'6'
 ,getdate())
GO



--and add a 2x in front of any ingredient that is requested as extra
DECLARE @num_orden int;
DECLARE @num_PIZZA int;
DECLARE @INDREDIENTS VARCHAR(MAX);
DECLARE @EXTRAS int;
set @num_orden=12
set @num_PIZZA=4
SET @INDREDIENTS=''
select
@INDREDIENTS=@INDREDIENTS +
(CASE WHEN
(SELECT [extras]
FROM [PizzaItalia].[dbo].[Orders] WHERE ORDER_ID= @num_orden AND PIZZA_ID=@num_PIZZA 
and extras like '%'+CAST(A.ID AS VARCHAR(7))+'%') > 0
then '2x'
else '' end )+ B.NAME + ','
from [dbo].[TOTAL_READY] A inner join [dbo].[Ingredients] B on A.ID = B.ID order by
A.NAME ASC
SELECT 'The recipe for order_id = '+CAST(@num_orden AS VARCHAR(7))+' would be:'+'"'+
LEFT( @INDREDIENTS, LEN(@INDREDIENTS) - 1) +'"'







