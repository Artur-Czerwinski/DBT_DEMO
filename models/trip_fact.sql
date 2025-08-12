with trips as (

    select
    ride_id,
    rideable_type,
    to_timestamp(started_at) trip_date,
    start_station_id,
    end_station_id,
    meember_casual member_casual,
    timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) trip_duration_seconds
    from {{ source('demo', 'bike') }}
    where ride_id != 'ride_id'
    limit 10

)

select * from trips