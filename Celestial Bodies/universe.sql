--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE ONLY public.constellation DROP CONSTRAINT constellation_pkey;
ALTER TABLE ONLY public.constellation DROP CONSTRAINT constellation_name_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.constellation ALTER COLUMN constellation_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.constellation_constellation_id_seq;
DROP TABLE public.constellation;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(50) NOT NULL,
    meaning text NOT NULL,
    visible_in_northern_hemisphere boolean NOT NULL
);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    has_supermassive_black_hole boolean NOT NULL
);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius_in_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    is_tidally_locked boolean NOT NULL
);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    radius_in_km integer NOT NULL
);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL
);


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.constellation (constellation_id, name, meaning, visible_in_northern_hemisphere) FROM stdin;
1	Orion	The Hunter	t
2	Ursa Major	The Great Bear	t
3	Scorpius	The Scorpion	f
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.galaxy (galaxy_id, name, description, age_in_millions_of_years, distance_from_earth, has_supermassive_black_hole) FROM stdin;
1	Milky Way	Our home galaxy	13600	0.00	t
2	Andromeda	Nearest major galaxy	10000	2.53	t
3	Triangulum	Third largest in Local Group	12000	3.00	f
4	Sombrero	Unusual bright nucleus	13000	29.35	t
5	Whirlpool	Grand design spiral galaxy	400	23.00	t
6	Large Magellanic Cloud	Satellite galaxy of Milky Way	11010	0.16	f
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.moon (moon_id, name, planet_id, radius_in_km, is_spherical, is_tidally_locked) FROM stdin;
1	Moon	3	1737	t	t
2	Phobos	4	11	f	t
3	Deimos	4	6	f	t
4	Io	5	1821	t	t
5	Europa	5	1560	t	t
6	Ganymede	5	2634	t	t
7	Callisto	5	2410	t	t
8	Amalthea	5	83	f	t
9	Himalia	5	85	f	f
10	Elara	5	43	f	f
11	Titan	6	2574	t	t
12	Rhea	6	764	t	t
13	Iapetus	6	734	t	t
14	Dione	6	561	t	t
15	Tethys	6	531	t	t
16	Enceladus	6	252	t	t
17	Mimas	6	198	t	t
18	Hyperion	6	135	f	t
19	Titania	7	788	t	t
20	Oberon	7	761	t	t
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.planet (planet_id, name, star_id, planet_type, has_life, is_spherical, radius_in_km) FROM stdin;
1	Mercury	1	Terrestrial	f	t	2440
2	Venus	1	Terrestrial	f	t	6052
3	Earth	1	Terrestrial	t	t	6371
4	Mars	1	Terrestrial	f	t	3390
5	Jupiter	1	Gas Giant	f	t	69911
6	Saturn	1	Gas Giant	f	t	58232
7	Uranus	1	Ice Giant	f	t	25362
8	Neptune	1	Ice Giant	f	t	24622
9	Proxima b	2	Terrestrial	f	t	7000
10	Proxima c	2	Super-Earth	f	t	9000
11	Sirius b Planet	3	Exoplanet	f	t	5000
12	Vega b	5	Gas Giant	f	t	80000
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.star (star_id, name, galaxy_id, spectral_type, age_in_millions_of_years, is_spherical) FROM stdin;
1	Sun	1	G2V	4600	t
2	Proxima Centauri	1	M5.5V	4850	t
3	Sirius	1	A1V	242	t
4	Betelgeuse	1	M1-M2	10	t
5	Vega	1	A0V	455	t
6	Alpha Andromedae	2	B8IV	70	t
\.


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

