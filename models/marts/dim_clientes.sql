with clientes as (
    select * from {{ ref('int_clientes') }}
)

select
    cod_cliente,
    nome_cliente,
    email_cliente,
    tipo_cliente,
    data_inclusao_cliente,
    cpfcnpj_cliente,
    data_nascimento_cliente,
    endereco_cliente,
    cep_cliente,
    meses_na_base_cliente,
    idade_cliente,
    case
        when idade_cliente < 25 then '0-24'
        when idade_cliente between 25 and 34 then '25-34'
        when idade_cliente between 35 and 44 then '35-44'
        when idade_cliente between 45 and 54 then '45-54'
        when idade_cliente between 55 and 64 then '55-64'
        else '65+'
    end as faixa_etaria_cliente
from clientes