SELECT * FROM Sales.SalesTerritory
SELECT * FROM Sales.SalesOrderHeader
SELECT * FROM Sales.Customer
SELECT * FROM Sales.Store

SELECT
    st.Name AS Region,
    SUM(CASE WHEN c.StoreID IS NULL THEN soh.SubTotal END) 
    / COUNT(CASE WHEN c.StoreID IS NULL THEN soh.SalesOrderID END) AS AOV_Individual,
    SUM(CASE WHEN c.StoreID IS NOT NULL THEN soh.SubTotal END) 
    / COUNT(CASE WHEN c.StoreID IS NOT NULL THEN soh.SalesOrderID END) AS AOV_Store
FROM Sales.SalesOrderHeader soh 
INNER JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
INNER JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
LEFT JOIN Sales.Store s ON soh.SalesPersonID = s.SalesPersonID
GROUP BY st.Name
ORDER BY (SUM(soh.SubTotal) / COUNT(soh.SalesOrderID)) DESC;