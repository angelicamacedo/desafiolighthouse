with source as (
    select
         stateprovinceid
         , countryregioncode
         , territoryid as territory_id
         , stateprovincecode
         , name as state_name
    from {{ source('dev_angelica','stateprovince') }}
)

select * from source