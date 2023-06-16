with source as (
    select
         stateprovinceid as stateprovince_id
         , territoryid as territory_id
         , stateprovincecode
         , countryregioncode
         , name as stateprovince_name
         , modifieddate
    from {{source('dev_angelica','stateprovince')}}
)

select * from source