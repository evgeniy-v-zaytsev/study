with geo_info as
(
    select 
        ci.name city_name
        ,ci.region city_region
        ,co.name country_name
        ,co.region country_region
        ,co.continent country_continent
        ,co.id_country
        ,ci.id_city
    from 
        core.det_city ci
    inner join 
        core.det_country co
    on 
        co.id_country = ci.id_country
    where getdate() >= ci.dfrom
        and getdate() < ci.dto
)
--Собрать информацию по субъектам (ФЛ и ЮЛ)
select 
    s.full_name
    ,s.organization_name
    ,s.subject_type
    ,s.date_birth
    ,s.date_death
    ,s.sex
    ,s.id_city_birth
    ,s.id_city_organization
    ,s.rec_state -- Показать статус записи, если вдруг субъектам удален, а в лауреатах он есть
    ,nl.dfrom year
    ,nl.category 
    ,nl.prize
    ,nl.motivation
    ,nl.dividend -- Делимое из поля Prize Share
    ,nl.divisor -- Делитель из поля Prize Share
    ,gi.city_name
    ,gi.city_region
    ,gi.country_name
    ,gi.country_region
    ,gi.country_continent
    ,fci.population
    ,fci.area
    ,fci.net_migration
    ,fci.infant_mortality
    ,fci.birthrate
    ,fci.deathrate
    ,fci.agriculture
    ,fci.industry
    ,fci.service
    ,fci.literacy
    ,fci.crops
from 
    core.det_subject s
inner join 
    core.fct_nobel_laureat nl
on 
    s.id_subject = nl.id_subject
inner join 
    geo_info gi
on 
    gi.id_city = coalesce(s.id_city_birth, s.id_city_organization)        
left join 
    core.fct_country_info fci
on 
    fci.id_country = gi.id_country
    /*ниже условие отбирает информацию по странам на дату вручения премии*/
    and nl.dfrom >= fci.dfrom
    and nl.dfrom < fci.dto 
where getdate() >= s.dfrom
    and getdate() < s.dto
