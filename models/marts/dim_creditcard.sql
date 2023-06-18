with 
    credit_card as (
        select
            creditcard_id
            , card_type
            , cardnumber
            , expmonth
            , expyear
        from 
            {{ ref('stg_creditcard') }}
    )

select * from credit_card