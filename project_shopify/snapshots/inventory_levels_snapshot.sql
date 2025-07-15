{% snapshot inventory_levels_snapshot %}

{{
  config(
    target_schema='SNAPSHOTS',
    unique_key=['product_id', 'location'],
    strategy='check',
    check_cols=['stock_level', 'restock_date'],
    invalidate_hard_deletes=True
  )
}}

select
  product_id,
  location,
  stock_level,
  restock_date
from {{ ref('stg_inventory_levels') }}

{% endsnapshot %}
