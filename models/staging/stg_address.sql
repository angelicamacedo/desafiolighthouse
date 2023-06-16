with source as (
    select
        addressid
        , city
    from {{source('dev_angelica','address')}}
)

select * from source