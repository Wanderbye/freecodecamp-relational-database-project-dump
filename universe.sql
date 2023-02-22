--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_light_years integer,
    galaxy_type character varying(15)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_cluster (
    galaxy_cluster_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_cluster OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_cluster_galaxy_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_cluster_galaxy_cluster_id_seq OWNED BY public.galaxy_cluster.galaxy_cluster_id;


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer,
    group_name character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_type character varying(30),
    star_id integer,
    population_in_billions numeric(5,3),
    has_life boolean,
    is_cool boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    star_type character varying(20),
    age_in_millions_of_years integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_cluster galaxy_cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster ALTER COLUMN galaxy_cluster_id SET DEFAULT nextval('public.galaxy_cluster_galaxy_cluster_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Satellite of the Milky Way', NULL, 'Disputed');
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Sphr', 'Satellite of the Milky Way', 10000, 'dSph/E7');
INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'The home of our solar system', 87400, 'Spiral Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Satellite of the Milky Way', 32200, 'SB(s)m');
INSERT INTO public.galaxy VALUES (5, 'Carina Dwarf', 'Satellite of the Milky Way', 1600, 'dE3');
INSERT INTO public.galaxy VALUES (6, 'Barnards Galaxy', 'Closest non-satellite galaxy to the Milky Way', 7000, 'IB(s)m IV-V');


--
-- Data for Name: galaxy_cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_cluster VALUES (1, 'Local Group', 'The galaxy group which holds the Milky Way, our home galaxy');
INSERT INTO public.galaxy_cluster VALUES (2, 'Bullet Group', 'A newly merging group of galaxies that recently underwent a collision');
INSERT INTO public.galaxy_cluster VALUES (3, 'Copeland Septet', 'A group of galaxies in the constellation Leo, named after its 7 member galaxies');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only moon of our planet earth', 1, NULL);
INSERT INTO public.moon VALUES (2, 'Phobos', 'The larger of the two moons of Mars. Close enough to the surface that in some locations it cannot always be seen', 4, NULL);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Smaller moon of the two Mars moons', 4, NULL);
INSERT INTO public.moon VALUES (8, 'Leda', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (9, 'Ersa', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (10, 'Pandia', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (11, 'Lysithea', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (12, 'Elara', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (14, 'Dia', 'Part of the Himalia Group of Jupiter', 5, 'Himalia');
INSERT INTO public.moon VALUES (13, 'Himalia', 'The Namesake of the Himalia Group of Jupiter due to the group members similar orbits to Himalia', 5, 'Himalia');
INSERT INTO public.moon VALUES (4, 'Io', 'Part of the Galilean Group of Jupiter', 5, 'Galilean');
INSERT INTO public.moon VALUES (5, 'Europa', 'Part of the Galilean Group of Jupiter', 5, 'Galilean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Part of the Galilean Group of Jupiter', 5, 'Galilean');
INSERT INTO public.moon VALUES (7, 'Callisto', 'Part of the Galilean Group of Jupiter', 5, 'Galilean');
INSERT INTO public.moon VALUES (15, 'Euporie', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');
INSERT INTO public.moon VALUES (16, 'Eupheme', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');
INSERT INTO public.moon VALUES (17, 'Mneme', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');
INSERT INTO public.moon VALUES (18, 'Euanth', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');
INSERT INTO public.moon VALUES (19, 'Harpalyke', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');
INSERT INTO public.moon VALUES (20, 'Orthosie', 'Part of the Ananke Group of Jupiter', 5, 'Ananke');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet', 'Terrestrial Planet', 1, 7.888, true, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 'Smallest planet in our solar system and closest to the sun', 'Terrestrial Planet', 1, NULL, false, true);
INSERT INTO public.planet VALUES (3, 'Venus', 'Second planet of our solar system which holds the highest temperatures', 'Terrestrial Planet', 1, NULL, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 'Cold desert world that likely had better conditions for life billions of years ago', 'Rocky Planet', 1, NULL, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Giant planet which holds a famous feature, the Great Red Spot, a centuries old storm larger than earth', 'Gas Giant', 1, NULL, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Large Gas Giant which has rings in its orbit', 'Gas Giant Planet', 1, NULL, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Beautiful light blue planet which rotates at a near 90-degree angle from the plane of its orbit, making it seem to spin on its side', 'Ice Giant', 1, NULL, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Deep blue and the farthest major planet from the sun', 'Ice Giant', 1, NULL, false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Once considered the ninth planet in our solar sytem, the icy body lost the title upon being re-typed to a dwarf planet', 'Dwarf Planet', 1, NULL, false, true);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri d', 'A sub-Earth planet one-quarter the mass of earth', 'sub-Earth exoplanet', 2, NULL, false, true);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 'A potentially Earth-like planet within the habitable zone of Proxima Centauri', 'Super Earth exoplanet', 2, NULL, false, true);
INSERT INTO public.planet VALUES (15, 'Lalande 21185 b', 'Planet of the Lalande 21185 Red Dwarf system around 2.7 times the mass of Earth', 'Exoplanet', NULL, NULL, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The sun of our solar system', 'Yellow Dwarf Star', 4500, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'One of the stars of the Alpha Centauri system', 'Flare Star', 4850, 1);
INSERT INTO public.star VALUES (3, 'Barnards Star', 'Fourth nearest star to the sun. Named after E. E. Barnard', 'Flare Star', 10000, 1);
INSERT INTO public.star VALUES (4, 'Luhman 16 A and B', 'Nearest Brown Dwarf stars to our solar system, and makes up a binary star system', 'Brown Dwarf', 500, 1);
INSERT INTO public.star VALUES (6, 'Sirius B', 'The second star of the Alpha Canis Majoris binary star system', 'White Dwarf', 228, 1);
INSERT INTO public.star VALUES (5, 'Sirius A', 'The brightest star in the night sky, and part of the Alpha Canis Majoris binary star system.', 'Main Sequence Star', 228, 1);


--
-- Name: galaxy_cluster_galaxy_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_cluster_galaxy_cluster_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy_cluster galaxy_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_name_key UNIQUE (name);


--
-- Name: galaxy_cluster galaxy_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_cluster
    ADD CONSTRAINT galaxy_cluster_pkey PRIMARY KEY (galaxy_cluster_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

