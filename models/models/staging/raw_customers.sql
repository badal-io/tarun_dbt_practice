
with source as (

    select
        id
        ,name
    from `prj-s-dlp-dq-sandbox-0b3c.dbt_tchopra.raw_customers`
)

select * from source



