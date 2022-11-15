Truncate table [dbo].[ingredients_extras]
;WITH Extras_in_right AS(
 SELECT order_id,order_time, A.pizza_id, 
 CAST(LEFT(extras,
CASE 
 WHEN (PATINDEX('%,%', extras) ) =0 THEN len(A.extras)
else 
PATINDEX('%,%', extras) - 1
END) AS varchar)
 extras1
, 
CASE 
 WHEN len(A.extras) = 0 THEN null 
WHEN len(A.extras) > 0 THEN 
 RIGHT(extras,LEN(extras) - PATINDEX('%,%', extras))
end
pendings12
 FROM [PizzaItalia].[dbo].orders A
 UNION ALL
 SELECT order_id,order_time,pizza_id,
 CAST(LEFT(pendings12,CASE WHEN PATINDEX('%,%', pendings12) = 0 THEN 
LEN(pendings12) ELSE PATINDEX('%,%', pendings12) - 1 END) AS varchar) extras12,
 RIGHT(pendings12,CASE WHEN PATINDEX('%,%', pendings12) = 0 THEN 0 ELSE 
LEN(pendings12) - PATINDEX('%,%', pendings12) END) pendings12
 FROM extras_in_right WHERE LEN(extras1) > 0
)
INSERT INTO [dbo].[ingredients_extras]
 ([order_id]
 ,[pizza_id]
 ,[extras])
select distinct order_id,pizza_id,LTRIM(RTRIM(extras1 )) AS extras from extras_in_right WHERE 
LEN(extras1)>0 AND NOT extras1 IS NULL AND NOT extras1 like '%null%' 
and order_time >= ((select max(order_time) from [dbo].[Orders]) - 182.5)
order by order_id,pizza_id,LTRIM(RTRIM(extras1 ))