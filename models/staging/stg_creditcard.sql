with source as (
    select
        creditcardid as creditcard_id
        , cardtype as card_type
        , cardnumber
        , expmonth
        , expyear
    from {{ source('dev_angelica','creditcard') }}
)

select * from source