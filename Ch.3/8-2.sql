DROP TABLE IF EXISTS mst_categories;
CREATE TABLE mst_categories (
    category_id integer
  , name        varchar(255)
);

INSERT INTO mst_categories
VALUES
    (1, 'dvd' )
  , (2, 'cd'  )
  , (3, 'book')
;

DROP TABLE IF EXISTS category_sales;
CREATE TABLE category_sales (
    category_id integer
  , sales       integer
);

INSERT INTO category_sales
VALUES
    (1, 850000)
  , (2, 500000)
;

DROP TABLE IF EXISTS product_sale_ranking;
CREATE TABLE product_sale_ranking (
    category_id integer
  , rank        integer
  , product_id  varchar(255)
  , sales       integer
);

INSERT INTO product_sale_ranking
VALUES
    (1, 1, 'D001', 50000)
  , (1, 2, 'D002', 20000)
  , (1, 3, 'D003', 10000)
  , (2, 1, 'C001', 30000)
  , (2, 2, 'C002', 20000)
  , (2, 3, 'C003', 10000)
;

SELECT * FROM mst_categories;
SELECT * FROM category_sales;
SELECT * FROM product_sale_ranking;

SELECT
	m.category_id,
	m.name,
	s.sales,
	r.product_id AS sale_product
FROM
	mst_categories AS m
JOIN
	category_sales AS s
	ON m.category_id = s.category_id
JOIN
	product_sale_ranking AS r
	ON m.category_id = r.category_id;