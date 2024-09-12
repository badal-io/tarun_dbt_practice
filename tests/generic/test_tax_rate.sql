{% test tax_rate(model, column_name) %}

with validation as (

    select
        {{ column_name }} as field

    from {{ model }}

),

validation_errors as (

    select
        field

    from validation
    where field < 0.02

)

select *
from validation_errors

{% endtest %}