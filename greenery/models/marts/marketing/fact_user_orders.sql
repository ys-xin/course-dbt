WITH users AS (
    SELECT * FROM {{ ref("dim_users") }}
),
orders AS (
    SELECT * FROM {{ ref("fact_orders") }}
),
order_counts_by_user AS (
    SELECT
        user_id,
        COUNT(DISTINCT order_id) AS order_count,
        SUM(CASE
            WHEN promo_id IS NOT NULL THEN 1
            ELSE 0
        END) AS order_with_promo_count
    FROM orders
    GROUP BY user_id
),
final AS (
    SELECT
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.zipcode,
        u.state,
        u.country,
        c.order_count,
        c.order_with_promo_count
    FROM
        users AS u
        LEFT JOIN order_counts_by_user AS c USING (user_id)
)
SELECT * FROM final
