{{ config(materialized='table') }}


SELECT * FROM "FLIPSIDE"."ETHEREUM"."EVENTS_EMITTED"
    WHERE block_timestamp >= getdate() - interval '5 hours'
    AND event_name = 'Swap'
