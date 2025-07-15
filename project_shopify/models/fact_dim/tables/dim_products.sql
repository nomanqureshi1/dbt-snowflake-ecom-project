with snapshot as (
    select *
    from {{ ref('products_snapshot') }}
    where dbt_valid_to is null
)

select
    product_id,
    sku,
    name,
    category,
    price,
    dbt_valid_from as effective_from
from snapshot
