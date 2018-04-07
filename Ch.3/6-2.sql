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

SELECT
   year,
   q1, q2, q3, q4,
   SIGN(q2 - q1) AS sign_q2_q1,
   greatest(q1, q2, q3, q4) AS greatest_sales,
   least(q1, q2, q3, q4) AS least_sales,
   (q1 + q2 + q3 +q4)/4 AS average1,
   (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0))/4 AS average2,
   (COALESCE(q1, 0) + COALESCE(q2, 0) + COALESCE(q3, 0) + COALESCE(q4, 0))
   /(SIGN(COALESCE(q1, 0)) + SIGN(COALESCE(q2, 0)) + SIGN(COALESCE(q3, 0)) + SIGN(COALESCE(q4, 0))) AS average3
FROM
   quarterly_sales
ORDER BY
   year;