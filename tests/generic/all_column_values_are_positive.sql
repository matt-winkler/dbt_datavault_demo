{% test all_column_values_are_positive(model, column_name) %}
   
with validation as (

    select
        {{ column_name }} as test_column

    from {{ model }}

),

validation_errors as (

    select
        test_column

    from validation
    -- if this is true, there are negative opportunity amounts which is
    where test_column < 0.00

)

select *
from validation_errors

{% endtest %}