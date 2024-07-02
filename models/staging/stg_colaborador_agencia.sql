with source as (
      select * from {{ source('banvic_erp', 'colaborador_agencia') }}
),

stg_colaborador_agencia as (
    select
        cast(cod_colaborador as int) as cod_colaborador,
        cast(cod_agencia as int) as cod_agencia
    from source
)

select * from stg_colaborador_agencia