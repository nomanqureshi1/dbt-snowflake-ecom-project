with raw as (
    select
        order_id::integer as order_id,
        customer_id::integer as customer_id,
        product_id::integer as product_id,
        quantity::integer as quantity,
        price::float as price,
        lower(status) as status,
        date::date as date
    from {{ source('raw', 'orders') }}
)

select * from raw
