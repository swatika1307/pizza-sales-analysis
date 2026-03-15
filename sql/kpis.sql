select * from pizza_sales;

select sum(total_price) as Total_Revenue from pizza_sales;

select (sum(total_price) / count(distinct order_id)) as Average_Order_Value from pizza_sales;

select sum(quantity) as Total_Pizzas_Sold from pizza_sales;

select count(distinct order_id) as Total_Orders from pizza_sales;

select round(sum(quantity) / count(distinct order_id),2) as Average_Pizza_Per_Order from pizza_sales;