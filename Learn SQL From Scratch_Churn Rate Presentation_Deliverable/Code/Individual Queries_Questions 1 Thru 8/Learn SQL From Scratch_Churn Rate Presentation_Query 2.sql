-- Query 2:  Determine the range of months of data provided.
-- Which months will be able to calculate churn for?

SELECT MIN(subscription_start) AS earliest_start,
  MAX(subscription_start) AS latest_start,
  MIN(subscription_end) AS earliest_end,
  MAX(subscription_end) AS latest_end
FROM subscriptions;

-- Answer 2:  Will be able to calculate churn for January 2017
-- through March 2017.  Data for subscription_start 
-- begins in December 2016, but the churn for this month will be 0.