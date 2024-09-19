
select 
    *
    ,'ephemeral' as materialization
from {{ ref('jnja_practice') }}