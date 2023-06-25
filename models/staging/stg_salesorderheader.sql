with source as (
    select
        salesorderid
        , purchaseordernumber
        , billtoaddressid 
        , salespersonid
        , shiptoaddressid 
        , territoryid
        , shipmethodid
        , customerid
        , creditcardid
        , onlineorderflag
        , status as order_status
        , cast (orderdate as timestamp) orderdate
        , cast(duedate as timestamp) as duedate
        , cast (shipdate as timestamp) as shipdate
        , subtotal
        , taxamt
        , freight
        , totaldue
    from {{ source('dev_angelica','salesorderheader') }}
)

select *
from source