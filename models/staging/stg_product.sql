with source as (
    select
        productid
        , name as product_name
        , productsubcategoryid
    from {{ source('dev_angelica','product') }}
)

select *
from source