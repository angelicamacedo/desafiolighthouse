with source as (
    select
        businessentityid
        , firstname
        , middlename
        , lastname
        , emailpromotion
        , modifieddate
    from {{source('dev_angelica','person')}}
)

select * from source