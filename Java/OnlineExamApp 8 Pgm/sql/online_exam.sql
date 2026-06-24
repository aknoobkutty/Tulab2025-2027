-- Create the database for the online examination application
CREATE DATABASE IF NOT EXISTS online_exam CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE online_exam;

DROP TABLE IF EXISTS questions;
CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    text VARCHAR(1024) NOT NULL,
    option_a VARCHAR(255) NOT NULL,
    option_b VARCHAR(255) NOT NULL,
    option_c VARCHAR(255) NOT NULL,
    option_d VARCHAR(255) NOT NULL,
    correct_option CHAR(1) NOT NULL
);

INSERT INTO questions (text, option_a, option_b, option_c, option_d, correct_option) VALUES
('Which HTML tag is used to define an internal style sheet?', '<style>', '<css>', '<script>', '<link>', 'A'),
('Which SQL statement is used to extract data from a database?', 'GET', 'SELECT', 'EXTRACT', 'OPEN', 'B'),
('In Java, which keyword is used to inherit a class?', 'implements', 'extends', 'inherits', 'super', 'B'),
('What does JDBC stand for?', 'Java Database Connectivity', 'Java Desktop Bridge Connector', 'Java Dynamic Code Binding', 'Java Data Control', 'A'),
('Which JSTL tag is used to loop over collections?', '<c:forEach>', '<c:if>', '<c:choose>', '<c:import>', 'A');
SELECT * FROM questions;
