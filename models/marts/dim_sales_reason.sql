with stg_salesorderheadersalesreason as (
    select *
    from {{ ref('stg_salesorderheadersalesreason') }}
)

, stg_salesreason as (
    select *
    from {{ref('stg_salesreason')}}
)

, reasonbyorderid as (
    select 
        stg_salesorderheadersalesreason.salesorderid
        , stg_salesreason.reason_name
    from stg_salesorderheadersalesreason
    left join stg_salesreason on stg_salesorderheadersalesreason.salesreasonid = stg_salesreason.salesreasonid 
)

, transformed as (
    select
        salesorderid
        , string_agg(reason_name, ', ') as reason_name_aggregated
    from reasonbyorderid
    group by salesorderid
)

select *
from transformed