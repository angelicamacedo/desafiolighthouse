with source as (
    select
         salesreasonid as salesreason_id
         , name as sales_reason
         , reasontype as sales_type
    from {{ source('dev_angelica','salesreason') }}
)

select * from source