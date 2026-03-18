with users as (
    select * from {{ ref('int_users_orders_aggregated') }}
),



final as (
    select
        user_id,
        first_name,
        last_name,
        email,
        age,
        gender,
        state,
        country,
        is_buyer,
        total_orders,
        first_order_created_at,
        last_order_created_at,
        
        case 
            when total_orders >= 10 then 'VIP'
            when total_orders >= 5 then 'Recurrente'
            when total_orders > 0 then 'Ocasional'
            else 'Prospecto'
        end as customer_segment
    from users
)

select * from final 

