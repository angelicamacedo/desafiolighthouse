with source as (
    select
        productid as product_id
        , name as product_name
        , productnumber as product_number
    from {{ source('dev_angelica','product') }}
)

select * from source