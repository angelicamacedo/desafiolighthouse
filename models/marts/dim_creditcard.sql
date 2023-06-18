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

    , transformed_creditcard as (
        select
            {{ dbt_utils.generate_surrogate_key(['creditcard_id']) }} as creditcard_sk
            , *
        from credit_card
    )

select * from transformed_creditcard 