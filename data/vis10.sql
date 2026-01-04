
SELECT
    pc.Name AS Category,
    SUM(sod.OrderQty) AS TotalQuantity,
    SUM(sod.LineTotal) AS Revenue,
    SUM(sod.OrderQty * pch.StandardCost) AS Cost,
    SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost) AS Profit,
    CASE  
        WHEN SUM(sod.LineTotal) = 0 THEN 0
        ELSE (SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost)) / SUM(sod.LineTotal)
        END AS Margin
FROM Sales.SalesOrderDetail sod 
INNER JOIN Sales.SalesOrderHeader soh ON sod.SalesOrderID = soh.SalesOrderID
INNER JOIN Production.Product p ON sod.ProductID = p.ProductID
INNER JOIN Production.ProductSubcategory psc ON p.ProductSubcategoryID = psc.ProductSubcategoryID
INNER JOIN Production.ProductCategory pc ON pc.ProductCategoryID = psc.ProductCategoryID
INNER JOIN Production.ProductCostHistory pch ON p.ProductID = pch.ProductID
WHERE pch.EndDate IS NULL
GROUP BY pc.Name
ORDER BY Profit DESC;