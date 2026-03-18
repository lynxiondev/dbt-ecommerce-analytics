with products as (
    select * from {{ ref('stg_ecommerce__products') }}
),

final as (
    select
        product_id,
        product_name,
        category,
        brand,
        {{ cents_to_dollars('cost') }} as cost,
        {{ cents_to_dollars('retail_price') }} as retail_price,
        department,
        round(retail_price - cost, 2) as markup,
        round((retail_price - cost) / nullif(retail_price, 0) * 100, 2) as margin_percent
    from products
)

select * from final  