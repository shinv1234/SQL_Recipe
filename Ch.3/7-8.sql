DROP TABLE IF EXISTS popular_products;
CREATE TABLE popular_products (
    product_id varchar(255)
  , category   varchar(255)
  , score      numeric
);

INSERT INTO popular_products
VALUES
    ('A001', 'action', 94)
  , ('A002', 'action', 81)
  , ('A003', 'action', 78)
  , ('A004', 'action', 64)
  , ('D001', 'drama' , 90)
  , ('D002', 'drama' , 82)
  , ('D003', 'drama' , 78)
  , ('D004', 'drama' , 58)
;


SELECT *
FROM (SELECT 
		category,
		product_id,
		score,
		ROW_NUMBER()
			OVER(PARTITION BY category ORDER BY score DESC)
		AS row,
		RANK()
			OVER(PARTITION BY category ORDER BY score DESC)
		AS rank,
		DENSE_RANK()
			OVER(PARTITION BY category ORDER BY score DESC)
		AS dense_rank
	FROM 
		popular_products
	ORDER BY 
		category, row) AS popular_products_with_rank
WHERE rank <= 2;