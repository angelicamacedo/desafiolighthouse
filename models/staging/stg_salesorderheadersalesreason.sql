with source as (
    select
        salesorderid as salesorder_id
        , salesreasonid as salesreason_id 
    from {{ source('dev_angelica','salesorderheadersalesreason') }}
)

select * from source