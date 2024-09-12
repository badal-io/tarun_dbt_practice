
with customers as (
    select * from {{ ref('raw_customers') }}
),

orders as (
    select * from {{ ref('raw_orders') }}
),

customer_orders as (
    select customer_id
    ,min(ordered_at) as first_order_date
    ,max(ordered_at) as most_recent_order_date
    ,count(order_id) as number_of_orders

from orders
group by 1
),

final as (

    select
        customers.id as customer_id,
        customers.name as first_name,
        customer_orders.first_order_date,
        customer_orders.most_recent_order_date,
        coalesce (customer_orders.number_of_orders, 0) 
        as number_of_orders

    from customers

    left join customer_orders 
    on customers.id = customer_orders.customer_id

)

select * from final