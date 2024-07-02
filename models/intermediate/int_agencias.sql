with agencias as (
    select * from {{ ref('stg_agencias') }}
)

select
    cod_agencia,
    nome as nome_agencia,
    endereco as endereco_agencia,
    uf as uf_agencia,
    data_abertura as data_abertura_agencia,
    tipo_agencia as tipo_agencia
from agencias