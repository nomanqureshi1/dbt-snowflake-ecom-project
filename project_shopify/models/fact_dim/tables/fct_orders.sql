with orders as (
    select
        order_id,
        customer_id,
        product_id,
        quantity,
        price,
        status,
        date
    from {{ ref('stg_orders') }}
),

joined as (
    select
        o.order_id,
        o.date,
        o.customer_id,
        c.name as customer_name,
        c.email as customer_email,
        c.segment as customer_segment,
        o.product_id,
        p.name as product_name,
        p.category as product_category,
        p.price as product_unit_price,
        o.quantity,
        o.price as order_total,
        o.status
    from orders o
    left join {{ ref('dim_customers') }} c on o.customer_id = c.customer_id
    left join {{ ref('dim_products') }} p on o.product_id = p.product_id
)

select * from joined
