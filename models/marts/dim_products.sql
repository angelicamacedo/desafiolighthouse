with 
    products as (
        select
            product_id
            , productsubcategory_id
            , product_name
            , product_number
    from {{ ref('stg_product') }} as products
)

    , productcategory as (
        select
            productcategory_id
            , productcategory_name
        from {{ ref('stg_productcategory') }} as productcategory
    )

    , productsubcategory as (
        select
            productsubcategory_id
            , productcategory_id
            , productsubcategory_name
        from {{ ref('stg_productsubcategory') }} as productsubcategory
    )

    , transformed_products as (
     select
        {{ dbt_utils.generate_surrogate_key (['product_id']) }} as product_sk
        , products.product_id
        , productsubcategory.productsubcategory_id
        , productcategory.productcategory_id
        , products.product_name
        , productcategory.productcategory_name
        , productsubcategory. productsubcategory_name
        , products.product_number
    from
        products
    join productsubcategory 
        on productsubcategory.productsubcategory_id = products.productsubcategory_id
    join productcategory
        on productcategory.productcategory_id = productsubcategory.productcategory_id 
    )
    
select * from transformed_products