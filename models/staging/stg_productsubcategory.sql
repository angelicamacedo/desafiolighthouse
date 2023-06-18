with source as (
    select
        productsubcategoryid as productsubcategory_id
        , productcategoryid as productcategory_id
        , name as productsubcategory_name
    from {{ source('dev_angelica','productsubcategory') }}
)

select * from source