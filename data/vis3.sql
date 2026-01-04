SELECT 
    OrderDate,
    SubTotal
FROM Sales.SalesOrderHeader

SELECT 
    FORMAT(OrderDate, 'yyyy-MM') AS Months,
    SUM(SubTotal) AS Revenue
FROM Sales.SalesOrderHeader
GROUP BY FORMAT(OrderDate, 'yyyy-MM')
ORDER BY Revenue ASC;