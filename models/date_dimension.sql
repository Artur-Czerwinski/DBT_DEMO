{{config(materialized='table')}}

with CTE AS (
    select

    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(TO_TIMESTAMP(STARTED_AT)) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,

    {{day_type('to_timestamp(started_at)')}} as day_type,

    {{get_season("to_timestamp(started_at)")}} as station_of_year

    from {{ ref('stg_bike')}}
    where STARTED_AT != 'started_at' and STARTED_AT != '"started_at"'

)

select * from CTE