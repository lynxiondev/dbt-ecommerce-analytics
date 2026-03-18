with source as (
    select * from {{ source('thelook_ecommerce', 'raw_items') }}
),

renamed as (
    select
        id as order_item_id,
        order_id,
        user_id,
        product_id,
        inventory_item_id,
        status,
        created_at as item_created_at,
        shipped_at,
        delivered_at,
        returned_at,
        sale_price as item_sale_price
    from source
) 

select * from renamed 

