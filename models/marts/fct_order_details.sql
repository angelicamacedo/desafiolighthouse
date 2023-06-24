with customers as (
    select
        customer_sk
        , customerid
    from {{ ref('dim_customers') }} 
)

, creditcard as (
    select
        creditcard_sk
        , creditcardid
    from {{ ref('dim_creditcard') }}
)

, location as (
    select
        shiptoaddress_sk
        , shiptoaddressid
    from {{ ref('dim_location') }}
)

, sales_reason as (
    select
        salesorderid
        , reason_name_aggregated
    from {{ ref('dim_sales_reason') }}
)

, products as (
    select
        product_sk
        , productid
    from {{ref('dim_products')}}
)

, salesorderdetail as (
    select
        stg_salesorderdetail.salesorderid
        , products.product_sk as product_fk
        , stg_salesorderdetail.productid
        , stg_salesorderdetail.orderqty
        , stg_salesorderdetail.unitprice
        , stg_salesorderdetail.unitprice * stg_salesorderdetail.orderqty  AS  revenue_wo_taxandfreight
    from {{ref('stg_salesorderdetail')}} stg_salesorderdetail
    left join products on stg_salesorderdetail.productid = products.productid
)

, salesorderheader as (
    select
        salesorderid
        , customers.customer_sk as customer_fk
        , creditcard.creditcard_sk as creditcard_fk
        , location.shiptoaddress_sk as shiptoadress_fk
        -- Description added to order_status based on data dictionary of Adventure Works  
        , case
            when order_status = 1 then 'In process'
            when order_status = 2 then 'Approved'
            when order_status = 3 then 'Backordered' 
            when order_status = 4 then 'Rejected' 
            when order_status = 5 then 'Shipped'
            when order_status = 6 then 'Cancelled' 
            ELSE 'no_status'
        end as order_status_name
        , orderdate
    from {{ref('stg_salesorderheader')}} 
    left join customers on stg_salesorderheader.customerid = customers.customerid
    left join creditcard on stg_salesorderheader.creditcardid = creditcard.creditcardid
    left join location on stg_salesorderheader.shiptoaddressid = location.shiptoaddressid
)

/* We then join salesorderdetail and salesorderheader to get the final fact table*/
, final as (
    select
        salesorderdetail.salesorderid
        , salesorderdetail.product_fk
        , salesorderheader.customer_fk
        , salesorderheader.shiptoadress_fk
        , salesorderheader.creditcard_fk
        , salesorderdetail.unitprice
        , salesorderdetail.orderqty
        , salesorderdetail.revenue_wo_taxandfreight
        , salesorderheader.orderdate
        , salesorderheader.order_status_name
    from salesorderdetail
    left join salesorderheader on salesorderdetail.salesorderid = salesorderheader.salesorderid
)

select *
from final