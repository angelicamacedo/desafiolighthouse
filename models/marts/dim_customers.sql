with stg_customer as (
    select
        customerid
        , personid
        , storeid
    from 
        {{ ref('stg_customer') }}
)

, stg_person as (
select
    businessentityid
    , concat(ifnull(firstname,' '),' ',ifnull(middlename,' '),' ',ifnull(lastname,' ')) as fullname
    from 
        {{ ref('stg_person') }}
)

, stg_store as (
    select
        businessentityid as storebusinessentityid
        , store_name
    from {{ref('stg_store')}}
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
        , stg_store.storebusinessentityid
        , stg_person.fullname
        , stg_store.store_name
    from stg_customer
    left join stg_person on stg_customer.personid = stg_person.businessentityid
    left join stg_store on stg_customer.storeid = stg_store.storebusinessentityid
)
select *
from transformed