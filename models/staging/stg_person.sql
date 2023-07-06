with source as (
    select
        businessentityid
        , firstname
        , middlename
        , lastname
    from {{ source('dev_angelica','person') }}
)

select *
from source