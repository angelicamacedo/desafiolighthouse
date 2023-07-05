with validation as (
    select sum(revenue_wo_taxfreight) as gross_revenue
    from {{ ref ('fct_order_details')}}
    where extract(year from orderdate) = 2011
   )

select *
from validation 
where gross_revenue != 12646112.160699883