-- Eploration of the data (Number of customers - Highest price - lowest price - number of cat)
Select 
    count(DISTINCT customer_id) as No_customers, 
    count(DISTINCT category)    as No_cat,
    min(price_per_unit)         as lowest_price,
    max(price_per_unit)         as Highest_price,
    min(sale_date)              as First_date,
    max(sale_date)              as last_date
    
from sales.retail_sales;

-- Exploration of the NULLS
select * from sales.retail_sales
where  
    transactions_id is NULL
or	
    sale_date       is NULL	
or 
    sale_time       is NULL
or	
    customer_id     is NULL	
or
    gender	        is NULL
or 
    category        is NULL
or    
    quantiy         is NULL
or 	
    price_per_unit  is NULL
or	
    cogs            is NULL	
or 
    total_sale      is NULL;

-- Clean All the nulls records while its in the main numbers we need such as total_sales and cogs
Delete from sales.retail_sales
where 
transactions_id is NULL
or	
    sale_date       is NULL	
or 
    sale_time       is NULL
or	
    customer_id     is NULL	
or
    gender	        is NULL
or 
    category        is NULL
or    
    quantiy         is NULL
or 	
    price_per_unit  is NULL
or	
    cogs            is NULL	
or 
    total_sale      is NULL

