with payments as (
    SELECT id, 
           orderid as order_id,
           paymentmethod as payment_method, status, 
           -- amount is stored in cents, convert it to dollars
           amount/100 amount, 
           created
    FROM {{ source('jaffle_shop','payments') }}
    where status='success'
)
select * from payments