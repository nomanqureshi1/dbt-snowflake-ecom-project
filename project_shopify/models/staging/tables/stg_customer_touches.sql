with raw as (
    select
        customer_id::integer as customer_id,
        campaign_id::integer as campaign_id,
        date::date as date,
        lower(action) as action
    from {{ source('raw', 'customer_touches') }}
)

select * from raw
