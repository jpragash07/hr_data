
{% snapshot snap_employees_check %}


{{
  config(
    target_schema='snapshots',
    unique_key='EMPLOYEE_ID',
    strategy='check',
    check_cols=[
      'FIRST_NAME',
      'LAST_NAME',
      'EMAIL',
      'PHONE_NUMBER',
      'HIRE_DATE',
      'JOB_ID',
      'SALARY',
      'COMMISSION_PCT',
      'MANAGER_ID',
      'DEPARTMENT_ID'
    ],
    invalidate_hard_deletes=True
  )
}}


select
  EMPLOYEE_ID,
  FIRST_NAME,
  LAST_NAME,
  EMAIL,
  PHONE_NUMBER,
  HIRE_DATE,
  JOB_ID,
  SALARY,
  COMMISSION_PCT,
  MANAGER_ID,
  DEPARTMENT_ID,
  LOAD_TIME
from {{ ref('stg_employees') }}

{% endsnapshot  %}

