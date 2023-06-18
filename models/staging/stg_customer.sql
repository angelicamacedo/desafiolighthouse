with source as (
    select
        customerid as customer_id
        , personid as person_id
        , territoryid as territory_id
        , storeid as store_id
    from {{ source('dev_angelica','customer') }}
)

select * from source