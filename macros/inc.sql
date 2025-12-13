{% macro inc() %}

   where load_time > (select coalesce(max(LOAD_TIME),'1900-01-01') from {{this}})
    
{% endmacro %}