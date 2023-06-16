with source as (
    select
        salesorderdetailid
        , salesorderid
        , orderqty
        , productid
        , specialofferid
        , unitprice
        , unitpricediscount
    from {{source('dev_angelica','salesorderdetail')}}
)

select * from source