with source as (
    select
        addressid
        , stateprovinceid
        , city
    from {{ source('dev_angelica','address') }}
)

select *
from source