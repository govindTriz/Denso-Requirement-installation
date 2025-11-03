--
-- PostgreSQL database dump
--

\restrict 5O6SlkFpJZa19Oo1ROxS6h8saS4IbUxTTjXaAajXS7stLlfW1NL7hmto5EBsXSp

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
-- Name: AssignedSchedulerAsset; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."AssignedSchedulerAsset" (
    id text NOT NULL,
    "schedulerId" text NOT NULL,
    assets jsonb NOT NULL,
    "deploymentId" text NOT NULL,
    "zoneId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."AssignedSchedulerAsset" OWNER TO admin;

--
-- Name: CustomDashboard; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."CustomDashboard" (
    id text NOT NULL,
    "dashboardId" text NOT NULL,
    name text NOT NULL,
    description text,
    widgets jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."CustomDashboard" OWNER TO admin;

--
-- Name: Dashboard; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Dashboard" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    asset jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."Dashboard" OWNER TO admin;

--
-- Name: Mission; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Mission" (
    id text NOT NULL,
    name text NOT NULL,
    "missionId" text NOT NULL,
    "deploymentId" text NOT NULL,
    "deploymentData" jsonb,
    "zoneId" text NOT NULL,
    "zoneData" jsonb,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."Mission" OWNER TO admin;

--
-- Name: Scheduler; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Scheduler" (
    id text NOT NULL,
    "schedulerName" text NOT NULL,
    "schedulerId" text NOT NULL,
    "deploymentId" text NOT NULL,
    "zoneId" text NOT NULL,
    "missionIds" text[],
    "schedulerOption" jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."Scheduler" OWNER TO admin;

--
-- Name: User; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."User" (
    id text NOT NULL,
    email text NOT NULL,
    name text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."User" OWNER TO admin;

--
-- Name: Waypoint; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public."Waypoint" (
    id text NOT NULL,
    "pointId" text NOT NULL,
    label text NOT NULL,
    "order" integer,
    "missionId" text NOT NULL,
    tasks jsonb NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    "customerId" text NOT NULL
);


ALTER TABLE public."Waypoint" OWNER TO admin;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO admin;

--
-- Name: AssignedSchedulerAsset AssignedSchedulerAsset_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."AssignedSchedulerAsset"
    ADD CONSTRAINT "AssignedSchedulerAsset_pkey" PRIMARY KEY (id);


--
-- Name: CustomDashboard CustomDashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CustomDashboard"
    ADD CONSTRAINT "CustomDashboard_pkey" PRIMARY KEY (id);


--
-- Name: Dashboard Dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Dashboard"
    ADD CONSTRAINT "Dashboard_pkey" PRIMARY KEY (id);


--
-- Name: Mission Mission_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Mission"
    ADD CONSTRAINT "Mission_pkey" PRIMARY KEY (id);


--
-- Name: Scheduler Scheduler_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Scheduler"
    ADD CONSTRAINT "Scheduler_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: Waypoint Waypoint_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Waypoint"
    ADD CONSTRAINT "Waypoint_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: AssignedSchedulerAsset_schedulerId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "AssignedSchedulerAsset_schedulerId_key" ON public."AssignedSchedulerAsset" USING btree ("schedulerId");


--
-- Name: CustomDashboard_dashboardId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "CustomDashboard_dashboardId_key" ON public."CustomDashboard" USING btree ("dashboardId");


--
-- Name: Mission_deploymentId_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "Mission_deploymentId_idx" ON public."Mission" USING btree ("deploymentId");


--
-- Name: Mission_deploymentId_name_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Mission_deploymentId_name_key" ON public."Mission" USING btree ("deploymentId", name);


--
-- Name: Mission_missionId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Mission_missionId_key" ON public."Mission" USING btree ("missionId");


--
-- Name: Mission_zoneId_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "Mission_zoneId_idx" ON public."Mission" USING btree ("zoneId");


--
-- Name: Scheduler_deploymentId_schedulerName_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Scheduler_deploymentId_schedulerName_key" ON public."Scheduler" USING btree ("deploymentId", "schedulerName");


--
-- Name: Scheduler_schedulerId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Scheduler_schedulerId_key" ON public."Scheduler" USING btree ("schedulerId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: Waypoint_missionId_idx; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX "Waypoint_missionId_idx" ON public."Waypoint" USING btree ("missionId");


--
-- Name: Waypoint_missionId_pointId_key; Type: INDEX; Schema: public; Owner: admin
--

CREATE UNIQUE INDEX "Waypoint_missionId_pointId_key" ON public."Waypoint" USING btree ("missionId", "pointId");


--
-- Name: AssignedSchedulerAsset AssignedSchedulerAsset_schedulerId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."AssignedSchedulerAsset"
    ADD CONSTRAINT "AssignedSchedulerAsset_schedulerId_fkey" FOREIGN KEY ("schedulerId") REFERENCES public."Scheduler"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: CustomDashboard CustomDashboard_dashboardId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."CustomDashboard"
    ADD CONSTRAINT "CustomDashboard_dashboardId_fkey" FOREIGN KEY ("dashboardId") REFERENCES public."Dashboard"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Waypoint Waypoint_missionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public."Waypoint"
    ADD CONSTRAINT "Waypoint_missionId_fkey" FOREIGN KEY ("missionId") REFERENCES public."Mission"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 5O6SlkFpJZa19Oo1ROxS6h8saS4IbUxTTjXaAajXS7stLlfW1NL7hmto5EBsXSp

