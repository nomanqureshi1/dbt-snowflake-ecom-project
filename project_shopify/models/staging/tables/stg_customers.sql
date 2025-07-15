with raw as (
    select
        customer_id::integer as customer_id,
        name::string as name,
        lower(email) as email,
        signup_date::date as signup_date,
        lower(segment) as segment
    from {{ source('raw', 'customers') }}
)

select * from raw
