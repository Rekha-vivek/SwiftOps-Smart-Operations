

select current_database(),current_user;

select * from operations;

select count(*) as total_sales,
count(distinct warehouse_id) as unique_warehouses
from operations;

select avg(employee_count) as avg_employee,warehouse_id,avg(delivery_efficiency) as avg_delivery_efficiency
from operations
group by warehouse_id
order by avg_delivery_efficiency desc
limit 5;

#Delayed warehouse

select warehouse_id,count(*) as record_count,
round(avg(delivery_efficiency::numeric),2) as avg_delivery_efficiency
from operations
group by warehouse_id
order by avg_delivery_efficiency desc
limit 5;

#Stockout_risk_location

select location,avg(stockout_risk) as avg_stockout_risk
from operations
group by location
order by avg_stockout_risk desc;

#Product wise sales performance

select product_category,avg(monthly_sales ) as avg_sales
from operations
group by product_category
order by avg_sales desc;


#Cost vs profit analysis 


select location,
avg(total_cost) as avg_total_cost,
avg(estimated_profit) as avg_profit
from operations
group by location
order by avg_profit desc;

#Demand vs Stock comparison

select location,round(avg(current_stock),2) as avg_stock,
round(avg(demand_forecast),2) as avg_demand
from operations
group by location
order by avg_stock desc,avg_demand desc;









