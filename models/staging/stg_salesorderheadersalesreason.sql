with source as (
    select
        salesorderid
        , salesreasonid 
        , modifieddate
    from {{source('dev_angelica','salesorderheadersalesreason')}}
)

select * from source