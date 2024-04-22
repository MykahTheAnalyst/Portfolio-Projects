#1. Detect and remove duplicates.
	
WITH cte1 as (
Select CustomerID, ShipName, ShipAddress, ShipPostalCode, ShipCountry,
ROW_NUMBER() OVER(partition by CustomerID order by CustomerID) as rn
From Orders
)

select * from cte1 where rn  = 1

#2. Clean data with CASE Statments.

Select freight,
case when freight between 0 and 50 then 'low charge'
	WHEN  Freight between 50 and 200 then 'medium charge' 
	WHEN freight > 200 then 'High Charge'
	end as Charge
from Orders


	
#3. Find NULL Values and replace with No Region.
	
select CustomerID, contactName, city, 
ISNULL (Region, 'No Region') as region
from customers
