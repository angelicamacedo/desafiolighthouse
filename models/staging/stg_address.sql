with source as (
    select
        addressid
        , stateprovinceid
        , addressline1
        , addressline2
        , city
    from {{ source('dev_angelica','address') }}
)

select *
from source