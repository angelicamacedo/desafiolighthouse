with source as (
    select
        productid
        , name as product_name
        , productnumber
        , productsubcategoryid
    from {{ source('dev_angelica','product') }}
)

select *
from source