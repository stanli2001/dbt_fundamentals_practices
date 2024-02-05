{%- macro union_tables_by_prefix(database,schema, prefix) -%}

  
    {% set tables = dbt_utils.get_relations_by_pattern(        
        schema_pattern=schema,
        table_pattern=prefix,
        database=database
    ) %}

   {{ dbt_utils.union_relations(relations = tables) }}
{%- endmacro -%}