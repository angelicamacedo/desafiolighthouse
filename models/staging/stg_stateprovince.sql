with source as (
    select
         stateprovinceid as stateprovince_id
         , territoryid as territory_id
         , stateprovincecode as stateprovince_code
         , countryregioncode as countryregion_code
         , name as stateprovince_name
    from {{ source('dev_angelica','stateprovince') }}
)

select * from source