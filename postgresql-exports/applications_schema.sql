--
-- PostgreSQL database dump
--

\restrict 3KlZGHJDBy0flErqJZRrUh3qwbSedyBB6hTsrSZFcCaa5SiehFtffCnA1G5r8M0

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO admin;

--
-- Name: applications; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.applications (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    application_version_id character varying NOT NULL,
    name character varying NOT NULL,
    description character varying,
    customer_id uuid NOT NULL,
    metadata json,
    is_deleted boolean NOT NULL,
    image character varying
);


ALTER TABLE public.applications OWNER TO admin;

--
-- Name: versions; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.versions (
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    id uuid NOT NULL,
    application_version_id character varying NOT NULL,
    version character varying NOT NULL,
    changelog character varying,
    is_active boolean,
    deprecated boolean,
    release_date timestamp without time zone,
    dependencies json,
    application_id uuid NOT NULL
);


ALTER TABLE public.versions OWNER TO admin;

--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: applications applications_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);


--
-- Name: versions versions_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


--
-- Name: ix_applications_application_version_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX ix_applications_application_version_id ON public.applications USING btree (application_version_id);


--
-- Name: ix_applications_customer_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_applications_customer_id ON public.applications USING btree (customer_id);


--
-- Name: ix_applications_name; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_applications_name ON public.applications USING btree (name);


--
-- Name: ix_versions_application_version_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX ix_versions_application_version_id ON public.versions USING btree (application_version_id);


--
-- Name: versions versions_application_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.versions
    ADD CONSTRAINT versions_application_id_fkey FOREIGN KEY (application_id) REFERENCES public.applications(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 3KlZGHJDBy0flErqJZRrUh3qwbSedyBB6hTsrSZFcCaa5SiehFtffCnA1G5r8M0

