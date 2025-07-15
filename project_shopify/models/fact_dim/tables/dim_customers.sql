with snapshot as (
    select *
    from {{ ref('customers_snapshot') }}
    where dbt_valid_to is null
)

select
    customer_id,
    name,
    email,
    segment,
    dbt_valid_from as effective_from
from snapshot
