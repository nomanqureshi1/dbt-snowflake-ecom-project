with raw as (
    select
        product_id::integer as product_id,
        sku::string as sku,
        initcap(name) as name,
        lower(category) as category,
        price::float as price,
        inventory_level::integer as inventory_level
    from {{ source('raw', 'products') }}
)

select * from raw
