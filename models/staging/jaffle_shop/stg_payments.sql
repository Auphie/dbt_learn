select
    ID as payment_id,
    ORDERID	as order_id,
    PAYMENTMETHOD as payment_method,
    STATUS as pay_status,
    AMOUNT/100 as pay_amount,
    CREATED as created_at
from {{ source('bq_stripe','payment') }}