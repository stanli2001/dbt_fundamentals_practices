with orders as (
    SELECT 
    id as order_id, 
    user_id as customer_id, 
    order_date, 
    status
    from {{ source('jaffle_shop','orders') }}
)

select * from orders

  