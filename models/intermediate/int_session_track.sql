with events as (
    select * from {{ ref('stg_ecommerce__events') }}
),

final as (
    select
        {{ dbt_utils.generate_surrogate_key(['user_id', 'session_id']) }} as unique_session_key,
        user_id,
        session_id,
        min(event_at) as session_started_at,
        max(event_at) as session_ended_at,
        count(event_id) as total_events_in_session
    from events
    group by 1, 2, 3
)

select * from final   