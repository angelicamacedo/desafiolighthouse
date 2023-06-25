with source as (
    select
        businessentityid
        , name as store_name
        , salespersonid
    from {{ source('dev_angelica','store') }}
)

select * 
from source