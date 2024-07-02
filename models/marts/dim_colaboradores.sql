with colaboradores as (
    select * from {{ ref('int_colaboradores') }}
),

agencias as (
    select * from {{ ref('int_agencias') }}
)

select
    cod_colaborador,
    nome_colaborador,
    idade_colaborador,
    cep_colaborador,
    colaboradores.cod_agencia,
    nome_agencia,
    endereco_agencia,
    uf_agencia,
    data_abertura_agencia,
    tipo_agencia
from colaboradores 
left join agencias
    on colaboradores.cod_agencia = agencias.cod_agencia