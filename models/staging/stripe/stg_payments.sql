with payments as (
    SELECT id, 
           orderid as order_id,
           paymentmethod, status, amount, created
    FROM {{ source('jaffle_shop','payments') }}
    where status='success'
)
select * from payments