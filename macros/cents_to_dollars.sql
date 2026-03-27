{% macro cast_to_numeric(column_name, decimal_places=2) -%}
    round( cast( ({{ column_name }}) as numeric), {{ decimal_places }} )
{%- endmacro %}   