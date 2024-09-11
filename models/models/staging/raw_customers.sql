
with source as (

    select
        id
        ,name
    from 
        {{ source('dbt_tchopra','raw_customers') }}
)

select * from source



