{{
  config(
    materialized='table',
  )
}}

with source as (
    select * from {{ source('thelook_ecommerce', 'raw_events') }}
),

renamed as (
    select
        id as event_id,
        user_id,
        sequence_number,
        session_id,
        created_at as event_at,
        ip_address, city, state, postal_code,
        browser, traffic_source, event_type, uri
    from source

)

select * from renamed     