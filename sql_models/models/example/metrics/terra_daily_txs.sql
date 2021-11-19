{{ config(materialized='table') }}

SELECT 
    date_trunc('day', block_timestamp) as metric_date,
    'tx_count' as metric_type,
    count(distinct tx_id) as metric_value
-- Note we are referring to tables defined in ./models/sources.yml with `ref`
-- the format is `source(<schema_name>, <table_name>)`
FROM {{ source("terra_sv", "transactions") }}
WHERE block_timestamp >= getdate() - interval '7 days'
GROUP BY 1
