with source as (
    select * from {{ source('banvic_erp', 'propostas_credito') }}
),

stg_propostas_credito as (
    select
        cast(cod_proposta as int) as cod_proposta,
        cast(cod_cliente as int) as cod_cliente,
        cast(cod_colaborador as int) as cod_colaborador,
        cast(data_entrada_proposta as timestamp) as data_entrada_proposta,
        cast(taxa_juros_mensal as numeric) as taxa_juros_mensal,
        cast(valor_proposta as numeric) as valor_proposta,
        cast(valor_financiamento as numeric) as valor_financiamento,
        cast(valor_entrada as numeric) as valor_entrada,
        cast(valor_prestacao as numeric) as valor_prestacao,
        cast(quantidade_parcelas as int) as quantidade_parcelas,
        cast(carencia as int) as carencia,
        status_proposta
    from source
)

select * from stg_propostas_credito