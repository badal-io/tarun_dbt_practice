
{{
    config(
        materialized='incremental',
        unique_key='primary_key'
    )
}}


with supply_id as (
    select ['insert_1','insert_2','insert_3','insert_4','insert_5'] as text
),
supply_name as (
    select ['insert_1','insert_2','insert_3','insert_4','insert_5'] as text
),
product_sku as (
    select ['insert_1','insert_2','insert_3','insert_4','insert_5'] as text
),
cost as (
    select ['1','2','3','4','5'] as text
),
perishable as (
    select ['true','false'] as text
)

{% for ttt in range(1, 10) %}


select 
    GENERATE_UUID() as primary_key
    ,a1.text[OFFSET(cast(floor(rand()*5) as int))] as supply_id
    ,a2.text[OFFSET(cast(floor(rand()*5) as int))] as supply_name
    ,a3.text[OFFSET(cast(floor(rand()*5) as int))] as product_sku
    ,safe_cast((a4.text[OFFSET(cast(floor(rand()*5) as int))]) as int) as cost
    ,safe_cast((a5.text[OFFSET(cast(floor(rand()*2) as int))]) as bool) as perishable
from supply_id as a1,
    supply_name as a2,
    product_sku as a3,
    cost as a4,
    perishable as a5

    {% if not loop.last -%} union all {%- endif %}
{% endfor %}