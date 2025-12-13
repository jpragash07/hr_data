{{
    config(
        materialized='view',
        tags=['stg']
    )
}}
select 
	LOCATION_ID ,
	STREET_ADDRESS ,
	POSTAL_CODE ,
	CITY ,
	STATE_PROVINCE ,
	COUNTRY_ID ,
	load_time 
from {{source('hr','src_locations')}}
where location_id is not null