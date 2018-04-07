DROP TABLE IF EXISTS daily_kpi;
CREATE TABLE daily_kpi (
    dt        varchar(255)
  , indicator varchar(255)
  , val       integer
);

INSERT INTO daily_kpi
VALUES
    ('2017-01-01', 'impressions', 1800)
  , ('2017-01-01', 'sessions'   ,  500)
  , ('2017-01-01', 'users'      ,  200)
  , ('2017-01-02', 'impressions', 2000)
  , ('2017-01-02', 'sessions'   ,  700)
  , ('2017-01-02', 'users'      ,  250)
;

DROP TABLE IF EXISTS purchase_detail_log;
CREATE TABLE purchase_detail_log (
    purchase_id integer
  , product_id  varchar(255)
  , price       integer
);

INSERT INTO purchase_detail_log
VALUES
    (100001, 'A001', 3000)
  , (100001, 'A002', 4000)
  , (100001, 'A003', 2000)
  , (100002, 'D001', 5000)
  , (100002, 'D002', 3000)
  , (100003, 'A001', 3000)
;


SELECT * FROM purchase_detail_log;

SELECT 
	purchase_id,
	string_agg(product_id, ',') AS product_ids/*,
	SUM(price) AS amount*/
FROM purchase_detail_log
GROUP BY purchase_id
ORDER BY purchase_id;

SELECT * FROM daily_kpi;

SELECT
	dt,
	MAX(CASE WHEN indicator='impressions' THEN val END) AS impressions,
	MAX(CASE WHEN indicator='sessions' THEN val END) AS sessions,
	MAX(CASE WHEN indicator='users' THEN val END) AS users
FROM daily_kpi
GROUP BY dt
ORDER BY dt;