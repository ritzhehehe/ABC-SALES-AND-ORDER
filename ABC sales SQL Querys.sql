Create table Sales_data(
	Order_ID Varchar(20) ,
	Order_Date date ,
	Customer_ID Varchar(20),
	Product_ID Varchar(20),
	Region Varchar(20),
	city Varchar(20),
	State Varchar(20),
	Quantity Varchar,
	Unit_Price INT,
	Discount Varchar(20),
	Sales_Amount Float ,
	Cost_Amount Float  ,
	Profit Float ,
	country Varchar(20)


);
Select * From Sales_data


-- Total Sales By Region Select * From Sales_data

Create Table Product_data (
	Product_ID	Varchar(20) Not Null ,
	Product_Name	Varchar(20) Not Null ,
	Category Varchar(20) Not Null ,
	Sub_Category Varchar(20) Not Null ,
	Brand Varchar(20) Not Null ,
	Cost_Price INt Not Null,
	Selling_Price INt NOT NULL

);
Select * FROM Product_data

CREATE Table Customer_data(
	Customer_ID	Varchar(20) NOT NULL,
	Customer_Name Varchar(20) NOT NULL,
	Gender Varchar(20) NOT NULL,
	Age int ,
	City Varchar(20) NOT NULL,
	State Varchar(20) NOT NULL,
	Region Varchar(20) NOT NULL,
	Customer_Segment Varchar(20) NOT NULL,
	Join_Date Date

)
Select * From Customer_data

-- Total Sales By Region 
SELECT region,
	SUM(sales_amount) AS total_sales
FROM sales_data
Group by region
order by total_sales Desc


--- Top  5 Product by sales 


Create table product_sales As
select
	s.Product_ID ,
	p.Product_Name ,
	s.Sales_Amount

FROM sales_data s
JOIN product_data p
on s.product_id = p.Product_id

select * From product_sales


SELECT
    product_name,
	
    SUM(Sales_Amount) AS total_sales
FROM product_sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;



--Monthly sales Trend
SELECT
    EXTRACT(MONTH FROM order_date) AS month_number,
    SUM(sales_amount) AS total_sales
FROM sales_data
GROUP BY EXTRACT(MONTH FROM order_date)
ORDER BY month_number;


--Customer Count by segment 
Select Customer_segment ,
	COUNT(customer_id) as total_customer
FROM Customer_data
group by Customer_segment
order by total_customer DEsc






--Average Profit by  category 

Create table Profit as
select 
	 s.Product_ID ,
	 p.Category,
	 s.Profit 
From sales_data s
join product_data p
on s.Product_ID = p.Product_ID

Select * From Profit

Select
	category ,
	 Avg(Profit) as avgProfit  
From Profit
group by Category 
order by AvgProfit






