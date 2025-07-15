{% snapshot shipments_snapshot %}

{{
  config(
    target_schema='SNAPSHOTS',
    unique_key='order_id',
    strategy='check',
    check_cols=['shipment_date', 'carrier', 'tracking_number', 'delivery_status'],
    invalidate_hard_deletes=True
  )
}}

select
  order_id,
  shipment_date,
  carrier,
  tracking_number,
  delivery_status
from {{ ref('stg_shipments') }}

{% endsnapshot %}
