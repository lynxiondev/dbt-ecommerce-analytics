with source as (
    select * from {{ source('thelook_ecommerce', 'raw_products') }}
),

renamed as (
    select
        id as product_id,
        cost,
        category,
        name as product_name,
        brand,
        retail_price,
        department
    from source
)

select * from renamed; 

