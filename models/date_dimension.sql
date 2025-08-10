with CTE AS (
    select

    to_timestamp(started_at) started_at,
    date(to_timestamp(started_at)) date_started_at,
    hour(to_timestamp(started_at)) hour_started_at,

    case
        when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
        then 'WEEKEND'
        else 'BUSINESSDAY'
    END AS day_type,

    case
        WHEN month(to_timestamp(started_at)) in (12,1,2)
        then 'WINTER'
        WHEN month(to_timestamp(started_at)) in (3,4,5)
        THEN 'SPRING'
        WHEN month(to_timestamp(started_at)) in (6,7,8)
        THEN 'SUMMER'
        ELSE 'AUTUMN'
    END AS STATION_OF_YEAR

    from {{ source('demo', 'bike') }}
    where started_at != 'started_at'
)

select * from CTE