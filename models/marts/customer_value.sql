{{ config(materialized='table') }}

with customers as (
    select 
        customer_id,
        first_name,
        last_name
    from {{ ref('stg_customers')}}
),

fct_orders as (
    select
        order_id,
        customer_id,
        order_date,
        success_amount
    from {{ ref('fct_orders') }}
),

customer_rec as (
    select
        customer_id,
        min(order_date) as first_order_date,
        max(order_date) as most_recent_order_date,
        count(order_id) as number_of_orders,
        sum(success_amount) as amount
    from fct_orders
    group by 1
),

final as (
    select
        customers.customer_id,
        customers.first_name,
        customers.last_name,
        customer_rec.first_order_date,
        customer_rec.most_recent_order_date,
        coalesce(customer_rec.number_of_orders, 0) as number_of_orders,
        coalesce(customer_rec.amount, 0) as amount
    from customers
    left join customer_rec using (customer_id)
)

select * from final