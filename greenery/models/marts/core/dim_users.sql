WITH users AS (
    SELECT * FROM {{ ref("stg_users") }}
),
addresses AS (
    SELECT * FROM {{ ref("stg_addresses") }}
),
final AS (
    SELECT
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        u.phone_number,
        u.created_at,
        u.updated_at,
        a.address,
        a.zipcode,
        a.state,
        a.country
    FROM
        users AS u
        LEFT JOIN addresses AS a USING (address_id)
)
SELECT * FROM final
