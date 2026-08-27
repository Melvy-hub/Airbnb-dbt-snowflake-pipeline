{{ config(materialized='table') }}

with bookings as (
    select * from {{ ref('bookings') }}
),
listings as (
    select * from {{ ref('listings') }}
),
hosts as (
    select * from {{ ref('hosts') }}
)

select
    b.booking_id,
    b.listing_id,
    b.booking_date,
    b.booking_status,
    b.total_amount,
    b.service_fee,
    b.cleaning_fee,
    b.created_at,
    l.host_id,
    l.property_type,
    l.room_type,
    l.city,
    l.country,
    l.accommodates,
    l.bedrooms,
    l.bathrooms,
    l.price_per_night,
    l.price_per_night_tag,
    h.host_name,
    h.host_since,
    h.is_superhost,
    h.response_rate,
    h.response_rate_quality
from bookings b
left join listings l on b.listing_id = l.listing_id
left join hosts h on l.host_id = h.host_id
