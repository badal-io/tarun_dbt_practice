
with source as (
    select * from 
    {{ source('dbt_tchopra','dlp_sql_raw') }}
)

select * from source