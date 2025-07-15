{% snapshot customers_snapshot %}

{{
  config(
    target_schema='SNAPSHOTS',
    unique_key='CUSTOMER_ID',
    strategy='check',
    check_cols=['name', 'email', 'segment'],
    invalidate_hard_deletes=True
  )
}}

select
  customer_id,
  name,
  email,
  segment
from {{ ref('stg_customers') }}

{% endsnapshot %}
