create table raw.raw_mysql_cities (
    Country	varchar(255)
    ,City	varchar(255)
    ,AccentCity	varchar(255)
    ,Region	varchar(255)
    ,Population	decimal(10,0)
    ,Latitude	decimal(10,0)
    ,Longitude	decimal(10,0)
)

create table raw.raw_json_country_continent (
    Country	varchar(255)
    ,Continent	varchar(255)
)

create table raw.raw_json_country_currency (
    Country	varchar(255)
    ,currency	varchar(255)
)

create table raw.raw_json_country_iso3 (
    Country	varchar(255)
    ,iso3code	varchar(255)
)

create table raw.raw_json_country_names (
    Country	varchar(255)
    ,Country_Name	varchar(255)
)

create table raw.raw_json_country_phone (
    Country	varchar(255)
    ,phone_code	varchar(255)
)


create table raw.raw_csv_countries_of_the_world
(
    Country varchar(255)
    ,Region varchar(255)
    ,population int
    ,area int
    ,pop_density float
    ,coastline float
    ,net_migration float
    ,infant_mortality float
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
)


create table raw.raw_csv_nobel_laureates
(
    Year int
    ,Category varchar(max)
    ,Prize varchar(max)
    ,Motivation varchar(max)
    ,Prize_Share varchar(max)
    ,Laureate_ID int 
    ,Laureate_Type varchar(50)
    ,Full_Name varchar(50)
    ,Birth_Date date
    ,Birth_City  varchar(255)
    ,Birth_Country varchar(255)
    ,Sex varchar(255)
    ,Organization_Name varchar(max)
    ,Organization_City varchar(255)
    ,Organization_Country varchar(255)
    ,Death_Date date
    ,Death_City varchar(255)
    ,Death_Country varchar(255)
)