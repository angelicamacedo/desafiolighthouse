with source as (
    select
         salesreasonid
         , name as reason_name
         , reasontype
    from {{ source('dev_angelica','salesreason') }}
)

select *
from source