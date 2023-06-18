with source as (
    select
        businessentityid as businessentity_id
        , firstname as first_name
        , middlename as middle_name
        , lastname as last_name
        , concat(firstname, ' ', coalesce(middlename, ' '), lastname) as full_name
        , case
            when emailpromotion = 0 then False
            else True
        end as is_emailpromotion
    from {{ source('dev_angelica','person') }}
)

select * from source