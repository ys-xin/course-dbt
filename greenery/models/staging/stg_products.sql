WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "greenery",
            "products"
        ) }}
),
renamed AS (
    SELECT
        product_id,
        NAME,
        price,
        inventory
    FROM
        source
)
SELECT
    *
FROM
    renamed
