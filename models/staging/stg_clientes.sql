with source as (
      select * from {{ source('banvic_erp', 'clientes') }}
),
stg_clientes as (
    select
        cast(cod_cliente as int) as cod_cliente,
        primeiro_nome,
        ultimo_nome,
        email,
        tipo_cliente,
        cast(data_inclusao as timestamp) as data_inclusao,
        cpfcnpj,
        cast(data_nascimento as date) as data_nascimento,
        endereco,
        cep
    from source
)
select * from stg_clientes