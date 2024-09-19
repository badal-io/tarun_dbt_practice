
{{
    config(
        materialized='ephemeral'
    )
}}

{% set foods = ['banana','bread','cheese'] %}

with cte as (

    select 
        supply_id
        ,T1.supply_name as food_name
        ,cost
    from {{ ref('raw_supplies' )}} as T1

    where 1=1
    and T1.supply_name in ('cheese','bread','banana')
)

select 
    supply_id

    {% for food in foods %}

    ,sum(case when food_name = '{{ food }}' then cost else 0 end) as {{ food }}_cost_total

    {% endfor %}

from cte

group by 1
