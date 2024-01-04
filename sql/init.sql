CREATE DATABASE IF NOT EXISTS mydatabase;

USE mydatabase;

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

INSERT INTO products (name, price) VALUES
    ('Product A', 19.99),
    ('Product B', 29.99),
    ('Product C', 39.99);

CREATE TABLE IF NOT EXISTS sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    user_id INT NOT NULL,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL
);

INSERT INTO sales (product_id, user_id, quantity, sale_date) VALUES
    (1, 1, 2, '2024-01-01'),
    (2, 2, 1, '2024-01-02'),
    (3, 3, 1, '2024-01-03');

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    reg_date DATE NOT NULL
);

INSERT INTO users (name, email, reg_date) VALUES
    ('John Doe', 'john.doe@example.com', '2023-12-25'),
    ('Jane Smith', 'jane.smith@example.com', '2023-12-30'),
    ('Alice Johnson', 'alice.johnson@example.com', '2024-01-01');
