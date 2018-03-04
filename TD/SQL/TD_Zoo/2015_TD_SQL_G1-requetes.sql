--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.10
-- Dumped by pg_dump version 9.3.10
-- Started on 2015-10-19 00:15:11 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 182 (class 3079 OID 11797)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2064 (class 0 OID 0)
-- Dependencies: 182
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 21575)
-- Name: ALIMENT; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ALIMENT" (
    code_aliment integer NOT NULL,
    nom character(50) NOT NULL,
    stock integer
);


ALTER TABLE public."ALIMENT" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 21578)
-- Name: ALI_SUBSTITUTION; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ALI_SUBSTITUTION" (
    code_aliment integer NOT NULL,
    code_substitution integer NOT NULL,
    taux real NOT NULL
);


ALTER TABLE public."ALI_SUBSTITUTION" OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 21581)
-- Name: ANIMAL; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ANIMAL" (
    code_animal integer NOT NULL,
    nom character(50) NOT NULL,
    sexe "char" NOT NULL,
    date_naissance date,
    date_arrivee date NOT NULL,
    remarques text,
    code_enclos integer,
    code_espece integer,
    CONSTRAINT verif_date CHECK (('date_naissance'::text > 'date_arrivee'::text))
);


ALTER TABLE public."ANIMAL" OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 21588)
-- Name: Aliments_codeAliment_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Aliments_codeAliment_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Aliments_codeAliment_seq" OWNER TO postgres;

--
-- TOC entry 2065 (class 0 OID 0)
-- Dependencies: 173
-- Name: Aliments_codeAliment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Aliments_codeAliment_seq" OWNED BY "ALIMENT".code_aliment;


--
-- TOC entry 174 (class 1259 OID 21590)
-- Name: Animal_codeAnimal_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Animal_codeAnimal_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Animal_codeAnimal_seq" OWNER TO postgres;

--
-- TOC entry 2066 (class 0 OID 0)
-- Dependencies: 174
-- Name: Animal_codeAnimal_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Animal_codeAnimal_seq" OWNED BY "ANIMAL".code_animal;


--
-- TOC entry 175 (class 1259 OID 21592)
-- Name: ENCLOS; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ENCLOS" (
    code_enclos integer NOT NULL,
    situation text
);


ALTER TABLE public."ENCLOS" OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 21598)
-- Name: ESPECE; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ESPECE" (
    code_espece integer NOT NULL,
    nom_scientifique character(50) NOT NULL,
    nom character(50),
    population integer
);


ALTER TABLE public."ESPECE" OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 21601)
-- Name: ESP_ALI; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ESP_ALI" (
    code_espece integer NOT NULL,
    code_aliment integer NOT NULL,
    quantite integer NOT NULL
);


ALTER TABLE public."ESP_ALI" OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 21604)
-- Name: ESP_ZONEGEO; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ESP_ZONEGEO" (
    code_espece integer NOT NULL,
    code_zone integer NOT NULL,
    effectif integer
);


ALTER TABLE public."ESP_ZONEGEO" OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 21607)
-- Name: Espece_codeEspece_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Espece_codeEspece_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Espece_codeEspece_seq" OWNER TO postgres;

--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 179
-- Name: Espece_codeEspece_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Espece_codeEspece_seq" OWNED BY "ESPECE".code_espece;


--
-- TOC entry 180 (class 1259 OID 21609)
-- Name: ZONE_GEOGRAPHIQUE; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "ZONE_GEOGRAPHIQUE" (
    code_zone integer NOT NULL,
    pays character(50) NOT NULL
);


ALTER TABLE public."ZONE_GEOGRAPHIQUE" OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 21612)
-- Name: zoneGeographiques_codeZone_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "zoneGeographiques_codeZone_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."zoneGeographiques_codeZone_seq" OWNER TO postgres;

--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 181
-- Name: zoneGeographiques_codeZone_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "zoneGeographiques_codeZone_seq" OWNED BY "ZONE_GEOGRAPHIQUE".code_zone;


--
-- TOC entry 1905 (class 2604 OID 21614)
-- Name: code_aliment; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ALIMENT" ALTER COLUMN code_aliment SET DEFAULT nextval('"Aliments_codeAliment_seq"'::regclass);


--
-- TOC entry 1906 (class 2604 OID 21615)
-- Name: code_animal; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ANIMAL" ALTER COLUMN code_animal SET DEFAULT nextval('"Animal_codeAnimal_seq"'::regclass);


--
-- TOC entry 1908 (class 2604 OID 21616)
-- Name: code_espece; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ESPECE" ALTER COLUMN code_espece SET DEFAULT nextval('"Espece_codeEspece_seq"'::regclass);


--
-- TOC entry 1909 (class 2604 OID 21617)
-- Name: code_zone; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ZONE_GEOGRAPHIQUE" ALTER COLUMN code_zone SET DEFAULT nextval('"zoneGeographiques_codeZone_seq"'::regclass);


--
-- TOC entry 2045 (class 0 OID 21575)
-- Dependencies: 170
-- Data for Name: ALIMENT; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ALIMENT" (code_aliment, nom, stock) FROM stdin;
1	Blé                                               	100
2	Foin                                              	75
3	Herbe                                             	450
4	Poisson                                           	47
6	Bambou                                            	79
7	Insectes                                          	13
8	Viande                                            	27
9	Carcasse animale                                  	50
11	Carottes                                          	30
10	Baies                                             	0
5	Bananes                                           	0
\.


--
-- TOC entry 2046 (class 0 OID 21578)
-- Dependencies: 171
-- Data for Name: ALI_SUBSTITUTION; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ALI_SUBSTITUTION" (code_aliment, code_substitution, taux) FROM stdin;
1	2	1
1	3	2
2	1	1
3	1	0.5
5	10	5
6	1	4
7	9	0.300000012
8	9	3.5
9	8	0.5
8	4	1
10	5	0.5
\.


--
-- TOC entry 2047 (class 0 OID 21581)
-- Dependencies: 172
-- Data for Name: ANIMAL; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ANIMAL" (code_animal, nom, sexe, date_naissance, date_arrivee, remarques, code_enclos, code_espece) FROM stdin;
1	Balou                                             	M	2010-01-01	2010-10-10	\N	1	2
6	Zira                                              	F	2000-01-01	2005-03-04	\N	4	6
7	Java                                              	F	2005-05-04	2015-06-12	\N	4	6
5	Croci                                             	F	2000-08-20	2009-09-26	\N	2	1
4	Croco                                             	M	1997-01-01	2012-05-20	\N	2	1
3	Grandepate                                        	F	1990-01-01	2002-01-10	\N	2	4
2	Grancou                                           	M	1994-07-04	2004-12-14	n'aime pas trop les crocodiles	2	4
8	Charly                                            	M	1997-04-18	2008-08-10	\N	1	2
9	Tintin                                            	M	2000-10-25	2003-01-03	\N	1	2
10	Milou                                             	M	2005-04-04	2004-03-18	\N	1	2
11	Charlotte                                         	F	2008-09-05	2010-09-10	\N	3	3
12	Rosa                                              	F	2007-12-02	2010-09-10	\N	3	3
13	Fredi                                             	M	2007-12-02	2010-09-10	\N	3	3
14	Arthur                                            	M	2004-03-25	2008-01-15	\N	3	3
15	Marine                                            	F	2003-10-14	2008-01-15	\N	3	3
16	Nina                                              	F	2009-09-01	2010-08-23	\N	5	5
22	Alfred                                            	M	2008-10-24	2010-08-23	\N	5	5
23	Chloé                                             	F	2014-06-20	2014-06-20	\N	5	5
24	Minigrand                                         	F	2012-10-02	2008-10-05	\N	2	4
\.


--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 173
-- Name: Aliments_codeAliment_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Aliments_codeAliment_seq"', 11, true);


--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 174
-- Name: Animal_codeAnimal_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Animal_codeAnimal_seq"', 24, true);


--
-- TOC entry 2050 (class 0 OID 21592)
-- Dependencies: 175
-- Data for Name: ENCLOS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ENCLOS" (code_enclos, situation) FROM stdin;
1	Allée principale - n°1
2	Allée principale - n°2
3	Allée principale - n°4
4	Allée est-ouest - Au fond du parc
5	Allée est-ouest - Partie centrale
6	Aquarium
\.


--
-- TOC entry 2051 (class 0 OID 21598)
-- Dependencies: 176
-- Data for Name: ESPECE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ESPECE" (code_espece, nom_scientifique, nom, population) FROM stdin;
1	Crocodylus niloticus                              	Crocodile                                         	\N
2	Loxodonta africana                                	Elephant                                          	600000
3	Phoenicopterus ruber                              	Flamant rose                                      	100000
4	Giraffa camelopardalis                            	Girafe                                            	140000
5	Panthera tigris                                   	Tigre                                             	3200
6	Ailuropoda melanoleuca                            	Panda                                             	2000
7	Panthera Leo                                      	Lion                                              	25000
\.


--
-- TOC entry 2052 (class 0 OID 21601)
-- Dependencies: 177
-- Data for Name: ESP_ALI; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ESP_ALI" (code_espece, code_aliment, quantite) FROM stdin;
4	10	1
4	3	2
1	8	5
6	6	15
2	2	5
2	3	5
5	8	2
5	9	5
3	4	1
\.


--
-- TOC entry 2053 (class 0 OID 21604)
-- Dependencies: 178
-- Data for Name: ESP_ZONEGEO; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ESP_ZONEGEO" (code_espece, code_zone, effectif) FROM stdin;
2	3	500000
2	4	80000
4	3	140000
5	3	2000
5	4	1000
5	2	1000
6	2	2000
3	1	50000
\.


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 179
-- Name: Espece_codeEspece_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Espece_codeEspece_seq"', 7, true);


--
-- TOC entry 2055 (class 0 OID 21609)
-- Dependencies: 180
-- Data for Name: ZONE_GEOGRAPHIQUE; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "ZONE_GEOGRAPHIQUE" (code_zone, pays) FROM stdin;
1	France                                            
2	Chine                                             
4	Inde                                              
3	Savane africaine                                  
\.


--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 181
-- Name: zoneGeographiques_codeZone_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"zoneGeographiques_codeZone_seq"', 4, true);


--
-- TOC entry 1911 (class 2606 OID 21619)
-- Name: code_aliment_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ALIMENT"
    ADD CONSTRAINT code_aliment_cle_primaire PRIMARY KEY (code_aliment);


--
-- TOC entry 1915 (class 2606 OID 21621)
-- Name: code_animal_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ANIMAL"
    ADD CONSTRAINT code_animal_cle_primaire PRIMARY KEY (code_animal);


--
-- TOC entry 1919 (class 2606 OID 21623)
-- Name: code_enclos_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ENCLOS"
    ADD CONSTRAINT code_enclos_cle_primaire PRIMARY KEY (code_enclos);


--
-- TOC entry 1921 (class 2606 OID 21625)
-- Name: code_espece_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ESPECE"
    ADD CONSTRAINT code_espece_cle_primaire PRIMARY KEY (code_espece);


--
-- TOC entry 1929 (class 2606 OID 21627)
-- Name: code_zone_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ZONE_GEOGRAPHIQUE"
    ADD CONSTRAINT code_zone_cle_primaire PRIMARY KEY (code_zone);


--
-- TOC entry 1923 (class 2606 OID 21629)
-- Name: esp_ali_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ESP_ALI"
    ADD CONSTRAINT esp_ali_cle_primaire PRIMARY KEY (code_espece, code_aliment);


--
-- TOC entry 1926 (class 2606 OID 21631)
-- Name: esp_zonegeo_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ESP_ZONEGEO"
    ADD CONSTRAINT esp_zonegeo_cle_primaire PRIMARY KEY (code_espece, code_zone);


--
-- TOC entry 1913 (class 2606 OID 21633)
-- Name: substitution_cle_primaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "ALI_SUBSTITUTION"
    ADD CONSTRAINT substitution_cle_primaire PRIMARY KEY (code_aliment, code_substitution);


--
-- TOC entry 1924 (class 1259 OID 21634)
-- Name: fki_code_aliment_cle_etrangere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_code_aliment_cle_etrangere ON "ESP_ALI" USING btree (code_aliment);


--
-- TOC entry 1916 (class 1259 OID 21635)
-- Name: fki_code_enclos_cle_etrangere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_code_enclos_cle_etrangere ON "ANIMAL" USING btree (code_enclos);


--
-- TOC entry 1917 (class 1259 OID 21636)
-- Name: fki_code_espece_cle_etrangere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_code_espece_cle_etrangere ON "ANIMAL" USING btree (code_espece);


--
-- TOC entry 1927 (class 1259 OID 21637)
-- Name: fki_code_zone_cle_etrangere; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX fki_code_zone_cle_etrangere ON "ESP_ZONEGEO" USING btree (code_zone);


--
-- TOC entry 1934 (class 2606 OID 21638)
-- Name: code_aliment_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ESP_ALI"
    ADD CONSTRAINT code_aliment_cle_etrangere FOREIGN KEY (code_aliment) REFERENCES "ALIMENT"(code_aliment);


--
-- TOC entry 1930 (class 2606 OID 21643)
-- Name: code_aliment_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ALI_SUBSTITUTION"
    ADD CONSTRAINT code_aliment_cle_etrangere FOREIGN KEY (code_aliment) REFERENCES "ALIMENT"(code_aliment);


--
-- TOC entry 1932 (class 2606 OID 21648)
-- Name: code_enclos_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ANIMAL"
    ADD CONSTRAINT code_enclos_cle_etrangere FOREIGN KEY (code_enclos) REFERENCES "ENCLOS"(code_enclos);


--
-- TOC entry 1935 (class 2606 OID 21653)
-- Name: code_espece_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ESP_ALI"
    ADD CONSTRAINT code_espece_cle_etrangere FOREIGN KEY (code_espece) REFERENCES "ESPECE"(code_espece);


--
-- TOC entry 1936 (class 2606 OID 21658)
-- Name: code_espece_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ESP_ZONEGEO"
    ADD CONSTRAINT code_espece_cle_etrangere FOREIGN KEY (code_espece) REFERENCES "ESPECE"(code_espece);


--
-- TOC entry 1933 (class 2606 OID 21663)
-- Name: code_espece_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ANIMAL"
    ADD CONSTRAINT code_espece_cle_etrangere FOREIGN KEY (code_espece) REFERENCES "ESPECE"(code_espece);


--
-- TOC entry 1931 (class 2606 OID 21668)
-- Name: code_substitution_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ALI_SUBSTITUTION"
    ADD CONSTRAINT code_substitution_cle_etrangere FOREIGN KEY (code_substitution) REFERENCES "ALIMENT"(code_aliment);


--
-- TOC entry 1937 (class 2606 OID 21673)
-- Name: code_zone_cle_etrangere; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "ESP_ZONEGEO"
    ADD CONSTRAINT code_zone_cle_etrangere FOREIGN KEY (code_zone) REFERENCES "ZONE_GEOGRAPHIQUE"(code_zone);


--
-- TOC entry 2063 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-10-19 00:15:11 CEST

--
-- PostgreSQL database dump complete
--

