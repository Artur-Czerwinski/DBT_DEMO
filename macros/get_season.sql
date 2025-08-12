{% macro get_season(date_input) %}
    case
        WHEN month({{date_input}}) in (12,1,2) then 'WINTER'
        WHEN month({{date_input}}) in (3,4,5) THEN 'SPRING'
        WHEN month({{date_input}}) in (6,7,8) THEN 'SUMMER'
        ELSE 'AUTUMN'
    end
{% endmacro %}

{% macro day_type(x)%}

    case
        when dayname({{x}}) in ('Sat', 'Sun')
        then 'WEEKEND'
        else 'BUSINESSDAY'
    END

{% endmacro %}