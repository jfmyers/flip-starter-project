{{ config(materialized='table') }}

SELECT 
    date_trunc('day', block_timestamp) as metric_date,
    'tx_count' as metric_type,
    count(distinct tx_id) as metric_value
FROM {{ source("terra_sv", "transactions") }}
WHERE block_timestamp >= getdate() - interval '7 days'
GROUP BY 1

UNION ALL

SELECT 
    date_trunc('day', block_timestamp) as metric_date,
    'block_count' as metric_type,
    count(distinct block_id) as metric_value
FROM {{ source("terra_sv", "blocks") }}
WHERE block_timestamp >= getdate() - interval '7 days'
GROUP BY 1
