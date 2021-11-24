
-- Use the `ref` function to select from other models

select *
from {{ ref('example_step1') }}
where id = 1
