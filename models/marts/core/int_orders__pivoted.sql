{%- set order_status = ['return_pending','returned','completed','placed','shipped'] -%}

with orders as (
    SELECT status,count(*) as cnt
    from {{ ref('stg_orders') }}
    group by status  
),

pivoted as (
    select 
           {%- for status in order_status %}
              sum(case when status = '{{status}}' then cnt else 0 end) as {{status}}_count
              {%- if not loop.last -%} , {%- endif -%}
           {% endfor %}
    from orders    
)

select * from pivoted

