select * from online_shop_sales

update online_shop_sales
set Transaction_Date = STR_TO_DATE(Transaction_Date, '%d.%m.%Y');

alter table online_shop_sales
modify column Transaction_Date DATE;

update online_shop_sales
set Avg_Price = REPLACE(Avg_Price, ',', '.');

alter table online_shop_sales
modify column Avg_Price double;

update online_shop_sales
set Delivery_Charges=replace(Delivery_Charges,',','.');

alter table online_shop_sales
modify column Delivery_Charges double;

describe online_shop_sales

alter table online_shop_sales
drop column date;

update online_shop_sales
set Online_Spend=replace(Online_Spend,',','.');

alter table online_shop_sales
modify column Online_Spend double;

alter table online_shop_sales
drop column gst;

delete from online_shop_sales
where customerid is null;

-- KPI запросы

-- Анализ продаж

select round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
ELSE quantity * avg_price
end),2) as volume
from online_shop_sales;

with monthly_sales as (
select month, round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
ELSE quantity * avg_price
end),2) as volume
from online_shop_sales
group by month
)
select month, volume,
round(((volume - lag(volume,1) over (order by month)) / lag(volume,1)
over (order by month) * 100),2) as increase_percentage
from monthly_sales
order by month

-- Анализ заказов

select count(distinct transaction_id) as total_orders
from online_shop_sales;

select month, count(distinct transaction_id) as total_orders,
round((count(distinct transaction_id) - lag(count(distinct transaction_id),1)
over (order by month)) / lag(count(distinct transaction_id),1)
over (order by month) * 100,2) as increase_percentage
from online_shop_sales
group by month
order by month

-- Анализ проданных товаров

select sum(quantity) as items_sold
from online_shop_sales;

select month, sum(quantity) as items_sold,
(sum(quantity) - lag(sum(quantity),1)
over (order by month)) / lag(sum(quantity),1)
over (order by month) * 100 as increase_percentage
from online_shop_sales
group by month
order by month


-- Визуализация

select dayname(transaction_date) as order_day, count(transaction_id) as total_orders
from online_shop_sales
group by dayname(transaction_date), dayofweek(transaction_date)
order by dayofweek(transaction_date) -- ежедневный тренд

select monthname(transaction_date) as month_name, count(transaction_id) as total_orders
from online_shop_sales
group by month_name, month(transaction_date)
order by month(transaction_date) -- ежемесячный тренд

select product_category, volume, round(volume/total_volume * 100,2) as percentage_ratio
from (
select product_category, round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) as volume,
(select round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) from online_shop_sales) as total_volume
from online_shop_sales
group by product_category
order by volume desc) as a -- топ категорий

select product_description, 
round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) as volume
from online_shop_sales
group by product_description
order by volume desc 
limit 5 -- топ 5 продуктов

select location, 
round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) as volume
from online_shop_sales
group by location
order by volume desc -- географический анализ продаж

select gender, volume, round(volume/total_volume * 100,2) as percentage_ratio
from (
select gender, round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) as volume,
(select round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) from online_shop_sales) as total_volume
from online_shop_sales
group by gender
order by volume desc) as a -- влияние пола

select count(transaction_id) as total_orders,
case 
when coupon_status = "used" then "Used coupon"
when coupon_status = "Not used" then "Unused coupon"
when coupon_status = "Clicked" then "Clicked coupon"
else "No coupon"
end as coupon_category
from online_shop_sales
group by coupon_category -- использование купонов

select 
case when dayofweek(transaction_date) in (1,7) then "Weekends"
else "Weekdays"
end as day_type,
round(sum(
case
when discount_pct=10 and coupon_status= "used" then quantity * avg_price * (1 - 10/100)
when discount_pct=20 and coupon_status= "used" then quantity * avg_price * (1 - 20/100)
when discount_pct=30 and coupon_status= "used" then quantity * avg_price * (1 - 30/100)
else quantity * avg_price
end),2) as volume
from online_shop_sales
group by day_type -- анализ продаж будни/выходные




