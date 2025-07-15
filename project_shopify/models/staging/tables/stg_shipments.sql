with raw as (
    select
        order_id::integer as order_id,
        shipment_date::date as shipment_date,
        lower(carrier) as carrier,
        tracking_number::string as tracking_number,
        lower(delivery_status) as delivery_status
    from {{ source('raw', 'shipments') }}
)

select * from raw
