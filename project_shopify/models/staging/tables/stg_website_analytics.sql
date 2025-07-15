with raw as (
    select
        session_id::integer as session_id,
        customer_id::integer as customer_id,
        product_id::integer as product_id,
        session_date::date as session_date,
        conversion_rate::float as conversion_rate,
        tickets::integer as tickets,
        resolutions::integer as resolutions,
        rating::integer as rating,
        comment::string as comment
    from {{ source('raw', 'website_analytics') }}
)

select * from raw
