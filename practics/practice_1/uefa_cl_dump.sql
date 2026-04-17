--
-- PostgreSQL database dump
--

\restrict eWJ2gLJDPIjThrZpuWk5CntnIwpYsdIGon3vPBqldaqLw2ZdEyUB7okNydNjBTj

-- Dumped from database version 14.10
-- Dumped by pg_dump version 16.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: goals; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.goals (
    "GOAL_ID" character varying(20) NOT NULL,
    "MATCH_ID" character varying(20),
    "PID" character varying(20),
    "DURATION" integer,
    "ASSIST" character varying(200),
    "GOAL_DESC" text
);


ALTER TABLE public.goals OWNER TO mpi;

--
-- Name: managers; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.managers (
    "MANAGER_ID" integer NOT NULL,
    "FIRST_NAME" character varying(100),
    "LAST_NAME" character varying(100),
    "NATIONALITY" character varying(100),
    "DOB" timestamp without time zone,
    "TEAM" character varying(100)
);


ALTER TABLE public.managers OWNER TO mpi;

--
-- Name: managers_MANAGER_ID_seq; Type: SEQUENCE; Schema: public; Owner: mpi
--

CREATE SEQUENCE public."managers_MANAGER_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."managers_MANAGER_ID_seq" OWNER TO mpi;

--
-- Name: managers_MANAGER_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mpi
--

ALTER SEQUENCE public."managers_MANAGER_ID_seq" OWNED BY public.managers."MANAGER_ID";


--
-- Name: matches; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.matches (
    "MATCH_ID" character varying(20) NOT NULL,
    "SEASON" character varying(20),
    "DATE_TIME" timestamp without time zone,
    "HOME_TEAM" character varying(100),
    "AWAY_TEAM" character varying(100),
    "STADIUM" character varying(100),
    "STADIUM_CITY" character varying(100),
    "HOME_TEAM_SCORE" integer,
    "AWAY_TEAM_SCORE" integer,
    "PENALTY_SHOOT_OUT" integer,
    "ATTENDANCE" integer
);


ALTER TABLE public.matches OWNER TO mpi;

--
-- Name: players; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.players (
    "PLAYER_ID" character varying(20) NOT NULL,
    "FIRST_NAME" character varying(100),
    "LAST_NAME" character varying(100),
    "NATIONALITY" character varying(100),
    "DOB" timestamp without time zone,
    "TEAM" character varying(100),
    "JERSEY_NUMBER" integer,
    "POSITION" character varying(50),
    "HEIGHT" integer,
    "WEIGHT" integer,
    "FOOT" character varying(5)
);


ALTER TABLE public.players OWNER TO mpi;

--
-- Name: stadiums; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.stadiums (
    "NAME" character varying(100) NOT NULL,
    "CITY" character varying(100) NOT NULL,
    "COUNTRY" character varying(100),
    "CAPACITY" integer
);


ALTER TABLE public.stadiums OWNER TO mpi;

--
-- Name: teams; Type: TABLE; Schema: public; Owner: mpi
--

CREATE TABLE public.teams (
    "TEAM_NAME" character varying(100) NOT NULL,
    "COUNTRY" character varying(100),
    "HOME_STADIUM" character varying(100),
    "STADIUM_CITY" character varying(100)
);


ALTER TABLE public.teams OWNER TO mpi;

--
-- Name: managers MANAGER_ID; Type: DEFAULT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.managers ALTER COLUMN "MANAGER_ID" SET DEFAULT nextval('public."managers_MANAGER_ID_seq"'::regclass);


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.goals ("GOAL_ID", "MATCH_ID", "PID", "DURATION", "ASSIST", "GOAL_DESC") FROM stdin;
gl470	mt154	ply1479	4	ply864	right-footed shot
gl471	mt154	ply1075	28	ply864	penalty
gl472	mt154	ply585	69	ply864	right-footed shot
gl473	mt155	ply396	12	ply653	right-footed shot
gl474	mt155	ply1064	81	ply653	right-footed shot
gl475	mt155	ply644	90	ply982	left-footed shot
gl476	mt156	ply654	36	ply293	left-footed shot
gl477	mt157	ply413	39	\N	left-footed shot
gl478	mt157	ply1075	72	ply1479	penalty
gl479	mt159	ply1480	33	ply1401	left-footed shot
gl480	mt159	ply1422	55	ply1481	penalty
gl481	mt159	ply1422	75	\N	penalty
gl482	mt160	ply396	48	ply664	right-footed shot
gl483	mt160	\N	77	\N	right-footed shot
gl484	mt160	ply1482	90	\N	own goal
gl485	mt161	ply422	10	\N	penalty
gl486	mt161	ply424	77	ply585	right-footed shot
gl487	mt162	ply1078	35	\N	own goal
gl488	mt163	ply87	26	ply1483	right-footed shot
gl489	mt163	ply855	36	ply87	right-footed shot
gl490	mt163	ply86	42	\N	right-footed shot
gl491	mt163	ply1096	88	ply1100	left-footed shot
gl492	mt164	ply60	30	ply902	penalty
gl493	mt164	ply902	38	ply928	right-footed shot
gl494	mt164	ply87	54	ply855	header
gl495	mt164	ply87	60	ply81	right-footed shot
gl496	mt165	ply586	55	ply564	right-footed shot
gl497	mt165	ply590	90	\N	penalty
gl498	mt166	ply586	16	ply564	left-footed shot
gl499	mt166	ply586	33	ply567	right-footed shot
gl500	mt166	ply590	47	\N	left-footed shot
gl501	mt166	ply142	49	ply590	left-footed shot
gl502	mt166	ply586	54	ply142	left-footed shot
gl503	mt167	ply698	1	ply60	left-footed shot
gl504	mt167	ply60	13	ply1484	left-footed shot
gl505	mt167	ply1182	18	ply1485	left-footed shot
gl506	mt168	ply134	47	ply60	right-footed shot
gl507	mt168	ply128	49	ply60	right-footed shot
gl508	mt168	ply928	66	ply902	left-footed shot
gl509	mt168	ply1486	80	ply1486	penalty
gl510	mt169	ply1100	60	ply855	right-footed shot
gl511	mt169	ply493	64	ply68	left-footed shot
gl512	mt170	ply1487	13	ply1184	right-footed shot
gl513	mt170	ply1483	79	ply68	header
gl514	mt171	ply579	58	ply1488	right-footed shot
gl515	mt172	ply86	85	ply1095	left-footed shot
gl516	mt173	ply590	1	\N	right-footed shot
gl517	mt173	ply1487	62	ply1182	penalty
gl518	mt175	ply1489	56	ply1460	penalty
gl519	mt175	ply1234	59	ply1490	left-footed shot
gl520	mt176	ply1114	37	ply283	left-footed shot
gl521	mt176	ply767	76	\N	penalty
gl522	mt176	ply294	79	ply767	left-footed shot
gl523	mt176	ply292	90	ply1491	right-footed shot
gl524	mt177	ply1492	55	ply843	right-footed shot
gl525	mt178	ply767	10	ply767	penalty
gl526	mt178	ply767	41	\N	penalty
gl527	mt178	ply1491	50	ply277	left-footed shot
gl528	mt179	ply1493	17	\N	free kick
gl529	mt179	ply1494	21	ply1494	penalty
gl530	mt179	ply863	42	ply859	header
gl531	mt179	ply866	69	\N	left-footed shot
gl532	mt179	ply866	72	ply863	right-footed shot
gl533	mt180	ply1114	22	ply288	right-footed shot
gl534	mt180	ply1489	85	ply1447	header
gl535	mt180	ply26	90	ply767	header
gl536	mt181	ply863	4	\N	right-footed shot
gl537	mt181	ply1495	56	ply1179	right-footed shot
gl538	mt181	ply1496	90	ply866	right-footed shot
gl539	mt182	ply1494	71	ply1497	right-footed shot
gl540	mt183	ply26	8	ply283	left-footed shot
gl541	mt183	ply26	54	ply286	right-footed shot
gl542	mt183	ply26	74	ply285	header
gl543	mt183	ply26	83	\N	penalty
gl544	mt184	ply547	24	ply1498	right-footed shot
gl545	mt184	ply284	28	\N	penalty
gl546	mt185	ply382	32	ply1499	right-footed shot
gl547	mt185	ply866	45	ply861	header
gl548	mt185	ply866	81	ply1500	left-footed shot
gl549	mt185	ply1501	86	\N	penalty
gl550	mt186	ply1502	63	\N	left-footed shot
gl551	mt186	ply1503	74	\N	own goal
gl552	mt186	ply21	90	ply323	left-footed shot
gl553	mt187	ply1325	6	ply496	left-footed shot
gl554	mt187	ply1504	23	\N	own goal
gl555	mt187	ply662	71	ply217	left-footed shot
gl556	mt187	ply1505	76	ply1325	left-footed shot
gl557	mt188	ply705	78	ply212	penalty
gl558	mt188	ply662	90	ply207	left-footed shot
gl559	mt189	ply496	14	ply1308	left-footed shot
gl560	mt189	ply322	42	ply320	penalty
gl561	mt190	ply1050	32	ply1116	right-footed shot
gl562	mt190	ply1506	82	ply474	left-footed shot
gl563	mt191	ply212	14	\N	left-footed shot
gl564	mt191	ply662	18	\N	right-footed shot
gl565	mt191	ply662	32	ply201	left-footed shot
gl566	mt192	ply662	18	ply705	left-footed shot
gl567	mt192	ply705	45	\N	free kick
gl568	mt192	ply662	60	\N	left-footed shot
gl569	mt193	ply1325	3	ply1507	right-footed shot
gl570	mt193	\N	22	ply496	right-footed shot
gl571	mt193	ply1116	25	ply1111	left-footed shot
gl572	mt193	ply1325	55	ply1325	penalty
gl573	mt194	ply198	44	ply212	left-footed shot
gl574	mt194	ply1325	67	\N	penalty
gl575	mt195	ply21	33	\N	left-footed shot
gl576	mt195	ply322	58	\N	penalty
gl577	mt195	ply327	73	ply1502	right-footed shot
gl578	mt196	ply1508	16	ply1062	right-footed shot
gl579	mt196	\N	68	\N	right-footed shot
gl580	mt196	ply105	78	ply705	right-footed shot
gl581	mt197	ply496	12	ply1317	right-footed shot
gl582	mt197	ply323	15	ply327	right-footed shot
gl583	mt197	ply1325	27	\N	penalty
gl584	mt197	ply322	76	ply323	header
gl585	mt198	ply118	46	\N	left-footed shot
gl586	mt198	ply118	84	ply509	header
gl587	mt199	ply740	27	ply740	penalty
gl588	mt199	ply395	42	ply386	right-footed shot
gl589	mt199	ply1509	52	ply395	right-footed shot
gl590	mt199	ply1510	70	ply1218	penalty
gl591	mt199	ply391	82	ply393	right-footed shot
gl592	mt199	ply393	89	ply740	right-footed shot
gl593	mt200	ply364	28	\N	penalty
gl594	mt200	ply1511	41	ply353	left-footed shot
gl595	mt200	ply1218	59	ply895	right-footed shot
gl596	mt200	ply1214	90	ply1207	right-footed shot
gl597	mt201	ply393	14	ply740	right-footed shot
gl598	mt201	ply740	90	ply395	penalty
gl599	mt202	ply740	5	ply740	penalty
gl600	mt202	ply384	65	ply395	header
gl601	mt202	ply364	75	\N	left-footed shot
gl602	mt203	ply118	7	ply509	left-footed shot
gl603	mt203	ply118	60	ply699	right-footed shot
gl604	mt203	ply1110	73	\N	left-footed shot
gl605	mt203	ply1512	82	\N	own goal
gl606	mt203	ply1214	90	\N	right-footed shot
gl607	mt204	ply9	52	ply1513	right-footed shot
gl608	mt204	ply1513	57	ply1514	right-footed shot
gl609	mt204	ply1513	70	ply1513	penalty
gl610	mt204	ply115	90	ply381	left-footed shot
gl611	mt205	ply1515	19	ply1218	\N
gl612	mt205	ply699	35	ply509	left-footed shot
gl613	mt205	ply118	90	ply509	header
gl614	mt206	ply525	21	ply505	header
gl615	mt206	ply699	57	ply118	right-footed shot
gl616	mt206	ply118	66	ply525	right-footed shot
gl617	mt207	ply115	14	ply381	back heel
gl618	mt207	ply1513	21	ply393	right-footed shot
gl619	mt207	ply393	28	\N	penalty
gl620	mt208	ply347	60	ply1511	header
gl621	mt209	ply699	13	\N	penalty
gl622	mt209	ply519	20	ply509	right-footed shot
gl623	mt209	ply699	52	\N	penalty
gl624	mt210	ply1068	16	ply759	left-footed shot
gl625	mt210	ply1068	20	ply765	left-footed shot
gl626	mt211	ply689	23	\N	penalty
gl627	mt211	ply702	55	\N	own goal
gl628	mt211	ply704	87	ply522	right-footed shot
gl629	mt212	ply529	64	ply739	header
gl630	mt212	ply529	79	ply739	left-footed shot
gl631	mt213	ply701	21	ply522	left-footed shot
gl632	mt213	ply704	74	ply689	right-footed shot
gl633	mt213	ply704	78	ply692	right-footed shot
gl634	mt213	ply702	87	ply702	penalty
gl635	mt213	ply704	90	ply702	right-footed shot
gl636	mt214	\N	13	ply1516	right-footed shot
gl637	mt214	ply1516	40	ply1287	right-footed shot
gl638	mt214	ply702	43	ply684	header
gl639	mt215	ply527	6	ply529	left-footed shot
gl640	mt215	ply765	42	ply1068	right-footed shot
gl641	mt215	ply757	57	\N	penalty
gl642	mt216	ply689	7	\N	right-footed shot
gl643	mt216	ply689	19	\N	left-footed shot
gl644	mt216	ply704	35	ply704	penalty
gl645	mt216	ply1287	75	\N	free kick
gl646	mt216	ply1517	90	ply701	right-footed shot
gl647	mt217	ply741	11	ply527	penalty
gl648	mt218	ply766	26	ply137	right-footed shot
gl649	mt218	ply727	43	ply757	left-footed shot
gl650	mt218	ply1518	45	ply1516	left-footed shot
gl651	mt218	ply756	66	ply1068	right-footed shot
gl652	mt218	ply1518	72	\N	left-footed shot
gl653	mt218	ply1518	85	\N	free kick
gl654	mt218	ply1519	90	ply766	left-footed shot
gl655	mt219	ply741	6	\N	right-footed shot
gl656	mt219	ply704	32	ply687	right-footed shot
gl657	mt219	ply726	69	ply748	right-footed shot
gl658	mt219	ply741	90	ply1520	left-footed shot
gl659	mt220	ply1068	2	ply137	left-footed shot
gl660	mt220	ply758	13	ply1068	right-footed shot
gl661	mt220	ply1521	69	ply765	right-footed shot
gl662	mt220	ply689	80	\N	penalty
gl663	mt220	ply568	82	\N	own goal
gl664	mt221	ply741	21	ply735	right-footed shot
gl665	mt221	ply741	38	ply739	right-footed shot
gl666	mt221	ply739	42	ply741	penalty
gl667	mt221	ply741	50	ply527	right-footed shot
gl668	mt221	\N	57	ply1518	\N
gl669	mt221	ply739	62	ply527	right-footed shot
gl670	mt222	ply590	53	\N	left-footed shot
gl671	mt222	ply142	58	ply579	right-footed shot
gl672	mt223	ply740	27	ply386	penalty
gl673	mt223	ply739	32	ply735	left-footed shot
gl674	mt223	ply739	65	\N	left-footed shot
gl675	mt223	ply529	70	ply521	header
gl676	mt223	ply739	85	ply922	right-footed shot
gl677	mt224	ply432	2	\N	right-footed shot
gl678	mt224	ply1479	46	ply415	left-footed shot
gl679	mt224	ply525	82	ply523	right-footed shot
gl680	mt225	ply869	7	ply854	right-footed shot
gl681	mt225	ply210	19	ply662	right-footed shot
gl682	mt225	ply662	27	ply705	left-footed shot
gl683	mt225	ply662	43	ply225	left-footed shot
gl684	mt225	ply1492	84	ply1500	right-footed shot
gl685	mt226	ply398	9	\N	left-footed shot
gl686	mt226	ply136	24	ply133	right-footed shot
gl687	mt226	ply144	42	\N	right-footed shot
gl688	mt226	ply474	47	\N	own goal
gl689	mt226	ply496	49	ply1317	right-footed shot
gl690	mt227	ply26	68	\N	left-footed shot
gl691	mt228	ply652	29	ply644	header
gl692	mt228	ply1064	65	ply652	left-footed shot
gl693	mt229	ply821	86	ply828	right-footed shot
gl694	mt230	ply1075	19	\N	penalty
gl695	mt230	ply525	49	ply699	right-footed shot
gl696	mt230	ply525	63	ply509	header
gl697	mt230	ply1075	115	\N	free kick
gl698	mt230	ply523	117	ply1112	header
gl699	mt231	ply662	35	ply225	left-footed shot
gl700	mt231	ply662	54	\N	penalty
gl701	mt231	ply866	69	\N	penalty
gl702	mt231	ply866	90	ply863	header
gl703	mt232	ply590	70	ply586	left-footed shot
gl704	mt232	ply142	74	ply30	right-footed shot
gl705	mt233	ply739	31	\N	penalty
gl706	mt233	ply740	37	ply391	left-footed shot
gl707	mt234	ply653	12	ply664	left-footed shot
gl708	mt234	ply656	18	ply654	right-footed shot
gl709	mt235	ply831	34	ply828	right-footed shot
gl710	mt235	ply729	60	ply837	penalty
gl711	mt235	ply86	83	\N	free kick
gl712	mt235	ply834	84	ply833	left-footed shot
gl713	mt236	ply398	33	\N	penalty
gl714	mt236	ply139	73	ply816	right-footed shot
gl715	mt236	\N	82	ply1522	header
gl716	mt237	ply294	34	ply767	right-footed shot
gl717	mt237	ply1523	90	ply292	left-footed shot
gl718	mt238	ply653	19	ply664	right-footed shot
gl719	mt238	ply225	84	ply662	right-footed shot
gl720	mt238	ply654	90	ply656	left-footed shot
gl721	mt239	ply837	27	ply827	right-footed shot
gl722	mt239	ply834	36	\N	left-footed shot
gl723	mt239	ply590	51	\N	left-footed shot
gl724	mt239	ply837	65	ply828	right-footed shot
gl725	mt240	ply288	32	ply284	right-footed shot
gl726	mt240	ply274	85	\N	right-footed shot
gl727	mt241	ply739	3	ply741	right-footed shot
gl728	mt241	ply726	28	ply741	right-footed shot
gl729	mt241	ply139	37	ply129	header
gl730	mt241	ply143	60	ply135	header
gl731	mt241	ply739	68	ply527	right-footed shot
gl732	mt242	ply432	90	ply1524	right-footed shot
gl733	mt243	ply139	40	\N	header
gl734	mt244	ply207	15	\N	right-footed shot
gl735	mt244	ply664	55	\N	penalty
gl736	mt244	ply654	75	ply652	left-footed shot
gl737	mt246	ply292	14	ply824	right-footed shot
gl738	mt246	ply831	29	ply819	right-footed shot
gl739	mt247	ply726	15	ply527	header
gl740	mt247	ply653	64	ply1070	right-footed shot
gl741	mt247	ply664	71	\N	free kick
gl742	mt248	ply664	11	\N	right-footed shot
gl743	mt248	ply664	63	ply654	left-footed shot
gl744	mt249	ply767	28	\N	header
gl745	mt249	ply288	85	ply292	right-footed shot
gl746	mt250	ply283	42	ply288	left-footed shot
gl747	mt252	ply527	14	ply724	left-footed shot
gl748	mt252	ply527	33	ply1066	left-footed shot
gl749	mt252	ply201	90	ply724	right-footed shot
gl750	mt253	ply1502	9	ply1849	left-footed shot
gl751	mt253	ply1502	39	\N	right-footed shot
gl752	mt253	ply729	55	ply831	header
gl753	mt253	ply690	85	ply827	header
gl754	mt254	ply1649	52	ply733	left-footed shot
gl755	mt255	ply1649	7	ply527	right-footed shot
gl756	mt255	ply739	61	\N	header
gl757	mt255	ply1649	63	ply739	left-footed shot
gl758	mt255	ply739	79	ply527	right-footed shot
gl759	mt255	ply739	83	ply527	left-footed shot
gl760	mt256	ply827	18	ply832	right-footed shot
gl761	mt257	ply1649	22	ply1850	right-footed shot
gl762	mt258	ply836	4	ply1371	left-footed shot
gl763	mt258	ply836	7	ply1371	header
gl764	mt258	ply729	14	ply827	penalty
gl765	mt258	ply831	45	ply836	right-footed shot
gl766	mt258	ply831	81	ply818	left-footed shot
gl767	mt258	ply836	90	ply831	right-footed shot
gl768	mt259	ply1851	11	ply1852	right-footed shot
gl769	mt259	ply1853	90	ply305	left-footed shot
gl770	mt260	ply831	17	\N	right-footed shot
gl771	mt260	ply831	79	ply1371	header
gl772	mt260	ply739	81	ply201	left-footed shot
gl773	mt260	ply733	83	\N	left-footed shot
gl774	mt261	ply1649	32	ply739	right-footed shot
gl775	mt261	ply733	35	ply741	right-footed shot
gl1	mt1	ply643	16	ply655	header
gl2	mt1	ply727	28	\N	own goal
gl3	mt1	ply765	42	ply727	header
gl4	mt1	ply664	45	\N	penalty
gl5	mt1	ply765	51	ply756	header
gl6	mt1	ply655	56	ply648	right-footed shot
gl7	mt1	ply765	73	ply766	right-footed shot
gl8	mt1	ply644	75	ply656	right-footed shot
gl9	mt1	ply1064	85	ply648	right-footed shot
gl10	mt2	ply1065	15	ply739	left-footed shot
gl11	mt2	ply322	27	ply311	right-footed shot
gl12	mt3	ply1066	8	\N	right-footed shot
gl13	mt3	ply740	74	ply739	left-footed shot
gl14	mt4	ply765	5	ply757	right-footed shot
gl15	mt4	ply322	22	ply21	right-footed shot
gl16	mt4	ply320	40	ply322	right-footed shot
gl17	mt5	ply644	30	ply654	right-footed shot
gl18	mt5	ply664	43	\N	penalty
gl19	mt5	ply650	53	ply653	right-footed shot
gl20	mt5	ply657	67	ply293	left-footed shot
gl21	mt5	ply322	81	ply323	right-footed shot
gl22	mt5	ply664	84	ply1067	left-footed shot
gl23	mt6	ply739	9	ply922	right-footed shot
gl24	mt6	ply763	28	ply1068	right-footed shot
gl25	mt6	ply727	57	ply1068	right-footed shot
gl26	mt6	ply740	67	\N	left-footed shot
gl27	mt6	ply740	74	\N	penalty
gl28	mt7	ply765	8	ply763	header
gl29	mt7	ply1069	21	ply739	left-footed shot
gl30	mt7	ply1069	39	ply726	header
gl31	mt7	ply762	90	\N	penalty
gl32	mt8	ply654	15	ply644	right-footed shot
gl33	mt8	ply649	17	\N	own goal
gl34	mt8	ply664	54	ply644	header
gl35	mt8	ply293	72	ply656	right-footed shot
gl36	mt8	ply1064	90	ply644	right-footed shot
gl37	mt9	ply739	50	ply740	right-footed shot
gl38	mt9	ply293	63	ply1064	left-footed shot
gl39	mt9	ply1064	76	ply652	left-footed shot
gl40	mt10	ply765	12	\N	left-footed shot
gl41	mt10	ply757	17	\N	penalty
gl42	mt10	ply763	26	ply1068	header
gl43	mt10	ply757	45	ply765	right-footed shot
gl44	mt10	ply765	90	\N	right-footed shot
gl45	mt11	ply762	24	ply760	left-footed shot
gl46	mt11	ply763	71	ply757	right-footed shot
gl47	mt11	ply664	76	ply1070	header
gl48	mt12	ply739	2	\N	right-footed shot
gl49	mt12	ply739	7	ply527	right-footed shot
gl50	mt12	ply740	38	ply739	left-footed shot
gl51	mt12	ply320	68	ply327	left-footed shot
gl52	mt12	ply740	76	\N	penalty
gl53	mt14	ply16	9	\N	own goal
gl54	mt14	ply32	42	ply31	right-footed shot
gl55	mt14	ply20	44	\N	left-footed shot
gl56	mt14	ply590	49	ply30	left-footed shot
gl57	mt14	ply578	69	\N	right-footed shot
gl58	mt15	ply590	18	\N	left-footed shot
gl59	mt15	ply142	45	\N	left-footed shot
gl60	mt15	ply590	60	ply579	left-footed shot
gl61	mt15	ply432	75	ply1071	header
gl62	mt15	ply589	77	ply579	left-footed shot
gl63	mt15	ply589	81	\N	right-footed shot
gl64	mt16	ply31	20	\N	right-footed shot
gl65	mt16	ply115	84	ply1072	left-footed shot
gl66	mt16	ply1073	90	\N	penalty
gl67	mt17	ply590	8	ply572	left-footed shot
gl68	mt17	ply580	13	\N	right-footed shot
gl69	mt17	ply115	20	ply109	left-footed shot
gl70	mt17	ply115	34	ply116	left-footed shot
gl71	mt17	ply590	78	\N	penalty
gl72	mt18	ply585	65	ply432	right-footed shot
gl73	mt19	ply585	6	ply421	right-footed shot
gl74	mt19	ply1074	61	\N	own goal
gl75	mt20	ply586	13	ply564	header
gl76	mt20	ply142	21	ply564	left-footed shot
gl77	mt21	ply583	52	\N	right-footed shot
gl78	mt21	ply590	70	ply578	left-footed shot
gl79	mt22	ply29	87	ply388	header
gl80	mt23	ply115	56	ply111	right-footed shot
gl81	mt23	ply114	90	ply115	right-footed shot
gl82	mt23	ply108	90	\N	right-footed shot
gl83	mt23	ply1075	90	\N	penalty
gl84	mt24	ply16	29	\N	right-footed shot
gl85	mt24	ply590	36	\N	left-footed shot
gl86	mt24	ply30	55	\N	header
gl87	mt25	ply207	20	ply201	right-footed shot
gl88	mt25	ply662	45	ply207	left-footed shot
gl89	mt25	ply169	90	ply1076	header
gl90	mt26	ply221	2	\N	header
gl91	mt26	ply221	9	ply698	right-footed shot
gl92	mt26	ply961	33	ply1077	left-footed shot
gl93	mt26	ply49	39	ply134	left-footed shot
gl94	mt26	ply221	51	ply698	left-footed shot
gl95	mt26	ply221	63	ply128	left-footed shot
gl96	mt27	ply49	17	ply60	left-footed shot
gl97	mt27	ply221	43	ply49	right-footed shot
gl98	mt28	ply222	37	ply207	right-footed shot
gl99	mt29	ply940	15	ply942	header
gl100	mt29	ply328	25	ply1076	header
gl101	mt29	ply940	27	ply961	header
gl102	mt29	ply733	44	\N	penalty
gl103	mt29	ply961	89	ply962	left-footed shot
gl104	mt30	ply225	11	\N	own goal
gl105	mt30	ply39	25	ply221	left-footed shot
gl106	mt30	ply698	57	ply221	left-footed shot
gl107	mt30	ply221	72	ply39	header
gl108	mt31	ply225	37	\N	penalty
gl109	mt31	ply60	72	ply698	left-footed shot
gl110	mt31	ply221	83	ply698	header
gl111	mt31	ply52	90	ply698	right-footed shot
gl112	mt32	ply962	31	\N	penalty
gl113	mt32	ply962	38	ply1077	right-footed shot
gl114	mt32	ply961	41	ply947	left-footed shot
gl115	mt32	ply733	56	ply944	right-footed shot
gl116	mt33	ply187	22	\N	penalty
gl117	mt33	ply221	54	ply1078	left-footed shot
gl118	mt33	ply221	69	ply682	right-footed shot
gl119	mt34	ply962	30	\N	right-footed shot
gl120	mt34	ply962	39	\N	right-footed shot
gl121	mt34	ply946	81	\N	header
gl122	mt34	ply222	90	ply225	left-footed shot
gl123	mt35	ply221	8	\N	penalty
gl124	mt35	ply960	22	ply1079	left-footed shot
gl125	mt35	ply698	42	\N	left-footed shot
gl126	mt35	ply928	58	ply1080	left-footed shot
gl127	mt35	ply49	62	ply52	left-footed shot
gl128	mt35	ply1079	78	ply947	left-footed shot
gl129	mt36	ply222	29	ply207	left-footed shot
gl130	mt36	ply225	45	\N	penalty
gl131	mt36	ply225	53	ply210	right-footed shot
gl132	mt36	ply662	68	ply205	header
gl133	mt36	ply662	81	ply210	header
gl134	mt37	ply1081	16	ply1082	left-footed shot
gl135	mt37	ply1083	62	ply1082	header
gl136	mt38	ply836	89	ply825	left-footed shot
gl137	mt40	ply1084	25	ply1082	header
gl138	mt40	ply831	65	\N	penalty
gl139	mt40	ply1085	90	ply1081	left-footed shot
gl140	mt41	ply880	37	\N	own goal
gl141	mt41	ply837	51	ply828	right-footed shot
gl142	mt41	ply837	56	\N	left-footed shot
gl143	mt41	ply836	65	ply837	left-footed shot
gl144	mt41	ply831	90	ply834	right-footed shot
gl145	mt42	ply497	34	ply1086	left-footed shot
gl146	mt42	ply1085	52	\N	free kick
gl147	mt42	ply1086	58	ply497	left-footed shot
gl148	mt42	ply480	67	ply482	right-footed shot
gl149	mt43	ply831	14	ply837	right-footed shot
gl150	mt43	ply803	39	ply1087	right-footed shot
gl151	mt43	ply831	61	ply837	right-footed shot
gl152	mt44	ply488	54	ply1086	right-footed shot
gl153	mt44	ply484	66	\N	right-footed shot
gl154	mt44	ply1088	82	\N	right-footed shot
gl155	mt44	ply1081	90	ply1085	header
gl156	mt45	ply497	61	\N	right-footed shot
gl157	mt45	ply497	67	ply1089	header
gl158	mt46	ply816	30	\N	free kick
gl159	mt46	ply827	45	ply836	right-footed shot
gl160	mt46	ply831	55	ply821	right-footed shot
gl161	mt47	ply827	17	ply836	left-footed shot
gl162	mt47	ply834	79	ply818	left-footed shot
gl163	mt48	ply803	42	ply880	right-footed shot
gl164	mt48	ply1090	90	\N	right-footed shot
gl165	mt49	ply143	34	ply144	right-footed shot
gl166	mt49	ply398	56	\N	left-footed shot
gl167	mt49	ply398	85	\N	left-footed shot
gl168	mt51	ply588	3	\N	right-footed shot
gl169	mt51	ply933	69	ply925	right-footed shot
gl170	mt51	ply588	79	\N	penalty
gl171	mt52	ply398	12	\N	penalty
gl172	mt52	ply398	27	ply143	right-footed shot
gl173	mt52	ply141	68	ply144	right-footed shot
gl174	mt52	ply144	74	ply143	left-footed shot
gl175	mt52	ply139	87	ply129	header
gl176	mt53	ply384	36	ply381	right-footed shot
gl177	mt54	ply144	70	\N	free kick
gl178	mt54	ply1091	80	\N	own goal
gl179	mt54	ply398	82	ply144	left-footed shot
gl180	mt54	ply144	84	ply131	left-footed shot
gl181	mt55	ply398	26	ply140	header
gl182	mt55	ply141	32	ply398	back heel
gl183	mt55	ply917	38	ply907	header
gl184	mt55	ply144	49	ply125	left-footed shot
gl185	mt55	ply398	61	ply144	right-footed shot
gl186	mt55	ply588	74	ply925	right-footed shot
gl187	mt55	ply398	84	ply122	right-footed shot
gl188	mt56	ply395	70	\N	right-footed shot
gl189	mt57	ply398	14	\N	bicycle kick
gl190	mt57	ply140	42	ply1092	right-footed shot
gl191	mt57	ply355	70	ply364	right-footed shot
gl192	mt59	ply143	34	ply398	header
gl193	mt59	ply144	43	ply140	left-footed shot
gl194	mt59	ply136	62	ply125	left-footed shot
gl195	mt60	ply333	16	ply925	left-footed shot
gl196	mt60	ply914	21	\N	right-footed shot
gl197	mt61	ply699	13	ply689	right-footed shot
gl198	mt61	ply1093	66	ply265	left-footed shot
gl199	mt61	ply1094	90	\N	right-footed shot
gl200	mt62	ply1095	6	ply87	right-footed shot
gl201	mt62	ply1025	39	\N	left-footed shot
gl202	mt62	ply1028	73	ply1030	right-footed shot
gl203	mt62	ply493	83	ply1096	left-footed shot
gl204	mt63	ply1097	68	ply87	left-footed shot
gl205	mt64	ply1098	53	ply1028	right-footed shot
gl206	mt64	ply844	60	ply689	left-footed shot
gl207	mt64	ply699	90	ply1099	right-footed shot
gl208	mt65	ply81	15	ply76	left-footed shot
gl209	mt65	ply66	29	ply79	header
gl210	mt65	ply704	53	ply689	right-footed shot
gl211	mt65	ply680	75	ply689	right-footed shot
gl212	mt65	ply699	81	ply684	header
gl213	mt66	ply1033	6	ply1015	header
gl214	mt66	ply1030	16	ply1020	header
gl215	mt66	ply265	77	ply259	right-footed shot
gl216	mt66	ply1006	88	\N	left-footed shot
gl217	mt66	ply1027	90	ply1030	left-footed shot
gl218	mt67	ply1100	12	ply87	left-footed shot
gl219	mt67	ply699	45	ply689	right-footed shot
gl220	mt67	ply87	56	ply71	left-footed shot
gl221	mt67	ply699	90	ply701	right-footed shot
gl222	mt68	ply1017	36	\N	left-footed shot
gl223	mt68	ply1028	89	\N	right-footed shot
gl224	mt69	ply699	78	\N	right-footed shot
gl225	mt69	ply705	90	ply689	right-footed shot
gl226	mt70	ply87	10	ply1095	right-footed shot
gl227	mt70	ply1094	39	ply1101	header
gl228	mt70	ply71	51	ply81	left-footed shot
gl229	mt70	ply262	80	ply1093	left-footed shot
gl230	mt70	ply1102	85	\N	left-footed shot
gl231	mt70	ply86	88	\N	free kick
gl232	mt71	ply701	9	ply684	left-footed shot
gl233	mt71	ply259	42	\N	right-footed shot
gl234	mt72	ply1028	3	ply1020	left-footed shot
gl235	mt72	ply1017	42	ply1103	right-footed shot
gl236	mt72	ply1028	51	ply1030	left-footed shot
gl237	mt72	ply80	71	ply69	left-footed shot
gl238	mt72	ply87	80	ply1100	right-footed shot
gl239	mt73	ply800	21	\N	penalty
gl240	mt73	ply863	42	\N	penalty
gl241	mt75	ply219	35	\N	penalty
gl242	mt75	ply219	53	\N	penalty
gl243	mt75	ply1104	62	\N	free kick
gl244	mt76	ply1105	48	\N	left-footed shot
gl245	mt76	ply863	87	\N	penalty
gl246	mt77	ply219	3	ply799	left-footed shot
gl247	mt77	ply991	15	ply978	header
gl248	mt77	ply806	65	ply1106	right-footed shot
gl249	mt77	ply806	77	ply781	right-footed shot
gl250	mt79	ply971	3	ply980	right-footed shot
gl251	mt79	ply789	30	\N	free kick
gl252	mt79	ply991	60	ply978	right-footed shot
gl253	mt80	ply59	15	ply868	right-footed shot
gl254	mt80	ply553	43	\N	penalty
gl255	mt80	ply1107	51	ply1108	right-footed shot
gl256	mt81	ply553	31	ply1104	left-footed shot
gl257	mt82	ply859	12	ply863	header
gl258	mt82	ply868	90	ply59	right-footed shot
gl259	mt83	ply806	50	ply219	right-footed shot
gl260	mt84	ply1104	11	ply1107	left-footed shot
gl261	mt84	ply553	72	ply548	left-footed shot
gl262	mt84	ply548	78	ply1107	right-footed shot
gl263	mt84	ply1105	89	ply978	left-footed shot
gl264	mt85	ply498	69	ply273	header
gl265	mt86	ply505	23	ply1109	header
gl266	mt86	ply1110	45	\N	penalty
gl267	mt86	ply118	45	\N	right-footed shot
gl268	mt87	ply1049	9	ply1043	right-footed shot
gl269	mt87	ply1052	49	ply1111	header
gl270	mt87	ply1062	80	\N	left-footed shot
gl271	mt87	ply1055	90	\N	right-footed shot
gl272	mt88	ply525	46	ply1112	left-footed shot
gl273	mt89	ply1113	86	ply511	header
gl274	mt90	ply378	9	ply279	right-footed shot
gl275	mt90	ply284	21	\N	penalty
gl276	mt90	ply283	48	ply1114	left-footed shot
gl277	mt90	ply284	57	\N	penalty
gl278	mt91	ply294	56	ply1114	left-footed shot
gl279	mt92	ply1110	11	\N	left-footed shot
gl280	mt92	ply507	26	\N	own goal
gl281	mt92	ply1110	58	\N	penalty
gl282	mt92	ply525	73	ply1112	left-footed shot
gl283	mt92	ply118	82	ply1110	left-footed shot
gl284	mt92	ply1115	90	ply1116	right-footed shot
gl285	mt93	ply280	25	ply824	right-footed shot
gl286	mt93	ply277	55	\N	right-footed shot
gl287	mt93	ply1114	58	ply287	left-footed shot
gl288	mt93	ply767	90	ply294	right-footed shot
gl289	mt94	ply628	28	ply1117	right-footed shot
gl290	mt94	ply1111	90	\N	penalty
gl291	mt95	ply767	2	ply378	right-footed shot
gl292	mt95	ply1049	38	ply1043	header
gl293	mt95	ply1115	41	ply1059	right-footed shot
gl294	mt95	ply498	62	ply767	left-footed shot
gl295	mt95	ply767	85	ply292	right-footed shot
gl296	mt95	ply1118	90	\N	right-footed shot
gl297	mt96	ply529	18	ply1112	header
gl298	mt97	ply664	7	ply653	right-footed shot
gl299	mt97	ply652	17	\N	left-footed shot
gl300	mt97	ply654	32	ply664	right-footed shot
gl301	mt97	ply652	44	ply293	left-footed shot
gl302	mt97	ply293	58	ply652	right-footed shot
gl303	mt98	ply739	90	ply741	right-footed shot
gl304	mt99	ply802	21	ply1119	right-footed shot
gl305	mt99	ply140	90	ply143	left-footed shot
gl306	mt100	ply589	75	ply572	header
gl307	mt100	ply590	83	ply574	left-footed shot
gl308	mt101	ply283	8	ply294	header
gl309	mt101	ply292	63	ply285	right-footed shot
gl310	mt102	ply532	1	ply510	right-footed shot
gl311	mt102	ply1020	66	ply1017	left-footed shot
gl312	mt103	ply60	18	ply128	right-footed shot
gl313	mt103	ply221	26	\N	own goal
gl314	mt103	ply221	29	\N	left-footed shot
gl315	mt103	ply333	72	\N	header
gl316	mt104	ply116	7	ply1072	header
gl317	mt104	ply700	80	ply689	right-footed shot
gl318	mt105	ply398	12	\N	penalty
gl319	mt105	ply398	21	\N	penalty
gl320	mt105	ply398	23	\N	right-footed shot
gl321	mt105	ply141	31	ply140	right-footed shot
gl322	mt105	ply143	54	ply144	left-footed shot
gl323	mt105	ply797	70	ply1119	left-footed shot
gl324	mt105	ply143	83	ply144	left-footed shot
gl325	mt105	ply144	85	ply398	left-footed shot
gl326	mt106	ply499	61	ply1088	right-footed shot
gl327	mt108	ply739	39	ply741	right-footed shot
gl328	mt108	ply831	61	ply837	right-footed shot
gl329	mt108	ply831	76	ply828	right-footed shot
gl330	mt108	ply831	78	\N	right-footed shot
gl331	mt109	ply588	77	ply907	header
gl332	mt110	ply1072	41	ply115	header
gl333	mt111	ply1104	38	\N	penalty
gl334	mt111	ply292	45	ply284	right-footed shot
gl335	mt111	ply273	71	ply288	right-footed shot
gl336	mt112	ply1030	78	\N	penalty
gl337	mt112	ply1014	85	ply1120	right-footed shot
gl338	mt112	ply1028	90	\N	penalty
gl339	mt113	ply653	70	ply654	right-footed shot
gl340	mt114	ply568	17	ply572	header
gl341	mt114	ply142	34	ply585	right-footed shot
gl449	mt145	ply832	7	ply822	penalty
gl342	mt114	ply588	49	ply933	right-footed shot
gl343	mt114	ply585	87	ply580	left-footed shot
gl344	mt115	ply831	21	ply837	header
gl345	mt115	ply831	24	ply828	header
gl346	mt115	ply283	40	ply284	header
gl347	mt115	ply831	46	\N	right-footed shot
gl348	mt116	ply1028	8	ply1020	left-footed shot
gl349	mt117	ply288	15	ply767	right-footed shot
gl350	mt117	ply824	51	ply288	header
gl351	mt117	ply767	75	ply286	right-footed shot
gl352	mt117	ply836	80	ply828	right-footed shot
gl353	mt117	ply831	96	ply837	header
gl354	mt118	ply398	52	ply143	right-footed shot
gl355	mt118	ply1027	88	ply1030	left-footed shot
gl356	mt120	ply568	21	ply573	header
gl357	mt120	ply930	32	\N	right-footed shot
gl358	mt120	ply589	55	ply586	right-footed shot
gl359	mt120	ply589	65	ply573	right-footed shot
gl360	mt120	ply333	73	ply907	left-footed shot
gl361	mt120	ply588	82	ply925	right-footed shot
gl362	mt121	ply653	2	ply664	header
gl363	mt121	ply1064	11	ply653	right-footed shot
gl364	mt121	ply831	33	ply821	left-footed shot
gl365	mt121	ply654	53	ply1067	header
gl366	mt121	ply837	55	ply821	right-footed shot
gl367	mt121	ply652	74	ply1070	left-footed shot
gl368	mt121	ply831	82	\N	penalty
gl369	mt122	ply1121	53	\N	own goal
gl370	mt122	ply142	55	ply590	right-footed shot
gl371	mt123	ply1122	3	ply1017	right-footed shot
gl372	mt123	ply1019	41	ply1017	header
gl373	mt123	ply577	62	ply590	right-footed shot
gl374	mt123	ply585	67	ply564	header
gl375	mt123	ply142	74	ply580	left-footed shot
gl376	mt124	ply664	73	ply652	left-footed shot
gl377	mt124	ply836	90	ply831	right-footed shot
gl378	mt124	ply836	0	ply834	\N
gl379	mt124	ply831	95	ply831	penalty
gl380	mt125	ply837	59	ply830	right-footed shot
gl381	mt126	\N	19	ply1350	header
gl382	mt126	ply762	45	\N	right-footed shot
gl383	mt126	\N	50	ply1461	right-footed shot
gl384	mt126	ply1462	75	ply1340	header
gl385	mt127	ply140	28	ply135	right-footed shot
gl386	mt127	ply133	41	ply140	right-footed shot
gl387	mt127	ply1092	66	\N	right-footed shot
gl388	mt127	ply140	72	ply143	right-footed shot
gl389	mt128	ply133	13	ply129	header
gl390	mt128	ply1347	70	ply1463	left-footed shot
gl391	mt128	ply135	79	ply1464	right-footed shot
gl392	mt129	ply112	29	\N	left-footed shot
gl393	mt129	ply762	40	ply1465	right-footed shot
gl394	mt129	ply94	47	\N	own goal
gl395	mt129	ply116	52	ply114	right-footed shot
gl396	mt129	ply116	85	ply111	right-footed shot
gl397	mt130	ply96	18	ply1466	header
gl398	mt130	ply1347	25	\N	penalty
gl399	mt131	ply1465	4	\N	left-footed shot
gl400	mt131	ply398	21	ply143	penalty
gl401	mt131	ply1106	44	\N	own goal
gl402	mt131	ply1467	66	ply1468	right-footed shot
gl403	mt131	ply1469	79	ply135	header
gl404	mt131	ply144	83	ply135	left-footed shot
gl405	mt131	ply398	88	ply1464	header
gl406	mt131	ply127	90	\N	left-footed shot
gl407	mt133	ply398	43	\N	left-footed shot
gl408	mt133	ply140	52	ply133	right-footed shot
gl409	mt133	ply144	68	ply140	header
gl410	mt133	ply1465	73	ply1106	left-footed shot
gl411	mt134	ply1465	28	ply1470	right-footed shot
gl412	mt134	ply1465	41	ply804	left-footed shot
gl413	mt134	ply1347	79	ply1463	penalty
gl414	mt134	ply219	81	\N	right-footed shot
gl415	mt135	ply116	26	ply112	right-footed shot
gl416	mt135	ply143	86	ply143	penalty
gl417	mt136	ply206	63	ply1471	header
gl418	mt136	ply139	80	ply141	right-footed shot
gl419	mt137	ply99	39	ply107	header
gl420	mt137	ply107	86	ply114	right-footed shot
gl421	mt138	ply1472	29	ply878	left-footed shot
gl422	mt138	ply686	33	\N	own goal
gl423	mt138	ply1473	42	ply1472	right-footed shot
gl424	mt138	ply828	54	ply1371	right-footed shot
gl425	mt138	ply837	59	\N	right-footed shot
gl426	mt139	ply498	49	ply479	right-footed shot
gl427	mt139	ply1126	63	\N	penalty
gl428	mt139	ply1137	84	ply1141	right-footed shot
gl429	mt139	ply498	90	ply475	left-footed shot
gl430	mt141	ply1149	33	ply1147	left-footed shot
gl431	mt141	ply1149	58	\N	right-footed shot
gl432	mt141	ply831	87	ply690	left-footed shot
gl433	mt141	ply690	90	ply729	right-footed shot
gl434	mt142	ply1147	8	ply1131	right-footed shot
gl435	mt142	ply875	17	\N	own goal
gl436	mt142	ply1147	26	ply1148	right-footed shot
gl437	mt142	ply1126	44	ply1137	left-footed shot
gl438	mt142	ply1148	65	ply1147	right-footed shot
gl439	mt142	ply1147	79	ply1149	right-footed shot
gl440	mt143	ply831	25	\N	right-footed shot
gl441	mt143	ply729	33	ply827	header
gl442	mt143	ply499	35	ply487	right-footed shot
gl443	mt143	ply1089	68	ply499	left-footed shot
gl444	mt143	ply836	80	ply837	right-footed shot
gl445	mt144	ply1148	17	ply1149	penalty
gl446	mt144	ply1127	34	ply1148	header
gl447	mt144	ply1474	45	\N	bicycle kick
gl448	mt144	ply1475	77	\N	free kick
gl450	mt145	ply723	59	\N	own goal
gl451	mt146	ply1476	57	\N	left-footed shot
gl452	mt146	ply1473	82	\N	right-footed shot
gl453	mt147	ply479	17	ply491	right-footed shot
gl454	mt147	ply1147	45	ply1477	header
gl455	mt147	ply498	64	ply488	right-footed shot
gl456	mt147	ply498	73	ply723	left-footed shot
gl457	mt147	ply1147	76	ply1149	right-footed shot
gl458	mt149	ply831	9	ply833	header
gl459	mt149	ply831	32	ply836	header
gl460	mt150	ply585	14	ply424	right-footed shot
gl461	mt150	\N	20	ply293	penalty
gl462	mt150	ply656	65	\N	free kick
gl463	mt150	ply396	73	ply654	right-footed shot
gl464	mt151	ply1478	90	ply1392	header
gl465	mt152	ply1071	11	\N	left-footed shot
gl466	mt152	ply1075	85	ply1479	header
gl467	mt153	ply396	18	ply653	right-footed shot
gl468	mt153	ply656	76	ply293	left-footed shot
gl469	mt153	ply293	81	ply653	right-footed shot
gl776	mt261	ply741	46	ply739	left-footed shot
gl777	mt261	ply739	63	ply741	right-footed shot
gl778	mt261	ply1840	84	ply739	penalty
gl779	mt262	ply836	53	ply817	left-footed shot
gl780	mt262	ply322	55	ply1502	right-footed shot
gl781	mt262	ply837	64	ply836	right-footed shot
gl782	mt262	ply828	90	ply690	right-footed shot
gl783	mt263	ply1801	26	\N	penalty
gl784	mt263	ply1802	30	ply1783	right-footed shot
gl785	mt263	ply1854	44	ply1392	right-footed shot
gl786	mt263	ply1392	54	\N	penalty
gl787	mt264	ply140	34	ply1089	header
gl788	mt264	ply398	80	\N	right-footed shot
gl789	mt264	ply143	90	ply583	right-footed shot
gl790	mt265	ply1805	12	ply1769	right-footed shot
gl791	mt265	ply135	15	\N	right-footed shot
gl792	mt265	ply398	45	\N	right-footed shot
gl793	mt265	ply141	53	ply129	right-footed shot
gl794	mt265	ply141	55	ply1092	left-footed shot
gl795	mt265	ply1801	61	\N	penalty
gl796	mt265	ply141	83	ply583	right-footed shot
gl797	mt265	ply398	87	ply1509	right-footed shot
gl798	mt265	ply141	88	ply1092	right-footed shot
gl799	mt266	ply1855	37	\N	left-footed shot
gl800	mt266	ply1856	62	\N	left-footed shot
gl801	mt266	ply1569	87	\N	header
gl802	mt266	ply1857	90	\N	header
gl803	mt267	ply1801	9	ply867	header
gl804	mt267	ply1805	16	ply867	left-footed shot
gl805	mt267	ply1805	44	ply1769	left-footed shot
gl806	mt267	ply867	57	ply1120	left-footed shot
gl807	mt267	ply1801	72	ply1769	right-footed shot
gl808	mt268	ply1397	23	ply573	header
gl809	mt268	ply398	34	\N	left-footed shot
gl810	mt268	ply398	62	ply143	right-footed shot
gl811	mt268	ply1092	75	\N	right-footed shot
gl812	mt268	ply1858	79	\N	right-footed shot
gl813	mt269	ply398	69	ply140	right-footed shot
gl814	mt269	ply1089	89	\N	left-footed shot
gl815	mt270	ply1021	34	\N	right-footed shot
gl816	mt270	ply1805	57	ply176	left-footed shot
gl817	mt270	ply1805	61	\N	right-footed shot
gl818	mt270	ply691	85	ply1804	right-footed shot
gl819	mt271	ply1397	6	\N	left-footed shot
gl820	mt271	ply1855	19	ply1858	right-footed shot
gl821	mt271	ply176	45	ply1120	right-footed shot
gl822	mt271	ply1801	50	ply1802	right-footed shot
gl823	mt271	ply1120	73	ply1805	right-footed shot
gl824	mt271	ply1801	77	ply691	header
gl825	mt272	ply133	14	ply1509	header
gl826	mt272	ply398	53	\N	penalty
gl827	mt272	ply398	60	ply1092	right-footed shot
gl828	mt272	ply398	64	ply129	header
gl829	mt272	ply398	68	ply1089	right-footed shot
gl830	mt272	ply1092	89	ply1089	right-footed shot
gl831	mt273	ply140	14	ply141	right-footed shot
gl832	mt273	ply1804	20	\N	left-footed shot
gl833	mt273	ply143	45	\N	left-footed shot
gl834	mt273	ply1509	64	ply125	right-footed shot
gl835	mt274	ply1397	87	\N	penalty
gl836	mt275	ply664	24	\N	left-footed shot
gl837	mt275	ply656	38	ply664	right-footed shot
gl838	mt275	ply1064	76	ply653	left-footed shot
gl839	mt276	ply1859	10	ply1860	left-footed shot
gl840	mt276	ply1619	31	ply1859	right-footed shot
gl841	mt276	ply1619	42	ply1606	header
gl842	mt276	ply1619	68	ply1605	right-footed shot
gl843	mt277	ply87	28	\N	header
gl844	mt277	ply1861	41	ply1087	left-footed shot
gl845	mt277	ply1473	90	ply1862	right-footed shot
gl846	mt278	ply293	66	ply664	right-footed shot
gl847	mt278	ply654	90	ply293	right-footed shot
gl848	mt279	ply1863	16	ply1864	right-footed shot
gl849	mt279	ply756	25	ply1619	right-footed shot
gl850	mt279	ply1619	60	ply1865	penalty
gl851	mt279	ply1862	75	ply1087	right-footed shot
gl852	mt280	ply80	28	ply1100	penalty
gl853	mt280	\N	34	ply293	right-footed shot
gl854	mt280	\N	38	ply293	penalty
gl855	mt280	ply293	58	ply654	right-footed shot
gl856	mt280	ply293	64	ply656	right-footed shot
gl857	mt280	ply293	69	ply664	right-footed shot
gl858	mt281	ply1087	13	ply1861	right-footed shot
gl859	mt281	ply1620	25	ply1605	header
gl860	mt281	ply1610	83	ply1620	right-footed shot
gl861	mt281	ply1606	90	ply756	left-footed shot
gl862	mt281	ply1861	90	ply1866	header
gl863	mt281	ply1472	90	ply872	penalty
gl864	mt282	ply293	7	ply1064	right-footed shot
gl865	mt282	ply81	49	ply855	header
gl866	mt283	ply656	56	ply1064	right-footed shot
gl867	mt283	ply1473	69	ply1862	right-footed shot
gl868	mt284	ply86	27	ply86	penalty
gl869	mt284	ply855	47	\N	right-footed shot
gl870	mt285	ply1867	66	\N	right-footed shot
gl871	mt285	ply81	80	ply80	left-footed shot
gl872	mt285	ply493	90	\N	left-footed shot
gl873	mt286	ply756	10	ply1868	right-footed shot
gl874	mt286	ply1064	34	ply664	header
gl875	mt286	ply1064	50	ply654	right-footed shot
gl876	mt286	ply1064	54	ply647	right-footed shot
gl877	mt286	ply654	84	ply652	left-footed shot
gl878	mt287	ply509	48	ply1869	left-footed shot
gl879	mt287	ply1870	65	ply505	header
gl880	mt287	ply103	70	ply96	header
gl881	mt287	ply1466	90	ply1871	header
gl882	mt288	ply1872	16	ply925	right-footed shot
gl883	mt288	\N	25	\N	own goal
gl884	mt288	ply1341	37	\N	right-footed shot
gl885	mt289	ply1869	17	\N	right-footed shot
gl886	mt289	ply1112	62	\N	left-footed shot
gl887	mt289	ply699	89	ply1110	right-footed shot
gl888	mt290	ply116	48	ply118	right-footed shot
gl889	mt290	ply1873	58	ply1874	left-footed shot
gl890	mt291	ply118	78	ply1072	header
gl891	mt292	ply1096	30	\N	left-footed shot
gl892	mt292	ply1110	77	ply509	left-footed shot
gl893	mt292	ply1110	79	\N	left-footed shot
gl894	mt293	ply1875	4	ply699	right-footed shot
gl895	mt293	ply1096	12	\N	left-footed shot
gl896	mt293	ply1471	90	ply1869	left-footed shot
gl897	mt294	ply1873	41	\N	own goal
gl898	mt294	ply1876	55	ply1547	right-footed shot
gl899	mt294	ply118	90	ply1873	right-footed shot
gl900	mt295	ply1350	11	\N	own goal
gl901	mt295	\N	54	ply1540	left-footed shot
gl902	mt296	ply1110	45	\N	free kick
gl903	mt297	ply116	17	\N	penalty
gl904	mt297	ply94	54	ply109	right-footed shot
gl905	mt298	ply699	75	ply1110	right-footed shot
gl906	mt298	ply1869	90	ply1110	left-footed shot
gl907	mt299	ply1650	82	ply1877	penalty
gl908	mt299	\N	90	\N	right-footed shot
gl909	mt300	ply662	2	ply1878	right-footed shot
gl910	mt300	ply662	34	ply1879	left-footed shot
gl911	mt300	ply1879	36	\N	right-footed shot
gl912	mt300	ply1880	40	ply1881	right-footed shot
gl913	mt300	ply662	45	ply1879	right-footed shot
gl914	mt300	ply762	45	ply1878	right-footed shot
gl915	mt300	ply1684	52	ply1882	header
gl916	mt300	ply787	66	\N	left-footed shot
gl917	mt302	ply142	9	ply589	right-footed shot
gl918	mt302	ply572	25	ply564	left-footed shot
gl919	mt302	ply590	36	\N	left-footed shot
gl920	mt302	ply1879	39	ply1470	right-footed shot
gl921	mt302	ply1878	56	ply1879	right-footed shot
gl922	mt302	ply662	60	ply1878	left-footed shot
gl923	mt302	ply590	69	ply589	left-footed shot
gl924	mt303	ply1650	17	ply1877	right-footed shot
gl925	mt303	ply662	40	ply1879	penalty
gl926	mt303	ply1650	64	ply1883	right-footed shot
gl1680	mt553	ply590	86	ply581	right-footed shot
gl1681	mt554	\N	10	ply2344	header
gl1682	mt554	ply2500	75	ply496	left-footed shot
gl1683	mt555	ply2196	15	ply2501	right-footed shot
gl1684	mt555	ply2501	58	\N	header
gl1685	mt555	ply530	72	ply1650	penalty
gl1686	mt556	ply649	2	ply2193	header
gl1687	mt556	\N	10	ply650	right-footed shot
gl1688	mt556	ply1064	25	\N	right-footed shot
gl1689	mt556	ply649	63	ply653	header
gl1690	mt557	ply653	48	ply2193	right-footed shot
gl1691	mt557	ply293	90	ply652	right-footed shot
gl1692	mt558	ply1884	7	\N	right-footed shot
gl1693	mt558	ply1650	49	\N	right-footed shot
gl1694	mt558	ply1877	70	ply1650	right-footed shot
gl1695	mt558	ply2502	90	ply1490	right-footed shot
gl1696	mt559	ply293	9	\N	left-footed shot
gl1697	mt559	ply1064	13	ply653	right-footed shot
gl1698	mt559	ply2412	73	\N	penalty
gl1699	mt560	ply49	8	ply1490	header
gl1700	mt560	ply2503	24	ply692	right-footed shot
gl1701	mt560	ply2503	54	ply2504	header
gl1702	mt561	ply1884	21	ply1650	right-footed shot
gl1703	mt561	ply918	34	ply656	header
gl1704	mt561	ply649	48	ply144	header
gl1705	mt561	ply284	62	ply1016	penalty
gl1706	mt561	\N	69	ply144	right-footed shot
gl1707	mt561	ply293	90	ply653	right-footed shot
gl1708	mt562	\N	12	ply49	header
gl1709	mt562	ply2501	14	\N	right-footed shot
gl1710	mt562	ply1864	17	\N	left-footed shot
gl1711	mt562	ply1864	68	ply2501	right-footed shot
gl1712	mt563	ply1884	56	ply2169	right-footed shot
gl1713	mt563	ply1771	81	ply1650	right-footed shot
gl1714	mt563	ply1650	83	ply1016	header
gl1715	mt564	ply293	88	ply656	right-footed shot
gl1716	mt565	ply2503	26	ply1864	right-footed shot
gl1717	mt565	ply539	32	ply1864	left-footed shot
gl1718	mt565	\N	90	\N	penalty
gl1719	mt566	ply1771	2	\N	right-footed shot
gl1720	mt566	\N	33	ply49	header
gl1721	mt566	ply948	90	ply2505	header
gl1722	mt567	ply2506	13	\N	header
gl1723	mt567	\N	21	\N	own goal
gl1724	mt567	ply191	28	\N	\N
gl1725	mt567	ply2507	86	ply2508	right-footed shot
gl1726	mt568	ply757	32	\N	right-footed shot
gl1727	mt568	ply2509	34	\N	left-footed shot
gl1728	mt569	ply2510	31	\N	right-footed shot
gl1729	mt569	ply2510	69	ply1479	right-footed shot
gl1730	mt569	ply2511	89	ply1479	right-footed shot
gl1731	mt570	ply2507	11	ply191	left-footed shot
gl1732	mt570	ply2506	43	\N	header
gl1733	mt571	ply2512	30	ply2449	right-footed shot
gl1734	mt571	ply191	34	\N	header
gl1735	mt571	ply191	54	ply2507	left-footed shot
gl1736	mt572	ply753	8	\N	left-footed shot
gl1737	mt572	ply2510	18	ply94	left-footed shot
gl1738	mt572	ply757	38	ply137	right-footed shot
gl1739	mt572	ply2298	41	\N	right-footed shot
gl1740	mt572	ply410	44	ply1466	left-footed shot
gl1741	mt573	ply2513	45	ply2514	left-footed shot
gl1742	mt573	ply191	54	\N	penalty
gl1743	mt574	ply1466	13	ply731	right-footed shot
gl1744	mt574	ply767	48	ply137	right-footed shot
gl1745	mt574	ply731	61	ply1466	header
gl1746	mt574	ply2515	90	ply2510	right-footed shot
gl1747	mt575	ply94	29	ply2516	right-footed shot
gl1748	mt575	ply2506	41	ply191	left-footed shot
gl1749	mt576	ply2517	6	\N	own goal
gl1750	mt576	ply767	9	ply759	right-footed shot
gl1751	mt576	ply767	31	ply753	penalty
gl1752	mt576	ply2512	43	ply2513	header
gl1753	mt576	ply580	45	ply750	right-footed shot
gl1754	mt577	ply2510	9	ply2172	right-footed shot
gl1755	mt577	ply2510	33	ply731	right-footed shot
gl1756	mt577	ply2172	45	ply2510	left-footed shot
gl1757	mt577	ply2518	61	\N	penalty
gl1758	mt577	ply844	65	ply731	left-footed shot
gl1759	mt577	ply2512	78	ply2449	header
gl1760	mt577	ply2211	88	ply2516	header
gl1761	mt578	ply2508	10	ply2519	penalty
gl1762	mt578	ply580	87	\N	left-footed shot
gl1763	mt578	ply2506	90	\N	left-footed shot
gl1764	mt579	ply1805	4	ply1801	left-footed shot
gl1765	mt579	ply2520	11	ply2521	left-footed shot
gl1766	mt579	ply1801	15	ply1783	left-footed shot
gl1767	mt579	ply1801	60	ply691	left-footed shot
gl1768	mt580	ply699	12	ply2197	right-footed shot
gl1769	mt580	ply699	51	\N	penalty
gl1770	mt580	ply729	61	\N	bicycle kick
gl1771	mt581	ply2197	18	ply818	left-footed shot
gl1772	mt581	ply699	50	ply2197	left-footed shot
gl1773	mt581	ply290	54	\N	right-footed shot
gl1774	mt581	ply699	79	ply828	right-footed shot
gl1775	mt582	ply1801	39	ply2522	left-footed shot
gl1776	mt582	ply1801	62	ply2213	right-footed shot
gl1777	mt582	ply1801	67	ply1871	header
gl1778	mt583	ply686	28	\N	own goal
gl1779	mt583	ply699	43	\N	penalty
gl1780	mt584	\N	62	\N	right-footed shot
gl1781	mt584	ply1374	67	ply1888	header
gl1782	mt585	ply176	27	ply1871	right-footed shot
gl1783	mt585	ply176	56	ply1784	right-footed shot
gl1784	mt585	ply691	65	ply1801	left-footed shot
gl1785	mt585	ply699	80	ply2523	right-footed shot
gl1786	mt586	ply198	29	ply2521	left-footed shot
gl1787	mt586	\N	51	ply2524	right-footed shot
gl1788	mt587	ply290	31	ply2520	right-footed shot
gl1789	mt587	ply1801	49	ply176	right-footed shot
gl1790	mt587	ply1805	76	ply176	right-footed shot
gl1791	mt588	ply828	23	\N	right-footed shot
gl1792	mt588	ply831	39	ply827	right-footed shot
gl1793	mt588	ply822	41	ply686	right-footed shot
gl1794	mt588	ply831	45	ply699	right-footed shot
gl1795	mt588	ply699	49	ply1371	header
gl1796	mt588	ply699	54	ply831	left-footed shot
gl1797	mt589	ply2523	8	ply857	right-footed shot
gl1798	mt589	ply699	12	ply286	right-footed shot
gl1799	mt589	ply290	43	\N	header
gl1800	mt589	ply290	49	\N	right-footed shot
gl1801	mt589	ply833	81	ply12	right-footed shot
gl1802	mt590	\N	20	ply1120	left-footed shot
gl1803	mt590	ply1805	37	\N	left-footed shot
gl1804	mt590	ply189	80	ply176	right-footed shot
gl1805	mt591	ply1869	2	ply1076	right-footed shot
gl1806	mt591	ply1869	9	\N	penalty
gl1807	mt591	ply1801	35	ply176	left-footed shot
gl1808	mt591	ply691	71	\N	free kick
gl1809	mt592	ply656	14	ply653	header
gl1810	mt592	ply652	18	ply293	left-footed shot
gl1811	mt592	\N	23	\N	right-footed shot
gl1812	mt592	ply656	53	\N	right-footed shot
gl1813	mt593	ply142	25	ply1069	right-footed shot
gl1814	mt593	ply590	29	\N	left-footed shot
gl1815	mt593	ply142	53	\N	right-footed shot
gl1816	mt593	ply589	69	ply581	right-footed shot
gl1817	mt593	ply142	85	ply2525	right-footed shot
gl1818	mt594	ply523	33	ply741	right-footed shot
gl1819	mt594	ply699	45	\N	penalty
gl1820	mt594	ply699	83	ply834	\N
gl1821	mt594	ply1371	86	ply834	left-footed shot
gl1822	mt595	ply1900	62	ply832	right-footed shot
gl1823	mt595	ply740	75	ply2480	left-footed shot
gl1824	mt596	ply143	43	ply816	right-footed shot
gl1825	mt596	ply140	53	ply398	right-footed shot
gl1826	mt596	ply143	66	ply135	right-footed shot
gl1827	mt596	ply398	79	\N	left-footed shot
gl1828	mt596	ply398	88	ply143	left-footed shot
gl1829	mt598	ply1431	41	ply497	left-footed shot
gl1830	mt598	ply2501	52	ply1111	right-footed shot
gl1831	mt598	ply692	71	\N	free kick
gl1832	mt600	ply699	51	ply833	header
gl1833	mt600	ply1840	71	\N	right-footed shot
gl1834	mt600	ply690	80	ply699	right-footed shot
gl1835	mt601	ply1805	39	ply1871	right-footed shot
gl1836	mt601	ply1869	64	\N	right-footed shot
gl1837	mt601	ply1110	67	ply1869	left-footed shot
gl1838	mt602	ply1064	8	ply652	left-footed shot
gl1839	mt602	ply2465	17	ply2460	right-footed shot
gl1840	mt602	ply2285	71	ply2465	right-footed shot
gl1841	mt603	ply2007	74	ply733	right-footed shot
gl1842	mt603	ply2007	78	ply496	header
gl1843	mt603	ply498	84	ply704	left-footed shot
gl1844	mt604	ply497	52	ply2526	right-footed shot
gl1845	mt605	ply583	18	ply143	left-footed shot
gl1846	mt605	ply2527	46	\N	own goal
gl1847	mt605	ply2528	59	ply2527	left-footed shot
gl1848	mt605	\N	84	ply816	\N
gl1849	mt606	ply740	3	ply1073	right-footed shot
gl1850	mt606	ply393	20	ply740	right-footed shot
gl1851	mt606	ply740	63	ply1073	left-footed shot
gl1852	mt607	ply733	31	ply2488	left-footed shot
gl1853	mt607	ply845	37	\N	own goal
gl1854	mt607	ply583	68	ply2188	header
gl1855	mt608	ply699	3	ply857	right-footed shot
gl1856	mt608	ply699	64	ply818	bicycle kick
gl1857	mt608	ply1371	72	ply699	left-footed shot
gl1858	mt609	\N	38	\N	own goal
gl1859	mt609	ply2200	55	\N	own goal
gl1860	mt609	ply384	59	ply1073	right-footed shot
gl1861	mt609	ply497	80	\N	left-footed shot
gl1862	mt609	ply1073	87	\N	left-footed shot
gl1863	mt610	ply590	12	ply589	left-footed shot
gl1864	mt610	ply582	21	ply581	right-footed shot
gl1865	mt610	ply142	31	ply590	header
gl1866	mt611	ply497	6	\N	left-footed shot
gl1867	mt611	\N	58	\N	penalty
gl1868	mt611	ply2200	82	ply1431	header
gl1869	mt612	ply1064	2	ply293	right-footed shot
gl1870	mt612	ply590	56	\N	left-footed shot
gl1871	mt612	ply589	77	\N	right-footed shot
gl1872	mt614	\N	2	\N	header
gl1873	mt614	\N	37	\N	header
gl1874	mt614	ply1870	61	\N	left-footed shot
gl1875	mt614	ply699	90	\N	penalty
gl1876	mt615	ply590	36	ply589	left-footed shot
gl1877	mt615	ply590	45	ply589	left-footed shot
gl1878	mt615	ply142	56	ply590	right-footed shot
gl1879	mt615	ply589	61	ply590	right-footed shot
gl1880	mt615	ply589	69	ply581	header
gl1881	mt615	ply497	81	ply2165	right-footed shot
gl1882	mt615	\N	85	\N	penalty
gl1883	mt616	ply135	28	ply1390	right-footed shot
gl1884	mt616	ply1371	44	ply818	left-footed shot
gl1885	mt616	ply834	57	ply833	left-footed shot
gl1886	mt617	ply135	3	ply1092	right-footed shot
gl1887	mt617	ply831	11	ply1371	header
gl1888	mt617	ply831	46	\N	right-footed shot
gl1889	mt617	ply1390	63	\N	right-footed shot
gl1890	mt618	ply142	9	ply589	left-footed shot
gl1891	mt618	ply581	15	\N	own goal
gl1892	mt618	ply1069	25	\N	header
gl1893	mt618	ply497	52	\N	right-footed shot
gl1894	mt618	ply2165	86	\N	right-footed shot
gl1895	mt618	ply2165	90	\N	penalty
gl1896	mt619	ply831	51	\N	right-footed shot
gl1897	mt619	ply142	55	ply1046	right-footed shot
gl1898	mt619	ply2197	64	ply1371	bicycle kick
gl1899	mt619	ply2197	83	ply1371	left-footed shot
gl1900	mt620	ply2707	45	ply2708	right-footed shot
gl1901	mt620	ply1105	79	\N	left-footed shot
gl1902	mt621	ply1840	1	ply1120	header
gl1903	mt621	ply1088	78	\N	right-footed shot
gl1904	mt622	ply2709	7	ply1088	header
gl1905	mt622	ply2709	26	ply1088	right-footed shot
gl1906	mt623	ply2710	16	\N	left-footed shot
gl1907	mt623	ply1870	41	ply735	left-footed shot
gl1908	mt623	ply1840	55	ply527	header
gl1909	mt623	ply1840	60	ply1802	right-footed shot
gl1910	mt624	ply1088	13	ply582	right-footed shot
gl1911	mt624	ply2709	42	ply1285	right-footed shot
gl1912	mt624	ply582	47	\N	right-footed shot
gl1913	mt624	ply1285	56	ply2711	right-footed shot
gl1914	mt624	ply1285	83	ply2712	right-footed shot
gl1915	mt624	ply1285	87	ply2712	left-footed shot
gl1916	mt625	ply527	40	ply1840	right-footed shot
gl1917	mt625	ply1802	62	\N	right-footed shot
gl1918	mt625	ply1840	90	ply1840	penalty
gl1919	mt626	ply1870	43	ply201	right-footed shot
gl1920	mt626	ply2461	76	ply2296	left-footed shot
gl1921	mt626	ply201	90	ply523	right-footed shot
gl1922	mt627	ply2707	12	ply2713	left-footed shot
gl1923	mt627	ply2714	15	ply2707	left-footed shot
gl1924	mt627	ply2548	20	ply1285	left-footed shot
gl1925	mt627	ply26	42	ply1875	header
gl1926	mt627	ply1285	88	ply2541	left-footed shot
gl1927	mt628	ply1840	18	ply1870	right-footed shot
gl1928	mt628	ply26	45	ply1088	penalty
gl1929	mt628	ply735	60	\N	own goal
gl1930	mt628	ply2715	77	\N	own goal
gl1931	mt630	ply2712	8	ply2716	left-footed shot
gl1932	mt630	ply2712	16	ply2716	left-footed shot
gl1933	mt630	ply2712	47	ply1088	right-footed shot
gl1934	mt630	ply2715	53	ply1285	right-footed shot
gl1935	mt630	\N	78	\N	right-footed shot
gl1936	mt631	ply2717	15	ply2710	header
gl1937	mt631	ply1840	61	\N	bicycle kick
gl1938	mt631	ply2713	69	ply2707	right-footed shot
gl1939	mt631	ply527	90	ply2467	left-footed shot
gl1940	mt632	ply355	26	ply364	right-footed shot
gl1941	mt632	ply530	36	\N	header
gl1942	mt632	ply530	45	\N	header
gl1943	mt633	ply1893	12	\N	right-footed shot
gl1944	mt633	ply2506	90	\N	free kick
gl1945	mt634	\N	29	\N	free kick
gl1946	mt634	ply364	65	ply2718	left-footed shot
gl1947	mt635	ply2169	20	\N	header
gl1948	mt635	ply1650	51	\N	free kick
gl1949	mt635	ply530	54	ply1877	penalty
gl1950	mt635	ply1650	58	ply530	left-footed shot
gl1951	mt635	ply2719	71	\N	right-footed shot
gl1952	mt635	ply2187	86	ply908	left-footed shot
gl1953	mt636	ply2187	9	\N	penalty
gl1954	mt636	ply1893	55	\N	left-footed shot
gl1955	mt637	\N	12	\N	left-footed shot
gl1956	mt637	ply1650	30	ply1877	right-footed shot
gl1957	mt637	ply2510	38	\N	right-footed shot
gl1958	mt637	ply2720	69	\N	penalty
gl1959	mt637	ply2510	86	\N	header
gl1960	mt638	\N	79	\N	penalty
gl1961	mt638	ply2169	82	ply1650	left-footed shot
gl1962	mt639	ply2187	45	\N	penalty
gl1963	mt640	ply2719	10	ply2187	left-footed shot
gl1964	mt640	ply1907	25	ply2187	left-footed shot
gl1965	mt640	ply2721	31	ply2187	\N
gl1966	mt640	ply191	58	\N	right-footed shot
gl1967	mt640	\N	83	\N	penalty
gl1968	mt640	ply2510	89	\N	left-footed shot
gl1969	mt642	ply367	9	ply2520	right-footed shot
gl1970	mt642	ply2520	30	\N	penalty
gl1971	mt642	ply353	32	\N	right-footed shot
gl1972	mt642	ply2722	45	ply2520	right-footed shot
gl1973	mt642	ply362	60	ply353	right-footed shot
gl1974	mt642	ply1861	77	ply2520	right-footed shot
gl1975	mt643	ply1877	60	ply1650	right-footed shot
gl1976	mt643	ply1650	79	\N	right-footed shot
gl1977	mt643	ply2723	87	\N	right-footed shot
gl1978	mt644	ply740	3	ply741	left-footed shot
gl1979	mt644	ply740	27	ply741	left-footed shot
gl1980	mt644	ply741	50	\N	free kick
gl927	mt303	ply662	72	\N	header
gl928	mt303	ply1884	73	ply1650	right-footed shot
gl929	mt304	ply582	2	ply577	right-footed shot
gl930	mt304	ply582	57	ply589	right-footed shot
gl931	mt304	ply142	77	ply590	right-footed shot
gl932	mt304	ply590	87	\N	right-footed shot
gl933	mt304	ply1885	88	ply1881	right-footed shot
gl934	mt305	ply1069	14	\N	right-footed shot
gl935	mt305	ply1684	41	ply1674	header
gl936	mt305	ply582	53	ply590	left-footed shot
gl937	mt306	ply662	11	\N	penalty
gl938	mt306	ply1773	44	ply1884	right-footed shot
gl939	mt307	ply1650	21	ply1756	right-footed shot
gl940	mt307	ply1046	65	ply581	header
gl941	mt308	ply1461	43	\N	right-footed shot
gl942	mt308	ply1878	45	ply1470	right-footed shot
gl943	mt308	ply1879	69	ply662	right-footed shot
gl944	mt308	ply1684	85	ply1682	header
gl945	mt308	ply662	87	ply1470	left-footed shot
gl946	mt309	ply530	3	\N	left-footed shot
gl947	mt309	ply530	26	ply1756	right-footed shot
gl948	mt309	ply530	38	ply1877	penalty
gl949	mt309	ply1650	75	\N	penalty
gl950	mt310	ply580	57	ply142	header
gl951	mt310	ply590	58	\N	right-footed shot
gl952	mt311	ply1744	64	\N	right-footed shot
gl953	mt311	ply487	90	\N	right-footed shot
gl954	mt313	ply723	35	ply208	left-footed shot
gl955	mt313	ply723	89	ply208	left-footed shot
gl956	mt314	ply499	2	ply1088	left-footed shot
gl957	mt314	ply1073	58	ply1086	right-footed shot
gl958	mt314	ply1073	84	ply740	left-footed shot
gl959	mt315	ply499	22	ply480	right-footed shot
gl960	mt315	ply1886	89	ply488	right-footed shot
gl961	mt316	ply740	3	ply575	left-footed shot
gl962	mt316	ply1718	50	ply1733	right-footed shot
gl963	mt316	ply1744	57	\N	own goal
gl964	mt318	ply499	5	ply1887	left-footed shot
gl965	mt318	ply1321	40	ply1886	right-footed shot
gl966	mt318	ply723	51	ply1888	right-footed shot
gl967	mt318	ply208	64	ply1098	right-footed shot
gl968	mt318	ply723	77	ply705	right-footed shot
gl969	mt319	ply1073	29	ply740	right-footed shot
gl970	mt319	ply740	33	ply1073	left-footed shot
gl971	mt319	ply115	67	ply740	left-footed shot
gl972	mt319	ply705	77	ply208	right-footed shot
gl973	mt320	ply499	19	ply498	right-footed shot
gl974	mt320	ply1889	37	\N	penalty
gl975	mt320	ply498	81	\N	left-footed shot
gl976	mt320	ply499	88	ply498	right-footed shot
gl977	mt321	ply705	10	ply225	right-footed shot
gl978	mt321	ply1889	43	ply1890	right-footed shot
gl979	mt321	ply208	61	ply705	left-footed shot
gl980	mt322	ply1891	23	ply1086	left-footed shot
gl981	mt322	ply498	44	ply499	left-footed shot
gl982	mt322	ply395	86	ply1073	right-footed shot
gl983	mt323	ply1115	41	ply1116	right-footed shot
gl984	mt323	ply394	50	ply394	penalty
gl985	mt324	ply767	69	ply766	right-footed shot
gl986	mt324	ply767	78	ply137	right-footed shot
gl987	mt324	ply1652	84	ply933	left-footed shot
gl988	mt325	ply1116	22	ply1118	right-footed shot
gl989	mt325	ply648	70	\N	own goal
gl990	mt325	ply1115	78	ply1118	right-footed shot
gl991	mt325	ply1892	85	\N	right-footed shot
gl992	mt326	ply394	11	\N	right-footed shot
gl993	mt326	ply1460	65	\N	left-footed shot
gl994	mt327	ply1111	25	\N	left-footed shot
gl995	mt327	ply760	49	ply137	right-footed shot
gl996	mt327	ply137	59	ply752	right-footed shot
gl997	mt328	ply933	4	ply1893	right-footed shot
gl998	mt328	ply394	70	ply1632	left-footed shot
gl999	mt328	ply1894	85	\N	right-footed shot
gl1000	mt329	ply1765	45	\N	right-footed shot
gl1001	mt329	ply137	63	ply757	left-footed shot
gl1002	mt330	ply1895	4	ply1632	header
gl1003	mt330	ply394	33	ply1697	right-footed shot
gl1004	mt330	ply1652	76	ply1894	left-footed shot
gl1005	mt330	ply1296	89	\N	left-footed shot
gl1006	mt331	ply1116	42	ply1043	header
gl1007	mt331	ply1118	84	\N	left-footed shot
gl1008	mt332	ply1894	20	ply1896	left-footed shot
gl1009	mt332	ply1897	59	ply1896	left-footed shot
gl1010	mt332	ply757	90	ply1551	penalty
gl1011	mt332	ply757	90	ply767	header
gl1012	mt333	ply1893	47	ply1894	right-footed shot
gl1013	mt333	ply1894	58	\N	penalty
gl1014	mt333	ply1115	79	\N	own goal
gl1015	mt334	ply757	9	ply766	penalty
gl1016	mt334	ply767	33	ply765	penalty
gl1017	mt334	ply1697	50	ply1898	right-footed shot
gl1018	mt334	ply394	82	ply1707	right-footed shot
gl1019	mt335	ply1899	74	ply1020	left-footed shot
gl1020	mt336	ply1484	18	ply1078	header
gl1021	mt336	ply48	50	ply928	right-footed shot
gl1022	mt336	ply1078	62	ply294	header
gl1023	mt337	ply294	8	ply60	left-footed shot
gl1024	mt337	ply1484	34	ply696	right-footed shot
gl1025	mt337	ply696	67	ply60	right-footed shot
gl1026	mt338	ply1491	22	ply16	right-footed shot
gl1027	mt338	ply1774	33	ply551	header
gl1028	mt338	ply1900	78	ply1114	right-footed shot
gl1029	mt339	ply1901	86	ply292	left-footed shot
gl1030	mt340	ply1902	63	ply1903	left-footed shot
gl1031	mt340	ply1107	90	ply544	right-footed shot
gl1032	mt341	ply1491	2	\N	own goal
gl1033	mt341	ply284	5	\N	penalty
gl1034	mt341	ply1484	20	ply294	header
gl1035	mt341	ply271	35	\N	own goal
gl1036	mt341	ply696	55	ply294	right-footed shot
gl1037	mt341	ply273	63	ply1491	left-footed shot
gl1038	mt341	ply284	71	\N	penalty
gl1039	mt341	ply277	74	\N	right-footed shot
gl1040	mt342	ply1774	25	\N	right-footed shot
gl1041	mt342	ply1020	66	\N	penalty
gl1042	mt342	ply1904	82	ply1825	own goal
gl1043	mt342	ply110	84	\N	left-footed shot
gl1044	mt342	ply396	90	ply1899	right-footed shot
gl1045	mt343	ply730	40	ply1899	right-footed shot
gl1046	mt343	ply286	41	\N	right-footed shot
gl1047	mt343	ply292	50	ply1905	left-footed shot
gl1048	mt343	ply1906	82	ply1020	right-footed shot
gl1049	mt344	ply294	2	ply60	left-footed shot
gl1050	mt344	ply1484	59	ply294	right-footed shot
gl1051	mt345	ply1491	19	ply1900	right-footed shot
gl1052	mt345	ply273	35	ply1523	header
gl1053	mt345	\N	78	ply551	left-footed shot
gl1054	mt346	ply1899	24	ply396	right-footed shot
gl1055	mt347	ply662	69	\N	right-footed shot
gl1056	mt347	ply741	75	ply739	left-footed shot
gl1057	mt347	ply662	78	ply217	left-footed shot
gl1058	mt348	ply113	4	\N	right-footed shot
gl1059	mt349	ply68	16	ply855	right-footed shot
gl1060	mt349	ply1100	42	ply81	right-footed shot
gl1061	mt349	ply1095	57	ply855	right-footed shot
gl1062	mt349	ply68	62	ply81	right-footed shot
gl1063	mt349	ply1902	66	\N	left-footed shot
gl1064	mt350	ply767	58	ply760	penalty
gl1065	mt351	ply141	51	ply398	right-footed shot
gl1066	mt351	ply141	54	ply398	left-footed shot
gl1067	mt351	ply398	76	ply125	right-footed shot
gl1068	mt352	ply1650	30	ply1771	right-footed shot
gl1069	mt352	ply115	57	ply1907	right-footed shot
gl1070	mt353	ply857	60	ply837	right-footed shot
gl1071	mt353	ply1064	78	ply653	header
gl1072	mt353	ply653	83	ply293	penalty
gl1073	mt354	ply1898	31	ply1697	left-footed shot
gl1074	mt355	ply1100	3	\N	penalty
gl1075	mt355	ply1903	21	\N	left-footed shot
gl1076	mt355	ply1100	43	\N	penalty
gl1077	mt355	ply1903	51	ply396	header
gl1078	mt355	ply396	67	ply1020	right-footed shot
gl1079	mt355	ply1100	71	\N	left-footed shot
gl1080	mt355	ply1100	83	ply1095	left-footed shot
gl1081	mt356	ply137	10	ply767	right-footed shot
gl1082	mt356	ply137	21	ply1068	header
gl1083	mt356	ply757	87	\N	right-footed shot
gl1084	mt357	ply741	28	ply527	header
gl1085	mt357	ply724	45	ply733	left-footed shot
gl1086	mt358	ply1069	43	ply582	header
gl1087	mt358	ply589	94	\N	right-footed shot
gl1088	mt358	ply112	97	ply116	right-footed shot
gl1089	mt358	ply112	105	ply118	right-footed shot
gl1090	mt358	ply118	120	ply112	left-footed shot
gl1091	mt359	ply293	9	ply1064	right-footed shot
gl1092	mt359	ply831	28	ply836	header
gl1093	mt359	ply1064	68	\N	left-footed shot
gl1094	mt360	ply394	12	ply1697	penalty
gl1095	mt360	ply699	43	\N	penalty
gl1096	mt360	ply699	60	ply1112	left-footed shot
gl1097	mt361	ply398	10	ply398	penalty
gl1098	mt361	ply1089	24	ply398	right-footed shot
gl1099	mt361	ply1491	44	\N	right-footed shot
gl1100	mt361	ply1092	76	ply398	right-footed shot
gl1101	mt361	ply398	84	ply817	header
gl1102	mt362	ply1788	10	ply863	header
gl1103	mt362	ply740	23	ply1073	left-footed shot
gl1104	mt362	ply1073	45	ply740	penalty
gl1105	mt362	ply1884	45	ply1650	penalty
gl1106	mt363	ply81	27	ply87	left-footed shot
gl1107	mt363	ply726	90	ply741	right-footed shot
gl1108	mt363	ply139	90	ply739	right-footed shot
gl1109	mt364	ply756	51	ply137	header
gl1110	mt364	ply116	71	ply116	penalty
gl1111	mt364	ply1908	88	ply1068	right-footed shot
gl1112	mt365	ply143	4	ply398	left-footed shot
gl1113	mt365	ply816	7	\N	own goal
gl1114	mt365	ply1089	22	ply141	left-footed shot
gl1115	mt365	ply141	27	ply133	right-footed shot
gl1116	mt365	ply143	31	ply135	right-footed shot
gl1117	mt365	ply1073	57	ply381	left-footed shot
gl1118	mt365	ply135	63	ply125	right-footed shot
gl1119	mt365	ply398	82	ply1509	header
gl1120	mt365	ply1509	85	ply143	right-footed shot
gl1121	mt365	ply1509	89	ply127	left-footed shot
gl1122	mt366	ply1909	24	\N	left-footed shot
gl1123	mt366	ply653	69	ply293	right-footed shot
gl1124	mt366	ply1707	79	ply1697	right-footed shot
gl1125	mt366	ply1707	87	\N	left-footed shot
gl1126	mt367	ply726	13	ply527	header
gl1127	mt367	ply527	42	ply741	left-footed shot
gl1128	mt367	ply724	56	ply527	header
gl1129	mt368	ply141	18	ply135	left-footed shot
gl1130	mt368	ply141	33	\N	left-footed shot
gl1131	mt368	ply398	88	ply135	header
gl1132	mt369	ply140	59	ply135	header
gl1133	mt370	ply2159	18	\N	right-footed shot
gl1134	mt370	ply1874	32	ply115	right-footed shot
gl1135	mt370	ply96	45	ply109	header
gl1136	mt371	ply292	85	\N	right-footed shot
gl1137	mt372	ply1936	51	ply705	right-footed shot
gl1138	mt372	ply1098	72	ply225	left-footed shot
gl1139	mt372	ply225	90	ply1936	right-footed shot
gl1140	mt373	ply115	28	ply111	left-footed shot
gl1141	mt373	ply1028	39	ply320	right-footed shot
gl1142	mt373	ply115	67	ply1874	left-footed shot
gl1143	mt373	ply109	90	ply115	right-footed shot
gl1144	mt374	ply2160	32	ply2002	right-footed shot
gl1145	mt374	ply2161	40	ply322	header
gl1146	mt375	ply105	38	ply723	right-footed shot
gl1147	mt375	ply198	73	ply723	left-footed shot
gl1148	mt375	ply705	83	ply723	right-footed shot
gl1149	mt375	ply198	89	\N	left-footed shot
gl1150	mt376	ply322	12	ply320	left-footed shot
gl1151	mt376	ply322	17	\N	penalty
gl1152	mt376	ply2161	24	ply323	right-footed shot
gl1153	mt376	ply323	85	ply2162	right-footed shot
gl1154	mt377	ply113	33	ply2163	left-footed shot
gl1155	mt377	ply115	80	ply1873	left-footed shot
gl1156	mt378	ply109	2	ply115	right-footed shot
gl1157	mt378	ply115	24	ply114	left-footed shot
gl1158	mt380	ply198	15	ply984	left-footed shot
gl1159	mt380	ply198	88	ply1098	left-footed shot
gl1160	mt382	ply740	31	\N	free kick
gl1161	mt382	ply393	75	ply1509	right-footed shot
gl1162	mt382	ply740	77	ply863	left-footed shot
gl1163	mt382	ply740	87	ply1073	right-footed shot
gl1164	mt383	ply691	53	ply867	right-footed shot
gl1165	mt383	ply1649	85	\N	right-footed shot
gl1166	mt383	ply1321	90	ply480	header
gl1167	mt384	ply1509	2	ply381	right-footed shot
gl1168	mt384	ply863	28	ply1509	right-footed shot
gl1169	mt384	ply1801	52	ply867	right-footed shot
gl1170	mt384	ply740	56	ply381	left-footed shot
gl1171	mt384	ply867	66	ply1805	left-footed shot
gl1172	mt384	ply740	90	ply381	left-footed shot
gl1173	mt385	ply2164	27	ply1773	right-footed shot
gl1174	mt385	ply2165	44	\N	right-footed shot
gl1175	mt385	ply1649	60	ply1321	right-footed shot
gl1176	mt386	ply1773	30	\N	right-footed shot
gl1177	mt386	ply1802	39	ply1871	right-footed shot
gl1178	mt386	ply1801	54	ply691	header
gl1179	mt386	ply1492	87	ply2164	right-footed shot
gl1180	mt387	ply1520	32	ply1073	left-footed shot
gl1181	mt387	ply381	83	ply863	left-footed shot
gl1182	mt388	ply1492	2	ply2166	header
gl1183	mt388	ply1801	78	\N	left-footed shot
gl1184	mt388	ply1801	89	ply1783	header
gl1185	mt389	ply1059	83	\N	left-footed shot
gl1186	mt389	ply1649	87	\N	right-footed shot
gl1187	mt390	ply740	61	ply393	left-footed shot
gl1188	mt390	ply384	70	ply740	right-footed shot
gl1189	mt390	ply1492	83	ply1068	header
gl1190	mt391	ply691	80	ply176	left-footed shot
gl1191	mt392	ply393	7	\N	left-footed shot
gl1192	mt392	ply1802	85	ply1801	right-footed shot
gl1193	mt393	ply1773	13	ply54	header
gl1194	mt393	ply1649	73	ply1775	header
gl1195	mt394	\N	30	ply572	header
gl1196	mt394	ply581	36	ply1069	penalty
gl1197	mt394	ply201	40	\N	left-footed shot
gl1198	mt394	ply739	83	ply741	right-footed shot
gl1199	mt394	ply589	90	ply574	right-footed shot
gl1200	mt396	ply741	20	\N	free kick
gl1201	mt396	ply741	22	ply739	left-footed shot
gl1202	mt396	ply1840	37	\N	left-footed shot
gl1203	mt396	ply527	42	ply201	right-footed shot
gl1204	mt396	ply739	70	ply724	left-footed shot
gl1205	mt396	\N	74	\N	\N
gl1206	mt396	ply741	81	\N	free kick
gl1207	mt397	ply1884	90	ply1877	right-footed shot
gl1208	mt398	ply1884	29	ply1877	right-footed shot
gl1209	mt398	ply1759	61	\N	own goal
gl1210	mt398	ply1650	77	\N	right-footed shot
gl1211	mt398	ply527	90	ply922	left-footed shot
gl1212	mt399	ply589	20	ply572	left-footed shot
gl1213	mt399	ply590	45	ply2167	right-footed shot
gl1214	mt399	ply590	50	ply142	penalty
gl1215	mt399	ply142	80	\N	right-footed shot
gl1216	mt400	ply2168	22	\N	header
gl1217	mt400	ply2168	29	\N	right-footed shot
gl1218	mt401	ply724	45	ply739	right-footed shot
gl1219	mt401	ply1884	63	\N	penalty
gl1220	mt402	ply724	13	\N	right-footed shot
gl1221	mt402	ply741	37	\N	left-footed shot
gl1222	mt402	ply581	45	\N	penalty
gl1223	mt403	ply2169	11	\N	left-footed shot
gl1224	mt403	ply1650	33	\N	right-footed shot
gl1225	mt403	ply1650	52	ply2169	right-footed shot
gl1226	mt403	ply1584	57	\N	left-footed shot
gl1227	mt404	ply590	34	ply581	right-footed shot
gl1228	mt405	ply1840	10	ply739	right-footed shot
gl1229	mt405	ply741	40	ply739	right-footed shot
gl1230	mt405	ply1567	56	\N	right-footed shot
gl1231	mt405	ply726	74	ply527	header
gl1232	mt405	ply739	90	ply741	right-footed shot
gl1233	mt406	ply1474	64	ply519	left-footed shot
gl1234	mt406	ply422	75	\N	penalty
gl1235	mt407	ply1389	9	ply2170	right-footed shot
gl1236	mt407	ply2171	67	\N	free kick
gl1237	mt407	\N	90	ply2170	penalty
gl1238	mt408	ply519	88	ply1863	header
gl1239	mt409	ply1479	49	ply844	header
gl1240	mt410	ply1479	26	ply94	penalty
gl1241	mt410	ply1466	35	ply864	header
gl1242	mt410	ply1347	38	ply1096	right-footed shot
gl1243	mt410	ply864	47	ply2172	right-footed shot
gl1244	mt412	ply1466	2	ply1479	right-footed shot
gl1245	mt412	ply1479	43	ply1466	right-footed shot
gl1246	mt412	ply2173	59	ply1096	header
gl1247	mt412	ply864	67	ply861	left-footed shot
gl1248	mt412	ply422	90	\N	right-footed shot
gl1249	mt413	ply2174	4	\N	left-footed shot
gl1250	mt413	ply2175	57	ply2174	left-footed shot
gl1251	mt414	ply2176	43	\N	own goal
gl1252	mt414	\N	54	ply2177	right-footed shot
gl1253	mt415	ply819	52	ply861	header
gl1254	mt415	ply864	55	ply2172	left-footed shot
gl1255	mt415	ply2178	89	\N	penalty
gl1256	mt415	ply1479	90	ply422	right-footed shot
gl1257	mt416	ply2179	90	\N	right-footed shot
gl1258	mt417	ply94	17	ply844	header
gl1259	mt417	ply1479	42	\N	penalty
gl1260	mt417	\N	45	\N	penalty
gl1261	mt417	ply1075	57	ply2180	right-footed shot
gl1262	mt417	ply2171	65	ply1389	left-footed shot
gl1263	mt418	ply1078	46	ply928	left-footed shot
gl1264	mt418	ply696	77	ply60	right-footed shot
gl1265	mt418	ply1078	90	ply2181	left-footed shot
gl1266	mt419	ply398	10	ply816	right-footed shot
gl1267	mt419	ply734	54	ply1390	right-footed shot
gl1268	mt420	ply199	4	\N	header
gl1269	mt420	ply128	22	ply60	left-footed shot
gl1270	mt421	ply1652	6	\N	left-footed shot
gl1271	mt421	ply907	15	ply1894	header
gl1272	mt421	ply2182	53	ply2183	\N
gl1273	mt421	ply2182	63	ply2184	right-footed shot
gl1274	mt421	ply2185	74	\N	right-footed shot
gl1275	mt422	ply1464	61	\N	left-footed shot
gl1276	mt422	ply398	63	ply2186	right-footed shot
gl1277	mt423	ply128	90	\N	right-footed shot
gl1278	mt424	\N	29	ply2187	right-footed shot
gl1279	mt424	ply60	61	ply294	left-footed shot
gl1280	mt425	ply398	31	ply398	penalty
gl1281	mt425	ply398	71	ply135	right-footed shot
gl1282	mt426	ply60	68	\N	penalty
gl1283	mt426	ply60	72	\N	left-footed shot
gl1284	mt427	\N	13	ply143	left-footed shot
gl1285	mt427	\N	30	ply143	left-footed shot
gl1286	mt427	ply398	36	ply135	header
gl1287	mt427	ply177	46	\N	right-footed shot
gl1288	mt427	ply398	51	ply135	header
gl1289	mt427	ply2188	76	ply816	right-footed shot
gl1290	mt428	ply398	13	ply141	right-footed shot
gl1291	mt428	ply60	61	ply696	left-footed shot
gl1292	mt428	ply60	82	\N	penalty
gl1293	mt428	ply398	87	\N	penalty
gl1294	mt428	ply140	90	ply583	right-footed shot
gl1295	mt428	ply1078	90	\N	right-footed shot
gl1296	mt429	ply907	88	\N	free kick
gl1297	mt430	ply51	6	ply2189	right-footed shot
gl1298	mt430	ply539	27	ply1861	left-footed shot
gl1299	mt430	\N	38	ply1938	header
gl1300	mt430	ply2190	81	ply1864	left-footed shot
gl1301	mt431	ply1909	26	ply2191	left-footed shot
gl1302	mt431	ply2191	43	ply394	left-footed shot
gl1303	mt431	ply652	67	ply144	left-footed shot
gl1304	mt432	ply2192	1	ply1542	left-footed shot
gl1305	mt432	\N	8	ply144	right-footed shot
gl1306	mt432	ply2193	87	\N	left-footed shot
gl1307	mt433	ply1861	44	ply539	left-footed shot
gl1308	mt433	ply1861	55	ply1087	right-footed shot
gl1309	mt433	ply1707	70	ply2191	header
gl1310	mt433	ply1632	72	ply1697	right-footed shot
gl1311	mt434	ply2193	30	ply1064	left-footed shot
gl1312	mt434	ply645	35	ply653	header
gl1313	mt434	ply652	70	ply664	left-footed shot
gl1314	mt435	ply1296	27	\N	left-footed shot
gl1315	mt435	ply1938	33	\N	right-footed shot
gl1316	mt435	ply1938	47	ply1542	right-footed shot
gl1317	mt435	ply1769	59	ply2194	right-footed shot
gl1318	mt435	ply394	67	ply1697	left-footed shot
gl1319	mt435	ply2195	90	ply205	right-footed shot
gl1320	mt436	ply2193	13	ply664	right-footed shot
gl1321	mt436	ply1064	24	\N	penalty
gl1322	mt436	ply293	49	ply1070	right-footed shot
gl1323	mt436	ply1064	72	\N	penalty
gl1324	mt436	ply664	84	ply656	right-footed shot
gl1325	mt436	ply1064	90	ply664	right-footed shot
gl1326	mt437	ply2191	19	ply1697	right-footed shot
gl1327	mt437	ply1769	28	ply821	right-footed shot
gl1328	mt437	ply1938	65	ply1915	right-footed shot
gl1329	mt437	ply1920	90	ply2195	left-footed shot
gl1330	mt438	ply1909	55	ply394	left-footed shot
gl1331	mt438	ply645	62	ply2193	header
gl1332	mt438	ply1909	81	ply394	left-footed shot
gl1333	mt438	\N	83	ply664	header
gl1334	mt439	ply539	14	ply2196	left-footed shot
gl1335	mt439	ply2196	15	ply1861	right-footed shot
gl1336	mt439	ply1938	17	ply2192	right-footed shot
gl1337	mt439	ply1975	40	\N	header
gl1338	mt439	ply2196	90	ply539	right-footed shot
gl1339	mt440	ply1861	22	ply539	left-footed shot
gl1340	mt440	ply2191	65	ply394	right-footed shot
gl1341	mt441	ply1938	16	\N	penalty
gl1342	mt441	ply144	45	\N	free kick
gl1343	mt441	ply144	61	ply293	left-footed shot
gl1344	mt442	ply857	45	\N	free kick
gl1345	mt442	ply2197	58	ply828	left-footed shot
gl1346	mt442	ply835	90	ply1371	right-footed shot
gl1347	mt443	ply2198	29	\N	right-footed shot
gl1348	mt443	ply2198	41	\N	left-footed shot
gl1349	mt443	ply2063	49	ply2199	right-footed shot
gl1350	mt443	ply2199	90	\N	penalty
gl1351	mt444	ply2199	2	\N	left-footed shot
gl1352	mt445	ply497	3	\N	left-footed shot
gl1353	mt445	ply497	40	ply1431	right-footed shot
gl1354	mt445	ply1431	64	ply2032	left-footed shot
gl1355	mt445	ply1521	73	\N	right-footed shot
gl1356	mt445	ply497	90	ply10	header
gl1357	mt446	ply497	30	ply2032	right-footed shot
gl1358	mt446	ply497	43	ply2037	right-footed shot
gl1359	mt446	ply1431	50	ply497	left-footed shot
gl1360	mt447	ply831	11	ply833	header
gl1361	mt447	ply1371	55	ply2197	left-footed shot
gl1362	mt447	ply1675	78	ply2143	right-footed shot
gl1363	mt448	ply2200	4	ply2032	header
gl1364	mt448	ply2201	51	ply1239	right-footed shot
gl1365	mt448	ply2032	59	ply2028	left-footed shot
gl1366	mt449	ply831	21	ply827	right-footed shot
gl1367	mt449	ply690	23	ply827	header
gl1368	mt449	ply831	37	ply2197	header
gl1369	mt449	ply2197	40	ply831	left-footed shot
gl1370	mt449	ply827	67	ply837	right-footed shot
gl1371	mt450	ply2199	10	\N	penalty
gl1372	mt450	ply2202	56	\N	right-footed shot
gl1373	mt450	ply2133	81	ply1675	header
gl1374	mt451	ply2197	47	\N	left-footed shot
gl1375	mt451	ply833	59	ply831	right-footed shot
gl1376	mt452	ply2063	37	ply2201	left-footed shot
gl1377	mt452	ply2051	43	\N	left-footed shot
gl1378	mt452	ply2201	73	ply2199	right-footed shot
gl1379	mt453	ply2203	62	ply2146	left-footed shot
gl1380	mt453	ply1431	68	\N	left-footed shot
gl1381	mt453	ply2152	72	\N	header
gl1382	mt454	ply1076	45	ply644	penalty
gl1383	mt454	ply1076	51	ply507	penalty
gl1384	mt455	ply522	35	ply692	left-footed shot
gl1385	mt455	ply522	44	\N	penalty
gl1386	mt455	ply702	66	ply522	right-footed shot
gl1387	mt456	ply1110	5	ply507	left-footed shot
gl1388	mt456	ply1110	34	\N	left-footed shot
gl1389	mt456	ply1110	69	ply509	left-footed shot
gl1390	mt458	ply1901	26	ply730	right-footed shot
gl1391	mt458	ply2204	55	ply2205	penalty
gl1392	mt459	ply1110	17	\N	left-footed shot
gl1393	mt460	ply2206	15	\N	left-footed shot
gl1394	mt460	ply2207	37	ply266	right-footed shot
gl1395	mt460	ply2206	42	ply730	right-footed shot
gl1396	mt460	ply730	56	ply1899	right-footed shot
gl1397	mt461	ply699	65	ply507	right-footed shot
gl1398	mt461	ply1643	86	\N	free kick
gl1399	mt461	ply505	90	\N	own goal
gl1400	mt462	\N	59	ply699	right-footed shot
gl1401	mt463	ply2208	90	ply498	right-footed shot
gl1402	mt464	ply730	17	\N	right-footed shot
gl1403	mt464	ply678	47	\N	own goal
gl1404	mt464	ply704	87	ply2209	header
gl1405	mt465	ply2204	30	\N	penalty
gl1406	mt465	ply2204	68	ply1093	left-footed shot
gl1407	mt465	ply1110	80	ply699	left-footed shot
gl1408	mt466	ply725	53	ply527	left-footed shot
gl1409	mt466	ply739	60	ply527	right-footed shot
gl1410	mt467	ply2039	70	ply497	right-footed shot
gl1411	mt467	ply2039	76	\N	left-footed shot
gl1412	mt467	ply2210	79	ply2211	right-footed shot
gl1413	mt468	ply1805	47	ply2212	right-footed shot
gl1414	mt468	ply2212	83	ply1120	left-footed shot
gl1415	mt468	\N	86	\N	header
gl1416	mt469	ply831	60	ply837	right-footed shot
gl1417	mt469	ply294	75	ply928	left-footed shot
gl1418	mt469	ply834	87	ply818	left-footed shot
gl1419	mt472	\N	18	ply2193	right-footed shot
gl1420	mt472	ply2178	38	\N	penalty
gl1421	mt472	ply2178	45	\N	penalty
gl1422	mt472	ply144	85	\N	free kick
gl1423	mt472	ply293	90	ply640	right-footed shot
gl1424	mt473	ply96	78	\N	right-footed shot
gl1425	mt473	ply1887	83	\N	right-footed shot
gl1426	mt474	ply1801	49	ply2213	right-footed shot
gl1427	mt475	ply294	7	ply60	left-footed shot
gl1428	mt475	ply928	18	ply60	right-footed shot
gl1429	mt475	ply60	62	ply696	left-footed shot
gl1430	mt475	ply834	70	ply101	left-footed shot
gl1431	mt475	ply2214	72	\N	free kick
gl1432	mt476	ply498	2	\N	left-footed shot
gl1433	mt476	ply724	12	ply739	left-footed shot
gl1434	mt476	ply498	30	\N	left-footed shot
gl1435	mt476	ply704	90	\N	penalty
gl1436	mt477	ply2211	26	ply1479	right-footed shot
gl1437	mt477	\N	37	\N	penalty
gl1438	mt477	ply1479	52	ply864	right-footed shot
gl1439	mt477	ply844	117	ply426	penalty
gl1440	mt478	\N	35	\N	penalty
gl1441	mt478	\N	38	ply293	right-footed shot
gl1442	mt478	ply144	42	ply1070	left-footed shot
gl1443	mt478	ply293	56	ply144	right-footed shot
gl1444	mt478	ply652	71	ply144	left-footed shot
gl1445	mt478	ply654	78	ply144	left-footed shot
gl1446	mt478	ply1064	84	ply652	right-footed shot
gl1447	mt479	ply699	27	ply1112	header
gl1448	mt479	ply699	48	ply644	header
gl1449	mt479	ply699	86	\N	penalty
gl1450	mt480	ply740	17	\N	penalty
gl1451	mt480	ply1509	31	ply1073	left-footed shot
gl1452	mt480	ply1898	58	\N	right-footed shot
gl1453	mt480	ply740	78	\N	right-footed shot
gl1454	mt480	ply384	81	ply740	left-footed shot
gl1455	mt480	ply393	86	ply740	right-footed shot
gl1456	mt481	ply142	26	ply574	left-footed shot
gl1457	mt481	ply569	39	\N	own goal
gl1458	mt481	ply574	69	ply581	header
gl1459	mt481	ply142	84	ply590	header
gl1460	mt482	ply580	5	ply589	right-footed shot
gl1461	mt482	ply589	26	ply564	right-footed shot
gl1462	mt483	ply1805	78	ply691	left-footed shot
gl1463	mt484	ply699	45	ply644	header
gl1464	mt484	ply928	46	\N	right-footed shot
gl1465	mt485	ply684	12	\N	own goal
gl1466	mt486	ply699	28	ply1076	header
gl1467	mt486	ply696	34	ply294	right-footed shot
gl1468	mt486	ply126	67	ply2214	header
gl1469	mt487	ply740	16	\N	left-footed shot
gl1470	mt487	ply740	20	\N	right-footed shot
gl1471	mt487	ply1509	61	ply381	right-footed shot
gl1472	mt488	ply142	26	ply590	right-footed shot
gl1473	mt488	ply590	65	ply564	left-footed shot
gl1474	mt488	ply819	69	ply844	header
gl1475	mt488	ply589	77	ply578	header
gl1476	mt488	ply574	84	ply142	header
gl1477	mt489	ply293	4	ply653	right-footed shot
gl1478	mt489	ply1805	7	\N	right-footed shot
gl1479	mt489	ply1805	10	ply691	right-footed shot
gl1480	mt489	ply652	11	\N	left-footed shot
gl1481	mt489	ply293	21	ply653	left-footed shot
gl1482	mt489	\N	59	ply653	right-footed shot
gl1483	mt489	\N	73	ply1871	\N
gl1484	mt490	ply696	15	ply294	right-footed shot
gl1485	mt491	ply1073	26	ply381	right-footed shot
gl1486	mt491	ply740	75	\N	left-footed shot
gl1487	mt491	ply740	82	\N	free kick
gl1488	mt492	ply30	7	\N	right-footed shot
gl1489	mt492	ply1069	54	ply564	right-footed shot
gl1490	mt492	ply1069	56	ply2167	header
gl1491	mt492	ply30	79	ply564	right-footed shot
gl1492	mt493	ply126	5	ply2214	header
gl1493	mt493	ply294	35	ply60	left-footed shot
gl1494	mt493	ply1802	55	ply176	left-footed shot
gl1495	mt493	ply1802	59	\N	left-footed shot
gl1496	mt493	ply1802	90	ply176	left-footed shot
gl1497	mt494	ply590	2	\N	penalty
gl1498	mt494	ply30	87	ply569	left-footed shot
gl1499	mt495	ply2208	35	ply2209	header
gl1500	mt495	ply498	53	ply39	header
gl1501	mt495	ply704	84	ply2208	right-footed shot
gl1502	mt496	ply1652	50	ply2455	left-footed shot
gl1503	mt496	ply2456	63	\N	penalty
gl1504	mt496	ply2457	71	\N	left-footed shot
gl1505	mt497	ply2285	2	\N	right-footed shot
gl1506	mt497	ply2458	20	ply1105	right-footed shot
gl1507	mt497	ply2459	60	ply2458	penalty
gl1508	mt497	ply2458	69	\N	right-footed shot
gl1509	mt497	ply2460	76	\N	left-footed shot
gl1510	mt498	ply498	4	ply702	header
gl1511	mt498	ply702	19	ply494	penalty
gl1512	mt498	ply498	27	ply702	right-footed shot
gl1513	mt498	ply494	57	\N	left-footed shot
gl1514	mt498	ply2056	90	ply2002	left-footed shot
gl1515	mt499	ply704	64	\N	free kick
gl1516	mt500	ply2296	29	\N	right-footed shot
gl1517	mt500	ply2458	90	ply2296	right-footed shot
gl1518	mt501	ply2014	45	\N	own goal
gl1519	mt501	ply39	78	ply704	penalty
gl1520	mt502	ply2461	32	\N	left-footed shot
gl1521	mt502	ply2462	65	\N	right-footed shot
gl1522	mt502	\N	79	\N	right-footed shot
gl1523	mt503	ply2051	13	ply2463	left-footed shot
gl1524	mt503	\N	56	\N	own goal
gl1525	mt504	ply2285	89	ply2464	right-footed shot
gl1526	mt505	ply2465	5	ply2285	header
gl1527	mt505	ply2458	65	ply642	header
gl1528	mt506	ply2462	45	ply2456	\N
gl1529	mt506	ply498	64	ply522	left-footed shot
gl1530	mt506	ply704	66	ply1643	left-footed shot
gl1531	mt507	ply398	12	ply398	penalty
gl1532	mt507	ply583	65	ply135	right-footed shot
gl1533	mt507	ply135	90	ply1469	right-footed shot
gl1534	mt508	ply741	19	ply523	right-footed shot
gl1535	mt508	ply739	34	ply741	right-footed shot
gl1536	mt508	ply1840	40	ply1840	penalty
gl1537	mt508	ply2466	83	\N	own goal
gl1538	mt508	ply1840	85	ply2467	header
gl1539	mt509	ply2468	2	ply741	right-footed shot
gl1540	mt509	ply1840	31	ply739	right-footed shot
gl1541	mt509	ply741	63	\N	right-footed shot
gl1542	mt510	\N	38	ply2469	right-footed shot
gl1543	mt510	ply2470	50	\N	left-footed shot
gl1544	mt510	\N	90	ply2471	left-footed shot
gl1545	mt511	ply739	3	ply735	right-footed shot
gl1546	mt511	ply1840	44	ply739	header
gl1547	mt511	ply741	66	\N	free kick
gl1548	mt511	ply527	88	\N	left-footed shot
gl1549	mt512	ply143	17	\N	right-footed shot
gl1550	mt512	ply135	29	ply140	header
gl1551	mt512	ply199	51	\N	header
gl1552	mt513	ply735	30	ply739	right-footed shot
gl1553	mt513	ply741	45	ply922	right-footed shot
gl1554	mt513	ply2467	52	\N	left-footed shot
gl1555	mt513	ply2467	72	ply1021	header
gl1556	mt513	ply2467	78	ply527	left-footed shot
gl1557	mt514	ply140	22	ply124	left-footed shot
gl1558	mt514	ply2267	74	ply2472	left-footed shot
gl1559	mt514	ply1464	77	ply816	header
gl1560	mt515	ply398	51	ply1092	right-footed shot
gl1561	mt515	ply2473	63	\N	right-footed shot
gl1562	mt515	ply1092	77	ply135	header
gl1563	mt516	ply1707	1	ply2471	\N
gl1564	mt516	ply741	9	ply523	left-footed shot
gl1565	mt516	ply741	22	ply735	left-footed shot
gl1566	mt516	ply1840	28	ply741	right-footed shot
gl1567	mt516	ply739	35	ply726	right-footed shot
gl1568	mt516	ply735	75	\N	right-footed shot
gl1569	mt516	ply1840	79	ply2467	right-footed shot
gl1570	mt516	ply2468	80	ply1021	\N
gl1571	mt517	ply398	8	ply140	left-footed shot
gl1572	mt517	ply1092	37	ply1390	header
gl1573	mt517	ply739	50	ply1840	header
gl1574	mt517	ply1092	69	ply140	right-footed shot
gl1575	mt518	\N	62	\N	own goal
gl1576	mt520	ply1326	5	ply1900	right-footed shot
gl1577	mt520	ply76	30	\N	right-footed shot
gl1578	mt520	ply273	55	ply2474	header
gl1579	mt520	ply18	71	\N	\N
gl1580	mt520	ply1901	76	ply18	right-footed shot
gl1581	mt520	ply2378	82	ply76	own goal
gl1582	mt521	ply2200	7	ply2032	header
gl1583	mt521	ply497	15	ply2037	right-footed shot
gl1584	mt521	ply2475	28	ply2476	right-footed shot
gl1585	mt522	ply115	40	ply127	penalty
gl1586	mt522	ply118	60	ply832	header
gl1587	mt522	ply1901	90	ply383	right-footed shot
gl1588	mt524	ply2477	11	\N	right-footed shot
gl1589	mt524	ply832	37	ply118	right-footed shot
gl1590	mt524	\N	40	\N	left-footed shot
gl1591	mt524	ply497	64	ply2478	left-footed shot
gl1592	mt524	ply497	70	\N	header
gl1593	mt524	ply832	75	ply1326	header
gl1594	mt525	ply2037	1	ply497	right-footed shot
gl1595	mt525	ply2037	36	ply2165	right-footed shot
gl1596	mt525	\N	63	\N	right-footed shot
gl1597	mt526	\N	40	ply2479	header
gl1598	mt526	ply1873	56	ply115	right-footed shot
gl1599	mt527	ply832	21	\N	penalty
gl1600	mt527	ply1900	36	ply832	right-footed shot
gl1601	mt527	ply2474	73	\N	penalty
gl1602	mt527	ply1900	85	ply1326	right-footed shot
gl1603	mt528	ply115	69	ply114	left-footed shot
gl1604	mt528	ply1903	86	ply115	right-footed shot
gl1605	mt529	ply113	56	\N	header
gl1606	mt529	ply103	75	\N	own goal
gl1607	mt530	\N	53	\N	header
gl1608	mt531	ply740	45	ply1073	left-footed shot
gl1609	mt531	ply863	56	\N	left-footed shot
gl1610	mt531	ply740	69	ply2480	left-footed shot
gl1611	mt532	\N	2	ply843	header
gl1612	mt532	ply2009	13	\N	right-footed shot
gl1613	mt532	ply689	43	ply940	right-footed shot
gl1614	mt532	ply2481	89	\N	left-footed shot
gl1615	mt532	ply2481	90	\N	left-footed shot
gl1616	mt533	ply1869	69	ply1471	right-footed shot
gl1617	mt533	\N	80	\N	right-footed shot
gl1618	mt534	ply940	49	\N	own goal
gl1619	mt535	ply2482	18	\N	own goal
gl1620	mt535	ply740	61	\N	free kick
gl1621	mt535	ply2483	64	ply740	left-footed shot
gl1622	mt535	ply2482	90	ply1381	header
gl1623	mt536	ply505	12	\N	own goal
gl1624	mt536	ply1076	29	\N	free kick
gl1625	mt536	\N	84	ply1471	header
gl1626	mt538	ply2484	20	\N	right-footed shot
gl1627	mt538	ply1869	79	ply509	right-footed shot
gl1628	mt540	ply2485	40	ply2009	right-footed shot
gl1629	mt540	ply2484	43	\N	left-footed shot
gl1630	mt540	ply2485	66	ply689	header
gl1631	mt540	ply2486	86	\N	\N
gl1632	mt541	ply1098	59	ply2487	header
gl1633	mt541	\N	90	\N	own goal
gl1634	mt542	ply509	15	ply505	left-footed shot
gl1635	mt542	ply1112	90	\N	left-footed shot
gl1636	mt543	ply2007	5	ply2488	right-footed shot
gl1637	mt543	ply589	21	ply1006	right-footed shot
gl1638	mt543	ply590	37	\N	right-footed shot
gl1639	mt543	ply496	72	ply86	right-footed shot
gl1640	mt544	\N	59	\N	right-footed shot
gl1641	mt544	ply2489	85	ply2490	right-footed shot
gl1642	mt545	ply2491	23	\N	free kick
gl1643	mt545	ply1509	31	ply142	right-footed shot
gl1644	mt546	ply2007	27	ply496	right-footed shot
gl1645	mt546	ply2007	38	ply2492	left-footed shot
gl1646	mt546	ply2007	83	ply2493	penalty
gl1647	mt547	ply1484	18	\N	header
gl1648	mt547	ply14	30	\N	left-footed shot
gl1649	mt547	ply2494	58	ply1484	left-footed shot
gl1650	mt547	ply2495	67	\N	left-footed shot
gl1651	mt547	ply2496	74	\N	right-footed shot
gl1652	mt547	ply1484	90	\N	right-footed shot
gl1653	mt548	ply589	4	ply590	right-footed shot
gl1654	mt548	ply1509	13	ply581	right-footed shot
gl1655	mt548	ply590	19	ply589	left-footed shot
gl1656	mt548	ply590	40	ply1006	left-footed shot
gl1657	mt548	ply589	54	ply1509	header
gl1658	mt548	ply582	86	\N	right-footed shot
gl1659	mt548	ply564	90	\N	right-footed shot
gl1660	mt549	ply1788	30	ply2497	header
gl1661	mt549	ply2497	59	ply733	left-footed shot
gl1662	mt549	ply1463	78	\N	right-footed shot
gl1663	mt550	ply590	49	ply564	back heel
gl1664	mt550	ply209	64	ply581	right-footed shot
gl1665	mt550	\N	90	ply1006	left-footed shot
gl1666	mt551	ply1463	82	ply2494	left-footed shot
gl1667	mt551	ply2498	90	\N	right-footed shot
gl1668	mt552	ply589	2	ply1069	left-footed shot
gl1669	mt552	ply142	22	ply589	header
gl1670	mt552	ply589	30	\N	left-footed shot
gl1671	mt552	ply2007	51	ply2497	header
gl1672	mt552	ply2007	60	ply2007	penalty
gl1673	mt552	ply2499	90	\N	left-footed shot
gl1674	mt553	ply1509	4	ply590	penalty
gl1675	mt553	ply1509	15	ply589	left-footed shot
gl1676	mt553	ply589	19	ply142	right-footed shot
gl1677	mt553	ply142	47	ply581	right-footed shot
gl1678	mt553	ply1509	50	ply581	left-footed shot
gl1679	mt553	ply142	76	\N	right-footed shot
gl1981	mt644	ply2480	59	ply741	right-footed shot
gl1982	mt644	ply740	60	ply1073	left-footed shot
gl1983	mt644	ply1073	75	ply741	left-footed shot
gl1984	mt644	ply1073	88	ply740	right-footed shot
gl1985	mt645	\N	9	\N	right-footed shot
gl1986	mt645	\N	28	ply656	penalty
gl1987	mt645	\N	77	ply293	left-footed shot
gl1988	mt645	ply2671	90	ply144	left-footed shot
gl1989	mt646	ply212	34	ply210	right-footed shot
gl1990	mt646	\N	65	ply741	right-footed shot
gl1991	mt646	ply384	74	\N	right-footed shot
gl1992	mt647	ply1707	3	ply1168	header
gl1993	mt647	ply1067	12	\N	left-footed shot
gl1994	mt647	ply293	20	\N	own goal
gl1995	mt647	ply293	28	ply2193	right-footed shot
gl1996	mt647	ply1707	47	\N	right-footed shot
gl1997	mt647	ply2724	55	\N	right-footed shot
gl1998	mt648	ply1148	57	ply2725	right-footed shot
gl1999	mt648	ply2725	77	ply1148	right-footed shot
gl2000	mt649	ply740	17	\N	left-footed shot
gl2001	mt649	ply740	61	ply2480	left-footed shot
gl2002	mt649	ply740	69	ply1073	left-footed shot
gl2003	mt649	ply741	89	ply740	right-footed shot
gl2004	mt650	ply1148	32	ply212	right-footed shot
gl2005	mt650	ply1707	76	ply1707	penalty
gl2006	mt651	ply740	21	ply741	left-footed shot
gl2007	mt651	ply656	39	ply293	left-footed shot
gl2008	mt651	ply653	51	\N	free kick
gl2009	mt651	ply656	74	\N	right-footed shot
gl2010	mt652	\N	23	ply1148	right-footed shot
gl2011	mt652	ply2193	45	ply653	left-footed shot
gl2012	mt653	ply740	24	ply741	left-footed shot
gl2013	mt653	ply740	55	ply1073	penalty
gl2014	mt654	ply740	16	\N	left-footed shot
gl2015	mt654	\N	50	ply2487	header
gl2016	mt654	\N	53	ply2726	right-footed shot
gl2017	mt654	\N	67	ply1098	right-footed shot
gl2018	mt655	ply2470	4	ply2466	left-footed shot
gl2019	mt655	ply2671	8	ply2724	left-footed shot
gl2020	mt656	ply398	28	ply398	penalty
gl2021	mt656	ply143	45	ply816	left-footed shot
gl2022	mt656	ply135	53	ply1471	right-footed shot
gl2023	mt656	ply135	60	ply724	header
gl2024	mt656	ply724	90	ply2188	left-footed shot
gl2025	mt657	ply113	43	\N	left-footed shot
gl2026	mt658	ply107	35	ply115	left-footed shot
gl2027	mt659	ply2616	8	ply1050	right-footed shot
gl2028	mt659	\N	14	ply1492	right-footed shot
gl2029	mt659	ply2616	37	ply1115	right-footed shot
gl2030	mt659	ply1492	45	\N	header
gl2031	mt660	ply143	13	\N	left-footed shot
gl2032	mt660	ply135	21	ply816	header
gl2033	mt660	ply2727	41	ply2166	right-footed shot
gl2034	mt660	ply398	59	\N	header
gl2035	mt660	\N	84	ply583	header
gl2036	mt661	ply107	62	\N	left-footed shot
gl2037	mt662	ply115	28	ply107	left-footed shot
gl2038	mt662	ply1115	30	ply2616	right-footed shot
gl2039	mt662	ply115	90	\N	left-footed shot
gl2040	mt663	ply93	14	\N	header
gl2041	mt663	ply398	34	\N	penalty
gl2042	mt663	ply398	74	ply816	right-footed shot
gl2043	mt664	ply1471	35	\N	left-footed shot
gl2044	mt664	ply1115	44	ply2616	right-footed shot
gl2045	mt664	ply2616	50	ply2728	penalty
gl2046	mt664	ply724	52	ply2188	left-footed shot
gl2047	mt664	ply2728	67	\N	free kick
gl2048	mt665	ply1903	55	ply115	right-footed shot
gl2049	mt665	ply115	66	\N	left-footed shot
gl2050	mt666	ply398	28	\N	free kick
gl2051	mt668	ply2729	9	ply489	right-footed shot
gl2052	mt668	ply489	15	ply759	left-footed shot
gl2053	mt668	ply2462	36	ply1253	left-footed shot
gl2054	mt668	ply2730	38	\N	right-footed shot
gl2055	mt669	ply652	15	\N	left-footed shot
gl2056	mt669	ply111	31	\N	left-footed shot
gl2057	mt669	ply2522	45	ply867	header
gl2058	mt670	ply2731	74	ply2729	header
gl2059	mt670	ply2518	90	ply2732	right-footed shot
gl2060	mt671	ply1805	71	ply867	right-footed shot
gl2061	mt673	\N	34	\N	left-footed shot
gl2062	mt673	ply652	87	\N	left-footed shot
gl2063	mt674	ply2733	13	\N	right-footed shot
gl2064	mt674	ply2512	29	ply647	right-footed shot
gl2065	mt674	ply2512	41	ply2733	left-footed shot
gl2066	mt675	ply759	65	\N	right-footed shot
gl2067	mt676	ply1876	16	ply759	right-footed shot
gl2068	mt676	ply2463	76	\N	penalty
gl2069	mt677	ply1960	48	ply647	header
gl2070	mt677	ply1801	52	ply176	penalty
gl2071	mt677	ply111	53	ply1960	left-footed shot
gl2072	mt678	ply2734	30	ply414	right-footed shot
gl2073	mt678	ply208	48	ply489	right-footed shot
gl2074	mt678	\N	82	\N	own goal
gl2075	mt679	ply2462	33	ply2735	right-footed shot
gl2076	mt679	ply176	38	ply691	right-footed shot
gl2077	mt679	ply1801	45	\N	right-footed shot
gl2078	mt679	ply2041	77	\N	own goal
gl2079	mt680	ply1888	7	ply393	header
gl2080	mt680	ply1374	15	ply198	header
gl2081	mt680	ply2736	17	\N	right-footed shot
gl2082	mt680	ply198	51	\N	left-footed shot
gl2083	mt680	\N	76	ply292	right-footed shot
gl2084	mt680	ply290	87	\N	left-footed shot
gl2085	mt681	ply2484	48	\N	left-footed shot
gl2086	mt681	ply699	89	\N	free kick
gl2087	mt681	ply118	90	ply1390	header
gl2088	mt682	ply699	17	ply2197	right-footed shot
gl2089	mt682	ply290	43	\N	right-footed shot
gl2090	mt682	ply686	68	\N	right-footed shot
gl2091	mt682	\N	87	ply292	left-footed shot
gl2092	mt683	ply2737	28	\N	left-footed shot
gl2093	mt683	ply2485	37	ply2738	right-footed shot
gl2094	mt684	ply2197	16	ply510	left-footed shot
gl2095	mt684	ply2739	20	\N	own goal
gl2096	mt684	\N	22	\N	penalty
gl2097	mt684	ply834	37	ply699	left-footed shot
gl2098	mt684	ply833	68	ply118	right-footed shot
gl2099	mt684	ply118	84	ply699	right-footed shot
gl2100	mt685	ply290	9	ply1888	left-footed shot
gl2101	mt685	ply1144	43	\N	right-footed shot
gl2102	mt685	ply2484	67	ply2740	ind. free kick
gl2103	mt686	ply2741	12	ply2742	header
gl2104	mt687	ply2197	1	ply699	left-footed shot
gl2105	mt687	ply831	35	ply2197	right-footed shot
gl2106	mt687	ply2486	40	ply2743	left-footed shot
gl2107	mt687	\N	58	ply2744	right-footed shot
gl2108	mt687	ply2744	83	ply2745	right-footed shot
gl2109	mt687	ply286	85	ply818	right-footed shot
gl2110	mt688	ply2745	10	ply2486	right-footed shot
gl2111	mt688	ply2521	17	ply393	header
gl2112	mt688	ply2521	18	ply393	left-footed shot
gl2113	mt688	\N	20	\N	\N
gl2114	mt688	ply2745	24	ply2746	right-footed shot
gl2115	mt688	ply393	29	ply225	right-footed shot
gl2116	mt688	ply225	32	ply2521	right-footed shot
gl2117	mt688	ply225	52	ply393	right-footed shot
gl2118	mt688	ply2747	57	\N	right-footed shot
gl2119	mt688	ply202	81	\N	header
gl2120	mt688	ply2748	83	\N	right-footed shot
gl2121	mt688	ply2749	90	\N	own goal
gl2122	mt689	ply686	29	ply699	left-footed shot
gl2123	mt689	ply2738	80	\N	penalty
gl2124	mt689	ply831	87	ply729	header
gl2125	mt690	ply2743	30	ply2745	right-footed shot
gl2126	mt691	ply831	28	ply818	right-footed shot
gl2127	mt691	ply831	53	ply1390	header
gl2128	mt691	ply290	60	\N	right-footed shot
gl2129	mt691	ply225	88	ply290	left-footed shot
gl2130	mt692	ply2660	5	\N	right-footed shot
gl2131	mt692	ply664	29	\N	free kick
gl2132	mt692	ply664	61	\N	penalty
gl2133	mt693	ply422	13	ply763	right-footed shot
gl2134	mt693	ply2584	52	\N	header
gl2135	mt694	ply2750	53	\N	own goal
gl2136	mt694	ply853	64	ply2751	left-footed shot
gl2137	mt694	ply2752	69	ply2753	left-footed shot
gl2138	mt694	ply2754	90	ply2753	header
gl2139	mt695	ply2755	25	ply664	header
gl2140	mt696	ply2756	12	ply323	right-footed shot
gl2141	mt696	ply2511	68	ply422	right-footed shot
gl2142	mt696	ply763	90	ply864	penalty
gl2143	mt697	ply664	40	ply2755	left-footed shot
gl2144	mt699	ply763	37	ply844	header
gl2145	mt701	ply2757	5	ply2758	left-footed shot
gl2146	mt701	ply664	30	ply2660	penalty
gl2147	mt701	\N	52	\N	right-footed shot
gl2148	mt702	ply307	8	\N	own goal
gl2149	mt702	ply2754	15	ply2753	header
gl2150	mt703	ply763	6	ply864	header
gl2151	mt703	ply864	26	ply844	left-footed shot
gl2152	mt703	ply2172	44	ply2515	back heel
gl2153	mt703	ply763	64	ply763	penalty
gl2154	mt703	ply586	77	ply763	right-footed shot
gl2155	mt705	ply1092	13	ply2759	header
gl2156	mt705	ply2760	49	ply1909	right-footed shot
gl2157	mt705	ply1909	57	ply1092	left-footed shot
gl2158	mt706	ply1076	24	\N	right-footed shot
gl2159	mt706	ply1869	31	ply1076	left-footed shot
gl2160	mt706	ply1110	57	ply2468	left-footed shot
gl2161	mt706	ply2468	85	\N	free kick
gl2162	mt707	ply2007	53	ply2761	header
gl2163	mt708	\N	37	ply2762	left-footed shot
gl2164	mt709	ply509	76	ply2468	right-footed shot
gl2165	mt710	ply1869	13	\N	penalty
gl2166	mt710	ply1092	84	ply187	header
gl2167	mt711	ply2761	31	ply2492	left-footed shot
gl2168	mt711	ply2488	66	ply2763	right-footed shot
gl2169	mt711	ply2764	80	ply733	header
gl2170	mt711	ply2007	87	ply2762	right-footed shot
gl2171	mt712	ply1708	72	ply2759	left-footed shot
gl2172	mt713	\N	9	\N	right-footed shot
gl2173	mt713	\N	45	ply507	penalty
gl2174	mt713	ply507	84	\N	left-footed shot
gl2175	mt713	\N	90	\N	right-footed shot
gl2176	mt714	ply1869	52	ply2765	right-footed shot
gl2177	mt714	ply513	73	ply1076	header
gl2178	mt716	\N	48	\N	left-footed shot
gl2179	mt717	ply527	18	\N	free kick
gl2180	mt717	ply922	40	ply735	right-footed shot
gl2181	mt717	ply527	55	ply922	left-footed shot
gl2182	mt717	ply1840	72	ply201	right-footed shot
gl2183	mt718	ply1884	8	ply2169	right-footed shot
gl2184	mt718	ply831	18	ply818	header
gl2185	mt718	ply827	49	ply699	right-footed shot
gl2186	mt718	ply690	54	\N	right-footed shot
gl2187	mt719	\N	11	ply1471	left-footed shot
gl2188	mt719	ply1088	30	\N	right-footed shot
gl2189	mt719	ply398	53	\N	header
gl2190	mt719	ply583	56	ply398	right-footed shot
gl2191	mt719	ply583	63	\N	right-footed shot
gl2192	mt719	ply143	88	ply583	left-footed shot
gl2193	mt720	ply293	26	ply144	right-footed shot
gl2194	mt720	ply2512	32	ply577	header
gl2195	mt720	ply739	40	ply577	right-footed shot
gl2196	mt720	\N	58	ply293	right-footed shot
gl2197	mt720	ply2512	61	ply111	right-footed shot
gl2198	mt720	\N	71	ply2193	right-footed shot
gl2199	mt720	ply649	77	\N	right-footed shot
gl2200	mt720	ply144	82	\N	right-footed shot
gl2201	mt721	ply113	17	\N	left-footed shot
gl2202	mt721	ply115	25	ply1903	left-footed shot
gl2203	mt721	ply1547	48	ply751	right-footed shot
gl2204	mt721	ply1903	59	ply1903	penalty
gl2205	mt721	ply103	68	\N	own goal
gl2206	mt721	\N	86	ply1378	header
gl2207	mt722	ply2766	72	\N	right-footed shot
gl2208	mt722	ply2468	74	ply505	left-footed shot
gl2209	mt723	ply733	25	ply2488	header
gl2210	mt723	ply496	62	ply2767	right-footed shot
gl2211	mt723	ply2672	73	\N	right-footed shot
gl2212	mt724	ply1650	24	ply2169	left-footed shot
gl2213	mt724	ply729	51	ply827	header
gl2214	mt724	ply1650	57	\N	own goal
gl2215	mt724	ply118	90	\N	right-footed shot
gl2216	mt725	ply2709	20	ply26	right-footed shot
gl2217	mt725	ply398	55	ply398	penalty
gl2218	mt725	\N	68	\N	left-footed shot
gl2219	mt725	ply1471	78	ply2186	left-footed shot
gl2220	mt725	ply1086	80	\N	right-footed shot
gl2221	mt725	ply1086	85	ply1471	right-footed shot
gl2222	mt726	ply290	4	ply292	header
gl2223	mt726	ply292	59	\N	right-footed shot
gl2224	mt726	ply290	61	\N	right-footed shot
gl2225	mt726	ply290	85	ply2768	right-footed shot
gl2226	mt727	ply1073	3	\N	header
gl2227	mt727	ply2467	40	\N	own goal
gl2228	mt727	ply740	50	ply741	penalty
gl2229	mt727	ply1840	62	ply2467	right-footed shot
gl2230	mt727	ply741	88	\N	free kick
gl2231	mt727	ply741	90	ply1073	penalty
gl2232	mt727	ply392	90	ply741	right-footed shot
gl2233	mt728	ply1110	42	\N	penalty
gl2234	mt729	\N	27	ply664	right-footed shot
gl2235	mt729	ply2660	54	\N	left-footed shot
gl2236	mt730	ply739	8	ply652	right-footed shot
gl2237	mt730	ply577	29	ply647	right-footed shot
gl2238	mt730	ply144	71	\N	left-footed shot
gl2239	mt730	ply18	77	ply111	header
gl2240	mt732	ply1110	7	ply509	left-footed shot
gl2241	mt732	ply1110	22	\N	left-footed shot
gl2242	mt732	ply2769	55	ply1076	header
gl2243	mt733	ply739	19	ply111	right-footed shot
gl2244	mt733	\N	35	\N	own goal
gl2245	mt733	ply393	57	ply2521	left-footed shot
gl2246	mt733	ply739	79	\N	right-footed shot
gl2247	mt733	ply2521	84	\N	left-footed shot
gl2248	mt734	ply115	28	ply115	penalty
gl2249	mt735	ply1086	25	ply583	header
gl2250	mt735	ply699	47	ply818	right-footed shot
gl2251	mt735	ply699	77	ply834	right-footed shot
gl2252	mt736	ply113	26	ply2163	header
gl2253	mt736	ply2672	61	\N	right-footed shot
gl2254	mt737	ply398	53	\N	penalty
gl2255	mt737	ply699	76	ply690	header
gl2256	mt737	ply729	78	\N	own goal
gl2257	mt737	ply699	105	ply729	left-footed shot
gl2258	mt737	ply699	110	ply1371	right-footed shot
gl2259	mt737	ply834	112	\N	right-footed shot
gl2260	mt739	ply739	3	ply647	right-footed shot
gl2261	mt739	ply2512	17	ply111	header
gl2262	mt739	ply225	48	ply393	right-footed shot
gl2263	mt739	ply2733	81	ply111	right-footed shot
gl2264	mt740	ply699	10	ply690	header
gl2265	mt740	ply699	73	\N	right-footed shot
gl2266	mt740	ply699	86	ply833	right-footed shot
gl2267	mt741	ply1869	29	ply2468	right-footed shot
gl2268	mt741	ply1869	59	ply2468	left-footed shot
gl2269	mt742	\N	33	ply2468	left-footed shot
gl2270	mt742	ply2468	44	\N	right-footed shot
gl2271	mt742	ply739	69	ply2514	right-footed shot
gl2272	mt743	ply113	12	ply109	header
gl2273	mt743	ply115	16	\N	penalty
gl2274	mt743	ply857	42	\N	right-footed shot
gl2275	mt744	ply699	20	ply818	right-footed shot
gl2276	mt744	\N	27	ply1869	bicycle kick
gl2277	mt744	ply690	61	\N	right-footed shot
gl2278	mt744	ply699	64	ply828	right-footed shot
gl2279	mt744	ply834	90	ply1371	left-footed shot
\.


--
-- Data for Name: managers; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.managers ("MANAGER_ID", "FIRST_NAME", "LAST_NAME", "NATIONALITY", "DOB", "TEAM") FROM stdin;
1	Stefano	Pioli	Italy	1965-10-19 00:00:00	AC Milan
2	Alfred	Schreuder	Netherlands	1972-11-02 00:00:00	AFC Ajax
3	Gian Piero	Gasperini	Italy	1958-01-26 00:00:00	Atalanta
4	Diego	Simeone	Argentina	1970-04-28 00:00:00	Atlético Madrid
5	Julian	Nagelsmann	Germany	1987-07-23 00:00:00	Bayern München
6	Valérien	Ismaël	France	1975-09-28 00:00:00	Beşiktaş
7	Edin	Terzić	Germany	1982-10-30 00:00:00	Borussia Dortmund
8	Raphaël	Wicky	Switzerland	1977-04-26 00:00:00	BSC Young Boys
9	Graham	Potter	England	1975-05-20 00:00:00	Chelsea FC
10	Carl	Hoefkens	Belgium	1978-10-06 00:00:00	Club Brugge KV
11	Mircea	Lucescu	Romania	1945-07-29 00:00:00	Dinamo Kiev
12	\N	Xavi	Spain	1980-01-25 00:00:00	FC Barcelona
13	Sérgio	Conceição	Portugal	1974-11-15 00:00:00	FC Porto
14	Stjepan	Tomas	Croatia	1976-06-03 00:00:00	FC Sheriff
15	Simone	Inzaghi	Italy	1976-04-05 00:00:00	Inter
16	Massimiliano	Allegri	Italy	1967-08-11 00:00:00	Juventus
17	Paulo	Fonseca	Portugal	1973-03-05 00:00:00	Lille OSC
18	Jürgen	Klopp	Germany	1967-06-16 00:00:00	Liverpool FC
19	Åge	Hareide	Norway	1953-09-23 00:00:00	Malmö FF
20	Pep	Guardiola	Spain	1971-01-18 00:00:00	Manchester City
21	Erik ten	Hag	Netherlands	1970-02-02 00:00:00	Manchester United
22	Christophe	Galtier	France	1966-08-26 00:00:00	Paris Saint-Germain
23	Marco	Rose	Germany	1976-09-11 00:00:00	RB Leipzig
24	Matthias	Jaissle	Germany	1988-04-05 00:00:00	RB Salzburg
25	Carlo	Ancelotti	Italy	1959-06-10 00:00:00	Real Madrid
26	\N	Lopetegui	Spain	1966-09-28 00:00:00	Sevilla FC
27	Igor	Jovićević	Croatia	1973-11-30 00:00:00	Shakhtar Donetsk
28	Roger	Schmidt	Germany	1967-03-13 00:00:00	SL Benfica
29	Rúben	Amorim	Portugal	1985-01-27 00:00:00	Sporting CP
30	Niko	Kovač	Croatia	1971-10-15 00:00:00	VfL Wolfsburg
31	Unai	Emery	Spain	1971-11-03 00:00:00	Villarreal CF
32	Sergey	Semak	Russia	1976-02-27 00:00:00	Zenit St. Petersburg
33	Daniel	Farke	Germany	1976-10-30 00:00:00	Bor. Mönchengladbach
34	Albert	Capellas	Spain	1967-10-01 00:00:00	FC Midtjylland
35	Stanislav	Cherchesov	Russia	1963-09-02 00:00:00	Ferencvárosi TC
36	Aleksandr	Storozhuk	Russia	1981-08-10 00:00:00	FK Krasnodar
37	Emre	Belözoğlu	Turkey	1980-09-07 00:00:00	İstanbul Başakşehir
38	Maurizio	Sarri	Italy	1959-01-10 00:00:00	Lazio Roma
39	Joe	Zinnbauer	Germany	1970-05-01 00:00:00	Lokomotiv Moskva
40	Carlos	Corberán	Spain	1983-04-07 00:00:00	Olympiakos Piraeus
41	\N	Míchel	Spain	1963-03-23 00:00:00	Olympiakos Piraeus
42	Igor	Tudor	Croatia	1978-04-16 00:00:00	Olympique Marseille
43	Bruno	Génésio	France	1966-09-01 00:00:00	Stade Rennes
44	Xabi	Alonso	Spain	1981-11-25 00:00:00	Bayer Leverkusen
45	Miloš	Milojević	Serbia	1982-09-29 00:00:00	Crvena Zvezda
46	Ante	Čačić	Croatia	1953-09-29 00:00:00	Dinamo Zagreb
47	Okan	Buruk	Turkey	1973-10-19 00:00:00	Galatasaray
48	Wouter	Vrancken	Belgium	1979-02-03 00:00:00	KRC Genk
49	Peter	Bosz	Netherlands	1963-11-21 00:00:00	Olympique Lyon
50	Luciano	Spalletti	Italy	1959-03-07 00:00:00	SSC Napoli
51	Antonio	Conte	Italy	1969-07-31 00:00:00	Tottenham Hotspur
52	Gennaro	Gattuso	Italy	1978-01-09 00:00:00	Valencia CF
53	André	Breitenreiter	Germany	1973-10-02 00:00:00	1899 Hoffenheim
54	Matías	Almeyda	Argentina	1973-12-21 00:00:00	AEK Athen
55	Philippe	Clement	Belgium	1974-03-22 00:00:00	AS Monaco
56	José	Mourinho	Portugal	1963-01-26 00:00:00	AS Roma
57	Vladimir	Fedotov	Russia	1966-08-12 00:00:00	CSKA Moskva
58	Frank	Kramer	Germany	1972-05-03 00:00:00	FC Schalke 04
59	Ruud van	Nistelrooy	Netherlands	1976-07-01 00:00:00	PSV Eindhoven
60	Sofronis	Avgousti	Cyprus	1977-03-09 00:00:00	APOEL Nikosia
61	Ange	Postecoglou	Australia	1965-08-27 00:00:00	Celtic FC
62	Alexander	Frei	Switzerland	1979-07-15 00:00:00	FC Basel
63	Arne	Slot	Netherlands	1978-09-17 00:00:00	Feyenoord
64	Damir	Krznar	Croatia	1972-07-10 00:00:00	NK Maribor
65	Qurban	Qurbanov	Azerbaijan	1972-04-13 00:00:00	Qarabağ FK
66	Felice	Mazzù	Belgium	1966-03-12 00:00:00	RSC Anderlecht
67	Guillermo	Abascal	Spain	1989-04-13 00:00:00	Spartak Moskva
68	Fernando	Torres	Spain	1984-03-20 00:00:00	\N
69	Dmitriy	Kombarov	Russia	1987-01-22 00:00:00	\N
70	Sandro	Wagner	Germany	1987-11-29 00:00:00	\N
71	Stephan	Lichtsteiner	Switzerland	1984-01-16 00:00:00	\N
72	Mikel	Arteta	Spain	1982-03-26 00:00:00	Arsenal FC
73	Jacob	Neestrup	Denmark	1988-03-08 00:00:00	FC København
74	Valeriy	Karpin	Russia	1969-02-02 00:00:00	FK Rostov
75	Kosta	Runjaic	Germany	1971-06-04 00:00:00	Legia Warszawa
76	Brendan	Rodgers	Northern Ireland	1973-01-26 00:00:00	Leicester City
77	Ante	Šimundža	Slovenia	1971-09-28 00:00:00	PFC Ludogorets Razgrad
78	Nuri	Şahin	Turkey	1988-09-05 00:00:00	\N
\.


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.matches ("MATCH_ID", "SEASON", "DATE_TIME", "HOME_TEAM", "AWAY_TEAM", "STADIUM", "STADIUM_CITY", "HOME_TEAM_SCORE", "AWAY_TEAM_SCORE", "PENALTY_SHOOT_OUT", "ATTENDANCE") FROM stdin;
mt1	2021-2022	2021-09-15 20:00:00	Manchester City	RB Leipzig	Etihad Stadium	Manchester	6	3	0	38062
mt2	2021-2022	2021-09-15 20:00:00	Club Brugge KV	Paris Saint-Germain	Jan Breydel Stadion	Brugge	1	1	0	27546
mt3	2021-2022	2021-09-28 20:00:00	Paris Saint-Germain	Manchester City	Parc des Princes	Paris	2	0	0	37350
mt4	2021-2022	2021-09-28 20:00:00	RB Leipzig	Club Brugge KV	Red Bull Arena	Wals-Siezenheim	1	2	0	23500
mt5	2021-2022	2021-10-19 17:45:00	Club Brugge KV	Manchester City	Jan Breydel Stadion	Brugge	1	5	0	24915
mt6	2021-2022	2021-10-19 20:00:00	Paris Saint-Germain	RB Leipzig	Parc des Princes	Paris	3	2	0	47359
mt7	2021-2022	2021-11-03 20:00:00	RB Leipzig	Paris Saint-Germain	Red Bull Arena	Wals-Siezenheim	2	2	0	39794
mt8	2021-2022	2021-11-03 20:00:00	Manchester City	Club Brugge KV	Etihad Stadium	Manchester	4	1	0	50228
mt9	2021-2022	2021-11-24 20:00:00	Manchester City	Paris Saint-Germain	Etihad Stadium	Manchester	2	1	0	52030
mt10	2021-2022	2021-11-24 20:00:00	Club Brugge KV	RB Leipzig	Jan Breydel Stadion	Brugge	0	5	0	24072
mt11	2021-2022	2021-12-07 17:45:00	RB Leipzig	Manchester City	Red Bull Arena	Wals-Siezenheim	2	1	0	0
mt12	2021-2022	2021-12-07 17:45:00	Paris Saint-Germain	Club Brugge KV	Parc des Princes	Paris	4	1	0	47492
mt13	2021-2022	2021-09-15 20:00:00	Atlético Madrid	FC Porto	Wanda Metropolitano	Madrid	0	0	0	40098
mt14	2021-2022	2021-09-15 20:00:00	Liverpool FC	AC Milan	Anfield	Liverpool	3	2	0	51445
mt15	2021-2022	2021-09-28 20:00:00	FC Porto	Liverpool FC	Estádio do Dragão	Porto	1	5	0	23520
mt16	2021-2022	2021-09-28 20:00:00	AC Milan	Atlético Madrid	Giuseppe Meazza	Milano	1	2	0	35374
mt17	2021-2022	2021-10-19 20:00:00	Atlético Madrid	Liverpool FC	Wanda Metropolitano	Madrid	2	3	0	60725
mt18	2021-2022	2021-10-19 20:00:00	FC Porto	AC Milan	Estádio do Dragão	Porto	1	0	0	32130
mt19	2021-2022	2021-11-03 17:45:00	AC Milan	FC Porto	Giuseppe Meazza	Milano	1	1	0	39675
mt20	2021-2022	2021-11-03 20:00:00	Liverpool FC	Atlético Madrid	Anfield	Liverpool	2	0	0	51347
mt21	2021-2022	2021-11-24 20:00:00	Liverpool FC	FC Porto	Anfield	Liverpool	2	0	0	52209
mt22	2021-2022	2021-11-24 20:00:00	Atlético Madrid	AC Milan	Wanda Metropolitano	Madrid	0	1	0	61019
mt23	2021-2022	2021-12-07 20:00:00	FC Porto	Atlético Madrid	Estádio do Dragão	Porto	1	3	0	38830
mt24	2021-2022	2021-12-07 20:00:00	AC Milan	Liverpool FC	Giuseppe Meazza	Milano	1	2	0	56237
mt25	2021-2022	2021-09-15 17:45:00	Beşiktaş	Borussia Dortmund	Vodafone Park	Istanbul	1	2	0	22445
mt26	2021-2022	2021-09-15 20:00:00	Sporting CP	AFC Ajax	Estádio José Alvalade	Lisboa	1	5	0	20382
mt27	2021-2022	2021-09-28 17:45:00	AFC Ajax	Beşiktaş	Johan Cruijff ArenA	Amsterdam	2	0	0	52628
mt28	2021-2022	2021-09-28 20:00:00	Borussia Dortmund	Sporting CP	Signal Iduna Park	Dortmund	1	0	0	25000
mt29	2021-2022	2021-10-19 17:45:00	Beşiktaş	Sporting CP	Vodafone Park	Istanbul	1	4	0	22936
mt30	2021-2022	2021-10-19 20:00:00	AFC Ajax	Borussia Dortmund	Johan Cruijff ArenA	Amsterdam	4	0	0	54029
mt31	2021-2022	2021-11-03 20:00:00	Borussia Dortmund	AFC Ajax	Signal Iduna Park	Dortmund	1	3	0	54820
mt32	2021-2022	2021-11-03 20:00:00	Sporting CP	Beşiktaş	Estádio José Alvalade	Lisboa	4	0	0	40835
mt33	2021-2022	2021-11-24 17:45:00	Beşiktaş	AFC Ajax	Vodafone Park	Istanbul	1	2	0	11712
mt34	2021-2022	2021-11-24 20:00:00	Sporting CP	Borussia Dortmund	Estádio José Alvalade	Lisboa	3	1	0	41341
mt35	2021-2022	2021-12-07 20:00:00	AFC Ajax	Sporting CP	Johan Cruijff ArenA	Amsterdam	4	2	0	0
mt36	2021-2022	2021-12-07 20:00:00	Borussia Dortmund	Beşiktaş	Signal Iduna Park	Dortmund	5	0	0	15000
mt37	2021-2022	2021-09-15 17:45:00	FC Sheriff	Shakhtar Donetsk	Sheriff Stadium	Tiraspol	2	0	0	5205
mt38	2021-2022	2021-09-15 20:00:00	Inter	Real Madrid	Giuseppe Meazza	Milano	0	1	0	37082
mt39	2021-2022	2021-09-28 17:45:00	Shakhtar Donetsk	Inter	Olimpiyskyi	Kiev	0	0	0	26170
mt40	2021-2022	2021-09-28 20:00:00	Real Madrid	FC Sheriff	Santiago Bernabéu	Madrid	1	2	0	24522
mt41	2021-2022	2021-10-19 20:00:00	Shakhtar Donetsk	Real Madrid	Olimpiyskyi	Kiev	0	5	0	34037
mt42	2021-2022	2021-10-19 20:00:00	Inter	FC Sheriff	Giuseppe Meazza	Milano	3	1	0	43305
mt43	2021-2022	2021-11-03 17:45:00	Real Madrid	Shakhtar Donetsk	Santiago Bernabéu	Madrid	2	1	0	38105
mt44	2021-2022	2021-11-03 20:00:00	FC Sheriff	Inter	Sheriff Stadium	Tiraspol	1	3	0	5930
mt45	2021-2022	2021-11-24 17:45:00	Inter	Shakhtar Donetsk	Giuseppe Meazza	Milano	2	0	0	46225
mt46	2021-2022	2021-11-24 20:00:00	FC Sheriff	Real Madrid	Sheriff Stadium	Tiraspol	0	3	0	5932
mt47	2021-2022	2021-12-07 20:00:00	Real Madrid	Inter	Santiago Bernabéu	Madrid	2	0	0	46887
mt48	2021-2022	2021-12-07 20:00:00	Shakhtar Donetsk	FC Sheriff	Olimpiyskyi	Kiev	1	1	0	6841
mt49	2021-2022	2021-09-14 20:00:00	FC Barcelona	Bayern München	Spotify Camp Nou	Barcelona	0	3	0	39737
mt50	2021-2022	2021-09-14 20:00:00	Dinamo Kiev	SL Benfica	Olimpiyskyi	Kiev	0	0	0	21657
mt51	2021-2022	2021-09-29 20:00:00	SL Benfica	FC Barcelona	Estádio da Luz	Lisboa	3	0	0	29454
mt52	2021-2022	2021-09-29 20:00:00	Bayern München	Dinamo Kiev	Allianz Arena	München	5	0	0	25000
mt53	2021-2022	2021-10-20 17:45:00	FC Barcelona	Dinamo Kiev	Spotify Camp Nou	Barcelona	1	0	0	45968
mt54	2021-2022	2021-10-20 20:00:00	SL Benfica	Bayern München	Estádio da Luz	Lisboa	0	4	0	50000
mt55	2021-2022	2021-11-02 20:00:00	Bayern München	SL Benfica	Allianz Arena	München	5	2	0	50000
mt56	2021-2022	2021-11-02 20:00:00	Dinamo Kiev	FC Barcelona	Olimpiyskyi	Kiev	0	1	0	31378
mt57	2021-2022	2021-11-23 17:45:00	Dinamo Kiev	Bayern München	Olimpiyskyi	Kiev	1	2	0	28732
mt58	2021-2022	2021-11-23 20:00:00	FC Barcelona	SL Benfica	Spotify Camp Nou	Barcelona	0	0	0	49572
mt59	2021-2022	2021-12-08 20:00:00	Bayern München	FC Barcelona	Allianz Arena	München	3	0	0	0
mt60	2021-2022	2021-12-08 20:00:00	SL Benfica	Dinamo Kiev	Estádio da Luz	Lisboa	2	0	0	37000
mt61	2021-2022	2021-09-14 17:45:00	BSC Young Boys	Manchester United	Stadion Wankdorf	Bern	2	1	0	31120
mt62	2021-2022	2021-09-14 20:00:00	Villarreal CF	Atalanta	Estadio de la Cerámica	Villarreal	2	2	0	12916
mt63	2021-2022	2021-09-29 17:45:00	Atalanta	BSC Young Boys	Gewiss Stadium	Bergamo	1	0	0	8536
mt64	2021-2022	2021-09-29 20:00:00	Manchester United	Villarreal CF	Old Trafford	Manchester	2	1	0	73130
mt65	2021-2022	2021-10-20 20:00:00	Manchester United	Atalanta	Old Trafford	Manchester	3	2	0	72279
mt66	2021-2022	2021-10-20 20:00:00	BSC Young Boys	Villarreal CF	Stadion Wankdorf	Bern	1	4	0	27398
mt67	2021-2022	2021-11-02 20:00:00	Atalanta	Manchester United	Gewiss Stadium	Bergamo	2	2	0	14443
mt68	2021-2022	2021-11-02 20:00:00	Villarreal CF	BSC Young Boys	Estadio de la Cerámica	Villarreal	2	0	0	14890
mt69	2021-2022	2021-11-23 17:45:00	Villarreal CF	Manchester United	Estadio de la Cerámica	Villarreal	0	2	0	20875
mt70	2021-2022	2021-11-23 20:00:00	BSC Young Boys	Atalanta	Stadion Wankdorf	Bern	3	3	0	31120
mt71	2021-2022	2021-12-08 20:00:00	Manchester United	BSC Young Boys	Old Trafford	Manchester	1	1	0	73156
mt72	2021-2022	2021-12-09 18:00:00	Atalanta	Villarreal CF	Gewiss Stadium	Bergamo	2	3	0	11690
mt73	2021-2022	2021-09-14 17:45:00	Sevilla FC	RB Salzburg	Ramón Sánchez Pizjuán	Sevilla	1	1	0	18373
mt74	2021-2022	2021-09-14 20:00:00	Lille OSC	VfL Wolfsburg	Stade Pierre Mauroy	Villeneuve D’Ascq	0	0	0	34314
mt75	2021-2022	2021-09-29 20:00:00	RB Salzburg	Lille OSC	Red Bull Arena	Wals-Siezenheim	2	1	0	24207
mt76	2021-2022	2021-09-29 20:00:00	VfL Wolfsburg	Sevilla FC	Volkswagen Arena	Wolfsburg	1	1	0	11733
mt77	2021-2022	2021-10-20 17:45:00	RB Salzburg	VfL Wolfsburg	Red Bull Arena	Wals-Siezenheim	3	1	0	27500
mt78	2021-2022	2021-10-20 20:00:00	Lille OSC	Sevilla FC	Stade Pierre Mauroy	Villeneuve D’Ascq	0	0	0	34362
mt79	2021-2022	2021-11-02 17:45:00	VfL Wolfsburg	RB Salzburg	Volkswagen Arena	Wolfsburg	2	1	0	16112
mt80	2021-2022	2021-11-02 20:00:00	Sevilla FC	Lille OSC	Ramón Sánchez Pizjuán	Sevilla	1	2	0	29369
mt81	2021-2022	2021-11-23 20:00:00	Lille OSC	RB Salzburg	Stade Pierre Mauroy	Villeneuve D’Ascq	1	0	0	33573
mt82	2021-2022	2021-11-23 20:00:00	Sevilla FC	VfL Wolfsburg	Ramón Sánchez Pizjuán	Sevilla	2	0	0	28663
mt83	2021-2022	2021-12-08 20:00:00	RB Salzburg	Sevilla FC	Red Bull Arena	Wals-Siezenheim	1	0	0	0
mt84	2021-2022	2021-12-08 20:00:00	VfL Wolfsburg	Lille OSC	Volkswagen Arena	Wolfsburg	1	3	0	6544
mt85	2021-2022	2021-09-14 20:00:00	Chelsea FC	Zenit St. Petersburg	Stamford Bridge	London	1	0	0	39252
mt86	2021-2022	2021-09-14 20:00:00	Malmö FF	Juventus	Nya Malmö Stadion	Malmö	0	3	0	5832
mt87	2021-2022	2021-09-29 17:45:00	Zenit St. Petersburg	Malmö FF	Gazprom Arena	St. Petersburg	4	0	0	15339
mt88	2021-2022	2021-09-29 20:00:00	Juventus	Chelsea FC	Allianz Stadium	Torino	1	0	0	19934
mt89	2021-2022	2021-10-20 20:00:00	Zenit St. Petersburg	Juventus	Gazprom Arena	St. Petersburg	0	1	0	18717
mt90	2021-2022	2021-10-20 20:00:00	Chelsea FC	Malmö FF	Stamford Bridge	London	4	0	0	39095
mt91	2021-2022	2021-11-02 17:45:00	Malmö FF	Chelsea FC	Nya Malmö Stadion	Malmö	0	1	0	19551
mt92	2021-2022	2021-11-02 20:00:00	Juventus	Zenit St. Petersburg	Allianz Stadium	Torino	4	2	0	20053
mt93	2021-2022	2021-11-23 20:00:00	Chelsea FC	Juventus	Stamford Bridge	London	4	0	0	39513
mt94	2021-2022	2021-11-23 20:00:00	Malmö FF	Zenit St. Petersburg	Nya Malmö Stadion	Malmö	1	1	0	19551
mt95	2021-2022	2021-12-08 17:45:00	Zenit St. Petersburg	Chelsea FC	Gazprom Arena	St. Petersburg	3	3	0	29349
mt96	2021-2022	2021-12-08 17:45:00	Juventus	Malmö FF	Allianz Stadium	Torino	1	0	0	17501
mt97	2021-2022	2022-02-15 20:00:00	Sporting CP	Manchester City	Estádio José Alvalade	Lisboa	0	5	0	48129
mt98	2021-2022	2022-02-15 20:00:00	Paris Saint-Germain	Real Madrid	Parc des Princes	Paris	1	0	0	47443
mt99	2021-2022	2022-02-16 20:00:00	RB Salzburg	Bayern München	Red Bull Arena	Wals-Siezenheim	1	1	0	29520
mt100	2021-2022	2022-02-16 20:00:00	Inter	Liverpool FC	Giuseppe Meazza	Milano	0	2	0	37918
mt101	2021-2022	2022-02-22 20:00:00	Chelsea FC	Lille OSC	Stamford Bridge	London	2	0	0	38832
mt102	2021-2022	2022-02-22 20:00:00	Villarreal CF	Juventus	Estadio de la Cerámica	Villarreal	1	1	0	17686
mt103	2021-2022	2022-02-23 20:00:00	SL Benfica	AFC Ajax	Estádio da Luz	Lisboa	2	2	0	54760
mt104	2021-2022	2022-02-23 20:00:00	Atlético Madrid	Manchester United	Wanda Metropolitano	Madrid	1	1	0	63273
mt105	2021-2022	2022-03-08 20:00:00	Bayern München	RB Salzburg	Allianz Arena	München	7	1	0	25000
mt106	2021-2022	2022-03-08 20:00:00	Liverpool FC	Inter	Anfield	Liverpool	0	1	0	51747
mt107	2021-2022	2022-03-09 20:00:00	Manchester City	Sporting CP	Etihad Stadium	Manchester	0	0	0	51213
mt108	2021-2022	2022-03-09 20:00:00	Real Madrid	Paris Saint-Germain	Santiago Bernabéu	Madrid	3	1	0	59895
mt109	2021-2022	2022-03-15 20:00:00	AFC Ajax	SL Benfica	Johan Cruijff ArenA	Amsterdam	0	1	0	54066
mt110	2021-2022	2022-03-15 20:00:00	Manchester United	Atlético Madrid	Old Trafford	Manchester	0	1	0	73008
mt111	2021-2022	2022-03-16 20:00:00	Lille OSC	Chelsea FC	Stade Pierre Mauroy	Villeneuve D’Ascq	1	2	0	49048
mt112	2021-2022	2022-03-16 20:00:00	Juventus	Villarreal CF	Allianz Stadium	Torino	0	3	0	30385
mt113	2021-2022	2022-04-05 20:00:00	Manchester City	Atlético Madrid	Etihad Stadium	Manchester	1	0	0	52018
mt114	2021-2022	2022-04-05 20:00:00	SL Benfica	Liverpool FC	Estádio da Luz	Lisboa	1	3	0	59633
mt115	2021-2022	2022-04-06 20:00:00	Chelsea FC	Real Madrid	Stamford Bridge	London	1	3	0	38689
mt116	2021-2022	2022-04-06 20:00:00	Villarreal CF	Bayern München	Estadio de la Cerámica	Villarreal	1	0	0	21626
mt117	2021-2022	2022-04-12 20:00:00	Real Madrid	Chelsea FC	Santiago Bernabéu	Madrid	2	3	0	59839
mt118	2021-2022	2022-04-12 20:00:00	Bayern München	Villarreal CF	Allianz Arena	München	1	1	0	70000
mt119	2021-2022	2022-04-13 20:00:00	Atlético Madrid	Manchester City	Wanda Metropolitano	Madrid	0	0	0	65675
mt120	2021-2022	2022-04-13 20:00:00	Liverpool FC	SL Benfica	Anfield	Liverpool	3	3	0	51373
mt121	2021-2022	2022-04-26 20:00:00	Manchester City	Real Madrid	Etihad Stadium	Manchester	4	3	0	55097
mt122	2021-2022	2022-04-27 20:00:00	Liverpool FC	Villarreal CF	Anfield	Liverpool	2	0	0	51586
mt123	2021-2022	2022-05-03 20:00:00	Villarreal CF	Liverpool FC	Estadio de la Cerámica	Villarreal	2	3	0	23665
mt124	2021-2022	2022-05-04 20:00:00	Real Madrid	Manchester City	Santiago Bernabéu	Madrid	3	1	0	61416
mt125	2021-2022	2022-05-28 20:35:00	Liverpool FC	Real Madrid	Stade de France	Paris - St. Denis	0	1	0	0
mt126	2020-2021	2020-10-21 17:55:00	RB Salzburg	Lokomotiv Moskva	Red Bull Arena	Wals-Siezenheim	2	2	0	3000
mt127	2020-2021	2020-10-21 20:00:00	Bayern München	Atlético Madrid	Allianz Arena	München	4	0	0	0
mt128	2020-2021	2020-10-27 17:55:00	Lokomotiv Moskva	Bayern München	RŽD-Arena	Moskva	1	2	0	8196
mt129	2020-2021	2020-10-27 20:00:00	Atlético Madrid	RB Salzburg	Wanda Metropolitano	Madrid	3	2	0	0
mt130	2020-2021	2020-11-03 17:55:00	Lokomotiv Moskva	Atlético Madrid	RŽD-Arena	Moskva	1	1	0	8147
mt131	2020-2021	2020-11-03 20:00:00	RB Salzburg	Bayern München	Red Bull Arena	Wals-Siezenheim	2	6	0	0
mt132	2020-2021	2020-11-25 20:00:00	Atlético Madrid	Lokomotiv Moskva	Wanda Metropolitano	Madrid	0	0	0	0
mt133	2020-2021	2020-11-25 20:00:00	Bayern München	RB Salzburg	Allianz Arena	München	3	1	0	0
mt134	2020-2021	2020-12-01 17:55:00	Lokomotiv Moskva	RB Salzburg	RŽD-Arena	Moskva	1	3	0	6759
mt135	2020-2021	2020-12-01 20:00:00	Atlético Madrid	Bayern München	Wanda Metropolitano	Madrid	1	1	0	0
mt136	2020-2021	2020-12-09 20:00:00	Bayern München	Lokomotiv Moskva	Allianz Arena	München	2	0	0	0
mt137	2020-2021	2020-12-09 20:00:00	RB Salzburg	Atlético Madrid	Red Bull Arena	Wals-Siezenheim	0	2	0	0
mt138	2020-2021	2020-10-21 17:55:00	Real Madrid	Shakhtar Donetsk	Alfredo Di Stéfano	Madrid	2	3	0	0
mt139	2020-2021	2020-10-21 20:00:00	Inter	Bor. Mönchengladbach	Giuseppe Meazza	Milano	2	2	0	1000
mt140	2020-2021	2020-10-27 17:55:00	Shakhtar Donetsk	Inter	Olimpiyskyi	Kiev	0	0	0	10178
mt141	2020-2021	2020-10-27 20:00:00	Bor. Mönchengladbach	Real Madrid	Borussia-Park	Mönchengladbach	2	2	0	0
mt142	2020-2021	2020-11-03 17:55:00	Shakhtar Donetsk	Bor. Mönchengladbach	Olimpiyskyi	Kiev	0	6	0	0
mt143	2020-2021	2020-11-03 20:00:00	Real Madrid	Inter	Alfredo Di Stéfano	Madrid	3	2	0	0
mt144	2020-2021	2020-11-25 17:55:00	Bor. Mönchengladbach	Shakhtar Donetsk	Borussia-Park	Mönchengladbach	4	0	0	0
mt145	2020-2021	2020-11-25 20:00:00	Inter	Real Madrid	Giuseppe Meazza	Milano	0	2	0	0
mt146	2020-2021	2020-12-01 17:55:00	Shakhtar Donetsk	Real Madrid	Olimpiyskyi	Kiev	2	0	0	0
mt147	2020-2021	2020-12-01 20:00:00	Bor. Mönchengladbach	Inter	Borussia-Park	Mönchengladbach	2	3	0	0
mt148	2020-2021	2020-12-09 20:00:00	Inter	Shakhtar Donetsk	Giuseppe Meazza	Milano	0	0	0	0
mt149	2020-2021	2020-12-09 20:00:00	Real Madrid	Bor. Mönchengladbach	Alfredo Di Stéfano	Madrid	2	0	0	0
mt150	2020-2021	2020-10-21 20:00:00	Manchester City	FC Porto	Etihad Stadium	Manchester	3	1	0	0
mt151	2020-2021	2020-10-21 20:00:00	Olympiakos Piraeus	Olympique Marseille	Georgios Karaiskakis	Piräus	1	0	0	0
mt152	2020-2021	2020-10-27 20:00:00	FC Porto	Olympiakos Piraeus	Estádio do Dragão	Porto	2	0	0	2450
mt153	2020-2021	2020-10-27 20:00:00	Olympique Marseille	Manchester City	Vélodrome	Marseille	0	3	0	0
mt154	2020-2021	2020-11-03 20:00:00	FC Porto	Olympique Marseille	Estádio do Dragão	Porto	3	0	0	0
mt155	2020-2021	2020-11-03 20:00:00	Manchester City	Olympiakos Piraeus	Etihad Stadium	Manchester	3	0	0	0
mt156	2020-2021	2020-11-25 17:55:00	Olympiakos Piraeus	Manchester City	Georgios Karaiskakis	Piräus	0	1	0	0
mt157	2020-2021	2020-11-25 20:00:00	Olympique Marseille	FC Porto	Vélodrome	Marseille	0	2	0	0
mt158	2020-2021	2020-12-01 20:00:00	FC Porto	Manchester City	Estádio do Dragão	Porto	0	0	0	0
mt159	2020-2021	2020-12-01 20:00:00	Olympique Marseille	Olympiakos Piraeus	Vélodrome	Marseille	2	1	0	0
mt160	2020-2021	2020-12-09 20:00:00	Manchester City	Olympique Marseille	Etihad Stadium	Manchester	3	0	0	1
mt161	2020-2021	2020-12-09 20:00:00	Olympiakos Piraeus	FC Porto	Georgios Karaiskakis	Piräus	0	2	0	0
mt162	2020-2021	2020-10-21 20:00:00	AFC Ajax	Liverpool FC	Johan Cruijff ArenA	Amsterdam	0	1	0	0
mt163	2020-2021	2020-10-21 20:00:00	FC Midtjylland	Atalanta	MCH Arena	Herning	0	4	0	132
mt164	2020-2021	2020-10-27 20:00:00	Atalanta	AFC Ajax	Gewiss Stadium	Bergamo	2	2	0	0
mt165	2020-2021	2020-10-27 20:00:00	Liverpool FC	FC Midtjylland	Anfield	Liverpool	2	0	0	0
mt166	2020-2021	2020-11-03 20:00:00	Atalanta	Liverpool FC	Gewiss Stadium	Bergamo	0	5	0	0
mt167	2020-2021	2020-11-03 20:00:00	FC Midtjylland	AFC Ajax	MCH Arena	Herning	1	2	0	132
mt168	2020-2021	2020-11-25 20:00:00	AFC Ajax	FC Midtjylland	Johan Cruijff ArenA	Amsterdam	3	1	0	0
mt169	2020-2021	2020-11-25 20:00:00	Liverpool FC	Atalanta	Anfield	Liverpool	0	2	0	0
mt170	2020-2021	2020-12-01 20:00:00	Atalanta	FC Midtjylland	Gewiss Stadium	Bergamo	1	1	0	0
mt171	2020-2021	2020-12-01 20:00:00	Liverpool FC	AFC Ajax	Anfield	Liverpool	1	0	0	0
mt172	2020-2021	2020-12-09 17:55:00	AFC Ajax	Atalanta	Johan Cruijff ArenA	Amsterdam	0	1	0	0
mt173	2020-2021	2020-12-09 17:55:00	FC Midtjylland	Liverpool FC	MCH Arena	Herning	1	1	0	0
mt174	2020-2021	2020-10-20 20:00:00	Chelsea FC	Sevilla FC	Stamford Bridge	London	0	0	0	0
mt175	2020-2021	2020-10-20 20:00:00	Stade Rennes	FK Krasnodar	Roazhon Park	Rennes	1	1	0	4973
mt176	2020-2021	2020-10-28 17:55:00	FK Krasnodar	Chelsea FC	Krasnodar Stadium	Krasnodar	0	4	0	10544
mt177	2020-2021	2020-10-28 20:00:00	Sevilla FC	Stade Rennes	Ramón Sánchez Pizjuán	Sevilla	1	0	0	0
mt178	2020-2021	2020-11-04 20:00:00	Chelsea FC	Stade Rennes	Stamford Bridge	London	3	0	0	0
mt179	2020-2021	2020-11-04 20:00:00	Sevilla FC	FK Krasnodar	Ramón Sánchez Pizjuán	Sevilla	3	2	0	1
mt180	2020-2021	2020-11-24 17:55:00	Stade Rennes	Chelsea FC	Roazhon Park	Rennes	1	2	0	0
mt181	2020-2021	2020-11-24 17:55:00	FK Krasnodar	Sevilla FC	Krasnodar Stadium	Krasnodar	1	2	0	10554
mt182	2020-2021	2020-12-02 17:55:00	FK Krasnodar	Stade Rennes	Krasnodar Stadium	Krasnodar	1	0	0	8747
mt183	2020-2021	2020-12-02 20:00:00	Sevilla FC	Chelsea FC	Ramón Sánchez Pizjuán	Sevilla	0	4	0	0
mt184	2020-2021	2020-12-08 20:00:00	Chelsea FC	FK Krasnodar	Stamford Bridge	London	1	1	0	2000
mt185	2020-2021	2020-12-08 20:00:00	Stade Rennes	Sevilla FC	Roazhon Park	Rennes	1	3	0	0
mt186	2020-2021	2020-10-20 17:55:00	Zenit St. Petersburg	Club Brugge KV	Gazprom Arena	St. Petersburg	1	2	0	16682
mt187	2020-2021	2020-10-20 20:00:00	Lazio Roma	Borussia Dortmund	Olimpico	Roma	3	1	0	1000
mt188	2020-2021	2020-10-28 20:00:00	Borussia Dortmund	Zenit St. Petersburg	Signal Iduna Park	Dortmund	2	0	0	0
mt189	2020-2021	2020-10-28 20:00:00	Club Brugge KV	Lazio Roma	Jan Breydel Stadion	Brugge	1	1	0	0
mt190	2020-2021	2020-11-04 17:55:00	Zenit St. Petersburg	Lazio Roma	Gazprom Arena	St. Petersburg	1	1	0	0
mt191	2020-2021	2020-11-04 20:00:00	Club Brugge KV	Borussia Dortmund	Jan Breydel Stadion	Brugge	0	3	0	0
mt192	2020-2021	2020-11-24 20:00:00	Borussia Dortmund	Club Brugge KV	Signal Iduna Park	Dortmund	3	0	0	0
mt193	2020-2021	2020-11-24 20:00:00	Lazio Roma	Zenit St. Petersburg	Olimpico	Roma	3	1	0	0
mt194	2020-2021	2020-12-02 20:00:00	Borussia Dortmund	Lazio Roma	Signal Iduna Park	Dortmund	1	1	0	0
mt195	2020-2021	2020-12-02 20:00:00	Club Brugge KV	Zenit St. Petersburg	Jan Breydel Stadion	Brugge	3	0	0	0
mt196	2020-2021	2020-12-08 17:55:00	Zenit St. Petersburg	Borussia Dortmund	Gazprom Arena	St. Petersburg	1	2	0	10860
mt197	2020-2021	2020-12-08 17:55:00	Lazio Roma	Club Brugge KV	Olimpico	Roma	2	2	0	0
mt198	2020-2021	2020-10-20 17:55:00	Dinamo Kiev	Juventus	Olimpiyskyi	Kiev	0	2	0	14850
mt199	2020-2021	2020-10-20 20:00:00	FC Barcelona	Ferencvárosi TC	Spotify Camp Nou	Barcelona	5	1	0	0
mt200	2020-2021	2020-10-28 20:00:00	Ferencvárosi TC	Dinamo Kiev	Groupama Aréna	Budapest	2	2	0	6171
mt201	2020-2021	2020-10-28 20:00:00	Juventus	FC Barcelona	Allianz Stadium	Torino	0	2	0	0
mt202	2020-2021	2020-11-04 20:00:00	FC Barcelona	Dinamo Kiev	Spotify Camp Nou	Barcelona	2	1	0	0
mt203	2020-2021	2020-11-04 20:00:00	Ferencvárosi TC	Juventus	Puskás Aréna	Budapest	1	4	0	18531
mt204	2020-2021	2020-11-24 20:00:00	Dinamo Kiev	FC Barcelona	Olimpiyskyi	Kiev	0	4	0	0
mt205	2020-2021	2020-11-24 20:00:00	Juventus	Ferencvárosi TC	Allianz Stadium	Torino	2	1	0	0
mt206	2020-2021	2020-12-02 20:00:00	Juventus	Dinamo Kiev	Allianz Stadium	Torino	3	0	0	0
mt207	2020-2021	2020-12-02 20:00:00	Ferencvárosi TC	FC Barcelona	Groupama Aréna	Budapest	0	3	0	0
mt208	2020-2021	2020-12-08 20:00:00	Dinamo Kiev	Ferencvárosi TC	Olimpiyskyi	Kiev	1	0	0	0
mt209	2020-2021	2020-12-08 20:00:00	FC Barcelona	Juventus	Spotify Camp Nou	Barcelona	0	3	0	0
mt210	2020-2021	2020-10-20 20:00:00	RB Leipzig	İstanbul Başakşehir	Red Bull Arena	Wals-Siezenheim	2	0	0	999
mt211	2020-2021	2020-10-20 20:00:00	Paris Saint-Germain	Manchester United	Parc des Princes	Paris	1	2	0	0
mt212	2020-2021	2020-10-28 17:55:00	İstanbul Başakşehir	Paris Saint-Germain	Fatih Terim Stadium	Istanbul	0	2	0	350
mt213	2020-2021	2020-10-28 20:00:00	Manchester United	RB Leipzig	Old Trafford	Manchester	5	0	0	577
mt214	2020-2021	2020-11-04 17:55:00	İstanbul Başakşehir	Manchester United	Fatih Terim Stadium	Istanbul	2	1	0	350
mt215	2020-2021	2020-11-04 20:00:00	RB Leipzig	Paris Saint-Germain	Red Bull Arena	Wals-Siezenheim	2	1	0	0
mt216	2020-2021	2020-11-24 20:00:00	Manchester United	İstanbul Başakşehir	Old Trafford	Manchester	4	1	0	545
mt217	2020-2021	2020-11-24 20:00:00	Paris Saint-Germain	RB Leipzig	Parc des Princes	Paris	1	0	0	0
mt218	2020-2021	2020-12-02 17:55:00	İstanbul Başakşehir	RB Leipzig	Fatih Terim Stadium	Istanbul	3	4	0	0
mt219	2020-2021	2020-12-02 20:00:00	Manchester United	Paris Saint-Germain	Old Trafford	Manchester	1	3	0	638
mt220	2020-2021	2020-12-08 20:00:00	RB Leipzig	Manchester United	Red Bull Arena	Wals-Siezenheim	3	2	0	0
mt221	2020-2021	2020-12-09 17:55:00	Paris Saint-Germain	İstanbul Başakşehir	Parc des Princes	Paris	5	1	0	0
mt222	2020-2021	2021-02-16 20:00:00	RB Leipzig	Liverpool FC	Puskás Aréna	Budapest	0	2	0	0
mt223	2020-2021	2021-02-16 20:00:00	FC Barcelona	Paris Saint-Germain	Spotify Camp Nou	Barcelona	1	4	0	0
mt224	2020-2021	2021-02-17 20:00:00	FC Porto	Juventus	Estádio do Dragão	Porto	2	1	0	0
mt225	2020-2021	2021-02-17 20:00:00	Sevilla FC	Borussia Dortmund	Ramón Sánchez Pizjuán	Sevilla	2	3	0	0
mt226	2020-2021	2021-02-23 20:00:00	Lazio Roma	Bayern München	Olimpico	Roma	1	4	0	0
mt227	2020-2021	2021-02-23 20:00:00	Atlético Madrid	Chelsea FC	Arena Națională	Bucuresti	0	1	0	0
mt228	2020-2021	2021-02-24 20:00:00	Bor. Mönchengladbach	Manchester City	Puskás Aréna	Budapest	0	2	0	0
mt229	2020-2021	2021-02-24 20:00:00	Atalanta	Real Madrid	Gewiss Stadium	Bergamo	0	1	0	0
mt230	2020-2021	2021-03-09 20:00:00	Juventus	FC Porto	Allianz Stadium	Torino	3	2	0	0
mt231	2020-2021	2021-03-09 20:00:00	Borussia Dortmund	Sevilla FC	Signal Iduna Park	Dortmund	2	2	0	0
mt232	2020-2021	2021-03-10 20:00:00	Liverpool FC	RB Leipzig	Puskás Aréna	Budapest	2	0	0	0
mt233	2020-2021	2021-03-10 20:00:00	Paris Saint-Germain	FC Barcelona	Parc des Princes	Paris	1	1	0	0
mt234	2020-2021	2021-03-16 20:00:00	Manchester City	Bor. Mönchengladbach	Puskás Aréna	Budapest	2	0	0	0
mt235	2020-2021	2021-03-16 20:00:00	Real Madrid	Atalanta	Alfredo Di Stéfano	Madrid	3	1	0	0
mt236	2020-2021	2021-03-17 20:00:00	Bayern München	Lazio Roma	Allianz Arena	München	2	1	0	0
mt237	2020-2021	2021-03-17 20:00:00	Chelsea FC	Atlético Madrid	Stamford Bridge	London	2	0	0	0
mt238	2020-2021	2021-04-06 20:00:00	Manchester City	Borussia Dortmund	Etihad Stadium	Manchester	2	1	0	0
mt239	2020-2021	2021-04-06 20:00:00	Real Madrid	Liverpool FC	Alfredo Di Stéfano	Madrid	3	1	0	0
mt240	2020-2021	2021-04-07 20:00:00	FC Porto	Chelsea FC	Ramón Sánchez Pizjuán	Sevilla	0	2	0	0
mt241	2020-2021	2021-04-07 20:00:00	Bayern München	Paris Saint-Germain	Allianz Arena	München	2	3	0	0
mt242	2020-2021	2021-04-13 20:00:00	Chelsea FC	FC Porto	Ramón Sánchez Pizjuán	Sevilla	0	1	0	0
mt243	2020-2021	2021-04-13 20:00:00	Paris Saint-Germain	Bayern München	Parc des Princes	Paris	0	1	0	0
mt244	2020-2021	2021-04-14 20:00:00	Borussia Dortmund	Manchester City	Signal Iduna Park	Dortmund	1	2	0	0
mt245	2020-2021	2021-04-14 20:00:00	Liverpool FC	Real Madrid	Anfield	Liverpool	0	0	0	0
mt246	2020-2021	2021-04-27 20:00:00	Real Madrid	Chelsea FC	Alfredo Di Stéfano	Madrid	1	1	0	0
mt247	2020-2021	2021-04-28 20:00:00	Paris Saint-Germain	Manchester City	Parc des Princes	Paris	1	2	0	0
mt248	2020-2021	2021-05-04 20:00:00	Manchester City	Paris Saint-Germain	Etihad Stadium	Manchester	2	0	0	0
mt249	2020-2021	2021-05-05 20:00:00	Chelsea FC	Real Madrid	Stamford Bridge	London	2	0	0	0
mt250	2020-2021	2021-05-29 20:00:00	Manchester City	Chelsea FC	Estádio do Dragão	Porto	0	1	0	14110
mt251	2019-2020	2019-09-18 17:55:00	Club Brugge KV	Galatasaray	Jan Breydel Stadion	Brugge	0	0	0	26616
mt252	2019-2020	2019-09-18 20:00:00	Paris Saint-Germain	Real Madrid	Parc des Princes	Paris	3	0	0	46361
mt253	2019-2020	2019-10-01 17:55:00	Real Madrid	Club Brugge KV	Santiago Bernabéu	Madrid	2	2	0	65112
mt254	2019-2020	2019-10-01 20:00:00	Galatasaray	Paris Saint-Germain	Nef Stadyumu	Istanbul	0	1	0	46532
mt255	2019-2020	2019-10-22 20:00:00	Club Brugge KV	Paris Saint-Germain	Jan Breydel Stadion	Brugge	0	5	0	26946
mt256	2019-2020	2019-10-22 20:00:00	Galatasaray	Real Madrid	Nef Stadyumu	Istanbul	0	1	0	48886
mt257	2019-2020	2019-11-06 20:00:00	Paris Saint-Germain	Club Brugge KV	Parc des Princes	Paris	1	0	0	47418
mt258	2019-2020	2019-11-06 20:00:00	Real Madrid	Galatasaray	Santiago Bernabéu	Madrid	6	0	0	65492
mt259	2019-2020	2019-11-26 17:55:00	Galatasaray	Club Brugge KV	Nef Stadyumu	Istanbul	1	1	0	34500
mt260	2019-2020	2019-11-26 20:00:00	Real Madrid	Paris Saint-Germain	Santiago Bernabéu	Madrid	2	2	0	75534
mt261	2019-2020	2019-12-11 20:00:00	Paris Saint-Germain	Galatasaray	Parc des Princes	Paris	5	0	0	46509
mt262	2019-2020	2019-12-11 20:00:00	Club Brugge KV	Real Madrid	Jan Breydel Stadion	Brugge	1	3	0	27308
mt263	2019-2020	2019-09-18 17:55:00	Olympiakos Piraeus	Tottenham Hotspur	Georgios Karaiskakis	Piräus	2	2	0	31001
mt264	2019-2020	2019-09-18 20:00:00	Bayern München	Crvena Zvezda	Allianz Arena	München	3	0	0	70000
mt265	2019-2020	2019-10-01 20:00:00	Tottenham Hotspur	Bayern München	Tottenham Hotspur Stadium	London	2	7	0	60127
mt266	2019-2020	2019-10-01 20:00:00	Crvena Zvezda	Olympiakos Piraeus	Marakana	Beograd	3	1	0	43291
mt267	2019-2020	2019-10-22 20:00:00	Tottenham Hotspur	Crvena Zvezda	Tottenham Hotspur Stadium	London	5	0	0	51743
mt268	2019-2020	2019-10-22 20:00:00	Olympiakos Piraeus	Bayern München	Georgios Karaiskakis	Piräus	2	3	0	31670
mt269	2019-2020	2019-11-06 17:55:00	Bayern München	Olympiakos Piraeus	Allianz Arena	München	2	0	0	63646
mt270	2019-2020	2019-11-06 20:00:00	Crvena Zvezda	Tottenham Hotspur	Marakana	Beograd	0	4	0	42381
mt271	2019-2020	2019-11-26 20:00:00	Tottenham Hotspur	Olympiakos Piraeus	Tottenham Hotspur Stadium	London	4	2	0	57024
mt272	2019-2020	2019-11-26 20:00:00	Crvena Zvezda	Bayern München	Marakana	Beograd	0	6	0	44118
mt273	2019-2020	2019-12-11 20:00:00	Bayern München	Tottenham Hotspur	Allianz Arena	München	3	1	0	66353
mt274	2019-2020	2019-12-11 20:00:00	Olympiakos Piraeus	Crvena Zvezda	Georgios Karaiskakis	Piräus	1	0	0	31898
mt275	2019-2020	2019-09-18 20:00:00	Shakhtar Donetsk	Manchester City	Metalist Stadion	Kharkiv	0	3	0	36675
mt276	2019-2020	2019-09-18 20:00:00	Dinamo Zagreb	Atalanta	Maksimir	Zagreb	4	0	0	28863
mt277	2019-2020	2019-10-01 17:55:00	Atalanta	Shakhtar Donetsk	Giuseppe Meazza	Milano	1	2	0	26022
mt278	2019-2020	2019-10-01 20:00:00	Manchester City	Dinamo Zagreb	Etihad Stadium	Manchester	2	0	0	49046
mt279	2019-2020	2019-10-22 17:55:00	Shakhtar Donetsk	Dinamo Zagreb	Metalist Stadion	Kharkiv	2	2	0	21526
mt280	2019-2020	2019-10-22 20:00:00	Manchester City	Atalanta	Etihad Stadium	Manchester	5	1	0	49308
mt281	2019-2020	2019-11-06 20:00:00	Dinamo Zagreb	Shakhtar Donetsk	Maksimir	Zagreb	3	3	0	28316
mt282	2019-2020	2019-11-06 20:00:00	Atalanta	Manchester City	Giuseppe Meazza	Milano	1	1	0	34326
mt283	2019-2020	2019-11-26 20:00:00	Manchester City	Shakhtar Donetsk	Etihad Stadium	Manchester	1	1	0	52020
mt284	2019-2020	2019-11-26 20:00:00	Atalanta	Dinamo Zagreb	Giuseppe Meazza	Milano	2	0	0	28365
mt285	2019-2020	2019-12-11 17:55:00	Shakhtar Donetsk	Atalanta	Metalist Stadion	Kharkiv	0	3	0	26536
mt286	2019-2020	2019-12-11 17:55:00	Dinamo Zagreb	Manchester City	Maksimir	Zagreb	1	4	0	29385
mt287	2019-2020	2019-09-18 20:00:00	Atlético Madrid	Juventus	Wanda Metropolitano	Madrid	2	2	0	66283
mt288	2019-2020	2019-09-18 20:00:00	Bayer Leverkusen	Lokomotiv Moskva	BayArena	Leverkusen	1	2	0	26592
mt289	2019-2020	2019-10-01 20:00:00	Juventus	Bayer Leverkusen	Allianz Stadium	Torino	3	0	0	34525
mt290	2019-2020	2019-10-01 20:00:00	Lokomotiv Moskva	Atlético Madrid	RŽD-Arena	Moskva	0	2	0	27051
mt291	2019-2020	2019-10-22 17:55:00	Atlético Madrid	Bayer Leverkusen	Wanda Metropolitano	Madrid	1	0	0	56776
mt292	2019-2020	2019-10-22 20:00:00	Juventus	Lokomotiv Moskva	Allianz Stadium	Torino	2	1	0	38547
mt293	2019-2020	2019-11-06 17:55:00	Lokomotiv Moskva	Juventus	RŽD-Arena	Moskva	1	2	0	26861
mt294	2019-2020	2019-11-06 20:00:00	Bayer Leverkusen	Atlético Madrid	BayArena	Leverkusen	2	1	0	28160
mt295	2019-2020	2019-11-26 17:55:00	Lokomotiv Moskva	Bayer Leverkusen	RŽD-Arena	Moskva	0	2	0	25757
mt296	2019-2020	2019-11-26 20:00:00	Juventus	Atlético Madrid	Allianz Stadium	Torino	1	0	0	40486
mt297	2019-2020	2019-12-11 20:00:00	Atlético Madrid	Lokomotiv Moskva	Wanda Metropolitano	Madrid	2	0	0	58426
mt298	2019-2020	2019-12-11 20:00:00	Bayer Leverkusen	Juventus	BayArena	Leverkusen	0	2	0	29542
mt299	2019-2020	2019-09-17 20:00:00	SSC Napoli	Liverpool FC	Diego Maradona	Napoli	2	0	0	38878
mt300	2019-2020	2019-09-17 20:00:00	RB Salzburg	KRC Genk	Red Bull Arena	Wals-Siezenheim	6	2	0	29520
mt301	2019-2020	2019-10-02 17:55:00	KRC Genk	SSC Napoli	Cegeka Arena	Genk	0	0	0	19962
mt302	2019-2020	2019-10-02 20:00:00	Liverpool FC	RB Salzburg	Anfield	Liverpool	4	3	0	52234
mt303	2019-2020	2019-10-23 20:00:00	RB Salzburg	SSC Napoli	Red Bull Arena	Wals-Siezenheim	2	3	0	29520
mt304	2019-2020	2019-10-23 20:00:00	KRC Genk	Liverpool FC	Cegeka Arena	Genk	1	4	0	19626
mt305	2019-2020	2019-11-05 20:00:00	Liverpool FC	KRC Genk	Anfield	Liverpool	2	1	0	52611
mt306	2019-2020	2019-11-05 20:00:00	SSC Napoli	RB Salzburg	Diego Maradona	Napoli	1	1	0	32862
mt307	2019-2020	2019-11-27 20:00:00	Liverpool FC	SSC Napoli	Anfield	Liverpool	1	1	0	52128
mt308	2019-2020	2019-11-27 20:00:00	KRC Genk	RB Salzburg	Cegeka Arena	Genk	1	4	0	17284
mt309	2019-2020	2019-12-10 17:55:00	SSC Napoli	KRC Genk	Diego Maradona	Napoli	4	0	0	22265
mt310	2019-2020	2019-12-10 17:55:00	RB Salzburg	Liverpool FC	Red Bull Arena	Wals-Siezenheim	0	2	0	29520
mt311	2019-2020	2019-09-17 17:55:00	Inter	Slavia Praha	Giuseppe Meazza	Milano	1	1	0	50128
mt312	2019-2020	2019-09-17 20:00:00	Borussia Dortmund	FC Barcelona	Signal Iduna Park	Dortmund	0	0	0	66099
mt313	2019-2020	2019-10-02 17:55:00	Slavia Praha	Borussia Dortmund	Sinobo Stadium	Praha	0	2	0	19370
mt314	2019-2020	2019-10-02 20:00:00	FC Barcelona	Inter	Spotify Camp Nou	Barcelona	2	1	0	86141
mt315	2019-2020	2019-10-23 20:00:00	Inter	Borussia Dortmund	Giuseppe Meazza	Milano	2	0	0	65673
mt316	2019-2020	2019-10-23 20:00:00	Slavia Praha	FC Barcelona	Sinobo Stadium	Praha	1	2	0	19170
mt317	2019-2020	2019-11-05 17:55:00	FC Barcelona	Slavia Praha	Spotify Camp Nou	Barcelona	0	0	0	67023
mt318	2019-2020	2019-11-05 20:00:00	Borussia Dortmund	Inter	Signal Iduna Park	Dortmund	3	2	0	66099
mt319	2019-2020	2019-11-27 20:00:00	FC Barcelona	Borussia Dortmund	Spotify Camp Nou	Barcelona	3	1	0	90071
mt320	2019-2020	2019-11-27 20:00:00	Slavia Praha	Inter	Sinobo Stadium	Praha	1	3	0	19370
mt321	2019-2020	2019-12-10 20:00:00	Borussia Dortmund	Slavia Praha	Signal Iduna Park	Dortmund	2	1	0	65079
mt322	2019-2020	2019-12-10 20:00:00	Inter	FC Barcelona	Giuseppe Meazza	Milano	1	2	0	71818
mt323	2019-2020	2019-09-17 17:55:00	Olympique Lyon	Zenit St. Petersburg	Groupama Stadium	Décines-Charpieu	1	1	0	47201
mt324	2019-2020	2019-09-17 20:00:00	SL Benfica	RB Leipzig	Estádio da Luz	Lisboa	1	2	0	46460
mt325	2019-2020	2019-10-02 20:00:00	Zenit St. Petersburg	SL Benfica	Gazprom Arena	St. Petersburg	3	1	0	51683
mt326	2019-2020	2019-10-02 20:00:00	RB Leipzig	Olympique Lyon	Red Bull Arena	Wals-Siezenheim	0	2	0	40194
mt327	2019-2020	2019-10-23 17:55:00	RB Leipzig	Zenit St. Petersburg	Red Bull Arena	Wals-Siezenheim	2	1	0	41058
mt328	2019-2020	2019-10-23 20:00:00	SL Benfica	Olympique Lyon	Estádio da Luz	Lisboa	2	1	0	53035
mt329	2019-2020	2019-11-05 17:55:00	Zenit St. Petersburg	RB Leipzig	Gazprom Arena	St. Petersburg	0	2	0	50452
mt330	2019-2020	2019-11-05 20:00:00	Olympique Lyon	SL Benfica	Groupama Stadium	Décines-Charpieu	3	1	0	51077
mt331	2019-2020	2019-11-27 17:55:00	Zenit St. Petersburg	Olympique Lyon	Gazprom Arena	St. Petersburg	2	0	0	51183
mt332	2019-2020	2019-11-27 20:00:00	RB Leipzig	SL Benfica	Red Bull Arena	Wals-Siezenheim	2	2	0	38339
mt333	2019-2020	2019-12-10 20:00:00	SL Benfica	Zenit St. Petersburg	Estádio da Luz	Lisboa	3	0	0	40232
mt334	2019-2020	2019-12-10 20:00:00	Olympique Lyon	RB Leipzig	Groupama Stadium	Décines-Charpieu	2	2	0	53288
mt335	2019-2020	2019-09-17 20:00:00	Chelsea FC	Valencia CF	Stamford Bridge	London	0	1	0	39469
mt336	2019-2020	2019-09-17 20:00:00	AFC Ajax	Lille OSC	Johan Cruijff ArenA	Amsterdam	3	0	0	51441
mt337	2019-2020	2019-10-02 20:00:00	Valencia CF	AFC Ajax	Estadio de Mestalla	Valencia	0	3	0	44659
mt338	2019-2020	2019-10-02 20:00:00	Lille OSC	Chelsea FC	Stade Pierre Mauroy	Villeneuve D’Ascq	1	2	0	48523
mt339	2019-2020	2019-10-23 17:55:00	AFC Ajax	Chelsea FC	Johan Cruijff ArenA	Amsterdam	0	1	0	52482
mt340	2019-2020	2019-10-23 20:00:00	Lille OSC	Valencia CF	Stade Pierre Mauroy	Villeneuve D’Ascq	1	1	0	47488
mt341	2019-2020	2019-11-05 20:00:00	Chelsea FC	AFC Ajax	Stamford Bridge	London	4	4	0	39132
mt342	2019-2020	2019-11-05 20:00:00	Valencia CF	Lille OSC	Estadio de Mestalla	Valencia	4	1	0	38252
mt343	2019-2020	2019-11-27 17:55:00	Valencia CF	Chelsea FC	Estadio de Mestalla	Valencia	2	2	0	43486
mt344	2019-2020	2019-11-27 20:00:00	Lille OSC	AFC Ajax	Stade Pierre Mauroy	Villeneuve D’Ascq	0	2	0	48612
mt345	2019-2020	2019-12-10 20:00:00	Chelsea FC	Lille OSC	Stamford Bridge	London	2	1	0	40016
mt346	2019-2020	2019-12-10 20:00:00	AFC Ajax	Valencia CF	Johan Cruijff ArenA	Amsterdam	0	1	0	51931
mt347	2019-2020	2020-02-18 20:00:00	Borussia Dortmund	Paris Saint-Germain	Signal Iduna Park	Dortmund	2	1	0	66099
mt348	2019-2020	2020-02-18 20:00:00	Atlético Madrid	Liverpool FC	Wanda Metropolitano	Madrid	1	0	0	67443
mt349	2019-2020	2020-02-19 20:00:00	Atalanta	Valencia CF	Giuseppe Meazza	Milano	4	1	0	44236
mt350	2019-2020	2020-02-19 20:00:00	Tottenham Hotspur	RB Leipzig	Tottenham Hotspur Stadium	London	0	1	0	60095
mt351	2019-2020	2020-02-25 20:00:00	Chelsea FC	Bayern München	Stamford Bridge	London	0	3	0	36761
mt352	2019-2020	2020-02-25 20:00:00	SSC Napoli	FC Barcelona	Diego Maradona	Napoli	1	1	0	44388
mt353	2019-2020	2020-02-26 20:00:00	Real Madrid	Manchester City	Santiago Bernabéu	Madrid	1	2	0	75615
mt354	2019-2020	2020-02-26 20:00:00	Olympique Lyon	Juventus	Groupama Stadium	Décines-Charpieu	1	0	0	57335
mt355	2019-2020	2020-03-10 20:00:00	Valencia CF	Atalanta	Estadio de Mestalla	Valencia	3	4	0	0
mt356	2019-2020	2020-03-10 20:00:00	RB Leipzig	Tottenham Hotspur	Red Bull Arena	Wals-Siezenheim	3	0	0	42146
mt357	2019-2020	2020-03-11 20:00:00	Paris Saint-Germain	Borussia Dortmund	Parc des Princes	Paris	2	0	0	0
mt358	2019-2020	2020-03-11 20:00:00	Liverpool FC	Atlético Madrid	Anfield	Liverpool	2	3	0	45000
mt359	2019-2020	2020-08-07 20:00:00	Manchester City	Real Madrid	Etihad Stadium	Manchester	2	1	0	0
mt360	2019-2020	2020-08-07 20:00:00	Juventus	Olympique Lyon	Allianz Stadium	Torino	2	1	0	0
mt361	2019-2020	2020-08-08 20:00:00	Bayern München	Chelsea FC	Allianz Arena	München	4	1	0	0
mt362	2019-2020	2020-08-08 20:00:00	FC Barcelona	SSC Napoli	Spotify Camp Nou	Barcelona	3	1	0	0
mt363	2019-2020	2020-08-12 20:00:00	Atalanta	Paris Saint-Germain	Estádio da Luz	Lisboa	1	2	0	0
mt364	2019-2020	2020-08-13 20:00:00	RB Leipzig	Atlético Madrid	Estádio José Alvalade	Lisboa	2	1	0	0
mt365	2019-2020	2020-08-14 20:00:00	FC Barcelona	Bayern München	Estádio da Luz	Lisboa	2	8	0	0
mt366	2019-2020	2020-08-15 20:00:00	Manchester City	Olympique Lyon	Estádio José Alvalade	Lisboa	1	3	0	0
mt367	2019-2020	2020-08-18 20:00:00	RB Leipzig	Paris Saint-Germain	Estádio da Luz	Lisboa	0	3	0	0
mt368	2019-2020	2020-08-19 20:00:00	Olympique Lyon	Bayern München	Estádio José Alvalade	Lisboa	0	3	0	0
mt369	2019-2020	2020-08-23 20:00:00	Paris Saint-Germain	Bayern München	Estádio da Luz	Lisboa	0	1	0	0
mt370	2018-2019	2018-09-18 20:00:00	AS Monaco	Atlético Madrid	Stade Louis II	Monaco	1	2	0	10575
mt371	2018-2019	2018-09-18 20:00:00	Club Brugge KV	Borussia Dortmund	Jan Breydel Stadion	Brugge	0	1	0	25181
mt372	2018-2019	2018-10-03 20:00:00	Borussia Dortmund	AS Monaco	Signal Iduna Park	Dortmund	3	0	0	66099
mt373	2018-2019	2018-10-03 20:00:00	Atlético Madrid	Club Brugge KV	Wanda Metropolitano	Madrid	3	1	0	55742
mt374	2018-2019	2018-10-24 17:55:00	Club Brugge KV	AS Monaco	Jan Breydel Stadion	Brugge	1	1	0	23957
mt375	2018-2019	2018-10-24 20:00:00	Borussia Dortmund	Atlético Madrid	Signal Iduna Park	Dortmund	4	0	0	66099
mt376	2018-2019	2018-11-06 17:55:00	AS Monaco	Club Brugge KV	Stade Louis II	Monaco	0	4	0	8347
mt377	2018-2019	2018-11-06 20:00:00	Atlético Madrid	Borussia Dortmund	Wanda Metropolitano	Madrid	2	0	0	61023
mt378	2018-2019	2018-11-28 17:55:00	Atlético Madrid	AS Monaco	Wanda Metropolitano	Madrid	2	0	0	56314
mt379	2018-2019	2018-11-28 20:00:00	Borussia Dortmund	Club Brugge KV	Signal Iduna Park	Dortmund	0	0	0	66099
mt380	2018-2019	2018-12-11 20:00:00	AS Monaco	Borussia Dortmund	Stade Louis II	Monaco	0	2	0	8731
mt381	2018-2019	2018-12-11 20:00:00	Club Brugge KV	Atlético Madrid	Jan Breydel Stadion	Brugge	0	0	0	25645
mt382	2018-2019	2018-09-18 17:55:00	FC Barcelona	PSV Eindhoven	Spotify Camp Nou	Barcelona	4	0	0	73462
mt383	2018-2019	2018-09-18 17:55:00	Inter	Tottenham Hotspur	Giuseppe Meazza	Milano	2	1	0	64123
mt384	2018-2019	2018-10-03 20:00:00	Tottenham Hotspur	FC Barcelona	Wembley Stadium	London	2	4	0	82137
mt385	2018-2019	2018-10-03 20:00:00	PSV Eindhoven	Inter	Philips Stadion	Eindhoven	1	2	0	34750
mt386	2018-2019	2018-10-24 17:55:00	PSV Eindhoven	Tottenham Hotspur	Philips Stadion	Eindhoven	2	2	0	35000
mt387	2018-2019	2018-10-24 20:00:00	FC Barcelona	Inter	Spotify Camp Nou	Barcelona	2	0	0	86290
mt388	2018-2019	2018-11-06 20:00:00	Tottenham Hotspur	PSV Eindhoven	Wembley Stadium	London	2	1	0	46588
mt389	2018-2019	2018-11-06 20:00:00	Inter	FC Barcelona	Giuseppe Meazza	Milano	1	1	0	70915
mt390	2018-2019	2018-11-28 20:00:00	PSV Eindhoven	FC Barcelona	Philips Stadion	Eindhoven	1	2	0	34600
mt391	2018-2019	2018-11-28 20:00:00	Tottenham Hotspur	Inter	Wembley Stadium	London	1	0	0	57132
mt392	2018-2019	2018-12-11 20:00:00	FC Barcelona	Tottenham Hotspur	Spotify Camp Nou	Barcelona	1	1	0	69961
mt393	2018-2019	2018-12-11 20:00:00	Inter	PSV Eindhoven	Giuseppe Meazza	Milano	1	1	0	62533
mt394	2018-2019	2018-09-18 20:00:00	Liverpool FC	Paris Saint-Germain	Anfield	Liverpool	3	2	0	52478
mt395	2018-2019	2018-09-18 20:00:00	Crvena Zvezda	SSC Napoli	Marakana	Beograd	0	0	0	49112
mt396	2018-2019	2018-10-03 17:55:00	Paris Saint-Germain	Crvena Zvezda	Parc des Princes	Paris	6	1	0	39979
mt397	2018-2019	2018-10-03 20:00:00	SSC Napoli	Liverpool FC	Diego Maradona	Napoli	1	0	0	37057
mt398	2018-2019	2018-10-24 20:00:00	Paris Saint-Germain	SSC Napoli	Parc des Princes	Paris	2	2	0	46274
mt399	2018-2019	2018-10-24 20:00:00	Liverpool FC	Crvena Zvezda	Anfield	Liverpool	4	0	0	53024
mt400	2018-2019	2018-11-06 17:55:00	Crvena Zvezda	Liverpool FC	Marakana	Beograd	2	0	0	51318
mt401	2018-2019	2018-11-06 20:00:00	SSC Napoli	Paris Saint-Germain	Diego Maradona	Napoli	1	1	0	55489
mt402	2018-2019	2018-11-28 20:00:00	Paris Saint-Germain	Liverpool FC	Parc des Princes	Paris	2	1	0	46880
mt403	2018-2019	2018-11-28 20:00:00	SSC Napoli	Crvena Zvezda	Diego Maradona	Napoli	3	1	0	44470
mt404	2018-2019	2018-12-11 20:00:00	Liverpool FC	SSC Napoli	Anfield	Liverpool	1	0	0	52015
mt405	2018-2019	2018-12-11 20:00:00	Crvena Zvezda	Paris Saint-Germain	Marakana	Beograd	1	4	0	48357
mt406	2018-2019	2018-09-18 20:00:00	FC Schalke 04	FC Porto	Veltins-Arena	Gelsenkirchen	1	1	0	45755
mt407	2018-2019	2018-09-18 20:00:00	Galatasaray	Lokomotiv Moskva	Nef Stadyumu	Istanbul	3	0	0	43542
mt408	2018-2019	2018-10-03 17:55:00	Lokomotiv Moskva	FC Schalke 04	RŽD-Arena	Moskva	0	1	0	21471
mt409	2018-2019	2018-10-03 20:00:00	FC Porto	Galatasaray	Estádio do Dragão	Porto	1	0	0	42711
mt410	2018-2019	2018-10-24 20:00:00	Lokomotiv Moskva	FC Porto	RŽD-Arena	Moskva	1	3	0	16034
mt411	2018-2019	2018-10-24 20:00:00	Galatasaray	FC Schalke 04	Nef Stadyumu	Istanbul	0	0	0	46667
mt412	2018-2019	2018-11-06 20:00:00	FC Porto	Lokomotiv Moskva	Estádio do Dragão	Porto	4	1	0	34616
mt413	2018-2019	2018-11-06 20:00:00	FC Schalke 04	Galatasaray	Veltins-Arena	Gelsenkirchen	2	0	0	54740
mt414	2018-2019	2018-11-28 17:55:00	Lokomotiv Moskva	Galatasaray	RŽD-Arena	Moskva	2	0	0	14037
mt415	2018-2019	2018-11-28 20:00:00	FC Porto	FC Schalke 04	Estádio do Dragão	Porto	3	1	0	41603
mt416	2018-2019	2018-12-11 17:55:00	FC Schalke 04	Lokomotiv Moskva	Veltins-Arena	Gelsenkirchen	1	0	0	48883
mt417	2018-2019	2018-12-11 17:55:00	Galatasaray	FC Porto	Nef Stadyumu	Istanbul	2	3	0	33972
mt418	2018-2019	2018-09-19 17:55:00	AFC Ajax	AEK Athen	Johan Cruijff ArenA	Amsterdam	3	0	0	52285
mt419	2018-2019	2018-09-19 20:00:00	SL Benfica	Bayern München	Estádio da Luz	Lisboa	0	2	0	60274
mt420	2018-2019	2018-10-02 20:00:00	Bayern München	AFC Ajax	Allianz Arena	München	1	1	0	70000
mt421	2018-2019	2018-10-02 20:00:00	AEK Athen	SL Benfica	Spyros Louis (OAKA)	Athen	2	3	0	31154
mt422	2018-2019	2018-10-23 17:55:00	AEK Athen	Bayern München	Spyros Louis (OAKA)	Athen	0	2	0	61221
mt423	2018-2019	2018-10-23 20:00:00	AFC Ajax	SL Benfica	Johan Cruijff ArenA	Amsterdam	1	0	0	52489
mt424	2018-2019	2018-11-07 20:00:00	SL Benfica	AFC Ajax	Estádio da Luz	Lisboa	1	1	0	51328
mt425	2018-2019	2018-11-07 20:00:00	Bayern München	AEK Athen	Allianz Arena	München	2	0	0	70000
mt426	2018-2019	2018-11-27 17:55:00	AEK Athen	AFC Ajax	Spyros Louis (OAKA)	Athen	0	2	0	25756
mt427	2018-2019	2018-11-27 20:00:00	Bayern München	SL Benfica	Allianz Arena	München	5	1	0	70000
mt428	2018-2019	2018-12-12 20:00:00	AFC Ajax	Bayern München	Johan Cruijff ArenA	Amsterdam	3	3	0	52244
mt429	2018-2019	2018-12-12 20:00:00	SL Benfica	AEK Athen	Estádio da Luz	Lisboa	1	0	0	33633
mt430	2018-2019	2018-09-19 17:55:00	Shakhtar Donetsk	1899 Hoffenheim	Metalist Stadion	Kharkiv	2	2	0	28336
mt431	2018-2019	2018-09-19 20:00:00	Manchester City	Olympique Lyon	Etihad Stadium	Manchester	1	2	0	40111
mt432	2018-2019	2018-10-02 17:55:00	1899 Hoffenheim	Manchester City	PreZero Arena	Sinsheim	1	2	0	24851
mt433	2018-2019	2018-10-02 20:00:00	Olympique Lyon	Shakhtar Donetsk	Groupama Stadium	Décines-Charpieu	2	2	0	0
mt434	2018-2019	2018-10-23 20:00:00	Shakhtar Donetsk	Manchester City	Metalist Stadion	Kharkiv	0	3	0	37106
mt435	2018-2019	2018-10-23 20:00:00	1899 Hoffenheim	Olympique Lyon	PreZero Arena	Sinsheim	3	3	0	24144
mt436	2018-2019	2018-11-07 20:00:00	Manchester City	Shakhtar Donetsk	Etihad Stadium	Manchester	6	0	0	52286
mt437	2018-2019	2018-11-07 20:00:00	Olympique Lyon	1899 Hoffenheim	Groupama Stadium	Décines-Charpieu	2	2	0	53850
mt438	2018-2019	2018-11-27 20:00:00	Olympique Lyon	Manchester City	Groupama Stadium	Décines-Charpieu	2	2	0	56039
mt439	2018-2019	2018-11-27 20:00:00	1899 Hoffenheim	Shakhtar Donetsk	PreZero Arena	Sinsheim	2	3	0	22920
mt440	2018-2019	2018-12-12 20:00:00	Shakhtar Donetsk	Olympique Lyon	Olimpiyskyi	Kiev	1	1	0	38916
mt441	2018-2019	2018-12-12 20:00:00	Manchester City	1899 Hoffenheim	Etihad Stadium	Manchester	2	1	0	50411
mt442	2018-2019	2018-09-19 20:00:00	Real Madrid	AS Roma	Santiago Bernabéu	Madrid	3	0	0	69251
mt443	2018-2019	2018-09-19 20:00:00	Viktoria Plzeň	CSKA Moskva	Doosan Arena	Plzeň	2	2	0	11312
mt444	2018-2019	2018-10-02 20:00:00	CSKA Moskva	Real Madrid	Luzhniki	Moskva	1	0	0	71811
mt445	2018-2019	2018-10-02 20:00:00	AS Roma	Viktoria Plzeň	Olimpico	Roma	5	0	0	41243
mt446	2018-2019	2018-10-23 20:00:00	AS Roma	CSKA Moskva	Olimpico	Roma	3	0	0	46005
mt447	2018-2019	2018-10-23 20:00:00	Real Madrid	Viktoria Plzeň	Santiago Bernabéu	Madrid	2	1	0	67356
mt448	2018-2019	2018-11-07 17:55:00	CSKA Moskva	AS Roma	Luzhniki	Moskva	1	2	0	64454
mt449	2018-2019	2018-11-07 20:00:00	Viktoria Plzeň	Real Madrid	Doosan Arena	Plzeň	0	5	0	11483
mt450	2018-2019	2018-11-27 17:55:00	CSKA Moskva	Viktoria Plzeň	Luzhniki	Moskva	1	2	0	52892
mt451	2018-2019	2018-11-27 20:00:00	AS Roma	Real Madrid	Olimpico	Roma	0	2	0	59124
mt452	2018-2019	2018-12-12 17:55:00	Real Madrid	CSKA Moskva	Santiago Bernabéu	Madrid	0	3	0	51636
mt453	2018-2019	2018-12-12 17:55:00	Viktoria Plzeň	AS Roma	Doosan Arena	Plzeň	2	1	0	11217
mt454	2018-2019	2018-09-19 20:00:00	Valencia CF	Juventus	Estadio de Mestalla	Valencia	0	2	0	46067
mt455	2018-2019	2018-09-19 20:00:00	BSC Young Boys	Manchester United	Stadion Wankdorf	Bern	0	3	0	31120
mt456	2018-2019	2018-10-02 17:55:00	Juventus	BSC Young Boys	Allianz Stadium	Torino	3	0	0	40961
mt457	2018-2019	2018-10-02 20:00:00	Manchester United	Valencia CF	Old Trafford	Manchester	0	0	0	73569
mt458	2018-2019	2018-10-23 17:55:00	BSC Young Boys	Valencia CF	Stadion Wankdorf	Bern	1	1	0	31120
mt459	2018-2019	2018-10-23 20:00:00	Manchester United	Juventus	Old Trafford	Manchester	0	1	0	73946
mt460	2018-2019	2018-11-07 17:55:00	Valencia CF	BSC Young Boys	Estadio de Mestalla	Valencia	3	1	0	36480
mt461	2018-2019	2018-11-07 20:00:00	Juventus	Manchester United	Allianz Stadium	Torino	1	2	0	41470
mt462	2018-2019	2018-11-27 20:00:00	Juventus	Valencia CF	Allianz Stadium	Torino	1	0	0	39070
mt463	2018-2019	2018-11-27 20:00:00	Manchester United	BSC Young Boys	Old Trafford	Manchester	1	0	0	72876
mt464	2018-2019	2018-12-12 20:00:00	Valencia CF	Manchester United	Estadio de Mestalla	Valencia	2	1	0	36544
mt465	2018-2019	2018-12-12 20:00:00	BSC Young Boys	Juventus	Stadion Wankdorf	Bern	2	1	0	30114
mt466	2018-2019	2019-02-12 20:00:00	Manchester United	Paris Saint-Germain	Old Trafford	Manchester	0	2	0	74054
mt467	2018-2019	2019-02-12 20:00:00	AS Roma	FC Porto	Olimpico	Roma	2	1	0	51727
mt468	2018-2019	2019-02-13 20:00:00	Tottenham Hotspur	Borussia Dortmund	Wembley Stadium	London	3	0	0	71214
mt469	2018-2019	2019-02-13 20:00:00	AFC Ajax	Real Madrid	Johan Cruijff ArenA	Amsterdam	1	2	0	52286
mt470	2018-2019	2019-02-19 20:00:00	Olympique Lyon	FC Barcelona	Groupama Stadium	Décines-Charpieu	0	0	0	57889
mt471	2018-2019	2019-02-19 20:00:00	Liverpool FC	Bayern München	Anfield	Liverpool	0	0	0	52250
mt472	2018-2019	2019-02-20 20:00:00	FC Schalke 04	Manchester City	Veltins-Arena	Gelsenkirchen	2	3	0	54417
mt473	2018-2019	2019-02-20 20:00:00	Atlético Madrid	Juventus	Wanda Metropolitano	Madrid	2	0	0	67193
mt474	2018-2019	2019-03-05 20:00:00	Borussia Dortmund	Tottenham Hotspur	Signal Iduna Park	Dortmund	0	1	0	66099
mt475	2018-2019	2019-03-05 20:00:00	Real Madrid	AFC Ajax	Santiago Bernabéu	Madrid	1	4	0	77013
mt476	2018-2019	2019-03-06 20:00:00	Paris Saint-Germain	Manchester United	Parc des Princes	Paris	1	3	0	47441
mt477	2018-2019	2019-03-06 20:00:00	FC Porto	AS Roma	Estádio do Dragão	Porto	3	1	0	49029
mt478	2018-2019	2019-03-12 20:00:00	Manchester City	FC Schalke 04	Etihad Stadium	Manchester	7	0	0	51518
mt479	2018-2019	2019-03-12 20:00:00	Juventus	Atlético Madrid	Allianz Stadium	Torino	3	0	0	40884
mt480	2018-2019	2019-03-13 20:00:00	FC Barcelona	Olympique Lyon	Spotify Camp Nou	Barcelona	5	1	0	92346
mt481	2018-2019	2019-03-13 20:00:00	Bayern München	Liverpool FC	Allianz Arena	München	1	3	0	68145
mt482	2018-2019	2019-04-09 20:00:00	Liverpool FC	FC Porto	Anfield	Liverpool	2	0	0	52465
mt483	2018-2019	2019-04-09 20:00:00	Tottenham Hotspur	Manchester City	Tottenham Hotspur Stadium	London	1	0	0	60044
mt484	2018-2019	2019-04-10 20:00:00	AFC Ajax	Juventus	Johan Cruijff ArenA	Amsterdam	1	1	0	50390
mt485	2018-2019	2019-04-10 20:00:00	Manchester United	FC Barcelona	Old Trafford	Manchester	0	1	0	74093
mt486	2018-2019	2019-04-16 20:00:00	Juventus	AFC Ajax	Allianz Stadium	Torino	1	2	0	41445
mt487	2018-2019	2019-04-16 20:00:00	FC Barcelona	Manchester United	Spotify Camp Nou	Barcelona	3	0	0	96708
mt488	2018-2019	2019-04-17 20:00:00	FC Porto	Liverpool FC	Estádio do Dragão	Porto	1	4	0	49117
mt489	2018-2019	2019-04-17 20:00:00	Manchester City	Tottenham Hotspur	Etihad Stadium	Manchester	4	3	0	53348
mt490	2018-2019	2019-04-30 20:00:00	Tottenham Hotspur	AFC Ajax	Tottenham Hotspur Stadium	London	0	1	0	60243
mt491	2018-2019	2019-05-01 20:00:00	FC Barcelona	Liverpool FC	Spotify Camp Nou	Barcelona	3	0	0	98299
mt492	2018-2019	2019-05-07 20:00:00	Liverpool FC	FC Barcelona	Anfield	Liverpool	4	0	0	55212
mt493	2018-2019	2019-05-08 20:00:00	AFC Ajax	Tottenham Hotspur	Johan Cruijff ArenA	Amsterdam	2	3	0	52641
mt494	2018-2019	2019-06-01 20:00:00	Tottenham Hotspur	Liverpool FC	Wanda Metropolitano	Madrid	0	2	0	63272
mt495	2017-2018	2017-09-12 19:45:00	Manchester United	FC Basel	Old Trafford	Manchester	3	0	0	73854
mt496	2017-2018	2017-09-12 19:45:00	SL Benfica	CSKA Moskva	Estádio da Luz	Lisboa	1	2	0	38323
mt497	2017-2018	2017-09-27 19:45:00	FC Basel	SL Benfica	St. Jakob-Park	Basel	5	0	0	34111
mt498	2017-2018	2017-09-27 19:45:00	CSKA Moskva	Manchester United	VEB Arena	Moskva	1	4	0	29073
mt499	2017-2018	2017-10-18 19:45:00	SL Benfica	Manchester United	Estádio da Luz	Lisboa	0	1	0	57684
mt500	2017-2018	2017-10-18 19:45:00	CSKA Moskva	FC Basel	VEB Arena	Moskva	0	2	0	27996
mt501	2017-2018	2017-10-31 19:45:00	Manchester United	SL Benfica	Old Trafford	Manchester	2	0	0	74437
mt502	2017-2018	2017-10-31 19:45:00	FC Basel	CSKA Moskva	St. Jakob-Park	Basel	1	2	0	33303
mt503	2017-2018	2017-11-22 17:00:00	CSKA Moskva	SL Benfica	VEB Arena	Moskva	2	0	0	27709
mt504	2017-2018	2017-11-22 19:45:00	FC Basel	Manchester United	St. Jakob-Park	Basel	1	0	0	36000
mt505	2017-2018	2017-12-05 19:45:00	SL Benfica	FC Basel	Estádio da Luz	Lisboa	0	2	0	22470
mt506	2017-2018	2017-12-05 19:45:00	Manchester United	CSKA Moskva	Old Trafford	Manchester	2	1	0	74669
mt507	2017-2018	2017-09-12 19:45:00	Bayern München	RSC Anderlecht	Allianz Arena	München	3	0	0	70000
mt508	2017-2018	2017-09-12 19:45:00	Celtic FC	Paris Saint-Germain	Celtic Park	Glasgow	0	5	0	57562
mt509	2017-2018	2017-09-27 19:45:00	Paris Saint-Germain	Bayern München	Parc des Princes	Paris	3	0	0	46252
mt510	2017-2018	2017-09-27 19:45:00	RSC Anderlecht	Celtic FC	Lotto Park	Bruxelles	0	3	0	19898
mt511	2017-2018	2017-10-18 19:45:00	RSC Anderlecht	Paris Saint-Germain	Lotto Park	Bruxelles	0	4	0	19108
mt512	2017-2018	2017-10-18 19:45:00	Bayern München	Celtic FC	Allianz Arena	München	3	0	0	70000
mt513	2017-2018	2017-10-31 19:45:00	Paris Saint-Germain	RSC Anderlecht	Parc des Princes	Paris	5	0	0	46403
mt514	2017-2018	2017-10-31 19:45:00	Celtic FC	Bayern München	Celtic Park	Glasgow	1	2	0	58269
mt515	2017-2018	2017-11-22 19:45:00	RSC Anderlecht	Bayern München	Lotto Park	Bruxelles	1	2	0	19753
mt516	2017-2018	2017-11-22 19:45:00	Paris Saint-Germain	Celtic FC	Parc des Princes	Paris	7	1	0	46288
mt517	2017-2018	2017-12-05 19:45:00	Bayern München	Paris Saint-Germain	Allianz Arena	München	3	1	0	70000
mt518	2017-2018	2017-12-05 19:45:00	Celtic FC	RSC Anderlecht	Celtic Park	Glasgow	0	1	0	57931
mt519	2017-2018	2017-09-12 19:45:00	AS Roma	Atlético Madrid	Olimpico	Roma	0	0	0	36064
mt520	2017-2018	2017-09-12 19:45:00	Chelsea FC	Qarabağ FK	Stamford Bridge	London	6	0	0	41150
mt521	2017-2018	2017-09-27 17:00:00	Qarabağ FK	AS Roma	Baku National Stadium	Baku	1	2	0	67200
mt522	2017-2018	2017-09-27 19:45:00	Atlético Madrid	Chelsea FC	Wanda Metropolitano	Madrid	1	2	0	60643
mt523	2017-2018	2017-10-18 17:00:00	Qarabağ FK	Atlético Madrid	Baku National Stadium	Baku	0	0	0	47923
mt524	2017-2018	2017-10-18 19:45:00	Chelsea FC	AS Roma	Stamford Bridge	London	3	3	0	41105
mt525	2017-2018	2017-10-31 19:45:00	AS Roma	Chelsea FC	Olimpico	Roma	3	0	0	55036
mt526	2017-2018	2017-10-31 19:45:00	Atlético Madrid	Qarabağ FK	Wanda Metropolitano	Madrid	1	1	0	55893
mt527	2017-2018	2017-11-22 17:00:00	Qarabağ FK	Chelsea FC	Baku National Stadium	Baku	0	4	0	67100
mt528	2017-2018	2017-11-22 19:45:00	Atlético Madrid	AS Roma	Wanda Metropolitano	Madrid	2	0	0	56253
mt529	2017-2018	2017-12-05 19:45:00	Chelsea FC	Atlético Madrid	Stamford Bridge	London	1	1	0	40875
mt530	2017-2018	2017-12-05 19:45:00	AS Roma	Qarabağ FK	Olimpico	Roma	1	0	0	34258
mt531	2017-2018	2017-09-12 19:45:00	FC Barcelona	Juventus	Spotify Camp Nou	Barcelona	3	0	0	78656
mt532	2017-2018	2017-09-12 19:45:00	Olympiakos Piraeus	Sporting CP	Georgios Karaiskakis	Piräus	2	3	0	30168
mt533	2017-2018	2017-09-27 19:45:00	Juventus	Olympiakos Piraeus	Allianz Stadium	Torino	2	0	0	33460
mt534	2017-2018	2017-09-27 19:45:00	Sporting CP	FC Barcelona	Estádio José Alvalade	Lisboa	0	1	0	48575
mt535	2017-2018	2017-10-18 19:45:00	FC Barcelona	Olympiakos Piraeus	Spotify Camp Nou	Barcelona	3	1	0	55026
mt536	2017-2018	2017-10-18 19:45:00	Juventus	Sporting CP	Allianz Stadium	Torino	2	1	0	36288
mt537	2017-2018	2017-10-31 19:45:00	Olympiakos Piraeus	FC Barcelona	Georgios Karaiskakis	Piräus	0	0	0	31600
mt538	2017-2018	2017-10-31 19:45:00	Sporting CP	Juventus	Estádio José Alvalade	Lisboa	1	1	0	48442
mt539	2017-2018	2017-11-22 19:45:00	Juventus	FC Barcelona	Allianz Stadium	Torino	0	0	0	40876
mt540	2017-2018	2017-11-22 19:45:00	Sporting CP	Olympiakos Piraeus	Estádio José Alvalade	Lisboa	3	1	0	42528
mt541	2017-2018	2017-12-05 19:45:00	FC Barcelona	Sporting CP	Spotify Camp Nou	Barcelona	2	0	0	48336
mt542	2017-2018	2017-12-05 19:45:00	Olympiakos Piraeus	Juventus	Georgios Karaiskakis	Piräus	0	2	0	29567
mt543	2017-2018	2017-09-13 19:45:00	Liverpool FC	Sevilla FC	Anfield	Liverpool	2	2	0	52332
mt544	2017-2018	2017-09-13 19:45:00	NK Maribor	Spartak Moskva	Ljudski vrt	Maribor	1	1	0	12566
mt545	2017-2018	2017-09-26 19:45:00	Spartak Moskva	Liverpool FC	Otkrytie Arena	Moskva	1	1	0	43376
mt546	2017-2018	2017-09-26 19:45:00	Sevilla FC	NK Maribor	Ramón Sánchez Pizjuán	Sevilla	3	0	0	34705
mt547	2017-2018	2017-10-17 19:45:00	Spartak Moskva	Sevilla FC	Otkrytie Arena	Moskva	5	1	0	44307
mt548	2017-2018	2017-10-17 19:45:00	NK Maribor	Liverpool FC	Ljudski vrt	Maribor	0	7	0	12506
mt549	2017-2018	2017-11-01 19:45:00	Sevilla FC	Spartak Moskva	Ramón Sánchez Pizjuán	Sevilla	2	1	0	38002
mt550	2017-2018	2017-11-01 19:45:00	Liverpool FC	NK Maribor	Anfield	Liverpool	3	0	0	47957
mt551	2017-2018	2017-11-21 17:00:00	Spartak Moskva	NK Maribor	Otkrytie Arena	Moskva	1	1	0	42920
mt552	2017-2018	2017-11-21 19:45:00	Sevilla FC	Liverpool FC	Ramón Sánchez Pizjuán	Sevilla	3	3	0	39495
mt553	2017-2018	2017-12-06 19:45:00	Liverpool FC	Spartak Moskva	Anfield	Liverpool	7	0	0	48779
mt554	2017-2018	2017-12-06 19:45:00	NK Maribor	Sevilla FC	Ljudski vrt	Maribor	1	1	0	11976
mt555	2017-2018	2017-09-13 19:45:00	Shakhtar Donetsk	SSC Napoli	Metalist Stadion	Kharkiv	2	1	0	32679
mt556	2017-2018	2017-09-13 19:45:00	Feyenoord	Manchester City	De Kuip	Rotterdam	0	4	0	43500
mt557	2017-2018	2017-09-26 19:45:00	Manchester City	Shakhtar Donetsk	Etihad Stadium	Manchester	2	0	0	45310
mt558	2017-2018	2017-09-26 19:45:00	SSC Napoli	Feyenoord	Diego Maradona	Napoli	3	1	0	22577
mt559	2017-2018	2017-10-17 19:45:00	Manchester City	SSC Napoli	Etihad Stadium	Manchester	2	1	0	48520
mt560	2017-2018	2017-10-17 19:45:00	Feyenoord	Shakhtar Donetsk	De Kuip	Rotterdam	1	2	0	43500
mt561	2017-2018	2017-11-01 19:45:00	SSC Napoli	Manchester City	Diego Maradona	Napoli	2	4	0	44483
mt562	2017-2018	2017-11-01 19:45:00	Shakhtar Donetsk	Feyenoord	Metalist Stadion	Kharkiv	3	1	0	24570
mt563	2017-2018	2017-11-21 19:45:00	SSC Napoli	Shakhtar Donetsk	Diego Maradona	Napoli	3	0	0	10573
mt564	2017-2018	2017-11-21 19:45:00	Manchester City	Feyenoord	Etihad Stadium	Manchester	1	0	0	43548
mt565	2017-2018	2017-12-06 19:45:00	Shakhtar Donetsk	Manchester City	Metalist Stadion	Kharkiv	2	1	0	33154
mt566	2017-2018	2017-12-06 19:45:00	Feyenoord	SSC Napoli	De Kuip	Rotterdam	2	1	0	36500
mt567	2017-2018	2017-09-13 19:45:00	FC Porto	Beşiktaş	Estádio do Dragão	Porto	1	3	0	42429
mt568	2017-2018	2017-09-13 19:45:00	RB Leipzig	AS Monaco	Red Bull Arena	Wals-Siezenheim	1	1	0	40068
mt569	2017-2018	2017-09-26 19:45:00	AS Monaco	FC Porto	Stade Louis II	Monaco	0	3	0	11703
mt570	2017-2018	2017-09-26 19:45:00	Beşiktaş	RB Leipzig	Vodafone Park	Istanbul	2	0	0	36641
mt571	2017-2018	2017-10-17 19:45:00	AS Monaco	Beşiktaş	Stade Louis II	Monaco	1	2	0	7403
mt572	2017-2018	2017-10-17 19:45:00	RB Leipzig	FC Porto	Red Bull Arena	Wals-Siezenheim	3	2	0	41496
mt573	2017-2018	2017-11-01 17:00:00	Beşiktaş	AS Monaco	Vodafone Park	Istanbul	1	1	0	39346
mt574	2017-2018	2017-11-01 19:45:00	FC Porto	RB Leipzig	Estádio do Dragão	Porto	3	1	0	41616
mt575	2017-2018	2017-11-21 17:00:00	Beşiktaş	FC Porto	Vodafone Park	Istanbul	1	1	0	36919
mt576	2017-2018	2017-11-21 19:45:00	AS Monaco	RB Leipzig	Stade Louis II	Monaco	1	4	0	9029
mt577	2017-2018	2017-12-06 19:45:00	FC Porto	AS Monaco	Estádio do Dragão	Porto	5	2	0	42509
mt578	2017-2018	2017-12-06 19:45:00	RB Leipzig	Beşiktaş	Red Bull Arena	Wals-Siezenheim	1	2	0	42558
mt579	2017-2018	2017-09-13 19:45:00	Tottenham Hotspur	Borussia Dortmund	Wembley Stadium	London	3	1	0	67343
mt580	2017-2018	2017-09-13 19:45:00	Real Madrid	APOEL Nikosia	Santiago Bernabéu	Madrid	3	0	0	71060
mt581	2017-2018	2017-09-26 19:45:00	Borussia Dortmund	Real Madrid	Signal Iduna Park	Dortmund	1	3	0	65849
mt582	2017-2018	2017-09-26 19:45:00	APOEL Nikosia	Tottenham Hotspur	Neo GSP Stadium	Nikosia	0	3	0	16324
mt583	2017-2018	2017-10-17 19:45:00	Real Madrid	Tottenham Hotspur	Santiago Bernabéu	Madrid	1	1	0	76589
mt584	2017-2018	2017-10-17 19:45:00	APOEL Nikosia	Borussia Dortmund	Neo GSP Stadium	Nikosia	1	1	0	15604
mt585	2017-2018	2017-11-01 19:45:00	Tottenham Hotspur	Real Madrid	Wembley Stadium	London	3	1	0	83782
mt586	2017-2018	2017-11-01 19:45:00	Borussia Dortmund	APOEL Nikosia	Signal Iduna Park	Dortmund	1	1	0	64509
mt587	2017-2018	2017-11-21 19:45:00	Borussia Dortmund	Tottenham Hotspur	Signal Iduna Park	Dortmund	1	2	0	65849
mt588	2017-2018	2017-11-21 19:45:00	APOEL Nikosia	Real Madrid	Neo GSP Stadium	Nikosia	0	6	0	19705
mt589	2017-2018	2017-12-06 19:45:00	Real Madrid	Borussia Dortmund	Santiago Bernabéu	Madrid	3	2	0	73323
mt590	2017-2018	2017-12-06 19:45:00	Tottenham Hotspur	APOEL Nikosia	Wembley Stadium	London	3	0	0	42679
mt591	2017-2018	2018-02-13 19:45:00	Juventus	Tottenham Hotspur	Allianz Stadium	Torino	2	2	0	41232
mt592	2017-2018	2018-02-13 19:45:00	FC Basel	Manchester City	St. Jakob-Park	Basel	0	4	0	36000
mt593	2017-2018	2018-02-14 19:45:00	FC Porto	Liverpool FC	Estádio do Dragão	Porto	0	5	0	47718
mt594	2017-2018	2018-02-14 19:45:00	Real Madrid	Paris Saint-Germain	Santiago Bernabéu	Madrid	3	1	0	78158
mt595	2017-2018	2018-02-20 19:45:00	Chelsea FC	FC Barcelona	Stamford Bridge	London	1	1	0	37741
mt596	2017-2018	2018-02-20 19:45:00	Bayern München	Beşiktaş	Allianz Arena	München	5	0	0	70000
mt597	2017-2018	2018-02-21 19:45:00	Sevilla FC	Manchester United	Ramón Sánchez Pizjuán	Sevilla	0	0	0	39725
mt598	2017-2018	2018-02-21 19:45:00	Shakhtar Donetsk	AS Roma	Metalist Stadion	Kharkiv	2	1	0	35124
mt599	2017-2018	2018-03-06 19:45:00	Liverpool FC	FC Porto	Anfield	Liverpool	0	0	0	48768
mt600	2017-2018	2018-03-06 19:45:00	Paris Saint-Germain	Real Madrid	Parc des Princes	Paris	1	2	0	46585
mt601	2017-2018	2018-03-07 19:45:00	Tottenham Hotspur	Juventus	Wembley Stadium	London	1	2	0	84010
mt602	2017-2018	2018-03-07 19:45:00	Manchester City	FC Basel	Etihad Stadium	Manchester	1	2	0	49411
mt603	2017-2018	2018-03-13 19:45:00	Manchester United	Sevilla FC	Old Trafford	Manchester	1	2	0	74909
mt604	2017-2018	2018-03-13 19:45:00	AS Roma	Shakhtar Donetsk	Olimpico	Roma	1	0	0	47693
mt605	2017-2018	2018-03-14 17:00:00	Beşiktaş	Bayern München	Vodafone Park	Istanbul	1	3	0	36885
mt606	2017-2018	2018-03-14 19:45:00	FC Barcelona	Chelsea FC	Spotify Camp Nou	Barcelona	3	0	0	97183
mt607	2017-2018	2018-04-03 19:45:00	Sevilla FC	Bayern München	Ramón Sánchez Pizjuán	Sevilla	1	2	0	40635
mt608	2017-2018	2018-04-03 19:45:00	Juventus	Real Madrid	Allianz Stadium	Torino	0	3	0	40849
mt609	2017-2018	2018-04-04 19:45:00	FC Barcelona	AS Roma	Spotify Camp Nou	Barcelona	4	1	0	90106
mt610	2017-2018	2018-04-04 19:45:00	Liverpool FC	Manchester City	Anfield	Liverpool	3	0	0	50685
mt611	2017-2018	2018-04-10 19:45:00	AS Roma	FC Barcelona	Olimpico	Roma	3	0	0	56580
mt612	2017-2018	2018-04-10 19:45:00	Manchester City	Liverpool FC	Etihad Stadium	Manchester	1	2	0	53461
mt613	2017-2018	2018-04-11 19:45:00	Bayern München	Sevilla FC	Allianz Arena	München	0	0	0	70000
mt614	2017-2018	2018-04-11 19:45:00	Real Madrid	Juventus	Santiago Bernabéu	Madrid	1	3	0	75796
mt615	2017-2018	2018-04-24 19:45:00	Liverpool FC	AS Roma	Anfield	Liverpool	5	2	0	51236
mt616	2017-2018	2018-04-25 19:45:00	Bayern München	Real Madrid	Allianz Arena	München	1	2	0	70000
mt617	2017-2018	2018-05-01 19:45:00	Real Madrid	Bayern München	Santiago Bernabéu	Madrid	2	2	0	77459
mt618	2017-2018	2018-05-02 19:45:00	AS Roma	Liverpool FC	Olimpico	Roma	4	2	0	61889
mt619	2017-2018	2018-05-26 19:45:00	Real Madrid	Liverpool FC	Olimpiyskyi	Kiev	3	1	0	61561
mt620	2016-2017	2016-09-13 19:45:00	FC Basel	PFC Ludogorets Razgrad	St. Jakob-Park	Basel	1	1	0	30852
mt621	2016-2017	2016-09-13 19:45:00	Paris Saint-Germain	Arsenal FC	Parc des Princes	Paris	1	1	0	46440
mt622	2016-2017	2016-09-28 19:45:00	Arsenal FC	FC Basel	Emirates Stadium	London	2	0	0	59993
mt623	2016-2017	2016-09-28 19:45:00	PFC Ludogorets Razgrad	Paris Saint-Germain	Vasil Levski	Sofia	1	3	0	17155
mt624	2016-2017	2016-10-19 19:45:00	Arsenal FC	PFC Ludogorets Razgrad	Emirates Stadium	London	6	0	0	59944
mt625	2016-2017	2016-10-19 19:45:00	Paris Saint-Germain	FC Basel	Parc des Princes	Paris	3	0	0	46488
mt626	2016-2017	2016-11-01 19:45:00	FC Basel	Paris Saint-Germain	St. Jakob-Park	Basel	1	2	0	34639
mt627	2016-2017	2016-11-01 19:45:00	PFC Ludogorets Razgrad	Arsenal FC	Vasil Levski	Sofia	2	3	0	30862
mt628	2016-2017	2016-11-23 19:45:00	Arsenal FC	Paris Saint-Germain	Emirates Stadium	London	2	2	0	59628
mt629	2016-2017	2016-11-23 19:45:00	PFC Ludogorets Razgrad	FC Basel	Vasil Levski	Sofia	0	0	0	20821
mt630	2016-2017	2016-12-06 19:45:00	FC Basel	Arsenal FC	St. Jakob-Park	Basel	1	4	0	36000
mt631	2016-2017	2016-12-06 19:45:00	Paris Saint-Germain	PFC Ludogorets Razgrad	Parc des Princes	Paris	2	2	0	42650
mt632	2016-2017	2016-09-13 19:45:00	Dinamo Kiev	SSC Napoli	Olimpiyskyi	Kiev	1	2	0	35137
mt633	2016-2017	2016-09-13 19:45:00	SL Benfica	Beşiktaş	Estádio da Luz	Lisboa	1	1	0	42126
mt634	2016-2017	2016-09-28 19:45:00	Beşiktaş	Dinamo Kiev	Vodafone Park	Istanbul	1	1	0	33938
mt635	2016-2017	2016-09-28 19:45:00	SSC Napoli	SL Benfica	Diego Maradona	Napoli	4	2	0	41281
mt636	2016-2017	2016-10-19 19:45:00	Dinamo Kiev	SL Benfica	Olimpiyskyi	Kiev	0	2	0	25991
mt637	2016-2017	2016-10-19 19:45:00	SSC Napoli	Beşiktaş	Diego Maradona	Napoli	2	3	0	28502
mt638	2016-2017	2016-11-01 17:45:00	Beşiktaş	SSC Napoli	Vodafone Park	Istanbul	1	1	0	35552
mt639	2016-2017	2016-11-01 19:45:00	SL Benfica	Dinamo Kiev	Estádio da Luz	Lisboa	1	0	0	51641
mt640	2016-2017	2016-11-23 17:45:00	Beşiktaş	SL Benfica	Vodafone Park	Istanbul	3	3	0	36063
mt641	2016-2017	2016-11-23 19:45:00	SSC Napoli	Dinamo Kiev	Diego Maradona	Napoli	0	0	0	33736
mt642	2016-2017	2016-12-06 19:45:00	Dinamo Kiev	Beşiktaş	Olimpiyskyi	Kiev	6	0	0	14036
mt643	2016-2017	2016-12-06 19:45:00	SL Benfica	SSC Napoli	Estádio da Luz	Lisboa	1	2	0	55634
mt644	2016-2017	2016-09-13 19:45:00	FC Barcelona	Celtic FC	Spotify Camp Nou	Barcelona	7	0	0	73290
mt645	2016-2017	2016-09-14 19:45:00	Manchester City	Bor. Mönchengladbach	Etihad Stadium	Manchester	4	0	0	30270
mt646	2016-2017	2016-09-28 19:45:00	Bor. Mönchengladbach	FC Barcelona	Borussia-Park	Mönchengladbach	1	2	0	46283
mt647	2016-2017	2016-09-28 19:45:00	Celtic FC	Manchester City	Celtic Park	Glasgow	3	3	0	57592
mt648	2016-2017	2016-10-19 19:45:00	Celtic FC	Bor. Mönchengladbach	Celtic Park	Glasgow	0	2	0	57814
mt649	2016-2017	2016-10-19 19:45:00	FC Barcelona	Manchester City	Spotify Camp Nou	Barcelona	4	0	0	96290
mt650	2016-2017	2016-11-01 19:45:00	Bor. Mönchengladbach	Celtic FC	Borussia-Park	Mönchengladbach	1	1	0	46283
mt651	2016-2017	2016-11-01 19:45:00	Manchester City	FC Barcelona	Etihad Stadium	Manchester	3	1	0	53340
mt652	2016-2017	2016-11-23 19:45:00	Bor. Mönchengladbach	Manchester City	Borussia-Park	Mönchengladbach	1	1	0	45921
mt653	2016-2017	2016-11-23 19:45:00	Celtic FC	FC Barcelona	Celtic Park	Glasgow	0	2	0	57937
mt654	2016-2017	2016-12-06 19:45:00	FC Barcelona	Bor. Mönchengladbach	Spotify Camp Nou	Barcelona	4	0	0	67157
mt655	2016-2017	2016-12-06 19:45:00	Manchester City	Celtic FC	Etihad Stadium	Manchester	1	1	0	51297
mt656	2016-2017	2016-09-13 19:45:00	Bayern München	FK Rostov	Allianz Arena	München	5	0	0	70000
mt657	2016-2017	2016-09-13 19:45:00	PSV Eindhoven	Atlético Madrid	Philips Stadion	Eindhoven	0	1	0	33989
mt658	2016-2017	2016-09-28 19:45:00	Atlético Madrid	Bayern München	Vicente Calderón	Madrid	1	0	0	48242
mt659	2016-2017	2016-09-28 19:45:00	FK Rostov	PSV Eindhoven	Olimp – 2	Rostov-na-Donu	2	2	0	12646
mt660	2016-2017	2016-10-19 19:45:00	Bayern München	PSV Eindhoven	Allianz Arena	München	4	1	0	70000
mt661	2016-2017	2016-10-19 19:45:00	FK Rostov	Atlético Madrid	Olimp – 2	Rostov-na-Donu	0	1	0	15400
mt662	2016-2017	2016-11-01 19:45:00	Atlético Madrid	FK Rostov	Vicente Calderón	Madrid	2	1	0	40392
mt663	2016-2017	2016-11-01 19:45:00	PSV Eindhoven	Bayern München	Philips Stadion	Eindhoven	1	2	0	35000
mt664	2016-2017	2016-11-23 17:00:00	FK Rostov	Bayern München	Olimp – 2	Rostov-na-Donu	3	2	0	15211
mt665	2016-2017	2016-11-23 19:45:00	Atlético Madrid	PSV Eindhoven	Vicente Calderón	Madrid	2	0	0	37891
mt666	2016-2017	2016-12-06 19:45:00	Bayern München	Atlético Madrid	Allianz Arena	München	1	0	0	70000
mt667	2016-2017	2016-12-06 19:45:00	PSV Eindhoven	FK Rostov	Philips Stadion	Eindhoven	0	0	0	33400
mt668	2016-2017	2016-09-14 19:45:00	Bayer Leverkusen	CSKA Moskva	BayArena	Leverkusen	2	2	0	23459
mt669	2016-2017	2016-09-14 19:45:00	Tottenham Hotspur	AS Monaco	Wembley Stadium	London	1	2	0	85011
mt670	2016-2017	2016-09-27 19:45:00	AS Monaco	Bayer Leverkusen	Stade Louis II	Monaco	1	1	0	8100
mt671	2016-2017	2016-09-27 19:45:00	CSKA Moskva	Tottenham Hotspur	Arena Khimki	Khimki	0	1	0	26153
mt672	2016-2017	2016-10-18 19:45:00	Bayer Leverkusen	Tottenham Hotspur	BayArena	Leverkusen	0	0	0	28887
mt673	2016-2017	2016-10-18 19:45:00	CSKA Moskva	AS Monaco	VEB Arena	Moskva	1	1	0	24125
mt674	2016-2017	2016-11-02 19:45:00	AS Monaco	CSKA Moskva	Stade Louis II	Monaco	3	0	0	10029
mt675	2016-2017	2016-11-02 19:45:00	Tottenham Hotspur	Bayer Leverkusen	Wembley Stadium	London	0	1	0	85512
mt676	2016-2017	2016-11-22 17:00:00	CSKA Moskva	Bayer Leverkusen	VEB Arena	Moskva	1	1	0	19164
mt677	2016-2017	2016-11-22 19:45:00	AS Monaco	Tottenham Hotspur	Stade Louis II	Monaco	2	1	0	13100
mt678	2016-2017	2016-12-07 19:45:00	Bayer Leverkusen	AS Monaco	BayArena	Leverkusen	3	0	0	21928
mt679	2016-2017	2016-12-07 19:45:00	Tottenham Hotspur	CSKA Moskva	Wembley Stadium	London	3	1	0	62034
mt680	2016-2017	2016-09-14 19:45:00	Legia Warszawa	Borussia Dortmund	Stadion Wojska Polskiego	Warszawa	0	6	0	27304
mt681	2016-2017	2016-09-14 19:45:00	Real Madrid	Sporting CP	Santiago Bernabéu	Madrid	2	1	0	72179
mt682	2016-2017	2016-09-27 19:45:00	Borussia Dortmund	Real Madrid	Signal Iduna Park	Dortmund	2	2	0	65849
mt683	2016-2017	2016-09-27 19:45:00	Sporting CP	Legia Warszawa	Estádio José Alvalade	Lisboa	2	0	0	40094
mt684	2016-2017	2016-10-18 19:45:00	Real Madrid	Legia Warszawa	Santiago Bernabéu	Madrid	5	1	0	70251
mt685	2016-2017	2016-10-18 19:45:00	Sporting CP	Borussia Dortmund	Estádio José Alvalade	Lisboa	1	2	0	46609
mt686	2016-2017	2016-11-02 19:45:00	Borussia Dortmund	Sporting CP	Signal Iduna Park	Dortmund	1	0	0	65849
mt687	2016-2017	2016-11-02 19:45:00	Legia Warszawa	Real Madrid	Stadion Wojska Polskiego	Warszawa	3	3	0	0
mt688	2016-2017	2016-11-22 19:45:00	Borussia Dortmund	Legia Warszawa	Signal Iduna Park	Dortmund	8	4	0	55094
mt689	2016-2017	2016-11-22 19:45:00	Sporting CP	Real Madrid	Estádio José Alvalade	Lisboa	1	2	0	50046
mt690	2016-2017	2016-12-07 19:45:00	Legia Warszawa	Sporting CP	Stadion Wojska Polskiego	Warszawa	1	0	0	28232
mt691	2016-2017	2016-12-07 19:45:00	Real Madrid	Borussia Dortmund	Santiago Bernabéu	Madrid	2	2	0	76894
mt692	2016-2017	2016-09-14 19:45:00	Club Brugge KV	Leicester City	Jan Breydel Stadion	Brugge	0	3	0	20970
mt693	2016-2017	2016-09-14 19:45:00	FC Porto	FC København	Estádio do Dragão	Porto	1	1	0	34325
mt694	2016-2017	2016-09-27 19:45:00	FC København	Club Brugge KV	Telia Parken	København	4	0	0	25605
mt695	2016-2017	2016-09-27 19:45:00	Leicester City	FC Porto	King Power Stadium	Leicester	1	0	0	31805
mt696	2016-2017	2016-10-18 19:45:00	Club Brugge KV	FC Porto	Jan Breydel Stadion	Brugge	1	2	0	23325
mt697	2016-2017	2016-10-18 19:45:00	Leicester City	FC København	King Power Stadium	Leicester	1	0	0	31037
mt698	2016-2017	2016-11-02 19:45:00	FC København	Leicester City	Telia Parken	København	0	0	0	34146
mt699	2016-2017	2016-11-02 19:45:00	FC Porto	Club Brugge KV	Estádio do Dragão	Porto	1	0	0	32310
mt700	2016-2017	2016-11-22 19:45:00	FC København	FC Porto	Telia Parken	København	0	0	0	32036
mt701	2016-2017	2016-11-22 19:45:00	Leicester City	Club Brugge KV	King Power Stadium	Leicester	2	1	0	31443
mt702	2016-2017	2016-12-07 19:45:00	Club Brugge KV	FC København	Jan Breydel Stadion	Brugge	0	2	0	18981
mt703	2016-2017	2016-12-07 19:45:00	FC Porto	Leicester City	Estádio do Dragão	Porto	5	0	0	39310
mt704	2016-2017	2016-09-14 19:45:00	Juventus	Sevilla FC	Allianz Stadium	Torino	0	0	0	33261
mt705	2016-2017	2016-09-14 19:45:00	Olympique Lyon	Dinamo Zagreb	Groupama Stadium	Décines-Charpieu	3	0	0	43754
mt706	2016-2017	2016-09-27 19:45:00	Dinamo Zagreb	Juventus	Maksimir	Zagreb	0	4	0	23875
mt707	2016-2017	2016-09-27 19:45:00	Sevilla FC	Olympique Lyon	Ramón Sánchez Pizjuán	Sevilla	1	0	0	36741
mt708	2016-2017	2016-10-18 19:45:00	Dinamo Zagreb	Sevilla FC	Maksimir	Zagreb	0	1	0	6021
mt709	2016-2017	2016-10-18 19:45:00	Olympique Lyon	Juventus	Groupama Stadium	Décines-Charpieu	0	1	0	53907
mt710	2016-2017	2016-11-02 19:45:00	Juventus	Olympique Lyon	Allianz Stadium	Torino	1	1	0	40356
mt711	2016-2017	2016-11-02 19:45:00	Sevilla FC	Dinamo Zagreb	Ramón Sánchez Pizjuán	Sevilla	4	0	0	35215
mt712	2016-2017	2016-11-22 19:45:00	Dinamo Zagreb	Olympique Lyon	Maksimir	Zagreb	0	1	0	7834
mt713	2016-2017	2016-11-22 19:45:00	Sevilla FC	Juventus	Ramón Sánchez Pizjuán	Sevilla	1	3	0	38942
mt714	2016-2017	2016-12-07 19:45:00	Juventus	Dinamo Zagreb	Allianz Stadium	Torino	2	0	0	39380
mt715	2016-2017	2016-12-07 19:45:00	Olympique Lyon	Sevilla FC	Groupama Stadium	Décines-Charpieu	0	0	0	52423
mt716	2016-2017	2017-02-14 19:45:00	SL Benfica	Borussia Dortmund	Estádio da Luz	Lisboa	1	0	0	55124
mt717	2016-2017	2017-02-14 19:45:00	Paris Saint-Germain	FC Barcelona	Parc des Princes	Paris	4	0	0	46484
mt718	2016-2017	2017-02-15 19:45:00	Real Madrid	SSC Napoli	Santiago Bernabéu	Madrid	3	1	0	78000
mt719	2016-2017	2017-02-15 19:45:00	Bayern München	Arsenal FC	Allianz Arena	München	5	1	0	70000
mt720	2016-2017	2017-02-21 19:45:00	Manchester City	AS Monaco	Etihad Stadium	Manchester	5	3	0	53351
mt721	2016-2017	2017-02-21 19:45:00	Bayer Leverkusen	Atlético Madrid	BayArena	Leverkusen	2	4	0	29300
mt722	2016-2017	2017-02-22 19:45:00	FC Porto	Juventus	Estádio do Dragão	Porto	0	2	0	49229
mt723	2016-2017	2017-02-22 19:45:00	Sevilla FC	Leicester City	Ramón Sánchez Pizjuán	Sevilla	2	1	0	38834
mt724	2016-2017	2017-03-07 19:45:00	SSC Napoli	Real Madrid	Diego Maradona	Napoli	1	3	0	56695
mt725	2016-2017	2017-03-07 19:45:00	Arsenal FC	Bayern München	Emirates Stadium	London	1	5	0	59911
mt726	2016-2017	2017-03-08 19:45:00	Borussia Dortmund	SL Benfica	Signal Iduna Park	Dortmund	4	0	0	65849
mt727	2016-2017	2017-03-08 19:45:00	FC Barcelona	Paris Saint-Germain	Spotify Camp Nou	Barcelona	6	1	0	96290
mt728	2016-2017	2017-03-14 19:45:00	Juventus	FC Porto	Allianz Stadium	Torino	1	0	0	41161
mt729	2016-2017	2017-03-14 19:45:00	Leicester City	Sevilla FC	King Power Stadium	Leicester	2	0	0	31520
mt730	2016-2017	2017-03-15 19:45:00	AS Monaco	Manchester City	Stade Louis II	Monaco	3	1	0	15700
mt731	2016-2017	2017-03-15 19:45:00	Atlético Madrid	Bayer Leverkusen	Vicente Calderón	Madrid	0	0	0	49133
mt732	2016-2017	2017-04-11 19:45:00	Juventus	FC Barcelona	Allianz Stadium	Torino	3	0	0	41092
mt733	2016-2017	2017-04-12 17:45:00	Borussia Dortmund	AS Monaco	Signal Iduna Park	Dortmund	2	3	0	65849
mt734	2016-2017	2017-04-12 19:45:00	Atlético Madrid	Leicester City	Vicente Calderón	Madrid	1	0	0	51423
mt735	2016-2017	2017-04-12 19:45:00	Bayern München	Real Madrid	Allianz Arena	München	1	2	0	70000
mt736	2016-2017	2017-04-18 19:45:00	Leicester City	Atlético Madrid	King Power Stadium	Leicester	1	1	0	31548
mt737	2016-2017	2017-04-18 19:45:00	Real Madrid	Bayern München	Santiago Bernabéu	Madrid	4	2	0	78346
mt738	2016-2017	2017-04-19 19:45:00	FC Barcelona	Juventus	Spotify Camp Nou	Barcelona	0	0	0	96290
mt739	2016-2017	2017-04-19 19:50:00	AS Monaco	Borussia Dortmund	Stade Louis II	Monaco	3	1	0	17135
mt740	2016-2017	2017-05-02 19:45:00	Real Madrid	Atlético Madrid	Santiago Bernabéu	Madrid	3	0	0	77609
mt741	2016-2017	2017-05-03 19:45:00	AS Monaco	Juventus	Stade Louis II	Monaco	0	2	0	16762
mt742	2016-2017	2017-05-09 19:45:00	Juventus	AS Monaco	Allianz Stadium	Torino	2	1	0	40244
mt743	2016-2017	2017-05-10 19:45:00	Atlético Madrid	Real Madrid	Vicente Calderón	Madrid	2	1	0	53422
mt744	2016-2017	2017-06-03 19:45:00	Juventus	Real Madrid	Millennium	Cardiff	1	4	0	65842
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.players ("PLAYER_ID", "FIRST_NAME", "LAST_NAME", "NATIONALITY", "DOB", "TEAM", "JERSEY_NUMBER", "POSITION", "HEIGHT", "WEIGHT", "FOOT") FROM stdin;
ply510	\N	Danilo	Brazil	1991-07-15 00:00:00	Juventus	6	Defender	184	78	R
ply511	Mattia De	Sciglio	Italy	1992-10-20 00:00:00	Juventus	2	Defender	182	78	R
ply512	Federico	Gatti	Italy	1998-06-24 00:00:00	Juventus	15	Defender	190	84	R
ply513	Daniele	Rugani	Italy	1994-07-29 00:00:00	Juventus	24	Defender	190	84	R
ply514	Enzo	Barrenechea	Argentina	2001-05-22 00:00:00	Juventus	45	Midfielder	186	81	L
ply515	Nicolò	Fagioli	Italy	2001-02-12 00:00:00	Juventus	44	Midfielder	178	70	R
ply516	Samuel	Iling	England	2003-10-04 00:00:00	Juventus	43	Midfielder	\N	\N	\N
ply517	Filip	Kostić	Serbia	1992-11-01 00:00:00	Juventus	17	Midfielder	184	82	L
ply518	Manuel	Locatelli	Italy	1998-01-08 00:00:00	Juventus	5	Midfielder	186	75	R
ply519	Weston	McKennie	USA	1998-08-28 00:00:00	Juventus	8	Midfielder	183	84	R
ply520	Fabio	Miretti	Italy	2003-08-03 00:00:00	Juventus	20	Midfielder	179	65	R
ply521	Leandro	Paredes	Argentina	1994-06-29 00:00:00	Juventus	32	Midfielder	180	75	R
ply522	Paul	Pogba	France	1993-03-15 00:00:00	Juventus	10	Midfielder	191	84	\N
ply523	Adrien	Rabiot	France	1995-04-03 00:00:00	Juventus	25	Midfielder	191	80	L
ply524	Marley	Aké	France	2001-01-05 00:00:00	Juventus	33	Forward	177	68	R
ply525	Federico	Chiesa	Italy	1997-10-25 00:00:00	Juventus	7	Forward	175	70	R
ply526	Cosimo Da	Graca	Italy	2002-05-01 00:00:00	Juventus	40	Forward	185	74	R
ply527	Ángel Di	María	Argentina	1988-02-14 00:00:00	Juventus	22	Forward	180	75	L
ply528	Kaio	Jorge	Brazil	2002-01-24 00:00:00	Juventus	21	Forward	182	71	R
ply529	Moise	Kean	Italy	2000-02-28 00:00:00	Juventus	18	Forward	182	72	R
ply530	Arkadiusz	Milik	Poland	1994-02-28 00:00:00	Juventus	14	Forward	186	78	L
ply531	Matías	Soulé	Argentina	2003-04-15 00:00:00	Juventus	30	Forward	176	71	L
ply532	Dušan	Vlahović	Serbia	2000-01-28 00:00:00	Juventus	9	Forward	190	75	L
ply533	Lucas	Chevalier	France	2001-11-06 00:00:00	Lille OSC	30	Goalkeeper	192	78	R
ply534	Adam	Jakubech	Slovakia	1997-01-02 00:00:00	Lille OSC	16	Goalkeeper	188	85	R
ply535	Léo	Jardim	Brazil	1995-03-20 00:00:00	Lille OSC	1	Goalkeeper	188	82	R
ply536	Alexsandro	Ribeiro	Brazil	1999-08-09 00:00:00	Lille OSC	4	Defender	192	90	R
ply537	Bafodé	Diakité	France	2001-01-06 00:00:00	Lille OSC	18	Defender	185	82	R
ply538	Gabriel	Gudmundsson	Sweden	1999-04-29 00:00:00	Lille OSC	5	Defender	181	74	L
ply539	\N	Ismaily	Brazil	1990-01-11 00:00:00	Lille OSC	31	Defender	177	82	L
ply540	José	Fonte	Portugal	1983-12-22 00:00:00	Lille OSC	6	Defender	191	81	R
ply541	Tiago	Djaló	Portugal	2000-04-09 00:00:00	Lille OSC	3	Defender	190	82	R
ply542	Leny	Yoro	France	2005-11-13 00:00:00	Lille OSC	15	Defender	\N	\N	R
ply543	Akim	Zedadka	France	1995-05-30 00:00:00	Lille OSC	13	Defender	173	70	R
ply544	Benjamin	André	France	1990-08-03 00:00:00	Lille OSC	21	Midfielder	180	68	R
ply545	André	Gomes	Portugal	1993-07-30 00:00:00	Lille OSC	28	Midfielder	188	84	R
ply546	Carlos	Baleba	Cameroon	2004-01-03 00:00:00	Lille OSC	35	Midfielder	\N	\N	L
ply547	Rémy	Cabella	France	1990-03-08 00:00:00	Lille OSC	17	Midfielder	171	68	R
ply548	Angel	Gomes	England	2000-08-31 00:00:00	Lille OSC	20	Midfielder	168	56	R
ply549	Jonas	Martin	France	1990-04-09 00:00:00	Lille OSC	8	Midfielder	184	77	R
ply550	Ugo	Raghouber	France	2003-07-13 00:00:00	Lille OSC	12	Midfielder	179	62	L
ply551	Jonathan	Bamba	France	1996-03-26 00:00:00	Lille OSC	7	Forward	175	67	R
ply552	Mohamed	Bayo	Guinea	1998-06-04 00:00:00	Lille OSC	27	Forward	188	76	R
ply553	Jonathan	David	Canada	2000-01-14 00:00:00	Lille OSC	9	Forward	180	70	\N
ply554	José	Bica	Portugal	2003-06-16 00:00:00	Lille OSC	39	Forward	176	66	R
ply555	Isaac	Lihadji	France	2002-04-10 00:00:00	Lille OSC	19	Forward	177	70	L
ply556	Adam	Ounas	Algeria	1996-11-11 00:00:00	Lille OSC	11	Forward	172	65	L
ply557	Alan	Virginius	France	2003-01-03 00:00:00	Lille OSC	26	Forward	175	65	R
ply558	Timothy	Weah	USA	2000-02-22 00:00:00	Lille OSC	22	Forward	183	66	R
ply559	Edon	Zhegrova	Kosovo	1999-03-31 00:00:00	Lille OSC	23	Forward	181	72	L
ply560	\N	Adrián	Spain	1987-01-03 00:00:00	Liverpool FC	13	Goalkeeper	190	89	R
ply561	\N	Alisson	Brazil	1992-10-02 00:00:00	Liverpool FC	1	Goalkeeper	191	88	R
ply562	Harvey	Davies	England	2003-09-03 00:00:00	\N	\N	Goalkeeper	190	\N	L
ply563	Caoimhin	Kelleher	Ireland	1998-11-23 00:00:00	Liverpool FC	62	Goalkeeper	188	74	R
ply564	Trent	Alexander-Arnold	England	1998-10-07 00:00:00	Liverpool FC	66	Defender	180	69	R
ply565	Stefan	Bajčetić	Spain	2004-10-22 00:00:00	Liverpool FC	43	Defender	185	\N	\N
ply566	Luke	Chambers	England	2004-06-24 00:00:00	Liverpool FC	88	Defender	181	\N	L
ply567	Joe	Gomez	England	1997-05-23 00:00:00	Liverpool FC	2	Defender	188	77	R
ply568	Ibrahima	Konaté	France	1999-05-25 00:00:00	Liverpool FC	5	Defender	194	95	R
ply569	Joel	Matip	Cameroon	1991-08-08 00:00:00	Liverpool FC	32	Defender	195	89	R
ply570	Nathaniel	Phillips	England	1997-03-21 00:00:00	Liverpool FC	47	Defender	190	84	R
ply571	Calvin	Ramsay	Scotland	2003-07-31 00:00:00	Liverpool FC	22	Defender	177	68	R
ply572	Andrew	Robertson	Scotland	1994-03-11 00:00:00	Liverpool FC	26	Defender	178	64	L
ply573	Kostas	Tsimikas	Greece	1996-05-12 00:00:00	Liverpool FC	21	Defender	179	70	L
ply574	Virgil van	Dijk	Netherlands	1991-07-08 00:00:00	Liverpool FC	4	Defender	193	92	R
ply575	\N	Arthur	Brazil	1996-08-12 00:00:00	Liverpool FC	29	Midfielder	171	73	R
ply576	Harvey	Elliott	England	2003-04-04 00:00:00	Liverpool FC	19	Midfielder	170	67	L
ply577	\N	Fabinho	Brazil	1993-10-23 00:00:00	Liverpool FC	3	Midfielder	188	78	R
ply578	Jordan	Henderson	England	1990-06-17 00:00:00	Liverpool FC	14	Midfielder	187	80	R
ply579	Curtis	Jones	England	2001-01-30 00:00:00	Liverpool FC	17	Midfielder	185	75	R
ply580	Naby	Keïta	Guinea	1995-02-10 00:00:00	Liverpool FC	8	Midfielder	172	64	R
ply581	James	Milner	England	1986-01-04 00:00:00	Liverpool FC	7	Midfielder	175	70	R
ply582	Alex	Oxlade-Chamberlain	England	1993-08-15 00:00:00	Liverpool FC	15	Midfielder	175	70	R
ply583	\N	Thiago	Spain	1991-04-11 00:00:00	Liverpool FC	6	Midfielder	174	70	R
ply584	Bobby	Clark	England	2005-02-07 00:00:00	Liverpool FC	50	Forward	178	\N	R
ply585	Luis	Díaz	Colombia	1997-01-13 00:00:00	Liverpool FC	23	Forward	180	73	R
ply586	Diogo	Jota	Portugal	1996-12-04 00:00:00	Liverpool FC	20	Forward	178	70	R
ply587	Fabio	Carvalho	Portugal	2002-08-30 00:00:00	Liverpool FC	28	Forward	170	63	R
ply588	Darwin	Núñez	Uruguay	1999-06-24 00:00:00	Liverpool FC	27	Forward	187	80	R
ply589	Roberto	Firmino	Brazil	1991-10-02 00:00:00	Liverpool FC	9	Forward	181	76	R
ply590	Mo	Salah	Egypt	1992-06-15 00:00:00	Liverpool FC	11	Forward	175	73	L
ply591	John	Achterberg	Netherlands	1971-07-08 00:00:00	Liverpool FC	\N	Goalkeeping	189	90	\N
ply592	Cláudio	Taffarel	Brazil	1966-05-08 00:00:00	Liverpool FC	\N	Goalkeeping	182	80	\N
ply593	Jack	Robinson	England	\N	Liverpool FC	\N	Goalkeeping	\N	\N	\N
ply594	Jordan	Fairclough	England	\N	Liverpool FC	\N	Fitness	\N	\N	\N
ply595	John	Hill	England	\N	Liverpool FC	\N	Fitness	\N	\N	\N
ply596	Andreas	Kornmayer	Germany	1974-09-21 00:00:00	Liverpool FC	\N	Fitness	\N	\N	\N
ply597	Conall	Murtagh	Northern Ireland	1985-06-29 00:00:00	Liverpool FC	\N	Fitness	183	75	R
ply598	David	Rydings	England	\N	Liverpool FC	\N	Rehab	\N	\N	\N
ply599	Andreas	Schlumberger	Germany	1966-07-23 00:00:00	Liverpool FC	\N	Rehab	\N	\N	\N
ply600	Mark	Hulse	England	1971-09-06 00:00:00	Liverpool FC	\N	Physical	\N	\N	\N
ply601	Thomas	Grønnemark	England	1975-12-12 00:00:00	Liverpool FC	\N	Individual	\N	\N	\N
ply602	Angel	Vales	Spain	1967-02-01 00:00:00	Liverpool FC	\N	Technique	\N	\N	\N
ply603	Vitor	Matos	England	\N	Liverpool FC	\N	Special	\N	\N	\N
ply604	James	French	England	\N	Liverpool FC	\N	Game	\N	\N	\N
ply605	Greg	Mathieson	England	\N	Liverpool FC	\N	Game	\N	\N	\N
ply606	Daniel	Spearritt	England	\N	Liverpool FC	\N	Game	\N	\N	\N
ply607	Viktor	Andersson	Sweden	2004-03-30 00:00:00	Malmö FF	39	Goalkeeper	186	76	\N
ply608	Johan	Dahlin	Sweden	1986-09-08 00:00:00	Malmö FF	27	Goalkeeper	192	94	R
ply609	Ismael	Diawara	Mali	1994-11-11 00:00:00	\N	\N	Goalkeeper	194	97	R
ply610	Melker	Ellborg	Sweden	2003-05-22 00:00:00	\N	1	Goalkeeper	191	84	\N
ply611	André Alvarez	Perez	Sweden	2005-03-23 00:00:00	Malmö FF	42	Defender	\N	\N	\N
ply612	Felix	Beijmo	Sweden	1998-01-31 00:00:00	Malmö FF	14	Defender	186	82	R
ply613	Matěj	Chaluš	Czech Republic	1998-02-02 00:00:00	Malmö FF	23	Defender	190	89	R
ply614	Dennis	Hadžikadunić	Bosnia-Herzegovina	1998-07-09 00:00:00	Malmö FF	21	Defender	186	81	R
ply615	Jonas	Knudsen	Denmark	1992-09-16 00:00:00	Malmö FF	3	Defender	187	72	L
ply616	Niklas	Moisander	Finland	1985-09-29 00:00:00	Malmö FF	4	Defender	183	77	L
ply617	Lasse	Nielsen	Denmark	1988-01-08 00:00:00	Malmö FF	24	Defender	185	82	R
ply618	Martin	Olsson	Sweden	1988-05-17 00:00:00	Malmö FF	13	Defender	180	78	L
ply619	Raymond	Adjei	Sweden	2004-02-10 00:00:00	Malmö FF	44	Midfielder	\N	\N	\N
ply620	Jo Inge	Berget	Norway	1990-09-11 00:00:00	Malmö FF	32	Midfielder	186	81	R
ply621	Anders	Christiansen	Denmark	1990-06-08 00:00:00	Malmö FF	10	Midfielder	175	68	R
ply622	Romain	Gall	USA	1995-01-31 00:00:00	\N	\N	Midfielder	176	72	\N
ply623	Hugo	Larsson	Sweden	2004-06-27 00:00:00	Malmö FF	31	Midfielder	187	63	\N
ply624	Oscar	Lewicki	Sweden	1992-07-14 00:00:00	Malmö FF	6	Midfielder	170	67	\N
ply625	Emmanuel	Lomotey	Ghana	1997-12-19 00:00:00	Malmö FF	40	Midfielder	190	79	R
ply626	Sergio	Peña	Peru	1995-09-28 00:00:00	Malmö FF	8	Midfielder	178	70	R
ply627	Erdal	Rakip	North Macedonia	1996-02-13 00:00:00	Malmö FF	7	Midfielder	178	71	R
ply628	Søren	Rieks	Denmark	1987-04-07 00:00:00	Malmö FF	5	Midfielder	185	76	\N
ply629	Patriot	Sejdiu	Kosovo	2000-05-05 00:00:00	Malmö FF	36	Midfielder	182	\N	L
ply630	Mahamé	Siby	France	1996-07-07 00:00:00	Malmö FF	25	Midfielder	191	84	R
ply631	Moustafa	Zeidan	Sweden	1998-06-07 00:00:00	Malmö FF	20	Midfielder	174	72	L
ply632	Mohamed	Buya	Sierra Leone	1995-01-10 00:00:00	Malmö FF	33	Forward	180	72	\N
ply633	Joseph	Ceesay	Sweden	1998-06-03 00:00:00	Malmö FF	15	Forward	178	69	R
ply634	Mamadou	Diagne	Sweden	2003-09-14 00:00:00	Malmö FF	41	Forward	\N	\N	\N
ply635	Isaac Kiese	Thelin	Sweden	1992-06-24 00:00:00	Malmö FF	9	Forward	189	83	R
ply636	Adi	Nalić	Bosnia-Herzegovina	1997-12-01 00:00:00	Malmö FF	22	Forward	190	83	\N
ply637	Ola	Toivonen	Sweden	1986-07-03 00:00:00	\N	\N	Forward	192	78	R
ply638	Jonnie	Fedel	Sweden	1966-11-22 00:00:00	Malmö FF	\N	Goalkeeping	184	89	\N
ply639	Scott	Carson	England	1985-09-03 00:00:00	Manchester City	33	Goalkeeper	188	86	R
ply640	\N	Ederson	Brazil	1993-08-17 00:00:00	Manchester City	31	Goalkeeper	188	86	L
ply641	Stefan	Ortega	Germany	1992-11-06 00:00:00	Manchester City	18	Goalkeeper	185	88	R
ply642	Manuel	Akanji	Switzerland	1995-07-19 00:00:00	Manchester City	25	Defender	187	91	R
ply643	Nathan	Aké	Netherlands	1995-02-18 00:00:00	Manchester City	6	Defender	180	75	L
ply644	João	Cancelo	Portugal	1994-05-27 00:00:00	Manchester City	7	Defender	182	74	R
ply645	Aymeric	Laporte	Spain	1994-05-27 00:00:00	Manchester City	14	Defender	190	87	L
ply646	Rico	Lewis	England	2004-11-21 00:00:00	\N	\N	Defender	\N	\N	R
ply647	Benjamin	Mendy	France	1994-07-17 00:00:00	Manchester City	22	Defender	185	85	L
ply648	Rúben	Dias	Portugal	1997-05-14 00:00:00	Manchester City	3	Defender	187	82	R
ply649	John	Stones	England	1994-05-28 00:00:00	Manchester City	5	Defender	188	70	R
ply650	Kyle	Walker	England	1990-05-28 00:00:00	Manchester City	2	Defender	183	83	R
ply651	Josh	Wilson-Esbrand	England	2002-12-26 00:00:00	Manchester City	97	Defender	176	63	L
ply652	Bernardo	Silva	Portugal	1994-08-10 00:00:00	Manchester City	20	Midfielder	173	64	L
ply653	Kevin De	Bruyne	Belgium	1991-06-28 00:00:00	Manchester City	17	Midfielder	181	70	R
ply654	Phil	Foden	England	2000-05-28 00:00:00	Manchester City	47	Midfielder	171	70	L
ply655	Jack	Grealish	England	1995-09-10 00:00:00	Manchester City	10	Midfielder	175	68	R
ply656	İlkay	Gündoğan	Germany	1990-10-24 00:00:00	Manchester City	8	Midfielder	180	79	R
ply310	Kyriani	Sabbe	Belgium	2005-01-26 00:00:00	\N	\N	Defender	\N	\N	\N
ply657	Cole	Palmer	England	2002-05-06 00:00:00	Manchester City	80	Midfielder	189	72	L
ply658	Kalvin	Phillips	England	1995-12-02 00:00:00	Manchester City	4	Midfielder	178	72	R
ply659	\N	Rodri	Spain	1996-06-22 00:00:00	Manchester City	16	Midfielder	191	82	R
ply660	Sergio	Gómez	Spain	2000-09-04 00:00:00	Manchester City	21	Midfielder	171	68	L
ply661	Julián	Álvarez	Argentina	2000-01-31 00:00:00	Manchester City	19	Forward	170	71	R
ply662	Erling	Haaland	Norway	2000-07-21 00:00:00	Manchester City	9	Forward	194	88	L
ply663	Ben	Knight	England	2002-06-14 00:00:00	\N	\N	Forward	170	59	L
ply664	Riyad	Mahrez	Algeria	1991-02-21 00:00:00	Manchester City	26	Forward	179	67	L
ply665	Richard	Wright	England	1977-11-05 00:00:00	Manchester City	\N	Goalkeeping	189	87	\N
ply666	\N	Xabier	Spain	1970-05-24 00:00:00	Manchester City	\N	Goalkeeping	182	82	\N
ply667	Lorenzo	Buenaventura	Spain	1963-01-01 00:00:00	Manchester City	\N	Fitness	\N	\N	\N
ply668	Ryan	DeFreitas	England	1986-10-28 00:00:00	Manchester City	\N	Game	\N	\N	\N
ply669	Carles	Planchart	Spain	1965-12-17 00:00:00	Manchester City	\N	Video	\N	\N	\N
ply670	Piet	Cremers	Netherlands	1994-10-27 00:00:00	Manchester City	\N	Chief	\N	\N	\N
ply671	Martin	Drury	England	1986-04-10 00:00:00	Manchester United	\N	08/2022	\N	\N	\N
ply672	De	Gea	Spain	1990-11-07 00:00:00	Manchester United	1	Goalkeeper	192	82	R
ply673	Martin	Dúbravka	Slovakia	1989-01-15 00:00:00	Manchester United	31	Goalkeeper	191	83	R
ply674	Tom	Heaton	England	1986-04-15 00:00:00	Manchester United	22	Goalkeeper	188	85	R
ply675	Radek	Vítek	Czech Republic	2003-10-24 00:00:00	Manchester United	50	Goalkeeper	198	76	R
ply676	Diogo	Dalot	Portugal	1999-03-18 00:00:00	Manchester United	20	Defender	184	77	R
ply677	Tyler	Fredricson	England	2005-02-23 00:00:00	Manchester United	80	Defender	\N	\N	R
ply678	Phil	Jones	England	1992-02-21 00:00:00	Manchester United	4	Defender	185	71	R
ply679	Victor	Lindelöf	Sweden	1994-07-17 00:00:00	Manchester United	2	Defender	187	82	R
ply680	Harry	Maguire	England	1993-03-05 00:00:00	Manchester United	5	Defender	194	99	R
ply681	Tyrell	Malacia	Netherlands	1999-08-17 00:00:00	Manchester United	12	Defender	175	67	L
ply682	Lisandro	Martínez	Argentina	1998-01-18 00:00:00	Manchester United	6	Defender	175	77	L
ply683	Teden	Mengi	England	2002-04-30 00:00:00	Manchester United	43	Defender	183	78	R
ply684	Luke	Shaw	England	1995-07-12 00:00:00	Manchester United	23	Defender	178	75	L
ply685	Axel	Tuanzebe	England	1997-11-14 00:00:00	Manchester United	38	Defender	186	81	R
ply686	Raphaël	Varane	France	1993-04-25 00:00:00	Manchester United	19	Defender	191	81	R
ply687	Aaron	Wan-Bissaka	England	1997-11-26 00:00:00	Manchester United	29	Defender	183	72	R
ply688	Brandon	Williams	England	2000-09-03 00:00:00	Manchester United	33	Defender	172	63	R
ply689	Bruno	Fernandes	Portugal	1994-09-08 00:00:00	Manchester United	8	Midfielder	179	69	R
ply690	\N	Casemiro	Brazil	1992-02-23 00:00:00	Manchester United	18	Midfielder	185	84	R
ply691	Christian	Eriksen	Denmark	1992-02-14 00:00:00	Manchester United	14	Midfielder	182	76	\N
ply692	\N	Fred	Brazil	1993-03-05 00:00:00	Manchester United	17	Midfielder	169	62	L
ply693	Zidane	Iqbal	Iraq	2003-04-27 00:00:00	\N	\N	Midfielder	181	65	R
ply694	Scott	McTominay	Scotland	1996-12-08 00:00:00	Manchester United	39	Midfielder	193	88	R
ply695	Facundo	Pellistri	Uruguay	2001-12-20 00:00:00	Manchester United	28	Midfielder	174	65	R
ply696	Donny van de	Beek	Netherlands	1997-04-18 00:00:00	Manchester United	34	Midfielder	184	76	R
ply697	Alejandro	Garnacho	Argentina	2004-07-01 00:00:00	Manchester United	49	Forward	180	80	R
ply698	\N	Antony	Brazil	2000-02-24 00:00:00	Manchester United	21	Forward	172	63	L
ply699	Cristiano	Ronaldo	Portugal	1985-02-05 00:00:00	Manchester United	7	Forward	187	83	\N
ply700	Anthony	Elanga	Sweden	2002-04-27 00:00:00	Manchester United	36	Forward	178	65	R
ply701	Mason	Greenwood	England	2001-10-01 00:00:00	Manchester United	11	Forward	181	70	\N
ply702	Anthony	Martial	France	1995-12-05 00:00:00	Manchester United	9	Forward	181	76	R
ply703	Charlie	McNeill	England	2003-09-09 00:00:00	\N	\N	Forward	182	70	R
ply704	Marcus	Rashford	England	1997-10-31 00:00:00	Manchester United	10	Forward	185	70	R
ply705	Jadon	Sancho	England	2000-03-25 00:00:00	Manchester United	25	Forward	180	76	R
ply706	Shola	Shoretire	Nigeria	2004-02-02 00:00:00	\N	\N	Forward	171	66	R
ply707	Richard	Hartis	England	1967-09-16 00:00:00	Manchester United	\N	Goalkeeping	\N	\N	\N
ply708	Craig	Mawson	England	1979-05-16 00:00:00	Manchester United	\N	Goalkeeping	188	84	\N
ply709	Richard	Hawkins	England	1971-01-27 00:00:00	Manchester United	\N	Athletic	\N	\N	\N
ply710	Michael	Clegg	England	1977-07-03 00:00:00	Manchester United	\N	Physical	173	73	\N
ply711	Eric	Ramsay	Wales	1992-02-14 00:00:00	Manchester United	\N	Individual	\N	\N	\N
ply712	Kevin	Keij	Netherlands	1985-09-29 00:00:00	Manchester United	\N	Game	\N	\N	\N
ply713	Luke	Lazenby	England	1990-12-15 00:00:00	Manchester United	\N	Game	\N	\N	\N
ply714	Anthony	Bates	England	1990-12-15 00:00:00	Manchester United	\N	Video	\N	\N	\N
ply715	Stewart	Heppinstall	England	1989-12-27 00:00:00	Manchester United	\N	Video	\N	\N	\N
ply716	Andrew	Meredith	Australia	1972-04-24 00:00:00	Manchester United	\N	Video	\N	\N	\N
ply717	Paul	Brand	Scotland	1988-02-07 00:00:00	Manchester United	\N	Chief	\N	\N	\N
ply718	Gianluigi	Donnarumma	Italy	1999-02-25 00:00:00	Paris Saint-Germain	99	Goalkeeper	196	90	R
ply719	Alexandre	Letellier	France	1990-12-11 00:00:00	Paris Saint-Germain	90	Goalkeeper	193	93	R
ply720	Keylor	Navas	Costa Rica	1986-12-15 00:00:00	Paris Saint-Germain	1	Goalkeeper	185	80	R
ply721	Sergio	Rico	Spain	1993-09-01 00:00:00	Paris Saint-Germain	16	Goalkeeper	195	90	R
ply722	El Chadaïlle	Bitshiabu	France	2005-05-16 00:00:00	Paris Saint-Germain	31	Defender	196	95	L
ply723	Achraf	Hakimi	Morocco	1998-11-04 00:00:00	Paris Saint-Germain	2	Defender	181	73	R
ply724	Juan	Bernat	Spain	1993-03-01 00:00:00	Paris Saint-Germain	14	Defender	170	67	L
ply725	Presnel	Kimpembe	France	1995-08-13 00:00:00	Paris Saint-Germain	3	Defender	189	80	L
ply726	\N	Marquinhos	Brazil	1994-05-14 00:00:00	Paris Saint-Germain	5	Defender	183	75	R
ply727	Nordi	Mukiele	France	1997-11-01 00:00:00	Paris Saint-Germain	26	Defender	187	84	R
ply728	Nuno	Mendes	Portugal	2002-06-19 00:00:00	Paris Saint-Germain	25	Defender	184	72	L
ply729	Sergio	Ramos	Spain	1986-03-30 00:00:00	Paris Saint-Germain	4	Defender	184	82	R
ply730	Carlos	Soler	Spain	1997-01-02 00:00:00	Paris Saint-Germain	28	Midfielder	180	76	R
ply731	\N	Danilo	Portugal	1991-09-09 00:00:00	Paris Saint-Germain	15	Midfielder	188	83	R
ply732	Fabián	Ruiz	Spain	1996-04-03 00:00:00	Paris Saint-Germain	8	Midfielder	189	70	L
ply733	Pablo	Sarabia	Spain	1992-05-11 00:00:00	Paris Saint-Germain	19	Midfielder	174	70	L
ply734	Renato	Sanches	Portugal	1997-08-18 00:00:00	Paris Saint-Germain	18	Midfielder	176	70	R
ply735	Marco	Verratti	Italy	1992-11-05 00:00:00	Paris Saint-Germain	6	Midfielder	165	60	R
ply736	\N	Vitinha	Portugal	2000-02-13 00:00:00	Paris Saint-Germain	17	Midfielder	172	64	R
ply737	Warren	Zaire-Emery	France	2006-03-08 00:00:00	Paris Saint-Germain	33	Midfielder	178	\N	R
ply738	Hugo	Ekitike	France	2002-06-20 00:00:00	Paris Saint-Germain	44	Forward	189	75	R
ply739	Kylian	Mbappé	France	1998-12-20 00:00:00	Paris Saint-Germain	7	Forward	178	73	R
ply740	Lionel	Messi	Argentina	1987-06-24 00:00:00	Paris Saint-Germain	30	Forward	170	72	L
ply741	\N	Neymar	Brazil	1992-02-05 00:00:00	Paris Saint-Germain	10	Forward	175	68	R
ply742	Gianluca	Spinelli	Italy	1966-10-28 00:00:00	Paris Saint-Germain	\N	Goalkeeping	\N	\N	\N
ply743	Janis	Blaswich	Germany	1991-05-02 00:00:00	RB Leipzig	21	Goalkeeper	193	88	R
ply744	Péter	Gulácsi	Hungary	1990-05-06 00:00:00	RB Leipzig	1	Goalkeeper	191	86	R
ply745	Jonas	Nickisch	Germany	2004-05-21 00:00:00	RB Leipzig	34	Goalkeeper	\N	\N	\N
ply746	Oskar	Preil	Germany	2003-09-14 00:00:00	RB Leipzig	\N	Goalkeeper	\N	\N	\N
ply747	Sanoussy	Ba	Germany	2004-01-05 00:00:00	RB Leipzig	25	Defender	184	\N	\N
ply748	Abdou	Diallo	Senegal	1996-05-04 00:00:00	RB Leipzig	37	Defender	186	79	L
ply749	Joško	Gvardiol	Croatia	2002-01-23 00:00:00	RB Leipzig	32	Defender	185	82	L
ply750	Marcel	Halstenberg	Germany	1991-09-27 00:00:00	RB Leipzig	23	Defender	188	87	L
ply751	Benjamin	Henrichs	Germany	1997-02-23 00:00:00	RB Leipzig	39	Defender	183	79	R
ply752	Lukas	Klostermann	Germany	1996-06-03 00:00:00	RB Leipzig	16	Defender	187	88	R
ply753	Willi	Orban	Hungary	1992-11-03 00:00:00	RB Leipzig	4	Defender	186	87	R
ply754	David	Raum	Germany	1998-04-22 00:00:00	RB Leipzig	22	Defender	180	75	L
ply755	Mohamed	Simakan	France	2000-05-03 00:00:00	RB Leipzig	2	Defender	187	82	R
ply756	Dani	Olmo	Spain	1998-05-07 00:00:00	RB Leipzig	7	Midfielder	179	72	R
ply757	Emil	Forsberg	Sweden	1991-10-23 00:00:00	RB Leipzig	10	Midfielder	177	76	R
ply758	Amadou	Haïdara	Mali	1998-01-31 00:00:00	RB Leipzig	8	Midfielder	175	72	R
ply759	Kevin	Kampl	Slovenia	1990-10-09 00:00:00	RB Leipzig	44	Midfielder	178	66	R
ply760	Konrad	Laimer	Austria	1997-05-27 00:00:00	RB Leipzig	27	Midfielder	180	72	R
ply761	Xaver	Schlager	Austria	1997-09-28 00:00:00	RB Leipzig	24	Midfielder	174	76	L
ply762	Dominik	Szoboszlai	Hungary	2000-10-25 00:00:00	RB Leipzig	17	Midfielder	186	74	R
ply763	André	Silva	Portugal	1995-11-06 00:00:00	RB Leipzig	19	Forward	185	84	R
ply764	Hugo	Novoa	Spain	2003-01-24 00:00:00	RB Leipzig	38	Forward	182	70	R
ply765	Christopher	Nkunku	France	1997-11-14 00:00:00	RB Leipzig	18	Forward	175	73	R
ply766	Yussuf	Poulsen	Denmark	1994-06-15 00:00:00	RB Leipzig	9	Forward	192	84	R
ply767	Timo	Werner	Germany	1996-03-06 00:00:00	RB Leipzig	11	Forward	181	75	R
ply768	Frederik	Gößling	Germany	1977-09-22 00:00:00	RB Leipzig	\N	Goalkeeping	190	88	\N
ply769	Philipp	Tschauner	Germany	1985-11-03 00:00:00	RB Leipzig	\N	Goalkeeping	196	100	R
ply770	Daniel	Behlau	Germany	1988-08-24 00:00:00	RB Leipzig	\N	Athletic	\N	\N	\N
ply771	Ruwen	Faller	Germany	1980-07-22 00:00:00	RB Leipzig	\N	Athletic	\N	\N	\N
ply772	Kai	Kraft	Germany	1977-07-02 00:00:00	RB Leipzig	\N	Athletic	\N	\N	\N
ply773	Matthias	Grote	Germany	1987-05-10 00:00:00	RB Leipzig	\N	Game	\N	\N	\N
ply774	Fabian	Friedrich	Germany	1985-10-19 00:00:00	RB Leipzig	\N	Chief	\N	\N	\N
ply775	Peter	Schneider	USA	1984-04-21 00:00:00	RB Leipzig	\N	02/2022	\N	\N	\N
ply776	Philipp	Köhn	Switzerland	1998-04-02 00:00:00	RB Salzburg	18	Goalkeeper	191	75	R
ply777	Nico	Mantl	Germany	2000-02-06 00:00:00	RB Salzburg	1	Goalkeeper	193	88	\N
ply778	Adam	Stejskal	Czech Republic	2002-03-28 00:00:00	RB Salzburg	40	Goalkeeper	189	\N	R
ply779	Alexander	Walke	Germany	1983-06-06 00:00:00	RB Salzburg	33	Goalkeeper	189	88	R
ply780	Samson	Baidoo	Austria	2004-03-31 00:00:00	RB Salzburg	6	Defender	187	\N	R
ply781	\N	Bernardo	Brazil	1995-05-14 00:00:00	RB Salzburg	95	Defender	186	76	L
ply782	Amar	Dedić	Bosnia-Herzegovina	2002-08-18 00:00:00	RB Salzburg	70	Defender	180	70	R
ply783	Bryan	Okoh	Switzerland	2003-05-16 00:00:00	RB Salzburg	3	Defender	187	77	\N
ply784	Strahinja	Pavlović	Serbia	2001-05-24 00:00:00	RB Salzburg	31	Defender	194	84	L
ply785	Kamil	Piątkowski	Poland	2000-06-21 00:00:00	RB Salzburg	4	Defender	191	83	R
ply786	Oumar	Solet	France	2000-02-07 00:00:00	RB Salzburg	22	Defender	192	81	R
ply787	Andreas	Ulmer	Austria	1985-10-30 00:00:00	RB Salzburg	17	Defender	175	73	L
ply788	Ignace Van Der	Brempt	Belgium	2002-04-01 00:00:00	RB Salzburg	2	Defender	187	71	R
ply789	Max	Wöber	Austria	1998-02-04 00:00:00	RB Salzburg	39	Defender	188	76	L
ply790	Antoine	Bernède	France	1999-05-26 00:00:00	RB Salzburg	10	Midfielder	177	74	L
ply791	Nicolás	Capaldo	Argentina	1998-09-14 00:00:00	RB Salzburg	7	Midfielder	177	73	R
ply792	Ousmane	Diakité	Mali	2000-07-25 00:00:00	RB Salzburg	\N	Midfielder	187	87	\N
ply793	Mamady	Diambou	Mali	2002-11-11 00:00:00	RB Salzburg	15	Midfielder	176	\N	R
ply794	Youba	Diarra	Mali	1998-03-24 00:00:00	RB Salzburg	24	Midfielder	178	79	R
ply795	Lucas	Gourna-Douath	France	2003-08-05 00:00:00	RB Salzburg	27	Midfielder	185	78	R
ply796	Dijon	Kameri	Austria	2004-04-20 00:00:00	RB Salzburg	8	Midfielder	181	\N	R
ply797	Maurits	Kjærgaard	Denmark	2003-06-26 00:00:00	RB Salzburg	14	Midfielder	186	70	R
ply798	Justin	Omoregie	Austria	2003-09-21 00:00:00	RB Salzburg	36	Midfielder	\N	\N	\N
ply799	Nicolas	Seiwald	Austria	2001-05-04 00:00:00	RB Salzburg	13	Midfielder	179	70	R
ply800	Luka	Sučić	Croatia	2002-09-08 00:00:00	RB Salzburg	21	Midfielder	185	71	L
ply801	Samson	Tijani	Nigeria	2002-05-17 00:00:00	RB Salzburg	44	Midfielder	170	63	R
ply802	Chikwubuike	Adamu	Austria	2001-06-06 00:00:00	RB Salzburg	9	Forward	182	79	R
ply803	\N	Fernando	Brazil	1999-03-01 00:00:00	RB Salzburg	11	Forward	176	72	R
ply804	Sékou	Koïta	Mali	1999-11-28 00:00:00	RB Salzburg	20	Forward	173	66	L
ply805	Dominik	Lechner	Austria	2005-04-01 00:00:00	RB Salzburg	14	Forward	\N	\N	\N
ply806	Noah	Okafor	Switzerland	2000-05-24 00:00:00	RB Salzburg	77	Forward	185	85	R
ply807	Benjamin	Šeško	Slovenia	2003-05-31 00:00:00	RB Salzburg	30	Forward	193	77	R
ply808	Roko	Šimić	Croatia	2003-09-10 00:00:00	RB Salzburg	23	Forward	190	\N	R
ply809	Herbert	Ilsanker	Austria	1967-05-24 00:00:00	RB Salzburg	\N	Goalkeeping	195	90	R
ply810	Michael	Berktold	Austria	1980-09-30 00:00:00	RB Salzburg	\N	Athletic	\N	\N	\N
ply811	Thibaut	Courtois	Belgium	1992-05-11 00:00:00	Real Madrid	1	Goalkeeper	200	96	L
ply812	Diego	Piñeiro	Spain	2004-02-13 00:00:00	Real Madrid	38	Goalkeeper	183	69	\N
ply813	Lucas	Cañizares	Spain	2002-05-10 00:00:00	Real Madrid	30	Goalkeeper	187	81	R
ply814	Luis	López	Spain	2001-05-08 00:00:00	Real Madrid	26	Goalkeeper	193	84	L
ply815	Andriy	Lunin	Ukraine	1999-02-11 00:00:00	Real Madrid	13	Goalkeeper	191	84	R
ply816	David	Alaba	Austria	1992-06-24 00:00:00	Real Madrid	4	Defender	180	78	L
ply817	Álvaro	Odriozola	Spain	1995-12-14 00:00:00	Real Madrid	16	Defender	176	66	R
ply818	Dani	Carvajal	Spain	1992-01-11 00:00:00	Real Madrid	2	Defender	173	74	R
ply819	Eder	Militão	Brazil	1998-01-18 00:00:00	Real Madrid	3	Defender	186	78	R
ply820	Jesús	Vallejo	Spain	1997-01-05 00:00:00	Real Madrid	5	Defender	184	79	R
ply821	Ferland	Mendy	France	1995-06-08 00:00:00	Real Madrid	23	Defender	180	73	L
ply822	\N	Nacho	Spain	1990-01-18 00:00:00	Real Madrid	6	Defender	180	76	R
ply823	Rafa	Marín	Spain	2002-05-19 00:00:00	\N	3	Defender	191	76	R
ply824	Antonio	Rüdiger	Germany	1993-03-03 00:00:00	Real Madrid	22	Defender	190	85	R
ply825	Eduardo	Camavinga	France	2002-11-10 00:00:00	Real Madrid	12	Midfielder	182	68	L
ply826	Dani	Ceballos	Spain	1996-08-07 00:00:00	Real Madrid	19	Midfielder	179	71	R
ply827	Toni	Kroos	Germany	1990-01-04 00:00:00	Real Madrid	8	Midfielder	183	76	R
ply828	Luka	Modrić	Croatia	1985-09-09 00:00:00	Real Madrid	10	Midfielder	172	66	\N
ply829	Aurélien	Tchouaméni	France	2000-01-27 00:00:00	Real Madrid	18	Midfielder	188	81	R
ply830	Federico	Valverde	Uruguay	1998-07-22 00:00:00	Real Madrid	15	Midfielder	182	78	R
ply831	Karim	Benzema	France	1987-12-19 00:00:00	Real Madrid	9	Forward	185	81	R
ply832	Eden	Hazard	Belgium	1991-01-07 00:00:00	Real Madrid	7	Forward	175	74	R
ply833	Lucas	Vázquez	Spain	1991-07-01 00:00:00	Real Madrid	17	Forward	173	71	R
ply834	Marco	Asensio	Spain	1996-01-21 00:00:00	Real Madrid	11	Forward	182	76	L
ply835	\N	Mariano	Dom. Republic	1993-08-01 00:00:00	Real Madrid	24	Forward	180	76	R
ply836	\N	Rodrygo	Brazil	2001-01-09 00:00:00	Real Madrid	21	Forward	174	64	R
ply837	Vinícius	Júnior	Brazil	2000-07-12 00:00:00	Real Madrid	20	Forward	176	73	R
ply838	Lluís	Llopis	Spain	1964-11-26 00:00:00	Real Madrid	\N	Goalkeeping	\N	\N	\N
ply839	Antonio	Pintus	Italy	1962-09-26 00:00:00	Real Madrid	\N	Athletic	\N	\N	\N
ply840	Alberto	Flores	Spain	2003-11-10 00:00:00	Sevilla FC	31	Goalkeeper	186	\N	\N
ply841	\N	Bono	Morocco	1991-04-05 00:00:00	Sevilla FC	13	Goalkeeper	192	78	L
ply842	Marko	Dmitrović	Serbia	1992-01-24 00:00:00	Sevilla FC	1	Goalkeeper	189	94	L
ply843	Marcos	Acuña	Argentina	1991-10-28 00:00:00	Sevilla FC	19	Defender	172	69	L
ply844	Alex	Telles	Brazil	1992-12-15 00:00:00	Sevilla FC	3	Defender	181	71	L
ply845	Jesús	Navas	Spain	1985-11-21 00:00:00	Sevilla FC	16	Defender	172	60	R
ply846	José	Ángel	Spain	2002-01-29 00:00:00	Sevilla FC	30	Defender	184	80	R
ply847	Kike	Salas	Spain	2002-04-23 00:00:00	Sevilla FC	29	Defender	186	\N	L
ply848	\N	Marcão	Brazil	1996-06-05 00:00:00	Sevilla FC	23	Defender	185	80	L
ply849	Gonzalo	Montiel	Argentina	1997-01-01 00:00:00	Sevilla FC	2	Defender	176	70	R
ply850	Tanguy	Nianzou	France	2002-06-07 00:00:00	Sevilla FC	14	Defender	191	85	R
ply851	Pablo	Pérez	Spain	2001-08-18 00:00:00	Sevilla FC	26	Defender	174	70	L
ply852	Karim	Rekik	Netherlands	1994-12-02 00:00:00	Sevilla FC	4	Defender	186	84	L
ply853	Thomas	Delaney	Denmark	1991-09-03 00:00:00	Sevilla FC	18	Midfielder	182	79	L
ply854	\N	Fernando	Brazil	1987-07-25 00:00:00	Sevilla FC	20	Midfielder	183	70	R
ply1	Sebastiano	Desplanches	Italy	2003-03-11 00:00:00	AC Milan	91	Goalkeeper	188	78	L
ply2	Andreas	Jungdal	Denmark	2002-02-22 00:00:00	AC Milan	96	Goalkeeper	195	82	R
ply3	Mike	Maignan	France	1995-07-03 00:00:00	AC Milan	16	Goalkeeper	191	80	R
ply4	Antonio	Mirante	Italy	1983-07-08 00:00:00	AC Milan	83	Goalkeeper	193	79	R
ply5	Lapo	Nava	Italy	2004-01-22 00:00:00	AC Milan	92	Goalkeeper	189	70	R
ply6	Ciprian	Tătăruşanu	Romania	1986-02-09 00:00:00	AC Milan	1	Goalkeeper	198	90	R
ply7	Fodé	Ballo-Touré	Senegal	1997-01-03 00:00:00	AC Milan	5	Defender	182	70	L
ply8	Davide	Calabria	Italy	1996-12-06 00:00:00	AC Milan	2	Defender	177	77	R
ply9	Sergiño	Dest	USA	2000-11-03 00:00:00	AC Milan	21	Defender	175	62	R
ply10	Alessandro	Florenzi	Italy	1991-03-11 00:00:00	AC Milan	25	Defender	173	67	R
ply11	Matteo	Gabbia	Italy	1999-10-21 00:00:00	AC Milan	46	Defender	186	78	R
ply12	Theo	Hernández	France	1997-10-06 00:00:00	AC Milan	19	Defender	184	81	L
ply13	Pierre	Kalulu	France	2000-06-05 00:00:00	AC Milan	20	Defender	179	69	R
ply14	Simon	Kjær	Denmark	1989-03-26 00:00:00	AC Milan	24	Defender	191	82	R
ply15	Malick	Thiaw	Germany	2001-08-08 00:00:00	AC Milan	28	Defender	194	80	\N
ply16	Fikayo	Tomori	England	1997-12-19 00:00:00	AC Milan	23	Defender	184	78	R
ply17	Yacine	Adli	France	2000-07-29 00:00:00	AC Milan	7	Midfielder	186	73	R
ply18	Tiemoué	Bakayoko	France	1994-08-17 00:00:00	AC Milan	14	Midfielder	189	77	R
ply19	Ismaël	Bennacer	Algeria	1997-12-01 00:00:00	AC Milan	4	Midfielder	175	70	L
ply20	Brahim	Díaz	Spain	1999-08-03 00:00:00	AC Milan	10	Midfielder	171	68	\N
ply21	Charles De	Ketelaere	Belgium	2001-03-10 00:00:00	AC Milan	90	Midfielder	192	74	L
ply22	Rade	Krunić	Bosnia-Herzegovina	1993-10-07 00:00:00	AC Milan	33	Midfielder	184	74	R
ply23	Tommaso	Pobega	Italy	1999-07-15 00:00:00	AC Milan	32	Midfielder	188	75	\N
ply24	Sandro	Tonali	Italy	2000-05-08 00:00:00	AC Milan	8	Midfielder	181	79	R
ply25	Aster	Vranckx	Belgium	2002-10-04 00:00:00	AC Milan	40	Midfielder	183	78	R
ply26	Olivier	Giroud	France	1986-09-30 00:00:00	AC Milan	9	Forward	193	91	L
ply27	Zlatan	Ibrahimović	Sweden	1981-10-03 00:00:00	AC Milan	11	Forward	195	95	\N
ply28	Marko	Lazetić	Serbia	2004-01-22 00:00:00	AC Milan	22	Forward	190	79	R
ply29	Junior	Messias	Brazil	1991-05-13 00:00:00	AC Milan	30	Forward	174	70	L
ply30	Divock	Origi	Belgium	1995-04-18 00:00:00	AC Milan	27	Forward	185	75	R
ply31	Rafael	Leão	Portugal	1999-06-10 00:00:00	AC Milan	17	Forward	188	81	R
ply32	Ante	Rebić	Croatia	1993-09-21 00:00:00	AC Milan	12	Forward	185	78	R
ply33	Alexis	Saelemaekers	Belgium	1999-06-27 00:00:00	AC Milan	56	Forward	180	72	R
ply34	Jay	Gorter	Netherlands	2000-05-30 00:00:00	AFC Ajax	16	Goalkeeper	190	\N	R
ply35	Remko	Pasveer	Netherlands	1983-11-08 00:00:00	AFC Ajax	22	Goalkeeper	187	88	R
ply36	Maarten	Stekelenburg	Netherlands	1982-09-22 00:00:00	AFC Ajax	1	Goalkeeper	197	84	R
ply37	Youri	Baas	Netherlands	2003-03-17 00:00:00	AFC Ajax	25	Defender	182	71	L
ply38	Calvin	Bassey	Nigeria	1999-12-31 00:00:00	AFC Ajax	3	Defender	185	76	L
ply39	Daley	Blind	Netherlands	1990-03-09 00:00:00	AFC Ajax	17	Defender	180	72	L
ply40	Ahmetcan	Kaplan	Turkey	2003-01-16 00:00:00	AFC Ajax	13	Defender	190	72	L
ply41	Lisandro	Magallán	Argentina	1993-09-27 00:00:00	AFC Ajax	29	Defender	185	79	R
ply42	Kik	Pierie	Netherlands	2000-07-20 00:00:00	AFC Ajax	39	Defender	183	72	L
ply43	Youri	Regeer	Netherlands	2003-08-18 00:00:00	AFC Ajax	26	Defender	177	\N	R
ply44	Devyne	Rensch	Netherlands	2003-01-18 00:00:00	AFC Ajax	15	Defender	179	\N	\N
ply45	Jorge	Sánchez	Mexico	1997-12-10 00:00:00	AFC Ajax	19	Defender	175	71	R
ply46	Jurriën	Timber	Netherlands	2001-06-17 00:00:00	AFC Ajax	2	Defender	179	62	R
ply47	Owen	Wijndal	Netherlands	1999-11-28 00:00:00	AFC Ajax	5	Defender	176	65	L
ply48	Edson	Álvarez	Mexico	1997-10-24 00:00:00	AFC Ajax	4	Midfielder	187	72	R
ply49	Steven	Berghuis	Netherlands	1991-12-19 00:00:00	AFC Ajax	23	Midfielder	182	75	L
ply50	Kian	Fitz-Jim	Netherlands	2003-07-05 00:00:00	AFC Ajax	28	Midfielder	\N	\N	R
ply51	Florian	Grillitsch	Austria	1995-08-07 00:00:00	AFC Ajax	21	Midfielder	187	77	R
ply52	Davy	Klaassen	Netherlands	1993-02-21 00:00:00	AFC Ajax	6	Midfielder	179	70	R
ply53	Kenneth	Taylor	Netherlands	2002-05-16 00:00:00	AFC Ajax	8	Midfielder	182	66	L
ply54	Steven	Bergwijn	Netherlands	1997-10-08 00:00:00	AFC Ajax	7	Forward	178	69	R
ply55	Brian	Brobbey	Netherlands	2002-02-01 00:00:00	AFC Ajax	9	Forward	180	72	R
ply56	Francisco	Conceição	Portugal	2002-12-14 00:00:00	AFC Ajax	35	Forward	170	60	L
ply57	Mohammed	Kudus	Ghana	2000-08-02 00:00:00	AFC Ajax	20	Forward	177	70	L
ply58	Lorenzo	Lucca	Italy	2000-09-10 00:00:00	AFC Ajax	18	Forward	201	80	R
ply59	Lucas	Ocampos	Argentina	1994-07-11 00:00:00	AFC Ajax	11	Forward	187	84	\N
ply60	Dušan	Tadić	Serbia	1988-11-20 00:00:00	AFC Ajax	10	Forward	181	76	L
ply61	Anton	Scheutjens	Netherlands	1968-05-01 00:00:00	AFC Ajax	\N	Goalkeeping	183	81	\N
ply62	Tommaso	Bertini	Italy	2004-01-13 00:00:00	Atalanta	47	Goalkeeper	188	\N	R
ply63	Juan	Musso	Argentina	1994-05-06 00:00:00	Atalanta	1	Goalkeeper	191	93	R
ply64	Francesco	Rossi	Italy	1991-04-27 00:00:00	Atalanta	31	Goalkeeper	193	83	R
ply65	Marco	Sportiello	Italy	1992-05-10 00:00:00	Atalanta	57	Goalkeeper	192	87	R
ply66	Merih	Demiral	Turkey	1998-03-05 00:00:00	Atalanta	28	Defender	192	87	R
ply67	Berat	Djimsiti	Albania	1993-02-19 00:00:00	Atalanta	19	Defender	191	83	R
ply68	Hans	Hateboer	Netherlands	1994-01-09 00:00:00	Atalanta	33	Defender	187	74	R
ply69	Joakim	Mæhle	Denmark	1997-05-20 00:00:00	Atalanta	3	Defender	185	79	R
ply70	Caleb	Okoli	Italy	2001-07-13 00:00:00	Atalanta	5	Defender	189	72	R
ply71	José	Palomino	Argentina	1990-01-05 00:00:00	Atalanta	6	Defender	188	87	L
ply72	Matteo	Ruggeri	Italy	2002-07-11 00:00:00	Atalanta	22	Defender	187	69	L
ply73	Giorgio	Scalvini	Italy	2003-12-11 00:00:00	Atalanta	42	Defender	194	76	R
ply74	Brandon	Soppy	France	2002-02-21 00:00:00	Atalanta	93	Defender	181	80	R
ply75	Rafael	Tolói	Italy	1990-10-10 00:00:00	Atalanta	2	Defender	185	75	R
ply76	Davide	Zappacosta	Italy	1992-06-11 00:00:00	Atalanta	77	Defender	182	70	R
ply77	Marten de	Roon	Netherlands	1991-03-29 00:00:00	Atalanta	15	Midfielder	185	76	R
ply78	\N	Éderson	Brazil	1999-07-07 00:00:00	Atalanta	13	Midfielder	185	86	R
ply79	Teun	Koopmeiners	Netherlands	1998-02-28 00:00:00	Atalanta	7	Midfielder	184	77	L
ply80	Ruslan	Malinovskiy	Ukraine	1993-05-04 00:00:00	Atalanta	18	Midfielder	181	79	L
ply81	Mario	Pašalić	Croatia	1995-02-09 00:00:00	Atalanta	88	Midfielder	189	82	R
ply82	Nadir	Zortea	Italy	1999-06-19 00:00:00	Atalanta	21	Midfielder	176	65	R
ply83	Jérémie	Boga	Ivory Coast	1997-01-03 00:00:00	Atalanta	10	Forward	174	68	R
ply84	Rasmus	Højlund	Denmark	2003-02-04 00:00:00	Atalanta	17	Forward	185	\N	L
ply85	Ademola	Lookman	Nigeria	1997-10-20 00:00:00	Atalanta	11	Forward	174	71	R
ply86	Luis	Muriel	Colombia	1991-04-16 00:00:00	Atalanta	9	Forward	179	75	R
ply87	Duván	Zapata	Colombia	1991-04-01 00:00:00	Atalanta	91	Forward	189	88	R
ply88	Antonio	Gomis	Spain	2003-05-20 00:00:00	\N	13	Goalkeeper	188	80	L
ply89	Ivo	Grbić	Croatia	1996-01-18 00:00:00	Atlético Madrid	1	Goalkeeper	195	83	R
ply90	Jan	Oblak	Slovenia	1993-01-07 00:00:00	Atlético Madrid	13	Goalkeeper	188	87	R
ply91	Sergio	Mestre	Spain	2005-02-13 00:00:00	Atlético Madrid	51	Goalkeeper	\N	\N	\N
ply92	Adrián	Corral	Spain	2003-01-05 00:00:00	Atlético Madrid	48	Defender	183	77	L
ply93	Santiago	Arias	Colombia	1992-01-13 00:00:00	Atlético Madrid	\N	Defender	177	72	R
ply94	Felipe	Monteiro	Brazil	1989-05-16 00:00:00	Atlético Madrid	18	Defender	190	84	R
ply95	Fran	González	Spain	1998-08-13 00:00:00	Atlético Madrid	38	Defender	190	\N	R
ply96	José	Giménez	Uruguay	1995-01-20 00:00:00	Atlético Madrid	2	Defender	185	80	R
ply97	Ibrahima	Cámara	Spain	2003-01-18 00:00:00	Atlético Madrid	47	Defender	180	75	\N
ply98	Marco	Moreno	Spain	2001-02-20 00:00:00	Atlético Madrid	36	Defender	191	\N	R
ply99	Mario	Hermoso	Spain	1995-06-18 00:00:00	Atlético Madrid	22	Defender	184	76	L
ply100	Nahuel	Molina	Argentina	1998-04-06 00:00:00	Atlético Madrid	16	Defender	175	72	R
ply101	\N	Reguilón	Spain	1996-12-16 00:00:00	Atlético Madrid	3	Defender	178	68	L
ply102	\N	Reinildo	Mozambique	1994-01-21 00:00:00	Atlético Madrid	23	Defender	180	73	L
ply103	Stefan	Savić	Montenegro	1991-01-08 00:00:00	Atlético Madrid	15	Defender	187	80	R
ply104	Sergio	Diez	Spain	2003-07-28 00:00:00	Atlético Madrid	30	Defender	180	75	R
ply105	Axel	Witsel	Belgium	1989-01-12 00:00:00	Atlético Madrid	20	Defender	186	81	R
ply106	Alberto	Moreno	Spain	2002-04-19 00:00:00	Atlético Madrid	32	Midfielder	\N	\N	\N
ply107	Yannick	Carrasco	Belgium	1993-09-04 00:00:00	Atlético Madrid	21	Midfielder	181	73	R
ply108	Rodrigo de	Paul	Argentina	1994-05-24 00:00:00	Atlético Madrid	5	Midfielder	180	70	R
ply109	\N	Koke	Spain	1992-01-08 00:00:00	Atlético Madrid	6	Midfielder	176	75	R
ply110	Geoffrey	Kondogbia	Central Afr. Republic	1993-02-15 00:00:00	Atlético Madrid	4	Midfielder	188	76	L
ply111	Thomas	Lemar	France	1995-11-12 00:00:00	Atlético Madrid	11	Midfielder	171	66	L
ply112	Marcos	Llorente	Spain	1995-01-30 00:00:00	Atlético Madrid	14	Midfielder	184	74	R
ply113	\N	Saúl	Spain	1994-11-21 00:00:00	Atlético Madrid	17	Midfielder	184	77	L
ply114	Ángel	Correa	Argentina	1995-03-09 00:00:00	Atlético Madrid	10	Forward	171	70	R
ply115	Antoine	Griezmann	France	1991-03-21 00:00:00	Atlético Madrid	8	Forward	176	73	L
ply116	João	Félix	Portugal	1999-11-10 00:00:00	Atlético Madrid	7	Forward	181	72	\N
ply117	Matheus	Cunha	Brazil	1999-05-27 00:00:00	Atlético Madrid	9	Forward	184	75	R
ply118	Álvaro	Morata	Spain	1992-10-23 00:00:00	Atlético Madrid	19	Forward	187	82	R
ply119	Pablo	Vercellone	Argentina	1968-04-24 00:00:00	Atlético Madrid	\N	Goalkeeping	\N	\N	\N
ply120	Óscar	Ortega	Uruguay	1958-03-29 00:00:00	Atlético Madrid	\N	Athletic	\N	\N	\N
ply121	Óscar	Pitillas	Spain	1971-10-16 00:00:00	Atlético Madrid	\N	Rehab	\N	\N	\N
ply122	Manuel	Neuer	Germany	1986-03-27 00:00:00	Bayern München	1	Goalkeeper	193	92	R
ply123	Johannes	Schenk	Germany	2003-01-13 00:00:00	Bayern München	35	Goalkeeper	191	\N	\N
ply124	Sven	Ulreich	Germany	1988-08-03 00:00:00	Bayern München	26	Goalkeeper	192	87	R
ply125	Alphonso	Davies	Canada	2000-11-02 00:00:00	Bayern München	19	Defender	185	77	L
ply126	Matthijs de	Ligt	Netherlands	1999-08-12 00:00:00	Bayern München	4	Defender	189	89	R
ply127	Lucas	Hernández	France	1996-02-14 00:00:00	Bayern München	21	Defender	184	79	L
ply128	Noussair	Mazraoui	Morocco	1997-11-14 00:00:00	Bayern München	40	Defender	183	78	R
ply129	Benjamin	Pavard	France	1996-03-28 00:00:00	Bayern München	5	Defender	186	81	R
ply130	Bouna	Sarr	Senegal	1992-01-31 00:00:00	Bayern München	20	Defender	178	71	R
ply131	Josip	Stanišić	Croatia	2000-04-02 00:00:00	Bayern München	44	Defender	186	77	\N
ply132	Dayot	Upamecano	France	1998-10-27 00:00:00	Bayern München	2	Defender	186	90	R
ply133	Leon	Goretzka	Germany	1995-02-06 00:00:00	Bayern München	8	Midfielder	189	82	R
ply134	Ryan	Gravenberch	Netherlands	2002-06-15 00:00:00	Bayern München	38	Midfielder	190	83	R
ply135	Joshua	Kimmich	Germany	1995-02-08 00:00:00	Bayern München	6	Midfielder	177	75	R
ply136	Jamal	Musiala	Germany	2003-02-26 00:00:00	Bayern München	42	Midfielder	183	70	R
ply137	Marcel	Sabitzer	Austria	1994-03-17 00:00:00	Bayern München	18	Midfielder	177	76	R
ply138	Paul	Wanner	Germany	2005-12-23 00:00:00	Bayern München	14	Midfielder	185	72	L
ply139	Eric Maxim	Choupo-Moting	Cameroon	1989-03-23 00:00:00	Bayern München	13	Forward	191	90	R
ply140	Kingsley	Coman	France	1996-06-13 00:00:00	Bayern München	11	Forward	180	76	R
ply141	Serge	Gnabry	Germany	1995-07-14 00:00:00	Bayern München	7	Forward	176	77	R
ply142	Sadio	Mané	Senegal	1992-04-10 00:00:00	Bayern München	17	Forward	174	69	R
ply143	Thomas	Müller	Germany	1989-09-13 00:00:00	Bayern München	25	Forward	185	76	R
ply144	Leroy	Sané	Germany	1996-01-11 00:00:00	Bayern München	10	Forward	183	80	L
ply145	Mathys	Tel	France	2005-04-27 00:00:00	Bayern München	39	Forward	183	75	R
ply146	Toni	Tapalović	Croatia	1980-10-10 00:00:00	Bayern München	\N	Goalkeeping	185	83	\N
ply147	Holger	Broich	Germany	1974-09-18 00:00:00	Bayern München	\N	Fitness	\N	\N	\N
ply148	Stephan	Kerth	Germany	1988-09-23 00:00:00	Bayern München	\N	Fitness	\N	\N	\N
ply149	Simon	Martinello	Italy	1984-11-01 00:00:00	Bayern München	\N	Fitness	\N	\N	\N
ply150	Peter	Schlösser	Germany	\N	Bayern München	\N	Rehab	\N	\N	\N
ply151	Thomas	Wilhelmi	Germany	1967-05-11 00:00:00	Bayern München	\N	Rehab	\N	\N	\N
ply152	Vitus	Angerer	Germany	1985-10-01 00:00:00	Bayern München	\N	Game	\N	\N	\N
ply153	Michael	Cuper	Germany	1985-01-08 00:00:00	Bayern München	\N	Game	\N	\N	\N
ply154	Maximilian	Luckner	Germany	\N	Bayern München	\N	Game	\N	\N	\N
ply155	Mathias	Reiter	Germany	\N	Bayern München	\N	Game	\N	\N	\N
ply156	Maximilian	Schwab	Germany	1988-11-28 00:00:00	Bayern München	\N	Game	\N	\N	\N
ply157	Giacomo	Stey	Germany	1994-03-21 00:00:00	Bayern München	\N	Game	\N	\N	\N
ply158	Michael	Niemeyer	Germany	1971-04-06 00:00:00	Bayern München	\N	Chief	\N	\N	\N
ply159	Maximilian	Pelka	Germany	1988-05-24 00:00:00	Bayern München	\N	07/2021	\N	\N	R
ply160	Göktug	Baytekin	Turkey	2004-11-20 00:00:00	Beşiktaş	74	Goalkeeper	\N	\N	\N
ply161	Emre	Bilgin	Turkey	2004-02-26 00:00:00	Beşiktaş	99	Goalkeeper	188	80	L
ply162	Ersin	Destanoğlu	Turkey	2001-01-01 00:00:00	Beşiktaş	1	Goalkeeper	195	88	R
ply163	Mert	Günok	Turkey	1989-03-01 00:00:00	Beşiktaş	34	Goalkeeper	196	92	R
ply164	Utku	Yuvakuran	Turkey	1997-11-02 00:00:00	Beşiktaş	97	Goalkeeper	192	81	R
ply165	Tayfur	Bingöl	Turkey	1993-01-11 00:00:00	Beşiktaş	\N	Defender	180	71	R
ply166	Halil	Duman	Turkey	2001-03-08 00:00:00	Beşiktaş	\N	Defender	\N	\N	\N
ply167	Arthur	Masuaku	Congo DR	1993-11-07 00:00:00	Beşiktaş	25	Defender	179	70	L
ply168	Umut	Meraş	Turkey	1995-12-20 00:00:00	Beşiktaş	77	Defender	178	73	L
ply169	\N	Montero	Spain	1999-01-14 00:00:00	Beşiktaş	4	Defender	185	76	L
ply170	Valentin	Rosier	France	1996-08-19 00:00:00	Beşiktaş	2	Defender	175	70	R
ply171	Romain	Saïss	Morocco	1990-03-26 00:00:00	Beşiktaş	26	Defender	188	80	L
ply172	Tayyip	Sanuç	Turkey	1999-12-17 00:00:00	Beşiktaş	\N	Defender	188	80	R
ply173	Emrecan	Uzunhan	Turkey	2001-02-26 00:00:00	Beşiktaş	14	Defender	\N	\N	\N
ply174	Welinton	Souza	Brazil	1989-04-10 00:00:00	Beşiktaş	23	Defender	181	81	R
ply175	Oğuzhan	Akgün	Turkey	2001-07-13 00:00:00	Beşiktaş	33	Midfielder	174	\N	L
ply176	Dele	Alli	England	1996-04-11 00:00:00	Beşiktaş	11	Midfielder	188	80	R
ply177	Gedson	Fernandes	Portugal	1999-01-09 00:00:00	Beşiktaş	83	Midfielder	184	71	R
ply178	Atiba	Hutchinson	Canada	1983-02-08 00:00:00	Beşiktaş	13	Midfielder	187	83	R
ply179	\N	Josef	Brazil	1989-02-11 00:00:00	Beşiktaş	5	Midfielder	188	82	R
ply180	Kerem	Kesgin	Turkey	2000-11-05 00:00:00	Beşiktaş	17	Midfielder	176	76	R
ply181	Muhayer	Oktay	Turkey	1999-04-28 00:00:00	Beşiktaş	45	Midfielder	180	75	\N
ply182	Demir	Tiknaz	Turkey	2004-08-17 00:00:00	Beşiktaş	68	Midfielder	\N	\N	\N
ply183	Salih	Uçan	Turkey	1994-01-06 00:00:00	Beşiktaş	8	Midfielder	182	72	R
ply184	Necip	Uysal	Turkey	1991-01-24 00:00:00	Beşiktaş	20	Midfielder	180	76	R
ply185	Berkay	Vardar	Azerbaijan	2003-01-14 00:00:00	Beşiktaş	22	Midfielder	\N	\N	\N
ply186	Tyler	Boyd	USA	1994-12-30 00:00:00	Beşiktaş	30	Forward	183	74	R
ply187	Rachid	Ghezzal	Algeria	1992-05-09 00:00:00	Beşiktaş	18	Forward	182	70	L
ply188	Jackson	Muleka	Congo DR	1999-10-04 00:00:00	Beşiktaş	40	Forward	180	77	R
ply189	Georges-Kévin	N'Koudou	France	1995-02-13 00:00:00	Beşiktaş	7	Forward	172	68	R
ply190	Nathan	Redmond	England	1994-03-06 00:00:00	Beşiktaş	\N	Forward	173	69	R
ply191	Cenk	Tosun	Turkey	1991-06-07 00:00:00	Beşiktaş	9	Forward	183	78	R
ply192	Wout	Weghorst	Netherlands	1992-08-07 00:00:00	Beşiktaş	10	Forward	197	84	R
ply193	Gregor	Kobel	Switzerland	1997-12-06 00:00:00	Borussia Dortmund	1	Goalkeeper	196	88	R
ply194	Marcel	Lotka	Poland	2001-05-25 00:00:00	Borussia Dortmund	35	Goalkeeper	190	85	R
ply195	Alexander	Meyer	Germany	1991-04-13 00:00:00	Borussia Dortmund	33	Goalkeeper	195	90	R
ply196	Luca	Unbehaun	Germany	2001-02-27 00:00:00	Borussia Dortmund	38	Goalkeeper	185	82	R
ply197	Soumaïla	Coulibaly	France	2003-10-14 00:00:00	Borussia Dortmund	44	Defender	190	82	L
ply198	Raphaël	Guerreiro	Portugal	1993-12-22 00:00:00	Borussia Dortmund	13	Defender	170	71	L
ply199	Mats	Hummels	Germany	1988-12-16 00:00:00	Borussia Dortmund	15	Defender	191	94	R
ply200	Mateu	Morey	Spain	2000-03-02 00:00:00	Borussia Dortmund	2	Defender	173	67	R
ply201	Thomas	Meunier	Belgium	1991-09-12 00:00:00	Borussia Dortmund	24	Defender	191	90	R
ply202	Felix	Passlack	Germany	1998-05-29 00:00:00	Borussia Dortmund	30	Defender	170	74	R
ply203	Tom	Rothe	Germany	2004-10-29 00:00:00	Borussia Dortmund	36	Defender	193	88	L
ply204	Nico	Schlotterbeck	Germany	1999-12-01 00:00:00	Borussia Dortmund	4	Defender	191	86	L
ply205	Nico	Schulz	Germany	1993-04-01 00:00:00	Borussia Dortmund	14	Defender	181	83	L
ply206	Niklas	Süle	Germany	1995-09-03 00:00:00	Borussia Dortmund	25	Defender	195	97	R
ply207	Jude	Bellingham	England	2003-06-29 00:00:00	Borussia Dortmund	22	Midfielder	186	75	R
ply208	Julian	Brandt	Germany	1996-05-02 00:00:00	Borussia Dortmund	19	Midfielder	185	83	R
ply209	Emre	Can	Germany	1994-01-12 00:00:00	Borussia Dortmund	23	Midfielder	186	86	R
ply210	Mahmoud	Dahoud	Germany	1996-01-01 00:00:00	Borussia Dortmund	8	Midfielder	178	68	R
ply211	Göktan	Gürpüz	Germany	2003-01-22 00:00:00	Borussia Dortmund	42	Midfielder	175	60	R
ply212	Thorgan	Hazard	Belgium	1993-03-29 00:00:00	Borussia Dortmund	10	Midfielder	175	71	R
ply213	Abdoulaye	Kamara	Guinea	2004-11-06 00:00:00	Borussia Dortmund	32	Midfielder	182	77	R
ply214	Justin	Njinmah	Germany	2000-11-15 00:00:00	Borussia Dortmund	49	Midfielder	184	75	R
ply215	Salih	Özcan	Turkey	1998-01-11 00:00:00	Borussia Dortmund	6	Midfielder	182	74	R
ply216	Antonios	Papadopoulos	Germany	1999-09-10 00:00:00	Borussia Dortmund	47	Midfielder	185	83	R
ply217	Gio	Reyna	USA	2002-11-13 00:00:00	Borussia Dortmund	7	Midfielder	185	79	R
ply218	Marius	Wolf	Germany	1995-05-27 00:00:00	Borussia Dortmund	17	Midfielder	187	81	R
ply219	Karim	Adeyemi	Germany	2002-01-18 00:00:00	Borussia Dortmund	27	Forward	177	68	L
ply220	Jamie	Bynoe-Gittens	England	2004-08-08 00:00:00	Borussia Dortmund	43	Forward	175	70	R
ply221	Sébastien	Haller	Ivory Coast	1994-06-22 00:00:00	Borussia Dortmund	9	Forward	190	82	R
ply222	Donyell	Malen	Netherlands	1999-01-19 00:00:00	Borussia Dortmund	21	Forward	179	68	R
ply223	Anthony	Modeste	France	1988-04-14 00:00:00	Borussia Dortmund	20	Forward	187	84	R
ply224	Youssoufa	Moukoko	Germany	2004-11-20 00:00:00	Borussia Dortmund	18	Forward	179	72	L
ply225	Marco	Reus	Germany	1989-05-31 00:00:00	Borussia Dortmund	11	Forward	180	71	R
ply226	Matthias	Kleinsteiber	Germany	1978-01-05 00:00:00	Borussia Dortmund	\N	Goalkeeping	188	85	\N
ply227	Mathias	Kolodziej	Germany	1988-04-04 00:00:00	Borussia Dortmund	\N	Athletic	194	\N	\N
ply228	Dennis	Morschel	Germany	1985-02-21 00:00:00	Borussia Dortmund	\N	Athletic	194	\N	\N
ply229	Florian	Wangler	Germany	1980-01-16 00:00:00	Borussia Dortmund	\N	Athletic	\N	\N	\N
ply230	Johannes	Wieber	Germany	1972-09-09 00:00:00	Borussia Dortmund	\N	Athletic	\N	\N	\N
ply231	Thorben	Voeste	Germany	1981-06-10 00:00:00	Borussia Dortmund	\N	Rehab	\N	\N	\N
ply232	Olaf	Wehmer	Germany	1980-06-01 00:00:00	Borussia Dortmund	\N	Rehab	\N	\N	\N
ply233	Frank	Zöllner	Germany	1968-02-20 00:00:00	Borussia Dortmund	\N	Rehab	\N	\N	\N
ply234	Otto	Addo	Ghana	1975-06-09 00:00:00	Borussia Dortmund	\N	Special	188	80	R
ply235	Serdar	Ayar	Germany	1972-04-22 00:00:00	Borussia Dortmund	\N	Game	\N	\N	\N
ply236	Mario	Baric	Germany	1984-11-10 00:00:00	Borussia Dortmund	\N	Game	\N	\N	\N
ply237	Daniel	Ackermann	Germany	1981-07-29 00:00:00	Borussia Dortmund	\N	Video	182	81	\N
ply238	Frank	Rutemöller	Germany	1983-07-28 00:00:00	Borussia Dortmund	\N	Video	\N	\N	\N
ply239	Kai-Norman	Schulz	Germany	1974-05-02 00:00:00	Borussia Dortmund	\N	Chief	\N	\N	\N
ply240	Philipp	Laux	Germany	1973-01-25 00:00:00	Borussia Dortmund	\N	05/2020	182	82	\N
ply241	Dario	Marzino	Switzerland	1996-09-19 00:00:00	BSC Young Boys	40	Goalkeeper	184	80	R
ply242	Anthony	Racioppi	Switzerland	1998-12-31 00:00:00	BSC Young Boys	1	Goalkeeper	188	80	R
ply243	David von	Ballmoos	Switzerland	1994-12-30 00:00:00	BSC Young Boys	26	Goalkeeper	192	90	R
ply244	Leandro	Zbinden	Switzerland	2002-07-30 00:00:00	BSC Young Boys	61	Goalkeeper	189	83	\N
ply245	Aurèle	Amenda	Switzerland	2003-07-31 00:00:00	BSC Young Boys	4	Defender	194	90	\N
ply246	Loris	Benito	Switzerland	1992-01-07 00:00:00	BSC Young Boys	23	Defender	186	85	L
ply247	Lewin	Blum	Switzerland	2001-07-27 00:00:00	BSC Young Boys	27	Defender	181	75	\N
ply248	Mohamed	Camara	Guinea	1997-08-28 00:00:00	BSC Young Boys	13	Defender	191	80	R
ply249	Ulisses	Garcia	Switzerland	1996-01-11 00:00:00	BSC Young Boys	21	Defender	183	82	L
ply250	Sandro	Lauper	Switzerland	1996-10-25 00:00:00	BSC Young Boys	30	Defender	186	73	R
ply251	Fabian	Lustenberger	Switzerland	1988-05-02 00:00:00	BSC Young Boys	28	Defender	182	73	R
ply252	Quentin	Maceiras	Switzerland	1995-10-10 00:00:00	BSC Young Boys	24	Defender	181	75	R
ply253	Cédric	Zesiger	Switzerland	1998-06-24 00:00:00	BSC Young Boys	5	Defender	194	88	L
ply254	Miguel	Chaiwa	Zambia	2004-06-07 00:00:00	BSC Young Boys	14	Midfielder	179	73	R
ply255	Théo	Golliard	Switzerland	2002-09-27 00:00:00	\N	\N	Midfielder	172	68	\N
ply256	Kastriot	Imeri	Switzerland	2000-06-27 00:00:00	BSC Young Boys	29	Midfielder	181	75	R
ply257	Cheikh	Niasse	Senegal	2000-01-19 00:00:00	BSC Young Boys	20	Midfielder	188	69	R
ply258	Esteban	Petignat	Switzerland	2000-05-17 00:00:00	BSC Young Boys	6	Midfielder	177	71	R
ply259	Fabian	Rieder	Switzerland	2002-02-16 00:00:00	BSC Young Boys	32	Midfielder	181	74	L
ply260	Donat	Rrudhani	Kosovo	1999-05-02 00:00:00	BSC Young Boys	22	Midfielder	188	78	L
ply261	Kevin	Rüegg	Switzerland	1998-08-05 00:00:00	BSC Young Boys	17	Midfielder	173	77	R
ply262	Vincent	Sierro	Switzerland	1995-10-08 00:00:00	BSC Young Boys	8	Midfielder	185	79	R
ply263	Filip	Ugrinić	Switzerland	1999-01-05 00:00:00	BSC Young Boys	7	Midfielder	184	88	R
ply264	Jonathan De	Donno	Switzerland	2002-02-16 00:00:00	BSC Young Boys	\N	Forward	\N	\N	\N
ply265	Meschack	Elia	Congo DR	1997-08-06 00:00:00	BSC Young Boys	15	Forward	173	67	R
ply266	Christian	Fassnacht	Switzerland	1993-11-11 00:00:00	BSC Young Boys	16	Forward	185	77	R
ply267	Cedric	Itten	Switzerland	1996-12-27 00:00:00	BSC Young Boys	11	Forward	190	84	R
ply268	Joël	Monteiro	Portugal	1999-08-05 00:00:00	BSC Young Boys	77	Forward	191	81	R
ply269	Jean-Pierre	Nsame	Cameroon	1993-05-01 00:00:00	BSC Young Boys	18	Forward	188	89	R
ply270	Marcus	Bettinelli	England	1992-05-24 00:00:00	Chelsea FC	13	Goalkeeper	194	84	R
ply271	\N	Kepa	Spain	1994-10-03 00:00:00	Chelsea FC	1	Goalkeeper	186	85	R
ply272	Edouard	Mendy	Senegal	1992-03-01 00:00:00	Chelsea FC	16	Goalkeeper	196	86	R
ply273	\N	Azpilicueta	Spain	1989-08-28 00:00:00	Chelsea FC	28	Defender	178	75	R
ply274	Ben	Chilwell	England	1996-12-21 00:00:00	Chelsea FC	21	Defender	180	78	L
ply275	\N	Cucurella	Spain	1998-07-22 00:00:00	Chelsea FC	32	Defender	175	68	L
ply276	Wesley	Fofana	France	2000-12-17 00:00:00	Chelsea FC	33	Defender	190	76	R
ply277	Reece	James	England	1999-12-08 00:00:00	Chelsea FC	24	Defender	180	91	R
ply278	Kalidou	Koulibaly	Senegal	1991-06-20 00:00:00	Chelsea FC	26	Defender	187	89	R
ply279	Thiago	Silva	Brazil	1984-09-22 00:00:00	Chelsea FC	6	Defender	183	79	R
ply280	Trevoh	Chalobah	England	1999-07-05 00:00:00	Chelsea FC	14	Midfielder	191	84	R
ply281	Carney	Chukwuemeka	England	2003-10-20 00:00:00	Chelsea FC	30	Midfielder	185	70	R
ply282	Conor	Gallagher	England	2000-02-06 00:00:00	Chelsea FC	23	Midfielder	182	74	R
ply283	Kai	Havertz	Germany	1999-06-11 00:00:00	Chelsea FC	29	Midfielder	189	82	L
ply284	\N	Jorginho	Italy	1991-12-20 00:00:00	Chelsea FC	5	Midfielder	180	68	R
ply285	N'Golo	Kanté	France	1991-03-29 00:00:00	Chelsea FC	7	Midfielder	168	68	R
ply286	Mateo	Kovačić	Croatia	1994-05-06 00:00:00	Chelsea FC	8	Midfielder	177	75	R
ply287	Ruben	Loftus-Cheek	England	1996-01-23 00:00:00	Chelsea FC	12	Midfielder	191	83	R
ply288	Mason	Mount	England	1999-01-10 00:00:00	Chelsea FC	19	Midfielder	180	74	R
ply289	Denis	Zakaria	Switzerland	1996-11-20 00:00:00	Chelsea FC	20	Midfielder	191	81	R
ply290	Pierre-Emerick	Aubameyang	Gabon	1989-06-18 00:00:00	Chelsea FC	9	Forward	187	80	R
ply291	Armando	Broja	Albania	2001-09-10 00:00:00	Chelsea FC	18	Forward	191	75	R
ply292	Christian	Pulišić	USA	1998-09-18 00:00:00	Chelsea FC	10	Forward	177	73	R
ply293	Raheem	Sterling	England	1994-12-08 00:00:00	Chelsea FC	17	Forward	170	69	R
ply294	Hakim	Ziyech	Morocco	1993-03-19 00:00:00	Chelsea FC	22	Forward	181	70	L
ply295	\N	Hilário	Portugal	1975-10-21 00:00:00	Chelsea FC	\N	Goalkeeping	189	85	\N
ply296	Ben	Roberts	England	1975-06-22 00:00:00	Chelsea FC	\N	Goalkeeping	184	78	\N
ply297	James	Russell	England	1987-09-19 00:00:00	Chelsea FC	\N	Goalkeeping	178	74	\N
ply298	Matt	Birnie	England	1987-07-10 00:00:00	Chelsea FC	\N	Fitness	\N	\N	\N
ply299	Will	Tullett	England	1980-08-01 00:00:00	Chelsea FC	\N	Fitness	\N	\N	\N
ply300	James	Melbourne	England	1981-07-22 00:00:00	Chelsea FC	\N	Chief	\N	\N	\N
ply301	Senne	Lammens	Belgium	2002-07-07 00:00:00	Club Brugge KV	91	Goalkeeper	193	70	R
ply302	Simon	Mignolet	Belgium	1988-03-06 00:00:00	Club Brugge KV	22	Goalkeeper	193	88	R
ply303	Nick	Shinton	Belgium	2001-05-10 00:00:00	\N	33	Goalkeeper	194	81	L
ply304	Dedryck	Boyata	Belgium	1990-11-28 00:00:00	Club Brugge KV	28	Defender	188	84	R
ply305	\N	Clinton	Angola	1992-11-07 00:00:00	Club Brugge KV	77	Defender	180	72	R
ply306	Ibe	Hautekiet	Belgium	2002-04-13 00:00:00	Club Brugge KV	\N	Defender	182	71	L
ply307	Brandon	Mechele	Belgium	1993-01-28 00:00:00	Club Brugge KV	44	Defender	190	81	R
ply308	Bjorn	Meijer	Netherlands	2003-03-18 00:00:00	Club Brugge KV	14	Defender	190	\N	L
ply309	Denis	Odoi	Belgium	1988-05-27 00:00:00	Club Brugge KV	6	Defender	178	72	R
ply311	Eduard	Sobol	Ukraine	1995-04-20 00:00:00	Club Brugge KV	2	Defender	186	74	L
ply312	Jorne	Spileers	Belgium	2005-01-21 00:00:00	Club Brugge KV	58	Defender	\N	\N	R
ply313	Abakar	Sylla	Ivory Coast	2002-12-25 00:00:00	Club Brugge KV	94	Defender	\N	\N	L
ply314	Lynnt	Audoor	Belgium	2003-10-13 00:00:00	Club Brugge KV	89	Midfielder	182	\N	R
ply315	Éder	Balanta	Colombia	1993-02-28 00:00:00	Club Brugge KV	3	Midfielder	180	84	L
ply316	Noah	Mbamba-Muanda	Belgium	2005-01-05 00:00:00	Club Brugge KV	72	Midfielder	184	\N	R
ply317	Casper	Nielsen	Denmark	1994-04-29 00:00:00	Club Brugge KV	27	Midfielder	182	71	R
ply318	Raphael	Onyedika	Nigeria	2001-04-19 00:00:00	Club Brugge KV	15	Midfielder	184	\N	R
ply319	Owen	Otasowie	USA	2001-01-06 00:00:00	Club Brugge KV	8	Midfielder	191	82	R
ply320	Mats	Rits	Belgium	1993-07-18 00:00:00	Club Brugge KV	26	Midfielder	178	73	R
ply321	Cisse	Sandra	Belgium	2003-12-16 00:00:00	Club Brugge KV	98	Midfielder	184	74	L
ply322	Hans	Vanaken	Belgium	1992-08-24 00:00:00	Club Brugge KV	20	Midfielder	195	77	R
ply323	Ruud	Vormer	Netherlands	1988-05-11 00:00:00	Club Brugge KV	25	Midfielder	178	77	R
ply324	Tajon	Buchanan	Canada	1999-02-08 00:00:00	Club Brugge KV	17	Forward	183	68	R
ply325	Arne	Engels	Belgium	2003-09-08 00:00:00	Club Brugge KV	94	Forward	185	71	R
ply326	Ferrán	Jutglà	Spain	1999-02-01 00:00:00	Club Brugge KV	9	Forward	175	75	R
ply327	Noa	Lang	Netherlands	1999-06-17 00:00:00	Club Brugge KV	10	Forward	173	70	R
ply328	Cyle	Larin	Canada	1995-04-17 00:00:00	Club Brugge KV	11	Forward	188	86	R
ply329	Antonio	Nusa	Norway	2005-04-17 00:00:00	Club Brugge KV	32	Forward	180	\N	R
ply330	Daniel	Pérez	Venezuela	2002-01-17 00:00:00	Club Brugge KV	30	Forward	190	77	R
ply331	Andreas Skov	Olsen	Denmark	1999-12-29 00:00:00	Club Brugge KV	7	Forward	187	75	L
ply332	Kamal	Sowah	Ghana	2000-01-09 00:00:00	Club Brugge KV	19	Forward	179	66	L
ply333	Roman	Yaremchuk	Ukraine	1995-11-27 00:00:00	Club Brugge KV	70	Forward	191	79	R
ply334	Peter	Mollez	Belgium	1983-09-23 00:00:00	Club Brugge KV	\N	Goalkeeping	183	83	\N
ply335	Denis	Boyko	Ukraine	1988-01-29 00:00:00	Dinamo Kiev	71	Goalkeeper	197	85	R
ply336	Georgiy	Bushchan	Ukraine	1994-05-31 00:00:00	Dinamo Kiev	1	Goalkeeper	196	84	R
ply337	Denys	Ignatenko	Ukraine	2003-01-11 00:00:00	Dinamo Kiev	74	Goalkeeper	\N	\N	\N
ply338	Vladyslav	Kucheruk	Ukraine	1999-02-14 00:00:00	Dinamo Kiev	31	Goalkeeper	191	81	R
ply339	Valentyn	Morgun	Ukraine	2001-08-10 00:00:00	Dinamo Kiev	51	Goalkeeper	189	78	\N
ply340	Ruslan	Neshcheret	Ukraine	2002-01-22 00:00:00	Dinamo Kiev	35	Goalkeeper	190	81	\N
ply341	Anton	Bol	Ukraine	2003-01-08 00:00:00	Dinamo Kiev	3	Defender	187	78	\N
ply342	Mykyta	Burda	Ukraine	1995-03-24 00:00:00	Dinamo Kiev	6	Defender	187	80	R
ply343	Vladyslav	Dubinchak	Ukraine	1998-07-01 00:00:00	Dinamo Kiev	44	Defender	173	62	L
ply344	Tomasz	Kędziora	Poland	1994-06-11 00:00:00	Dinamo Kiev	94	Defender	183	73	R
ply345	Volodymyr	Kostevych	Ukraine	1992-10-23 00:00:00	Dinamo Kiev	21	Defender	174	62	L
ply346	Mykyta	Kravchenko	Ukraine	1997-06-14 00:00:00	Dinamo Kiev	21	Defender	182	77	R
ply347	Denys	Popov	Ukraine	1999-02-17 00:00:00	Dinamo Kiev	4	Defender	185	81	\N
ply348	Oleksandr	Syrota	Ukraine	2000-06-11 00:00:00	Dinamo Kiev	34	Defender	193	78	L
ply349	Oleksandr	Tymchyk	Ukraine	1997-01-20 00:00:00	Dinamo Kiev	24	Defender	180	67	R
ply350	Kostiantyn	Vivcharenko	Ukraine	2002-06-10 00:00:00	Dinamo Kiev	2	Defender	178	76	\N
ply351	Ilya	Zabarnyi	Ukraine	2002-09-01 00:00:00	Dinamo Kiev	25	Defender	186	81	R
ply352	Oleksandr	Andriyevskyi	Ukraine	1994-06-25 00:00:00	Dinamo Kiev	18	Midfielder	179	75	L
ply353	Vitaliy	Buyalskyi	Ukraine	1993-01-06 00:00:00	Dinamo Kiev	29	Midfielder	170	61	R
ply354	Samba	Diallo	Senegal	2003-01-05 00:00:00	Dinamo Kiev	\N	Midfielder	163	\N	L
ply355	Denys	Garmash	Ukraine	1990-04-19 00:00:00	Dinamo Kiev	19	Midfielder	186	72	R
ply356	Mohammed	Kadiri	Ghana	1996-03-07 00:00:00	Dinamo Kiev	\N	Midfielder	186	75	R
ply357	Oleksandr	Karavayev	Ukraine	1992-06-02 00:00:00	Dinamo Kiev	20	Midfielder	175	71	R
ply358	Justin	Lonwijk	Netherlands	1999-12-21 00:00:00	Dinamo Kiev	22	Midfielder	189	\N	R
ply359	Yaroslav	Nadolskyi	Ukraine	2001-03-01 00:00:00	Dinamo Kiev	\N	Midfielder	179	72	L
ply360	Mykola	Shaparenko	Ukraine	1998-10-04 00:00:00	Dinamo Kiev	10	Midfielder	178	72	R
ply361	Volodymyr	Shepelyev	Ukraine	1997-06-01 00:00:00	Dinamo Kiev	8	Midfielder	184	73	R
ply362	Sergiy	Sydorchuk	Ukraine	1991-05-02 00:00:00	Dinamo Kiev	5	Midfielder	189	80	R
ply363	Anton	Tsarenko	Ukraine	2004-06-17 00:00:00	Dinamo Kiev	37	Midfielder	162	58	\N
ply364	Viktor	Tsygankov	Ukraine	1997-11-15 00:00:00	Dinamo Kiev	15	Midfielder	178	72	L
ply365	Oleksandr	Yatsyk	Ukraine	2003-01-03 00:00:00	Dinamo Kiev	14	Midfielder	182	70	\N
ply366	\N	Benito	Nigeria	1998-09-07 00:00:00	Dinamo Kiev	\N	Forward	179	80	R
ply367	Artem	Besedin	Ukraine	1996-03-31 00:00:00	Dinamo Kiev	41	Forward	185	76	R
ply368	Vladyslav	Kabaev	Ukraine	1995-09-01 00:00:00	Dinamo Kiev	7	Forward	176	63	R
ply369	Vladyslav	Kulach	Ukraine	1993-05-07 00:00:00	Dinamo Kiev	28	Forward	178	74	R
ply370	Kaheem	Parris	Jamaica	2000-01-06 00:00:00	Dinamo Kiev	9	Forward	184	\N	L
ply371	Vladyslav	Supryaga	Ukraine	2000-02-15 00:00:00	Dinamo Kiev	17	Forward	185	75	R
ply372	Vladyslav	Vanat	Ukraine	2002-01-04 00:00:00	Dinamo Kiev	11	Forward	182	69	L
ply373	Arnau	Tenas	Spain	2001-05-30 00:00:00	\N	1	Goalkeeper	185	85	R
ply374	Iñaki	Peña	Spain	1999-03-02 00:00:00	FC Barcelona	26	Goalkeeper	184	78	R
ply375	Marc-André ter	Stegen	Germany	1992-04-30 00:00:00	FC Barcelona	1	Goalkeeper	187	85	R
ply376	Álex	Baldé	Spain	2003-10-18 00:00:00	FC Barcelona	28	Defender	175	69	L
ply377	Ronald	Araújo	Uruguay	1999-03-07 00:00:00	FC Barcelona	4	Defender	188	79	R
ply378	Andreas	Christensen	Denmark	1996-04-10 00:00:00	FC Barcelona	15	Defender	187	78	R
ply379	Eric	García	Spain	2001-01-09 00:00:00	FC Barcelona	24	Defender	182	76	R
ply380	Héctor	Bellerín	Spain	1995-03-19 00:00:00	FC Barcelona	2	Defender	177	74	R
ply381	Jordi	Alba	Spain	1989-03-21 00:00:00	FC Barcelona	18	Defender	170	68	L
ply382	Jules	Koundé	France	1998-11-12 00:00:00	FC Barcelona	23	Defender	178	70	R
ply383	Marcos	Alonso	Spain	1990-12-28 00:00:00	FC Barcelona	17	Defender	188	85	L
ply384	\N	Piqué	Spain	1987-02-02 00:00:00	FC Barcelona	3	Defender	194	85	R
ply385	\N	Busquets	Spain	1988-07-16 00:00:00	FC Barcelona	5	Midfielder	189	76	R
ply386	Frenkie de	Jong	Netherlands	1997-05-12 00:00:00	FC Barcelona	21	Midfielder	180	74	R
ply387	\N	Gavi	Spain	2004-08-05 00:00:00	FC Barcelona	30	Midfielder	173	68	R
ply388	Franck	Kessié	Ivory Coast	1996-12-19 00:00:00	FC Barcelona	19	Midfielder	183	76	R
ply389	Marc	Casadó	Spain	2003-09-14 00:00:00	FC Barcelona	29	Midfielder	172	66	R
ply390	Pablo	Torre	Spain	2003-04-03 00:00:00	\N	18	Midfielder	173	63	R
ply391	\N	Pedri	Spain	2002-11-25 00:00:00	FC Barcelona	8	Midfielder	174	60	R
ply392	Sergi	Roberto	Spain	1992-02-07 00:00:00	FC Barcelona	20	Midfielder	178	68	R
ply393	Ousmane	Dembélé	France	1997-05-15 00:00:00	FC Barcelona	7	Forward	178	67	\N
ply394	Memphis	Depay	Netherlands	1994-02-13 00:00:00	FC Barcelona	14	Forward	176	78	R
ply395	Ansu	Fati	Spain	2002-10-31 00:00:00	FC Barcelona	10	Forward	178	66	R
ply396	Ferrán	Torres	Spain	2000-02-29 00:00:00	FC Barcelona	11	Forward	184	77	R
ply397	Ilias	Akhomach	Spain	2004-04-16 00:00:00	\N	30	Forward	175	70	L
ply398	Robert	Lewandowski	Poland	1988-08-21 00:00:00	FC Barcelona	9	Forward	185	81	R
ply399	\N	Raphinha	Brazil	1996-12-14 00:00:00	FC Barcelona	22	Forward	175	68	L
ply400	Iván	Torres	Spain	1978-05-26 00:00:00	FC Barcelona	\N	Fitness	\N	\N	\N
ply401	Cláudio	Ramos	Portugal	1991-11-16 00:00:00	FC Porto	14	Goalkeeper	183	83	R
ply402	Diogo	Costa	Portugal	1999-09-19 00:00:00	FC Porto	99	Goalkeeper	186	80	R
ply403	\N	Samuel	Brazil	1994-03-29 00:00:00	FC Porto	\N	Goalkeeper	188	80	R
ply404	David	Carmo	Portugal	1999-07-19 00:00:00	FC Porto	4	Defender	196	89	L
ply405	Fábio	Cardoso	Portugal	1994-04-19 00:00:00	FC Porto	2	Defender	187	79	R
ply406	\N	Hulk	Brazil	1999-04-30 00:00:00	FC Porto	75	Defender	179	75	L
ply407	João	Marcelo	Brazil	2000-06-13 00:00:00	\N	43	Defender	189	82	R
ply408	João	Mário	Portugal	2000-01-03 00:00:00	FC Porto	23	Defender	179	66	\N
ply409	João	Mendes	Portugal	2000-04-13 00:00:00	FC Porto	55	Defender	179	66	L
ply410	\N	Marcano	Spain	1987-06-23 00:00:00	FC Porto	5	Defender	189	79	L
ply411	\N	Pepe	Portugal	1983-02-26 00:00:00	FC Porto	3	Defender	187	81	R
ply412	Romain	Correia	Portugal	1999-09-06 00:00:00	FC Porto	44	Defender	187	78	R
ply413	Zaidu	Sanusi	Nigeria	1997-06-13 00:00:00	FC Porto	12	Defender	182	71	L
ply414	\N	Wendell	Brazil	1993-07-20 00:00:00	FC Porto	22	Defender	178	72	L
ply415	Wilson	Manafá	Portugal	1994-07-23 00:00:00	FC Porto	18	Defender	177	69	R
ply416	Zé	Pedro	Portugal	1997-06-06 00:00:00	FC Porto	97	Defender	187	75	R
ply417	André	Franco	Portugal	1998-04-12 00:00:00	FC Porto	20	Midfielder	177	70	L
ply418	Bernardo	Folha	Portugal	2002-03-23 00:00:00	\N	87	Midfielder	177	73	R
ply419	Bruno	Costa	Portugal	1997-04-19 00:00:00	FC Porto	28	Midfielder	174	65	R
ply420	Stephen	Eustáquio	Canada	1996-12-21 00:00:00	FC Porto	46	Midfielder	177	68	R
ply421	Marko	Grujić	Serbia	1996-04-13 00:00:00	FC Porto	16	Midfielder	191	86	R
ply422	\N	Otávio	Brazil	1995-02-09 00:00:00	FC Porto	25	Midfielder	172	71	R
ply423	\N	Pepê	Brazil	1997-02-24 00:00:00	FC Porto	11	Midfielder	175	68	R
ply424	Mateus	Uribe	Colombia	1991-03-21 00:00:00	FC Porto	8	Midfielder	182	76	R
ply425	\N	Evanilson	Brazil	1999-10-06 00:00:00	FC Porto	30	Forward	180	80	\N
ply426	Fernando	Andrade	Brazil	1993-01-08 00:00:00	FC Porto	38	Forward	182	79	R
ply427	Gabriel	Veron	Brazil	2002-09-03 00:00:00	FC Porto	7	Forward	176	75	R
ply428	\N	Galeno	Brazil	1997-10-21 00:00:00	FC Porto	13	Forward	179	65	R
ply429	Gonçalo	Borges	Portugal	2001-03-29 00:00:00	FC Porto	70	Forward	184	76	R
ply430	Danny	Loader	England	2000-08-28 00:00:00	FC Porto	19	Forward	182	74	R
ply431	Rodrigo	Conceição	Portugal	2000-01-02 00:00:00	FC Porto	17	Forward	175	65	R
ply432	Mehdi	Taremi	Iran	1992-07-18 00:00:00	FC Porto	9	Forward	187	82	R
ply433	Toni	Martínez	Spain	1997-06-30 00:00:00	FC Porto	29	Forward	187	84	R
ply434	Vedran	Runje	Croatia	1976-02-10 00:00:00	FC Porto	\N	Goalkeeping	184	85	R
ply435	Razak	Abalora	Ghana	1996-09-04 00:00:00	FC Sheriff	40	Goalkeeper	194	\N	R
ply436	Dumitru	Celeadnic	Moldova	1992-04-23 00:00:00	FC Sheriff	1	Goalkeeper	192	87	L
ply437	Roman	Dumenco	Moldova	2004-07-30 00:00:00	FC Sheriff	25	Goalkeeper	185	\N	\N
ply438	Maksim	Koval	Ukraine	1992-12-09 00:00:00	FC Sheriff	35	Goalkeeper	188	87	R
ply439	Serghei	Paşcenco	Moldova	1982-12-18 00:00:00	FC Sheriff	33	Goalkeeper	185	70	R
ply440	Serafim	Cojocari	Moldova	2001-01-07 00:00:00	FC Sheriff	19	Defender	180	\N	\N
ply441	Stefanos	Evangelou	Greece	1998-05-12 00:00:00	FC Sheriff	41	Defender	185	75	R
ply442	Adrian	Hatman	Moldova	2003-01-05 00:00:00	FC Sheriff	\N	Defender	\N	\N	\N
ply443	\N	Heron	Brazil	2000-08-17 00:00:00	FC Sheriff	4	Defender	186	\N	L
ply444	Danila	Ignatov	Moldova	2001-06-19 00:00:00	FC Sheriff	29	Defender	190	\N	\N
ply445	Keston	Julien	Trinidad & Tobago	1998-10-26 00:00:00	FC Sheriff	16	Defender	181	79	L
ply446	Gaby	Kiki	Cameroon	1995-02-15 00:00:00	FC Sheriff	15	Defender	194	81	R
ply447	Patrick	Kpozo	Ghana	1997-07-15 00:00:00	FC Sheriff	2	Defender	180	77	L
ply448	Stjepan	Radeljić	Bosnia-Herzegovina	1997-09-05 00:00:00	FC Sheriff	6	Defender	198	84	L
ply449	Renan	Guedes	Brazil	1998-01-19 00:00:00	FC Sheriff	42	Defender	177	69	R
ply450	Armel	Zohouri	Ivory Coast	2001-04-05 00:00:00	FC Sheriff	20	Defender	176	69	R
ply451	Edmund	Addo	Ghana	2000-05-17 00:00:00	FC Sheriff	21	Midfielder	178	76	R
ply452	Steve	Ambri	Guinea-Bissau	1997-08-12 00:00:00	FC Sheriff	70	Midfielder	178	71	L
ply453	Cédric	Badolo	Burkina Faso	1998-11-04 00:00:00	FC Sheriff	10	Midfielder	172	68	R
ply454	Giannis	Botos	Greece	2000-12-20 00:00:00	FC Sheriff	30	Midfielder	172	69	R
ply455	Mouhamed	Diop	Senegal	2000-09-30 00:00:00	\N	28	Midfielder	182	\N	R
ply456	Eugeniu	Gliga	Moldova	2001-01-30 00:00:00	FC Sheriff	24	Midfielder	171	\N	\N
ply457	Moussa	Kyabou	Mali	1998-04-18 00:00:00	FC Sheriff	18	Midfielder	180	\N	R
ply458	Regi	Lushkja	Albania	1996-05-17 00:00:00	FC Sheriff	22	Midfielder	184	\N	R
ply459	Abdoul	Moumouni	Niger	2002-08-07 00:00:00	FC Sheriff	12	Midfielder	185	77	\N
ply460	Charles	Petro	Malawi	2001-02-08 00:00:00	FC Sheriff	3	Midfielder	173	\N	R
ply461	Mudasiru	Salifu	Ghana	1997-04-01 00:00:00	FC Sheriff	17	Midfielder	177	\N	\N
ply462	Danil	Ankudinov	Kazakhstan	2003-07-31 00:00:00	FC Sheriff	23	Forward	188	\N	\N
ply463	Iyayi	Atiemwen	Nigeria	1996-01-24 00:00:00	FC Sheriff	80	Forward	180	76	R
ply464	Felipe	Vizeu	Brazil	1997-03-12 00:00:00	FC Sheriff	11	Forward	184	83	L
ply465	Abou	Ouattara	Burkina Faso	1999-12-26 00:00:00	FC Sheriff	7	Forward	177	70	R
ply466	\N	Pernambuco	Brazil	1998-04-28 00:00:00	FC Sheriff	28	Forward	187	77	L
ply467	Ibrahim	Rasheed	Nigeria	1999-05-09 00:00:00	FC Sheriff	61	Forward	186	\N	\N
ply468	Kay	Tejan	Netherlands	1997-02-03 00:00:00	FC Sheriff	9	Forward	180	\N	L
ply469	Nikolaos	Botis	Greece	2004-03-31 00:00:00	Inter	40	Goalkeeper	191	\N	\N
ply470	Alex	Cordaz	Italy	1983-01-01 00:00:00	Inter	21	Goalkeeper	188	83	R
ply471	Gabriel	Brazão	Brazil	2000-10-05 00:00:00	Inter	\N	Goalkeeper	192	75	R
ply472	Samir	Handanovič	Slovenia	1984-07-14 00:00:00	Inter	1	Goalkeeper	193	82	R
ply473	André	Onana	Cameroon	1996-04-02 00:00:00	Inter	24	Goalkeeper	190	93	R
ply474	Francesco	Acerbi	Italy	1988-02-10 00:00:00	Inter	15	Defender	192	90	L
ply475	Alessandro	Bastoni	Italy	1999-04-13 00:00:00	Inter	95	Defender	190	75	L
ply476	Raoul	Bellanova	Italy	2000-05-17 00:00:00	Inter	12	Defender	188	78	R
ply477	Danilo	D'Ambrosio	Italy	1988-09-09 00:00:00	Inter	33	Defender	180	75	R
ply478	\N	Dalbert	Brazil	1993-09-08 00:00:00	Inter	\N	Defender	182	70	L
ply479	Matteo	Darmian	Italy	1989-12-02 00:00:00	Inter	36	Defender	182	70	R
ply480	Stefan de	Vrij	Netherlands	1992-02-05 00:00:00	Inter	6	Defender	189	78	R
ply481	Federico	Dimarco	Italy	1997-11-10 00:00:00	Inter	32	Defender	175	75	L
ply482	Denzel	Dumfries	Netherlands	1996-04-18 00:00:00	Inter	2	Defender	189	81	R
ply483	Alessandro	Fontanarosa	Italy	2003-02-07 00:00:00	Inter	47	Defender	\N	\N	\N
ply484	Milan	Škriniar	Slovakia	1995-02-11 00:00:00	Inter	37	Defender	188	82	R
ply485	Mattia	Zanotti	Italy	2003-01-11 00:00:00	Inter	46	Defender	177	65	R
ply486	Kristjan	Asllani	Albania	2002-03-09 00:00:00	Inter	14	Midfielder	175	68	R
ply487	Nicolò	Barella	Italy	1997-02-07 00:00:00	Inter	23	Midfielder	172	68	R
ply488	Marcelo	Brozović	Croatia	1992-11-16 00:00:00	Inter	77	Midfielder	181	68	\N
ply489	Hakan	Çalhanoğlu	Turkey	1994-02-08 00:00:00	Inter	20	Midfielder	178	76	R
ply490	Valentin	Carboni	Italy	2005-03-05 00:00:00	Inter	45	Midfielder	\N	\N	L
ply491	Roberto	Gagliardini	Italy	1994-04-07 00:00:00	Inter	5	Midfielder	188	77	R
ply492	Jacopo	Gianelli	Italy	2001-03-04 00:00:00	Inter	\N	Midfielder	184	73	R
ply493	Robin	Gosens	Germany	1994-07-05 00:00:00	Inter	8	Midfielder	184	76	L
ply494	Henrikh	Mkhitaryan	Armenia	1989-01-21 00:00:00	Inter	22	Midfielder	178	75	\N
ply495	Aleksandar	Stanković	Serbia	2005-08-03 00:00:00	Inter	50	Midfielder	\N	\N	R
ply496	Joaquín	Correa	Argentina	1994-08-13 00:00:00	Inter	11	Forward	188	75	R
ply497	Edin	Džeko	Bosnia-Herzegovina	1986-03-17 00:00:00	Inter	9	Forward	193	80	R
ply498	Romelu	Lukaku	Belgium	1993-05-13 00:00:00	Inter	90	Forward	192	93	L
ply499	Lautaro	Martínez	Argentina	1997-08-22 00:00:00	Inter	10	Forward	174	72	R
ply500	Adriano	Bonaiuti	Italy	1967-05-07 00:00:00	Inter	\N	Goalkeeping	181	74	R
ply501	Giovanni	Garofani	Italy	2002-10-20 00:00:00	Juventus	41	Goalkeeper	188	79	R
ply502	Mattia	Perin	Italy	1992-11-10 00:00:00	Juventus	36	Goalkeeper	188	77	R
ply503	Carlo	Pinsoglio	Italy	1990-03-16 00:00:00	Juventus	23	Goalkeeper	194	85	L
ply504	Wojciech	Szczęsny	Poland	1990-04-18 00:00:00	Juventus	1	Goalkeeper	195	90	R
ply505	Alex	Sandro	Brazil	1991-01-26 00:00:00	Juventus	12	Defender	180	80	L
ply506	Tommaso	Barbieri	Italy	2002-08-26 00:00:00	\N	26	Defender	181	\N	R
ply507	Leonardo	Bonucci	Italy	1987-05-01 00:00:00	Juventus	19	Defender	190	85	R
ply508	\N	Bremer	Brazil	1997-03-18 00:00:00	Juventus	3	Defender	188	82	R
ply509	Juan	Cuadrado	Colombia	1988-05-26 00:00:00	Juventus	11	Defender	176	66	R
ply855	Papu	Gómez	Argentina	1988-02-15 00:00:00	Sevilla FC	24	Midfielder	167	68	R
ply856	Nemanja	Gudelj	Serbia	1991-11-16 00:00:00	Sevilla FC	6	Midfielder	187	81	R
ply857	\N	Isco	Spain	1992-04-21 00:00:00	Sevilla FC	22	Midfielder	176	79	R
ply858	Adnan	Januzaj	Belgium	1995-02-05 00:00:00	Sevilla FC	11	Midfielder	186	75	L
ply859	Joan	Jordán	Spain	1994-07-06 00:00:00	Sevilla FC	8	Midfielder	183	74	R
ply860	Nacho	Quintana	Spain	2001-02-23 00:00:00	Sevilla FC	43	Midfielder	178	75	R
ply861	Óliver	Torres	Spain	1994-11-10 00:00:00	Sevilla FC	21	Midfielder	175	68	R
ply862	Pedro	Ortiz	Spain	2000-08-19 00:00:00	\N	14	Midfielder	184	76	L
ply863	Ivan	Rakitić	Croatia	1988-03-10 00:00:00	Sevilla FC	10	Midfielder	184	78	R
ply864	Jesús	Corona	Mexico	1993-01-06 00:00:00	Sevilla FC	9	Forward	173	66	\N
ply865	Kasper	Dolberg	Denmark	1997-10-06 00:00:00	Sevilla FC	5	Forward	187	83	R
ply866	Youssef	En-Nesyri	Morocco	1997-06-01 00:00:00	Sevilla FC	15	Forward	188	73	L
ply867	Érik	Lamela	Argentina	1992-03-04 00:00:00	Sevilla FC	17	Forward	181	80	L
ply868	Rafa	Mir	Spain	1997-06-18 00:00:00	Sevilla FC	12	Forward	191	75	R
ply869	\N	Suso	Spain	1993-11-19 00:00:00	Sevilla FC	7	Forward	176	70	L
ply870	José Luis	Silva	Spain	1979-09-15 00:00:00	Sevilla FC	\N	Goalkeeping	\N	\N	\N
ply871	Juanvi	Peinado	Spain	1973-06-26 00:00:00	Sevilla FC	\N	Technique	\N	\N	\N
ply872	Andriy	Pyatov	Ukraine	1984-06-28 00:00:00	Shakhtar Donetsk	30	Goalkeeper	190	90	R
ply873	Oleksiy	Shevchenko	Ukraine	1992-02-24 00:00:00	Shakhtar Donetsk	1	Goalkeeper	188	81	R
ply874	Anatoliy	Trubin	Ukraine	2001-08-01 00:00:00	Shakhtar Donetsk	81	Goalkeeper	199	86	R
ply875	Valeriy	Bondar	Ukraine	1999-02-27 00:00:00	Shakhtar Donetsk	5	Defender	172	73	R
ply876	Marian	Farina	Ukraine	2003-08-28 00:00:00	Shakhtar Donetsk	28	Defender	\N	\N	\N
ply877	Yukhym	Konoplya	Ukraine	1999-08-26 00:00:00	Shakhtar Donetsk	26	Defender	180	74	R
ply878	Viktor	Kornienko	Ukraine	1999-02-14 00:00:00	Shakhtar Donetsk	99	Defender	175	70	L
ply879	Eduard	Kozik	Ukraine	2003-04-19 00:00:00	Shakhtar Donetsk	32	Defender	\N	\N	\N
ply880	Sergiy	Kryvtsov	Ukraine	1991-03-15 00:00:00	Shakhtar Donetsk	4	Defender	186	83	R
ply881	Lucas	Taylor	Brazil	1995-04-10 00:00:00	Shakhtar Donetsk	23	Defender	177	70	R
ply882	Mykola	Matvienko	Ukraine	1996-05-02 00:00:00	Shakhtar Donetsk	22	Defender	182	74	L
ply883	Bogdan	Mykhaylychenko	Ukraine	1997-03-21 00:00:00	Shakhtar Donetsk	15	Defender	179	73	L
ply884	Artem	Bondarenko	Ukraine	2000-08-21 00:00:00	Shakhtar Donetsk	21	Midfielder	182	73	L
ply885	Neven	Đurasek	Croatia	1998-08-15 00:00:00	Shakhtar Donetsk	17	Midfielder	180	74	R
ply886	Dmytro	Kryskiv	Ukraine	2000-10-06 00:00:00	Shakhtar Donetsk	16	Midfielder	180	67	R
ply887	Mykhaylo	Mudryk	Ukraine	2001-01-05 00:00:00	Shakhtar Donetsk	10	Midfielder	175	61	R
ply888	Yegor	Nazaryna	Ukraine	1997-07-10 00:00:00	Shakhtar Donetsk	29	Midfielder	183	69	R
ply889	Oleh	Ocheretko	Ukraine	2003-03-25 00:00:00	Shakhtar Donetsk	27	Midfielder	181	75	\N
ply890	Ivan	Petryak	Ukraine	1994-03-13 00:00:00	Shakhtar Donetsk	34	Midfielder	171	63	R
ply891	Taras	Stepanenko	Ukraine	1989-08-08 00:00:00	Shakhtar Donetsk	6	Midfielder	181	76	L
ply892	Georgiy	Sudakov	Ukraine	2002-09-01 00:00:00	Shakhtar Donetsk	8	Midfielder	177	68	\N
ply893	Dmytro	Topalov	Ukraine	1998-03-12 00:00:00	Shakhtar Donetsk	20	Midfielder	176	70	L
ply894	Andriy	Totovytskyy	Ukraine	1993-01-20 00:00:00	Shakhtar Donetsk	7	Midfielder	187	77	R
ply895	Oleksandr	Zubkov	Ukraine	1996-08-03 00:00:00	Shakhtar Donetsk	11	Midfielder	182	78	L
ply896	Danylo	Honcharuk	Ukraine	2002-07-13 00:00:00	Shakhtar Donetsk	\N	Forward	176	\N	R
ply897	Olarenwaju	Kayode	Nigeria	1993-05-08 00:00:00	Shakhtar Donetsk	\N	Forward	176	66	R
ply898	Andriy	Kulakov	Ukraine	1999-04-28 00:00:00	Shakhtar Donetsk	19	Forward	183	73	R
ply899	Marian	Shved	Ukraine	1997-07-16 00:00:00	Shakhtar Donetsk	9	Forward	171	63	L
ply900	Danylo	Sikan	Ukraine	2001-04-16 00:00:00	Shakhtar Donetsk	14	Forward	185	73	R
ply901	Denys	Svitiukha	Ukraine	2002-02-08 00:00:00	Shakhtar Donetsk	\N	Forward	186	\N	L
ply902	Lassina	Traoré	Burkina Faso	2001-01-12 00:00:00	Shakhtar Donetsk	2	Forward	182	90	R
ply903	Giorgio	Bianchi	Italy	1975-12-08 00:00:00	Shakhtar Donetsk	\N	Goalkeeping	185	77	\N
ply904	\N	Hèlton	Brazil	1990-11-02 00:00:00	SL Benfica	77	Goalkeeper	196	92	R
ply905	Leo Brian	Kokubo	Japan	2001-01-23 00:00:00	SL Benfica	45	Goalkeeper	191	84	R
ply906	Odisseas	Vlachodimos	Greece	1994-04-26 00:00:00	SL Benfica	99	Goalkeeper	188	78	R
ply907	Álex	Grimaldo	Spain	1995-09-20 00:00:00	SL Benfica	3	Defender	171	69	L
ply908	André	Almeida	Portugal	1990-09-10 00:00:00	SL Benfica	34	Defender	186	80	R
ply909	António	Silva	Portugal	2003-10-31 00:00:00	SL Benfica	66	Defender	182	\N	R
ply910	Alexander	Bah	Denmark	1997-12-09 00:00:00	SL Benfica	6	Defender	183	76	R
ply911	John Anthony	Brooks	USA	1993-01-28 00:00:00	SL Benfica	25	Defender	193	78	L
ply912	Diogo	Gonçalves	Portugal	1997-02-06 00:00:00	SL Benfica	17	Defender	178	71	R
ply913	Gil	Dias	Portugal	1996-09-28 00:00:00	SL Benfica	31	Defender	183	75	L
ply914	\N	Gilberto	Brazil	1993-03-07 00:00:00	SL Benfica	2	Defender	181	75	R
ply915	João	Victor	Brazil	1998-07-17 00:00:00	SL Benfica	38	Defender	187	\N	R
ply916	Lucas	Veríssimo	Brazil	1995-07-02 00:00:00	SL Benfica	4	Defender	188	84	R
ply917	\N	Morato	Brazil	2001-06-30 00:00:00	SL Benfica	91	Defender	190	88	L
ply918	Nicolás	Otamendi	Argentina	1988-02-12 00:00:00	SL Benfica	30	Defender	183	80	R
ply919	Tomás	Tavares	Portugal	2001-03-07 00:00:00	SL Benfica	\N	Defender	184	73	R
ply920	Fredrik	Aursnes	Norway	1995-12-10 00:00:00	SL Benfica	8	Midfielder	179	71	R
ply921	\N	Chiquinho	Portugal	1995-07-19 00:00:00	SL Benfica	22	Midfielder	174	68	R
ply922	Julian	Draxler	Germany	1993-09-20 00:00:00	SL Benfica	93	Midfielder	185	72	R
ply923	Enzo	Fernández	Argentina	2001-01-17 00:00:00	SL Benfica	13	Midfielder	180	77	R
ply924	\N	Florentino	Portugal	1999-08-19 00:00:00	SL Benfica	61	Midfielder	184	73	R
ply925	João	Mário	Portugal	1993-01-19 00:00:00	SL Benfica	20	Midfielder	179	73	R
ply926	Paulo	Bernardo	Portugal	2002-01-24 00:00:00	SL Benfica	55	Midfielder	184	78	R
ply927	Mihailo	Ristić	Serbia	1995-10-31 00:00:00	SL Benfica	23	Midfielder	180	79	L
ply928	David	Neres	Brazil	1997-03-03 00:00:00	SL Benfica	7	Forward	175	66	L
ply929	Diego	Moreira	Portugal	2004-08-06 00:00:00	SL Benfica	96	Forward	170	\N	L
ply930	Gonçalo	Ramos	Portugal	2001-06-20 00:00:00	SL Benfica	88	Forward	185	79	R
ply931	Henrique	Araújo	Portugal	2002-01-19 00:00:00	SL Benfica	39	Forward	180	69	R
ply932	Petar	Musa	Croatia	1998-03-04 00:00:00	SL Benfica	33	Forward	190	81	R
ply933	Rafa	Silva	Portugal	1993-05-17 00:00:00	SL Benfica	27	Forward	171	66	R
ply934	Rodrigo	Pinho	Brazil	1991-05-30 00:00:00	SL Benfica	18	Forward	185	79	L
ply935	André	Paulo	Portugal	1996-12-18 00:00:00	Sporting CP	22	Goalkeeper	188	79	R
ply936	Antonio	Adán	Spain	1987-05-13 00:00:00	Sporting CP	1	Goalkeeper	190	86	L
ply937	Diego	Calai	Italy	2004-07-18 00:00:00	\N	\N	Goalkeeper	190	90	R
ply938	Franco	Israel	Uruguay	2000-04-22 00:00:00	Sporting CP	12	Goalkeeper	186	79	R
ply939	Jesús	Alcantar	Mexico	2003-07-30 00:00:00	Sporting CP	67	Defender	184	78	\N
ply940	Sebastián	Coates	Uruguay	1990-10-07 00:00:00	Sporting CP	4	Defender	196	92	R
ply941	Flávio	Nazinho	Portugal	2003-07-20 00:00:00	Sporting CP	71	Defender	179	72	L
ply942	Gonçalo	Inácio	Portugal	2001-08-25 00:00:00	Sporting CP	25	Defender	186	77	L
ply943	José	Marsà	Spain	2002-03-04 00:00:00	Sporting CP	63	Defender	185	80	L
ply944	Matheus	Reis	Brazil	1995-02-18 00:00:00	Sporting CP	2	Defender	183	77	L
ply945	\N	Neto	Portugal	1988-05-26 00:00:00	Sporting CP	13	Defender	187	71	R
ply946	Pedro	Porro	Spain	1999-09-13 00:00:00	Sporting CP	24	Defender	176	71	R
ply947	Ricardo	Esgaio	Portugal	1993-05-16 00:00:00	Sporting CP	47	Defender	173	68	R
ply948	Jerry St.	Juste	Netherlands	1996-10-19 00:00:00	Sporting CP	3	Defender	184	74	R
ply949	Sotirios	Alexandropoulos	Greece	2001-11-26 00:00:00	Sporting CP	6	Midfielder	179	\N	\N
ply950	Daniel	Bragança	Portugal	1999-05-27 00:00:00	Sporting CP	68	Midfielder	169	60	L
ply951	Dário	Essugo	Portugal	2005-03-14 00:00:00	Sporting CP	84	Midfielder	179	76	R
ply952	Eduardo	Henrique	Brazil	1995-05-17 00:00:00	Sporting CP	\N	Midfielder	186	73	R
ply953	Abdul	Issahaku	Ghana	2004-03-08 00:00:00	Sporting CP	18	Midfielder	177	\N	L
ply954	Mateus	Fernandes	Portugal	2004-07-10 00:00:00	Sporting CP	82	Midfielder	\N	\N	\N
ply955	Hidemasa	Morita	Japan	1995-05-10 00:00:00	Sporting CP	5	Midfielder	177	75	R
ply956	Manuel	Ugarte	Uruguay	2001-04-11 00:00:00	Sporting CP	15	Midfielder	182	73	R
ply957	Arthur	Gomes	Brazil	1998-07-03 00:00:00	Sporting CP	33	Forward	174	68	R
ply958	Marcus	Edwards	England	1998-12-03 00:00:00	Sporting CP	10	Forward	168	65	L
ply959	Jovane	Cabral	Cape Verde	1998-06-14 00:00:00	Sporting CP	\N	Forward	176	72	R
ply960	Nuno	Santos	Portugal	1995-02-13 00:00:00	Sporting CP	11	Forward	176	73	L
ply961	\N	Paulinho	Portugal	1992-11-09 00:00:00	Sporting CP	20	Forward	188	82	L
ply962	Pedro	Gonçalves	Portugal	1998-06-28 00:00:00	Sporting CP	28	Forward	173	65	R
ply963	\N	Rochinha	Portugal	1995-05-03 00:00:00	Sporting CP	16	Forward	169	68	R
ply964	Rodrigo	Ribeiro	Portugal	2005-04-28 00:00:00	Sporting CP	91	Forward	185	\N	R
ply965	Tiago	Ferreira	Portugal	2002-03-18 00:00:00	Sporting CP	59	Forward	174	64	L
ply966	\N	Trincão	Portugal	1999-12-29 00:00:00	Sporting CP	17	Forward	183	77	L
ply967	Koen	Casteels	Belgium	1992-06-25 00:00:00	VfL Wolfsburg	1	Goalkeeper	197	78	L
ply968	Niklas	Klinger	Germany	1995-10-13 00:00:00	VfL Wolfsburg	30	Goalkeeper	187	85	R
ply969	Pavao	Pervan	Austria	1987-11-13 00:00:00	VfL Wolfsburg	12	Goalkeeper	194	88	R
ply970	Philipp	Schulze	Germany	2003-01-29 00:00:00	VfL Wolfsburg	35	Goalkeeper	189	82	\N
ply971	Ridle	Baku	Germany	1998-04-08 00:00:00	VfL Wolfsburg	20	Defender	176	72	R
ply972	Sebastiaan	Bornauw	Belgium	1999-03-22 00:00:00	VfL Wolfsburg	3	Defender	191	81	R
ply973	Kilian	Fischer	Germany	2000-10-12 00:00:00	VfL Wolfsburg	2	Defender	182	77	\N
ply974	Maxence	Lacroix	France	2000-04-06 00:00:00	VfL Wolfsburg	4	Defender	190	88	R
ply975	Paulo	Otávio	Brazil	1994-11-23 00:00:00	VfL Wolfsburg	6	Defender	173	68	L
ply976	Jérôme	Roussillon	France	1993-01-06 00:00:00	VfL Wolfsburg	15	Defender	175	80	L
ply977	Micky van de	Ven	Netherlands	2001-04-19 00:00:00	VfL Wolfsburg	5	Defender	193	81	L
ply978	Maximilian	Arnold	Germany	1994-05-27 00:00:00	VfL Wolfsburg	27	Midfielder	184	74	L
ply979	Bartol	Franjić	Croatia	2000-01-14 00:00:00	VfL Wolfsburg	38	Midfielder	188	77	L
ply980	Yannick	Gerhardt	Germany	1994-03-13 00:00:00	VfL Wolfsburg	31	Midfielder	184	81	L
ply981	Josuha	Guilavogui	France	1990-09-19 00:00:00	VfL Wolfsburg	29	Midfielder	188	77	R
ply982	Felix	Nmecha	Germany	2000-10-10 00:00:00	VfL Wolfsburg	22	Midfielder	188	74	R
ply983	Kevin	Paredes	USA	2003-05-07 00:00:00	VfL Wolfsburg	40	Midfielder	175	61	L
ply984	Maximilian	Philipp	Germany	1994-03-01 00:00:00	VfL Wolfsburg	17	Midfielder	183	79	R
ply985	Mattias	Svanberg	Sweden	1999-01-05 00:00:00	VfL Wolfsburg	32	Midfielder	185	77	R
ply986	Patrick	Wimmer	Austria	2001-05-30 00:00:00	VfL Wolfsburg	39	Midfielder	182	77	\N
ply987	Josip	Brekalo	Croatia	1998-06-23 00:00:00	VfL Wolfsburg	14	Forward	175	70	R
ply988	Jakub	Kamiński	Poland	2002-06-05 00:00:00	VfL Wolfsburg	16	Forward	179	64	R
ply989	Max	Kruse	Germany	1988-03-19 00:00:00	VfL Wolfsburg	9	Forward	180	76	L
ply990	Omar	Marmoush	Egypt	1999-02-07 00:00:00	VfL Wolfsburg	33	Forward	183	81	R
ply991	Lukas	Nmecha	Germany	1998-12-14 00:00:00	VfL Wolfsburg	10	Forward	185	80	R
ply992	Dženan	Pejčinović	Germany	2005-02-15 00:00:00	VfL Wolfsburg	18	Forward	188	\N	L
ply993	Luca	Waldschmidt	Germany	1996-05-19 00:00:00	VfL Wolfsburg	7	Forward	181	75	L
ply994	Jonas	Wind	Denmark	1999-02-07 00:00:00	VfL Wolfsburg	23	Forward	190	82	R
ply995	Pascal	Formann	Germany	1982-11-16 00:00:00	VfL Wolfsburg	\N	Goalkeeping	188	75	\N
ply996	Christoph	Tebel	Germany	1988-06-13 00:00:00	VfL Wolfsburg	\N	Athletic	\N	\N	\N
ply997	Michele	Putaro	Germany	1974-02-25 00:00:00	VfL Wolfsburg	\N	Rehab	176	\N	\N
ply998	Alexander	Klitzpera	Germany	1977-10-19 00:00:00	VfL Wolfsburg	\N	Game	184	79	R
ply999	Tim	Cezanne	Germany	1989-08-15 00:00:00	VfL Wolfsburg	\N	Video	\N	\N	\N
ply1000	Martin	Raschick	Germany	1990-07-08 00:00:00	VfL Wolfsburg	\N	Video	\N	\N	\N
ply1001	Aaron	Briggs	England	1987-06-27 00:00:00	VfL Wolfsburg	\N	Chief	\N	\N	\N
ply1002	Iker	Álvarez	Andorra	2001-07-25 00:00:00	\N	13	Goalkeeper	190	77	R
ply1003	Filip	Jörgensen	Denmark	2002-04-16 00:00:00	\N	1	Goalkeeper	190	82	R
ply1004	Pepe	Reina	Spain	1982-08-31 00:00:00	Villarreal CF	1	Goalkeeper	188	92	R
ply1005	Gerónimo	Rulli	Argentina	1992-05-20 00:00:00	Villarreal CF	13	Goalkeeper	189	84	R
ply1006	Alberto	Moreno	Spain	1992-07-05 00:00:00	Villarreal CF	18	Defender	171	65	L
ply1007	Dani	Tasende	Spain	2000-07-06 00:00:00	Villarreal CF	36	Defender	163	\N	L
ply1008	De la	Fuente	Spain	1999-02-26 00:00:00	Villarreal CF	37	Defender	179	76	R
ply1009	Juan	Foyth	Argentina	1998-01-12 00:00:00	Villarreal CF	8	Defender	187	69	R
ply1010	Jorge	Cuenca	Spain	1999-11-17 00:00:00	Villarreal CF	5	Defender	190	75	L
ply1011	Kiko	Femenía	Spain	1991-02-02 00:00:00	Villarreal CF	2	Defender	171	61	R
ply1012	Aïssa	Mandi	Algeria	1991-10-22 00:00:00	Villarreal CF	23	Defender	184	78	R
ply1013	Johan	Mojica	Colombia	1992-08-21 00:00:00	Villarreal CF	12	Defender	185	66	L
ply1014	Pau	Torres	Spain	1997-01-16 00:00:00	Villarreal CF	4	Defender	191	80	L
ply1015	\N	Pedraza	Spain	1996-04-09 00:00:00	Villarreal CF	24	Defender	184	73	L
ply1016	Raúl	Albiol	Spain	1985-09-04 00:00:00	Villarreal CF	3	Defender	190	82	R
ply1017	Étienne	Capoue	France	1988-07-11 00:00:00	Villarreal CF	6	Midfielder	189	80	R
ply1018	Carlo	García	Spain	2001-02-12 00:00:00	Villarreal CF	28	Midfielder	182	75	R
ply1019	Francis	Coquelin	France	1991-05-13 00:00:00	Villarreal CF	19	Midfielder	177	73	R
ply1020	Dani	Parejo	Spain	1989-04-16 00:00:00	Villarreal CF	10	Midfielder	182	74	R
ply1021	Giovani Lo	Celso	Argentina	1996-04-09 00:00:00	Villarreal CF	17	Midfielder	177	68	L
ply1022	Manu	Morlanes	Spain	1999-01-12 00:00:00	Villarreal CF	20	Midfielder	178	75	R
ply1023	\N	Pacheco	Spain	2002-01-03 00:00:00	\N	20	Midfielder	170	\N	\N
ply1024	Rodrigo	Alonso	Spain	2003-01-04 00:00:00	Villarreal CF	40	Midfielder	\N	\N	\N
ply1025	\N	Trigueros	Spain	1991-10-17 00:00:00	Villarreal CF	14	Midfielder	178	75	R
ply1849	Percy	Tau	South Africa	1994-05-13 00:00:00	\N	23	Forward	175	70	L
ply1850	Colin	Dagba	France	1998-09-09 00:00:00	\N	2	Defender	170	62	R
ply1851	Adem	Büyük	Turkey	1987-08-30 00:00:00	\N	99	Forward	177	70	R
ply1852	Ömer	Bayram	Turkey	1991-07-27 00:00:00	\N	\N	Defender	175	70	L
ply1853	Krépin	Diatta	Senegal	1999-02-25 00:00:00	\N	27	Forward	175	68	R
ply1854	Daniel	Podence	Portugal	1995-10-21 00:00:00	\N	10	Forward	165	62	R
ply1855	Rúben	Semedo	Portugal	1994-04-04 00:00:00	\N	35	Defender	189	84	R
ply1856	Miloš	Vulić	Serbia	1996-08-19 00:00:00	\N	7	Midfielder	183	74	R
ply1857	Richmond	Boakye	Ghana	1993-01-28 00:00:00	\N	\N	Forward	186	81	R
ply1858	\N	Guilherme	Brazil	1991-04-05 00:00:00	\N	18	Midfielder	178	77	R
ply1859	Marin	Leovac	Croatia	1988-08-07 00:00:00	\N	4	Defender	180	71	L
ply1860	Petar	Stojanović	Slovenia	1995-10-07 00:00:00	\N	30	Defender	178	72	R
ply1861	Júnior	Moraes	Ukraine	1987-04-04 00:00:00	\N	18	Forward	176	70	R
ply1862	\N	Dodô	Brazil	1998-11-17 00:00:00	\N	2	Defender	166	68	R
ply1863	Yevgen	Konoplyanka	Ukraine	1989-09-29 00:00:00	\N	10	Forward	178	72	R
ply1864	\N	Marlos	Ukraine	1988-06-07 00:00:00	\N	10	Midfielder	174	69	L
ply1865	Mario	Gavranović	Switzerland	1989-11-24 00:00:00	\N	19	Forward	175	76	R
ply1866	Viktor	Kovalenko	Ukraine	1996-02-14 00:00:00	\N	24	Midfielder	182	75	R
ply1867	Timothy	Castagne	Belgium	1995-12-05 00:00:00	\N	27	Defender	185	80	R
ply1868	Damian	Kądzior	Poland	1992-06-16 00:00:00	\N	92	Forward	174	70	L
ply1869	Gonzalo	Higuaín	Argentina	1987-12-10 00:00:00	\N	10	Forward	186	85	\N
ply1870	Blaise	Matuidi	France	1987-04-09 00:00:00	\N	8	Midfielder	175	75	L
ply1871	Kieran	Trippier	England	1990-09-19 00:00:00	\N	2	Defender	173	69	R
ply1872	Grzegorz	Krychowiak	Poland	1990-01-29 00:00:00	\N	23	Arabia	187	83	R
ply1873	Thomas	Partey	Ghana	1993-06-13 00:00:00	\N	5	Midfielder	185	77	R
ply1874	Diego	Costa	Spain	1988-10-07 00:00:00	\N	29	Forward	188	83	R
ply1875	Aaron	Ramsey	Wales	1990-12-26 00:00:00	\N	16	Midfielder	182	76	\N
ply1876	Kevin	Volland	Germany	1992-07-30 00:00:00	\N	31	Forward	179	85	L
ply1877	José	Callejón	Spain	1987-02-11 00:00:00	\N	9	Forward	178	73	R
ply1878	Takumi	Minamino	Japan	1995-01-16 00:00:00	\N	18	Midfielder	174	68	R
ply1879	Hee-chan	Hwang	South Korea	1996-01-26 00:00:00	\N	11	Forward	177	77	R
ply1880	Jhon	Lucumí	Colombia	1998-06-26 00:00:00	\N	26	Defender	187	84	L
ply1881	Dieumerci	Ndongala	Congo DR	1991-06-14 00:00:00	\N	77	Forward	170	60	R
ply1882	Théo	Bongonda	Belgium	1995-11-20 00:00:00	\N	10	Forward	177	73	L
ply1883	Kévin	Malcuit	France	1991-07-31 00:00:00	\N	\N	Defender	180	76	R
ply1884	Lorenzo	Insigne	Italy	1991-06-04 00:00:00	\N	24	Forward	163	59	R
ply1885	Stephen	Odey	Nigeria	1998-01-15 00:00:00	\N	90	Forward	182	72	R
ply1886	Antonio	Candreva	Italy	1987-02-28 00:00:00	\N	87	Midfielder	180	72	R
ply1887	Diego	Godín	Uruguay	1986-02-16 00:00:00	\N	2	Defender	187	80	R
ply1888	Mario	Götze	Germany	1992-06-03 00:00:00	\N	27	Midfielder	176	75	R
ply1889	Tomáš	Souček	Czech Republic	1995-02-27 00:00:00	\N	28	Midfielder	192	86	R
ply1890	Milan	Škoda	Czech Republic	1986-01-16 00:00:00	\N	21	Republic	190	85	R
ply1891	Carles	Pérez	Spain	1998-02-16 00:00:00	\N	7	Forward	173	75	L
ply1892	Raúl de	Tomás	Spain	1994-10-17 00:00:00	\N	\N	Forward	180	79	R
ply1893	Franco	Cervi	Argentina	1994-05-26 00:00:00	\N	11	Midfielder	165	62	L
ply1894	\N	Pizzi	Portugal	1989-10-06 00:00:00	\N	\N	Emirates	177	72	R
ply1895	Joachim	Andersen	Denmark	1996-05-31 00:00:00	\N	16	Defender	192	90	R
ply1896	Adel	Taarabt	Morocco	1989-05-24 00:00:00	\N	\N	Emirates	178	76	R
ply1897	Carlos	Vinícius	Brazil	1995-03-25 00:00:00	\N	30	Forward	190	83	L
ply1898	Lucas	Tousart	France	1997-04-29 00:00:00	\N	29	Midfielder	185	83	R
ply1899	\N	Rodrigo	Spain	1991-03-06 00:00:00	\N	19	Forward	182	77	L
ply1900	\N	Willian	Brazil	1988-08-09 00:00:00	\N	20	Midfielder	175	75	R
ply1901	Michy	Batshuayi	Belgium	1993-10-02 00:00:00	\N	\N	Forward	185	83	R
ply1902	Denis	Cheryshev	Russia	1990-12-26 00:00:00	\N	21	Forward	179	74	L
ply1903	Kevin	Gameiro	France	1987-05-09 00:00:00	\N	9	Forward	172	70	R
ply1904	Adama	Soumaoro	France	1992-06-18 00:00:00	\N	5	Defender	186	93	R
ply1905	Kurt	Zouma	France	1994-10-27 00:00:00	\N	4	Defender	190	95	R
ply1906	Daniel	Wass	Denmark	1989-05-31 00:00:00	\N	10	Defender	178	74	R
ply1907	Nélson	Semedo	Portugal	1993-11-16 00:00:00	\N	22	Defender	177	69	R
ply1908	Tyler	Adams	USA	1999-02-14 00:00:00	\N	12	Midfielder	175	72	R
ply1909	Maxwel	Cornet	Ivory Coast	1996-09-27 00:00:00	\N	14	Midfielder	179	69	L
ply1910	Oliver	Baumann	Germany	1990-06-02 00:00:00	1899 Hoffenheim	1	Goalkeeper	187	82	R
ply1911	Nahuel	Noll	Germany	2003-03-17 00:00:00	1899 Hoffenheim	36	Goalkeeper	188	75	\N
ply1912	Philipp	Pentke	Germany	1985-05-01 00:00:00	1899 Hoffenheim	12	Goalkeeper	191	84	R
ply1913	Luca	Philipp	Germany	2000-11-28 00:00:00	\N	1	Goalkeeper	192	83	R
ply1914	Kevin	Akpoguma	Nigeria	1995-04-19 00:00:00	1899 Hoffenheim	25	Defender	192	85	R
ply1915	Ermin	Bičakčić	Bosnia-Herzegovina	1990-01-24 00:00:00	1899 Hoffenheim	4	Defender	185	85	R
ply1916	Justin	Che	USA	2003-11-18 00:00:00	\N	12	Defender	185	79	R
ply1917	Eduardo	Quaresma	Portugal	2002-03-02 00:00:00	\N	23	Defender	185	76	\N
ply1918	Benjamin	Hübner	Germany	1989-07-04 00:00:00	1899 Hoffenheim	21	Defender	193	86	L
ply1919	Ozan	Kabak	Turkey	2000-03-25 00:00:00	1899 Hoffenheim	5	Defender	186	86	R
ply1920	Pavel	Kadeřábek	Czech Republic	1992-04-25 00:00:00	1899 Hoffenheim	3	Defender	182	81	R
ply1921	Noah	König	Germany	2003-05-17 00:00:00	\N	2	Defender	188	83	R
ply1922	Stanley	N'Soki	France	1999-04-09 00:00:00	1899 Hoffenheim	34	Defender	184	83	L
ply1923	Kevin	Vogt	Germany	1991-09-23 00:00:00	1899 Hoffenheim	22	Defender	194	87	R
ply1924	Christoph	Baumgartner	Austria	1999-08-01 00:00:00	1899 Hoffenheim	14	Midfielder	180	73	R
ply1925	Finn	Becker	Germany	2000-06-08 00:00:00	1899 Hoffenheim	20	Midfielder	177	74	L
ply1926	Tom	Bischof	Germany	2005-06-28 00:00:00	1899 Hoffenheim	39	Midfielder	176	66	\N
ply1927	Muhammed	Damar	Germany	2004-04-09 00:00:00	\N	7	Midfielder	185	\N	\N
ply1928	Dennis	Geiger	Germany	1998-06-10 00:00:00	1899 Hoffenheim	8	Midfielder	173	65	R
ply1929	Grischa	Prömel	Germany	1995-01-09 00:00:00	1899 Hoffenheim	6	Midfielder	184	81	\N
ply1930	Sebastian	Rudy	Germany	1990-02-28 00:00:00	1899 Hoffenheim	16	Midfielder	180	74	R
ply1931	Robert	Skov	Denmark	1996-05-20 00:00:00	1899 Hoffenheim	29	Midfielder	185	81	\N
ply1932	Angelo	Stiller	Germany	2001-04-04 00:00:00	1899 Hoffenheim	13	Midfielder	183	73	L
ply1933	Umut	Tohumcu	Germany	2004-08-11 00:00:00	\N	8	Midfielder	175	71	\N
ply1934	Fisnik	Asllani	Germany	2002-08-08 00:00:00	1899 Hoffenheim	44	Forward	189	82	\N
ply1935	Ihlas	Bebou	Togo	1994-04-23 00:00:00	1899 Hoffenheim	9	Forward	185	78	R
ply1936	Jacob Bruun	Larsen	Denmark	1998-09-19 00:00:00	1899 Hoffenheim	7	Forward	183	75	R
ply1937	Munas	Dabbur	Israel	1992-05-14 00:00:00	1899 Hoffenheim	10	Forward	182	76	R
ply1938	Andrej	Kramarić	Croatia	1991-06-19 00:00:00	1899 Hoffenheim	27	Forward	177	73	R
ply1939	Michael	Rechner	Germany	1980-05-27 00:00:00	1899 Hoffenheim	\N	Goalkeeping	186	83	R
ply1940	Philipp	Lussi	Germany	1994-02-11 00:00:00	1899 Hoffenheim	\N	Athletic	189	87	\N
ply1941	Martin	Seiler	Germany	1989-04-03 00:00:00	1899 Hoffenheim	\N	Athletic	187	81	\N
ply1942	Christian	Weigl	Germany	1976-06-13 00:00:00	1899 Hoffenheim	\N	Athletic	184	84	\N
ply1943	Christian	Neitzert	Germany	1984-08-13 00:00:00	1899 Hoffenheim	\N	Rehab	178	78	\N
ply1944	Bernd	Steinhoff	Germany	1980-03-19 00:00:00	1899 Hoffenheim	\N	Rehab	\N	\N	\N
ply1945	Niklas	Mayer	Germany	1991-12-13 00:00:00	1899 Hoffenheim	\N	Game	182	\N	\N
ply1946	Timo	Gross	Germany	1990-08-27 00:00:00	1899 Hoffenheim	\N	Chief	180	78	\N
ply1947	Hans-Dieter	Hermann	Germany	1960-05-14 00:00:00	1899 Hoffenheim	\N	07/2006	\N	\N	\N
ply1948	Jan	Mayer	Germany	1972-08-05 00:00:00	1899 Hoffenheim	\N	07/2010	\N	\N	\N
ply1949	Georgios	Athanasiadis	Greece	1993-04-07 00:00:00	AEK Athen	\N	Goalkeeper	191	85	R
ply1950	Vasilios	Chatziemmanouil	Greece	1999-08-09 00:00:00	\N	61	Goalkeeper	186	79	L
ply1951	Cican	Stanković	Austria	1992-11-04 00:00:00	AEK Athen	23	Goalkeeper	186	80	R
ply1952	Georgios	Theocharis	Greece	2002-06-30 00:00:00	\N	99	Goalkeeper	187	90	\N
ply1953	Panagiotis	Tsintotas	Greece	1993-07-04 00:00:00	AEK Athen	1	Goalkeeper	192	87	R
ply1954	Gerasimos	Mitoglou	Greece	1999-10-20 00:00:00	AEK Athen	24	Defender	195	85	R
ply1955	Milad	Mohammadi	Iran	1993-09-29 00:00:00	AEK Athen	3	Defender	178	79	L
ply1956	Harold	Moukoudi	Cameroon	1997-11-27 00:00:00	AEK Athen	\N	Defender	191	74	R
ply1957	Alexandros	Parras	Greece	1998-05-12 00:00:00	AEK Athen	18	Defender	182	67	L
ply1958	Vedad	Radonja	Bosnia-Herzegovina	2001-09-06 00:00:00	\N	37	Defender	182	72	R
ply1959	Lazaros	Rota	Greece	1997-08-23 00:00:00	AEK Athen	12	Defender	180	\N	R
ply1960	Djibril	Sidibé	France	1992-07-29 00:00:00	AEK Athen	\N	Defender	182	71	R
ply1961	Giorgos	Tzavellas	Greece	1987-11-26 00:00:00	AEK Athen	31	Defender	183	77	L
ply1962	Domagoj	Vida	Croatia	1989-04-29 00:00:00	AEK Athen	\N	Defender	184	76	R
ply1963	Nordin	Amrabat	Morocco	1987-03-31 00:00:00	AEK Athen	7	Midfielder	179	73	R
ply1964	Niclas	Eliasson	Sweden	1995-12-07 00:00:00	AEK Athen	\N	Midfielder	178	72	L
ply1965	Alexander	Fransson	Sweden	1994-04-02 00:00:00	AEK Athen	14	Midfielder	180	74	R
ply1966	Mijat	Gaćinović	Serbia	1995-02-08 00:00:00	AEK Athen	\N	Midfielder	175	66	R
ply1967	Konstantinos	Galanopoulos	Greece	1997-12-28 00:00:00	AEK Athen	25	Midfielder	172	72	R
ply1968	Ehsan	Hajsafi	Iran	1990-02-25 00:00:00	AEK Athen	26	Midfielder	176	74	L
ply1969	Jens	Jønsson	Denmark	1993-01-10 00:00:00	AEK Athen	\N	Midfielder	182	78	R
ply1970	Petros	Mantalos	Greece	1991-08-31 00:00:00	AEK Athen	20	Midfielder	176	73	R
ply1971	Georgios	Moustakopoulos	Greece	1998-08-13 00:00:00	AEK Athen	80	Midfielder	\N	\N	R
ply1972	Konstantinos	Roukounakis	Greece	2001-07-17 00:00:00	AEK Athen	46	Midfielder	183	77	L
ply1973	Anel	Šabanadžović	Bosnia-Herzegovina	1999-05-24 00:00:00	AEK Athen	44	Midfielder	182	70	R
ply1974	Damian	Szymański	Poland	1995-06-16 00:00:00	AEK Athen	4	Midfielder	183	76	R
ply1975	Steven	Zuber	Switzerland	1991-08-17 00:00:00	AEK Athen	17	Midfielder	182	72	R
ply1976	Sergio	Araujo	Argentina	1992-01-28 00:00:00	AEK Athen	11	Forward	180	81	R
ply1977	Efthymios	Christopoulos	Greece	2000-09-20 00:00:00	\N	70	Forward	181	76	R
ply1978	Levi	García	Trinidad & Tobago	1997-11-20 00:00:00	AEK Athen	9	Forward	182	78	L
ply1979	Michalis	Kosidis	Greece	2002-02-09 00:00:00	\N	35	Forward	191	80	\N
ply1980	Theodosis	Macheras	Greece	2000-05-09 00:00:00	AEK Athen	\N	Forward	179	74	\N
ply1981	Orbelín	Pineda	Mexico	1996-03-24 00:00:00	AEK Athen	\N	Forward	169	64	R
ply1982	Tom van	Weert	Netherlands	1990-06-07 00:00:00	AEK Athen	\N	Forward	182	79	R
ply1983	\N	Zini	Angola	2002-07-03 00:00:00	AEK Athen	\N	Forward	181	\N	R
ply1984	Carlos	Roa	Argentina	1969-08-15 00:00:00	AEK Athen	\N	Goalkeeping	192	87	\N
ply1985	Guido	Bonini	Argentina	1986-08-26 00:00:00	AEK Athen	\N	Fitness	188	91	\N
ply1986	Thomas	Didillon	France	1995-11-28 00:00:00	AS Monaco	30	Goalkeeper	193	84	L
ply1987	Yann	Lienard	France	2003-03-16 00:00:00	AS Monaco	50	Goalkeeper	192	82	R
ply1988	Alexander	Nübel	Germany	1996-09-30 00:00:00	AS Monaco	16	Goalkeeper	193	86	R
ply1989	Ruben	Aguilar	France	1993-04-26 00:00:00	AS Monaco	26	Defender	172	71	R
ply1990	Benoît	Badiashile	France	2001-03-26 00:00:00	AS Monaco	5	Defender	194	75	L
ply1991	Caio	Henrique	Brazil	1997-07-31 00:00:00	AS Monaco	12	Defender	179	70	L
ply1992	Axel	Disasi	France	1998-03-11 00:00:00	AS Monaco	6	Defender	190	86	R
ply1993	Ismail	Jakobs	Germany	1999-08-17 00:00:00	AS Monaco	14	Defender	183	75	L
ply1994	Guillermo	Maripán	Chile	1994-05-06 00:00:00	AS Monaco	3	Defender	194	83	R
ply1995	Yllan	Okou	France	2002-12-23 00:00:00	AS Monaco	38	Defender	180	65	L
ply1996	Malang	Sarr	France	1999-01-23 00:00:00	AS Monaco	23	Defender	182	73	L
ply1997	\N	Vanderson	Brazil	2001-06-21 00:00:00	AS Monaco	2	Defender	174	69	R
ply1998	Maghnes	Akliouche	Algeria	2002-02-25 00:00:00	AS Monaco	21	Midfielder	175	63	L
ply1999	Eliesse Ben	Seghir	France	2005-02-14 00:00:00	AS Monaco	99	Midfielder	\N	\N	\N
ply2000	Mohamed	Camara	Mali	2000-01-06 00:00:00	AS Monaco	4	Midfielder	175	69	R
ply2001	Youssouf	Fofana	France	1999-01-10 00:00:00	AS Monaco	19	Midfielder	176	74	R
ply2002	Aleksandr	Golovin	Russia	1996-05-30 00:00:00	AS Monaco	17	Midfielder	180	69	R
ply2003	Jean	Lucas	Brazil	1998-06-22 00:00:00	AS Monaco	11	Midfielder	181	78	R
ply2004	Félix	Lemaréchal	France	2003-08-07 00:00:00	AS Monaco	29	Midfielder	181	73	R
ply2005	Soungoutou	Magassa	France	2003-10-08 00:00:00	AS Monaco	41	Midfielder	188	\N	R
ply2006	Eliot	Matazo	Belgium	2002-02-15 00:00:00	AS Monaco	15	Midfielder	174	67	R
ply2007	Wissam Ben	Yedder	France	1990-08-12 00:00:00	AS Monaco	10	Forward	170	68	\N
ply2008	Myron	Boadu	Netherlands	2001-01-14 00:00:00	AS Monaco	9	Forward	181	67	R
ply2009	Gelson	Martins	Portugal	1995-05-11 00:00:00	AS Monaco	77	Forward	173	74	R
ply2010	Willem	Geubbels	France	2001-08-16 00:00:00	AS Monaco	53	Forward	185	72	R
ply2011	Frederic De	Boever	Qatar	1980-09-23 00:00:00	AS Monaco	\N	Goalkeeping	\N	\N	\N
ply2012	Pietro	Boer	Italy	2002-05-12 00:00:00	AS Roma	63	Goalkeeper	193	80	R
ply2013	Rui	Patrício	Portugal	1988-02-15 00:00:00	AS Roma	1	Goalkeeper	190	84	L
ply2014	Mile	Svilar	Belgium	1999-08-27 00:00:00	AS Roma	99	Goalkeeper	189	82	R
ply2015	William	Bianda	France	2000-04-30 00:00:00	AS Roma	\N	Defender	186	82	L
ply2016	\N	Ibañez	Brazil	1998-11-23 00:00:00	AS Roma	3	Defender	187	80	R
ply2017	Jan	Oliveras	Spain	2004-07-07 00:00:00	AS Roma	74	Defender	172	\N	L
ply2018	Rick	Karsdorp	Netherlands	1995-02-11 00:00:00	AS Roma	2	Defender	184	80	R
ply2019	Dimitrios	Keramitsis	Italy	2004-07-01 00:00:00	AS Roma	60	Defender	193	78	\N
ply2020	Marash	Kumbulla	Albania	2000-02-08 00:00:00	AS Roma	24	Defender	190	78	R
ply2021	Gianluca	Mancini	Italy	1996-04-17 00:00:00	AS Roma	23	Defender	191	82	R
ply2022	Filippo	Missori	Italy	2004-03-24 00:00:00	AS Roma	58	Defender	182	\N	R
ply2023	Chris	Smalling	England	1989-11-22 00:00:00	AS Roma	6	Defender	194	90	R
ply2024	Leonardo	Spinazzola	Italy	1993-03-25 00:00:00	AS Roma	37	Defender	186	75	R
ply2025	Matías	Viña	Uruguay	1997-11-09 00:00:00	AS Roma	17	Defender	180	73	L
ply2026	Edoardo	Bove	Italy	2002-05-16 00:00:00	AS Roma	52	Midfielder	176	63	R
ply2027	Ante	Ćorić	Croatia	1997-04-14 00:00:00	AS Roma	\N	Midfielder	177	75	\N
ply2028	Bryan	Cristante	Italy	1995-03-03 00:00:00	AS Roma	4	Midfielder	187	85	R
ply2029	Ebrima	Darboe	Gambia	2001-06-06 00:00:00	AS Roma	55	Midfielder	178	69	R
ply2030	Giacomo	Faticanti	Italy	2004-07-31 00:00:00	AS Roma	73	Midfielder	175	\N	R
ply2031	Nemanja	Matić	Serbia	1988-08-01 00:00:00	AS Roma	8	Midfielder	194	85	L
ply2032	Lorenzo	Pellegrini	Italy	1996-06-19 00:00:00	AS Roma	7	Midfielder	186	77	\N
ply2033	Filippo	Tripi	Italy	2002-01-06 00:00:00	AS Roma	65	Midfielder	179	69	R
ply2034	Cristian	Volpato	Australia	2003-11-15 00:00:00	AS Roma	62	Midfielder	187	75	L
ply2035	Nicola	Zalewski	Poland	2002-01-23 00:00:00	AS Roma	59	Midfielder	175	65	R
ply2036	Andrea	Belotti	Italy	1993-12-20 00:00:00	AS Roma	11	Forward	181	84	R
ply2037	Stephan El	Shaarawy	Italy	1992-10-27 00:00:00	AS Roma	92	Forward	178	72	R
ply2038	Eldor	Shomurodov	Uzbekistan	1995-06-29 00:00:00	AS Roma	14	Forward	190	76	R
ply2039	Nicolò	Zaniolo	Italy	1999-07-02 00:00:00	AS Roma	22	Forward	190	79	L
ply2040	Nuno	Santos	Portugal	1973-04-20 00:00:00	AS Roma	\N	Goalkeeping	185	81	\N
ply2041	Igor	Akinfeev	Russia	1986-04-08 00:00:00	CSKA Moskva	35	Goalkeeper	186	82	R
ply2042	Danila	Bokov	Russia	2002-08-09 00:00:00	CSKA Moskva	45	Goalkeeper	185	77	R
ply2043	Vladislav	Torop	Russia	2003-11-07 00:00:00	CSKA Moskva	49	Goalkeeper	189	84	L
ply2044	Bruno	Fuchs	Brazil	1999-04-01 00:00:00	CSKA Moskva	3	Defender	190	82	R
ply2045	Igor	Diveev	Russia	1999-09-27 00:00:00	CSKA Moskva	78	Defender	193	85	R
ply2046	Milan	Gajić	Serbia	1996-01-28 00:00:00	CSKA Moskva	22	Defender	178	74	\N
ply2047	Vadim	Karpov	Russia	2002-07-14 00:00:00	CSKA Moskva	62	Defender	190	77	R
ply2048	Matvey	Lukin	Russia	2004-04-27 00:00:00	CSKA Moskva	90	Defender	177	72	L
ply2049	\N	Moisés	Brazil	1995-03-11 00:00:00	CSKA Moskva	27	Defender	183	79	L
ply2050	Kirill	Nababkin	Russia	1986-09-08 00:00:00	CSKA Moskva	14	Defender	184	77	\N
ply2051	Georgiy	Shchennikov	Russia	1991-04-27 00:00:00	CSKA Moskva	42	Defender	178	75	L
ply2052	Willyan	Rocha	Brazil	1995-01-27 00:00:00	CSKA Moskva	4	Defender	193	86	R
ply2053	Jorge	Carrascal	Colombia	1998-05-25 00:00:00	CSKA Moskva	8	Midfielder	179	70	R
ply2054	Nikita	Ermakov	Russia	2003-01-19 00:00:00	CSKA Moskva	72	Midfielder	181	70	\N
ply2055	Dmitri	Kaptilovikh	Russia	2003-02-22 00:00:00	CSKA Moskva	48	Midfielder	186	80	R
ply2056	Konstantin	Kuchaev	Russia	1998-03-18 00:00:00	CSKA Moskva	20	Midfielder	182	74	R
ply2057	Jesús	Medina	Paraguay	1997-04-30 00:00:00	CSKA Moskva	28	Midfielder	177	70	L
ply2058	Víctor	Méndez	Chile	1999-09-23 00:00:00	CSKA Moskva	88	Midfielder	170	66	R
ply2059	Maksim	Mukhin	Russia	2001-11-04 00:00:00	CSKA Moskva	6	Midfielder	181	67	R
ply2060	Ivan	Oblyakov	Russia	1998-07-05 00:00:00	CSKA Moskva	10	Midfielder	175	74	L
ply2061	Baktiyor	Zaynutdinov	Kazakhstan	1998-04-02 00:00:00	CSKA Moskva	19	Midfielder	183	75	L
ply2062	Saša	Zdjelar	Serbia	1995-03-20 00:00:00	CSKA Moskva	5	Midfielder	183	75	R
ply2063	Fedor	Chalov	Russia	1998-04-10 00:00:00	CSKA Moskva	9	Forward	183	75	R
ply2064	Adolfo	Gaich	Argentina	1999-02-26 00:00:00	CSKA Moskva	21	Forward	190	82	R
ply2065	Egor	Ushakov	Russia	2002-12-02 00:00:00	CSKA Moskva	41	Forward	176	65	R
ply2066	Vladislav	Yakovlev	Russia	2002-02-14 00:00:00	CSKA Moskva	46	Forward	185	77	\N
ply2067	Anton	Zabolotny	Russia	1991-06-13 00:00:00	CSKA Moskva	91	Forward	191	84	R
ply2068	Ralf	Fährmann	Germany	1988-09-27 00:00:00	FC Schalke 04	1	Goalkeeper	197	98	R
ply2069	Justin	Heekeren	Germany	2000-11-27 00:00:00	FC Schalke 04	28	Goalkeeper	193	86	\N
ply2070	Michael	Langer	Austria	1985-01-06 00:00:00	FC Schalke 04	34	Goalkeeper	195	93	R
ply2071	Alexander	Schwolow	Germany	1992-06-02 00:00:00	FC Schalke 04	13	Goalkeeper	190	84	R
ply2072	Cédric	Brunner	Switzerland	1994-02-17 00:00:00	FC Schalke 04	27	Defender	180	75	R
ply2073	Ibrahima	Cissé	France	2001-02-15 00:00:00	FC Schalke 04	22	Defender	196	84	R
ply2074	Leo	Greiml	Austria	2001-07-03 00:00:00	FC Schalke 04	3	Defender	186	77	R
ply2075	Marcin	Kamiński	Poland	1992-01-15 00:00:00	FC Schalke 04	35	Defender	192	84	\N
ply2076	Henning	Matriciani	Germany	2000-03-14 00:00:00	\N	12	Defender	187	76	R
ply2077	Thomas	Ouwejan	Netherlands	1996-09-30 00:00:00	FC Schalke 04	2	Defender	183	76	L
ply2078	Sepp van den	Berg	Netherlands	2001-12-20 00:00:00	FC Schalke 04	5	Defender	189	78	R
ply2079	Maya	Yoshida	Japan	1988-08-24 00:00:00	FC Schalke 04	4	Defender	189	79	R
ply2080	Mehmet-Can	Aydın	Germany	2002-02-09 00:00:00	FC Schalke 04	23	Midfielder	179	75	R
ply2081	Kerim	Çalhanoğlu	Germany	2002-08-26 00:00:00	\N	20	Midfielder	183	80	L
ply2082	Dominick	Drexler	Germany	1990-05-26 00:00:00	FC Schalke 04	24	Midfielder	183	71	R
ply2083	Florian	Flick	Germany	2000-05-01 00:00:00	FC Schalke 04	17	Midfielder	188	79	\N
ply2084	Alex	Král	Czech Republic	1998-05-19 00:00:00	FC Schalke 04	30	Midfielder	187	80	R
ply2085	Tom	Krauß	Germany	2001-06-22 00:00:00	FC Schalke 04	6	Midfielder	182	72	R
ply2086	Danny	Latza	Germany	1989-12-07 00:00:00	FC Schalke 04	8	Midfielder	179	76	R
ply2087	Tobias	Mohr	Germany	1995-08-24 00:00:00	FC Schalke 04	29	Midfielder	183	78	L
ply2088	Florent	Mollet	France	1991-11-19 00:00:00	FC Schalke 04	20	Midfielder	174	67	R
ply2089	Rodrigo	Zalazar	Uruguay	1999-08-12 00:00:00	FC Schalke 04	10	Midfielder	178	72	R
ply2090	Marius	Bülter	Germany	1993-03-29 00:00:00	FC Schalke 04	11	Forward	190	85	R
ply2091	Kenan	Karaman	Turkey	1994-03-05 00:00:00	FC Schalke 04	19	Forward	189	83	R
ply2092	Jordan	Larsson	Sweden	1997-06-20 00:00:00	FC Schalke 04	7	Forward	175	69	L
ply2093	Sebastian	Polter	Germany	1991-04-01 00:00:00	FC Schalke 04	40	Forward	192	94	R
ply2094	Sidi	Sané	Germany	2003-04-21 00:00:00	\N	21	Forward	187	\N	R
ply2095	Simon	Terodde	Germany	1988-03-02 00:00:00	FC Schalke 04	9	Forward	192	87	R
ply2096	Simon	Henzler	Germany	1976-12-01 00:00:00	FC Schalke 04	\N	Goalkeeping	188	83	R
ply2097	Jörn	Menger	Germany	1978-05-09 00:00:00	FC Schalke 04	\N	Athletic	\N	\N	\N
ply2098	Alexander	Storck	Germany	1988-08-30 00:00:00	FC Schalke 04	\N	Athletic	\N	\N	\N
ply2099	David	Gröger	Germany	1980-08-13 00:00:00	FC Schalke 04	\N	Rehab	\N	\N	\N
ply2100	Lars	Gerling	Germany	1983-01-09 00:00:00	FC Schalke 04	\N	Game	\N	\N	\N
ply2101	Walter	Benítez	Argentina	1993-01-19 00:00:00	PSV Eindhoven	1	Goalkeeper	191	91	R
ply2102	Joël	Drommel	Netherlands	1996-11-16 00:00:00	PSV Eindhoven	16	Goalkeeper	192	89	R
ply2103	Kjell	Peersman	Belgium	2004-05-21 00:00:00	PSV Eindhoven	41	Goalkeeper	194	\N	\N
ply2104	Boy	Waterman	Netherlands	1984-01-24 00:00:00	PSV Eindhoven	24	Goalkeeper	188	83	R
ply2105	Olivier	Boscagli	France	1997-11-18 00:00:00	PSV Eindhoven	18	Defender	181	68	L
ply2106	Jarrad	Branthwaite	England	2002-06-27 00:00:00	PSV Eindhoven	22	Defender	195	85	L
ply2107	Ki-Jana	Hoever	Netherlands	2002-01-18 00:00:00	PSV Eindhoven	2	Defender	183	72	R
ply2108	Mauro	Júnior	Brazil	1999-05-06 00:00:00	PSV Eindhoven	17	Defender	171	62	L
ply2109	Philipp	Max	Germany	1993-09-30 00:00:00	PSV Eindhoven	31	Defender	177	75	L
ply2110	Phillipp	Mwene	Austria	1994-01-29 00:00:00	PSV Eindhoven	29	Defender	170	68	R
ply2111	Armando	Obispo	Netherlands	1999-03-05 00:00:00	PSV Eindhoven	4	Defender	185	72	L
ply2112	Fredrik	Oppegård	Norway	2002-08-07 00:00:00	PSV Eindhoven	35	Defender	175	\N	L
ply2113	Jordan	Teze	Netherlands	1999-09-30 00:00:00	PSV Eindhoven	3	Defender	183	68	R
ply2114	Erick	Gutiérrez	Mexico	1995-06-15 00:00:00	PSV Eindhoven	15	Midfielder	177	69	L
ply2115	Richie	Ledezma	USA	2000-09-06 00:00:00	PSV Eindhoven	37	Midfielder	168	64	R
ply2116	Ibrahim	Sangaré	Ivory Coast	1997-12-02 00:00:00	PSV Eindhoven	6	Midfielder	191	77	R
ply2117	Xavi	Simons	Netherlands	2003-04-21 00:00:00	PSV Eindhoven	7	Midfielder	168	58	R
ply2118	Guus	Til	Netherlands	1997-12-22 00:00:00	PSV Eindhoven	20	Midfielder	186	79	R
ply2119	Marco van	Ginkel	Netherlands	1992-12-01 00:00:00	PSV Eindhoven	8	Midfielder	186	82	R
ply2120	Joey	Veerman	Netherlands	1998-11-19 00:00:00	PSV Eindhoven	23	Midfielder	185	81	R
ply2121	Johan	Bakayoko	Belgium	2003-04-20 00:00:00	PSV Eindhoven	27	Forward	\N	\N	L
ply2122	Anwar El	Ghazi	Netherlands	1995-05-03 00:00:00	PSV Eindhoven	21	Forward	189	87	R
ply2123	Cody	Gakpo	Netherlands	1999-05-07 00:00:00	PSV Eindhoven	11	Forward	187	76	R
ply2124	Ismael	Saibari	Morocco	2001-01-28 00:00:00	PSV Eindhoven	28	Forward	185	\N	R
ply2125	Noni	Madueke	England	2002-03-10 00:00:00	PSV Eindhoven	10	Forward	182	65	L
ply2126	\N	Sávio	Brazil	2004-04-10 00:00:00	PSV Eindhoven	33	Forward	176	66	L
ply2127	Yorbe	Vertessen	Belgium	2001-01-08 00:00:00	PSV Eindhoven	32	Forward	176	\N	R
ply2128	Abe	Knoop	Netherlands	1963-08-28 00:00:00	PSV Eindhoven	\N	Goalkeeping	\N	\N	\N
ply2129	Martin	Jedlička	Czech Republic	1998-01-24 00:00:00	Viktoria Plzeň	16	Republic	187	78	R
ply2130	Jindřich	Staněk	Czech Republic	1996-04-27 00:00:00	Viktoria Plzeň	36	Republic	191	93	R
ply2131	Marián	Tvrdoň	Slovakia	1994-08-18 00:00:00	Viktoria Plzeň	13	Republic	194	86	R
ply2132	Milan	Havel	Czech Republic	1994-08-07 00:00:00	Viktoria Plzeň	24	Republic	183	76	R
ply2133	Lukáš	Hejda	Czech Republic	1990-03-09 00:00:00	Viktoria Plzeň	2	Republic	189	85	R
ply2134	Libor	Holík	Czech Republic	1998-05-12 00:00:00	Viktoria Plzeň	44	Republic	174	72	R
ply2135	Václav	Jemelka	Czech Republic	1995-06-23 00:00:00	Viktoria Plzeň	21	Republic	186	77	L
ply2136	Filip	Kaša	Czech Republic	1994-01-01 00:00:00	Viktoria Plzeň	35	Republic	190	84	R
ply2137	Luděk	Pernica	Czech Republic	1990-06-16 00:00:00	Viktoria Plzeň	4	Republic	187	90	R
ply2138	Radim	Řezník	Czech Republic	1989-01-20 00:00:00	Viktoria Plzeň	14	Republic	183	82	R
ply2139	Mohamed	Tijani	Benin	1997-07-10 00:00:00	Viktoria Plzeň	3	Republic	188	78	L
ply2140	Adam	Alexandr	Czech Republic	2000-05-03 00:00:00	Viktoria Plzeň	\N	Republic	178	72	\N
ply2141	Marko	Alvir	Croatia	1994-04-19 00:00:00	Viktoria Plzeň	\N	Republic	181	78	R
ply2142	Pavel	Bucha	Czech Republic	1998-03-11 00:00:00	Viktoria Plzeň	20	Republic	177	73	R
ply2143	Aleš	Čermák	Czech Republic	1994-10-01 00:00:00	Viktoria Plzeň	25	Republic	181	74	R
ply2144	Erik	Jirka	Slovakia	1997-09-19 00:00:00	Viktoria Plzeň	77	Republic	184	73	R
ply2145	Lukáš	Kalvach	Czech Republic	1995-07-19 00:00:00	Viktoria Plzeň	23	Republic	183	77	R
ply2146	Jan	Kopic	Czech Republic	1990-06-04 00:00:00	Viktoria Plzeň	10	Republic	180	81	R
ply2147	Dominik	Kříž	Czech Republic	1999-09-25 00:00:00	Viktoria Plzeň	\N	Republic	177	68	\N
ply2148	Modou	N'Diaye	Senegal	1996-10-29 00:00:00	Viktoria Plzeň	99	Republic	184	71	L
ply2149	Václav	Pilař	Czech Republic	1988-10-13 00:00:00	Viktoria Plzeň	6	Republic	171	71	\N
ply2150	Adam	Vlkanova	Czech Republic	1994-09-04 00:00:00	Viktoria Plzeň	88	Republic	169	60	\N
ply2151	Fortune	Bassey	Nigeria	1998-10-06 00:00:00	Viktoria Plzeň	90	Republic	186	77	R
ply2152	Tomáš	Chorý	Czech Republic	1995-01-26 00:00:00	Viktoria Plzeň	15	Republic	199	101	R
ply2153	René	Dedič	Slovakia	1993-08-07 00:00:00	Viktoria Plzeň	33	Republic	193	87	\N
ply2154	Jan	Kliment	Czech Republic	1993-09-01 00:00:00	Viktoria Plzeň	9	Republic	185	76	R
ply2155	Jhon	Mosquera	Colombia	1990-05-08 00:00:00	Viktoria Plzeň	18	Republic	186	78	L
ply2156	Petr	Pejša	Czech Republic	1997-08-13 00:00:00	Viktoria Plzeň	\N	Republic	\N	\N	\N
ply2157	Jan	Sýkora	Czech Republic	1993-12-29 00:00:00	Viktoria Plzeň	7	Republic	171	64	L
ply2158	Michal	Bílek	Czech Republic	1965-04-13 00:00:00	Viktoria Plzeň	\N	Republic	177	70	\N
ply2159	Samuel	Grandsir	France	1996-08-14 00:00:00	\N	11	Forward	170	65	R
ply2160	Moussa	Sylla	France	1999-11-25 00:00:00	\N	29	Forward	181	70	R
ply2161	\N	Wesley	Brazil	1996-11-24 00:00:00	\N	7	Forward	191	93	R
ply2162	Kaveh	Rezaei	Iran	1992-04-05 00:00:00	\N	\N	Forward	185	74	R
ply2163	Filipe	Luís	Brazil	1985-08-09 00:00:00	\N	16	Defender	182	74	L
ply2164	Pablo	Rosario	Netherlands	1997-01-07 00:00:00	\N	8	Midfielder	179	73	R
ply2165	Radja	Nainggolan	Belgium	1988-05-04 00:00:00	\N	4	Midfielder	176	65	R
ply2166	Gastón	Pereiro	Uruguay	1995-06-11 00:00:00	\N	20	Midfielder	188	76	L
ply2167	Xherdan	Shaqiri	Switzerland	1991-10-10 00:00:00	\N	10	Forward	169	72	L
ply2168	Milan	Pavkov	Serbia	1994-02-09 00:00:00	\N	23	Arabia	193	78	R
ply2169	Marek	Hamšík	Slovakia	1987-07-27 00:00:00	\N	17	Midfielder	183	79	\N
ply2170	Emre	Akbaba	Turkey	1992-10-04 00:00:00	\N	\N	Midfielder	180	73	L
ply2171	Eren	Derdiyok	Switzerland	1988-06-12 00:00:00	\N	9	Forward	191	83	R
ply2172	Yacine	Brahimi	Algeria	1990-02-08 00:00:00	\N	8	Forward	175	68	R
ply2173	Jefferson	Farfán	Peru	1984-10-26 00:00:00	\N	10	Forward	178	84	R
ply1026	Álex	Baena	Spain	2001-07-20 00:00:00	Villarreal CF	16	Forward	174	69	R
ply1027	Samuel	Chukwueze	Nigeria	1999-05-22 00:00:00	Villarreal CF	11	Forward	172	70	L
ply1028	Arnaut	Danjuma	Netherlands	1997-01-31 00:00:00	Villarreal CF	9	Forward	178	74	R
ply1029	Fer	Niño	Spain	2000-10-24 00:00:00	Villarreal CF	34	Forward	191	81	R
ply1030	Gerard	Moreno	Spain	1992-04-07 00:00:00	Villarreal CF	7	Forward	180	77	L
ply1031	Nicolas	Jackson	Senegal	2001-06-20 00:00:00	Villarreal CF	15	Forward	186	80	R
ply1032	José	Morales	Spain	1987-07-23 00:00:00	Villarreal CF	22	Forward	180	70	R
ply1033	\N	Yeremy	Spain	2002-10-20 00:00:00	Villarreal CF	21	Forward	172	70	R
ply1034	Javier	García	Spain	1979-07-04 00:00:00	Villarreal CF	\N	Goalkeeping	173	\N	\N
ply1035	David	Byazrov	Russia	2003-02-12 00:00:00	\N	91	Goalkeeper	190	78	R
ply1036	\N	Ivan	Brazil	1997-02-07 00:00:00	Zenit St. Petersburg	1	Goalkeeper	194	96	R
ply1037	Mikhail	Kerzhakov	Russia	1987-01-28 00:00:00	Zenit St. Petersburg	41	Goalkeeper	191	88	R
ply1038	Georgiy	Korolev	Russia	2003-08-22 00:00:00	Zenit St. Petersburg	95	Goalkeeper	196	80	R
ply1039	Daniil	Odoevskiy	Russia	2003-01-22 00:00:00	Zenit St. Petersburg	71	Goalkeeper	190	78	L
ply1040	Arsen	Adamov	Russia	1999-10-20 00:00:00	Zenit St. Petersburg	23	Defender	180	69	R
ply1041	Nuraly	Alip	Kazakhstan	1999-12-22 00:00:00	Zenit St. Petersburg	28	Defender	190	70	\N
ply1042	Dmitriy	Chistyakov	Russia	1994-01-13 00:00:00	Zenit St. Petersburg	2	Defender	185	79	R
ply1043	Douglas	Santos	Brazil	1994-03-22 00:00:00	Zenit St. Petersburg	3	Defender	175	70	L
ply1044	Vyacheslav	Karavaev	Russia	1995-05-20 00:00:00	Zenit St. Petersburg	15	Defender	175	70	R
ply1045	Danil	Krugovoy	Russia	1998-05-28 00:00:00	Zenit St. Petersburg	4	Defender	175	70	L
ply1046	Dejan	Lovren	Croatia	1989-07-05 00:00:00	Zenit St. Petersburg	6	Defender	188	84	R
ply1047	\N	Rodrigão	Brazil	1995-09-11 00:00:00	Zenit St. Petersburg	55	Defender	191	89	R
ply1048	Wilmar	Barrios	Colombia	1993-10-17 00:00:00	Zenit St. Petersburg	5	Midfielder	178	74	R
ply1049	\N	Claudinho	Brazil	1997-01-28 00:00:00	Zenit St. Petersburg	11	Midfielder	172	65	R
ply1050	Aleksandr	Erokhin	Russia	1989-10-13 00:00:00	Zenit St. Petersburg	21	Midfielder	195	80	R
ply1051	Evgeny	Kim	Russia	2003-05-17 00:00:00	Zenit St. Petersburg	72	Midfielder	181	72	R
ply1052	Daler	Kuzyaev	Russia	1993-01-15 00:00:00	Zenit St. Petersburg	14	Midfielder	182	74	R
ply1053	Dmitriy	Sergeev	Russia	2000-04-03 00:00:00	Zenit St. Petersburg	45	Midfielder	183	73	R
ply1054	Kirill	Stolbov	Russia	2004-04-08 00:00:00	\N	60	Midfielder	\N	\N	\N
ply1473	Manor	Solomon	Israel	1999-07-24 00:00:00	\N	11	Midfielder	167	63	\N
ply1055	\N	Wendel	Brazil	1997-08-28 00:00:00	Zenit St. Petersburg	8	Midfielder	180	73	R
ply1056	Zelimkhan	Bakaev	Russia	1996-07-01 00:00:00	Zenit St. Petersburg	7	Forward	180	77	L
ply1057	Mateo	Cassierra	Colombia	1997-04-13 00:00:00	Zenit St. Petersburg	30	Forward	183	75	R
ply1058	Gustavo	Mantuan	Brazil	2001-06-20 00:00:00	Zenit St. Petersburg	31	Forward	174	\N	R
ply1059	\N	Malcom	Brazil	1997-02-26 00:00:00	Zenit St. Petersburg	10	Forward	171	74	L
ply1060	Andrey	Mostovoy	Russia	1997-11-05 00:00:00	Zenit St. Petersburg	17	Forward	180	77	R
ply1061	Ivan	Sergeev	Russia	1995-05-11 00:00:00	Zenit St. Petersburg	33	Forward	184	75	R
ply1062	Aleksey	Sutormin	Russia	1994-01-10 00:00:00	Zenit St. Petersburg	19	Forward	188	79	R
ply1063	Mikhail	Biryukov	Russia	1958-05-07 00:00:00	Zenit St. Petersburg	\N	Goalkeeping	190	87	\N
ply1064	Gabriel	Jesus	Brazil	1997-04-03 00:00:00	\N	9	Forward	175	68	R
ply1065	Ander	Herrera	Spain	1989-08-14 00:00:00	\N	23	Midfielder	182	71	R
ply1066	Idrissa	Gueye	Senegal	1989-09-26 00:00:00	\N	27	Midfielder	174	66	R
ply1067	\N	Fernandinho	Brazil	1985-05-04 00:00:00	\N	50	Midfielder	179	67	R
ply1068	\N	Angeliño	Spain	1997-01-04 00:00:00	\N	11	Defender	175	69	L
ply1069	Georginio	Wijnaldum	Netherlands	1990-11-11 00:00:00	\N	25	Midfielder	175	69	R
ply1070	Oleksandr	Zinchenko	Ukraine	1996-12-15 00:00:00	\N	35	Defender	175	65	L
ply1071	Fábio	Vieira	Portugal	2000-05-30 00:00:00	\N	21	Midfielder	170	63	L
ply1072	Renan	Lodi	Brazil	1998-04-08 00:00:00	\N	32	Defender	173	70	L
ply1073	Luis	Suárez	Uruguay	1987-01-24 00:00:00	\N	9	Forward	182	83	R
ply1074	Chancel	Mbemba	Congo DR	1994-08-08 00:00:00	\N	99	Defender	182	81	R
ply1075	Sérgio	Oliveira	Portugal	1992-06-02 00:00:00	\N	27	Midfielder	181	78	R
ply1076	Miralem	Pjanić	Bosnia-Herzegovina	1990-04-02 00:00:00	\N	\N	Emirates	178	72	R
ply1077	Matheus	Nunes	Brazil	1998-08-27 00:00:00	\N	27	Midfielder	183	74	R
ply1078	Nico	Tagliafico	Argentina	1992-08-31 00:00:00	\N	3	Defender	172	65	L
ply1079	\N	Tabata	Brazil	1997-03-30 00:00:00	\N	\N	Forward	175	72	L
ply1080	Perr	Schuurs	Netherlands	1999-11-26 00:00:00	\N	3	Defender	191	87	R
ply1081	Adama Traoré	I	Mali	1995-06-05 00:00:00	\N	20	Forward	177	74	L
ply1082	\N	Cristiano	Brazil	1993-08-29 00:00:00	\N	15	Defender	180	76	L
ply1083	Momo	Yansane	Guinea	1997-07-29 00:00:00	\N	99	Forward	180	79	R
ply1084	Jasurbek	Yakhshiboev	Uzbekistan	1997-06-24 00:00:00	\N	\N	Forward	178	74	\N
ply1085	Sébastien	Thill	Luxembourg	1993-12-29 00:00:00	\N	29	Midfielder	178	70	L
ply1086	Arturo	Vidal	Chile	1987-05-22 00:00:00	\N	32	Midfielder	180	75	R
ply1087	Alan	Patrick	Brazil	1991-05-13 00:00:00	\N	10	Midfielder	177	70	R
ply1088	Alexis	Sánchez	Chile	1988-12-19 00:00:00	\N	70	Forward	169	62	R
ply1089	Ivan	Perišić	Croatia	1989-02-02 00:00:00	\N	14	Midfielder	186	80	\N
ply1090	Boban	Nikolov	North Macedonia	1994-07-28 00:00:00	\N	24	Midfielder	182	72	R
ply1091	\N	Éverton	Brazil	1996-03-22 00:00:00	\N	11	Forward	174	72	R
ply1092	Corentin	Tolisso	France	1994-08-03 00:00:00	\N	88	Midfielder	181	81	R
ply1093	Nicolas Moumi	Ngamaleu	Cameroon	1994-07-09 00:00:00	\N	13	Midfielder	181	74	R
ply1094	Jordan	Siebatcheu	USA	1996-04-26 00:00:00	\N	45	Forward	190	84	R
ply1095	Remo	Freuler	Switzerland	1992-04-15 00:00:00	\N	23	Midfielder	181	77	R
ply1096	Aleksey	Miranchuk	Russia	1995-10-17 00:00:00	\N	59	Midfielder	182	74	L
ply1097	Matteo	Pessina	Italy	1997-04-21 00:00:00	\N	32	Midfielder	187	75	L
ply1098	Paco	Alcácer	Spain	1993-08-30 00:00:00	\N	\N	Emirates	175	70	R
ply1099	Jesse	Lingard	England	1992-12-15 00:00:00	\N	11	Midfielder	174	65	R
ply1100	Josip	Iličič	Slovenia	1988-01-29 00:00:00	\N	\N	Forward	190	79	L
ply1101	Michel	Aebischer	Switzerland	1997-01-06 00:00:00	\N	20	Midfielder	183	74	R
ply1102	Silvan	Hefti	Switzerland	1997-10-25 00:00:00	\N	36	Defender	183	80	R
ply1103	Moi	Gómez	Spain	1994-06-23 00:00:00	\N	16	Midfielder	176	73	R
ply1104	Burak	Yılmaz	Turkey	1985-07-15 00:00:00	\N	17	Forward	188	81	R
ply1105	Renato	Steffen	Switzerland	1991-11-03 00:00:00	\N	22	Midfielder	170	65	L
ply1106	Rasmus	Kristensen	Denmark	1997-07-11 00:00:00	\N	25	Defender	186	70	R
ply1107	Jonathan	Ikoné	France	1998-05-02 00:00:00	\N	11	Forward	175	67	L
ply1108	Zeki	Çelik	Turkey	1997-02-17 00:00:00	\N	19	Defender	180	78	R
ply1109	Rodrigo	Bentancur	Uruguay	1997-06-25 00:00:00	\N	30	Midfielder	187	78	R
ply1110	Paulo	Dybala	Argentina	1993-11-15 00:00:00	\N	21	Forward	177	75	L
ply1111	Yaroslav	Rakitskiy	Ukraine	1989-08-03 00:00:00	\N	44	Defender	180	78	L
ply1112	Federico	Bernardeschi	Italy	1994-02-16 00:00:00	\N	10	Forward	183	77	L
ply1113	Dejan	Kulusevski	Sweden	2000-04-25 00:00:00	\N	21	Forward	186	75	L
ply1114	Callum	Hudson-Odoi	England	2000-11-07 00:00:00	\N	17	Forward	177	75	R
ply1115	Sardar	Azmoun	Iran	1995-01-01 00:00:00	\N	9	Forward	186	79	\N
ply1116	Artem	Dzyuba	Russia	1988-08-22 00:00:00	\N	24	Forward	197	91	R
ply1117	Veljko	Birmančević	Serbia	1998-03-05 00:00:00	\N	19	Midfielder	178	70	\N
ply1118	Magomed	Ozdoev	Russia	1992-11-05 00:00:00	\N	27	Midfielder	184	78	R
ply1119	Brenden	Aaronson	USA	2000-10-22 00:00:00	\N	7	Midfielder	178	70	R
ply1120	Serge	Aurier	Ivory Coast	1992-12-24 00:00:00	\N	24	Defender	176	76	R
ply1121	Pervis	Estupiñán	Ecuador	1998-01-21 00:00:00	\N	30	Defender	175	78	L
ply1122	Boulaye	Dia	Senegal	1996-11-16 00:00:00	\N	29	Forward	180	75	R
ply1123	Jan	Olschowsky	Germany	2001-11-18 00:00:00	Bor. Mönchengladbach	41	Goalkeeper	182	79	R
ply1124	Tobias	Sippel	Germany	1988-03-22 00:00:00	Bor. Mönchengladbach	21	Goalkeeper	183	78	R
ply1125	Yann	Sommer	Switzerland	1988-12-17 00:00:00	Bor. Mönchengladbach	1	Goalkeeper	183	79	R
ply1126	Ramy	Bensebaini	Algeria	1995-04-16 00:00:00	Bor. Mönchengladbach	25	Defender	186	82	L
ply1127	Nico	Elvedi	Switzerland	1996-09-30 00:00:00	Bor. Mönchengladbach	30	Defender	189	81	R
ply2521	Shinji	Kagawa	Japan	1989-03-17 00:00:00	\N	10	Midfielder	175	68	\N
ply1128	Marvin	Friedrich	Germany	1995-12-13 00:00:00	Bor. Mönchengladbach	5	Defender	192	83	R
ply1129	Ko	Itakura	Japan	1997-01-27 00:00:00	Bor. Mönchengladbach	3	Defender	186	75	R
ply1130	Tony	Jantschke	Germany	1990-04-07 00:00:00	Bor. Mönchengladbach	24	Defender	177	76	R
ply1131	Stefan	Lainer	Austria	1992-08-27 00:00:00	Bor. Mönchengladbach	18	Defender	175	73	R
ply1132	Luca	Netz	Germany	2003-05-15 00:00:00	Bor. Mönchengladbach	20	Defender	180	83	L
ply1133	Joe	Scally	USA	2002-12-31 00:00:00	Bor. Mönchengladbach	29	Defender	184	80	R
ply1134	Yvandro Borges	Sanches	Luxembourg	2004-05-24 00:00:00	Bor. Mönchengladbach	38	Midfielder	175	67	R
ply1135	Oscar	Fraulo	Denmark	2003-12-06 00:00:00	Bor. Mönchengladbach	22	Midfielder	180	77	R
ply1136	Patrick	Herrmann	Germany	1991-02-12 00:00:00	Bor. Mönchengladbach	7	Midfielder	179	71	R
ply1137	Jonas	Hofmann	Germany	1992-07-14 00:00:00	Bor. Mönchengladbach	23	Midfielder	176	73	R
ply1138	Kouadio	Koné	France	2001-05-17 00:00:00	Bor. Mönchengladbach	17	Midfielder	185	80	R
ply1139	Christoph	Kramer	Germany	1991-02-19 00:00:00	Bor. Mönchengladbach	6	Midfielder	191	76	\N
ply1140	Torben	Müsel	Germany	1999-07-25 00:00:00	Bor. Mönchengladbach	26	Midfielder	185	80	R
ply1141	Florian	Neuhaus	Germany	1997-03-16 00:00:00	Bor. Mönchengladbach	32	Midfielder	185	74	R
ply1142	Conor	Noß	Ireland	2001-01-01 00:00:00	\N	34	Midfielder	181	72	\N
ply1143	Rocco	Reitz	Germany	2002-05-29 00:00:00	Bor. Mönchengladbach	27	Midfielder	176	75	\N
ply1144	Julian	Weigl	Germany	1995-09-08 00:00:00	Bor. Mönchengladbach	8	Midfielder	186	80	R
ply1145	Jacob	Italiano	Australia	2001-07-30 00:00:00	Bor. Mönchengladbach	35	Forward	177	74	\N
ply1146	Nathan	N'Goumou	France	2000-03-14 00:00:00	Bor. Mönchengladbach	19	Forward	182	70	R
ply1147	Alassane	Pléa	France	1993-03-10 00:00:00	Bor. Mönchengladbach	14	Forward	181	79	R
ply1148	Lars	Stindl	Germany	1988-08-26 00:00:00	Bor. Mönchengladbach	13	Forward	181	80	R
ply1149	Marcus	Thuram	France	1997-08-06 00:00:00	Bor. Mönchengladbach	10	Forward	192	88	R
ply1150	Hannes	Wolf	Austria	1999-04-16 00:00:00	Bor. Mönchengladbach	11	Forward	179	69	L
ply1151	Uwe	Kamps	Germany	1964-06-12 00:00:00	Bor. Mönchengladbach	\N	Goalkeeping	180	79	\N
ply1152	Fabian	Otte	Germany	1990-12-04 00:00:00	Bor. Mönchengladbach	\N	Goalkeeping	187	75	R
ply1153	Chris	Domogalla	Germany	1986-01-20 00:00:00	Bor. Mönchengladbach	\N	Athletic	\N	\N	\N
ply1154	Quirin	Löppert	Germany	1987-05-01 00:00:00	Bor. Mönchengladbach	\N	Athletic	189	80	R
ply1155	Alexander	Mouhcine	Germany	1978-10-21 00:00:00	Bor. Mönchengladbach	\N	Athletic	\N	\N	\N
ply1156	Roman	Steinweg	Germany	\N	Bor. Mönchengladbach	\N	Athletic	\N	\N	\N
ply1157	Philipp	Schützendorf	Germany	1981-09-18 00:00:00	Bor. Mönchengladbach	\N	Video	\N	\N	\N
ply1158	Jonas	Lössl	Denmark	1989-02-01 00:00:00	FC Midtjylland	1	Goalkeeper	195	89	R
ply1159	Elías	Ólafsson	Iceland	2000-03-11 00:00:00	FC Midtjylland	16	Goalkeeper	201	\N	\N
ply1160	Mark	Ugboh	Nigeria	\N	FC Midtjylland	30	Goalkeeper	\N	\N	\N
ply1161	Joel	Andersson	Sweden	1996-11-11 00:00:00	FC Midtjylland	6	Defender	178	68	R
ply1162	Henrik	Dalsgaard	Denmark	1989-07-27 00:00:00	FC Midtjylland	14	Defender	192	81	R
ply1163	Nikolas	Dyhr	Denmark	2001-06-18 00:00:00	FC Midtjylland	44	Defender	177	60	L
ply1164	Stefan	Gartenmann	Denmark	1997-02-02 00:00:00	FC Midtjylland	4	Defender	185	75	R
ply1165	\N	Juninho	Brazil	1995-02-01 00:00:00	FC Midtjylland	73	Defender	187	80	L
ply1166	Pablo	Ortíz	Colombia	2000-06-08 00:00:00	FC Midtjylland	26	Defender	190	70	L
ply1167	\N	Paulinho	Brazil	1995-01-03 00:00:00	FC Midtjylland	29	Defender	178	71	L
ply1168	Erik	Sviatchenko	Denmark	1991-10-04 00:00:00	FC Midtjylland	28	Defender	184	82	R
ply1169	Pontus	Texel	Denmark	2004-02-27 00:00:00	FC Midtjylland	22	Defender	\N	\N	\N
ply1170	Mads	Thychosen	Denmark	1997-06-27 00:00:00	FC Midtjylland	17	Defender	178	65	R
ply1171	Valdemar	Andreasen	Denmark	2005-01-05 00:00:00	FC Midtjylland	20	Midfielder	\N	\N	\N
ply1172	\N	Charles	Brazil	1996-06-19 00:00:00	FC Midtjylland	35	Midfielder	187	81	R
ply1173	Edward	Chilufya	Zambia	1999-09-17 00:00:00	FC Midtjylland	18	Midfielder	171	65	R
ply1174	\N	Evander	Brazil	1998-06-09 00:00:00	FC Midtjylland	10	Midfielder	179	76	R
ply1175	Andreas	Hansen	Denmark	2003-05-31 00:00:00	FC Midtjylland	21	Midfielder	184	\N	\N
ply1176	Gustav	Isaksen	Denmark	2001-04-19 00:00:00	FC Midtjylland	11	Midfielder	178	\N	\N
ply1177	Chris	Kouakou	Ivory Coast	1999-12-15 00:00:00	FC Midtjylland	19	Midfielder	\N	\N	R
ply1178	Emiliano	Martínez	Uruguay	1999-08-17 00:00:00	FC Midtjylland	5	Midfielder	184	64	R
ply1179	Kristoffer	Olsson	Sweden	1995-06-30 00:00:00	FC Midtjylland	8	Midfielder	178	70	R
ply1180	Pione	Sisto	Denmark	1995-02-04 00:00:00	FC Midtjylland	7	Midfielder	171	64	R
ply1181	Oliver	Sørensen	Denmark	2002-03-10 00:00:00	FC Midtjylland	24	Midfielder	184	78	L
ply1182	Anders	Dreyer	Denmark	1998-05-02 00:00:00	FC Midtjylland	36	Forward	174	69	L
ply1183	Júnior	Brumado	Brazil	1999-05-15 00:00:00	FC Midtjylland	74	Forward	190	88	R
ply1184	Sory	Kaba	Guinea	1995-07-28 00:00:00	FC Midtjylland	9	Forward	190	80	R
ply1185	Juan	Moreno	Denmark	2002-09-21 00:00:00	FC Midtjylland	23	Forward	188	\N	\N
ply1186	Lasse	Heinze	Denmark	1986-04-03 00:00:00	FC Midtjylland	\N	Goalkeeping	184	78	R
ply1187	Oliver	Heil	Germany	1988-06-19 00:00:00	FC Midtjylland	\N	Game	182	78	\N
ply1188	Ádám	Bogdán	Hungary	1987-09-27 00:00:00	Ferencvárosi TC	1	Goalkeeper	194	92	R
ply1189	Dénes	Dibusz	Hungary	1990-11-16 00:00:00	Ferencvárosi TC	90	Goalkeeper	188	81	R
ply1190	Marcell	Kovács	Hungary	2003-02-09 00:00:00	Ferencvárosi TC	63	Goalkeeper	\N	\N	\N
ply1191	Szabolcs	Mergl	Hungary	2004-02-17 00:00:00	Ferencvárosi TC	61	Goalkeeper	\N	\N	\N
ply1192	Levente	Őri	Hungary	2003-04-29 00:00:00	Ferencvárosi TC	62	Goalkeeper	\N	\N	\N
ply1193	Gergő	Szécsi	Hungary	1989-02-07 00:00:00	Ferencvárosi TC	29	Goalkeeper	185	83	R
ply1194	Endre	Botka	Hungary	1994-08-25 00:00:00	Ferencvárosi TC	21	Defender	178	77	R
ply1195	Eldar	Čivić	Bosnia-Herzegovina	1996-05-28 00:00:00	Ferencvárosi TC	17	Defender	182	74	L
ply2737	Bryan	Ruiz	Costa Rica	1985-08-18 00:00:00	\N	10	Rica	187	81	L
ply1196	Mats	Knoester	Netherlands	1998-11-19 00:00:00	Ferencvárosi TC	4	Defender	186	77	L
ply1197	Adnan	Kovačević	Bosnia-Herzegovina	1993-09-09 00:00:00	Ferencvárosi TC	15	Defender	189	80	\N
ply1198	Samy	Mmaee	Morocco	1996-09-08 00:00:00	Ferencvárosi TC	3	Defender	188	80	R
ply1199	Olivér	Nagy	Hungary	2003-03-12 00:00:00	Ferencvárosi TC	56	Defender	\N	\N	\N
ply1200	Lóránd	Pászka	Hungary	1996-03-22 00:00:00	Ferencvárosi TC	23	Defender	186	\N	R
ply1201	Rasmus	Thelander	Denmark	1991-07-09 00:00:00	Ferencvárosi TC	25	Defender	191	87	R
ply1202	Henry	Wingo	USA	1995-10-04 00:00:00	Ferencvárosi TC	31	Defender	183	77	R
ply1203	Muhamed	Bešić	Bosnia-Herzegovina	1992-09-10 00:00:00	Ferencvárosi TC	5	Midfielder	180	75	R
ply1204	Anderson	Esiti	Nigeria	1994-05-24 00:00:00	Ferencvárosi TC	13	Midfielder	189	82	R
ply1205	Amer	Gojak	Bosnia-Herzegovina	1997-02-13 00:00:00	Ferencvárosi TC	14	Midfielder	184	78	R
ply1206	Giorgi	Kharaishvili	Georgia	1996-07-29 00:00:00	Ferencvárosi TC	27	Midfielder	183	\N	R
ply1207	Aïssa	Laïdouni	France	1996-12-13 00:00:00	Ferencvárosi TC	93	Midfielder	183	75	R
ply1208	Krisztián	Lisztes	Hungary	2005-05-06 00:00:00	Ferencvárosi TC	76	Midfielder	\N	\N	\N
ply1209	Xavier	Mercier	France	1989-07-25 00:00:00	Ferencvárosi TC	7	Midfielder	172	71	R
ply1210	Dávid	Sigér	Hungary	1990-11-30 00:00:00	Ferencvárosi TC	18	Midfielder	175	69	R
ply1211	Bálint	Vécsei	Hungary	1993-07-13 00:00:00	Ferencvárosi TC	19	Midfielder	185	82	L
ply1212	Kristoffer	Zachariassen	Norway	1994-01-27 00:00:00	Ferencvárosi TC	16	Midfielder	180	74	R
ply1213	Carlos	Auzqui	Argentina	1991-03-16 00:00:00	Ferencvárosi TC	28	Forward	180	72	R
ply1214	Franck	Boli	Ivory Coast	1993-12-07 00:00:00	Ferencvárosi TC	70	Forward	180	77	R
ply1215	Dániel	Gera	Hungary	1995-08-29 00:00:00	Ferencvárosi TC	\N	Forward	178	74	R
ply1216	\N	Marquinhos	Brazil	1999-10-24 00:00:00	Ferencvárosi TC	50	Forward	170	71	L
ply1217	Ryan	Mmaee	Morocco	1997-11-01 00:00:00	Ferencvárosi TC	8	Forward	184	82	R
ply1218	Tokmac	Nguen	Norway	1993-10-20 00:00:00	Ferencvárosi TC	10	Forward	174	68	R
ply1219	Damir	Redzic	Hungary	2003-03-23 00:00:00	Ferencvárosi TC	52	Forward	\N	\N	\N
ply1220	Tamás	Balogh	Hungary	1967-09-06 00:00:00	Ferencvárosi TC	\N	Goalkeeping	181	77	\N
ply1221	Gintaras	Staučė	Russia	1969-12-24 00:00:00	Ferencvárosi TC	\N	Goalkeeping	187	80	\N
ply1222	Péter	Bali	Hungary	1970-05-20 00:00:00	Ferencvárosi TC	\N	Fitness	\N	\N	\N
ply1223	Vladimir	Panikov	Russia	1969-11-14 00:00:00	Ferencvárosi TC	\N	Physical	\N	\N	\N
ply1224	Paulino	Granero	Spain	1970-02-17 00:00:00	Ferencvárosi TC	\N	Physical	\N	\N	\N
ply1225	Stanislav	Agkatsev	Russia	2002-01-09 00:00:00	FK Krasnodar	1	Goalkeeper	189	82	R
ply1226	Matvey	Safonov	Russia	1999-02-25 00:00:00	FK Krasnodar	39	Goalkeeper	192	82	R
ply1227	Mikhail	Shtepa	Russia	2003-03-19 00:00:00	FK Krasnodar	73	Goalkeeper	183	62	R
ply1228	Sergey	Borodin	Russia	1999-01-30 00:00:00	FK Krasnodar	44	Defender	187	77	L
ply1229	Oleg	Isaenko	Russia	2000-01-31 00:00:00	FK Krasnodar	48	Defender	166	62	L
ply1230	Kaio	Pantaleão	Brazil	1995-09-08 00:00:00	FK Krasnodar	31	Defender	183	76	R
ply1231	Vyacheslav	Litvinov	Russia	2001-04-01 00:00:00	FK Krasnodar	84	Defender	189	73	R
ply1232	Sergey	Petrov	Russia	1991-01-02 00:00:00	FK Krasnodar	98	Defender	175	71	R
ply1233	Dmitriy	Pivovarov	Russia	2000-03-21 00:00:00	FK Krasnodar	32	Defender	179	74	L
ply1234	Cristian	Ramírez	Ecuador	1994-08-12 00:00:00	FK Krasnodar	6	Defender	174	69	L
ply1235	Egor	Sorokin	Russia	1995-11-04 00:00:00	FK Krasnodar	80	Defender	189	81	L
ply1236	Mikhail	Sukhoruchenko	Russia	2003-04-13 00:00:00	FK Krasnodar	41	Defender	190	78	\N
ply1237	Sergey	Volkov	Russia	2002-09-09 00:00:00	\N	82	Defender	182	75	R
ply1238	Grigoriy	Zhilkin	Russia	2003-06-20 00:00:00	FK Krasnodar	28	Defender	175	68	\N
ply1239	Ilzat	Akhmetov	Russia	1997-12-31 00:00:00	FK Krasnodar	7	Midfielder	173	65	R
ply1240	Mihajlo	Banjac	Serbia	1999-11-10 00:00:00	FK Krasnodar	14	Midfielder	186	74	L
ply1241	Aleksandr	Chernikov	Russia	2000-02-01 00:00:00	FK Krasnodar	8	Midfielder	183	74	R
ply1242	João	Batxi	Portugal	1998-05-01 00:00:00	FK Krasnodar	19	Midfielder	174	64	R
ply1243	\N	Kevin	Cape Verde	1997-01-27 00:00:00	FK Krasnodar	16	Midfielder	190	\N	L
ply1244	David	Kokoev	Russia	2002-08-29 00:00:00	FK Krasnodar	38	Midfielder	178	58	R
ply1245	Dmitriy	Kratkov	Russia	2002-01-15 00:00:00	FK Krasnodar	26	Midfielder	175	66	R
ply1246	Nikita	Krivtsov	Russia	2002-08-18 00:00:00	FK Krasnodar	88	Midfielder	188	83	R
ply1247	Aleks	Matsukatov	Russia	1999-01-11 00:00:00	FK Krasnodar	15	Midfielder	180	78	R
ply1248	Ifeany	Ndouka	Nigeria	2003-12-02 00:00:00	FK Krasnodar	61	Midfielder	182	78	\N
ply1249	Eduard	Spertsyan	Armenia	2000-06-07 00:00:00	FK Krasnodar	10	Midfielder	178	66	R
ply1250	Vyacheslav	Yakimov	Russia	1998-01-05 00:00:00	FK Krasnodar	23	Midfielder	178	69	R
ply1251	Ruslan	Apekov	Russia	2000-06-08 00:00:00	FK Krasnodar	92	Forward	172	63	R
ply1252	Jhon	Córdoba	Colombia	1993-05-11 00:00:00	FK Krasnodar	9	Forward	188	85	R
ply1253	Aleksey	Ionov	Russia	1989-02-18 00:00:00	FK Krasnodar	11	Forward	177	69	R
ply1254	Danil	Karpov	Russia	1999-06-28 00:00:00	FK Krasnodar	21	Forward	179	75	R
ply1255	Rustam	Khalnazarov	Russia	2000-07-20 00:00:00	FK Krasnodar	72	Forward	173	64	\N
ply1256	Aleksandr	Koksharov	Russia	2004-12-20 00:00:00	\N	96	Forward	188	71	R
ply1257	Dmitriy	Kuchugura	Russia	2004-10-21 00:00:00	\N	94	Forward	179	70	R
ply1258	Maksim	Kutovoi	Russia	2001-07-01 00:00:00	FK Krasnodar	67	Forward	187	74	R
ply1259	Irakliy	Manelov	Russia	2002-09-19 00:00:00	FK Krasnodar	69	Forward	173	69	R
ply1260	Jonathan	Okoronkwo	Nigeria	2003-09-13 00:00:00	FK Krasnodar	85	Forward	175	\N	R
ply1261	Olakunle	Olusegun	Nigeria	2002-04-23 00:00:00	FK Krasnodar	40	Forward	170	70	R
ply1262	Vladislav	Samko	Russia	2002-01-03 00:00:00	FK Krasnodar	70	Forward	173	63	\N
ply1263	Volkan	Babacan	Turkey	1988-08-11 00:00:00	İstanbul Başakşehir	1	Goalkeeper	192	86	R
ply1264	Deniz	Dilmen	Turkey	2005-06-05 00:00:00	İstanbul Başakşehir	98	Goalkeeper	\N	\N	L
ply1265	Muhammed	Şengezer	Turkey	1997-01-05 00:00:00	\N	\N	Goalkeeper	192	80	R
ply1266	Alexandru	Epureanu	Moldova	1986-09-27 00:00:00	İstanbul Başakşehir	6	Defender	189	76	L
ply1267	Junior	Caiçara	Brazil	1989-04-27 00:00:00	İstanbul Başakşehir	80	Defender	173	70	R
ply1268	Hasan Ali	Kaldırım	Turkey	1989-12-09 00:00:00	İstanbul Başakşehir	3	Defender	183	75	L
ply1269	Eren	Karaagac	France	2004-05-24 00:00:00	İstanbul Başakşehir	\N	Defender	\N	\N	\N
ply1270	Efe	Koyuncu	Turkey	2005-07-08 00:00:00	İstanbul Başakşehir	41	Defender	\N	\N	\N
ply1271	Léo	Duarte	Brazil	1996-07-17 00:00:00	İstanbul Başakşehir	5	Defender	183	83	R
ply1272	Lucas	Lima	Brazil	1991-10-10 00:00:00	İstanbul Başakşehir	60	Defender	179	72	L
ply1273	Youssouf	Ndayishimiye	Burundi	1998-10-27 00:00:00	İstanbul Başakşehir	55	Defender	183	76	R
ply1274	Muharrem	Öner	Turkey	1999-12-29 00:00:00	İstanbul Başakşehir	\N	Defender	\N	\N	R
ply1275	Şener	Özbayraklı	Turkey	1990-01-23 00:00:00	İstanbul Başakşehir	2	Defender	171	71	R
ply1276	Ömer	Şahiner	Turkey	1992-01-02 00:00:00	İstanbul Başakşehir	42	Defender	175	70	R
ply1277	Ahmed	Touba	Algeria	1998-03-13 00:00:00	İstanbul Başakşehir	59	Defender	190	75	L
ply1278	Muhammet	Yazıcı	Turkey	2002-12-01 00:00:00	İstanbul Başakşehir	53	Defender	\N	\N	R
ply1279	Danijel	Aleksić	Serbia	1991-04-30 00:00:00	İstanbul Başakşehir	8	Midfielder	182	75	L
ply1280	Okechukwu	Azubuike	Nigeria	1997-04-19 00:00:00	İstanbul Başakşehir	\N	Midfielder	170	73	R
ply1281	Sekou	Bangoura	Guinea	2002-04-05 00:00:00	İstanbul Başakşehir	97	Midfielder	\N	\N	\N
ply1282	Lucas	Biglia	Argentina	1986-01-30 00:00:00	İstanbul Başakşehir	20	Midfielder	178	63	R
ply1283	Francis	Nzaba	Congo	2002-07-17 00:00:00	İstanbul Başakşehir	\N	Midfielder	\N	\N	R
ply1284	Berkay	Özcan	Turkey	1998-02-15 00:00:00	İstanbul Başakşehir	19	Midfielder	180	79	R
ply1285	Mesut	Özil	Germany	1988-10-15 00:00:00	İstanbul Başakşehir	10	Midfielder	180	71	L
ply1286	Mahmut	Tekdemir	Turkey	1988-01-20 00:00:00	İstanbul Başakşehir	21	Midfielder	178	72	\N
ply1287	Deniz	Türüç	Turkey	1993-01-29 00:00:00	İstanbul Başakşehir	23	Midfielder	177	72	L
ply1288	Muhammet	Arslantaş	Turkey	2001-01-27 00:00:00	İstanbul Başakşehir	34	Forward	188	86	R
ply1289	Batuhan	Çelik	Turkey	2005-01-12 00:00:00	İstanbul Başakşehir	15	Forward	\N	\N	R
ply1290	Mounir	Chouiar	France	1999-01-23 00:00:00	İstanbul Başakşehir	11	Forward	177	77	R
ply1291	Serdar	Gürler	Turkey	1991-09-14 00:00:00	İstanbul Başakşehir	7	Forward	175	65	R
ply1292	Enes	Karakuş	Turkey	2001-01-03 00:00:00	İstanbul Başakşehir	\N	Forward	193	83	R
ply1293	Philippe	Keny	Senegal	1999-05-18 00:00:00	İstanbul Başakşehir	\N	Forward	190	80	R
ply1294	Stefano	Okaka	Italy	1989-08-09 00:00:00	İstanbul Başakşehir	77	Forward	186	82	R
ply1295	Patryk	Szysz	Poland	1998-04-01 00:00:00	İstanbul Başakşehir	18	Forward	177	70	R
ply1296	Bertrand	Traoré	Burkina Faso	1995-09-06 00:00:00	İstanbul Başakşehir	\N	Forward	181	73	L
ply1297	Murat	Öztürk	Turkey	1969-12-05 00:00:00	İstanbul Başakşehir	\N	Goalkeeping	\N	\N	\N
ply1298	Marius	Adamonis	Lithuania	1997-05-13 00:00:00	Lazio Roma	31	Goalkeeper	191	80	R
ply1299	Luís	Maximiano	Portugal	1999-01-05 00:00:00	Lazio Roma	1	Goalkeeper	190	82	\N
ply1300	Federico	Magro	Italy	2005-01-10 00:00:00	Lazio Roma	61	Goalkeeper	189	\N	R
ply1301	Ivan	Provedel	Italy	1994-03-17 00:00:00	Lazio Roma	94	Goalkeeper	192	82	R
ply1302	Enzo	Adeagbo	Switzerland	2002-01-11 00:00:00	Lazio Roma	83	Defender	191	78	R
ply1303	Nicolò	Casale	Italy	1998-02-14 00:00:00	Lazio Roma	15	Defender	191	82	R
ply1304	Romano	Floriani	Italy	2003-01-27 00:00:00	Lazio Roma	44	Defender	188	\N	R
ply1305	\N	Gila	Spain	2000-08-29 00:00:00	Lazio Roma	34	Defender	185	78	R
ply1306	Elseid	Hysaj	Albania	1994-02-02 00:00:00	Lazio Roma	23	Defender	182	75	R
ply1307	Dimitrije	Kamenović	Serbia	2000-07-16 00:00:00	Lazio Roma	16	Defender	188	83	L
ply1308	Adam	Marušić	Montenegro	1992-10-17 00:00:00	Lazio Roma	77	Defender	185	76	R
ply1309	\N	Patric	Spain	1993-04-17 00:00:00	Lazio Roma	4	Defender	184	72	R
ply1310	Stefan	Radu	Romania	1986-10-22 00:00:00	Lazio Roma	26	Defender	183	79	L
ply1311	Alessio	Romagnoli	Italy	1995-01-12 00:00:00	Lazio Roma	13	Defender	185	78	L
ply1312	Toma	Bašić	Croatia	1996-11-25 00:00:00	Lazio Roma	88	Midfielder	190	80	L
ply1313	Marco	Bertini	Italy	2002-08-07 00:00:00	Lazio Roma	50	Midfielder	185	68	R
ply1314	Danilo	Cataldi	Italy	1994-08-06 00:00:00	Lazio Roma	32	Midfielder	180	75	R
ply1315	Mohamed	Fares	Algeria	1996-02-15 00:00:00	Lazio Roma	93	Midfielder	183	75	L
ply1316	Manuel	Lazzari	Italy	1993-11-29 00:00:00	Lazio Roma	29	Midfielder	174	67	R
ply1317	Luis	Alberto	Spain	1992-11-28 00:00:00	Lazio Roma	10	Midfielder	183	74	R
ply1318	Marcos	Antônio	Brazil	2000-06-13 00:00:00	Lazio Roma	6	Midfielder	166	63	R
ply1319	Sergej	Milinković-Savić	Serbia	1995-02-27 00:00:00	Lazio Roma	21	Midfielder	191	82	R
ply1320	Luka	Romero	Argentina	2004-11-18 00:00:00	Lazio Roma	18	Midfielder	165	64	L
ply1321	Matías	Vecino	Uruguay	1991-08-24 00:00:00	Lazio Roma	5	Midfielder	187	81	R
ply1322	Mattia	Zaccagni	Italy	1995-06-16 00:00:00	Lazio Roma	20	Midfielder	176	63	R
ply1323	Matteo	Cancellieri	Italy	2002-02-12 00:00:00	Lazio Roma	11	Forward	180	78	L
ply1324	Felipe	Anderson	Brazil	1993-04-15 00:00:00	Lazio Roma	7	Forward	175	70	R
ply1325	Ciro	Immobile	Italy	1990-02-20 00:00:00	Lazio Roma	17	Forward	185	85	R
ply1326	\N	Pedro	Spain	1987-07-28 00:00:00	Lazio Roma	9	Forward	167	64	\N
ply1327	\N	Guilherme	Russia	1985-12-12 00:00:00	Lokomotiv Moskva	1	Goalkeeper	197	96	R
ply1328	Daniil	Khudyakov	Russia	2004-01-09 00:00:00	Lokomotiv Moskva	53	Goalkeeper	194	85	R
ply1329	Nikita	Matyunin	Russia	2004-04-27 00:00:00	Lokomotiv Moskva	54	Goalkeeper	194	83	R
ply1330	Andrey	Savin	Russia	1999-08-30 00:00:00	Lokomotiv Moskva	60	Goalkeeper	194	89	R
ply1331	Lucas	Fasson	Brazil	2001-05-30 00:00:00	Lokomotiv Moskva	3	Defender	190	79	L
ply1332	Mikhail	Ivankov	Russia	2001-06-17 00:00:00	Lokomotiv Moskva	66	Defender	196	88	R
ply1333	Tin	Jedvaj	Croatia	1995-11-28 00:00:00	Lokomotiv Moskva	16	Defender	185	81	R
ply1334	Ivan	Kuzmichev	Russia	2000-10-20 00:00:00	Lokomotiv Moskva	20	Defender	196	86	R
ply1335	Mark	Mampassi	Ukraine	2003-03-12 00:00:00	Lokomotiv Moskva	18	Defender	185	76	R
ply1336	Mario	Mitaj	Albania	2003-08-06 00:00:00	Lokomotiv Moskva	12	Defender	185	71	L
ply1337	Maksim	Nenakhov	Russia	1998-12-13 00:00:00	Lokomotiv Moskva	24	Defender	178	69	\N
ply1338	Egor	Pogostnov	Russia	2004-03-01 00:00:00	Lokomotiv Moskva	59	Defender	196	86	R
ply1339	Nayair	Tiknizyan	Russia	1999-05-12 00:00:00	Lokomotiv Moskva	71	Defender	180	75	L
ply1340	Dmitri	Zhivoglyadov	Russia	1994-05-29 00:00:00	Lokomotiv Moskva	2	Defender	178	65	R
ply1341	Dmitry	Barinov	Russia	1996-09-11 00:00:00	Lokomotiv Moskva	6	Midfielder	179	72	\N
ply1342	Ilya	Belikov	Russia	2003-05-23 00:00:00	Lokomotiv Moskva	95	Midfielder	184	71	\N
ply1343	Artem	Karpukas	Russia	2002-06-13 00:00:00	Lokomotiv Moskva	93	Midfielder	184	75	R
ply1344	Daniil	Kulikov	Russia	1998-06-24 00:00:00	Lokomotiv Moskva	69	Midfielder	178	66	R
ply1345	Stanislav	Magkeev	Russia	1999-03-27 00:00:00	Lokomotiv Moskva	4	Midfielder	187	76	R
ply1346	Konstantin	Maradishvili	Russia	2000-02-07 00:00:00	Lokomotiv Moskva	5	Midfielder	181	75	R
ply1347	Anton	Miranchuk	Russia	1995-10-17 00:00:00	Lokomotiv Moskva	11	Midfielder	183	72	R
ply1348	Daniil	Popov	Russia	2004-02-27 00:00:00	Lokomotiv Moskva	89	Midfielder	177	67	R
ply1349	Mikhail	Shchetinin	Russia	2005-07-08 00:00:00	Lokomotiv Moskva	43	Midfielder	170	67	\N
ply1350	Rifat	Zhemaletdinov	Russia	1996-09-20 00:00:00	Lokomotiv Moskva	17	Midfielder	184	80	R
ply1351	Abdula	Bagamaev	Russia	2004-10-18 00:00:00	Lokomotiv Moskva	92	Forward	\N	\N	\N
ply1352	Ivan	Ignatyev	Russia	1999-01-06 00:00:00	Lokomotiv Moskva	9	Forward	180	72	R
ply1353	Wilson	Isidor	France	2000-08-27 00:00:00	Lokomotiv Moskva	10	Forward	180	67	R
ply1354	François	Kamano	Guinea	1996-05-02 00:00:00	Lokomotiv Moskva	25	Forward	182	77	R
ply1355	Gyrano	Kerk	Netherlands	1995-12-02 00:00:00	Lokomotiv Moskva	7	Forward	175	68	R
ply1356	\N	Pedrinho	Brazil	1999-11-10 00:00:00	Lokomotiv Moskva	29	Forward	176	64	R
ply1357	Marko	Rakonjac	Montenegro	2000-04-25 00:00:00	Lokomotiv Moskva	77	Forward	192	78	R
ply1358	Vadim	Rakov	Russia	2005-01-09 00:00:00	Lokomotiv Moskva	27	Forward	\N	\N	R
ply1359	Ögmundur	Kristinsson	Iceland	1989-06-19 00:00:00	Olympiakos Piraeus	31	Goalkeeper	193	89	R
ply1360	Athanasios-Theologos	Papadoudis	Greece	2003-09-06 00:00:00	Olympiakos Piraeus	99	Goalkeeper	192	\N	\N
ply1361	Alexandros	Paschalakis	Greece	1989-07-28 00:00:00	Olympiakos Piraeus	\N	Goalkeeper	197	88	R
ply1362	Konstantinos	Tzolakis	Greece	2002-11-08 00:00:00	\N	88	Goalkeeper	193	\N	R
ply1363	Tomáš	Vaclík	Czech Republic	1989-03-29 00:00:00	Olympiakos Piraeus	1	Goalkeeper	189	85	R
ply1364	Athanasios	Androutsos	Greece	1997-05-06 00:00:00	Olympiakos Piraeus	14	Defender	182	65	R
ply1365	Ousseynou	Ba	Senegal	1995-11-11 00:00:00	Olympiakos Piraeus	24	Defender	192	84	R
ply1366	Pape	Cissé	Senegal	1995-09-14 00:00:00	Olympiakos Piraeus	66	Defender	197	83	R
ply1367	Etienne	Kinkoue	France	2002-01-14 00:00:00	Olympiakos Piraeus	90	Defender	195	\N	R
ply1368	Leonardo	Koutris	Greece	1995-07-23 00:00:00	Olympiakos Piraeus	23	Defender	170	71	L
ply1369	Kenny	Lala	France	1991-10-03 00:00:00	Olympiakos Piraeus	27	Defender	178	78	R
ply1370	Doron	Leidner	Israel	2002-04-26 00:00:00	Olympiakos Piraeus	16	Defender	178	\N	L
ply1371	\N	Marcelo	Brazil	1988-05-12 00:00:00	Olympiakos Piraeus	12	Defender	174	75	L
ply1372	Giannis	Masouras	Greece	1996-08-24 00:00:00	Olympiakos Piraeus	\N	Defender	181	75	R
ply1373	Nemanja	Nikolić	Bosnia-Herzegovina	2001-02-21 00:00:00	Olympiakos Piraeus	70	Defender	180	\N	R
ply1374	Sokratis	Papastathopoulos	Greece	1988-06-09 00:00:00	Olympiakos Piraeus	15	Defender	186	85	R
ply1375	\N	Pipa	Spain	1998-01-26 00:00:00	Olympiakos Piraeus	26	Defender	175	68	R
ply1376	Oleg	Reabciuk	Moldova	1998-01-16 00:00:00	Olympiakos Piraeus	45	Defender	180	72	L
ply1377	Panagiotis	Retsos	Greece	1998-08-09 00:00:00	Olympiakos Piraeus	4	Defender	186	75	R
ply1378	Šime	Vrsaljko	Croatia	1992-01-10 00:00:00	Olympiakos Piraeus	2	Defender	181	76	R
ply1379	Andreas	Bouchalakis	Greece	1993-04-05 00:00:00	Olympiakos Piraeus	5	Midfielder	186	83	L
ply1380	Aguibou	Camara	Guinea	2001-05-20 00:00:00	Olympiakos Piraeus	22	Midfielder	167	60	L
ply1381	Kostas	Fortounis	Greece	1992-10-16 00:00:00	Olympiakos Piraeus	53	Midfielder	183	69	\N
ply1382	In-beom	Hwang	South Korea	1996-09-20 00:00:00	Olympiakos Piraeus	33	Midfielder	177	70	\N
ply1383	Pajtim	Kasami	Switzerland	1992-06-02 00:00:00	Olympiakos Piraeus	\N	Midfielder	188	87	L
ply1384	Ioannis	Kosti	Cyprus	2000-03-17 00:00:00	Olympiakos Piraeus	79	Midfielder	170	\N	\N
ply1385	Yann	M'Vila	France	1990-06-29 00:00:00	Olympiakos Piraeus	6	Midfielder	182	80	R
ply1386	Pierre	Malong	Cameroon	1995-07-26 00:00:00	Olympiakos Piraeus	8	Midfielder	180	79	R
ply1387	Andreas	Ndoj	Albania	2003-02-02 00:00:00	\N	74	Midfielder	190	\N	R
ply1388	Pep	Biel	Spain	1996-09-05 00:00:00	Olympiakos Piraeus	21	Midfielder	167	64	L
ply1389	Garry	Rodrigues	Cape Verde	1990-11-27 00:00:00	Olympiakos Piraeus	77	Midfielder	173	70	R
ply1390	James	Rodríguez	Colombia	1991-07-12 00:00:00	Olympiakos Piraeus	10	Midfielder	181	78	L
ply1391	Diadié	Samassékou	Mali	1996-01-11 00:00:00	Olympiakos Piraeus	38	Midfielder	175	70	R
ply1392	Mathieu	Valbuena	France	1984-09-28 00:00:00	Olympiakos Piraeus	28	Midfielder	167	58	R
ply1393	Cédric	Bakambu	Congo DR	1991-04-11 00:00:00	Olympiakos Piraeus	94	Forward	182	73	R
ply1394	Josh	Bowler	England	1999-03-05 00:00:00	Olympiakos Piraeus	20	Forward	181	73	L
ply1395	Konrad de la	Fuente	USA	2001-07-16 00:00:00	Olympiakos Piraeus	30	Forward	176	73	R
ply1396	\N	Diby	Spain	2003-07-08 00:00:00	Olympiakos Piraeus	85	Forward	174	59	L
ply1397	Youssef	El-Arabi	Morocco	1987-02-03 00:00:00	Olympiakos Piraeus	11	Forward	183	84	R
ply1398	Ui-jo	Hwang	South Korea	1992-08-28 00:00:00	Olympiakos Piraeus	18	Forward	185	73	\N
ply1399	Aboubakar	Kamara	Mauritania	1995-03-07 00:00:00	Olympiakos Piraeus	47	Forward	177	75	R
ply1400	Georgios	Masouras	Greece	1994-01-01 00:00:00	Olympiakos Piraeus	19	Forward	184	75	R
ply1401	Marios	Vrousai	Greece	1998-07-02 00:00:00	Olympiakos Piraeus	17	Forward	183	78	\N
ply1402	Panagiotis	Agriogiannis	Greece	1979-07-02 00:00:00	Olympiakos Piraeus	\N	Goalkeeping	\N	\N	\N
ply1403	Simon	Ngapandouetnbu	Cameroon	2003-04-12 00:00:00	Olympique Marseille	1	Goalkeeper	180	76	R
ply1404	Pau	López	Spain	1994-12-13 00:00:00	Olympique Marseille	16	Goalkeeper	189	77	L
ply1405	Rubén	Blanco	Spain	1995-07-25 00:00:00	Olympique Marseille	36	Goalkeeper	189	80	R
ply1406	Eric	Bailly	Ivory Coast	1994-04-12 00:00:00	Olympique Marseille	3	Defender	187	77	R
ply1407	Leonardo	Balerdi	Argentina	1999-01-26 00:00:00	Olympique Marseille	5	Defender	188	72	R
ply1408	Samuel	Gigot	France	1993-10-12 00:00:00	Olympique Marseille	4	Defender	187	83	R
ply1409	Issa	Kabore	Burkina Faso	2001-05-12 00:00:00	Olympique Marseille	29	Defender	180	70	R
ply1410	Aaron	Kamardin	France	2002-04-08 00:00:00	Olympique Marseille	37	Defender	183	77	R
ply1411	Sead	Kolašinac	Bosnia-Herzegovina	1993-06-20 00:00:00	Olympique Marseille	23	Defender	183	85	L
ply1412	Nuno	Tavares	Portugal	2000-01-26 00:00:00	Olympique Marseille	30	Defender	184	76	L
ply1413	Yakine Said	M'Madi	France	2004-03-11 00:00:00	Olympique Marseille	42	Defender	183	\N	R
ply1414	Souleymane Isaak	Touré	France	2003-03-28 00:00:00	Olympique Marseille	18	Defender	190	75	L
ply1415	Ugo	Bertelli	France	2003-07-15 00:00:00	Olympique Marseille	31	Midfielder	168	54	R
ply1416	Jonathan	Clauss	France	1992-09-25 00:00:00	Olympique Marseille	7	Midfielder	185	67	R
ply1417	\N	Gerson	Brazil	1997-05-20 00:00:00	Olympique Marseille	8	Midfielder	184	76	L
ply1418	Mattéo	Guendouzi	France	1999-04-14 00:00:00	Olympique Marseille	6	Midfielder	185	68	R
ply1419	Pape	Gueye	Senegal	1999-01-24 00:00:00	Olympique Marseille	22	Midfielder	189	70	L
ply1420	Amine	Harit	Morocco	1997-06-18 00:00:00	Olympique Marseille	77	Midfielder	180	67	R
ply1421	Bilal	Nadir	France	2003-11-28 00:00:00	Olympique Marseille	39	Midfielder	179	62	L
ply1422	Dimitri	Payet	France	1987-03-29 00:00:00	Olympique Marseille	10	Midfielder	175	77	R
ply1423	Valentin	Rongier	France	1994-12-07 00:00:00	Olympique Marseille	21	Midfielder	172	70	R
ply1424	Paolo	Sciortino	France	2003-11-05 00:00:00	Olympique Marseille	34	Midfielder	177	70	R
ply1425	Cheick	Souaré	France	2002-09-03 00:00:00	Olympique Marseille	41	Midfielder	170	61	L
ply1426	Jordan	Veretout	France	1993-03-01 00:00:00	Olympique Marseille	27	Midfielder	177	75	R
ply1427	Salim Ben	Seghir	France	2003-02-24 00:00:00	Olympique Marseille	32	Forward	174	57	R
ply1428	Bamba	Dieng	Senegal	2000-03-23 00:00:00	Olympique Marseille	12	Forward	178	72	R
ply1429	Pedro	Ruiz	Spain	2000-03-30 00:00:00	Olympique Marseille	\N	Forward	198	89	L
ply1430	Luis	Suárez	Colombia	1997-12-02 00:00:00	Olympique Marseille	11	Forward	185	79	R
ply1431	Cengiz	Ünder	Turkey	1997-07-14 00:00:00	Olympique Marseille	17	Forward	173	66	L
ply1432	Doğan	Alemdar	Turkey	2002-10-29 00:00:00	Stade Rennes	40	Goalkeeper	189	73	R
ply1433	Elias	Damergy	Tunisia	2002-10-17 00:00:00	Stade Rennes	50	Goalkeeper	187	76	R
ply1434	Alfred	Gomis	Senegal	1993-09-05 00:00:00	Stade Rennes	16	Goalkeeper	196	87	R
ply1435	Steve	Mandanda	France	1985-03-28 00:00:00	Stade Rennes	30	Goalkeeper	185	82	R
ply1436	Romain	Salin	France	1984-07-29 00:00:00	Stade Rennes	1	Goalkeeper	185	76	L
ply1437	Lorenz	Assignon	France	2000-06-22 00:00:00	Stade Rennes	22	Defender	179	67	R
ply1438	Jeanuël	Belocian	France	2005-02-17 00:00:00	Stade Rennes	33	Defender	186	73	L
ply1439	Guela	Doué	France	2002-10-17 00:00:00	Stade Rennes	31	Defender	184	\N	\N
ply1440	Birger	Meling	Norway	1994-12-17 00:00:00	Stade Rennes	25	Defender	173	64	L
ply1441	Warmed	Omari	France	2000-04-23 00:00:00	Stade Rennes	23	Defender	185	78	R
ply1442	Joe	Rodon	Wales	1997-10-22 00:00:00	Stade Rennes	2	Defender	193	76	R
ply1443	Arthur	Theate	Belgium	2000-05-25 00:00:00	Stade Rennes	5	Defender	186	79	L
ply1444	Hamari	Traoré	Mali	1992-01-27 00:00:00	Stade Rennes	27	Defender	175	71	R
ply1445	Adrien	Truffert	France	2001-11-20 00:00:00	Stade Rennes	3	Defender	173	63	L
ply1446	Christopher	Wooh	France	2001-09-18 00:00:00	Stade Rennes	15	Defender	190	78	R
ply1447	Benjamin	Bourigeaud	France	1994-01-14 00:00:00	Stade Rennes	14	Midfielder	178	68	R
ply1448	Désiré	Doué	France	2005-06-03 00:00:00	\N	\N	Midfielder	177	\N	R
ply1449	Noah	Françoise	France	2003-07-05 00:00:00	Stade Rennes	35	Midfielder	173	59	R
ply1450	Lovro	Majer	Croatia	1998-01-17 00:00:00	Stade Rennes	21	Midfielder	179	75	L
ply1451	Baptiste	Santamaría	France	1995-03-09 00:00:00	Stade Rennes	8	Midfielder	183	73	R
ply1452	Flavien	Tait	France	1993-02-02 00:00:00	Stade Rennes	20	Midfielder	175	70	R
ply1453	Chimuanya	Ugochukwu	France	2004-03-26 00:00:00	Stade Rennes	26	Midfielder	188	83	R
ply1454	\N	Xeka	Portugal	1994-11-10 00:00:00	Stade Rennes	\N	Midfielder	186	79	\N
ply1455	Matthis	Abline	France	2003-03-28 00:00:00	Stade Rennes	28	Forward	176	70	R
ply1456	Jérémy	Doku	Belgium	2002-05-27 00:00:00	Stade Rennes	11	Forward	171	61	R
ply1457	Amine	Gouiri	France	2000-02-16 00:00:00	Stade Rennes	19	Forward	180	72	R
ply1458	Arnaud	Kalimuendo	France	2002-01-20 00:00:00	Stade Rennes	9	Forward	178	78	R
ply1459	Kamaldeen	Sulemana	Ghana	2002-02-15 00:00:00	Stade Rennes	10	Forward	174	68	R
ply1460	Martin	Terrier	France	1997-03-04 00:00:00	Stade Rennes	7	Forward	184	73	R
ply1461	Patson	Daka	Zambia	1998-10-09 00:00:00	\N	20	Forward	185	81	R
ply1462	Vitaliy	Lisakovich	Belarus	1998-02-08 00:00:00	\N	44	Forward	179	73	L
ply1463	Zé	Luís	Cape Verde	1991-01-24 00:00:00	\N	\N	Forward	184	80	L
ply1464	Javi	Martínez	Spain	1988-09-02 00:00:00	\N	8	Midfielder	192	86	R
ply1465	Mërgim	Berisha	Germany	1998-05-11 00:00:00	\N	11	Forward	188	78	R
ply1466	Héctor	Herrera	Mexico	1990-04-19 00:00:00	\N	16	Midfielder	185	78	R
ply1467	Masaya	Okugawa	Japan	1996-04-14 00:00:00	\N	11	Midfielder	177	68	\N
ply1468	André	Ramalho	Brazil	1992-02-16 00:00:00	\N	5	Defender	182	78	\N
ply1469	Jérôme	Boateng	Germany	1988-09-03 00:00:00	\N	17	Defender	192	90	R
ply1470	Enock	Mwepu	Zambia	1998-01-01 00:00:00	\N	12	Midfielder	184	76	R
ply1471	Douglas	Costa	Brazil	1990-09-14 00:00:00	\N	10	Forward	172	70	L
ply1472	\N	Tetê	Brazil	2000-02-15 00:00:00	\N	11	Forward	175	67	L
ply1474	Breel	Embolo	Switzerland	1997-02-14 00:00:00	\N	36	Forward	187	88	R
ply1475	Oscar	Wendt	Sweden	1985-10-24 00:00:00	\N	17	Defender	181	82	L
ply1476	\N	Dentinho	Brazil	1989-01-19 00:00:00	\N	31	Forward	176	75	R
ply1477	Valentino	Lazaro	Austria	1996-03-24 00:00:00	\N	19	Defender	180	75	R
ply1478	Ahmed	Hassan	Egypt	1993-03-05 00:00:00	\N	\N	Forward	191	78	R
ply1479	Moussa	Marega	Mali	1991-04-14 00:00:00	\N	17	Arabia	183	83	R
ply1480	Mady	Camara	Guinea	1997-02-28 00:00:00	\N	20	Midfielder	182	76	R
ply1481	Florian	Thauvin	France	1993-01-26 00:00:00	\N	26	Midfielder	181	77	L
ply1482	Álvaro	González	Spain	1990-01-08 00:00:00	\N	21	Arabia	183	75	R
ply1483	Cristian	Romero	Argentina	1998-04-27 00:00:00	\N	17	Defender	185	79	R
ply1484	Quincy	Promes	Netherlands	1992-01-04 00:00:00	\N	10	Forward	174	72	R
ply1485	Jens-Lys	Cajuste	Sweden	1999-08-10 00:00:00	\N	8	Midfielder	188	77	R
ply1486	Awer	Mabil	Australia	1995-09-15 00:00:00	\N	17	Forward	179	65	R
ply1487	Alexander	Scholz	Denmark	1992-10-24 00:00:00	\N	28	Defender	189	84	R
ply1488	Neco	Williams	Wales	2001-04-13 00:00:00	\N	7	Defender	183	72	R
ply1489	Serhou	Guirassy	France	1996-03-12 00:00:00	\N	9	Forward	187	82	R
ply1490	Tonny	Vilhena	Netherlands	1995-01-03 00:00:00	\N	10	Midfielder	175	71	L
ply1491	Tammy	Abraham	England	1997-10-02 00:00:00	\N	9	Forward	190	80	R
ply1492	Luuk de	Jong	Netherlands	1990-08-27 00:00:00	\N	9	Forward	188	86	R
ply1493	Shapi	Suleymanov	Russia	1999-12-16 00:00:00	\N	93	Forward	171	69	L
ply1494	Marcus	Berg	Sweden	1986-08-17 00:00:00	\N	9	Forward	184	76	R
ply1495	\N	Wanderson	Brazil	1994-10-07 00:00:00	\N	11	Forward	175	71	R
ply1496	\N	Munir	Morocco	1995-09-01 00:00:00	\N	17	Forward	175	69	L
ply1497	Aleksandr	Martinovich	Belarus	1987-08-26 00:00:00	\N	4	Defender	192	85	R
ply1498	Victor	Claesson	Sweden	1992-01-02 00:00:00	\N	7	Midfielder	183	79	R
ply1499	Oussama	Idrissi	Morocco	1996-02-26 00:00:00	\N	26	Forward	175	78	R
ply1500	\N	Óscar	Spain	1998-06-28 00:00:00	\N	5	Midfielder	174	67	R
ply1501	Georginio	Rutter	France	2002-04-20 00:00:00	\N	33	Forward	182	77	\N
ply1502	Emmanuel	Dennis	Nigeria	1997-11-15 00:00:00	\N	25	Forward	175	67	R
ply1503	Ethan	Horvath	USA	1995-06-09 00:00:00	\N	34	Goalkeeper	195	90	R
ply1504	Marwin	Hitz	Switzerland	1987-09-18 00:00:00	\N	1	Goalkeeper	194	91	\N
ply1505	Jean-Daniel	Akpa-Akpro	Ivory Coast	1992-10-11 00:00:00	\N	11	Midfielder	180	71	R
ply1506	Felipe	Caicedo	Ecuador	1988-09-05 00:00:00	\N	20	Arabia	183	78	L
ply1507	Lucas	Leiva	Brazil	1987-01-09 00:00:00	\N	\N	Midfielder	179	74	R
ply1508	Sebastián	Driussi	Argentina	1996-02-09 00:00:00	\N	7	Forward	179	78	\N
ply1509	\N	Coutinho	Brazil	1992-06-12 00:00:00	\N	23	Midfielder	172	66	R
ply1510	Igor	Kharatin	Ukraine	1995-02-02 00:00:00	\N	14	Midfielder	188	80	R
ply1511	Carlos de	Pena	Uruguay	1992-03-11 00:00:00	\N	14	Midfielder	177	69	L
ply1512	Lasha	Dvali	Georgia	1995-05-14 00:00:00	\N	5	Defender	191	80	L
ply1513	Martin	Braithwaite	Denmark	1991-06-05 00:00:00	\N	17	Forward	177	73	R
ply1514	Óscar	Mingueza	Spain	1999-05-13 00:00:00	\N	3	Defender	184	74	R
ply1515	Myrto	Uzuni	Albania	1995-05-31 00:00:00	\N	11	Forward	178	72	R
ply1516	Edin	Višća	Bosnia-Herzegovina	1990-02-17 00:00:00	\N	7	Forward	172	67	R
ply1517	Daniel	James	Wales	1997-11-10 00:00:00	\N	21	Midfielder	170	70	R
ply1518	İrfan	Kahveci	Turkey	1995-07-15 00:00:00	\N	17	Midfielder	176	67	L
ply1519	Alexander	Sørloth	Norway	1995-12-05 00:00:00	\N	19	Forward	195	94	L
ply1520	\N	Rafinha	Brazil	1993-02-12 00:00:00	\N	10	Midfielder	174	71	L
ply1521	Justin	Kluivert	Netherlands	1999-05-05 00:00:00	\N	9	Forward	172	66	\N
ply1522	Andreas	Pereira	Brazil	1996-01-01 00:00:00	\N	18	Midfielder	178	71	R
ply1523	\N	Emerson	Italy	1994-08-03 00:00:00	\N	33	Defender	176	79	L
ply1524	\N	Nanu	Guinea-Bissau	1994-05-17 00:00:00	\N	31	Defender	177	69	R
ply1525	Lukáš	Hrádecký	Finland	1989-11-24 00:00:00	Bayer Leverkusen	1	Goalkeeper	192	83	R
ply1526	Niklas	Lomb	Germany	1993-07-28 00:00:00	Bayer Leverkusen	36	Goalkeeper	186	84	R
ply1527	Andrey	Lunev	Russia	1991-11-13 00:00:00	Bayer Leverkusen	40	Goalkeeper	190	80	R
ply1528	Maximilian	Neutgens	Germany	2004-03-03 00:00:00	\N	\N	Goalkeeper	188	66	\N
ply1529	Mitchel	Bakker	Netherlands	2000-06-20 00:00:00	Bayer Leverkusen	5	Defender	185	85	L
ply1530	Timothy	Fosu-Mensah	Netherlands	1998-01-02 00:00:00	Bayer Leverkusen	24	Defender	185	80	R
ply1531	Jeremie	Frimpong	Netherlands	2000-12-10 00:00:00	Bayer Leverkusen	30	Defender	171	63	R
ply1532	Piero	Hincapié	Ecuador	2002-01-09 00:00:00	Bayer Leverkusen	3	Defender	183	66	L
ply1533	Odilon	Kossounou	Ivory Coast	2001-01-04 00:00:00	Bayer Leverkusen	6	Defender	191	79	R
ply1534	Daley	Sinkgraven	Netherlands	1995-07-04 00:00:00	Bayer Leverkusen	22	Defender	179	66	L
ply1535	Jonathan	Tah	Germany	1996-02-11 00:00:00	Bayer Leverkusen	4	Defender	195	98	R
ply1536	Edmond	Tapsoba	Burkina Faso	1999-02-02 00:00:00	Bayer Leverkusen	12	Defender	194	85	R
ply1537	Amine	Adli	France	2000-05-10 00:00:00	Bayer Leverkusen	21	Midfielder	174	60	L
ply1538	Nadiem	Amiri	Germany	1996-10-27 00:00:00	Bayer Leverkusen	11	Midfielder	180	73	R
ply1539	Robert	Andrich	Germany	1994-09-22 00:00:00	Bayer Leverkusen	8	Midfielder	187	83	R
ply1540	Charles	Aránguiz	Chile	1989-04-17 00:00:00	Bayer Leverkusen	20	Midfielder	171	68	R
ply1541	Ayman	Azhil	Morocco	2001-04-10 00:00:00	Bayer Leverkusen	32	Midfielder	170	58	\N
ply1542	Kerem	Demirbay	Germany	1993-07-03 00:00:00	Bayer Leverkusen	10	Midfielder	183	74	L
ply1543	Joshua	Eze	Germany	2003-03-20 00:00:00	Bayer Leverkusen	35	Midfielder	182	76	\N
ply1544	Exequiel	Palacios	Argentina	1998-10-05 00:00:00	Bayer Leverkusen	25	Midfielder	177	67	R
ply1545	Zidan	Sertdemir	Denmark	2005-02-04 00:00:00	Bayer Leverkusen	29	Midfielder	183	71	L
ply1546	Florian	Wirtz	Germany	2003-05-03 00:00:00	Bayer Leverkusen	27	Midfielder	176	70	R
ply1547	Karim	Bellarabi	Germany	1990-04-08 00:00:00	Bayer Leverkusen	38	Forward	184	81	R
ply1548	Moussa	Diaby	France	1999-07-07 00:00:00	Bayer Leverkusen	19	Forward	170	67	L
ply1549	Adam	Hložek	Czech Republic	2002-07-25 00:00:00	Bayer Leverkusen	23	Forward	188	74	R
ply1550	\N	Paulinho	Brazil	2000-07-15 00:00:00	Bayer Leverkusen	7	Forward	177	77	R
ply1551	Patrik	Schick	Czech Republic	1996-01-24 00:00:00	Bayer Leverkusen	14	Forward	191	85	L
ply1552	Marcel	Daum	Germany	1986-07-20 00:00:00	Bayer Leverkusen	\N	Chief	\N	\N	\N
ply1553	Schahriar	Bigdeli	Germany	1980-03-26 00:00:00	Bayer Leverkusen	\N	Athletic	\N	\N	\N
ply1554	Daniel	Jouvin	Germany	1978-06-16 00:00:00	Bayer Leverkusen	\N	Athletic	\N	\N	\N
ply1555	Malte	Krüger	Germany	1982-04-10 00:00:00	Bayer Leverkusen	\N	Athletic	\N	\N	\N
ply1556	Markus	Müller	Germany	1985-09-27 00:00:00	Bayer Leverkusen	\N	Athletic	\N	\N	\N
ply1557	Bob	Schoos	Luxembourg	1983-04-20 00:00:00	Bayer Leverkusen	\N	Athletic	\N	\N	\N
ply1558	Gregor	Stumpf	Germany	1979-02-15 00:00:00	Bayer Leverkusen	\N	Rehab	\N	\N	\N
ply1559	Simon	Lackmann	Germany	1980-12-29 00:00:00	Bayer Leverkusen	\N	Video	\N	\N	\N
ply1560	Milan	Borjan	Canada	1987-10-23 00:00:00	Crvena Zvezda	82	Goalkeeper	195	87	R
ply1561	Zoran	Popović	Serbia	1988-05-28 00:00:00	Crvena Zvezda	1	Goalkeeper	188	81	R
ply1562	Nikola	Vasiljević	Serbia	1996-06-24 00:00:00	Crvena Zvezda	27	Goalkeeper	202	93	R
ply1563	Irakli	Azarov	Georgia	2002-02-21 00:00:00	Crvena Zvezda	16	Defender	\N	\N	L
ply1564	Vuk	Bogdanović	Serbia	2002-04-03 00:00:00	Crvena Zvezda	16	Defender	189	\N	R
ply1565	Aleksandar	Dragović	Austria	1991-03-06 00:00:00	Crvena Zvezda	15	Defender	186	84	R
ply1566	Strahinja	Eraković	Serbia	2001-01-22 00:00:00	Crvena Zvezda	25	Defender	184	75	R
ply1567	Marko	Gobeljić	Serbia	1992-09-13 00:00:00	Crvena Zvezda	77	Defender	185	80	R
ply1568	Stefan	Leković	Serbia	2004-01-09 00:00:00	Crvena Zvezda	44	Defender	192	\N	R
ply1569	Nemanja	Milunović	Serbia	1989-05-31 00:00:00	Crvena Zvezda	19	Defender	195	86	\N
ply1570	Radovan	Pankov	Serbia	1995-08-05 00:00:00	Crvena Zvezda	6	Defender	185	83	R
ply1571	Milan	Rodić	Serbia	1991-04-02 00:00:00	Crvena Zvezda	23	Defender	185	81	L
ply1572	Mirko	Ivanić	Montenegro	1993-09-13 00:00:00	Crvena Zvezda	4	Midfielder	183	70	\N
ply1573	Guélor	Kanga	Gabon	1990-09-01 00:00:00	Crvena Zvezda	8	Midfielder	167	63	R
ply1574	Kings	Kangwa	Zambia	1999-06-04 00:00:00	Crvena Zvezda	20	Midfielder	170	64	R
ply1575	Nenad	Krstičić	Serbia	1990-07-03 00:00:00	Crvena Zvezda	7	Midfielder	182	75	\N
ply1576	Srđan	Mijailović	Serbia	1993-11-10 00:00:00	Crvena Zvezda	33	Midfielder	182	70	R
ply1577	Jovan	Mijatović	Serbia	2005-07-11 00:00:00	Crvena Zvezda	\N	Midfielder	\N	\N	\N
ply1578	Stefan	Mitrović	Serbia	2002-08-15 00:00:00	Crvena Zvezda	80	Midfielder	181	70	R
ply1579	Veljko	Nikolić	Serbia	1999-08-29 00:00:00	Crvena Zvezda	22	Midfielder	178	72	R
ply1580	Egor	Prutsev	Russia	2002-12-23 00:00:00	Crvena Zvezda	29	Midfielder	174	60	\N
ply1581	Sékou	Sanogo	Ivory Coast	1989-05-05 00:00:00	Crvena Zvezda	35	Midfielder	182	81	L
ply1582	Slavoljub	Srnić	Serbia	1992-01-12 00:00:00	Crvena Zvezda	55	Midfielder	174	67	\N
ply1583	Nikola	Stanković	Serbia	2003-04-24 00:00:00	Crvena Zvezda	38	Midfielder	181	70	R
ply1584	El Fardou	Ben	Comoros	1989-06-10 00:00:00	Crvena Zvezda	31	Forward	173	70	L
ply1585	Osman	Bukari	Ghana	1998-12-13 00:00:00	Crvena Zvezda	11	Forward	170	68	\N
ply1586	Kalifa	Coulibaly	Mali	1991-08-21 00:00:00	Crvena Zvezda	70	Forward	197	87	R
ply1587	Aleksandar	Katai	Serbia	1991-02-06 00:00:00	Crvena Zvezda	10	Forward	182	71	R
ply1588	Nemanja	Motika	Serbia	2003-03-20 00:00:00	Crvena Zvezda	17	Forward	179	71	\N
ply1589	Ibrahim	Mustapha	Ghana	2000-06-18 00:00:00	Crvena Zvezda	18	Forward	180	\N	R
ply1590	Aleksandar	Pešić	Serbia	1992-05-21 00:00:00	Crvena Zvezda	72	Forward	190	87	R
ply1591	Srđan	Spiridonović	Austria	1993-10-13 00:00:00	Crvena Zvezda	70	Forward	173	69	\N
ply1592	Pierluigi	Brivio	Italy	1969-05-21 00:00:00	Crvena Zvezda	\N	Goalkeeping	185	78	\N
ply1593	Dominik	Livaković	Croatia	1995-01-09 00:00:00	Dinamo Zagreb	40	Goalkeeper	188	79	R
ply1594	Ivan	Nevistić	Croatia	1998-07-31 00:00:00	Dinamo Zagreb	33	Goalkeeper	195	88	R
ply1595	Danijel	Zagorac	Croatia	1987-02-07 00:00:00	Dinamo Zagreb	1	Goalkeeper	186	80	R
ply1596	Emir	Dilaver	Austria	1991-05-07 00:00:00	Dinamo Zagreb	66	Defender	184	82	R
ply1597	Maro	Katinić	Croatia	2004-04-13 00:00:00	Dinamo Zagreb	\N	Defender	186	\N	R
ply1598	Rasmus	Lauritsen	Denmark	1996-02-27 00:00:00	Dinamo Zagreb	6	Defender	188	78	R
ply1599	Sadegh	Moharrami	Iran	1996-03-01 00:00:00	Dinamo Zagreb	2	Defender	174	71	R
ply1600	Dino	Perić	Croatia	1994-07-12 00:00:00	Dinamo Zagreb	55	Defender	197	84	L
ply1601	Stefan	Ristovski	North Macedonia	1992-02-12 00:00:00	Dinamo Zagreb	13	Defender	180	72	R
ply1602	Daniel	Štefulj	Croatia	1999-11-08 00:00:00	Dinamo Zagreb	3	Defender	186	77	L
ply1603	Boško	Šutalo	Croatia	2000-01-01 00:00:00	Dinamo Zagreb	4	Defender	188	81	R
ply1604	Josip	Šutalo	Croatia	2000-02-28 00:00:00	Dinamo Zagreb	37	Defender	184	82	R
ply1605	Kévin	Théophile-Catherine	Martinique	1989-10-28 00:00:00	Dinamo Zagreb	28	Defender	183	86	R
ply1606	Arijan	Ademi	North Macedonia	1991-05-29 00:00:00	Dinamo Zagreb	5	Midfielder	185	79	R
ply1607	Martin	Baturina	Croatia	2003-02-16 00:00:00	Dinamo Zagreb	10	Midfielder	\N	\N	\N
ply1608	Marko	Bulat	Croatia	2001-09-26 00:00:00	Dinamo Zagreb	31	Midfielder	178	68	R
ply1609	Marko	Đira	Croatia	1999-05-05 00:00:00	Dinamo Zagreb	36	Midfielder	171	69	L
ply1610	Luka	Ivanušec	Croatia	1998-11-26 00:00:00	Dinamo Zagreb	7	Midfielder	175	76	R
ply1611	Robert	Ljubičić	Austria	1999-07-14 00:00:00	Dinamo Zagreb	14	Midfielder	178	75	L
ply1612	Josip	Mišić	Croatia	1994-06-28 00:00:00	Dinamo Zagreb	27	Midfielder	187	71	R
ply1613	Marko	Soldo	Bosnia-Herzegovina	2003-11-22 00:00:00	Dinamo Zagreb	8	Midfielder	\N	\N	R
ply1614	Petar	Bočkaj	Croatia	1996-07-23 00:00:00	Dinamo Zagreb	12	Forward	179	75	L
ply1615	Josip	Drmić	Switzerland	1992-08-08 00:00:00	Dinamo Zagreb	18	Forward	183	81	R
ply1616	Mahir	Emreli	Azerbaijan	1997-07-01 00:00:00	Dinamo Zagreb	11	Forward	187	78	L
ply1617	Antonio	Marin	Croatia	2001-01-09 00:00:00	Dinamo Zagreb	20	Forward	182	78	R
ply1618	Luka	Menalo	Bosnia-Herzegovina	1996-07-22 00:00:00	Dinamo Zagreb	70	Forward	181	73	R
ply1619	Mislav	Oršić	Croatia	1992-12-29 00:00:00	Dinamo Zagreb	99	Forward	179	69	\N
ply1620	Bruno	Petković	Croatia	1994-09-16 00:00:00	Dinamo Zagreb	9	Forward	193	88	R
ply1621	Gabriel	Rukavina	Croatia	2004-01-16 00:00:00	Dinamo Zagreb	41	Forward	180	\N	R
ply1622	Dario	Špikić	Croatia	1999-03-22 00:00:00	Dinamo Zagreb	77	Forward	183	79	R
ply1623	İsmail	Çipe	Turkey	1995-01-05 00:00:00	Galatasaray	13	Goalkeeper	197	85	R
ply1624	Okan	Koçuk	Turkey	1995-07-27 00:00:00	Galatasaray	34	Goalkeeper	187	78	R
ply1625	Fernando	Muslera	Uruguay	1986-06-16 00:00:00	Galatasaray	1	Goalkeeper	190	74	R
ply1626	Jankat	Yılmaz	Turkey	2004-08-16 00:00:00	Galatasaray	50	Goalkeeper	188	\N	L
ply1627	Metehan	Baltacı	Turkey	2002-11-03 00:00:00	Galatasaray	90	Defender	189	\N	R
ply1628	Abdülkerim	Bardakçı	Turkey	1994-09-07 00:00:00	Galatasaray	42	Defender	184	81	L
ply1629	Emin	Bayram	Turkey	2003-04-02 00:00:00	Galatasaray	40	Defender	186	71	R
ply1630	Sacha	Boey	Cameroon	2000-09-13 00:00:00	Galatasaray	93	Defender	178	70	R
ply1631	Ali	Bülbül	Turkey	2005-01-25 00:00:00	Galatasaray	72	Defender	179	\N	R
ply1632	Léo	Dubois	France	1994-09-14 00:00:00	Galatasaray	2	Defender	178	65	R
ply1633	Gökay	Güney	Turkey	1999-05-19 00:00:00	Galatasaray	46	Defender	180	74	R
ply1634	Kazımcan	Karataş	Turkey	2003-01-16 00:00:00	Galatasaray	88	Defender	182	74	L
ply1635	Victor	Nelsson	Denmark	1998-10-14 00:00:00	Galatasaray	25	Defender	185	74	R
ply1636	Mathias Ross	Jensen	Denmark	2001-01-15 00:00:00	Galatasaray	\N	Defender	190	80	R
ply1637	Emre	Taşdemir	Turkey	1995-08-08 00:00:00	Galatasaray	26	Defender	176	70	L
ply1638	Patrick van	Aanholt	Netherlands	1990-08-29 00:00:00	Galatasaray	3	Defender	176	73	L
ply1639	Yunus	Akgün	Turkey	2000-07-07 00:00:00	Galatasaray	11	Midfielder	173	65	L
ply1640	Hamza	Akman	Turkey	2004-09-27 00:00:00	Galatasaray	81	Midfielder	\N	\N	R
ply1641	Baran	Aksaka	Turkey	2003-01-29 00:00:00	Galatasaray	63	Midfielder	\N	\N	R
ply1642	Berkan	Kutlu	Turkey	1998-01-25 00:00:00	Galatasaray	22	Midfielder	186	77	L
ply1643	\N	Mata	Spain	1988-04-28 00:00:00	Galatasaray	\N	Midfielder	170	63	L
ply1644	Fredrik	Midtsjø	Norway	1993-08-11 00:00:00	Galatasaray	6	Midfielder	176	70	R
ply1645	Lucas	Torreira	Uruguay	1996-02-11 00:00:00	Galatasaray	5	Midfielder	166	64	R
ply1646	Kerem	Aktürkoğlu	Turkey	1998-10-21 00:00:00	Galatasaray	7	Forward	173	71	R
ply1647	Yusuf	Demir	Austria	2003-06-02 00:00:00	Galatasaray	\N	Forward	173	69	L
ply1648	Bafétimbi	Gomis	France	1985-08-06 00:00:00	Galatasaray	18	Forward	184	77	R
ply1649	Mauro	Icardi	Argentina	1993-02-19 00:00:00	Galatasaray	\N	Forward	181	75	R
ply1650	Dries	Mertens	Belgium	1987-05-06 00:00:00	Galatasaray	10	Forward	169	61	R
ply1651	Milot	Rashica	Kosovo	1996-06-28 00:00:00	Galatasaray	\N	Forward	177	73	R
ply1652	Haris	Seferović	Switzerland	1992-02-22 00:00:00	Galatasaray	9	Forward	186	83	L
ply1653	Barış	Yılmaz	Turkey	2000-05-23 00:00:00	Galatasaray	53	Forward	186	75	R
ply1654	Vic	Chambaere	Belgium	2003-01-10 00:00:00	\N	\N	Goalkeeper	190	71	R
ply1655	Tobe	Leysen	Belgium	2002-03-09 00:00:00	KRC Genk	40	Goalkeeper	189	83	L
ply1656	Mike	Penders	Belgium	2005-07-31 00:00:00	\N	\N	Goalkeeper	\N	\N	\N
ply1657	Brent	Stevens	Belgium	2003-08-11 00:00:00	KRC Genk	51	Goalkeeper	\N	\N	\N
ply1658	Maarten	Vandevoordt	Belgium	2002-02-26 00:00:00	KRC Genk	26	Goalkeeper	192	76	R
ply1659	Gerardo	Arteaga	Mexico	1998-09-07 00:00:00	KRC Genk	5	Defender	174	65	L
ply1660	Rasmus	Carstensen	Denmark	2000-11-10 00:00:00	KRC Genk	22	Defender	183	75	\N
ply1661	Carlos	Cuesta	Colombia	1999-03-09 00:00:00	KRC Genk	46	Defender	182	80	R
ply1662	Sébastien	Dewaest	Belgium	1991-05-27 00:00:00	KRC Genk	\N	Defender	188	88	R
ply1663	Mark	McKenzie	USA	1999-02-25 00:00:00	KRC Genk	2	Defender	184	83	L
ply1664	\N	Mujaid	Spain	2000-03-14 00:00:00	KRC Genk	3	Defender	183	81	R
ply1665	Daniel	Muñoz	Colombia	1996-05-25 00:00:00	KRC Genk	23	Defender	183	73	R
ply1666	Aziz	Ouattara	Ivory Coast	2001-01-04 00:00:00	KRC Genk	4	Defender	189	\N	R
ply1667	Ángelo	Preciado	Ecuador	1998-02-18 00:00:00	KRC Genk	77	Defender	173	73	R
ply1668	Tuur	Rommens	Belgium	2003-03-26 00:00:00	KRC Genk	25	Defender	181	\N	L
ply1669	Nicolás	Castro	Argentina	2000-11-01 00:00:00	KRC Genk	10	Midfielder	181	75	\N
ply1670	Matisse	Didden	Belgium	2001-10-08 00:00:00	\N	\N	Midfielder	197	80	R
ply1671	Bilal El	Khannouss	Belgium	2004-05-10 00:00:00	KRC Genk	34	Midfielder	\N	\N	\N
ply1672	Matías	Galarza	Argentina	2002-03-04 00:00:00	KRC Genk	25	Midfielder	180	71	R
ply1673	Jay-Dee	Geusens	Belgium	2002-03-05 00:00:00	KRC Genk	15	Midfielder	185	72	R
ply1674	Bryan	Heynen	Belgium	1997-02-06 00:00:00	KRC Genk	8	Midfielder	183	73	R
ply1675	Patrik	Hrošovský	Slovakia	1992-04-22 00:00:00	KRC Genk	17	Midfielder	172	67	R
ply1676	Eboue	Kouassi	Ivory Coast	1997-12-13 00:00:00	KRC Genk	\N	Midfielder	185	71	R
ply1677	Luca	Oyen	Belgium	2003-03-14 00:00:00	KRC Genk	24	Midfielder	173	64	R
ply1678	Mike	Trésor	Belgium	1999-05-28 00:00:00	KRC Genk	11	Midfielder	172	64	R
ply1679	Adnane	Abid	Belgium	2003-08-23 00:00:00	KRC Genk	\N	Forward	165	\N	R
ply1680	Kelvin	John	Tanzania	2003-06-10 00:00:00	KRC Genk	20	Forward	175	\N	R
ply1681	András	Németh	Hungary	2002-11-09 00:00:00	KRC Genk	35	Forward	187	78	R
ply1682	Paul	Onuachu	Nigeria	1994-05-28 00:00:00	KRC Genk	18	Forward	201	93	R
ply1683	Joseph	Paintsil	Ghana	1998-02-01 00:00:00	KRC Genk	28	Forward	168	66	R
ply1684	Ally	Samatta	Tanzania	1992-12-23 00:00:00	KRC Genk	7	Forward	183	78	R
ply1685	Guy	Martens	Belgium	1958-12-06 00:00:00	KRC Genk	\N	Goalkeeping	\N	\N	\N
ply1686	Anthony	Lopes	Portugal	1990-10-01 00:00:00	Olympique Lyon	1	Goalkeeper	184	81	L
ply1687	Kayne	Bonnevie	France	2001-07-22 00:00:00	Olympique Lyon	40	Goalkeeper	191	76	L
ply1688	Julian	Pollersbeck	Germany	1994-08-16 00:00:00	Olympique Lyon	30	Goalkeeper	195	87	R
ply1689	Rémy	Riou	France	1987-08-06 00:00:00	Olympique Lyon	35	Goalkeeper	191	81	R
ply1690	Damien Da	Silva	France	1988-05-17 00:00:00	Olympique Lyon	21	Defender	184	82	R
ply1691	Sinaly	Diomandé	Ivory Coast	2001-04-09 00:00:00	Olympique Lyon	2	Defender	184	74	R
ply1692	Malo	Gusto	France	2003-05-19 00:00:00	Olympique Lyon	27	Defender	179	76	R
ply1693	\N	Henrique	Brazil	1994-04-25 00:00:00	Olympique Lyon	12	Defender	173	71	L
ply1694	Saël	Kumbedi	France	2005-03-26 00:00:00	Olympique Lyon	20	Defender	179	\N	R
ply1695	Irvyn	Lomami	France	2003-12-30 00:00:00	\N	\N	Defender	169	\N	R
ply1696	Castello	Lukeba	France	2002-12-17 00:00:00	Olympique Lyon	4	Defender	184	73	L
ply1697	Houssem	Aouar	France	1998-06-30 00:00:00	Olympique Lyon	8	Midfielder	175	70	R
ply1698	Maxence	Caqueret	France	2000-02-15 00:00:00	Olympique Lyon	25	Midfielder	174	63	R
ply1699	Florent Da	Silva	France	2003-04-02 00:00:00	Olympique Lyon	\N	Midfielder	178	67	R
ply1700	Mohamed El	Arouch	France	2004-04-06 00:00:00	Olympique Lyon	32	Midfielder	166	56	R
ply1701	Romain	Faivre	France	1998-07-14 00:00:00	Olympique Lyon	15	Midfielder	180	75	L
ply1702	Johann	Lepenant	France	2002-10-22 00:00:00	Olympique Lyon	24	Midfielder	176	65	R
ply1703	Jeff	Reine-Adélaïde	France	1998-01-17 00:00:00	Olympique Lyon	22	Midfielder	188	75	R
ply1704	Thiago	Mendes	Brazil	1992-03-15 00:00:00	Olympique Lyon	23	Midfielder	177	72	R
ply1705	Bradley	Barcola	France	2002-09-02 00:00:00	Olympique Lyon	26	Forward	182	66	R
ply1706	Rayan	Cherki	France	2003-08-17 00:00:00	Olympique Lyon	18	Forward	176	71	\N
ply1707	Moussa	Dembélé	France	1996-07-12 00:00:00	Olympique Lyon	9	Forward	183	74	R
ply1708	Alexandre	Lacazette	France	1991-05-28 00:00:00	Olympique Lyon	91	Forward	176	73	R
ply1709	Sekou	Lega	France	2003-01-21 00:00:00	\N	\N	Forward	190	65	R
ply1710	Karl Toko	Ekambi	Cameroon	1992-09-14 00:00:00	Olympique Lyon	7	Forward	185	78	R
ply1711	Rémy	Vercoutre	France	1980-06-26 00:00:00	Olympique Lyon	\N	Goalkeeping	185	78	R
ply1712	Terry	Peters	Netherlands	1986-06-30 00:00:00	Olympique Lyon	\N	Athletic	\N	\N	\N
ply1713	Adam	Dvořák	Czech Republic	2004-07-28 00:00:00	Slavia Praha	31	Republic	\N	\N	\N
ply1714	Ondřej	Kolář	Czech Republic	1994-10-17 00:00:00	Slavia Praha	1	Republic	193	81	R
ply1715	Přemysl	Kovář	Czech Republic	1985-10-14 00:00:00	Slavia Praha	31	Republic	187	89	R
ply1716	Aleš	Mandous	Czech Republic	1992-04-21 00:00:00	Slavia Praha	28	Republic	188	85	R
ply1717	Jan	Sirotník	Czech Republic	2002-02-16 00:00:00	Slavia Praha	34	Republic	188	\N	\N
ply1718	Jan	Bořil	Czech Republic	1991-01-11 00:00:00	Slavia Praha	18	Republic	175	75	R
ply1719	Eduardo	Santos	Brazil	1997-11-28 00:00:00	Slavia Praha	12	Republic	196	90	R
ply1720	Michal	Hošek	Czech Republic	2001-04-22 00:00:00	Slavia Praha	\N	Republic	189	77	R
ply1721	David	Hovorka	Czech Republic	1993-08-07 00:00:00	Slavia Praha	2	Republic	179	73	R
ply1722	Taras	Kacharaba	Ukraine	1995-01-07 00:00:00	Slavia Praha	30	Republic	189	79	R
ply1723	Aiham	Ousou	Sweden	2000-01-09 00:00:00	Slavia Praha	4	Republic	186	77	R
ply1724	Oscar	Dorley	Liberia	1998-07-19 00:00:00	Slavia Praha	19	Republic	174	66	L
ply1725	David	Douděra	Czech Republic	1998-05-31 00:00:00	Slavia Praha	21	Republic	175	66	\N
ply1726	Tomáš	Holeš	Czech Republic	1993-03-31 00:00:00	Slavia Praha	3	Republic	180	73	R
ply1727	Jakub	Hromada	Slovakia	1996-05-25 00:00:00	Slavia Praha	25	Republic	180	76	R
ply1728	David	Jurásek	Czech Republic	2000-08-07 00:00:00	Slavia Praha	33	Republic	182	77	R
ply1729	Jakub	Kopáček	Czech Republic	2002-01-23 00:00:00	Slavia Praha	49	Republic	\N	\N	\N
ply1730	Ondřej	Kričfaluši	Czech Republic	2004-03-29 00:00:00	Slavia Praha	41	Republic	\N	\N	\N
ply1731	Albert	Labík	Czech Republic	2004-05-13 00:00:00	Slavia Praha	52	Republic	178	\N	L
ply1732	Ondřej	Lingr	Czech Republic	1998-10-07 00:00:00	Slavia Praha	32	Republic	175	70	R
ply1733	Lukáš	Masopust	Czech Republic	1993-02-12 00:00:00	Slavia Praha	8	Republic	179	76	R
ply1734	Matouš	Nikl	Czech Republic	2002-02-02 00:00:00	Slavia Praha	42	Republic	\N	\N	\N
ply1735	Petr	Ševčík	Czech Republic	1994-05-04 00:00:00	Slavia Praha	23	Republic	172	66	R
ply1736	Martin	Šubert	Czech Republic	2002-02-11 00:00:00	Slavia Praha	45	Republic	\N	\N	\N
ply1737	Christ	Tiehi	Ivory Coast	1998-06-16 00:00:00	Slavia Praha	5	Republic	180	76	R
ply1738	Ibrahim	Traoré	Ivory Coast	1988-09-16 00:00:00	Slavia Praha	27	Republic	186	80	R
ply1739	Štěpán	Beran	Czech Republic	2004-03-10 00:00:00	Slavia Praha	53	Republic	176	\N	\N
ply1740	Erik	Biegon	Czech Republic	2004-04-29 00:00:00	Slavia Praha	44	Republic	179	\N	\N
ply1741	\N	Ewerton	Brazil	1996-12-28 00:00:00	Slavia Praha	22	Republic	175	73	R
ply1742	Matěj	Jurásek	Czech Republic	2003-08-30 00:00:00	Slavia Praha	35	Republic	181	73	R
ply1743	Václav	Jurečka	Czech Republic	1994-06-26 00:00:00	Slavia Praha	15	Republic	182	78	R
ply1744	Peter	Olayinka	Nigeria	1995-11-16 00:00:00	Slavia Praha	9	Republic	188	77	R
ply1745	Lukáš	Provod	Czech Republic	1996-10-23 00:00:00	Slavia Praha	17	Republic	189	84	L
ply1746	Ivan	Schranz	Slovakia	1993-09-13 00:00:00	Slavia Praha	26	Republic	185	75	R
ply1747	Daniel	Šmiga	Czech Republic	2004-01-02 00:00:00	Slavia Praha	35	Republic	\N	\N	\N
ply1748	Yira	Sor	Nigeria	2000-07-24 00:00:00	Slavia Praha	20	Republic	174	69	R
ply1749	Stanislav	Tecl	Czech Republic	1990-09-01 00:00:00	Slavia Praha	11	Republic	181	82	R
ply1750	Moses	Usor	Nigeria	2002-02-05 00:00:00	Slavia Praha	16	Republic	\N	\N	\N
ply1751	Jindřich	Trpišovský	Czech Republic	1976-02-27 00:00:00	Slavia Praha	\N	Republic	\N	\N	\N
ply1752	Hubert	Idasiak	Poland	2002-02-03 00:00:00	SSC Napoli	16	Goalkeeper	188	74	R
ply1753	Davide	Marfella	Italy	1999-09-15 00:00:00	SSC Napoli	12	Goalkeeper	183	79	R
ply1754	Alex	Meret	Italy	1997-03-22 00:00:00	SSC Napoli	1	Goalkeeper	190	82	L
ply1755	Salvatore	Sirigu	Italy	1987-01-12 00:00:00	SSC Napoli	30	Goalkeeper	192	80	R
ply1756	Giovanni Di	Lorenzo	Italy	1993-08-04 00:00:00	SSC Napoli	22	Defender	183	83	R
ply1757	Juan	Jesus	Brazil	1991-06-10 00:00:00	SSC Napoli	5	Defender	185	83	L
ply1758	Min-jae	Kim	South Korea	1996-11-15 00:00:00	SSC Napoli	3	Defender	190	88	R
ply1759	Mário	Rui	Portugal	1991-05-27 00:00:00	SSC Napoli	6	Defender	170	67	L
ply1760	Mathías	Olivera	Uruguay	1997-10-31 00:00:00	SSC Napoli	17	Defender	185	78	L
ply1761	Leo	Østigård	Norway	1999-11-28 00:00:00	SSC Napoli	55	Defender	184	80	R
ply1762	Amir	Rrahmani	Kosovo	1994-02-24 00:00:00	SSC Napoli	13	Defender	192	87	\N
ply1763	Alessandro	Zanoli	Italy	2000-10-03 00:00:00	SSC Napoli	59	Defender	188	76	R
ply1764	Frank	Anguissa	Cameroon	1995-11-16 00:00:00	SSC Napoli	99	Midfielder	184	78	R
ply1765	Diego	Demme	Germany	1991-11-21 00:00:00	SSC Napoli	4	Midfielder	170	68	R
ply1766	Eljif	Elmas	North Macedonia	1999-09-24 00:00:00	SSC Napoli	7	Midfielder	182	74	R
ply1767	Gianluca	Gaetano	Italy	2000-05-05 00:00:00	SSC Napoli	70	Midfielder	183	70	R
ply1768	Stanislav	Lobotka	Slovakia	1994-11-25 00:00:00	SSC Napoli	68	Midfielder	172	64	\N
ply1769	Tanguy	NDombèlé	France	1996-12-28 00:00:00	SSC Napoli	91	Midfielder	181	76	R
ply1770	Karim	Zedadka	France	2000-06-09 00:00:00	SSC Napoli	31	Midfielder	182	67	R
ply1771	Piotr	Zieliński	Poland	1994-05-20 00:00:00	SSC Napoli	20	Midfielder	177	69	\N
ply1772	Khvicha	Kvaratskhelia	Georgia	2001-02-12 00:00:00	SSC Napoli	77	Forward	183	70	\N
ply1773	Hirving	Lozano	Mexico	1995-07-30 00:00:00	SSC Napoli	11	Forward	175	70	R
ply1774	Victor	Osimhen	Nigeria	1998-12-29 00:00:00	SSC Napoli	9	Forward	185	78	R
ply1775	Matteo	Politano	Italy	1993-08-03 00:00:00	SSC Napoli	21	Forward	171	66	L
ply1776	Giacomo	Raspadori	Italy	2000-02-18 00:00:00	SSC Napoli	81	Forward	172	69	\N
ply1777	Giovanni	Simeone	Argentina	1995-07-05 00:00:00	SSC Napoli	18	Forward	181	81	R
ply1778	Alessio	Zerbin	Italy	1999-03-03 00:00:00	SSC Napoli	23	Forward	182	75	R
ply1779	Alejandro	Rosalen	Spain	1977-02-25 00:00:00	SSC Napoli	\N	Goalkeeping	\N	\N	\N
ply1780	Brandon	Austin	England	1999-01-08 00:00:00	\N	\N	Goalkeeper	188	82	R
ply1781	Fraser	Forster	England	1988-03-17 00:00:00	Tottenham Hotspur	20	Goalkeeper	201	93	R
ply1782	Hugo	Lloris	France	1986-12-26 00:00:00	Tottenham Hotspur	1	Goalkeeper	188	82	L
ply1783	Ben	Davies	Wales	1993-04-24 00:00:00	Tottenham Hotspur	33	Defender	181	76	L
ply1784	Eric	Dier	England	1994-01-15 00:00:00	Tottenham Hotspur	15	Defender	188	88	R
ply1785	Matt	Doherty	Ireland	1992-01-16 00:00:00	Tottenham Hotspur	2	Defender	186	87	R
ply1786	Emerson	Royal	Brazil	1999-01-14 00:00:00	Tottenham Hotspur	12	Defender	183	79	R
ply1787	Malachi	Fagan-Walcott	England	2002-03-11 00:00:00	Tottenham Hotspur	46	Defender	189	77	R
ply1788	Clément	Lenglet	France	1995-06-17 00:00:00	Tottenham Hotspur	34	Defender	186	81	L
ply1789	Brooklyn	Lyons-Foster	England	2000-12-01 00:00:00	Tottenham Hotspur	53	Defender	181	70	R
ply1790	Maksim	Paskotši	Estonia	2003-01-19 00:00:00	Tottenham Hotspur	48	Defender	170	\N	R
ply1791	Davinson	Sánchez	Colombia	1996-06-12 00:00:00	Tottenham Hotspur	6	Defender	187	81	R
ply1792	Djed	Spence	England	2000-08-09 00:00:00	Tottenham Hotspur	24	Defender	184	71	R
ply1793	Japhet	Tanganga	England	1999-03-31 00:00:00	Tottenham Hotspur	25	Defender	184	73	R
ply1794	Yves	Bissouma	Mali	1996-08-30 00:00:00	Tottenham Hotspur	38	Midfielder	182	78	R
ply1795	Jamie	Bowden	England	2001-07-09 00:00:00	Tottenham Hotspur	54	Midfielder	175	64	R
ply1796	Pierre-Emile	Højbjerg	Denmark	1995-08-05 00:00:00	Tottenham Hotspur	5	Midfielder	185	81	R
ply1797	Pape	Sarr	Senegal	2002-09-14 00:00:00	Tottenham Hotspur	29	Midfielder	180	68	R
ply1798	Oliver	Skipp	England	2000-09-16 00:00:00	Tottenham Hotspur	4	Midfielder	175	70	R
ply1799	Harvey	White	England	2001-09-19 00:00:00	Tottenham Hotspur	42	Midfielder	168	60	L
ply1800	Bryan	Gil	Spain	2001-02-11 00:00:00	Tottenham Hotspur	11	Forward	175	67	L
ply1801	Harry	Kane	England	1993-07-28 00:00:00	Tottenham Hotspur	10	Forward	188	86	R
ply1802	Lucas	Moura	Brazil	1992-08-13 00:00:00	Tottenham Hotspur	27	Forward	172	70	R
ply1803	\N	Richarlison	Brazil	1997-05-10 00:00:00	Tottenham Hotspur	9	Forward	184	83	R
ply1804	Ryan	Sessegnon	England	2000-05-18 00:00:00	Tottenham Hotspur	19	Forward	178	70	L
ply1805	Heung-min	Son	South Korea	1992-07-08 00:00:00	Tottenham Hotspur	7	Forward	184	78	\N
ply1806	Marco	Savorani	Italy	1965-03-31 00:00:00	Tottenham Hotspur	\N	Goalkeeping	183	72	\N
ply1807	Stefano	Bruno	Italy	1975-09-05 00:00:00	Tottenham Hotspur	\N	Athletic	\N	\N	\N
ply1808	Costantino	Coratti	Italy	1967-11-12 00:00:00	Tottenham Hotspur	\N	Athletic	\N	\N	\N
ply1809	Giampiero	Ventrone	Italy	1960-04-14 00:00:00	Tottenham Hotspur	\N	Fitness	\N	\N	\N
ply1810	Gianluca	Conte	Italy	1972-05-28 00:00:00	Tottenham Hotspur	\N	Technique	\N	\N	\N
ply1811	Ryan	Mason	England	1991-06-13 00:00:00	Tottenham Hotspur	\N	Technique	175	71	R
ply1812	Gianni	Vio	Italy	1953-04-06 00:00:00	Tottenham Hotspur	\N	Technique	\N	\N	\N
ply1813	Charlie	Pérez	Spain	2002-06-07 00:00:00	Valencia CF	26	Goalkeeper	\N	\N	\N
ply1814	Cristian	Rivero	Spain	1998-03-21 00:00:00	Valencia CF	13	Goalkeeper	188	75	R
ply1815	Emilio	Bernad	Spain	1999-09-22 00:00:00	Valencia CF	42	Goalkeeper	184	72	L
ply1816	Iago	Herrerín	Spain	1988-01-25 00:00:00	Valencia CF	1	Goalkeeper	187	89	R
ply1817	\N	Jaume	Spain	1990-11-05 00:00:00	Valencia CF	\N	Goalkeeper	185	76	R
ply1818	Giorgi	Mamardashvili	Georgia	2000-09-29 00:00:00	Valencia CF	25	Goalkeeper	199	93	L
ply1819	César	Tarrega	Spain	2002-02-26 00:00:00	Valencia CF	38	Defender	193	\N	R
ply1820	Eray	Cömert	Switzerland	1998-02-04 00:00:00	Valencia CF	24	Defender	183	80	R
ply1821	Cristhian	Mosquera	Spain	2004-06-27 00:00:00	Valencia CF	33	Defender	191	\N	R
ply1822	Mouctar	Diakhaby	France	1996-12-19 00:00:00	Valencia CF	12	Defender	192	78	R
ply1823	Dimitri	Foulquier	Guadeloupe	1993-03-23 00:00:00	Valencia CF	20	Defender	183	78	R
ply1824	Gabriel	Paulista	Brazil	1990-11-26 00:00:00	Valencia CF	5	Defender	187	72	R
ply1825	\N	Gayà	Spain	1995-05-25 00:00:00	Valencia CF	14	Defender	172	66	L
ply1826	Jesús	Vázquez	Spain	2003-01-02 00:00:00	Valencia CF	21	Defender	182	79	L
ply1827	\N	Joseda	Spain	2002-05-01 00:00:00	Valencia CF	34	Defender	181	75	R
ply1828	Cenk	Özkaçar	Turkey	2000-10-06 00:00:00	Valencia CF	15	Defender	190	90	L
ply1829	Rubén	Iranzo	Spain	2003-03-14 00:00:00	Valencia CF	39	Defender	182	63	R
ply1830	Thierry	Correia	Portugal	1999-03-09 00:00:00	Valencia CF	2	Defender	179	69	R
ply1831	Toni	Lato	Spain	1997-11-21 00:00:00	Valencia CF	3	Defender	171	64	L
ply1832	André	Almeida	Portugal	2000-05-30 00:00:00	Valencia CF	18	Midfielder	172	62	R
ply1833	Hugo	Guillamón	Spain	2000-01-31 00:00:00	Valencia CF	6	Midfielder	178	65	R
ply1834	Ilaix	Moriba	Guinea	2003-01-19 00:00:00	Valencia CF	8	Midfielder	185	73	R
ply1835	Mario	Domínguez	Spain	2004-02-10 00:00:00	Valencia CF	46	Midfielder	175	\N	\N
ply1836	Yunus	Musah	USA	2002-11-29 00:00:00	Valencia CF	4	Midfielder	178	75	R
ply1837	\N	Nico	Spain	2002-01-03 00:00:00	Valencia CF	17	Midfielder	188	85	R
ply1838	Tiago	Ribeiro	Portugal	2002-03-14 00:00:00	\N	\N	Midfielder	185	77	L
ply1839	\N	Yellu	Spain	2004-05-25 00:00:00	Valencia CF	35	Midfielder	192	\N	R
ply1840	Edinson	Cavani	Uruguay	1987-02-14 00:00:00	Valencia CF	7	Forward	184	77	R
ply1841	Diego	López	Spain	2002-05-13 00:00:00	\N	\N	Forward	172	63	\N
ply1842	Fran	Pérez	Spain	2002-09-09 00:00:00	Valencia CF	29	Forward	176	\N	\N
ply1843	Hugo	Duro	Spain	1999-11-10 00:00:00	Valencia CF	19	Forward	182	76	L
ply1844	Hugo	González	Spain	2003-02-07 00:00:00	Valencia CF	31	Forward	180	\N	\N
ply1845	Marcos	André	Brazil	1996-10-20 00:00:00	Valencia CF	22	Forward	185	78	R
ply1846	Samu	Castillejo	Spain	1995-01-18 00:00:00	Valencia CF	11	Forward	182	67	L
ply1847	Samuel	Lino	Brazil	1999-12-23 00:00:00	Valencia CF	16	Forward	178	69	R
ply1848	\N	Ochotorena	Spain	1961-01-16 00:00:00	Valencia CF	\N	Goalkeeping	182	78	\N
ply2174	Guido	Burgstaller	Austria	1989-04-29 00:00:00	\N	9	Forward	187	80	\N
ply2175	Mark	Uth	Germany	1991-08-24 00:00:00	\N	13	Forward	185	72	L
ply2176	Ryan	Donk	Suriname	1986-03-30 00:00:00	\N	4	Defender	192	89	R
ply2177	Fedor	Smolov	Russia	1990-02-09 00:00:00	\N	10	Forward	186	80	R
ply2178	Nabil	Bentaleb	Algeria	1994-11-24 00:00:00	\N	6	Midfielder	187	78	L
ply2179	Alessandro	Schöpf	Austria	1994-02-07 00:00:00	\N	18	Midfielder	178	74	R
ply2180	\N	Hernâni	Portugal	1991-08-20 00:00:00	\N	27	Forward	180	70	L
ply2181	Carel	Eiting	Netherlands	1998-02-11 00:00:00	\N	8	Midfielder	178	72	L
ply2182	Viktor	Klonaridis	Belgium	1992-07-28 00:00:00	\N	22	Midfielder	178	70	R
ply2183	Niklas	Hult	Sweden	1990-02-13 00:00:00	\N	23	Defender	173	63	L
ply2184	Marios	Oikonomou	Greece	1992-10-06 00:00:00	\N	26	Defender	189	85	L
ply2185	Alfa	Semedo	Guinea-Bissau	1997-08-30 00:00:00	\N	30	Arabia	190	82	R
ply2186	\N	Rafinha	Brazil	1985-09-07 00:00:00	\N	13	Defender	172	66	R
ply2187	Eduardo	Salvio	Argentina	1990-07-13 00:00:00	\N	10	Forward	173	71	R
ply2188	Franck	Ribéry	France	1983-04-07 00:00:00	\N	7	Forward	170	62	R
ply2189	Leonardo	Bittencourt	Germany	1993-12-19 00:00:00	\N	10	Midfielder	171	63	R
ply2190	\N	Maycon	Brazil	1997-07-15 00:00:00	\N	5	Midfielder	173	71	L
ply2191	Nabil	Fekir	France	1993-07-18 00:00:00	\N	8	Midfielder	173	72	L
ply2192	Ishak	Belfodil	Algeria	1992-01-12 00:00:00	\N	99	Forward	192	86	R
ply2193	David	Silva	Spain	1986-01-08 00:00:00	\N	21	Midfielder	170	67	L
ply2194	Kenny	Tete	Netherlands	1995-10-09 00:00:00	\N	2	Defender	180	71	R
ply2195	\N	Joelinton	Brazil	1996-08-14 00:00:00	\N	7	Forward	186	81	R
ply2196	\N	Taison	Brazil	1988-01-13 00:00:00	\N	7	Forward	172	64	R
ply2197	Gareth	Bale	Wales	1989-07-16 00:00:00	\N	11	Forward	185	82	L
ply2198	Michael	Krmenčík	Czech Republic	1993-03-15 00:00:00	\N	27	Forward	191	84	R
ply2199	Nikola	Vlašić	Croatia	1997-10-04 00:00:00	\N	16	Midfielder	178	80	R
ply2200	Kostas	Manolas	Greece	1991-06-14 00:00:00	\N	\N	Emirates	189	83	R
ply2201	Arnór	Sigurðsson	Iceland	1999-05-15 00:00:00	\N	8	Midfielder	177	75	R
ply2202	Roman	Procházka	Slovakia	1989-03-14 00:00:00	\N	15	Midfielder	183	76	R
ply2203	Jan	Kovařík	Czech Republic	1988-06-19 00:00:00	\N	12	Republic	183	80	L
ply2204	Guillaume	Hoarau	France	1984-03-05 00:00:00	\N	\N	Forward	192	85	R
ply2205	Djibril	Sow	Switzerland	1997-02-06 00:00:00	\N	8	Midfielder	184	77	R
ply2206	Santi	Mina	Spain	1995-12-07 00:00:00	\N	77	Arabia	181	77	R
ply2207	Roger	Assalé	Ivory Coast	1993-11-13 00:00:00	\N	77	Forward	167	65	R
ply2208	Marouane	Fellaini	Belgium	1987-11-22 00:00:00	\N	25	Midfielder	194	85	R
ply2209	Ashley	Young	England	1985-07-09 00:00:00	\N	18	Defender	175	65	\N
ply2210	\N	Adrián	Spain	1988-01-08 00:00:00	\N	7	Forward	183	73	R
ply2211	Tiquinho	Soares	Brazil	1991-01-17 00:00:00	\N	\N	Forward	187	89	R
ply2212	Jan	Vertonghen	Belgium	1987-04-24 00:00:00	\N	14	Defender	189	86	L
ply2213	Moussa	Sissoko	France	1989-08-16 00:00:00	\N	17	Midfielder	187	83	R
ply2214	Lasse	Schöne	Denmark	1986-05-27 00:00:00	\N	20	Midfielder	178	75	R
ply2215	Vid	Belec	Slovenia	1990-06-06 00:00:00	APOEL Nikosia	27	Goalkeeper	193	84	R
ply2216	Andreas	Christodoulou	Cyprus	1997-03-26 00:00:00	APOEL Nikosia	22	Goalkeeper	188	\N	R
ply2217	Stefanos	Kittos	Cyprus	2002-02-23 00:00:00	APOEL Nikosia	88	Goalkeeper	\N	\N	\N
ply2218	Apostolos	Tsilingiris	Greece	2000-09-06 00:00:00	APOEL Nikosia	75	Goalkeeper	190	\N	\N
ply2219	Ángel	Crespo	Spain	1987-02-09 00:00:00	APOEL Nikosia	15	Defender	183	72	R
ply2220	Issam	Chebake	Morocco	1989-10-12 00:00:00	APOEL Nikosia	14	Defender	175	73	R
ply2221	Daniel	Dumbrăvanu	Moldova	2001-07-22 00:00:00	APOEL Nikosia	\N	Defender	192	72	L
ply2222	Franco	Ferrari	Argentina	1992-05-09 00:00:00	APOEL Nikosia	3	Defender	167	67	L
ply2223	Konstantinos	Giannakou	Cyprus	2005-04-25 00:00:00	APOEL Nikosia	69	Defender	\N	\N	\N
ply2224	Andreas	Karo	Cyprus	1996-09-09 00:00:00	APOEL Nikosia	2	Defender	190	80	R
ply2225	Mateo	Sušić	Bosnia-Herzegovina	1990-11-18 00:00:00	APOEL Nikosia	16	Defender	181	75	\N
ply2226	Christos	Wheeler	Cyprus	1997-06-29 00:00:00	APOEL Nikosia	42	Defender	171	\N	L
ply2227	Danny	Blum	Germany	1991-01-07 00:00:00	APOEL Nikosia	17	Midfielder	183	83	L
ply2228	Carlos	Eduardo	Brazil	2000-01-23 00:00:00	APOEL Nikosia	\N	Midfielder	179	\N	R
ply2229	Stavros	Charalambous	Cyprus	2005-02-23 00:00:00	APOEL Nikosia	79	Midfielder	\N	\N	\N
ply2230	\N	Dálcio	Portugal	1996-05-22 00:00:00	APOEL Nikosia	20	Midfielder	180	79	L
ply2231	Murtaz	Daushvili	Georgia	1989-05-01 00:00:00	APOEL Nikosia	8	Midfielder	178	77	R
ply2232	Giorgos	Efrem	Cyprus	1989-07-05 00:00:00	APOEL Nikosia	7	Midfielder	171	65	\N
ply2233	Stavros	Gavriel	Cyprus	2002-01-29 00:00:00	APOEL Nikosia	25	Midfielder	\N	\N	\N
ply2234	Georgi	Kostadinov	Bulgaria	1990-09-07 00:00:00	APOEL Nikosia	70	Midfielder	184	75	\N
ply2235	Amel	Mujanić	Sweden	2001-04-01 00:00:00	APOEL Nikosia	23	Midfielder	180	74	R
ply2236	Paris	Polykarpou	Cyprus	2000-09-23 00:00:00	APOEL Nikosia	35	Midfielder	\N	\N	\N
ply2237	Rafael	Moreira	Portugal	2002-04-05 00:00:00	APOEL Nikosia	90	Midfielder	177	64	R
ply2238	Kingsley	Sarfo	Ghana	1995-02-13 00:00:00	APOEL Nikosia	44	Midfielder	166	66	L
ply2239	Giannis	Satsias	Cyprus	2002-12-28 00:00:00	APOEL Nikosia	18	Midfielder	181	\N	R
ply2240	Lucas	Villafáñez	Argentina	1991-10-04 00:00:00	APOEL Nikosia	10	Midfielder	171	65	R
ply2241	Anastasios	Donis	Greece	1996-08-29 00:00:00	APOEL Nikosia	\N	Forward	178	76	R
ply2242	Marios	Elia	Cyprus	1996-05-19 00:00:00	APOEL Nikosia	19	Forward	186	\N	R
ply2243	Stavros	Georgiou	Cyprus	2004-10-19 00:00:00	APOEL Nikosia	74	Forward	188	\N	R
ply2244	Nicolas	Koutsakos	Cyprus	2003-11-14 00:00:00	APOEL Nikosia	89	Forward	180	\N	R
ply2245	Giorgi	Kvilitaia	Georgia	1993-10-01 00:00:00	APOEL Nikosia	11	Forward	193	82	R
ply2246	Anton	Maglica	Croatia	1991-11-11 00:00:00	APOEL Nikosia	9	Forward	180	76	\N
ply2247	\N	Marquinhos	Brazil	1997-01-26 00:00:00	APOEL Nikosia	36	Forward	173	81	R
ply2248	Dimitris	Theodorou	Cyprus	1997-09-10 00:00:00	APOEL Nikosia	21	Forward	175	\N	R
ply2249	Georgios	Skiathitis	Greece	1983-06-26 00:00:00	APOEL Nikosia	\N	Goalkeeping	\N	\N	\N
ply2250	Scott	Bain	Scotland	1991-11-22 00:00:00	Celtic FC	29	Goalkeeper	183	84	R
ply2251	Joe	Hart	England	1987-04-19 00:00:00	Celtic FC	1	Goalkeeper	196	91	R
ply2252	Benjamin	Siegrist	Switzerland	1992-01-31 00:00:00	Celtic FC	31	Goalkeeper	196	94	R
ply2253	Alexandro	Bernabei	Argentina	2000-09-24 00:00:00	Celtic FC	25	Defender	169	65	L
ply2254	Cameron	Carter-Vickers	USA	1997-12-31 00:00:00	Celtic FC	20	Defender	183	92	R
ply2255	Reo	Hatate	Japan	1997-11-21 00:00:00	Celtic FC	41	Defender	172	70	R
ply2256	Moritz	Jenz	Germany	1999-04-30 00:00:00	Celtic FC	6	Defender	190	86	R
ply2257	Josip	Juranović	Croatia	1995-08-16 00:00:00	Celtic FC	88	Defender	173	69	R
ply2258	Tony	Ralston	Scotland	1998-11-16 00:00:00	Celtic FC	56	Defender	178	70	R
ply2259	Carl	Starfelt	Sweden	1995-06-01 00:00:00	Celtic FC	4	Defender	187	83	R
ply2260	Greg	Taylor	Scotland	1997-11-05 00:00:00	Celtic FC	3	Defender	173	68	L
ply2261	Stephen	Welsh	Scotland	2000-01-19 00:00:00	Celtic FC	57	Defender	188	78	R
ply2262	Oliver	Abildgaard	Denmark	1996-06-10 00:00:00	Celtic FC	28	Midfielder	192	86	L
ply2263	James	Forrest	Scotland	1991-07-07 00:00:00	Celtic FC	49	Midfielder	175	75	R
ply2264	Sead	Hakšabanović	Montenegro	1999-05-04 00:00:00	Celtic FC	9	Midfielder	174	69	R
ply2265	Yosuke	Ideguchi	Japan	1996-08-23 00:00:00	Celtic FC	21	Midfielder	171	71	R
ply2266	James	McCarthy	Ireland	1990-11-12 00:00:00	Celtic FC	16	Midfielder	180	72	R
ply2267	Callum	McGregor	Scotland	1993-06-14 00:00:00	Celtic FC	42	Midfielder	178	73	L
ply2268	Aaron	Mooy	Australia	1990-09-15 00:00:00	Celtic FC	13	Midfielder	174	75	R
ply2269	Dane	Murray	Scotland	2003-06-26 00:00:00	Celtic FC	47	Midfielder	193	\N	R
ply2270	Matt	O'Riley	England	2000-11-21 00:00:00	Celtic FC	33	Midfielder	187	77	L
ply2271	Scott	Robertson	Scotland	2001-07-27 00:00:00	Celtic FC	35	Midfielder	185	\N	\N
ply2272	David	Turnbull	Scotland	1999-07-10 00:00:00	Celtic FC	14	Midfielder	185	75	\N
ply2273	Liel	Abada	Israel	2001-10-03 00:00:00	Celtic FC	11	Forward	168	\N	R
ply2274	Kyogo	Furuhashi	Japan	1995-01-20 00:00:00	Celtic FC	8	Forward	170	63	R
ply2275	Georgios	Giakoumakis	Greece	1994-12-09 00:00:00	Celtic FC	7	Forward	186	86	R
ply2276	\N	Jota	Portugal	1999-03-30 00:00:00	Celtic FC	17	Forward	175	60	\N
ply2277	Daizen	Maeda	Japan	1997-10-20 00:00:00	Celtic FC	38	Forward	173	67	R
ply2278	Stevie	Woods	Scotland	1970-02-23 00:00:00	Celtic FC	\N	Goalkeeping	188	76	\N
ply2279	Nils De	Mol	Switzerland	2001-05-03 00:00:00	FC Basel	16	Goalkeeper	183	84	R
ply2280	Mirko	Salvi	Switzerland	1994-02-14 00:00:00	FC Basel	13	Goalkeeper	188	82	R
ply2281	Kasim	Adams	Ghana	1995-06-22 00:00:00	FC Basel	15	Defender	190	86	R
ply2282	Arnau	Comas	Spain	2000-04-11 00:00:00	FC Basel	4	Defender	191	83	R
ply2283	Riccardo	Calafiori	Italy	2002-05-19 00:00:00	FC Basel	\N	Defender	186	76	L
ply2284	Noah	Katterbach	Germany	2001-04-13 00:00:00	FC Basel	3	Defender	180	73	L
ply2285	Michael	Lang	Switzerland	1991-02-08 00:00:00	FC Basel	5	Defender	185	79	R
ply2286	Andy	Pelmard	France	2000-03-12 00:00:00	FC Basel	21	Defender	180	68	R
ply2287	Sergio	López	Spain	1999-04-08 00:00:00	FC Basel	22	Defender	179	70	R
ply2288	Hugo	Vogel	France	2004-01-04 00:00:00	FC Basel	28	Defender	177	74	L
ply2289	Wouter	Burger	Netherlands	2001-02-16 00:00:00	FC Basel	23	Midfielder	190	83	L
ply2290	Liam	Chipperfield	Switzerland	2004-02-14 00:00:00	FC Basel	40	Midfielder	178	74	\N
ply2291	Andy	Diouf	France	2003-05-17 00:00:00	FC Basel	8	Midfielder	181	68	L
ply2292	Emmanuel	Essiam	Ghana	2003-12-19 00:00:00	FC Basel	18	Midfielder	183	72	R
ply2293	Fabian	Frei	Switzerland	1989-01-08 00:00:00	FC Basel	20	Midfielder	183	80	R
ply2294	Sayfallah	Ltaief	Switzerland	2000-04-22 00:00:00	FC Basel	42	Midfielder	178	77	R
ply2295	Yannick	Marchand	Switzerland	2000-02-09 00:00:00	FC Basel	38	Midfielder	183	70	R
ply2296	Taulant	Xhaka	Albania	1991-03-28 00:00:00	FC Basel	34	Midfielder	172	72	R
ply2297	Zeki	Amdouni	Switzerland	2000-12-04 00:00:00	FC Basel	9	Forward	185	79	\N
ply2298	Jean-Kévin	Augustin	France	1997-06-16 00:00:00	FC Basel	10	Forward	180	80	R
ply2299	Bradley	Fink	Switzerland	2003-04-17 00:00:00	FC Basel	14	Forward	193	85	\N
ply2300	Anton	Kade	Germany	2004-01-17 00:00:00	FC Basel	30	Forward	183	62	R
ply2301	Darian	Males	Switzerland	2001-05-03 00:00:00	\N	\N	Forward	189	77	L
ply2302	Liam	Millar	Canada	1999-09-27 00:00:00	FC Basel	7	Forward	181	75	R
ply2303	Dan	Ndoye	Switzerland	2000-10-25 00:00:00	FC Basel	27	Forward	184	78	R
ply2304	Kaly	Sène	Senegal	2001-05-28 00:00:00	FC Basel	26	Forward	180	72	R
ply2305	Ádám	Szalai	Hungary	1987-12-09 00:00:00	FC Basel	11	Forward	193	93	R
ply2306	Tician	Tushi	Switzerland	2001-04-02 00:00:00	FC Basel	24	Forward	180	77	R
ply2307	Andi	Zeqiri	Switzerland	1999-06-22 00:00:00	FC Basel	17	Forward	185	80	L
ply2308	Justin	Bijlow	Netherlands	1998-01-22 00:00:00	Feyenoord	1	Goalkeeper	188	76	R
ply2309	Ofir	Marciano	Israel	1989-10-07 00:00:00	Feyenoord	21	Goalkeeper	193	87	R
ply2310	Devin	Remie	Netherlands	2003-03-13 00:00:00	Feyenoord	51	Goalkeeper	\N	\N	R
ply2311	Timon	Wellenreuther	Germany	1995-12-03 00:00:00	Feyenoord	22	Goalkeeper	188	80	R
ply2312	Mimeirhel	Benita	Netherlands	2003-11-17 00:00:00	Feyenoord	24	Defender	\N	\N	R
ply2313	Fredrik	Bjørkan	Norway	1998-08-21 00:00:00	Feyenoord	5	Defender	180	74	L
ply2314	Lutsharel	Geertruida	Netherlands	2000-07-18 00:00:00	Feyenoord	4	Defender	184	69	R
ply2315	Dávid	Hancko	Slovakia	1997-12-13 00:00:00	Feyenoord	33	Defender	188	79	L
ply2316	Quilindschy	Hartman	Netherlands	2001-11-14 00:00:00	Feyenoord	19	Defender	183	\N	L
ply2317	Marcos	López	Peru	1999-11-20 00:00:00	Feyenoord	15	Defender	178	67	L
ply2318	Marcus	Pedersen	Norway	2000-07-16 00:00:00	Feyenoord	2	Defender	183	76	R
ply2319	Jacob	Rasmussen	Denmark	1997-05-28 00:00:00	Feyenoord	6	Defender	190	81	L
ply2320	Gernot	Trauner	Austria	1992-03-25 00:00:00	Feyenoord	18	Defender	183	82	R
ply2321	Ezequiel	Bullaude	Argentina	2000-10-26 00:00:00	Feyenoord	30	Midfielder	184	71	R
ply2322	Orkun	Kökçü	Turkey	2000-12-29 00:00:00	Feyenoord	10	Midfielder	175	67	R
ply2323	Noah	Naujoks	Netherlands	2002-05-02 00:00:00	Feyenoord	27	Midfielder	\N	\N	R
ply2324	Sebastian	Szymański	Poland	1999-05-10 00:00:00	Feyenoord	17	Midfielder	174	60	L
ply2325	Mo	Taabouni	Netherlands	2002-03-29 00:00:00	Feyenoord	25	Midfielder	178	\N	R
ply2326	Quinten	Timber	Netherlands	2001-06-17 00:00:00	Feyenoord	8	Midfielder	177	71	R
ply2327	Mats	Wieffer	Netherlands	1999-11-16 00:00:00	Feyenoord	20	Midfielder	188	\N	R
ply2328	\N	Danilo	Brazil	1999-04-07 00:00:00	Feyenoord	9	Forward	174	66	R
ply2329	Javairô	Dilrosun	Netherlands	1998-06-22 00:00:00	Feyenoord	11	Forward	174	74	L
ply2330	Santiago	Giménez	Mexico	2001-04-18 00:00:00	Feyenoord	29	Forward	183	69	L
ply2331	Igor	Paixão	Brazil	2000-06-28 00:00:00	Feyenoord	14	Forward	167	\N	R
ply2332	Alireza	Jahanbakhsh	Iran	1993-08-11 00:00:00	Feyenoord	7	Forward	180	78	R
ply2333	Patrik	Wålemark	Sweden	2001-10-14 00:00:00	Feyenoord	23	Forward	184	75	L
ply2334	Khalid	Benlahsen	Netherlands	1974-04-22 00:00:00	Feyenoord	\N	Goalkeeping	\N	\N	\N
ply2335	Robin van	Persie	Netherlands	1983-08-06 00:00:00	Feyenoord	\N	Individual	183	71	L
ply2336	Roderick van der	Ham	Netherlands	\N	Feyenoord	\N	Video	\N	\N	\N
ply2337	Menno	Bergsen	Netherlands	1999-08-26 00:00:00	NK Maribor	81	Goalkeeper	186	76	R
ply2338	Ažbe	Jug	Slovenia	1992-03-03 00:00:00	NK Maribor	1	Goalkeeper	192	96	R
ply2339	Samo	Pridgar	Slovenia	2003-03-10 00:00:00	NK Maribor	59	Goalkeeper	\N	\N	\N
ply2340	Marko	Zalokar	Slovenia	1990-06-18 00:00:00	NK Maribor	52	Goalkeeper	191	\N	R
ply2341	Ignacio	Guerrico	Argentina	1998-07-09 00:00:00	NK Maribor	40	Defender	175	71	L
ply2342	Sven	Karič	Slovenia	1998-03-07 00:00:00	NK Maribor	25	Defender	186	81	L
ply2343	Vid	Koderman	Slovenia	2003-04-18 00:00:00	NK Maribor	42	Defender	177	71	L
ply2344	Martin	Milec	Slovenia	1991-09-20 00:00:00	NK Maribor	22	Defender	174	70	R
ply2345	Nemanja	Mitrovič	Slovenia	1992-10-15 00:00:00	NK Maribor	32	Defender	192	88	R
ply2346	Žiga	Obreht	Slovenia	2002-07-25 00:00:00	NK Maribor	\N	Defender	\N	\N	\N
ply2347	Gregor	Sikošek	Slovenia	1994-02-13 00:00:00	NK Maribor	12	Defender	176	74	R
ply2348	Luka	Uskoković	Montenegro	1996-04-10 00:00:00	NK Maribor	23	Defender	193	87	R
ply2349	Max	Watson	Sweden	1996-02-03 00:00:00	NK Maribor	20	Defender	186	82	R
ply2350	Andraž	Žinič	Slovenia	1999-02-12 00:00:00	NK Maribor	29	Defender	179	76	R
ply2351	Aljaž	Antolin	Slovenia	2002-08-02 00:00:00	NK Maribor	16	Midfielder	179	\N	R
ply2352	Marko	Božič	Austria	1998-05-14 00:00:00	NK Maribor	8	Midfielder	182	78	R
ply2353	Luka	Božičković	Bosnia-Herzegovina	2003-09-02 00:00:00	NK Maribor	21	Midfielder	182	\N	R
ply2354	Tine	Čuk	Slovenia	2005-02-15 00:00:00	NK Maribor	97	Midfielder	\N	\N	\N
ply2355	Rok	Kronaveter	Slovenia	1986-12-07 00:00:00	NK Maribor	7	Midfielder	187	83	R
ply2356	Marcel	Lorber	Slovenia	2004-04-26 00:00:00	NK Maribor	55	Midfielder	\N	\N	\N
ply2357	Aleks	Pihler	Slovenia	1994-01-15 00:00:00	NK Maribor	6	Midfielder	183	75	R
ply2358	Jan	Repas	Slovenia	1997-03-19 00:00:00	NK Maribor	15	Midfielder	171	69	R
ply2359	Danijel	Šturm	Slovenia	1999-01-04 00:00:00	NK Maribor	11	Midfielder	182	75	R
ply2360	Marko	Tolić	Croatia	1996-07-05 00:00:00	NK Maribor	44	Midfielder	189	77	R
ply2361	Vladan	Vidaković	Serbia	1999-03-14 00:00:00	NK Maribor	14	Midfielder	193	80	R
ply2362	Roko	Baturina	Croatia	2000-06-20 00:00:00	NK Maribor	18	Forward	187	82	L
ply2363	Ivan	Brnić	Croatia	2001-08-23 00:00:00	NK Maribor	17	Forward	175	68	R
ply2364	Marin	Laušić	Croatia	2001-06-26 00:00:00	NK Maribor	30	Forward	187	75	R
ply2365	Ishaq	Rafiu	Nigeria	2000-12-16 00:00:00	NK Maribor	31	Forward	178	\N	L
ply2366	Rok	Sirk	Slovenia	1993-09-10 00:00:00	NK Maribor	13	Forward	183	77	R
ply2367	Marcos	Tavares	Slovenia	2004-06-01 00:00:00	NK Maribor	90	Forward	\N	\N	\N
ply2368	Žan	Vipotnik	Slovenia	2002-03-18 00:00:00	NK Maribor	77	Forward	185	81	R
ply2369	Ayhan	Arazli	Azerbaijan	2001-03-29 00:00:00	Qarabağ FK	94	Goalkeeper	\N	\N	\N
ply2370	Luka	Gugeshashvili	Georgia	1999-04-29 00:00:00	Qarabağ FK	23	Goalkeeper	196	85	L
ply2371	Şahrudin	Mahammadaliyev	Azerbaijan	1994-06-12 00:00:00	Qarabağ FK	1	Goalkeeper	188	82	R
ply2372	Amin	Ramazanov	Azerbaijan	2003-01-20 00:00:00	Qarabağ FK	89	Goalkeeper	192	\N	R
ply2373	Toral	Bayramov	Azerbaijan	2001-02-23 00:00:00	Qarabağ FK	27	Defender	\N	\N	L
ply2374	Abbas	Hüseynov	Azerbaijan	1995-06-13 00:00:00	Qarabağ FK	30	Defender	179	\N	R
ply2375	Bədavi	Hüseynov	Azerbaijan	1991-07-11 00:00:00	Qarabağ FK	55	Defender	185	\N	R
ply2376	Rahil	Mammadov	Azerbaijan	1995-11-24 00:00:00	Qarabağ FK	4	Defender	191	75	R
ply2377	Kevin	Medina	Colombia	1993-03-09 00:00:00	Qarabağ FK	81	Defender	185	\N	L
ply2378	Maksim	Medvedev	Azerbaijan	1989-09-29 00:00:00	Qarabağ FK	5	Defender	175	71	R
ply2379	Bahlul	Mustafazada	Azerbaijan	1997-02-27 00:00:00	Qarabağ FK	13	Defender	190	\N	R
ply2380	Marko	Vešović	Montenegro	1991-08-28 00:00:00	Qarabağ FK	29	Defender	180	75	R
ply2381	Nariman	Akhundzade	Azerbaijan	2004-04-23 00:00:00	Qarabağ FK	90	Midfielder	\N	\N	\N
ply2382	Nəriman	Axundzadə	Azerbaijan	2004-04-23 00:00:00	Qarabağ FK	90	Midfielder	\N	\N	\N
ply2383	Elvin	Cəfərquliyev	Azerbaijan	2000-10-26 00:00:00	Qarabağ FK	44	Midfielder	\N	\N	L
ply2384	Gaspar	Panadero	Spain	1997-12-09 00:00:00	Qarabağ FK	\N	Midfielder	170	60	L
ply2385	Ismayil	Ibrahimli	Azerbaijan	1998-02-13 00:00:00	Qarabağ FK	18	Midfielder	\N	\N	R
ply2386	Júlio	Romão	Brazil	1998-03-29 00:00:00	Qarabağ FK	6	Midfielder	193	81	R
ply2387	\N	Kady	Brazil	1996-05-02 00:00:00	Qarabağ FK	20	Midfielder	170	65	L
ply2388	Leandro	Andrade	Portugal	1999-09-24 00:00:00	Qarabağ FK	15	Midfielder	177	75	R
ply2389	Filip	Ozobić	Azerbaijan	1991-04-08 00:00:00	Qarabağ FK	19	Midfielder	178	70	R
ply2390	Qara	Qarayev	Azerbaijan	1992-10-12 00:00:00	Qarabağ FK	2	Midfielder	177	\N	\N
ply2391	\N	Richard	Azerbaijan	1989-03-20 00:00:00	Qarabağ FK	7	Midfielder	177	68	L
ply2392	Marko	Janković	Montenegro	1995-07-09 00:00:00	Qarabağ FK	8	Forward	172	67	L
ply2393	Owusu	Kwabena	Ghana	1997-06-18 00:00:00	Qarabağ FK	11	Forward	182	73	R
ply2394	Musa	Qurbanlı	Azerbaijan	2002-04-13 00:00:00	Qarabağ FK	22	Forward	183	\N	R
ply2395	Ramil	Sheydaev	Azerbaijan	1996-03-15 00:00:00	Qarabağ FK	77	Forward	187	77	R
ply2396	Abdellah	Zoubir	France	1991-12-05 00:00:00	Qarabağ FK	10	Forward	180	75	R
ply2397	Colin	Coosemans	Belgium	1992-08-03 00:00:00	RSC Anderlecht	26	Goalkeeper	186	84	R
ply2398	Hendrik Van	Crombrugge	Belgium	1993-04-30 00:00:00	RSC Anderlecht	30	Goalkeeper	188	86	L
ply2399	Timon	Vanhoutte	Belgium	2004-01-29 00:00:00	RSC Anderlecht	98	Goalkeeper	\N	\N	\N
ply2400	Bart	Verbruggen	Netherlands	2002-08-18 00:00:00	RSC Anderlecht	16	Goalkeeper	193	75	R
ply2401	Zeno	Debast	Belgium	2003-10-24 00:00:00	RSC Anderlecht	56	Defender	191	\N	R
ply2402	Hannes	Delcroix	Belgium	1999-02-28 00:00:00	RSC Anderlecht	3	Defender	185	78	L
ply2403	Wesley	Hoedt	Netherlands	1994-03-06 00:00:00	RSC Anderlecht	4	Defender	188	77	L
ply2404	Lucas	Lissens	Belgium	2001-07-25 00:00:00	RSC Anderlecht	47	Defender	184	74	R
ply2405	Michael	Murillo	Panama	1996-02-11 00:00:00	RSC Anderlecht	62	Defender	183	75	R
ply2406	Moussa	N'Diaye	Senegal	2002-06-18 00:00:00	RSC Anderlecht	\N	Defender	178	\N	L
ply2407	Killian	Sardella	Belgium	2002-05-02 00:00:00	RSC Anderlecht	54	Defender	177	64	R
ply2408	Ishaq	Abdulrazak	Nigeria	2002-05-05 00:00:00	RSC Anderlecht	24	Midfielder	176	\N	\N
ply2409	Anouar Ait El	Hadj	Belgium	2002-04-20 00:00:00	RSC Anderlecht	46	Midfielder	168	70	R
ply2410	Kristian	Arnstad	Norway	2003-09-07 00:00:00	RSC Anderlecht	61	Midfielder	168	60	R
ply2411	Majeed	Ashimeru	Ghana	1997-10-10 00:00:00	RSC Anderlecht	18	Midfielder	182	72	R
ply2412	Amadou	Diawara	Guinea	1997-07-17 00:00:00	RSC Anderlecht	21	Midfielder	182	76	R
ply2413	Marco	Kana	Belgium	2002-08-08 00:00:00	RSC Anderlecht	55	Midfielder	182	62	R
ply2414	Théo	Leoni	Belgium	2000-04-21 00:00:00	RSC Anderlecht	71	Midfielder	180	70	L
ply2415	Aristote	Nkaka	Belgium	1996-03-27 00:00:00	RSC Anderlecht	\N	Midfielder	184	79	R
ply2416	Lior	Refaelov	Israel	1986-04-26 00:00:00	RSC Anderlecht	11	Midfielder	175	70	R
ply2417	Noah	Sadiki	Belgium	2004-12-17 00:00:00	RSC Anderlecht	27	Midfielder	\N	\N	\N
ply2418	Mario	Stroeykens	Belgium	2004-09-29 00:00:00	RSC Anderlecht	29	Midfielder	183	77	R
ply2419	Adrien	Trebel	France	1991-03-03 00:00:00	RSC Anderlecht	25	Midfielder	174	70	L
ply2420	Yari	Verschaeren	Belgium	2001-07-12 00:00:00	RSC Anderlecht	10	Midfielder	172	69	R
ply2421	Francis	Amuzu	Belgium	1999-08-23 00:00:00	RSC Anderlecht	7	Forward	170	65	R
ply2422	Nilson	Angulo	Ecuador	2003-06-19 00:00:00	RSC Anderlecht	32	Forward	182	64	\N
ply2423	Julien	Duranville	Belgium	2006-05-05 00:00:00	\N	\N	Forward	170	\N	R
ply2424	Sebastiano	Esposito	Italy	2002-07-02 00:00:00	RSC Anderlecht	70	Forward	187	79	R
ply2425	Fábio	Silva	Portugal	2002-07-19 00:00:00	RSC Anderlecht	99	Forward	185	75	R
ply2426	Benito	Raman	Belgium	1994-11-07 00:00:00	RSC Anderlecht	9	Forward	172	67	R
ply2427	Aleksandr	Maksimenko	Russia	1998-03-19 00:00:00	Spartak Moskva	98	Goalkeeper	187	81	L
ply2428	Aleksandr	Selikhov	Russia	1994-04-07 00:00:00	Spartak Moskva	57	Goalkeeper	190	85	R
ply2429	Anton	Shitov	Russia	2000-01-29 00:00:00	Spartak Moskva	31	Goalkeeper	190	85	L
ply2430	Mikhail	Volkov	Russia	2003-04-10 00:00:00	Spartak Moskva	95	Goalkeeper	185	81	R
ply2431	Nikita	Chernov	Russia	1996-01-14 00:00:00	Spartak Moskva	23	Defender	188	80	R
ply2432	Georgi	Dzhikiya	Russia	1993-11-21 00:00:00	Spartak Moskva	14	Defender	188	86	L
ply2433	Dmitriy	Ivannikov	Russia	2005-02-26 00:00:00	Spartak Moskva	83	Defender	\N	\N	L
ply2434	Leon	Klassen	Russia	2000-05-29 00:00:00	Spartak Moskva	5	Defender	174	70	L
ply2435	Pavel	Maslov	Russia	2000-04-14 00:00:00	Spartak Moskva	29	Defender	184	75	R
ply2436	Miha	Mevlja	Slovenia	1990-06-12 00:00:00	Spartak Moskva	32	Defender	190	83	R
ply2437	Nikolai	Rasskazov	Russia	1998-01-04 00:00:00	Spartak Moskva	92	Defender	180	73	R
ply2438	Maciej	Rybus	Poland	1989-08-19 00:00:00	Spartak Moskva	13	Defender	173	75	L
ply2439	Danil	Denisov	Russia	2002-10-21 00:00:00	Spartak Moskva	97	Midfielder	185	72	R
ply2440	Mikhail	Ignatov	Russia	2000-05-04 00:00:00	Spartak Moskva	22	Midfielder	187	78	R
ply2441	Daniil	Khlusevich	Russia	2001-02-26 00:00:00	Spartak Moskva	82	Midfielder	182	80	R
ply2442	Ruslan	Litvinov	Russia	2001-08-18 00:00:00	Spartak Moskva	68	Midfielder	184	74	R
ply2443	Christopher	Martins	Luxembourg	1997-02-19 00:00:00	Spartak Moskva	35	Midfielder	187	80	R
ply2444	Victor	Moses	Nigeria	1990-12-12 00:00:00	Spartak Moskva	8	Midfielder	177	79	R
ply2445	Danil	Prutsev	Russia	2000-03-25 00:00:00	Spartak Moskva	25	Midfielder	174	64	R
ply2446	Nail	Umyarov	Russia	2000-06-27 00:00:00	Spartak Moskva	18	Midfielder	182	73	R
ply2447	Roman	Zobnin	Russia	1994-02-11 00:00:00	Spartak Moskva	47	Midfielder	185	78	R
ply2448	Daniil	Zorin	Russia	2004-02-22 00:00:00	Spartak Moskva	87	Midfielder	\N	\N	R
ply2449	Keita	Baldé	Senegal	1995-03-08 00:00:00	Spartak Moskva	9	Forward	184	80	\N
ply2450	Pavel	Meleshin	Russia	2004-03-25 00:00:00	Spartak Moskva	70	Forward	188	81	R
ply2451	Shamar	Nicholson	Jamaica	1997-03-16 00:00:00	Spartak Moskva	11	Forward	192	85	R
ply2452	Vitaliy	Shitov	Russia	2003-05-07 00:00:00	Spartak Moskva	76	Forward	176	70	R
ply2453	Aleksandr	Sobolev	Russia	1997-03-07 00:00:00	Spartak Moskva	7	Forward	195	85	R
ply2454	Anton	Zinkovskiy	Russia	1996-04-14 00:00:00	Spartak Moskva	17	Forward	170	60	R
ply2455	Andrija	Živković	Serbia	1996-07-11 00:00:00	\N	14	Forward	169	66	L
ply2456	\N	Vitinho	Brazil	1993-10-09 00:00:00	\N	27	Arabia	180	75	R
ply2457	Timur	Zhamaletdinov	Russia	1997-05-21 00:00:00	\N	75	Forward	182	74	R
ply2458	Dimitri	Oberlin	Switzerland	1997-09-27 00:00:00	\N	10	Forward	182	74	R
ply2459	Ricky van	Wolfswinkel	Netherlands	1989-01-27 00:00:00	\N	9	Forward	186	72	R
ply2460	Blas	Riveros	Paraguay	1998-02-03 00:00:00	\N	15	Defender	178	79	L
ply2461	Luca	Zuffi	Switzerland	1990-03-27 00:00:00	\N	7	Midfielder	182	76	L
ply2462	Alan	Dzagoev	Russia	1990-06-17 00:00:00	\N	6	Midfielder	179	70	R
ply2463	Bibras	Natcho	Israel	1988-02-18 00:00:00	\N	10	Midfielder	177	73	R
ply2464	Raoul	Petretta	Italy	1997-03-24 00:00:00	\N	28	Defender	176	70	L
ply2465	Mohamed	Elyounoussi	Norway	1994-08-04 00:00:00	\N	24	Forward	178	70	R
ply2466	Mikael	Lustig	Sweden	1986-12-13 00:00:00	\N	33	Defender	189	77	R
ply2467	Layvin	Kurzawa	France	1992-09-04 00:00:00	\N	3	Defender	182	74	L
ply2468	Dani	Alves	Brazil	1983-05-06 00:00:00	\N	33	Defender	172	70	R
ply2469	Kieran	Tierney	Scotland	1997-06-05 00:00:00	\N	3	Defender	180	70	L
ply2470	Patrick	Roberts	England	1997-02-05 00:00:00	\N	10	Forward	167	66	L
ply2471	Olivier	Ntcham	France	1996-02-09 00:00:00	\N	10	Midfielder	180	80	R
ply2472	Stuart	Armstrong	Scotland	1992-03-30 00:00:00	\N	17	Midfielder	183	75	R
ply2473	Sofiane	Hanni	Algeria	1990-12-29 00:00:00	\N	94	Midfielder	178	72	R
ply2474	Cesc	Fàbregas	Spain	1987-05-04 00:00:00	\N	4	Midfielder	179	76	R
ply2475	Pedro	Henrique	Brazil	1990-06-16 00:00:00	\N	15	Forward	179	72	\N
ply2476	Dino	Ndlovu	South Africa	1990-02-15 00:00:00	\N	\N	Forward	183	\N	L
ply2477	David	Luiz	Brazil	1987-04-22 00:00:00	\N	23	Defender	189	86	R
ply2478	Federico	Fazio	Argentina	1987-03-17 00:00:00	\N	17	Defender	195	90	R
ply2479	Wilde-Donald	Guerrier	Haiti	1989-03-31 00:00:00	\N	10	Defender	175	72	L
ply2480	\N	Iniesta	Spain	1984-05-11 00:00:00	\N	8	Midfielder	171	68	\N
ply2481	Felipe	Pardo	Colombia	1990-08-17 00:00:00	\N	17	Midfielder	179	84	R
ply2482	Dimitrios	Nikolaou	Greece	1998-08-13 00:00:00	\N	43	Defender	188	82	L
ply2483	Lucas	Digne	France	1993-07-20 00:00:00	\N	27	Defender	178	74	L
ply2484	Bruno	César	Brazil	1988-11-03 00:00:00	\N	10	Midfielder	178	73	L
ply2485	Bas	Dost	Netherlands	1989-05-31 00:00:00	\N	28	Forward	196	78	R
ply2486	Vadis	Odjidja-Ofoe	Belgium	1989-02-21 00:00:00	\N	8	Midfielder	185	79	R
ply2487	Denis	Suárez	Spain	1994-01-06 00:00:00	\N	6	Midfielder	178	66	R
ply2488	Sergio	Escudero	Spain	1989-09-02 00:00:00	\N	18	Defender	176	65	L
ply2489	Damjan	Bohar	Slovenia	1991-10-18 00:00:00	\N	39	Forward	172	69	R
ply2490	Martin	Kramarič	Slovenia	1997-11-14 00:00:00	\N	10	Midfielder	178	72	R
ply2491	\N	Fernando	Brazil	1992-03-03 00:00:00	\N	8	Midfielder	175	80	R
ply2492	Franco	Vázquez	Argentina	1989-02-22 00:00:00	\N	10	Midfielder	187	87	L
ply2493	Sébastien	Corchia	France	1990-11-01 00:00:00	\N	24	Defender	176	69	R
ply2494	Lorenzo	Melgarejo	Paraguay	1990-08-10 00:00:00	\N	35	Forward	177	75	R
ply2495	Denis	Glushakov	Russia	1987-01-27 00:00:00	\N	8	Midfielder	182	82	R
ply2496	Luiz	Adriano	Brazil	1987-04-12 00:00:00	\N	10	Forward	184	78	R
ply2497	Éver	Banega	Argentina	1988-06-29 00:00:00	\N	10	Arabia	174	71	R
ply2498	Jasmin	Mešanović	Bosnia-Herzegovina	1992-01-06 00:00:00	\N	27	Forward	183	75	R
ply2499	Guido	Pizarro	Argentina	1990-02-26 00:00:00	\N	19	Midfielder	185	78	R
ply2500	\N	Ganso	Brazil	1989-10-12 00:00:00	\N	10	Midfielder	184	79	L
ply2501	Facundo	Ferreyra	Argentina	1991-03-14 00:00:00	\N	16	Forward	183	80	R
ply2502	Sofyan	Amrabat	Morocco	1996-08-21 00:00:00	\N	34	Midfielder	185	70	R
ply2503	\N	Bernard	Brazil	1992-09-08 00:00:00	\N	\N	Forward	164	54	R
ply2504	Bogdan	Butko	Ukraine	1991-01-13 00:00:00	\N	2	Defender	182	74	R
ply2505	Renato	Tapia	Peru	1995-07-28 00:00:00	\N	14	Midfielder	185	80	R
ply2506	Anderson	Talisca	Brazil	1994-02-01 00:00:00	\N	94	Arabia	188	74	R
ply2507	Ryan	Babel	Netherlands	1986-12-19 00:00:00	\N	10	Forward	185	79	R
ply2508	Álvaro	Negredo	Spain	1985-08-20 00:00:00	\N	18	Forward	186	84	L
ply2509	Youri	Tielemans	Belgium	1997-05-07 00:00:00	\N	8	Midfielder	176	72	\N
ply2510	Vincent	Aboubakar	Cameroon	1992-01-22 00:00:00	\N	9	Arabia	184	82	R
ply2511	Miguel	Layún	Mexico	1988-06-25 00:00:00	\N	19	Defender	183	75	\N
ply2512	Radamel	Falcao	Colombia	1986-02-10 00:00:00	\N	9	Forward	177	72	R
ply2513	Rony	Lopes	Portugal	1995-12-28 00:00:00	\N	11	Forward	174	68	L
ply2514	João	Moutinho	Portugal	1986-09-08 00:00:00	\N	28	Midfielder	170	61	R
ply2515	Maximiliano	Pereira	Uruguay	1984-06-08 00:00:00	\N	16	Defender	173	73	R
ply2516	Ricardo	Pereira	Portugal	1993-10-06 00:00:00	\N	21	Defender	175	70	R
ply2517	\N	Jemerson	Brazil	1992-08-24 00:00:00	\N	\N	Defender	184	77	R
ply2518	Kamil	Glik	Poland	1988-02-03 00:00:00	\N	15	Defender	190	80	R
ply2519	Jeremain	Lens	Netherlands	1987-11-24 00:00:00	\N	\N	Forward	178	75	R
ply2520	Andrey	Yarmolenko	Ukraine	1989-10-23 00:00:00	\N	\N	Emirates	190	81	L
ply2522	Toby	Alderweireld	Belgium	1989-03-02 00:00:00	\N	23	Defender	186	81	R
ply2523	Borja	Mayoral	Spain	1997-04-05 00:00:00	\N	19	Forward	182	73	R
ply2524	\N	Carlão	Brazil	1986-01-19 00:00:00	\N	\N	Defender	183	73	L
ply2525	Danny	Ings	England	1992-07-23 00:00:00	\N	9	Forward	178	73	R
ply2526	Kevin	Strootman	Netherlands	1990-02-13 00:00:00	\N	8	Midfielder	187	78	L
ply2527	Gökhan	Gönül	Turkey	1985-01-04 00:00:00	\N	77	Defender	175	75	R
ply2528	Vágner	Love	Brazil	1984-06-11 00:00:00	\N	\N	Forward	172	72	R
ply2529	Karl	Hein	Estonia	2002-04-13 00:00:00	Arsenal FC	31	Goalkeeper	193	76	R
ply2530	Aaron	Ramsdale	England	1998-05-14 00:00:00	Arsenal FC	1	Goalkeeper	190	77	R
ply2531	Matt	Turner	USA	1994-06-24 00:00:00	Arsenal FC	30	Goalkeeper	191	88	R
ply2532	\N	Cédric	Portugal	1991-08-31 00:00:00	Arsenal FC	17	Defender	171	67	R
ply2533	\N	Gabriel	Brazil	1997-12-19 00:00:00	Arsenal FC	6	Defender	190	78	L
ply2534	Rob	Holding	England	1995-09-20 00:00:00	Arsenal FC	16	Defender	189	81	R
ply2535	William	Saliba	France	2001-03-24 00:00:00	Arsenal FC	12	Defender	192	87	R
ply2536	Lino	Sousa	England	2005-01-19 00:00:00	Arsenal FC	96	Defender	185	\N	L
ply2537	Takehiro	Tomiyasu	Japan	1998-11-05 00:00:00	Arsenal FC	18	Defender	188	84	R
ply2538	Ben	White	England	1997-10-08 00:00:00	Arsenal FC	4	Defender	186	77	R
ply2539	Cătălin	Cîrjan	Romania	2002-12-01 00:00:00	Arsenal FC	44	Midfielder	178	62	R
ply2540	Amario	Cozier-Duberry	England	2005-05-29 00:00:00	Arsenal FC	85	Midfielder	171	\N	L
ply2541	Mohamed	Elneny	Egypt	1992-07-11 00:00:00	Arsenal FC	25	Midfielder	179	70	R
ply2542	Albert	Lokonga	Belgium	1999-10-22 00:00:00	Arsenal FC	23	Midfielder	183	67	R
ply2543	Ethan	Nwaneri	England	2007-03-21 00:00:00	Arsenal FC	83	Midfielder	\N	\N	L
ply2544	Martin	Ødegaard	Norway	1998-12-17 00:00:00	Arsenal FC	8	Midfielder	178	68	L
ply2545	Bukayo	Saka	England	2001-09-05 00:00:00	Arsenal FC	7	Midfielder	178	65	L
ply2546	Matt	Smith	England	2000-10-05 00:00:00	Arsenal FC	72	Midfielder	176	70	R
ply2547	Emile Smith	Rowe	England	2000-07-28 00:00:00	Arsenal FC	10	Midfielder	182	76	R
ply2548	Granit	Xhaka	Switzerland	1992-09-27 00:00:00	Arsenal FC	34	Midfielder	186	82	L
ply2549	Gabriel	Martinelli	Brazil	2001-06-18 00:00:00	Arsenal FC	11	Forward	178	75	R
ply2550	\N	Marquinhos	Brazil	2003-04-07 00:00:00	Arsenal FC	27	Forward	175	76	L
ply2551	Reiss	Nelson	England	1999-12-10 00:00:00	Arsenal FC	24	Forward	175	71	R
ply2552	Eddie	Nketiah	England	1999-05-30 00:00:00	Arsenal FC	14	Forward	180	73	R
ply2553	Iñaki	Caña	Spain	1975-09-19 00:00:00	Arsenal FC	\N	Goalkeeping	175	\N	\N
ply2554	Simon	Bitcon	England	1975-03-01 00:00:00	Arsenal FC	\N	Fitness	\N	\N	\N
ply2555	Barry	Solan	England	1980-09-03 00:00:00	Arsenal FC	\N	Fitness	\N	\N	\N
ply2556	Sam	Wilson	England	1991-09-05 00:00:00	Arsenal FC	\N	Fitness	\N	\N	\N
ply2557	Nicolas	Jover	France	1981-10-28 00:00:00	Arsenal FC	\N	Technique	\N	\N	\N
ply2558	Sam	Hayball	England	1992-12-28 00:00:00	Arsenal FC	\N	Game	\N	\N	\N
ply2559	James	Krause	England	1987-01-09 00:00:00	Arsenal FC	\N	Game	180	65	\N
ply2560	Kevin	Balvers	Netherlands	1990-02-20 00:00:00	Arsenal FC	\N	Video	\N	\N	\N
ply2561	Andreas	Dithmer	Denmark	2005-08-01 00:00:00	FC København	41	Goalkeeper	198	\N	R
ply2562	Kamil	Grabara	Poland	1999-01-08 00:00:00	FC København	1	Goalkeeper	195	80	R
ply2563	Kalle	Johnsson	Sweden	1990-01-28 00:00:00	FC København	21	Goalkeeper	188	84	R
ply2564	Mathew	Ryan	Australia	1992-04-08 00:00:00	FC København	51	Goalkeeper	184	82	R
ply2565	Peter	Ankersen	Denmark	1990-09-22 00:00:00	FC København	22	Defender	180	73	R
ply2566	Nicolai	Boilesen	Denmark	1992-02-16 00:00:00	FC København	20	Defender	186	75	L
ply2567	Kevin	Diks	Netherlands	1996-10-06 00:00:00	FC København	2	Defender	182	78	R
ply2568	Elias	Jelert	Denmark	2003-06-12 00:00:00	FC København	19	Defender	\N	\N	R
ply2569	Davit	Khotcholava	Georgia	1993-02-08 00:00:00	FC København	5	Defender	192	80	R
ply2570	Victor	Kristiansen	Denmark	2002-12-16 00:00:00	FC København	34	Defender	\N	\N	L
ply2571	Valdemar Lund	Jensen	Denmark	2003-05-28 00:00:00	FC København	27	Defender	\N	\N	L
ply2572	Christian	Sørensen	Denmark	1992-08-06 00:00:00	FC København	6	Defender	179	74	L
ply2573	Denis	Vavro	Slovakia	1996-04-10 00:00:00	FC København	3	Defender	189	81	R
ply2574	Akinkunmi	Amoo	Nigeria	2002-06-07 00:00:00	FC København	23	Midfielder	163	\N	L
ply2575	Roony	Bardagji	Sweden	2005-11-15 00:00:00	FC København	40	Midfielder	173	\N	L
ply2576	Rasmus	Falk	Denmark	1992-01-15 00:00:00	FC København	33	Midfielder	177	65	R
ply2577	Hákon	Haraldsson	Iceland	2003-04-10 00:00:00	FC København	30	Midfielder	180	\N	R
ply2578	Ísak	Jóhannesson	Iceland	2003-03-23 00:00:00	FC København	8	Midfielder	184	\N	L
ply2579	Lukas	Lerager	Denmark	1993-07-12 00:00:00	FC København	12	Midfielder	188	80	R
ply2580	Paul	Mukairu	Nigeria	2000-01-18 00:00:00	FC København	17	Midfielder	182	72	R
ply2581	Marko	Stamenić	New Zealand	2002-02-19 00:00:00	FC København	35	Midfielder	188	\N	R
ply2582	\N	Zeca	Greece	1988-08-31 00:00:00	FC København	10	Midfielder	182	65	\N
ply2583	Khouma	Babacar	Senegal	1993-03-17 00:00:00	FC København	11	Forward	185	85	R
ply2584	Andreas	Cornelius	Denmark	1993-03-16 00:00:00	FC København	14	Forward	195	91	L
ply2585	Mohamed	Daramy	Denmark	2002-01-07 00:00:00	FC København	15	Forward	180	71	R
ply2586	Mamoudou	Karamoko	France	1999-09-08 00:00:00	FC København	29	Forward	188	88	L
ply2587	Orri	Óskarsson	Iceland	2004-08-29 00:00:00	FC København	18	Forward	186	\N	L
ply2588	Kim	Christensen	Denmark	1979-07-16 00:00:00	FC København	\N	Goalkeeping	185	85	R
ply2589	Andrew	Clark	Australia	1974-08-24 00:00:00	FC København	\N	Fitness	180	74	\N
ply2590	Nikita	Medvedev	Russia	1994-12-17 00:00:00	FK Rostov	1	Goalkeeper	192	80	R
ply2591	Ruslan	Murtazov	Russia	2003-03-11 00:00:00	FK Rostov	68	Goalkeeper	187	75	R
ply2592	Sergey	Pesyakov	Russia	1988-12-16 00:00:00	FK Rostov	30	Goalkeeper	199	90	R
ply2593	Mikhail	Tsulaya	Russia	2005-02-08 00:00:00	FK Rostov	78	Goalkeeper	190	80	R
ply2594	Evgeniy	Chernov	Russia	1992-10-23 00:00:00	FK Rostov	28	Defender	180	73	L
ply2595	Konstantin	Kovalev	Russia	2000-01-14 00:00:00	FK Rostov	24	Defender	178	69	R
ply2596	Andrey	Langovich	Russia	2003-05-28 00:00:00	FK Rostov	87	Defender	180	70	R
ply2597	Viktor	Melekhin	Russia	2003-12-16 00:00:00	FK Rostov	92	Defender	180	70	R
ply2598	Aleksandr	Mukhin	Russia	2002-04-29 00:00:00	FK Rostov	29	Defender	185	73	L
ply2599	Maksim	Osipenko	Russia	1994-05-16 00:00:00	FK Rostov	55	Defender	190	80	R
ply2600	Nikolay	Poyarkov	Russia	1999-10-16 00:00:00	FK Rostov	71	Defender	180	71	L
ply2601	Danila	Prokhin	Russia	2001-05-24 00:00:00	FK Rostov	18	Defender	187	74	R
ply2602	Aleksandr	Silyanov	Russia	2001-02-17 00:00:00	FK Rostov	45	Defender	185	81	R
ply2603	Aleksandr	Smirnov	Russia	1996-04-12 00:00:00	FK Rostov	12	Defender	178	76	\N
ply2604	Denis	Terentyev	Russia	1992-08-13 00:00:00	FK Rostov	5	Defender	180	73	R
ply2605	Khoren	Bairamyan	Armenia	1992-01-07 00:00:00	FK Rostov	19	Midfielder	169	63	R
ply2606	Danil	Glebov	Russia	1999-11-03 00:00:00	FK Rostov	15	Midfielder	178	68	R
ply2607	Pavel	Gorelov	Russia	2003-01-22 00:00:00	FK Rostov	60	Midfielder	176	65	R
ply2608	Nikita	Kolotievsky	Russia	2001-03-04 00:00:00	FK Rostov	\N	Midfielder	182	74	L
ply2609	Aleksey	Mironov	Russia	2000-01-01 00:00:00	FK Rostov	8	Midfielder	175	70	R
ply2610	Aleksandr	Selyava	Belarus	1992-05-17 00:00:00	FK Rostov	38	Midfielder	180	73	R
ply2611	Daniil	Utkin	Russia	1999-10-12 00:00:00	FK Rostov	47	Midfielder	183	72	L
ply2612	Egor	Golenkov	Russia	1999-07-07 00:00:00	FK Rostov	69	Forward	189	82	R
ply2613	Nikolay	Komlichenko	Russia	1995-06-29 00:00:00	FK Rostov	27	Forward	193	91	R
ply2614	Stepan	Melnikov	Russia	2002-04-25 00:00:00	FK Rostov	77	Forward	180	69	L
ply2615	Artem	Ntumba	Russia	2003-04-19 00:00:00	FK Rostov	89	Forward	185	79	\N
ply2616	Dmitriy	Poloz	Russia	1991-07-12 00:00:00	FK Rostov	7	Forward	183	74	R
ply2617	Kirill	Shchetinin	Russia	2002-01-17 00:00:00	FK Rostov	88	Forward	178	70	R
ply2618	David	Tosevski	North Macedonia	2001-07-16 00:00:00	FK Rostov	\N	Forward	186	75	R
ply2619	Roman	Tugarev	Russia	1998-07-22 00:00:00	FK Rostov	23	Forward	170	63	R
ply2620	Dominik	Hładun	Poland	1995-09-17 00:00:00	Legia Warszawa	30	Goalkeeper	190	77	L
ply2621	Cezary	Miszta	Poland	2001-10-30 00:00:00	Legia Warszawa	31	Goalkeeper	192	80	\N
ply2622	Wojciech	Muzyk	Poland	1998-11-07 00:00:00	Legia Warszawa	19	Goalkeeper	195	83	R
ply2623	Kacper	Tobiasz	Poland	2002-11-04 00:00:00	Legia Warszawa	1	Goalkeeper	191	80	L
ply2624	Artur	Jędrzejczyk	Poland	1987-11-04 00:00:00	Legia Warszawa	55	Defender	189	78	R
ply2625	Mattias	Johansson	Sweden	1992-02-16 00:00:00	Legia Warszawa	6	Defender	174	64	R
ply2626	Filip	Mladenović	Serbia	1991-08-15 00:00:00	Legia Warszawa	25	Defender	180	65	L
ply2627	Maik	Nawrocki	Poland	2001-02-07 00:00:00	Legia Warszawa	17	Defender	185	74	\N
ply2628	Nikodem	Niski	Poland	2002-04-14 00:00:00	Legia Warszawa	\N	Defender	178	70	R
ply2629	Lindsay	Rose	Mauritius	1992-02-08 00:00:00	Legia Warszawa	29	Defender	184	79	R
ply2630	Yuri	Ribeiro	Portugal	1997-01-24 00:00:00	Legia Warszawa	5	Defender	175	72	L
ply2631	Rafał	Augustyniak	Poland	1993-10-14 00:00:00	Legia Warszawa	8	Midfielder	185	79	R
ply2632	Jurgen	Çelhaka	Albania	2000-12-06 00:00:00	Legia Warszawa	16	Midfielder	183	77	R
ply2633	\N	Josué	Portugal	1990-09-17 00:00:00	Legia Warszawa	27	Midfielder	174	75	L
ply2634	Bartosz	Kapustka	Poland	1996-12-23 00:00:00	Legia Warszawa	67	Midfielder	179	62	R
ply2635	Jakub	Kisiel	Poland	2003-02-05 00:00:00	Legia Warszawa	63	Midfielder	184	74	R
ply2636	Karol	Noiszewski	Poland	1999-11-13 00:00:00	Legia Warszawa	62	Midfielder	193	92	R
ply2637	Bartosz	Slisz	Poland	1999-03-29 00:00:00	Legia Warszawa	99	Midfielder	179	70	R
ply2638	Patryk	Sokołowski	Poland	1994-09-25 00:00:00	Legia Warszawa	18	Midfielder	182	73	R
ply2639	Makana	Baku	Germany	1998-04-08 00:00:00	Legia Warszawa	28	Forward	177	72	R
ply2640	\N	Carlitos	Spain	1990-06-12 00:00:00	Legia Warszawa	19	Forward	176	70	R
ply2641	Wiktor	Kamiński	Poland	2004-02-23 00:00:00	Legia Warszawa	97	Forward	177	57	\N
ply2642	Blaž	Kramer	Slovenia	1996-06-01 00:00:00	Legia Warszawa	9	Forward	191	87	R
ply2643	Ernest	Muçi	Albania	2001-03-19 00:00:00	Legia Warszawa	20	Forward	180	75	\N
ply2644	Róbert	Pich	Slovakia	1988-11-12 00:00:00	Legia Warszawa	11	Forward	173	68	\N
ply2645	Maciej	Rosołek	Poland	2001-09-02 00:00:00	Legia Warszawa	39	Forward	183	78	\N
ply2646	Kacper	Skibicki	Poland	2001-10-11 00:00:00	Legia Warszawa	22	Forward	174	64	\N
ply2647	Kacper	Skwierczyński	Poland	2003-01-11 00:00:00	Legia Warszawa	77	Forward	170	58	\N
ply2648	Igor	Strzalek	Poland	2004-01-19 00:00:00	Legia Warszawa	86	Forward	183	\N	\N
ply2649	Paweł	Wszołek	Poland	1992-04-30 00:00:00	Legia Warszawa	13	Forward	186	77	R
ply2650	Daniel	Iversen	Denmark	1997-07-19 00:00:00	Leicester City	31	Goalkeeper	191	80	R
ply2651	Alex	Smithies	England	1990-03-05 00:00:00	Leicester City	\N	Goalkeeper	189	84	R
ply2652	Danny	Ward	Wales	1993-06-22 00:00:00	Leicester City	1	Goalkeeper	191	88	R
ply2653	Ryan	Bertrand	England	1989-08-05 00:00:00	Leicester City	5	Defender	179	85	L
ply2654	Jonny	Evans	Northern Ireland	1988-01-03 00:00:00	Leicester City	6	Defender	188	77	\N
ply2655	Wout	Faes	Belgium	1998-04-03 00:00:00	Leicester City	3	Defender	187	84	R
ply2656	James	Justin	England	1998-02-23 00:00:00	Leicester City	2	Defender	183	80	R
ply2657	Çağlar	Söyüncü	Turkey	1996-05-23 00:00:00	Leicester City	4	Defender	187	82	R
ply2658	Luke	Thomas	England	2001-06-10 00:00:00	Leicester City	33	Defender	181	68	L
ply2659	Jannik	Vestergaard	Denmark	1992-08-03 00:00:00	Leicester City	23	Defender	199	98	\N
ply2660	Marc	Albrighton	England	1989-11-18 00:00:00	Leicester City	11	Midfielder	175	74	R
ply2661	Daniel	Amartey	Ghana	1994-12-21 00:00:00	Leicester City	18	Midfielder	186	79	R
ply2662	Harvey	Barnes	England	1997-12-09 00:00:00	Leicester City	7	Midfielder	182	66	R
ply2663	Lewis	Brunt	England	2000-11-06 00:00:00	Leicester City	34	Midfielder	187	68	R
ply2664	Kiernan	Dewsbury-Hall	England	1998-09-06 00:00:00	Leicester City	22	Midfielder	178	70	L
ply2665	James	Maddison	England	1996-11-23 00:00:00	Leicester City	10	Midfielder	175	73	R
ply2666	Nampalys	Mendy	Senegal	1992-06-23 00:00:00	Leicester City	24	Midfielder	167	73	R
ply2667	Wilfred	Ndidi	Nigeria	1996-12-16 00:00:00	Leicester City	25	Midfielder	183	74	R
ply2668	Dennis	Praet	Belgium	1994-05-14 00:00:00	Leicester City	26	Midfielder	181	78	R
ply2669	Boubakary	Soumaré	France	1999-02-27 00:00:00	Leicester City	42	Midfielder	188	82	R
ply2670	Ayoze	Pérez	Spain	1993-07-29 00:00:00	Leicester City	17	Forward	178	72	R
ply2671	Kelechi	Iheanacho	Nigeria	1996-10-03 00:00:00	Leicester City	14	Forward	185	82	L
ply2672	Jamie	Vardy	England	1987-01-11 00:00:00	Leicester City	9	Forward	179	76	R
ply2673	Mike	Stowell	England	1965-04-19 00:00:00	Leicester City	\N	Goalkeeping	188	74	\N
ply2674	Glen	Driscoll	England	1973-07-13 00:00:00	Leicester City	\N	Fitness	\N	\N	\N
ply2675	Andy	Blake	England	1981-09-26 00:00:00	Leicester City	\N	Chief	\N	\N	\N
ply2676	Damyan	Hristov	Bulgaria	2002-11-10 00:00:00	PFC Ludogorets Razgrad	67	Goalkeeper	\N	\N	\N
ply2677	Sergio	Padt	Netherlands	1990-06-06 00:00:00	PFC Ludogorets Razgrad	1	Goalkeeper	197	82	R
ply2678	Simon	Sluga	Croatia	1993-03-17 00:00:00	PFC Ludogorets Razgrad	12	Goalkeeper	191	81	R
ply2679	\N	Cicinho	Bulgaria	1988-12-26 00:00:00	PFC Ludogorets Razgrad	4	Defender	168	65	R
ply2680	Tihomir	Dimitrov	Bulgaria	2000-02-04 00:00:00	PFC Ludogorets Razgrad	79	Defender	176	\N	R
ply2681	Aleksandar	Ganchev	Bulgaria	2001-07-09 00:00:00	PFC Ludogorets Razgrad	91	Defender	185	\N	\N
ply2682	Žan	Karničnik	Slovenia	1994-09-18 00:00:00	PFC Ludogorets Razgrad	21	Defender	184	69	R
ply2683	Anton	Nedyalkov	Bulgaria	1993-04-30 00:00:00	PFC Ludogorets Razgrad	3	Defender	181	70	\N
ply2684	Igor	Plastun	Ukraine	1990-08-20 00:00:00	PFC Ludogorets Razgrad	32	Defender	193	80	R
ply2685	\N	Show	Angola	1999-03-06 00:00:00	PFC Ludogorets Razgrad	23	Defender	180	75	R
ply2686	Georgi	Terziev	Bulgaria	1992-04-18 00:00:00	PFC Ludogorets Razgrad	5	Defender	186	79	\N
ply2687	Olivier	Verdon	Benin	1995-10-05 00:00:00	PFC Ludogorets Razgrad	24	Defender	190	85	R
ply2688	Aslak	Witry	Norway	1996-03-10 00:00:00	PFC Ludogorets Razgrad	16	Defender	176	\N	R
ply2689	\N	Cauly	Brazil	1995-09-15 00:00:00	PFC Ludogorets Razgrad	95	Midfielder	172	68	\N
ply2690	Claude	Gonçalves	Portugal	1994-04-09 00:00:00	PFC Ludogorets Razgrad	8	Midfielder	174	69	R
ply2691	Petar	Georgiev	Bulgaria	2002-05-10 00:00:00	PFC Ludogorets Razgrad	75	Midfielder	170	\N	\N
ply2692	Danny	Gruper	Israel	1999-03-16 00:00:00	PFC Ludogorets Razgrad	14	Midfielder	\N	\N	L
ply2693	\N	Nonato	Brazil	1998-03-03 00:00:00	PFC Ludogorets Razgrad	20	Midfielder	174	68	R
ply2694	Pedro	Naressi	Brazil	1998-01-10 00:00:00	PFC Ludogorets Razgrad	30	Midfielder	178	78	R
ply2695	Jakub	Piotrowski	Poland	1997-10-04 00:00:00	PFC Ludogorets Razgrad	6	Midfielder	188	81	R
ply2696	Dominik	Yankov	Bulgaria	2000-07-28 00:00:00	PFC Ludogorets Razgrad	64	Midfielder	180	\N	R
ply2697	Ivan	Yordanov	Bulgaria	2000-11-07 00:00:00	PFC Ludogorets Razgrad	82	Midfielder	170	\N	R
ply2698	Spas	Delev	Bulgaria	1989-09-22 00:00:00	PFC Ludogorets Razgrad	90	Forward	169	68	\N
ply2699	Kiril	Despodov	Bulgaria	1996-11-11 00:00:00	PFC Ludogorets Razgrad	11	Forward	179	74	R
ply2700	\N	Jorghinho	Guinea-Bissau	1995-09-21 00:00:00	PFC Ludogorets Razgrad	17	Forward	171	68	R
ply2701	Hyusein	Kelyovluev	Bulgaria	2000-05-11 00:00:00	PFC Ludogorets Razgrad	74	Forward	\N	\N	\N
ply2702	Vladislav	Naydenov	Bulgaria	2001-11-29 00:00:00	PFC Ludogorets Razgrad	38	Forward	167	\N	\N
ply2703	\N	Rick	Brazil	1999-09-02 00:00:00	PFC Ludogorets Razgrad	73	Forward	170	66	\N
ply2704	Bernard	Tekpetey	Ghana	1997-09-03 00:00:00	PFC Ludogorets Razgrad	37	Forward	172	69	R
ply2705	\N	Thiago	Brazil	2001-06-26 00:00:00	PFC Ludogorets Razgrad	9	Forward	188	85	R
ply2706	Matías	Tissera	Argentina	1996-09-06 00:00:00	PFC Ludogorets Razgrad	10	Forward	180	72	R
ply2707	Jonathan	Cafú	Brazil	1991-07-10 00:00:00	\N	21	Forward	175	65	R
ply2708	\N	Marcelinho	Bulgaria	1984-08-24 00:00:00	\N	\N	Midfielder	177	70	R
ply2709	Theo	Walcott	England	1989-03-16 00:00:00	\N	32	Forward	175	68	\N
ply2710	Natanael	Pimenta	Brazil	1990-12-25 00:00:00	\N	25	Defender	168	65	L
ply2711	Santi	Cazorla	Spain	1984-12-13 00:00:00	\N	19	Midfielder	168	65	\N
ply2712	Lucas	Pérez	Spain	1988-09-10 00:00:00	\N	15	Forward	180	82	L
ply2713	\N	Wanderson	Bulgaria	1988-01-02 00:00:00	\N	\N	Forward	167	67	R
ply2714	Claudiu	Keșerü	Romania	1986-12-02 00:00:00	\N	28	Forward	180	81	L
ply2715	Alex	Iwobi	Nigeria	1996-05-03 00:00:00	\N	17	Forward	183	75	R
ply2716	Kieran	Gibbs	England	1989-09-26 00:00:00	\N	3	Defender	180	70	L
ply2717	Virgil	Misidjan	Netherlands	1993-07-24 00:00:00	\N	10	Forward	173	70	\N
ply2718	Serhiy	Rybalka	Ukraine	1990-04-01 00:00:00	\N	37	Midfielder	176	70	R
ply2719	Gonçalo	Guedes	Portugal	1996-11-29 00:00:00	\N	17	Forward	179	68	R
ply2720	Manolo	Gabbiadini	Italy	1991-11-26 00:00:00	\N	23	Forward	186	81	L
ply2721	Ljubomir	Fejsa	Serbia	1988-08-14 00:00:00	\N	15	Midfielder	183	80	R
ply2722	Derlis	González	Paraguay	1994-03-20 00:00:00	\N	10	Forward	172	75	R
ply2723	Raúl	Jiménez	Mexico	1991-05-05 00:00:00	\N	9	Forward	188	81	R
ply2724	\N	Nolito	Spain	1986-10-15 00:00:00	\N	9	Forward	175	73	R
ply2725	André	Hahn	Germany	1990-08-13 00:00:00	\N	28	Forward	185	80	R
ply2726	Aleix	Vidal	Spain	1989-08-21 00:00:00	\N	22	Defender	177	70	R
ply2727	Luciano	Narsingh	Netherlands	1990-09-13 00:00:00	\N	9	Forward	175	69	R
ply2728	Christian	Noboa	Ecuador	1985-04-09 00:00:00	\N	16	Midfielder	182	75	R
ply2729	Admir	Mehmedi	Switzerland	1991-03-16 00:00:00	\N	14	Forward	183	78	R
ply2730	Roman	Eremenko	Finland	1987-03-19 00:00:00	\N	18	Midfielder	186	80	R
ply2731	Javier	Hernández	Mexico	1988-06-01 00:00:00	\N	14	Forward	175	73	R
ply2732	Guido	Carrillo	Argentina	1991-05-25 00:00:00	\N	\N	Forward	191	87	R
ply2733	Valère	Germain	France	1990-04-17 00:00:00	\N	9	Forward	180	73	R
ply2734	Vladlen	Yurchenko	Ukraine	1994-01-22 00:00:00	\N	80	Midfielder	181	74	R
ply2735	Zoran	Tošić	Serbia	1987-04-28 00:00:00	\N	11	Forward	171	71	L
ply2736	\N	Bartra	Spain	1991-01-15 00:00:00	\N	3	Defender	184	73	R
ply2738	Adrien	Silva	Portugal	1989-03-15 00:00:00	\N	23	Emirates	175	75	R
ply2739	Tomasz	Jodłowiec	Poland	1985-09-08 00:00:00	\N	30	Midfielder	190	87	R
ply2740	William	Carvalho	Portugal	1992-04-07 00:00:00	\N	14	Midfielder	187	83	R
ply2741	Adrián	Ramos	Colombia	1986-01-22 00:00:00	\N	20	Forward	186	78	R
ply2742	Matthias	Ginter	Germany	1994-01-19 00:00:00	\N	28	Defender	191	86	R
ply2743	\N	Guilherme	Brazil	1991-05-21 00:00:00	\N	12	Midfielder	174	70	L
ply2744	Thibault	Moulin	France	1990-01-13 00:00:00	\N	\N	Midfielder	174	68	R
ply2745	Aleksandar	Prijović	Serbia	1990-04-21 00:00:00	\N	99	Forward	191	83	R
ply2746	Bartosz	Bereszyński	Poland	1992-07-12 00:00:00	\N	24	Defender	183	77	R
ply2747	Michał	Kucharczyk	Poland	1991-03-20 00:00:00	\N	18	Forward	178	72	R
ply2748	Nemanja	Nikolić	Hungary	1987-12-31 00:00:00	\N	31	Forward	180	79	\N
ply2749	Jakub	Rzeźniczak	Poland	1986-10-26 00:00:00	\N	25	Defender	183	82	R
ply2750	Stefano	Denswil	Netherlands	1993-05-07 00:00:00	\N	24	Defender	188	81	L
ply2751	Benjamin	Verbič	Slovenia	1993-11-27 00:00:00	\N	\N	Midfielder	179	70	R
ply2752	Federico	Santander	Paraguay	1991-06-04 00:00:00	\N	19	Forward	187	84	R
ply2753	Ludwig	Augustinsson	Sweden	1994-04-21 00:00:00	\N	17	Defender	181	76	L
ply2754	\N	Zanka	Denmark	1990-04-23 00:00:00	\N	13	Defender	191	79	R
ply2755	Islam	Slimani	Algeria	1988-06-18 00:00:00	\N	13	Forward	188	83	R
ply2756	Jelle	Vossen	Belgium	1989-03-22 00:00:00	\N	9	Forward	183	70	R
ply2757	Shinji	Okazaki	Japan	1986-04-16 00:00:00	\N	30	Forward	174	70	\N
ply2758	Christian	Fuchs	Austria	1986-04-07 00:00:00	\N	22	Defender	187	89	L
ply2759	\N	Rafael	Brazil	1990-07-09 00:00:00	\N	7	Defender	172	78	R
ply2760	Jordan	Ferri	France	1992-03-12 00:00:00	\N	12	Midfielder	173	73	R
ply2761	Luciano	Vietto	Argentina	1993-12-05 00:00:00	\N	10	Arabia	173	69	R
ply2762	\N	Mariano	Brazil	1986-06-23 00:00:00	\N	25	Defender	177	70	R
ply2763	\N	Vitolo	Spain	1989-11-02 00:00:00	\N	7	Forward	185	78	R
ply2764	Steven	N'Zonzi	France	1988-12-15 00:00:00	\N	88	Midfielder	196	89	R
ply2765	Mario	Lemina	Gabon	1993-09-01 00:00:00	\N	99	Midfielder	184	84	R
ply2766	Marko	Pjaca	Croatia	1995-05-06 00:00:00	\N	14	Forward	186	82	R
ply2767	Stevan	Jovetić	Montenegro	1989-11-02 00:00:00	\N	19	Forward	183	79	R
ply2768	Erik	Durm	Germany	1992-05-12 00:00:00	\N	37	Defender	182	70	R
ply2769	Giorgio	Chiellini	Italy	1984-08-14 00:00:00	\N	14	Defender	187	85	L
\.


--
-- Data for Name: stadiums; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.stadiums ("NAME", "CITY", "COUNTRY", "CAPACITY") FROM stdin;
Giuseppe Meazza	Milano	Italy	75923
Johan Cruijff ArenA	Amsterdam	Netherlands	54990
Gewiss Stadium	Bergamo	Italy	26562
Wanda Metropolitano	Madrid	Spain	68000
Allianz Arena	München	Germany	75024
Vodafone Park	Istanbul	Turkey	41903
Signal Iduna Park	Dortmund	Germany	81365
Stadion Wankdorf	Bern	Switzerland	32000
Stamford Bridge	London	England	41837
Jan Breydel Stadion	Brugge	Belgium	29042
Olimpiyskyi	Kiev	Ukraine	70050
Spotify Camp Nou	Barcelona	Spain	99354
Estádio do Dragão	Porto	Portugal	54378
Sheriff Stadium	Tiraspol	Moldova	14300
Allianz Stadium	Torino	Italy	41254
Stade Pierre Mauroy	Villeneuve D’Ascq	France	50186
Anfield	Liverpool	England	54074
Nya Malmö Stadion	Malmö	Sweden	22500
Etihad Stadium	Manchester	England	55097
Old Trafford	Manchester	England	74140
Parc des Princes	Paris	France	48712
Red Bull Arena	Leipzig	Germany	42558
Red Bull Arena	Wals-Siezenheim	Austria	31895
Santiago Bernabéu	Madrid	Spain	81044
Ramón Sánchez Pizjuán	Sevilla	Spain	43883
Donbass Arena	Donetsk	Ukraine	52518
Estádio da Luz	Lisboa	Portugal	65272
Estádio José Alvalade	Lisboa	Portugal	52000
Volkswagen Arena	Wolfsburg	Germany	30000
Estadio de la Cerámica	Villarreal	Spain	23500
Gazprom Arena	St. Petersburg	Russia	68134
Stade de France	Paris - St. Denis	France	81338
Borussia-Park	Mönchengladbach	Germany	54022
MCH Arena	Herning	Denmark	11535
Groupama Aréna	Budapest	Hungary	23700
Krasnodar Stadium	Krasnodar	Russia	34652
Fatih Terim Stadium	Istanbul	Turkey	17319
Olimpico	Roma	Italy	70634
RŽD-Arena	Moskva	Russia	27320
Georgios Karaiskakis	Piräus	Greece	33334
Vélodrome	Marseille	France	67394
Roazhon Park	Rennes	France	29778
Alfredo Di Stéfano	Madrid	Spain	9000
Puskás Aréna	Budapest	Hungary	67215
Arena Națională	Bucuresti	Romania	55611
BayArena	Leverkusen	Germany	30210
Marakana	Beograd	Serbia	55538
Maksimir	Zagreb	Croatia	38079
Nef Stadyumu	Istanbul	Turkey	52280
Cegeka Arena	Genk	Belgium	24956
Groupama Stadium	Décines-Charpieu	France	59186
Sinobo Stadium	Praha	Czech Republic	19370
Diego Maradona	Napoli	Italy	60240
Tottenham Hotspur Stadium	London	England	62062
Estadio de Mestalla	Valencia	Spain	55000
Metalist Stadion	Kharkiv	Ukraine	41307
PreZero Arena	Sinsheim	Germany	30150
Agia Sophia Stadium	Athen	Greece	30597
Stade Louis II	Monaco	France	18524
VEB Arena	Moskva	Russia	30000
Veltins-Arena	Gelsenkirchen	Germany	62271
Philips Stadion	Eindhoven	Netherlands	35000
Doosan Arena	Plzeň	Czech Republic	12500
Wembley Stadium	London	England	90000
Spyros Louis (OAKA)	Athen	Greece	71030
Luzhniki	Moskva	Russia	80840
Neo GSP Stadium	Nikosia	Cyprus	23650
Celtic Park	Glasgow	Scotland	60832
St. Jakob-Park	Basel	Switzerland	38512
De Kuip	Rotterdam	Netherlands	51177
Ljudski vrt	Maribor	Slovenia	12994
Qarabağ Stadium	Baku	Azerbaijan	4735
Lotto Park	Bruxelles	Belgium	22500
Otkrytie Arena	Moskva	Russia	44929
Baku National Stadium	Baku	Azerbaijan	68700
Emirates Stadium	London	England	60704
Telia Parken	København	Denmark	38076
Rostov Arena	Rostov-na-Donu	Russia	45000
Stadion Wojska Polskiego	Warszawa	Poland	31103
King Power Stadium	Leicester	England	32500
Huvepharma Arena	Razgrad	Bulgaria	9000
Vasil Levski	Sofia	Bulgaria	43632
Vicente Calderón	Madrid	Spain	54851
Olimp – 2	Rostov-na-Donu	Russia	15840
Arena Khimki	Khimki	Russia	18636
Millennium	Cardiff	Wales	74500
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: mpi
--

COPY public.teams ("TEAM_NAME", "COUNTRY", "HOME_STADIUM", "STADIUM_CITY") FROM stdin;
AC Milan	Italy	Giuseppe Meazza	Milano
AFC Ajax	Netherlands	Johan Cruijff ArenA	Amsterdam
Atalanta	Italy	Gewiss Stadium	Bergamo
Atlético Madrid	Spain	Wanda Metropolitano	Madrid
Bayern München	Germany	Allianz Arena	München
Beşiktaş	Turkey	Vodafone Park	Istanbul
Borussia Dortmund	Germany	Signal Iduna Park	Dortmund
BSC Young Boys	Switzerland	Stadion Wankdorf	Bern
Chelsea FC	England	Stamford Bridge	London
Club Brugge KV	Belgium	Jan Breydel Stadion	Brugge
Dinamo Kiev	Ukraine	Olimpiyskyi	Kiev
FC Barcelona	Spain	Spotify Camp Nou	Barcelona
FC Porto	Portugal	Estádio do Dragão	Porto
FC Sheriff	Moldova	Sheriff Stadium	Tiraspol
Inter	Italy	Giuseppe Meazza	Milano
Juventus	Italy	Allianz Stadium	Torino
Lille OSC	France	Stade Pierre Mauroy	Villeneuve D’Ascq
Liverpool FC	England	Anfield	Liverpool
Malmö FF	Sweden	Nya Malmö Stadion	Malmö
Manchester City	England	Etihad Stadium	Manchester
Manchester United	England	Old Trafford	Manchester
Paris Saint-Germain	France	Parc des Princes	Paris
RB Leipzig	Germany	Red Bull Arena	Wals-Siezenheim
RB Salzburg	Austria	Red Bull Arena	Wals-Siezenheim
Real Madrid	Spain	Santiago Bernabéu	Madrid
Sevilla FC	Spain	Ramón Sánchez Pizjuán	Sevilla
Shakhtar Donetsk	Ukraine	Donbass Arena	Donetsk
SL Benfica	Portugal	Estádio da Luz	Lisboa
Sporting CP	Portugal	Estádio José Alvalade	Lisboa
VfL Wolfsburg	Germany	Volkswagen Arena	Wolfsburg
Villarreal CF	Spain	Estadio de la Cerámica	Villarreal
Zenit St. Petersburg	Russia	Gazprom Arena	St. Petersburg
Bor. Mönchengladbach	Germany	Borussia-Park	Mönchengladbach
FC Midtjylland	Denmark	MCH Arena	Herning
Ferencvárosi TC	Hungary	Groupama Aréna	Budapest
FK Krasnodar	Russia	Krasnodar Stadium	Krasnodar
İstanbul Başakşehir	Turkey	Fatih Terim Stadium	Istanbul
Lazio Roma	Italy	Olimpico	Roma
Lokomotiv Moskva	Russia	RŽD-Arena	Moskva
Olympiakos Piraeus	Greece	Georgios Karaiskakis	Piräus
Olympique Marseille	France	Vélodrome	Marseille
Stade Rennes	France	Roazhon Park	Rennes
Bayer Leverkusen	Germany	BayArena	Leverkusen
Crvena Zvezda	Serbia	Marakana	Beograd
Dinamo Zagreb	Croatia	Maksimir	Zagreb
Galatasaray	Turkey	Nef Stadyumu	Istanbul
KRC Genk	Belgium	Cegeka Arena	Genk
Olympique Lyon	France	Groupama Stadium	Décines-Charpieu
Slavia Praha	Czech Republic	Sinobo Stadium	Praha
SSC Napoli	Italy	Diego Maradona	Napoli
Tottenham Hotspur	England	Tottenham Hotspur Stadium	London
Valencia CF	Spain	Estadio de Mestalla	Valencia
1899 Hoffenheim	Germany	PreZero Arena	Sinsheim
AEK Athen	Greece	Agia Sophia Stadium	Athen
AS Monaco	France	Stade Louis II	Monaco
AS Roma	Italy	Olimpico	Roma
CSKA Moskva	Russia	VEB Arena	Moskva
FC Schalke 04	Germany	Veltins-Arena	Gelsenkirchen
PSV Eindhoven	Netherlands	Philips Stadion	Eindhoven
Viktoria Plzeň	Czech Republic	Doosan Arena	Plzeň
APOEL Nikosia	Cyprus	Neo GSP Stadium	Nikosia
Celtic FC	Scotland	Celtic Park	Glasgow
FC Basel	Switzerland	St. Jakob-Park	Basel
Feyenoord	Netherlands	De Kuip	Rotterdam
NK Maribor	Slovenia	Ljudski vrt	Maribor
Qarabağ FK	Azerbaijan	Qarabağ Stadium	Baku
RSC Anderlecht	Belgium	Lotto Park	Bruxelles
Spartak Moskva	Russia	Otkrytie Arena	Moskva
Arsenal FC	England	Emirates Stadium	London
FC København	Denmark	Telia Parken	København
FK Rostov	Russia	Rostov Arena	Rostov-na-Donu
Legia Warszawa	Poland	Stadion Wojska Polskiego	Warszawa
Leicester City	England	King Power Stadium	Leicester
PFC Ludogorets Razgrad	Bulgaria	Huvepharma Arena	Razgrad
\.


--
-- Name: managers_MANAGER_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: mpi
--

SELECT pg_catalog.setval('public."managers_MANAGER_ID_seq"', 78, true);


--
-- Name: goals goals_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT goals_pkey PRIMARY KEY ("GOAL_ID");


--
-- Name: managers managers_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT managers_pkey PRIMARY KEY ("MANAGER_ID");


--
-- Name: matches matches_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_pkey PRIMARY KEY ("MATCH_ID");


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY ("PLAYER_ID");


--
-- Name: stadiums stadiums_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.stadiums
    ADD CONSTRAINT stadiums_pkey PRIMARY KEY ("NAME", "CITY");


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY ("TEAM_NAME");


--
-- Name: goals goals_MATCH_ID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "goals_MATCH_ID_fkey" FOREIGN KEY ("MATCH_ID") REFERENCES public.matches("MATCH_ID");


--
-- Name: goals goals_PID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "goals_PID_fkey" FOREIGN KEY ("PID") REFERENCES public.players("PLAYER_ID");


--
-- Name: managers managers_TEAM_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.managers
    ADD CONSTRAINT "managers_TEAM_fkey" FOREIGN KEY ("TEAM") REFERENCES public.teams("TEAM_NAME");


--
-- Name: matches matches_AWAY_TEAM_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_AWAY_TEAM_fkey" FOREIGN KEY ("AWAY_TEAM") REFERENCES public.teams("TEAM_NAME");


--
-- Name: matches matches_HOME_TEAM_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_HOME_TEAM_fkey" FOREIGN KEY ("HOME_TEAM") REFERENCES public.teams("TEAM_NAME");


--
-- Name: matches matches_STADIUM_STADIUM_CITY_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT "matches_STADIUM_STADIUM_CITY_fkey" FOREIGN KEY ("STADIUM", "STADIUM_CITY") REFERENCES public.stadiums("NAME", "CITY");


--
-- Name: players players_TEAM_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "players_TEAM_fkey" FOREIGN KEY ("TEAM") REFERENCES public.teams("TEAM_NAME");


--
-- Name: teams teams_HOME_STADIUM_STADIUM_CITY_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mpi
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "teams_HOME_STADIUM_STADIUM_CITY_fkey" FOREIGN KEY ("HOME_STADIUM", "STADIUM_CITY") REFERENCES public.stadiums("NAME", "CITY");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict eWJ2gLJDPIjThrZpuWk5CntnIwpYsdIGon3vPBqldaqLw2ZdEyUB7okNydNjBTj

