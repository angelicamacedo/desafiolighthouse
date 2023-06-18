with source as (
    select
        businessentityid as businessentity_id
        , personid as person_id	
        , contacttypeid as contacttype_id
    from {{ source('dev_angelica','businessentitycontact') }}
)

select * from source