WITH orders AS (
    SELECT * FROM {{ ref("stg_orders") }}
),
addresses AS (
    SELECT * FROM {{ ref("stg_addresses") }}
),
promos AS (
    SELECT * FROM {{ ref("stg_promos" )}}
),
final AS (
    SELECT
        s.order_id,
        s.user_id,
        s.created_at,
        s.order_cost,
        s.shipping_cost,
        s.order_total,
        s.tracking_id,
        s.shipping_service,
        s.estimated_delivery_at,
        s.delivered_at,
        s.status,
        a.address,
        a.zipcode,
        a.state,
        a.country,
        p.promo_id,
        p.discount as promo_discount,
        p.status as promo_status
    FROM
        orders AS s
        LEFT JOIN addresses AS a USING (address_id)
        LEFT JOIN promos AS p using (promo_id)
)
SELECT * FROM final
