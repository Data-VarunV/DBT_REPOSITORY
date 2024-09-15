{{ config(materialized='incremental') }}

select 
* 
from {{ source("customers_sc","customers") }}

{% if is_incremental() %}

where updated_at > (select max(updated_at) from {{this}})

{% endif %}

