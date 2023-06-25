with source as (
    select
        businessentityid
        , title
        , firstname
        , middlename
        , lastname
        , persontype
        , namestyle
        , suffix
        , emailpromotion
    from {{ source('dev_angelica','person') }}
)

select *
from source