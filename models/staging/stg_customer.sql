with source as (
    select
        customerid
        , personid
        , territoryid
    from {{ source('dev_angelica','customer') }}
)

select *
from source