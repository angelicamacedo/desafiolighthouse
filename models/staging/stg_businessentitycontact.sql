with source as (
    select
        personid 		
        , businessentityid
        , contacttypeid
        , modifieddate
    from {{source('dev_angelica','businessentitycontact')}}
)

select * from source