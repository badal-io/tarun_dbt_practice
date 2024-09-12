
-- Use the `ref` function to select from other models
-- this is a test for the git commit
select *
from {{ ref('my_first_dbt_model') }}
where id = 1