with transacoes as (
    select * from {{ ref('stg_transacoes') }}
),

contas as (
    select * from {{ ref('int_contas') }}
)

select
    transacoes.cod_transacao,
    date(transacoes.data_transacao) as data_transacao_dia,
    contas.cod_cliente,
    contas.cod_colaborador,

    transacoes.data_transacao,
    transacoes.valor_transacao,
    transacoes.nome_transacao,
    transacoes.num_conta,

    contas.saldo_total_conta,
    contas.saldo_disponivel_conta,
    contas.tipo_conta,
    contas.data_abertura_conta,
    contas.tempo_conta_meses,
    contas.tempo_inatividade_conta_dias,

    contas.cod_agencia,
    contas.nome_agencia,
    contas.endereco_agencia,
    contas.uf_agencia,
    contas.data_abertura_agencia,
    contas.tipo_agencia,

    case
        when regexp_contains(nome_transacao, r'(?i)pix') then 'Pix'
        when regexp_contains(nome_transacao, r'(?i)(ted|doc|transf)') then 'Transferência'
        when regexp_contains(nome_transacao, r'(?i)(compra|pagamento)') then 'Pagamentos/Compras'
        when regexp_contains(nome_transacao, r'(?i)(^dep|saque)') then 'Depósito/Saque'
        else 'Outros'
    end as tipo_transacao,

    case when regexp_contains(nome_transacao, r'(?i)pix') then true else false end as aceitas_pix,

    case
        when regexp_contains(nome_transacao, r'(?i)(pix|ted|doc|transf)')
            then true else false
    end as transacao_digital
from transacoes
left join contas
    on transacoes.num_conta = contas.num_conta