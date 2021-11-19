{{ config(materialized='table') }}

-- Terra Daily Transactions Example
SELECT 
    block_timestamp as metric_date,
    'tx_count' as metric_type,
    tx_count as metric_value
-- Note we are referring to the file ./metrics/terra_daily_txs.sql
FROM {{ ref("terra_daily_txs") }}

UNION ALL

-- Terra Daily Blocks Example
SELECT 
    block_timestamp as metric_date,
    'block_count' as metric_type,
    block_count as metric_value
-- Note we are referring to the file ./metrics/terra_daily_blocks.sql
FROM {{ ref("terra_daily_blocks") }}
