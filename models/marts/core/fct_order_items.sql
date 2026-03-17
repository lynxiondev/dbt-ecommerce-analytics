with order_items_details as (
    select * from {{ ref('int_order_items_details') }}
),
orders as (
    select * from {{ ref('stg_ecommerce__orders') }}
)

select
    -- Identificadores
    oid.order_item_id,
    oid.order_id,
    oid.user_id,
    oid.product_id,
    
    -- Información de la Orden
    o.status as order_status,
    o.order_created_at,
    
    -- Información del Producto
    oid.product_name,
    oid.product_category,
    
    -- Métricas
    oid.sale_price,
    oid.product_cost,
    oid.profit,
    
    -- Un toque de SQL: ¿Es una venta neta?
    case 
        when o.status not in ('Cancelled', 'Returned') then oid.sale_price 
        else 0 
    end as net_revenue

from order_items_details oid
left join orders o 
    on oid.order_id = o.order_id; 

