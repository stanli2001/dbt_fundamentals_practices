with payments as (
    SELECT id, 
           orderid as order_id,
           paymentmethod as payment_method, status, 
           -- amount is stored in cents, convert it to dollars    
           {{ cents_to_dollars('amount') }} as amount,
           created
    FROM {{ source('jaffle_shop','payments') }}
    where status='success'
)
select * from payments
-- {{ limit_rows() }}