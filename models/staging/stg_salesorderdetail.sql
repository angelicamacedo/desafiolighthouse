with source as (
    select
        salesorderdetailid
        , salesorderid
        , productid
        , specialofferid
        , orderqty
        , unitprice
        , unitpricediscount
    from {{ source('dev_angelica','salesorderdetail') }}
)

select *
from source