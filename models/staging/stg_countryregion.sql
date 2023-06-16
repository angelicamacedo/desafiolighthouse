with source as (
    select
        countryregioncode
        , name as countryname
        , modifieddate
    from {{source('dev_angelica','countryregion')}}
)

select * from source