{{ config(materialized='view') }}

select 
    USER_ID AS CUSTOMER_ID,
    MIN(ORDER_DATE) AS FIRST_ORDER_DATE,
    MAX(ORDER_DATE) AS MOST_RECENT_ORDER_DATE,
    COUNT(ID) AS NUMBER_OF_ORDERS
from `dbtset.orders`
group by USER_ID