{{ config(materialized='ephemeral') }}

select * from {{ ref('silver_listings') }}
