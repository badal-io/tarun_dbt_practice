

with source as (
    select
        sku as product_sku
        ,name as product_name
        ,type as product_type
        ,price
        ,description
    from    
        {{ source('dbt_tchopra','raw_products') }}
)

select * from source