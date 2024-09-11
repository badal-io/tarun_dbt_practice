

with source as (
    select * from 
    {{ source('dbt_tchopra','dlp_physician') }}
)

select * from source