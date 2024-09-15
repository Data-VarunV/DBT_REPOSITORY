{{ config(materialized='table') }}

select 
* 
from {{ source("customers_sc","customers") }}

