
with source as (
    select
        id as product_id
        ,order_id
        ,sku as product_sku
    from    
        {{ source('dbt_tchopra','raw_items') }}
)

select * from source