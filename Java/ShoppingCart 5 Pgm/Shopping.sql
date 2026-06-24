CREATE DATABASE IF NOT EXISTS shopping;
USE shopping;

CREATE TABLE IF NOT EXISTS products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    price DOUBLE
);

-- Insert sample data
INSERT INTO products (name, price) VALUES
('Laptop', 50000),
('Mobile', 20000),
('Headphones', 2000);


SELECT * FROM products;





