/* ====================================
   Pizza Sales Analysis
   SQL Business Analysis Queries
   Author: Swatika Panda
   ==================================== */
   
select * from pizza_sales;

/* ==== KPIs === */
select sum(total_price) as Total_Revenue from pizza_sales;

select (sum(total_price) / count(distinct order_id)) as Average_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select round(sum(quantity) / count(distinct order_id),2) as Average_Pizza_Per_Order from pizza_sales;

/* ==== Daily and Monthly Trends === */
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

/* ==== Product and Pricing Analysis === */
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

/* ==== Performance Report === */
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

/* ==== Additional Analysis === */
select
	extract(hour from order_time) as hr, round(sum(total_price), 2) as total_revenue_by_hour
from pizza_sales
group by hr
order by total_revenue_by_hour desc;

select
	pizza_category, round(sum(total_price) / sum(quantity), 2) as average_price_per_pizza
from pizza_sales
group by pizza_category
order by average_price_per_pizza;