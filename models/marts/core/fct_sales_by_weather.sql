with orders as (
    select * from {{ ref('fct_order_items') }} 
),

weather as (
    select * from {{ ref('stg_external__weather') }}
),

final as (
    select
        o.*,
        w.max_temperature,
        w.weather_condition
    from orders o
    left join weather w 
        on cast(o.order_created_at as date) = w.date_day
)

select * from final  