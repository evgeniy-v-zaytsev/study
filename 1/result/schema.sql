-- Таблицы для генерации суррогатных UID
-- code имеет длину varchar(255), т.к. может быть составным.
create table core.bdet_country
(
   id_country int identity(1,1) primary key
   ,code varchar(255)
   ,dt_insert datetime
)
create unique index UIX_bdet_country on core.bdet_country (code)
create table core.bdet_city
(
   id_city int identity(1,1)  primary key
   ,code varchar(255)
   ,dt_insert datetime
)
create unique index UIX_bdet_city on core.bdet_city (code)
create table core.bdet_people
(
    id_people int identity(1,1)
    ,code varchar(255)
    ,dt_insert datetime
)
create unique index UIX_bdet_people on core.bdet_people (code)
/*
**********************************
************ Схема BI ************
**********************************
*/

create table core.det_people
(
    id_people int -- ссылка на core.bdet_people
    ,dfrom date
    ,dto date default ('9999-12-31')
)

create table core.det_country
(
    id_country int -- ссылка на core.bdet_country
    ,dfrom date
    ,dto date default ('9999-12-31')
    ,code varchar(2) 
    ,name varchar(255)
    ,iso_code varchar(3)
    ,currency varchar(3)
    ,phone_code varchar(50)
    ,continent  varchar(2)
    ,region varchar(255)
    ,dt_insert datetime
    ,dt_update datetime
    ,rec_state char(1)
)
create unique index UIX_det_country on core.det_country (id_country, dfrom)

create table core.fct_country_info
(
    id_country int -- ссылка на core.bdet_country
    ,dfrom date
    ,population int
    ,area int
    ,pop_density float
    ,coastline float
    ,net_migration float
    ,Infant mortality float
    ,gdp float
    ,literacy float
    ,phones float
    ,arable float
    ,crops float
    ,other float
    ,climate float
    ,birthrate float
    ,deathrate float
    ,agriculture float
    ,industry float
    ,service float
    ,dt_insert datetime
    ,dt_update datetime
    ,rec_state char(1)
)
create unique index UIX_fct_country_info on core.fct_country_info (id_country, dfrom)

create table core.det_city
(
    id_city int not null -- ссылка на core.bdet_city
    ,dfrom date
    ,dto date default ('9999-12-31')
    ,id_country int -- ссылка на core.bdet_country
    ,name  varchar(255)
    ,accent_name nvarchar(255)
    ,region varchar(255)
    ,latitude Decimal(8,6)
    ,longitude Decimal(9,6)
    ,dt_insert datetime
    ,dt_update datetime
    ,rec_state char(1)
)
create unique index UIX_det_city on core.det_city (id_city, dfrom)


create table core.fct_city_info
(
    id_city int -- ссылка на core.bdet_city
    ,dfrom date
    ,population float
    ,dt_insert datetime
    ,dt_update datetime
    ,rec_state char(1)
)
create unique index UIX_fct_city_info on core.fct_city_info (id_country, dfrom)