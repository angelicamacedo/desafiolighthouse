with 
    sod_orderqty as (
        select
            sum(orderqty) as sum_orderqty
            , 'soma' as sum_test 
        from
            {{ref('stg_salesorderdetail')}}
    )

    , fct_orderqty as ( 
        select
            sum(orderqty) as sum_orderqty
            , 'soma' as sum_test
        from 
            {{ref('fct_order_details')}}
    )
    , final as (
        select
            case
                when sod_orderqty.sum_orderqty = fct_orderqty.sum_orderqty then 0
                when sod_orderqty.sum_orderqty != fct_orderqty.sum_orderqty then 1
            end as orderqty_test
        from 
            sod_orderqty
        left join 
            fct_orderqty on sod_orderqty.sum_test = fct_orderqty.sum_test
    )
    
select * from final
where orderqty_test = 1