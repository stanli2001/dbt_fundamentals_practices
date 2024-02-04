{% macro grant_select(schema=target.schema, role=target.user) %}
    {% set query %}
        grant usage on schema {{ schema }} to  {{ role }};
        grant select on all tables in schema {{ schema }} to {{ role }};
        -- for Postgres, permissions on views depend on the underlying table. So ALL TABLES will include views, too.
        -- grant select on all views in schema {{ schema }} to {{ role }};
    {% endset%}

    {{ log('Granting select on all tables and views in schema ' ~ schema ~ ' to role ' ~ role, info=True) }}

    {% do run_query(query) %}

    {{ log('Priviledges granted', info=True)}}
{% endmacro %}