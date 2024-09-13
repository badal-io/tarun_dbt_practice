

select * from {{ ref('physician_2020') }}
where 1=1
and physician_full_name like '%{{ var("problem") }}%'
and date(dbt_load_timestamp) between '{{ var("Q3") }}' and '{{ var("Q4") }}'