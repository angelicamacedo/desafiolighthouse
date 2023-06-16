with source as (
    select
        customerid
        , personid
        , territoryid
        , storeid
        , modifieddate
    from {{source('dev_angelica','customer')}}
)

select * from source