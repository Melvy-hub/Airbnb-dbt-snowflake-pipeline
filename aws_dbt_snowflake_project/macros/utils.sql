{% macro multiply(x, y, precision) %}
    round({{ x }} * {{ y }}, {{ precision }})
{% endmacro %}

{% macro trimmer(column_name) %}
    {{ column_name | trim | upper }}
{% endmacro %}

{% macro tag(col) %}
    CASE
        WHEN {{ col }} < 100 THEN 'low'
        WHEN {{ col }} < 200 THEN 'medium'
        ELSE 'high'
    END
{% endmacro %}
