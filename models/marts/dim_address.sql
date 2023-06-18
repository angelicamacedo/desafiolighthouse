with 
    address_city as (
        select
            address_id
            , city
            , stateprovince_id
        from 
            {{ ref('stg_address') }} 
    )

    , state_province as (
        select
            stateprovince_id
            , territory_id
            , stateprovince_code
            , countryregion_code
            , stateprovince_name
        from
            {{ ref('stg_stateprovince') }}
    )  

    , country_region as (
        select
            countryregion_code
            , country_name
        from 
            {{ ref('stg_countryregion') }}
    )
    
    , final_address as (
        select
            {{ dbt_utils.generate_surrogate_key(
                ['address_id'
                , 'state_province.stateprovince_id'
                , 'country_region.countryregion_code' 
                ]
            )  }} as address_sk
            , address_city.address_id
            , address_city.stateprovince_id
            , state_province.territory_id
            , state_province.stateprovince_code
            , country_region.countryregion_code
            , address_city.city
            , state_province.stateprovince_name
            , country_region.country_name
        from
            address_city
        left join
            state_province 
                on address_city.stateprovince_id = state_province.stateprovince_id
        left join
            country_region 
                on state_province.countryregion_code = country_region.countryregion_code
    )
    
select * from final_address