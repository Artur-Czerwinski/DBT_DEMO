{% macro function1(x) %}

    case when to_timestamp({{x}}) < current_date then 'PAST'
    else 'FUTURE' end

{% endmacro %}