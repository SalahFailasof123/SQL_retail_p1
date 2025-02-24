-- Data Analysis & business key problems

-- Q.1 Ritrive all the columns for sales made on 2022-11-05
select *
from sales.retail_sales RS
where
RS.sale_date = '2022-11-05';

--Q.2 Retrive all transactions where the category is 'clothing' and the QTY more than 4 in the month of 2022-11
select 
*
from sales.retail_sales RS
where
    to_char(sale_date,'YYYY-MM') = '2022-11' AND
    category = 'Clothing'                    And
    quantiy >= 4 ;

-- Q.3 Calculate the total sales for each category

Select 
category,
count(*) as No_orders,
round(sum(total_sale)) as net_revenue
--round(sum(total_sale)-sum(cogs)) as Total_revenue_After_cogs
from sales.retail_sales RS
GROUP by rs.category;

-- Q.4 Find the average age for the customers who purchased from the 'Beauty' cat

Select 
round(min(age)) as Highest_age,
round(avg(age)) as Average_age,
round(max(age)) as Lowest_age
from sales.retail_sales RS
where category = 'Beauty';

-- Q.5 Find all transactions where the total_sales is greater than 1000

Select 
*
from sales.retail_sales RS
where total_sale >=1000;

-- Q.6 Find the total number of transactions made by each gender in each category

Select 
category,
gender,
count(transactions_id) as No_Orders
from sales.retail_sales RS
GROUP by 1,2
order by 1,No_orders desc;

-- Q.7 Calculate the average sale for each MONTH. Find out best selling MONTH in each YEAR (Important)

select 
        YEAR,
        MONTH,
        AVG_sales
 from 
(
    Select 

    Extract(YEAR from (sale_date))  as YEAR,
    Extract(MONTH from (sale_date)) as MONTH,
    count(transactions_id)          as No_Orders,
    round(max(total_sale))          as Highest_sales,
    round(avg(total_sale))          as AVG_sales,
    round(min(total_sale))          as Lowest_sales,
    rank() over (PARTITION by Extract(YEAR from sale_date) order by round(avg(total_sale)) desc) as Rank

    from sales.retail_sales RS
    GROUP by 1,2
    order by 1,5 desc)              as Table1

Where rank = 1
;

-- Q.8 Find the top 5 customers based on the highest total sales

Select

    customer_id,
    sum(total_sale) as Total_Revenue

from sales.retail_sales RS
GROUP by 1
order by 2 desc
LIMIT 5
;

-- Q.9 Find the number of unique customers who purchased items from each category

Select

    category,
    count(DISTINCT customer_id) as No_customers,
    sum(total_sale) as Total_Revenue

from sales.retail_sales RS
GROUP by 1
order by 2 desc
;

-- Q.10 Create each shift and number of orders (Example Morning <=12, afternoon between 12 & 17 evening > 17)

Select

    count(transactions_id) as No_orders,
    case 
            when extract (hour from sale_time) < 12                 then 'Morning'
            when extract (hour from sale_time) between 12 and 17    then 'Afternoon'
            when extract (hour from sale_time) > 17                 then 'Evening'
    end as Shifts

from sales.retail_sales RS
group by shifts
order by no_orders desc
;