with raw as (
    select
        product_id::integer as product_id,
        lower(location) as location,
        stock_level::integer as stock_level,
        restock_date::date as restock_date
    from {{ source('raw', 'inventory_levels') }}
)

select * from raw
