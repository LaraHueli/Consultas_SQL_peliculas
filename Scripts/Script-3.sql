
SELECT 
    c."FirstName" AS CustomerFirstName,
    c."LastName" AS CustomerLastName,
    e."EmployeeId" AS EmployeeID,
    e."FirstName" AS EmployeeFirstName,
    e."LastName" AS EmployeeLastName
FROM 
    "Customer" c
JOIN 
    "Employee" e
ON 
    c."SupportRepId" = e."EmployeeId";
