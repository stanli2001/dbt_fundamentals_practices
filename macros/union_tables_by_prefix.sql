{%- macro union_tables_by_prefix(database,schema, prefix) -%}

  
    {% set tables = dbt_utils.get_relations_by_pattern(        
        schema_pattern=schema,
        table_pattern=prefix,
        database=database
    ) %}

     {%- for table in tables -%}      
        {%- if not loop.first %}            
            union all
        {%- endif %}
        select * from {{ table }}
     {%- endfor -%}
{%- endmacro -%}