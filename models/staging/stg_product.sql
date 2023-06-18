with source as (
    select
        productid as product_id
        , name as product_name
        , productnumber as product_number
        , productsubcategoryid as productsubcategory_id
    from {{ source('dev_angelica','product') }}
)

select * from source