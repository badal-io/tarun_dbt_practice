
{% snapshot physician_snapshot %}

{{
    config(
        target_schema='dev_dbt_tchopra',
        unique_key='universal_unique_identifier',
        strategy='timestamp',
        updated_at='dbt_load_timestamp',
    )
}}

select * from {{ source('dbt_tchopra','dlp_physician') }}

{% endsnapshot %}