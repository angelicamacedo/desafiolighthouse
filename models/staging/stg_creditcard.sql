with source as (
    select
        creditcardid
        , cardtype
    from {{ source('dev_angelica','creditcard') }}
)

select *
from source