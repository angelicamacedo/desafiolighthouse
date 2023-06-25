with source as (
    select
        productcategoryid
        , name as productcategory_name
    from {{ source('dev_angelica','productcategory') }}
)

select *
from source