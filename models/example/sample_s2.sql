
-- Use the `ref` function to select from other models

select *
from {{ ref('sample_s1') }}
where id = 1
