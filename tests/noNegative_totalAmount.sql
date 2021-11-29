select
    order_id,
    sum(pay_amount) as total_amount
from {{ ref('stg_payments') }}
group by order_id
having (total_amount<0)

-- equal to: having not (total_amount>=0)
-- to examine no data return by the selection