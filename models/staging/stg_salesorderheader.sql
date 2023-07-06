with source as (
    select
        salesorderid 
        , salespersonid
        , shiptoaddressid 
        , territoryid
        , customerid
        , creditcardid
        , status as order_status
        , date(orderdate) as orderdate
        , subtotal
        , taxamt
        , freight
    from {{ source('dev_angelica','salesorderheader') }}
)

select *
from source