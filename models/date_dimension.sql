{{config(materialized='table')}}

with CTE AS (
    select

    to_timestamp(started_at) started_at,
    date(to_timestamp(started_at)) date_started_at,
    hour(to_timestamp(started_at)) hour_started_at,

    {{day_type('to_timestamp(started_at)')}} day_type,

    {{get_season("to_timestamp(started_at)")}} station_of_year

    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from CTE