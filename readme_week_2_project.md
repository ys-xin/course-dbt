# Week 2 Project

## What is our user repeat rate?

Repeat Rate = Users who purchased 2 or more times / users who purchased

```sql
WITH order_counts AS (
    SELECT user_id, COUNT( DISTINCT order_id ) AS order_count
    FROM dbt_yang_s.stg_orders
    GROUP BY user_id
)
SELECT
    SUM( CASE WHEN order_count > 1 THEN 1. ELSE 0 END ) /
    COUNT ( user_id ) AS rate
FROM order_counts
```

## What are good indicators of a user who will likely purchase again?
- users who have lots of page views
- users who have purchased in the past, or a history of purchasing the same item
- users who have repeated added items to cart

## What about indicators of users who are likely NOT to purchase again?
- users who made 1 purchase with a single promo
- users who returned items

## If you had more data, what features would you want to look into to answer this question?
- more events beyond the 4 in the dataset (eg: payment issues, returns, shipping issues), ratings
- ad attribution

## marts models

### core
- dim_users: user info + addresses
- fact_orders: orders + user info + addresses

### marketing
- fact_user_orders: user info including location + # orders and # promo orders

### product
- int_session_events_counts: sessions with number of events for all 4 types
- fct_user_events: users with aggregated event counts

## Tests

- unique + not null for all ids
- relationshipss for all references
