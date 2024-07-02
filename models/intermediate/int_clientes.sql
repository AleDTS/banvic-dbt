with clientes as (
    select * from {{ ref('stg_clientes') }}
)

select
    cod_cliente,
    concat(primeiro_nome, ' ', ultimo_nome) as nome_cliente,
    email as email_cliente,
    tipo_cliente,
    data_inclusao as data_inclusao_cliente,
    cpfcnpj as cpfcnpj_cliente,
    data_nascimento as data_nascimento_cliente,
    endereco as endereco_cliente,
    cep as cep_cliente,
    date_diff(date(data_inclusao), date('{{ var("data_atual") }}'), month) as meses_na_base_cliente,
    date_diff(date('{{ var("data_atual") }}'), date(data_nascimento), year) as idade_cliente
from clientes