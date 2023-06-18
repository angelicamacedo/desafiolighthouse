with source as (
    select
        countryregioncode as countryregion_code
        , name as country_name
    from {{ source('dev_angelica','countryregion') }}
)

select * from source