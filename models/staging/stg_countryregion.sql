with source as (
    select
        countryregioncode
        , name as country_name
    from {{ source('dev_angelica','countryregion') }}
)

select * from source