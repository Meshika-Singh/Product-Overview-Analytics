with cte as(
SELECT 
    a.Product, 
    a.Category,
    a.Brand,
    a.Description,
    a.Sale_Price,
    a.Cost_Price,
    a.Image_url,
    b.Date,
    b.Customer_Type,
    b.Discount_Band,
    b.Units_Sold,
    (a.Sale_Price * b.Units_Sold) AS revenue, 
    (a.Cost_Price * b.Units_Sold) AS total_cost,
    FORMAT(b.Date, 'MMMM') AS month,
    FORMAT(b.Date, 'yyyy') AS year
FROM Product_data a
JOIN product_sales b 
    ON a.Product_ID = b.Product)    

select 
*,
(1 - discount*1.0/100)* revenue as discount_revenue
from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.month = b.Month


