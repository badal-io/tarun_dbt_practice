
with source as (
    select  
        id as supply_id
        ,name as supply_name
        ,cost
        ,perishable
        ,sku as product_sku
    from    
        {{ source('dbt_tchopra','raw_supplies') }}
)

select * from source