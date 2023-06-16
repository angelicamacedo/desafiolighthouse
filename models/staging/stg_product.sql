with source as (
    select
        productid
        , name as product_name
        , productnumber
    from {{source('dev_angelica','product')}}
)

select * from source