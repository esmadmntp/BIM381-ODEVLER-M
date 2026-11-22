\set VERBOSITY verbose
BEGIN;

-- Önce: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 1: Sıcak İçecek ürünlerinin fiyatını 5 TL artır.
UPDATE product
SET price = price + 5
WHERE category = 'Sıcak İçecek';

-- Sonra: Sıcak İçecek fiyatları
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;

-- Komut 2: Var olmayan 999 numaralı ürünü siparişe ekle.
-- Bu INSERT yabancı anahtar kısıtı nedeniyle 23503 hatası vermelidir.
INSERT INTO order_item (order_id, product_id, quantity)
VALUES (1, 999, 1);

ROLLBACK;

-- ROLLBACK sonrası: Fiyatlar ilk hâline dönmüş olmalı.
SELECT name, price FROM product WHERE category = 'Sıcak İçecek' ORDER BY product_id;
