{% macro cents_to_dollars(colname, decimal_places=2) %}
    round(1.0 * {{ colname }} /100, {{ decimal_places }})
{% endmacro %}