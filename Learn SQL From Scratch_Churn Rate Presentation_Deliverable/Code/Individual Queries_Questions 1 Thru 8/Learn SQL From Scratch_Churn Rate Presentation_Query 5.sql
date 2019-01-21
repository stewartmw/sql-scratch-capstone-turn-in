-- Query 5:  Create temporary table status to identify
-- actives in Segments 87 and 30

WITH months AS (
  SELECT
    '2017-01-01' AS first_day,
    '2017-01-31' AS last_day
  UNION
  SELECT
    '2017-02-01' AS first_day,
    '2017-02-28' AS last_day
  UNION
  SELECT
    '2017-03-01' AS first_day,
    '2017-03-31' AS last_day
),
cross_join AS (
  SELECT *
  FROM subscriptions
  CROSS JOIN months
),
status AS (
  SELECT
    id,
    first_day AS month,
    CASE
      WHEN segment = 87
        AND subscription_start < first_day
  	AND (
          (subscription_end > first_day)
  	  OR
          (subscription_end IS NULL)
        )
  	  THEN 1
  	ELSE 0
    END AS is_active_87,
    CASE
      WHEN segment = 30
        AND subscription_start < first_day
  	AND (
          (subscription_end > first_day)
  	  OR
          (subscription_end IS NULL)
        )
  	THEN 1
      ELSE 0
    END AS is_active_30
  FROM cross_join
)
SELECT *
FROM status;