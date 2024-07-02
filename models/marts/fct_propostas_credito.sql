with propostas as (
    select * from {{ ref('stg_propostas_credito') }}
),

contas as (
    select * from {{ ref('int_contas') }}
),

colaboradores as (
    select * from {{ ref('dim_colaboradores') }}
)

select
    propostas.cod_proposta,
    propostas.cod_cliente,
    propostas.cod_colaborador,
    date(data_entrada_proposta) as data_entrada_proposta_dia,

    data_entrada_proposta,
    taxa_juros_mensal as taxa_juros_mensal_proposta,
    valor_proposta,
    valor_financiamento as valor_financiamento_proposta,
    valor_entrada as valor_entrada_proposta,
    valor_prestacao as valor_prestacao_proposta,
    quantidade_parcelas as quantidade_parcelas_proposta,
    carencia as carencia_proposta,
    status_proposta,

    contas.num_conta,
    contas.tipo_conta,
    contas.saldo_total_conta,
    contas.saldo_disponivel_conta,
    contas.data_ultimo_lancamento_conta,
    contas.tempo_conta_meses,
    contas.tempo_inatividade_conta_dias
from propostas
left join contas
    on contas.cod_cliente = propostas.cod_cliente
left join colaboradores
    on colaboradores.cod_colaborador = propostas.cod_colaborador