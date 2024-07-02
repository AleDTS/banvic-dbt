with colaboradores as (
    select * from {{ ref('stg_colaboradores') }}
),

colaborador_agencia as (
    select * from {{ ref('stg_colaborador_agencia') }}
)

select
    colaboradores.cod_colaborador,
    cod_agencia,
    concat(primeiro_nome, ' ', ultimo_nome) as nome_colaborador,
    extract(year from current_date) - extract(year from data_nascimento) as idade_colaborador,
    cep as cep_colaborador,
from colaboradores
left join colaborador_agencia
    on colaboradores.cod_colaborador = colaborador_agencia.cod_colaborador