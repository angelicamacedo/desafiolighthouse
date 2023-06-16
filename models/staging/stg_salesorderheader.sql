with source as (
    select
        salesorderid
        , purchaseordernumber
        , billtoaddressid
        , salespersonid
        , shiptoaddressid
        , territoryid
        , shipmethodid
        , onlineorderflag
        , orderdate
        , duedate
        , shipdate
        , subtotal
        , taxamt as tax_amount
        , freight
        , totaldue
        , modifieddate
    from {{source('dev_angelica','salesorderheader')}}
)

select * from source