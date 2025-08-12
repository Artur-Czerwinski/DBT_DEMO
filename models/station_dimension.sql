{{config(materialized='table')}}

with bike as (

    select
    distinct
    START_STATION_ID station_id,
    START_STATION_NAME station_name,
    start_lat station_lat,
    start_lng start_station_lng
    from {{ ref('stg_bike') }}
    where ride_id != 'ride_id'
    limit 10

)

select * from bike