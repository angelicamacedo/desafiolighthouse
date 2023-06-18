with source as (
    select
        addressid as address_id
        , stateprovinceid as stateprovince_id
        , addressline1
        , addressline2
        , city
    from {{ source('dev_angelica','address') }}
)

select * from source