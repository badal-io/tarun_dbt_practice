

with source as (
    select * from 
    {{ source('dbt_tchopra','dlp_medical') }}
)

select * from source