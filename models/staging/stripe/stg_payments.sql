with payments as (
    SELECT id, 
           orderid as order_id,
           paymentmethod, status, amount, created
    FROM {{ source('stg_jaffle_shop','payments') }}
    where status='success'
)
select * from payments