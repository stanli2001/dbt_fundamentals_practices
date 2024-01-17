with t_total_amount as (
    select
        order_id,
        sum(amount) as total_amount
    from {{ ref('stg_payments') }}
    group by 1
)
select order_id,total_amount
from t_total_amount
where total_amount < 0