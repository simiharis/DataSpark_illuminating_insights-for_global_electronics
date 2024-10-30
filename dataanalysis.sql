select * from customerdata;
select * from productdetail;
select * from salesdata1;
select * from exchangerate;
select * from storedata1;

#Customer Analysis

select count(*) As Totalcustomers from customerdata;
SELECT COUNT(*) AS MaleCount FROM customerdata where Gender="Male";
select count(*) AS Femalecount from customerdata WHERE Gender = "Female";
select name,timestampdiff(year,birthday,curdate()) As Age from customerdata;
SELECT `State`, COUNT(*) AS `CustomerCount`
FROM `customerdata`
GROUP BY `State`;
SELECT City, State, COUNT(*) AS Count FROM customerdata GROUP BY City, State ORDER BY Count DESC;

#Product,Sales and Profit Analysis

SELECT Brand, COUNT(*) AS Count FROM productdetail GROUP BY Brand;


SELECT Productkey, SUM(Quantity) AS Total_Sold FROM salesdata1 GROUP BY Productkey 
ORDER BY Total_Sold DESC LIMIT 10;

SELECT `CustomerKey`, COUNT(*) AS `PurchaseCount`
FROM `salesdata1`
GROUP BY `CustomerKey`;
SELECT AVG(Unit_Price_USD) AS Average_Price FROM productdetail;


SELECT SUM((Unit_Price_USD - Unit_Cost_USD) * Quantity) AS Total_Profit FROM salesdata1 JOIN productdetail ON salesdata1.ProductKey = productdetail.ProductKey;



SELECT (Unit_Price_USD * Quantity) AS TotalSales
FROM productsalesdata1;
SELECT 
    Category,
    COUNT(*) as count
FROM dataspark.productsalesdata1
GROUP BY Category;

SELECT 
    Category,
    SUM(Quantity) as Total_Quantity
FROM dataspark.productsalesdata1
GROUP BY Category
ORDER BY Total_Quantity DESC;
