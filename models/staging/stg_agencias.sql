with source as (
    select * from {{ source('banvic_erp', 'agencias') }}
),

stg_agencias as (
    select
        cast(cod_agencia as int) as cod_agencia,
        nome,
        endereco,
        cidade,
        uf,
        cast(data_abertura as date) as data_abertura,
        tipo_agencia
    from source
)

select * from stg_agencias