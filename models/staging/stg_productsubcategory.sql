with source as (
    select
        productsubcategoryid
        , productcategoryid
        , name as productsubcategory_name
    from {{ source('dev_angelica','productsubcategory') }}
)

select * from source