

select
    {{ dbt_utils.generate_surrogate_key(['supply_id','supply_name','product_sku']) }} as primary_key
    ,supply_id
    ,supply_name
    ,product_sku
    ,cost
    ,perishable
from {{ ref('raw_supplies') }}