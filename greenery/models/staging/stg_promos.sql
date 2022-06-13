WITH source AS (
    SELECT
        *
    FROM
        {{ source(
            "greenery",
            "promos"
        ) }}
),
renamed AS (
    SELECT
        promo_id,
        discount,
        status
    FROM
        source
)
SELECT
    *
FROM
    renamed
