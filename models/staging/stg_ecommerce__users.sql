WITH source AS (
    SELECT * FROM {{ source('thelook_ecommerce', 'raw_users') }}
),

renamed AS (
    SELECT
        id AS user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        state,
        country,
        -- Usamos la macro que creamos el otro día si la pasamos a este proyecto!
        -- Si no, por ahora lo dejamos así:
        created_at AS account_created_at
    FROM source
)

SELECT * FROM renamed   