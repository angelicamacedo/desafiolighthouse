with source as (
    select
        customerid
        , personid
        , territoryid
        , storeid
    from {{ source('dev_angelica','customer') }}
)

select *
from source