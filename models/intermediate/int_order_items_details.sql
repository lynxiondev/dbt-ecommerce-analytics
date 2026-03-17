with order_items as (
    select * from {{ ref('stg_ecommerce__order_items') }}
),
products as (
    select * from {{ ref('stg_ecommerce__products') }}
)

select
    -- IDs
    oi.order_item_id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    
    -- Datos del Producto
    p.product_name,
    p.category as product_category,
    
    -- Métricas Financieras
    oi.item_sale_price as sale_price,
    p.cost as product_cost,
    oi.item_sale_price - p.cost as profit,
    
    -- Fechas
    oi.item_created_at
from order_items oi
left join products p 
    on oi.product_id = p.product_id; 

