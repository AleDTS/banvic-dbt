with date_array_1 as(
    select
        data_dia,
        extract(year from data_dia) as ano,
        extract(month from data_dia) as mes,
        format_date('%B', data_dia) as mes_nome,
        extract(day from data_dia) as dia,
        extract(quarter from data_dia) as trimestre,
        cast(floor((extract(month from data_dia) - 1) / 6) + 1 as int64) as semestre,
        extract(dayofweek from data_dia) as dia_semana,
        extract(week from data_dia) as semana_ano,
        case when extract(dayofweek from data_dia) in (6, 7) then true else false end as final_semana,
        case when extract(day from data_dia) <= 15 then false else true end as fim_do_mes,
        format_date('%A', data_dia) as dia_nome,
        case
            when extract(month from data_dia) <= 3 then 'Q1'
            when extract(month from data_dia) <= 6 then 'Q2'
            when extract(month from data_dia) <= 9 then 'Q3'
            else 'Q4'
        end as quartil,
        format_date('%Y-%m', data_dia) as ano_mes,
        case
            when format_date('%A', data_dia) = 'Monday' then 'Segunda'
            when format_date('%A', data_dia) = 'Tuesday' then 'Terça'
            when format_date('%A', data_dia) = 'Wednesday' then 'Quarta'
            when format_date('%A', data_dia) = 'Thursday' then 'Quinta'
            when format_date('%A', data_dia) = 'Friday' then 'Sexta'
            when format_date('%A', data_dia) = 'Saturday' then 'Sábado'
            else 'Domingo'
        end as dia_semana_pt,
        case
            when data_dia < date('2020-11-16') then false
            else true
        end as pix_lancado
    from
        unnest(generate_date_array(date('2010-01-01'), date('2099-12-31'), interval 1 day)) as data_dia
)

select
    *,
    count(data_dia) over (partition by ano, mes) as total_dias_mes,
    (ano || '.' || quartil) as ano_quartil
from date_array_1