with contas as (
    select * from {{ ref('stg_contas') }}
),

clientes as (
    select * from {{ ref('int_clientes') }}
),

agencias as (
    select * from {{ ref('int_agencias') }}
)

select
    contas.num_conta,
    contas.cod_cliente,
    contas.cod_colaborador,
    tipo_conta,
    data_abertura as data_abertura_conta,
    saldo_total as saldo_total_conta,
    saldo_disponivel as saldo_disponivel_conta,
    data_ultimo_lancamento as data_ultimo_lancamento_conta,
    (date_diff(date('{{ var("data_atual") }}'), date(data_abertura), month)) as tempo_conta_meses,
    (date_diff(date('{{ var("data_atual") }}'), date(data_ultimo_lancamento), day)) as tempo_inatividade_conta_dias,

    agencias.cod_agencia,
    agencias.nome_agencia,
    agencias.endereco_agencia,
    agencias.uf_agencia,
    agencias.data_abertura_agencia,
    agencias.tipo_agencia,
from contas
left join agencias
    on contas.cod_agencia = agencias.cod_agencia
left join clientes
    on contas.cod_cliente = clientes.cod_cliente
