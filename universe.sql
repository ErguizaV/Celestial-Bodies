--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    galaxy_type character varying(255) NOT NULL,
    age integer,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean,
    distance_from_planet numeric NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(255) NOT NULL,
    description text
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    is_supernova boolean,
    description text
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    id integer NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_id_seq OWNER TO freecodecamp;

--
-- Name: universe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_id_seq OWNED BY public.universe.id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


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
-- Name: universe id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN id SET DEFAULT nextval('public.universe_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13000, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10000, 'Nearest major galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 12000, 'Part of the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 6000, 'Supermassive black hole at center');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 8000, 'Interacting galaxy with a companion');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 11000, 'Bright central bulge with a dust lane');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 384400, 'Earth’s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 9377, 'Larger of Mars’ two moons');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 23460, 'Smaller of Mars’ two moons');
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, true, 1070400, 'Largest moon in the Solar System');
INSERT INTO public.moon VALUES (5, 'Europa', 5, true, 671100, 'Ice-covered moon of Jupiter');
INSERT INTO public.moon VALUES (6, 'Io', 5, true, 421700, 'Volcanically active moon of Jupiter');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, true, 1882700, 'Most heavily cratered moon');
INSERT INTO public.moon VALUES (8, 'Titan', 6, true, 1221870, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, true, 238020, 'Ice-covered moon with geysers');
INSERT INTO public.moon VALUES (10, 'Mimas', 6, true, 185520, 'Has a large impact crater');
INSERT INTO public.moon VALUES (11, 'Triton', 8, true, 354759, 'Largest moon of Neptune');
INSERT INTO public.moon VALUES (12, 'Proteus', 8, true, 117647, 'Irregularly shaped moon of Neptune');
INSERT INTO public.moon VALUES (13, 'Nereid', 8, false, 5513818, 'Highly elliptical orbit');
INSERT INTO public.moon VALUES (14, 'Charon', 7, true, 19571, 'Largest moon of Pluto');
INSERT INTO public.moon VALUES (15, 'Styx', 7, false, 42656, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (16, 'Nix', 7, false, 48694, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (17, 'Kerberos', 7, false, 57783, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (18, 'Hydra', 7, false, 64738, 'Small moon of Pluto');
INSERT INTO public.moon VALUES (19, 'Miranda', 8, true, 129780, 'Small moon of Uranus');
INSERT INTO public.moon VALUES (20, 'Ariel', 8, true, 191020, 'Moon of Uranus');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 'Second planet from the Sun');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 'Home to life');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 'Red planet');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 'Largest planet in the Solar System');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 'Known for its rings');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 'Rotates on its side');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 'Farthest planet from the Sun');
INSERT INTO public.planet VALUES (9, 'Proxima b', 4, 'Exoplanet', 'Orbits Proxima Centauri');
INSERT INTO public.planet VALUES (10, 'Vulcan', 5, 'Exoplanet', 'Hypothetical planet');
INSERT INTO public.planet VALUES (11, 'HD 209458 b', 6, 'Hot Jupiter', 'First transiting exoplanet discovered');
INSERT INTO public.planet VALUES (12, 'Kepler-22b', 6, 'Exoplanet', 'Potentially habitable planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, false, 'The star at the center of our solar system');
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, true, 'Red supergiant in Orion');
INSERT INTO public.star VALUES (3, 'Sirius', 1, false, 'Brightest star in Earth’s night sky');
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 2, false, 'Closest star system to the Sun');
INSERT INTO public.star VALUES (5, 'Vega', 3, false, 'Bright star in the Lyra constellation');
INSERT INTO public.star VALUES (6, 'Polaris', 4, false, 'North Star');


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 'Milky Way', 'Our home galaxy, part of the Local Group', 1);
INSERT INTO public.universe VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', 2);
INSERT INTO public.universe VALUES (3, 'Triangulum', 'Third-largest galaxy in the Local Group', 3);
INSERT INTO public.universe VALUES (4, 'Messier 87', 'Giant elliptical galaxy with a supermassive black hole', 4);
INSERT INTO public.universe VALUES (5, 'Whirlpool', 'Interacting grand-design spiral galaxy', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: universe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_id_seq', 5, true);


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
-- Name: universe universe_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

