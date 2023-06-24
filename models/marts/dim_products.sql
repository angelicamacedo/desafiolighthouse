with stg_salesorderheader as (
    select *
    from {{ref('stg_salesorderheader')}}
)

, stg_salesorderdetail as (
    select 
        distinct(productid)
    from {{ref('stg_salesorderdetail')}}
)

, stg_product as (
    select *
from {{ ref('stg_product') }}
)

, stg_productcategory as (
    select *
    from {{ ref('stg_productcategory') }}
)

, stg_productsubcategory as (
    select *
    from {{ ref('stg_productsubcategory') }}
)

, transformed as (
    select
    {{ dbt_utils.generate_surrogate_key (['stg_salesorderdetail.productid']) }} as product_sk
        , stg_salesorderdetail.productid
        , stg_product.product_name 
        , stg_productcategory.productcategory_name
        , stg_productsubcategory.productsubcategory_name
from stg_salesorderdetail
left join stg_product on stg_salesorderdetail.productid = stg_product.productid
left join stg_productsubcategory on stg_product.productsubcategoryid = stg_productsubcategory.productsubcategoryid
left join stg_productcategory on stg_productcategory.productcategoryid = stg_productsubcategory.productcategoryid 
)

select *
from transformed