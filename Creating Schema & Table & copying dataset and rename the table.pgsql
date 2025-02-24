--Creating Schema
Create schema Sales;

-- Create a table

Drop table if EXISTS sales.Sales; 
create table sales.Sales 
    (
        transactions_id int primary KEY,
        sale_date date,	
        sale_time time,	
        customer_id int,	
        gender varchar(8),	
        category varchar(20),	
        age int,	
        quantiy int,	
        price_per_unit float,	
        cogs float,	
        total_sale float
    );

-- rename the table name

    alter table sales.sales rename to retail_sales;
    select * from sales.retail_sales RS order by RS.transactions_id asc;

-- Import the data

COPY sales.retail_sales FROM 
'D:\Data Analysis\Projects\SQL Projects\Modified\Retail Sales Analysis/Retail Sales Analysis.csv' 
WITH (FORMAT CSV, HEADER,NULL '');
