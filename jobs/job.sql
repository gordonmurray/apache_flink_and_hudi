USE CATALOG default_catalog;

CREATE CATALOG hudi_catalog WITH (
    'type' = 'hudi',
    'catalog.path' = 's3a://my-test-bucket/'
);

USE CATALOG hudi_catalog;

CREATE DATABASE IF NOT EXISTS my_database;

USE my_database;

CREATE TABLE my_products (
    id INT PRIMARY KEY NOT ENFORCED,
    name VARCHAR,
    price DECIMAL(10, 2)
) WITH (
    'connector' = 'hudi',
    'path' = 's3a://my-test-bucket/hudi/',
    'table.type' = 'COPY_ON_WRITE'
);

create temporary table products (
    id INT,
    name VARCHAR,
    price DECIMAL(10, 2),
    PRIMARY KEY (id) NOT ENFORCED
) WITH (
    'connector' = 'mysql-cdc',
    'connection.pool.size' = '10',
    'hostname' = 'mariadb',
    'port' = '3306',
    'username' = 'root',
    'password' = 'rootpassword',
    'database-name' = 'mydatabase',
    'table-name' = 'products'
);

SET 'execution.checkpointing.interval' = '60 s';

INSERT INTO my_products (id,name,price) SELECT id, name,price FROM products;
