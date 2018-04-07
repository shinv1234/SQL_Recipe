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


SELECT
   product_id,
   score,
   ROW_NUMBER() OVER(ORDER BY score DESC) AS row,
   RANK() OVER(ORDER BY score DESC) AS rank,
   DENSE_RANK() OVER(ORDER BY score DESC) AS dense_rank,
   LAG(product_id) OVER(ORDER BY score DESC) AS lag1,
   LAG(product_id, 2)  OVER(ORDER BY score DESC) AS lag2,   
   LEAD(product_id) OVER(ORDER BY score DESC) AS lead1,
   LEAD(product_id, 2)  OVER(ORDER BY score DESC) AS lead2,
   SUM(score) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cum_score,
   AVG(score) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING) AS local_avg,
   FIRST_VALUE(product_id) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_value,
   LAST_VALUE(product_id) OVER(ORDER BY score DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_value
FROM popular_products
ORDER BY row;
