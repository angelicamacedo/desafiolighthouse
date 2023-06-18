with source as (
    select
        productcategoryid as productcategory_id
        , name as productcategory_name
    from {{ source('dev_angelica','productcategory') }}
)

select * from source