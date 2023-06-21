with sales_reason as (
    select
        sales_reason.salesreason_id
        , sales_reason.sales_reason
        , sales_reason.sales_type
    from {{ ref('stg_salesreason') }} as sales_reason
)

, sales_order_header_sales_reason as (
    select
        sales_order_header_sales_reason.salesorder_id
        , sales_order_header_sales_reason.salesreason_id
    from {{ ref('stg_salesorderheadersalesreason') }} as sales_order_header_sales_reason
)

, transformed_sales_reason as (
    select
    {{ dbt_utils.generate_surrogate_key (['sales_reason.salesreason_id']) }} as sales_reason_sk
    , sales_reason.salesreason_id
    , sales_order_header_sales_reason.salesorder_id as salesorder_id
    , sales_reason.sales_reason
    , sales_reason.sales_type
    from sales_reason
    left join sales_order_header_sales_reason
        on sales_reason.salesreason_id = sales_order_header_sales_reason.salesreason_id
)
select *
from transformed_sales_reason