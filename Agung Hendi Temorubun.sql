-- Nama : Agung Hendi Temorubun
-- Nim : 22512001
-- prodi : Teknologi rekayasa Internet
-- Tugas :praktek babis data

USE products;
-- Membuat tabel products jika belum ada
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category_id INT,
    brand_id INT,
    price DECIMAL(10, 2) NOT NULL,
    quantity_in_stock INT NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Menambahkan produk "laptop ASUS" ke dalam tabel
INSERT INTO products (product_name, price, quantity_in_stock)
VALUES ('laptop ASUS', 120000.00, 50);

SELECT * FROM products
WHERE price > (SELECT AVG(price) FROM products);

UPDATE products
SET quantity_in_stock = 75
WHERE product_id = 'P003';

SELECT category_id, COUNT(*) AS total_products
FROM products
GROUP BY category_id;

SELECT *
FROM products
WHERE quantity_in_stock > 20 AND price < 15000000;

SELECT *
FROM products
ORDER BY price ASC;

DELETE FROM products
WHERE product_id IN (SELECT product_id FROM products WHERE quantity_in_stock < 10);

SELECT product_id, product_name, price, quantity_in_stock, (price * quantity_in_stock) AS total_stock_value
FROM products;

ALTER TABLE products
ADD COLUMN discount DECIMAL(5,2);
