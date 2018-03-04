-- *********************************************
-- * Standard SQL generation                   
-- *--------------------------------------------
-- * DB-MAIN version: 9.2.0              
-- * Generator date: Oct 16 2014              
-- * Generation date: Thu Sep 08 13:47:23 2016 
-- * LUN file: F:\Travail\BDD\DDMEG_Modelisation_SQL\Club_oenologie.lun 
-- * Schema: SCHEMA/SQL 
-- ********************************************* 


-- Database Section
-- ________________ 

create database SCHEMA;


-- DBSpace Section
-- _______________


-- Tables Section
-- _____________ 

create table BUVEUR (
     ID_BUV -- Sequence attribute not implemented -- not null,
     id numeric(100) not null,
     nom varchar(50) not null,
     prenom varchar(50) not null,
     naissance numeric(4) not null,
     ville varchar(50) not null,
     constraint ID_ID primary key (ID_BUV));

create table CEPAGE (
     id numeric(2) not null,
     nom varchar(50) not null,
     ID_VIN numeric(10) not null);

create table R (
     ID_BUV numeric(10) not null,
     R_V_ID_VIN numeric(10) not null,
     id_buveur numeric(100) not null,
     id_vin numeric(100) not null,
     date date not null,
     appreciation numeric(5) not null,
     quantite float(5) not null,
     constraint ID_R_ID primary key (ID_BUV, R_V_ID_VIN));

create table VIN (
     ID_VIN -- Sequence attribute not implemented -- not null,
     id numeric(100) not null,
     cru char(1) not null,
     millesime numeric(4) not null,
     degre float(4) not null,
     id_cepage numeric(2) not null,
     constraint ID_ID primary key (ID_VIN));


-- Constraints Section
-- ___________________ 

alter table BUVEUR add constraint ID_CHK
     check(exists(select * from R
                  where R.ID_BUV = ID_BUV)); 

alter table CEPAGE add constraint FKcepage_principal_FK
     foreign key (ID_VIN)
     references VIN;

alter table R add constraint FKR_VIN_FK
     foreign key (R_V_ID_VIN)
     references VIN;

alter table R add constraint FKR_BUV
     foreign key (ID_BUV)
     references BUVEUR;

alter table VIN add constraint ID_CHK
     check(exists(select * from R
                  where R.R_V_ID_VIN = ID_VIN)); 


-- Index Section
-- _____________ 

create unique index ID_IND
     on BUVEUR (ID_BUV);

create index FKcepage_principal_IND
     on CEPAGE (ID_VIN);

create unique index ID_R_IND
     on R (ID_BUV, R_V_ID_VIN);

create index FKR_VIN_IND
     on R (R_V_ID_VIN);

create unique index ID_IND
     on VIN (ID_VIN);

