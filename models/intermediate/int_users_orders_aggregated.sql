with users as (
    select * from {{ ref('stg_ecommerce__users') }}
),
orders as (
    select * from {{ ref('stg_ecommerce__orders') }}
),

user_orders as (
    select
        user_id,
        min(order_created_at) as first_order_created_at,
        max(order_created_at) as last_order_created_at,
        count(order_id) as total_orders,
        sum(case when status = 'Cancelled' then 1 else 0 end) as total_cancelled_orders
    from orders
    group by 1
)

select
    u.*,
    coalesce(uo.total_orders, 0) as total_orders,
    uo.first_order_created_at,
    uo.last_order_created_at,
    case 
        when uo.total_orders > 0 then true 
        else false 
    end as is_buyer
from users u
left join user_orders uo 
    on u.user_id = uo.user_id;

