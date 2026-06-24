CREATE DATABASE userauthdb;

USE userauthdb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100),
    city VARCHAR(100)
);
Select * from users