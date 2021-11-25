{{ config(materialized='table') }}

with orders as (
    select
         order_id,
         customer_id,
         order_date
    from {{ref('stg_orders')}}
),

success_payment as (
    select
        order_id,
        pay_status,
        sum(ifnull(pay_amount,0)) as final_pay
    from {{ ref('stg_payments') }}
    where pay_status = 'success'
    group by order_id, pay_status
),


final as (
    select
         orders.order_id,
         orders.customer_id,
         orders.order_date,
         coalesce(success_payment.final_pay,0) as success_amount
    from orders
    left join success_payment using (order_id)
)

select * from final