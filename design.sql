CREATE DATABASE store_management;

CREATE TABLE GovernmentS(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NoT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE stores(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    adress TEXT NOT NULL UNIQUE,
    government_id INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(government_id) REFERENCES governments(id)
);

CREATE TABLE suppliers(
    id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
    phone DECIMAL(15) NOT NULL UNIQUE,
    email VARCHAR(255) NOT NULL UNIQUE,
    brief_data TEXT,
    PRIMARY KEY(id)
);

CREATE TABLE products(
    name VARCHAR(255) NOT NULL,
    code VARCHAR(255) NOT NULL UNIQUE,
    description TEXT NOT NULL,
    price FLOAT NOT NULL,
    supplier_id INTEGER UNSIGNED NOT NULL,
    PRIMARY KEY(code),
    FOREIGN KEY(supplier_id) REFERENCES suppliers(id)
);

CREATE TABLE stores_products(
    store_id INTEGER UNSIGNED NOT NULL,
    product_code VARCHAR(255) NOT NULL,
    PRIMARY KEY(store_id),
    FOREIGN KEY(store_id) REFERENCES stores(id),
    FOREIGN KEY(product_code) REFERENCES products(code)
)