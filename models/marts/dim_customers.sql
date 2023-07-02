with stg_customer as (
    select
        customerid
        , personid
    from 
        {{ ref('stg_customer') }}
)

, stg_person as (
select
    businessentityid
    , firstname
    , concat(ifnull(firstname,' '),' ',ifnull(middlename,' '),' ',ifnull(lastname,' ')
    ) as fullname
    from 
        {{ ref('stg_person') }}
)

, transformed as (
    select
        {{ dbt_utils.generate_surrogate_key (
            ['stg_person.businessentityid'
            , 'stg_customer.customerid'
            ]
        ) }} as customer_sk
        , stg_customer.customerid
        , stg_person.businessentityid
        , stg_person.firstname
        , stg_person.fullname
    from stg_customer
    left join stg_person on stg_customer.personid = stg_person.businessentityid
)
select *
from transformed