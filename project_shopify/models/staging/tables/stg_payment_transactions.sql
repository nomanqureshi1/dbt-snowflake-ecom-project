with raw as (
    select
        order_id::integer as order_id,
        lower(payment_status) as payment_status,
        lower(payment_method) as payment_method,
        lower(fraud_flag) as fraud_flag
    from {{ source('raw', 'payment_transactions') }}
)

select * from raw
