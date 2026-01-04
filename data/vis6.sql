SELECT * FROM Sales.SalesTerritory
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.Customer

SELECT
    st.Name AS Region,
    SUM(soh.SubTotal) AS Sales,
    COUNT(DISTINCT c.CustomerID) AS NumberOfCustomers
FROM Sales.SalesTerritory st  
INNER JOIN Sales.Customer c ON st.TerritoryID = c.TerritoryID
INNER JOIN Sales.SalesOrderHeader soh ON c.CustomerID = soh.CustomerID
GROUP BY st.Name
ORDER BY Sales DESC;