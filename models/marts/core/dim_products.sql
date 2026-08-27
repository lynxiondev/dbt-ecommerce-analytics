with products as (
    select * from {{ ref('stg_ecommerce__products') }}
),

final as (
    select
        product_id,
        product_name,
        category,
        brand,
        (cost / 100.0) as cost,
        (retail_price / 100.0) as retail_price,
        department,
        round((retail_price / 100.0) - (cost / 100.0), 2) as markup,
        round(((retail_price / 100.0) - (cost / 100.0)) / nullif((retail_price / 100.0), 0) * 100, 2) as margin_percent
    from products
)

select * from final
