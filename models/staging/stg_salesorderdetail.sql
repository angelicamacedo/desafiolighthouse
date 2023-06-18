with source as (
    select
        salesorderdetailid as sales_order_detail_id
        , salesorderid as sales_order_id
        , productid as product_id
        , specialofferid as specialoffer_id
        , orderqty as order_qty
        , unitprice
        , unitpricediscount
    from {{ source('dev_angelica','salesorderdetail') }}
)

select * from source