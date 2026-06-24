CREATE DATABASE IF NOT EXISTS studentdb;
USE studentdb;

CREATE TABLE IF NOT EXISTS students (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL
);

INSERT INTO students (id, name, department, email) VALUES
(1, 'Amit Sharma', 'Computer Science', 'amit.sharma@example.com'),
(2, 'Priya Patel', 'Information Technology', 'priya.patel@example.com'),
(3, 'Rohit Singh', 'Electronics', 'rohit.singh@example.com');

select * from students