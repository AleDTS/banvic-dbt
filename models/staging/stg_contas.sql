with source as (
      select * from {{ source('banvic_erp', 'contas') }}
),

stg_contas as (
    select
        cast(num_conta as int) as num_conta,
        cast(cod_cliente as int) as cod_cliente,
        cast(cod_agencia as int) as cod_agencia,
        cast(cod_colaborador as int) as cod_colaborador,
        tipo_conta,
        cast(data_abertura as timestamp) as data_abertura,
        cast(saldo_total as numeric) as saldo_total,
        cast(saldo_disponivel as numeric) as saldo_disponivel,
        cast(data_ultimo_lancamento as timestamp) as data_ultimo_lancamento
    from source
)

select * from stg_contas