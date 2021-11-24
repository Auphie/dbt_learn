select
    c.ID `CUSTOMER_ID`,
    c.FIRST_NAME,
    c.LAST_NAME,
    co.FIRST_ORDER_DATE,
    co.MOST_RECENT_ORDER_DATE,
    ifnull(co.NUMBER_OF_ORDERS,0) `order_counts`
from `dbt_tutorial.customers` as c
left join {{ ref('order_customer') }}
    as co on c.ID = co.CUSTOMER_ID