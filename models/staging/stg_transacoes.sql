with source as (
    select * from {{ source('banvic_erp', 'transacoes') }}
),
stg_transacoes as (
    select
        cast(cod_transacao as int) as cod_transacao,
        cast(num_conta as int) as num_conta,
        cast(data_transacao as timestamp) as data_transacao,
        nome_transacao,
        cast(valor_transacao as numeric) as valor_transacao
    from source
)

select * from stg_transacoes