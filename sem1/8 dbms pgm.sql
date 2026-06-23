CREATE Schema 8pgm
Use 8pgm
CREATE TABLE Employ(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(100),
StartDate DATE,
EndDate DATE
);
INSERT INTO Employ VALUES (1, 'Arun', DATE'2022-01-10', NULL);
INSERT INTO Employ VALUES (2, 'Divya', DATE'2021-06-15', DATE'2023-12-31');
INSERT INTO Employ VALUES (3, 'karthik', DATE'2023-03-01', NULL);
INSERT INTO Employ VALUES (4, 'Meena', DATE'2022-08-20', DATE'2022-11-30');
SELECT *FROM Employ;
SELECT EmployeeID, EmployeeName, StartDate FROM employ
WHERE EndDate IS NULL;
