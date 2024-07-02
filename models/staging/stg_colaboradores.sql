with source as (
      select * from {{ source('banvic_erp', 'colaboradores') }}
),
stg_colaboradores as (
    select
        cast(cod_colaborador as int) as cod_colaborador,
        primeiro_nome,
        ultimo_nome,
        email,
        cpf,
        cast(data_nascimento as date) as data_nascimento,
        endereco,
        cep
    from source
)

select * from stg_colaboradores