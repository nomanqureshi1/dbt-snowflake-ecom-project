with raw as (
    select
        campaign_id::integer as campaign_id,
        lower(channel) as channel,
        cost::float as cost,
        start_date::date as start_date,
        end_date::date as end_date
    from {{ source('raw', 'campaign_metadata') }}
)

select * from raw
