Create schema 9pgm
use 9pgm
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

INSERT INTO Employees VALUES
(1,'Rahul',NULL),
(2,'Priya',1),
(3,'Karan',1),
(4,'Sneha',2),
(5,'Vijay',2),
(6,'Arun',3);

WITH RECURSIVE Subordinates AS (
    SELECT EmployeeID, EmployeeName, ManagerID
    FROM Employees WHERE ManagerID=1
    UNION ALL
    SELECT e.EmployeeID, e.EmployeeName, e.ManagerID
    FROM Employees e
    JOIN Subordinates s ON e.ManagerID = s.EmployeeID
)
select * From employees;
SELECT * FROM Subordinates;
