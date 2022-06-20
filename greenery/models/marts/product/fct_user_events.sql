WITH users AS (
    SELECT * FROM {{ ref("dim_users") }}
),
event_counts AS (
    SELECT * FROM {{ ref("int_session_events_counts") }}
),
event_counts_by_user as (
    SELECT
        user_id,
        COUNT(DISTINCT session_id) as num_sessions,
        MIN(created_at_utc) as oldest_session_utc,
        MAX(created_at_utc) as newest_session_utc,
        SUM(package_shipped) as package_shipped,
        SUM(page_view) as page_view,
        SUM(checkout) as checkout,
        SUM(add_to_cart) as add_to_cart
    FROM event_counts
    GROUP BY 1
)
SELECT
    user_id,
    first_name,
    last_name,
    zipcode,
    state,
    country,
    num_sessions,
    oldest_session_utc,
    newest_session_utc,
    package_shipped,
    page_view,
    checkout,
    add_to_cart
FROM users
LEFT JOIN event_counts_by_user USING (user_id)
