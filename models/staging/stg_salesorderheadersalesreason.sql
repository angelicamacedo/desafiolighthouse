with source as (
    select
        salesorderid
        , salesreasonid
    from {{ source('dev_angelica','salesorderheadersalesreason') }}
)

select * from source