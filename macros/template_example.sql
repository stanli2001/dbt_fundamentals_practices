{% macro template_example() %}

    {% set query %}
        select true as bool, false as neg_bool
    {% endset %}

    {% if execute %}
        {% set result = run_query(query).columns[1].values()[0] %}
        {{ log('SQL results: ' ~ result, info=True) }}

        select
            {{ result }} as is_real
        from a_real_table

    {% endif %}

{% endmacro %}