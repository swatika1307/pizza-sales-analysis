select * from pizza_sales;

select
	extract(hour from order_time) as hr, round(sum(total_price), 2) as total_revenue_by_hour
from pizza_sales
group by hr
order by total_revenue_by_hour desc;

select
    monthname(str_to_date(order_date,'%m/%d/%Y')) as month_name,
    round(sum(total_price) / count(distinct order_id), 2) as average_order_value_by_month
from pizza_sales
group by month_name
order by average_order_value_by_month desc;

select
	pizza_category, round(sum(total_price) / sum(quantity), 2) as average_price_per_pizza
from pizza_sales
group by pizza_category
order by average_price_per_pizza;

select
	dayname(str_to_date(order_date,'%m/%d/%y')) as day_name,
    round(sum(total_price), 2) as revenue
from pizza_sales
group by day_name
order by revenue desc;

select
	round(sum(case 
			when (dayname(str_to_date(order_date,'%m/%d/%y')) = 'Saturday' or dayname(str_to_date(order_date,'%m/%d/%y')) = 'Sunday')
            then total_price
		end), 2) as 'Weekend',
	round(sum(case 
			when (dayname(str_to_date(order_date,'%m/%d/%y')) = 'Monday' or dayname(str_to_date(order_date,'%m/%d/%y')) = 'Tuesday'
			or dayname(str_to_date(order_date,'%m/%d/%y')) = 'Wednesday' or dayname(str_to_date(order_date,'%m/%d/%y')) = 'Thursday'
			or dayname(str_to_date(order_date,'%m/%d/%y')) = 'Friday')
            then total_price
		end), 2) as 'Weekday'
from pizza_sales;

select round(sum(total_revenue) * 100.0 / (select sum(total_price) from pizza_sales), 2) as revenue_percentage_contribution_top_5
from
(select 
	pizza_name, sum(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by total_revenue desc
limit 5) tr ;
