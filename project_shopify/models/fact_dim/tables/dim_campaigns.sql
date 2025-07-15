select
    campaign_id,
    channel,
    cost,
    start_date,
    end_date
from {{ ref('stg_campaign_metadata') }}
