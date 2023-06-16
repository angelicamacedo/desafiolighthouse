with source as (
    select
        creditcardid
        , cardtype 
        , cardnumber
        , expmonth
        , expyear
        , modifieddate
    from {{source('dev_angelica','creditcard')}}
)

select * from source