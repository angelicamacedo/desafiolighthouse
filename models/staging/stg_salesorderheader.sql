with source as (
    select
        salesorderid as sales_order_id
        , purchaseordernumber as purchase_order_number
        , billtoaddressid as billtoaddress_id
        , salespersonid as salesperson_id
        , shiptoaddressid as shiptoaddress_id
        , territoryid as territory_id
        , shipmethodid as shipmethod_id
        , customerid as customer_id
        , onlineorderflag as onlineorder_flag
        , cast (orderdate as timestamp) order_date
        , cast(duedate as timestamp) as due_date
        , cast (shipdate as timestamp) as ship_date
        , subtotal
        , taxamt as tax_amount
        , freight
        , totaldue as total_due
    from {{ source('dev_angelica','salesorderheader') }}
)

select * from source