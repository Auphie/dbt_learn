{%- set payment_methods = ['bank_transfer', 'credit_card', 'coupon', 'gift_card'] -%}

with payments as (
    select order_id,
        payment_method,
        pay_amount,
        pay_status
    from {{ ref('stg_payments') }}
),

pivot as (
   select
       order_id,
       {% for payment_method in payment_methods -%}
        -- for loop
       sum(case when payment_method = '{{ payment_method }}' then pay_amount else 0 end)
            as {{ payment_method }}_amount

       {%- if not loop.last -%}
         ,
       {% endif -%}

       {%- endfor %}
   from payments
   group by 1
),

final as (select * from pivot)

select * from final