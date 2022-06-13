{{ config(
    materialized = 'table'
) }}

SELECT
    id AS superhero_id,
    NAME,
    gender,
    eye_color,
    race,
    hair_color,
    height,
    publisher,
    skin_color,
    alignment,
    weight
FROM
    {{ source(
        'tutorial',
        'superheroes'
    ) }}
