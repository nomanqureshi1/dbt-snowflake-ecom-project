{% snapshot products_snapshot %}

{{
  config(
    target_schema='SNAPSHOTS',
    unique_key='product_id',
    strategy='check',
    check_cols=['sku', 'name', 'category', 'price'],
    invalidate_hard_deletes=True
  )
}}

select
  product_id,
  sku,
  name,
  category,
  price
from {{ ref('stg_products') }}

{% endsnapshot %}
