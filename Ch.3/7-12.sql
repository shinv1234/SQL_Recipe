DROP TABLE IF EXISTS quarterly_sales;
CREATE TABLE quarterly_sales (
    year integer
  , q1   integer
  , q2   integer
  , q3   integer
  , q4   integer
);

INSERT INTO quarterly_sales
VALUES
    (2015, 82000, 83000, 78000, 83000)
  , (2016, 85000, 85000, 80000, 81000)
  , (2017, 92000, 81000, NULL , NULL )
;

SELECT p.*, q.*
FROM
	quarterly_sales AS q
	CROSS JOIN
	(SELECT 1 AS idx
	 UNION ALL SELECT 2 AS idx
	 UNION ALL SELECT 3 AS idx
	 UNION ALL SELECT 4 AS idx
	 ) AS p;

SELECT
	q.year,
	CASE
		WHEN p.idx=1 THEN 'q1'
		WHEN p.idx=2 THEN 'q2'
		WHEN p.idx=3 THEN 'q3'
		WHEN p.idx=4 THEN 'q4'
	END AS quarter,
	CASE
		WHEN p.idx=1 THEN q.q1
		WHEN p.idx=2 THEN q.q2
		WHEN p.idx=3 THEN q.q3
		WHEN p.idx=4 THEN q.q4
	END AS sales
FROM
	quarterly_sales AS q
	CROSS JOIN
	(SELECT 1 AS idx
	 UNION ALL SELECT 2 AS idx
	 UNION ALL SELECT 3 AS idx
	 UNION ALL SELECT 4 AS idx
	 ) AS p;