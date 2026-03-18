with source as (
    select * from {{ source('thelook_ecommerce', 'raw_users') }}
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
        created_at AS account_created_at
    FROM source
)

SELECT * FROM renamed   
 
