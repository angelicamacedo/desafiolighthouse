with creditcard as (
    select *
    from {{ ref('dim_creditcard') }}
)

, clients as (
    select *
    from {{ ref('dim_clients')}}
)

, city_address as (
    select *
    from {{ ref('dim_address')}}
)

, products as (
    select *
    from {{ ref('dim_products')}}
)

, sales_reason as (
    select *
    from {{ ref('dim_sales_reason')}}
)

, order_details as (
    select
        salesorderdetail.salesorderdetailid as salesorderdetail_sk
        , salesorderdetail.salesorderid
        , products.product_sk as product_fk
        , salesorderdetail.orderqty as orderqty 
        , salesorderdetail.unitprice
        , salesorderdetail.unitpricediscount
        , salesorderdetail.unitprice * salesorderdetail.orderqty * (
            1 - salesorderdetail.unitpricediscount
            ) as product_subtotal
    from 
        {{ ref('salesorderdetail') }} as salesorderdetail
    left join sales_reason on salesorderdetail.salesorderid = sales_reason.salesorder_id
    left join products on salesorderdetail.productid = products.product_id
)

, order_details_with_sk as (
    select
        salesorderheader.salesorderid
        , clients.clients_sk as clients_fk
        , creditcard.creditcard_sk as creditcard_fk
        , salesorderheader.orderdate
        , salesorderheader.duedate
        , salesorderheader.totaldue
    from dev_angelica.salesorderheader as salesorderheader 
    left join creditcard on salesorderheader.creditcardid = creditcard.creditcard_id
    left join clients on salesorderheader.customerid = clients.customer_id
    left join city_address on salesorderheader.billtoaddressid = city_address.address_id
)

, final as (
    select
        order_details_with_sk.salesorderid
        , order_details.product_fk
        , order_details_with_sk.clients_fk
        , order_details_with_sk.creditcard_fk
        , order_details_with_sk.orderdate
        , order_details_with_sk.duedate
        , order_details_with_sk.totaldue
        , order_details.orderqty 
        , order_details.unitprice
        , order_details.unitpricediscount
        , order_details.product_subtotal
        from order_details
        left join order_details_with_sk 
            on order_details_with_sk.salesorderid = order_details.salesorderid
)

select * 
from final
