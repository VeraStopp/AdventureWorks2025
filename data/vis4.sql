SELECT 
    OrderDate
FROM Sales.SalesOrderHeader
ORDER BY OrderDate ASC

SELECT
    YEAR(OrderDate) AS OrderYear,
    SUM(SubTotal) AS TotalSales,
    COUNT(DISTINCT SalesOrderId) AS NumberOfOrders
FROM Sales.SalesOrderHeader
GROUP BY YEAR(OrderDate)
ORDER BY OrderYear;