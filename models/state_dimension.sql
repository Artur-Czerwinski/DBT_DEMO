with bike as (

    select
    distinct
    START_STATION_ID,
    START_STATION_NAME,
    start_lat,
    start_lng
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10

)

select * from bike