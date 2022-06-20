WITH products AS (
    SELECT
        *
    FROM
        {{ ref("stg_products") }}
),
final AS (
    SELECT
        product_id,
        name,
        price,
        inventory
    FROM
        products
)
SELECT * FROM final
