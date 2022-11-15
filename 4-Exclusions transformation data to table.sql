truncate table [dbo].[ingredients_exclusions]
;WITH exclusion_in_right AS(
 SELECT A.order_id,A.order_time, A.pizza_id, 
 CAST(LEFT(exclusions,
CASE 
 WHEN (PATINDEX('%,%', exclusions) ) =0 THEN len(A.exclusions)
else 
PATINDEX('%,%', exclusions) - 1
END) AS varchar)
 exclusions1
, 
CASE 
 WHEN len(A.exclusions) = 0 THEN null 
WHEN len(A.exclusions) > 0 THEN 
 RIGHT(exclusions,LEN(exclusions) - PATINDEX('%,%', exclusions))
end
pendings12
 FROM [PizzaItalia].[dbo].orders A
 UNION ALL
 SELECT order_id,order_time,pizza_id,
 CAST(LEFT(pendings12,CASE WHEN PATINDEX('%,%', pendings12) = 0 THEN 
LEN(pendings12) ELSE PATINDEX('%,%', pendings12) - 1 END) AS varchar) exclusions12,
 RIGHT(pendings12,CASE WHEN PATINDEX('%,%', pendings12) = 0 THEN 0 ELSE 
LEN(pendings12) - PATINDEX('%,%', pendings12) END) pendings12
 FROM exclusion_in_right WHERE LEN(exclusions1) > 0
)
INSERT INTO [dbo].[ingredients_exclusions]
 ([order_id]
 ,[pizza_id]
 ,[exclusions])
select distinct order_id,pizza_id,LTRIM(RTRIM(exclusions1 )) AS exclusions from 
exclusion_in_right WHERE LEN(EXCLUSIONS1)>0 AND NOT EXCLUSIONS1 IS NULL AND NOT 
EXCLUSIONS1 like '%null%' 
and order_time >= ((select max(order_time) from [dbo].[Orders]) - 182.5)
order by order_id,pizza_id,LTRIM(RTRIM(exclusions1 ))