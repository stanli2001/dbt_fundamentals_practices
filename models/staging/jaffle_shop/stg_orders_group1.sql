with orders as (
    SELECT 
    id as order_id, 
    user_id as customer_id, 
    order_date, 
    status
    from {{ source('jaffle_shop','orders_group1') }}
)

select * from orders

  