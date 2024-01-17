with payments as (
    select *        
    from {{ ref('stg_payments') }}
),

orders as (
     select *        
    from {{ ref('stg_orders') }}
),

fct_orders as (
    select orders.order_id,
           orders.customer_id,           
           -- amount is stored in cents, convert it to dollars
           payments.amount / 100 as amount,
           order_date
    from orders
    left join payments using (order_id)
)

select * from fct_orders
