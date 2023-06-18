with source as (
    select
        salesorderid as salesorder_id
        , salesreasonid as sales_reason_id 
    from {{ source('dev_angelica','salesorderheadersalesreason') }}
)

select * from source