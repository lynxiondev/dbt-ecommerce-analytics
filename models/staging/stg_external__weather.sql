with source as (
    select * from {{ source('external_sources', 'daily_weather') }}
),

renamed as (
    select
        cast(date as date) as date_day,
        cast(temp_max as int) as max_temperature,
        lower(condition) as weather_condition,
        location
    from source
)

select * from renamed  