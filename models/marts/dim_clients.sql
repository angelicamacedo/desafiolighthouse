with person as (
select
    person.businessentity_id
    , person.full_name
    , person.is_emailpromotion
    from 
        {{ ref('stg_person') }} as person
)

, customer as (
    select
        customer.customer_id
        , customer.person_id
    from 
        {{ ref('stg_customer') }} as customer
)

, clients as (
    select
        {{ dbt_utils.generate_surrogate_key (
            ['person.businessentity_id'
            , 'customer.customer_id'
            ]
        ) }} as clients_sk
        , person.businessentity_id
        , customer.customer_id
        , person.full_name
        , person.is_emailpromotion
    from 
        person
    left join
        customer on person.businessentity_id = customer.person_id
)

select *
from clients