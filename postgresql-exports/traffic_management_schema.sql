--
-- PostgreSQL database dump
--

\restrict 71nJnlyvM9OP2F9JTONzsciPHhRRnSfM4kCAfxyqmzjAisaaY5TMDdmRxJq1qsY

-- Dumped from database version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.19 (Ubuntu 14.19-0ubuntu0.22.04.1)

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
-- Name: paths_status_enum; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public.paths_status_enum AS ENUM (
    'active',
    'inactive',
    'maintenance'
);


ALTER TYPE public.paths_status_enum OWNER TO admin;

--
-- Name: paths_type_enum; Type: TYPE; Schema: public; Owner: admin
--

CREATE TYPE public.paths_type_enum AS ENUM (
    'navigation',
    'charging',
    'service',
    'custom'
);


ALTER TYPE public.paths_type_enum OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO admin;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: paths; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.paths (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    "deviceId" uuid NOT NULL,
    waypoints jsonb NOT NULL,
    type public.paths_type_enum DEFAULT 'navigation'::public.paths_type_enum NOT NULL,
    status public.paths_status_enum DEFAULT 'active'::public.paths_status_enum NOT NULL,
    metadata jsonb,
    distance double precision DEFAULT '0'::double precision NOT NULL,
    "estimatedDuration" double precision DEFAULT '0'::double precision NOT NULL,
    "createdAt" timestamp with time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.paths OWNER TO admin;

--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: paths PK_3023c8d7a50ae9c50117a94e502; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.paths
    ADD CONSTRAINT "PK_3023c8d7a50ae9c50117a94e502" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

\unrestrict 71nJnlyvM9OP2F9JTONzsciPHhRRnSfM4kCAfxyqmzjAisaaY5TMDdmRxJq1qsY

