{% macro limit_rows(number_of_rows=10) -%}
{%- if target.name == 'dev' -%}
    limit {{ number_of_rows }}
{%- endif -%}
{%- endmacro %}