

SELECT
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS Revenue,
    SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost) AS Profit,
    (SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost)) 
        / SUM(sod.LineTotal) AS Marginn
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductCostHistory pch ON p.ProductID = pch.ProductID
WHERE pch.EndDate IS NULL
GROUP BY p.Name
HAVING 
    SUM(sod.LineTotal) > 100000
    AND (SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost)) 
        / SUM(sod.LineTotal) > 0.3
ORDER BY Profit DESC;

SELECT
    p.Name AS ProductName,
    SUM(sod.LineTotal) AS Revenue,
    SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost) AS Profit,
    (SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost)) 
        / SUM(sod.LineTotal) AS Marginn
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductCostHistory pch ON p.ProductID = pch.ProductID
WHERE pch.EndDate IS NULL
GROUP BY p.Name
HAVING 
    SUM(sod.LineTotal) < 10000
    AND (SUM(sod.LineTotal) - SUM(sod.OrderQty * pch.StandardCost)) 
        / SUM(sod.LineTotal) < 0.2
ORDER BY Profit DESC;
