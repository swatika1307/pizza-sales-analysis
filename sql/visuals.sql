select * from pizza_sales;

select
	dayname(str_to_date(order_date,'%m/%d/%Y')) as day_name,
    count(distinct order_id) as total_orders
from pizza_sales
group by day_name
order by total_orders desc;

select 
  monthname(str_to_date(order_date,'%m/%d/%Y')) as month_name,
  count(distinct order_id) as total_orders
from pizza_sales
group by month_name
order by total_orders desc;

select
	pizza_category, round(sum(total_price),2) as total_revenue, 
    round(sum(total_price) * 100.0 / (select sum(total_price) from pizza_sales), 2) as Percentage_of_Sales_by_Pizza_Category
from pizza_sales
group by pizza_category
order by pizza_category;

select 
	pizza_size, round(sum(total_price),2) as total_revenue,
    round(sum(total_price) * 100.0 / (select sum(total_price) from pizza_sales), 2) as Percentage_of_Sales_by_Pizza_Size
from pizza_sales
group by pizza_size
order by pizza_size;

select
	pizza_category, sum(quantity) as total_pizza
from pizza_sales
group by pizza_category
order by total_pizza;

select 
	pizza_name, round(sum(total_price), 2) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5;

select 
	pizza_name, round(sum(total_price), 2) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue
limit 5;

select
	pizza_name, sum(quantity) as total_quantity
from pizza_Sales
group by pizza_name
order by total_quantity desc
limit 5;

select
	pizza_name, sum(quantity) as total_quantity
from pizza_sales
group by pizza_name
order by total_quantity
limit 5;

select
	pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc
limit 5;

select
	pizza_name, count(distinct order_id) as total_orders
from pizza_sales
group by pizza_name
order by total_orders
limit 5;