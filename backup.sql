--
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 10.23

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: annotation_tag_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.annotation_tag_entity (
    id character varying(16) NOT NULL,
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.annotation_tag_entity OWNER TO "userRQ2";

--
-- Name: api_usage; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.api_usage (
    id integer NOT NULL,
    user_id integer,
    service character varying(100),
    request_count integer DEFAULT 0,
    month character varying(20)
);


ALTER TABLE public.api_usage OWNER TO "userRQ2";

--
-- Name: api_usage_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.api_usage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_usage_id_seq OWNER TO "userRQ2";

--
-- Name: api_usage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.api_usage_id_seq OWNED BY public.api_usage.id;


--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.audit_logs (
    id integer NOT NULL,
    user_id integer,
    action character varying(255),
    resource_type character varying(100),
    resource_id integer,
    ip_address character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.audit_logs OWNER TO "userRQ2";

--
-- Name: audit_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.audit_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.audit_logs_id_seq OWNER TO "userRQ2";

--
-- Name: audit_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.audit_logs_id_seq OWNED BY public.audit_logs.id;


--
-- Name: auth_identity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.auth_identity (
    "userId" uuid,
    "providerId" character varying(64) NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.auth_identity OWNER TO "userRQ2";

--
-- Name: auth_provider_sync_history; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.auth_provider_sync_history (
    id integer NOT NULL,
    "providerType" character varying(32) NOT NULL,
    "runMode" text NOT NULL,
    status text NOT NULL,
    "startedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "endedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    scanned integer NOT NULL,
    created integer NOT NULL,
    updated integer NOT NULL,
    disabled integer NOT NULL,
    error text
);


ALTER TABLE public.auth_provider_sync_history OWNER TO "userRQ2";

--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.auth_provider_sync_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_provider_sync_history_id_seq OWNER TO "userRQ2";

--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.auth_provider_sync_history_id_seq OWNED BY public.auth_provider_sync_history.id;


--
-- Name: billing_history; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.billing_history (
    id integer NOT NULL,
    user_id integer,
    amount numeric(10,2),
    currency character varying(10) DEFAULT 'USD'::character varying,
    payment_provider character varying(50),
    transaction_id character varying(255),
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.billing_history OWNER TO "userRQ2";

--
-- Name: billing_history_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.billing_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_history_id_seq OWNER TO "userRQ2";

--
-- Name: billing_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.billing_history_id_seq OWNED BY public.billing_history.id;


--
-- Name: credentials_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.credentials_entity (
    name character varying(128) NOT NULL,
    data text NOT NULL,
    type character varying(128) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL,
    "isManaged" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.credentials_entity OWNER TO "userRQ2";

--
-- Name: credit_transactions; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.credit_transactions (
    id integer NOT NULL,
    user_id integer,
    credits integer NOT NULL,
    transaction_type character varying(50),
    description text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.credit_transactions OWNER TO "userRQ2";

--
-- Name: credit_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.credit_transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.credit_transactions_id_seq OWNER TO "userRQ2";

--
-- Name: credit_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.credit_transactions_id_seq OWNED BY public.credit_transactions.id;


--
-- Name: deploy_jobs; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.deploy_jobs (
    id integer NOT NULL,
    user_id integer,
    template_name character varying(255),
    session_hours integer,
    deployment_url text,
    remote_username character varying(255),
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.deploy_jobs OWNER TO "userRQ2";

--
-- Name: deploy_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.deploy_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deploy_jobs_id_seq OWNER TO "userRQ2";

--
-- Name: deploy_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.deploy_jobs_id_seq OWNED BY public.deploy_jobs.id;


--
-- Name: email_verifications; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.email_verifications (
    id integer NOT NULL,
    user_id integer,
    verification_token text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    verified boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.email_verifications OWNER TO "userRQ2";

--
-- Name: email_verifications_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.email_verifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.email_verifications_id_seq OWNER TO "userRQ2";

--
-- Name: email_verifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.email_verifications_id_seq OWNED BY public.email_verifications.id;


--
-- Name: event_destinations; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.event_destinations (
    id uuid NOT NULL,
    destination jsonb NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.event_destinations OWNER TO "userRQ2";

--
-- Name: execution_annotation_tags; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.execution_annotation_tags (
    "annotationId" integer NOT NULL,
    "tagId" character varying(24) NOT NULL
);


ALTER TABLE public.execution_annotation_tags OWNER TO "userRQ2";

--
-- Name: execution_annotations; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.execution_annotations (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    vote character varying(6),
    note text,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.execution_annotations OWNER TO "userRQ2";

--
-- Name: execution_annotations_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.execution_annotations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.execution_annotations_id_seq OWNER TO "userRQ2";

--
-- Name: execution_annotations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.execution_annotations_id_seq OWNED BY public.execution_annotations.id;


--
-- Name: execution_data; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.execution_data (
    "executionId" integer NOT NULL,
    "workflowData" json NOT NULL,
    data text NOT NULL
);


ALTER TABLE public.execution_data OWNER TO "userRQ2";

--
-- Name: execution_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.execution_entity (
    id integer NOT NULL,
    finished boolean NOT NULL,
    mode character varying NOT NULL,
    "retryOf" character varying,
    "retrySuccessId" character varying,
    "startedAt" timestamp(3) with time zone,
    "stoppedAt" timestamp(3) with time zone,
    "waitTill" timestamp(3) with time zone,
    status character varying NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "deletedAt" timestamp(3) with time zone,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.execution_entity OWNER TO "userRQ2";

--
-- Name: execution_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.execution_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.execution_entity_id_seq OWNER TO "userRQ2";

--
-- Name: execution_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.execution_entity_id_seq OWNED BY public.execution_entity.id;


--
-- Name: execution_metadata; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.execution_metadata (
    id integer NOT NULL,
    "executionId" integer NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.execution_metadata OWNER TO "userRQ2";

--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.execution_metadata_temp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.execution_metadata_temp_id_seq OWNER TO "userRQ2";

--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.execution_metadata_temp_id_seq OWNED BY public.execution_metadata.id;


--
-- Name: folder; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.folder (
    id character varying(36) NOT NULL,
    name character varying(128) NOT NULL,
    "parentFolderId" character varying(36),
    "projectId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.folder OWNER TO "userRQ2";

--
-- Name: folder_tag; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.folder_tag (
    "folderId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE public.folder_tag OWNER TO "userRQ2";

--
-- Name: installed_nodes; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.installed_nodes (
    name character varying(200) NOT NULL,
    type character varying(200) NOT NULL,
    "latestVersion" integer DEFAULT 1 NOT NULL,
    package character varying(241) NOT NULL
);


ALTER TABLE public.installed_nodes OWNER TO "userRQ2";

--
-- Name: installed_packages; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.installed_packages (
    "packageName" character varying(214) NOT NULL,
    "installedVersion" character varying(50) NOT NULL,
    "authorName" character varying(70),
    "authorEmail" character varying(70),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.installed_packages OWNER TO "userRQ2";

--
-- Name: invalid_auth_token; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.invalid_auth_token (
    token character varying(512) NOT NULL,
    "expiresAt" timestamp(3) with time zone NOT NULL
);


ALTER TABLE public.invalid_auth_token OWNER TO "userRQ2";

--
-- Name: migrations; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.migrations OWNER TO "userRQ2";

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO "userRQ2";

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: notifications; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.notifications (
    id integer NOT NULL,
    user_id integer,
    title character varying(255),
    message text,
    is_read boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notifications OWNER TO "userRQ2";

--
-- Name: notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notifications_id_seq OWNER TO "userRQ2";

--
-- Name: notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.notifications_id_seq OWNED BY public.notifications.id;


--
-- Name: onboarding_answers; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.onboarding_answers (
    id integer NOT NULL,
    user_id integer,
    role character varying(100),
    selected_features text,
    referral_source character varying(100),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.onboarding_answers OWNER TO "userRQ2";

--
-- Name: onboarding_answers_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.onboarding_answers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.onboarding_answers_id_seq OWNER TO "userRQ2";

--
-- Name: onboarding_answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.onboarding_answers_id_seq OWNED BY public.onboarding_answers.id;


--
-- Name: password_resets; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.password_resets (
    id integer NOT NULL,
    user_id integer,
    reset_token text NOT NULL,
    expires_at timestamp without time zone NOT NULL,
    used boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.password_resets OWNER TO "userRQ2";

--
-- Name: password_resets_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.password_resets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.password_resets_id_seq OWNER TO "userRQ2";

--
-- Name: password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.password_resets_id_seq OWNED BY public.password_resets.id;


--
-- Name: processed_data; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.processed_data (
    "workflowId" character varying(36) NOT NULL,
    context character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.processed_data OWNER TO "userRQ2";

--
-- Name: project; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.project (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    icon json
);


ALTER TABLE public.project OWNER TO "userRQ2";

--
-- Name: project_relation; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.project_relation (
    "projectId" character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    role character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.project_relation OWNER TO "userRQ2";

--
-- Name: projects; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    type character varying(50),
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.projects OWNER TO "userRQ2";

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.projects_id_seq OWNER TO "userRQ2";

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.role (
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    scope character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.role OWNER TO "userRQ2";

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO "userRQ2";

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: seo_jobs; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.seo_jobs (
    id integer NOT NULL,
    user_id integer,
    keyword text,
    generated_content text,
    tokens_used integer DEFAULT 0,
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.seo_jobs OWNER TO "userRQ2";

--
-- Name: seo_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.seo_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seo_jobs_id_seq OWNER TO "userRQ2";

--
-- Name: seo_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.seo_jobs_id_seq OWNED BY public.seo_jobs.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.settings (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    "loadOnStartup" boolean DEFAULT false NOT NULL
);


ALTER TABLE public.settings OWNER TO "userRQ2";

--
-- Name: shared_credentials; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.shared_credentials (
    "credentialsId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.shared_credentials OWNER TO "userRQ2";

--
-- Name: shared_workflow; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.shared_workflow (
    "workflowId" character varying(36) NOT NULL,
    "projectId" character varying(36) NOT NULL,
    role text NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.shared_workflow OWNER TO "userRQ2";

--
-- Name: stream_jobs; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.stream_jobs (
    id integer NOT NULL,
    user_id integer,
    stream_name character varying(255),
    rtmp_url text,
    status character varying(50),
    started_at timestamp without time zone,
    ended_at timestamp without time zone
);


ALTER TABLE public.stream_jobs OWNER TO "userRQ2";

--
-- Name: stream_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.stream_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stream_jobs_id_seq OWNER TO "userRQ2";

--
-- Name: stream_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.stream_jobs_id_seq OWNED BY public.stream_jobs.id;


--
-- Name: tag_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.tag_entity (
    name character varying(24) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    id character varying(36) NOT NULL
);


ALTER TABLE public.tag_entity OWNER TO "userRQ2";

--
-- Name: test_case_execution; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.test_case_execution (
    id character varying(36) NOT NULL,
    "testRunId" character varying(36) NOT NULL,
    "pastExecutionId" integer,
    "executionId" integer,
    "evaluationExecutionId" integer,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    "errorCode" character varying,
    "errorDetails" json,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.test_case_execution OWNER TO "userRQ2";

--
-- Name: test_definition; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.test_definition (
    name character varying(255) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    "evaluationWorkflowId" character varying(36),
    "annotationTagId" character varying(16),
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    description text,
    id character varying(36) NOT NULL,
    "mockedNodes" json DEFAULT '[]'::json NOT NULL
);


ALTER TABLE public.test_definition OWNER TO "userRQ2";

--
-- Name: test_metric; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.test_metric (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    "testDefinitionId" character varying(36) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.test_metric OWNER TO "userRQ2";

--
-- Name: test_run; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.test_run (
    id character varying(36) NOT NULL,
    "testDefinitionId" character varying(36) NOT NULL,
    status character varying NOT NULL,
    "runAt" timestamp(3) with time zone,
    "completedAt" timestamp(3) with time zone,
    metrics json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "totalCases" integer,
    "passedCases" integer,
    "failedCases" integer,
    "errorCode" character varying(255),
    "errorDetails" text,
    CONSTRAINT test_run_check CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("totalCases" IS NULL)
    WHEN ((status)::text = ANY ((ARRAY['cancelled'::character varying, 'error'::character varying])::text[])) THEN (("totalCases" IS NULL) OR ("totalCases" >= 0))
    ELSE ("totalCases" >= 0)
END),
    CONSTRAINT test_run_check1 CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("passedCases" IS NULL)
    WHEN ((status)::text = ANY ((ARRAY['cancelled'::character varying, 'error'::character varying])::text[])) THEN (("passedCases" IS NULL) OR ("passedCases" >= 0))
    ELSE ("passedCases" >= 0)
END),
    CONSTRAINT test_run_check2 CHECK (
CASE
    WHEN ((status)::text = 'new'::text) THEN ("failedCases" IS NULL)
    WHEN ((status)::text = ANY ((ARRAY['cancelled'::character varying, 'error'::character varying])::text[])) THEN (("failedCases" IS NULL) OR ("failedCases" >= 0))
    ELSE ("failedCases" >= 0)
END)
);


ALTER TABLE public.test_run OWNER TO "userRQ2";

--
-- Name: thumbnail_jobs; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.thumbnail_jobs (
    id integer NOT NULL,
    user_id integer,
    youtube_url text,
    thumbnail_url text,
    generated_image_url text,
    prompt_used text,
    status character varying(50),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.thumbnail_jobs OWNER TO "userRQ2";

--
-- Name: thumbnail_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.thumbnail_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.thumbnail_jobs_id_seq OWNER TO "userRQ2";

--
-- Name: thumbnail_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.thumbnail_jobs_id_seq OWNED BY public.thumbnail_jobs.id;


--
-- Name: user; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public."user" (
    id uuid DEFAULT uuid_in(("overlay"("overlay"(md5((((random())::text || ':'::text) || (clock_timestamp())::text)), '4'::text, 13), to_hex((floor(((random() * (((11 - 8) + 1))::double precision) + (8)::double precision)))::integer), 17))::cstring) NOT NULL,
    email character varying(255),
    "firstName" character varying(32),
    "lastName" character varying(32),
    password character varying(255),
    "personalizationAnswers" json,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    disabled boolean DEFAULT false NOT NULL,
    "mfaEnabled" boolean DEFAULT false NOT NULL,
    "mfaSecret" text,
    "mfaRecoveryCodes" text,
    role text NOT NULL
);


ALTER TABLE public."user" OWNER TO "userRQ2";

--
-- Name: user_api_keys; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.user_api_keys (
    id character varying(36) NOT NULL,
    "userId" uuid NOT NULL,
    label character varying(100) NOT NULL,
    "apiKey" character varying NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL
);


ALTER TABLE public.user_api_keys OWNER TO "userRQ2";

--
-- Name: user_files; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.user_files (
    id integer NOT NULL,
    user_id integer,
    file_name text NOT NULL,
    original_name text,
    file_type character varying(50),
    storage_provider character varying(50) DEFAULT 'cloudflare_r2'::character varying,
    file_url text,
    file_key text,
    size_bytes bigint,
    status character varying(50) DEFAULT 'active'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_files OWNER TO "userRQ2";

--
-- Name: user_files_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.user_files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_files_id_seq OWNER TO "userRQ2";

--
-- Name: user_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.user_files_id_seq OWNED BY public.user_files.id;


--
-- Name: user_sessions; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.user_sessions (
    id integer NOT NULL,
    user_id integer,
    token_hash text NOT NULL,
    ip_address character varying(100),
    user_agent text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    expires_at timestamp without time zone,
    is_active boolean DEFAULT true
);


ALTER TABLE public.user_sessions OWNER TO "userRQ2";

--
-- Name: user_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.user_sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_sessions_id_seq OWNER TO "userRQ2";

--
-- Name: user_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.user_sessions_id_seq OWNED BY public.user_sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255) NOT NULL,
    username character varying(100) NOT NULL,
    password_hash text NOT NULL,
    plan character varying(50) DEFAULT 'free'::character varying,
    credits integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    last_login timestamp without time zone,
    role character varying(20) DEFAULT 'user'::character varying
);


ALTER TABLE public.users OWNER TO "userRQ2";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: userRQ2
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO "userRQ2";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: userRQ2
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: variables; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.variables (
    key character varying(50) NOT NULL,
    type character varying(50) DEFAULT 'string'::character varying NOT NULL,
    value character varying(255),
    id character varying(36) NOT NULL
);


ALTER TABLE public.variables OWNER TO "userRQ2";

--
-- Name: webhook_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.webhook_entity (
    "webhookPath" character varying NOT NULL,
    method character varying NOT NULL,
    node character varying NOT NULL,
    "webhookId" character varying,
    "pathLength" integer,
    "workflowId" character varying(36) NOT NULL
);


ALTER TABLE public.webhook_entity OWNER TO "userRQ2";

--
-- Name: workflow_entity; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.workflow_entity (
    name character varying(128) NOT NULL,
    active boolean NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    settings json,
    "staticData" json,
    "pinData" json,
    "versionId" character(36),
    "triggerCount" integer DEFAULT 0 NOT NULL,
    id character varying(36) NOT NULL,
    meta json,
    "parentFolderId" character varying(36) DEFAULT NULL::character varying
);


ALTER TABLE public.workflow_entity OWNER TO "userRQ2";

--
-- Name: workflow_history; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.workflow_history (
    "versionId" character varying(36) NOT NULL,
    "workflowId" character varying(36) NOT NULL,
    authors character varying(255) NOT NULL,
    "createdAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    "updatedAt" timestamp(3) with time zone DEFAULT CURRENT_TIMESTAMP(3) NOT NULL,
    nodes json NOT NULL,
    connections json NOT NULL
);


ALTER TABLE public.workflow_history OWNER TO "userRQ2";

--
-- Name: workflow_statistics; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.workflow_statistics (
    count integer DEFAULT 0,
    "latestEvent" timestamp(3) with time zone,
    name character varying(128) NOT NULL,
    "workflowId" character varying(36) NOT NULL
);


ALTER TABLE public.workflow_statistics OWNER TO "userRQ2";

--
-- Name: workflows_tags; Type: TABLE; Schema: public; Owner: userRQ2
--

CREATE TABLE public.workflows_tags (
    "workflowId" character varying(36) NOT NULL,
    "tagId" character varying(36) NOT NULL
);


ALTER TABLE public.workflows_tags OWNER TO "userRQ2";

--
-- Name: api_usage id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.api_usage ALTER COLUMN id SET DEFAULT nextval('public.api_usage_id_seq'::regclass);


--
-- Name: audit_logs id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.audit_logs ALTER COLUMN id SET DEFAULT nextval('public.audit_logs_id_seq'::regclass);


--
-- Name: auth_provider_sync_history id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.auth_provider_sync_history ALTER COLUMN id SET DEFAULT nextval('public.auth_provider_sync_history_id_seq'::regclass);


--
-- Name: billing_history id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.billing_history ALTER COLUMN id SET DEFAULT nextval('public.billing_history_id_seq'::regclass);


--
-- Name: credit_transactions id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.credit_transactions ALTER COLUMN id SET DEFAULT nextval('public.credit_transactions_id_seq'::regclass);


--
-- Name: deploy_jobs id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.deploy_jobs ALTER COLUMN id SET DEFAULT nextval('public.deploy_jobs_id_seq'::regclass);


--
-- Name: email_verifications id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.email_verifications ALTER COLUMN id SET DEFAULT nextval('public.email_verifications_id_seq'::regclass);


--
-- Name: execution_annotations id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotations ALTER COLUMN id SET DEFAULT nextval('public.execution_annotations_id_seq'::regclass);


--
-- Name: execution_entity id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_entity ALTER COLUMN id SET DEFAULT nextval('public.execution_entity_id_seq'::regclass);


--
-- Name: execution_metadata id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_metadata ALTER COLUMN id SET DEFAULT nextval('public.execution_metadata_temp_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: notifications id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.notifications ALTER COLUMN id SET DEFAULT nextval('public.notifications_id_seq'::regclass);


--
-- Name: onboarding_answers id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.onboarding_answers ALTER COLUMN id SET DEFAULT nextval('public.onboarding_answers_id_seq'::regclass);


--
-- Name: password_resets id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.password_resets ALTER COLUMN id SET DEFAULT nextval('public.password_resets_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: seo_jobs id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.seo_jobs ALTER COLUMN id SET DEFAULT nextval('public.seo_jobs_id_seq'::regclass);


--
-- Name: stream_jobs id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.stream_jobs ALTER COLUMN id SET DEFAULT nextval('public.stream_jobs_id_seq'::regclass);


--
-- Name: thumbnail_jobs id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.thumbnail_jobs ALTER COLUMN id SET DEFAULT nextval('public.thumbnail_jobs_id_seq'::regclass);


--
-- Name: user_files id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_files ALTER COLUMN id SET DEFAULT nextval('public.user_files_id_seq'::regclass);


--
-- Name: user_sessions id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_sessions ALTER COLUMN id SET DEFAULT nextval('public.user_sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: annotation_tag_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.annotation_tag_entity (id, name, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: api_usage; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.api_usage (id, user_id, service, request_count, month) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.audit_logs (id, user_id, action, resource_type, resource_id, ip_address, created_at) FROM stdin;
\.


--
-- Data for Name: auth_identity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.auth_identity ("userId", "providerId", "providerType", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: auth_provider_sync_history; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.auth_provider_sync_history (id, "providerType", "runMode", status, "startedAt", "endedAt", scanned, created, updated, disabled, error) FROM stdin;
\.


--
-- Data for Name: billing_history; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.billing_history (id, user_id, amount, currency, payment_provider, transaction_id, status, created_at) FROM stdin;
\.


--
-- Data for Name: credentials_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.credentials_entity (name, data, type, "createdAt", "updatedAt", id, "isManaged") FROM stdin;
\.


--
-- Data for Name: credit_transactions; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.credit_transactions (id, user_id, credits, transaction_type, description, created_at) FROM stdin;
\.


--
-- Data for Name: deploy_jobs; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.deploy_jobs (id, user_id, template_name, session_hours, deployment_url, remote_username, status, created_at) FROM stdin;
\.


--
-- Data for Name: email_verifications; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.email_verifications (id, user_id, verification_token, expires_at, verified, created_at) FROM stdin;
\.


--
-- Data for Name: event_destinations; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.event_destinations (id, destination, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_annotation_tags; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.execution_annotation_tags ("annotationId", "tagId") FROM stdin;
\.


--
-- Data for Name: execution_annotations; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.execution_annotations (id, "executionId", vote, note, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: execution_data; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.execution_data ("executionId", "workflowData", data) FROM stdin;
1	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"}],"connections":{},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12"},{},"When clicking ‘Test workflow’",{},[],{},{},{},["13"],{"hints":"14","startTime":1781252244196,"executionTime":2,"source":"15","executionStatus":"16","data":"17"},[],[],"success",{"main":"18"},["19"],["20"],{"json":"21","pairedItem":"22"},{},{"item":0}]
2	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"manual","duplicateItem":false,"assignments":{"assignments":[{"id":"94ea0daa-823a-48a3-bfa1-ab4633da234e","name":"message","value":"hello","type":"string"}]},"includeOtherFields":false,"options":{}},"type":"n8n-nodes-base.set","typeVersion":3.4,"position":[180,-20],"id":"b17cee44-cb1d-4fb8-b949-8b8e6b3350be","name":"Edit Fields"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Edit Fields","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7","lastNodeExecuted":"4"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"Edit Fields",["13","4"],{"When clicking ‘Test workflow’":"14","Edit Fields":"15"},{},{},[],{},{"Edit Fields":"16"},{"Edit Fields":"17"},"When clicking ‘Test workflow’",["18"],["19"],{"0":"20"},{"0":"21"},{"hints":"22","startTime":1781252244196,"executionTime":2,"source":"23","executionStatus":"24","data":"25"},{"hints":"26","startTime":1781252671354,"executionTime":4,"source":"27","executionStatus":"24","data":"28"},{"main":"29"},{"main":"30"},[],[],"success",{"main":"31"},[],["32"],{"main":"33"},["34"],["35"],["34"],{"previousNode":"13","previousNodeOutput":0},["36"],["37"],{"previousNode":"13"},["38"],{"json":"39","pairedItem":"40"},{"json":"41","pairedItem":"42"},{},{"item":0},{"message":"43"},{"item":0},"hello"]
3	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"manual","duplicateItem":false,"assignments":{"assignments":[{"id":"94ea0daa-823a-48a3-bfa1-ab4633da234e","name":"message","value":"hello","type":"string"}]},"includeOtherFields":false,"options":{}},"type":"n8n-nodes-base.set","typeVersion":3.4,"position":[180,-20],"id":"b17cee44-cb1d-4fb8-b949-8b8e6b3350be","name":"Edit Fields"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Edit Fields","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7","lastNodeExecuted":"4"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"Edit Fields",["13","4"],{"When clicking ‘Test workflow’":"14","Edit Fields":"15"},{},{},[],{},{"Edit Fields":"16"},{"Edit Fields":"17"},"When clicking ‘Test workflow’",["18"],["19"],{"0":"20"},{"0":"21"},{"hints":"22","startTime":1781252244196,"executionTime":2,"source":"23","executionStatus":"24","data":"25"},{"hints":"26","startTime":1781252723564,"executionTime":1,"source":"27","executionStatus":"24","data":"28"},{"main":"29"},{"main":"30"},[],[],"success",{"main":"31"},[],["32"],{"main":"33"},["34"],["35"],["34"],{"previousNode":"13","previousNodeOutput":0},["36"],["37"],{"previousNode":"13"},["38"],{"json":"39","pairedItem":"40"},{"json":"41","pairedItem":"42"},{},{"item":0},{"message":"43"},{"item":0},"hello"]
4	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"manual","duplicateItem":false,"assignments":{"assignments":[{"id":"94ea0daa-823a-48a3-bfa1-ab4633da234e","name":"message","value":"hello","type":"string"}]},"includeOtherFields":false,"options":{}},"type":"n8n-nodes-base.set","typeVersion":3.4,"position":[180,-20],"id":"b17cee44-cb1d-4fb8-b949-8b8e6b3350be","name":"Edit Fields"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Edit Fields","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7","lastNodeExecuted":"4"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"When clicking ‘Test workflow’",["4"],{"When clicking ‘Test workflow’":"13"},{},{},[],{},{},{},["14"],{"hints":"15","startTime":1781252748679,"executionTime":0,"source":"16","executionStatus":"17","data":"18"},[],[],"success",{"main":"19"},["20"],["21"],{"json":"22","pairedItem":"23"},{},{"item":0}]
5	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"manual","duplicateItem":false,"assignments":{"assignments":[{"id":"94ea0daa-823a-48a3-bfa1-ab4633da234e","name":"message","value":"hello","type":"string"}]},"includeOtherFields":false,"options":{}},"type":"n8n-nodes-base.set","typeVersion":3.4,"position":[180,-20],"id":"b17cee44-cb1d-4fb8-b949-8b8e6b3350be","name":"Edit Fields"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Edit Fields","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12","Edit Fields":"13"},{},"Edit Fields",{},[],{},{},{},["14"],["15"],{"hints":"16","startTime":1781252761367,"executionTime":0,"source":"17","executionStatus":"18","data":"19"},{"hints":"20","startTime":1781252761368,"executionTime":1,"source":"21","executionStatus":"18","data":"22"},[],[],"success",{"main":"23"},[],["24"],{"main":"25"},["26"],{"previousNode":"27"},["28"],["29"],"When clicking ‘Test workflow’",["30"],{"json":"31","pairedItem":"32"},{"json":"33","pairedItem":"34"},{},{"item":0},{"message":"35"},{"item":0},"hello"]
6	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"runOnceForAllItems","language":"javaScript","jsCode":"return [\\n  {\\n    json: {\\n      text: $json.message,\\n      status: \\"working\\"\\n    }\\n  }\\n];","notice":""},"type":"n8n-nodes-base.code","typeVersion":2,"position":[360,-40],"id":"443c41ab-776d-477b-9f0c-980b6a5484e0","name":"Code"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Code","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{"destinationNode":"4","runNodeFilter":"5"},{"runData":"6","pinData":"7","lastNodeExecuted":"4"},{"contextData":"8","nodeExecutionStack":"9","metadata":"10","waitingExecution":"11","waitingExecutionSource":"12"},"Code",["13","4"],{"When clicking ‘Test workflow’":"14","Code":"15"},{},{},[],{},{"Code":"16"},{"Code":"17"},"When clicking ‘Test workflow’",["18"],["19"],{"0":"20"},{"0":"21"},{"hints":"22","startTime":1781252761367,"executionTime":0,"source":"23","executionStatus":"24","data":"25"},{"hints":"26","startTime":1781252900149,"executionTime":66,"source":"27","executionStatus":"24","data":"28"},{"main":"29"},{"main":"30"},[],[],"success",{"main":"31"},[],["32"],{"main":"33"},["34"],["35"],["34"],{"previousNode":"13","previousNodeOutput":0},["36"],["37"],{"previousNode":"13"},["38"],{"json":"39","pairedItem":"40"},{"json":"41","pairedItem":"42"},{},{"item":0},{"status":"43"},{"item":0},"working"]
7	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"runOnceForAllItems","language":"javaScript","jsCode":"return [\\n  {\\n    json: {\\n      text: $json.message,\\n      status: \\"working\\"\\n    }\\n  }\\n];","notice":""},"type":"n8n-nodes-base.code","typeVersion":2,"position":[360,-40],"id":"443c41ab-776d-477b-9f0c-980b6a5484e0","name":"Code"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Code","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12","Code":"13"},{},"Code",{},[],{},{},{},["14"],["15"],{"hints":"16","startTime":1781252956836,"executionTime":0,"source":"17","executionStatus":"18","data":"19"},{"hints":"20","startTime":1781252956837,"executionTime":5,"source":"21","executionStatus":"18","data":"22"},[],[],"success",{"main":"23"},[],["24"],{"main":"25"},["26"],{"previousNode":"27"},["28"],["29"],"When clicking ‘Test workflow’",["30"],{"json":"31","pairedItem":"32"},{"json":"33","pairedItem":"34"},{},{"item":0},{"status":"35"},{"item":0},"working"]
8	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"runOnceForAllItems","language":"javaScript","jsCode":"return [\\n  {\\n    json: {\\n      message: \\"Hello Flux\\",\\n      status: \\"working\\"\\n    }\\n  }\\n];","notice":""},"type":"n8n-nodes-base.code","typeVersion":2,"position":[360,-40],"id":"443c41ab-776d-477b-9f0c-980b6a5484e0","name":"Code"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Code","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12","Code":"13"},{},"Code",{},[],{},{},{},["14"],["15"],{"hints":"16","startTime":1781252983899,"executionTime":0,"source":"17","executionStatus":"18","data":"19"},{"hints":"20","startTime":1781252983900,"executionTime":5,"source":"21","executionStatus":"18","data":"22"},[],[],"success",{"main":"23"},[],["24"],{"main":"25"},["26"],{"previousNode":"27"},["28"],["29"],"When clicking ‘Test workflow’",["30"],{"json":"31","pairedItem":"32"},{"json":"33","pairedItem":"34"},{},{"item":0},{"message":"35","status":"36"},{"item":0},"Hello Flux","working"]
9	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"runOnceForAllItems","language":"javaScript","jsCode":"return [\\n  {\\n    json: {\\n      message: \\"Hello Flux\\",\\n      status: \\"working\\"\\n    }\\n  }\\n];","notice":""},"type":"n8n-nodes-base.code","typeVersion":2,"position":[220,0],"id":"50f51327-232c-4af8-b6c6-24ddc221c204","name":"Code"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Code","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12","Code":"13"},{},"Code",{},[],{},{},{},["14"],["15"],{"hints":"16","startTime":1781253005148,"executionTime":1,"source":"17","executionStatus":"18","data":"19"},{"hints":"20","startTime":1781253005149,"executionTime":6,"source":"21","executionStatus":"18","data":"22"},[],[],"success",{"main":"23"},[],["24"],{"main":"25"},["26"],{"previousNode":"27"},["28"],["29"],"When clicking ‘Test workflow’",["30"],{"json":"31","pairedItem":"32"},{"json":"33","pairedItem":"34"},{},{"item":0},{"message":"35","status":"36"},{"item":0},"Hello Flux","working"]
10	{"id":"ZwFTpGawZVmTGLr0","name":"My workflow","active":false,"nodes":[{"parameters":{"notice":""},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"},{"parameters":{"mode":"manual","duplicateItem":false,"assignments":{"assignments":[{"id":"4f1b40ee-4802-4e15-94df-0db1654c4d7e","name":"prompt","value":"Create a cyberpunk city image","type":"string"}]},"includeOtherFields":false,"options":{}},"type":"n8n-nodes-base.set","typeVersion":3.4,"position":[220,0],"id":"bcf4764b-0543-4d14-af7a-d847f8596bd7","name":"Edit Fields"},{"parameters":{"mode":"runOnceForAllItems","language":"javaScript","jsCode":"return [\\n  {\\n    json: {\\n      prompt: $json.prompt,\\n      received: true\\n    }\\n  }\\n];","notice":""},"type":"n8n-nodes-base.code","typeVersion":2,"position":[440,0],"id":"a1d4d710-9c70-4b5d-8e8f-ec7c4aadc750","name":"Code"}],"connections":{"When clicking ‘Test workflow’":{"main":[[{"node":"Edit Fields","type":"main","index":0}]]},"Edit Fields":{"main":[[{"node":"Code","type":"main","index":0}]]}},"settings":{"executionOrder":"v1"},"pinData":{}}	[{"startData":"1","resultData":"2","executionData":"3"},{},{"runData":"4","pinData":"5","lastNodeExecuted":"6"},{"contextData":"7","nodeExecutionStack":"8","metadata":"9","waitingExecution":"10","waitingExecutionSource":"11"},{"When clicking ‘Test workflow’":"12","Edit Fields":"13","Code":"14"},{},"Code",{},[],{},{},{},["15"],["16"],["17"],{"hints":"18","startTime":1781253147368,"executionTime":0,"source":"19","executionStatus":"20","data":"21"},{"hints":"22","startTime":1781253147368,"executionTime":1,"source":"23","executionStatus":"20","data":"24"},{"hints":"25","startTime":1781253147369,"executionTime":6,"source":"26","executionStatus":"20","data":"27"},[],[],"success",{"main":"28"},[],["29"],{"main":"30"},[],["31"],{"main":"32"},["33"],{"previousNode":"34"},["35"],{"previousNode":"36"},["37"],["38"],"When clicking ‘Test workflow’",["39"],"Edit Fields",["40"],{"json":"41","pairedItem":"42"},{"json":"43","pairedItem":"44"},{"json":"45","pairedItem":"46"},{},{"item":0},{"prompt":"47"},{"item":0},{"prompt":"47","received":true},{"item":0},"Create a cyberpunk city image"]
\.


--
-- Data for Name: execution_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.execution_entity (id, finished, mode, "retryOf", "retrySuccessId", "startedAt", "stoppedAt", "waitTill", status, "workflowId", "deletedAt", "createdAt") FROM stdin;
1	t	manual	\N	\N	2026-06-12 08:17:24.187+00	2026-06-12 08:17:24.199+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:17:24.17+00
2	t	manual	\N	\N	2026-06-12 08:24:31.346+00	2026-06-12 08:24:31.358+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:24:31.331+00
3	t	manual	\N	\N	2026-06-12 08:25:23.56+00	2026-06-12 08:25:23.565+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:25:23.552+00
4	t	manual	\N	\N	2026-06-12 08:25:48.674+00	2026-06-12 08:25:48.679+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:25:48.667+00
5	t	manual	\N	\N	2026-06-12 08:26:01.363+00	2026-06-12 08:26:01.369+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:26:01.355+00
6	t	manual	\N	\N	2026-06-12 08:28:20.144+00	2026-06-12 08:28:20.216+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:28:20.135+00
7	t	manual	\N	\N	2026-06-12 08:29:16.833+00	2026-06-12 08:29:16.842+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:29:16.826+00
8	t	manual	\N	\N	2026-06-12 08:29:43.896+00	2026-06-12 08:29:43.906+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:29:43.889+00
9	t	manual	\N	\N	2026-06-12 08:30:05.144+00	2026-06-12 08:30:05.155+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:30:05.136+00
10	t	manual	\N	\N	2026-06-12 08:32:27.364+00	2026-06-12 08:32:27.375+00	\N	success	ZwFTpGawZVmTGLr0	\N	2026-06-12 08:32:27.357+00
\.


--
-- Data for Name: execution_metadata; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.execution_metadata (id, "executionId", key, value) FROM stdin;
\.


--
-- Data for Name: folder; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.folder (id, name, "parentFolderId", "projectId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: folder_tag; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.folder_tag ("folderId", "tagId") FROM stdin;
\.


--
-- Data for Name: installed_nodes; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.installed_nodes (name, type, "latestVersion", package) FROM stdin;
\.


--
-- Data for Name: installed_packages; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.installed_packages ("packageName", "installedVersion", "authorName", "authorEmail", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: invalid_auth_token; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.invalid_auth_token (token, "expiresAt") FROM stdin;
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjFhZGJmMmJlLWI4YzctNGE4MS1hZjRlLWI5NGNkNzFjYzZiNyIsImhhc2giOiI2SWhDbWVRVWlZIiwiYnJvd3NlcklkIjoid0ZDckpMRnNZMEI1a29WRkNqNnRuUWtwakVKemgrWUk1bVlHZXFUbTAyQT0iLCJpYXQiOjE3ODEyNTEwMzMsImV4cCI6MTc4MTg1NTgzM30.hK8OXLjK6ToJkL6YbyylH_wbJnggEllxUSzvlW6C-2I	2026-06-19 07:57:13+00
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
1	1587669153312	InitialMigration1587669153312
2	1589476000887	WebhookModel1589476000887
3	1594828256133	CreateIndexStoppedAt1594828256133
4	1607431743768	MakeStoppedAtNullable1607431743768
5	1611144599516	AddWebhookId1611144599516
6	1617270242566	CreateTagEntity1617270242566
7	1620824779533	UniqueWorkflowNames1620824779533
8	1626176912946	AddwaitTill1626176912946
9	1630419189837	UpdateWorkflowCredentials1630419189837
10	1644422880309	AddExecutionEntityIndexes1644422880309
11	1646834195327	IncreaseTypeVarcharLimit1646834195327
12	1646992772331	CreateUserManagement1646992772331
13	1648740597343	LowerCaseUserEmail1648740597343
14	1652254514002	CommunityNodes1652254514002
15	1652367743993	AddUserSettings1652367743993
16	1652905585850	AddAPIKeyColumn1652905585850
17	1654090467022	IntroducePinData1654090467022
18	1658932090381	AddNodeIds1658932090381
19	1659902242948	AddJsonKeyPinData1659902242948
20	1660062385367	CreateCredentialsUserRole1660062385367
21	1663755770893	CreateWorkflowsEditorRole1663755770893
22	1664196174001	WorkflowStatistics1664196174001
23	1665484192212	CreateCredentialUsageTable1665484192212
24	1665754637025	RemoveCredentialUsageTable1665754637025
25	1669739707126	AddWorkflowVersionIdColumn1669739707126
26	1669823906995	AddTriggerCountColumn1669823906995
27	1671535397530	MessageEventBusDestinations1671535397530
28	1671726148421	RemoveWorkflowDataLoadedFlag1671726148421
29	1673268682475	DeleteExecutionsWithWorkflows1673268682475
30	1674138566000	AddStatusToExecutions1674138566000
31	1674509946020	CreateLdapEntities1674509946020
32	1675940580449	PurgeInvalidWorkflowConnections1675940580449
33	1676996103000	MigrateExecutionStatus1676996103000
34	1677236854063	UpdateRunningExecutionStatus1677236854063
35	1677501636754	CreateVariables1677501636754
36	1679416281778	CreateExecutionMetadataTable1679416281778
37	1681134145996	AddUserActivatedProperty1681134145996
38	1681134145997	RemoveSkipOwnerSetup1681134145997
39	1690000000000	MigrateIntegerKeysToString1690000000000
40	1690000000020	SeparateExecutionData1690000000020
41	1690000000030	RemoveResetPasswordColumns1690000000030
42	1690000000030	AddMfaColumns1690000000030
43	1690787606731	AddMissingPrimaryKeyOnExecutionData1690787606731
44	1691088862123	CreateWorkflowNameIndex1691088862123
45	1692967111175	CreateWorkflowHistoryTable1692967111175
46	1693491613982	ExecutionSoftDelete1693491613982
47	1693554410387	DisallowOrphanExecutions1693554410387
48	1694091729095	MigrateToTimestampTz1694091729095
49	1695128658538	AddWorkflowMetadata1695128658538
50	1695829275184	ModifyWorkflowHistoryNodesAndConnections1695829275184
51	1700571993961	AddGlobalAdminRole1700571993961
52	1705429061930	DropRoleMapping1705429061930
53	1711018413374	RemoveFailedExecutionStatus1711018413374
54	1711390882123	MoveSshKeysToDatabase1711390882123
55	1712044305787	RemoveNodesAccess1712044305787
56	1714133768519	CreateProject1714133768519
57	1714133768521	MakeExecutionStatusNonNullable1714133768521
58	1717498465931	AddActivatedAtUserSetting1717498465931
59	1720101653148	AddConstraintToExecutionMetadata1720101653148
60	1721377157740	FixExecutionMetadataSequence1721377157740
61	1723627610222	CreateInvalidAuthTokenTable1723627610222
62	1723796243146	RefactorExecutionIndices1723796243146
63	1724753530828	CreateAnnotationTables1724753530828
64	1724951148974	AddApiKeysTable1724951148974
65	1726606152711	CreateProcessedDataTable1726606152711
66	1727427440136	SeparateExecutionCreationFromStart1727427440136
67	1728659839644	AddMissingPrimaryKeyOnAnnotationTagMapping1728659839644
68	1729607673464	UpdateProcessedDataValueColumnToText1729607673464
69	1729607673469	AddProjectIcons1729607673469
70	1730386903556	CreateTestDefinitionTable1730386903556
71	1731404028106	AddDescriptionToTestDefinition1731404028106
72	1731582748663	MigrateTestDefinitionKeyToString1731582748663
73	1732271325258	CreateTestMetricTable1732271325258
74	1732549866705	CreateTestRun1732549866705
75	1733133775640	AddMockedNodesColumnToTestDefinition1733133775640
76	1734479635324	AddManagedColumnToCredentialsTable1734479635324
77	1736172058779	AddStatsColumnsToTestRun1736172058779
78	1736947513045	CreateTestCaseExecutionTable1736947513045
79	1737715421462	AddErrorColumnsToTestRuns1737715421462
80	1738709609940	CreateFolderTable1738709609940
\.


--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.notifications (id, user_id, title, message, is_read, created_at) FROM stdin;
\.


--
-- Data for Name: onboarding_answers; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.onboarding_answers (id, user_id, role, selected_features, referral_source, created_at) FROM stdin;
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.password_resets (id, user_id, reset_token, expires_at, used, created_at) FROM stdin;
\.


--
-- Data for Name: processed_data; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.processed_data ("workflowId", context, "createdAt", "updatedAt", value) FROM stdin;
\.


--
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.project (id, name, type, "createdAt", "updatedAt", icon) FROM stdin;
prjhmXnfmAWU8IyF	Flux  Cast <hooktgol@atomicmail.io>	personal	2026-06-12 07:55:35.043+00	2026-06-12 07:57:13.962+00	\N
\.


--
-- Data for Name: project_relation; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.project_relation ("projectId", "userId", role, "createdAt", "updatedAt") FROM stdin;
prjhmXnfmAWU8IyF	1adbf2be-b8c7-4a81-af4e-b94cd71cc6b7	project:personalOwner	2026-06-12 07:55:35.043+00	2026-06-12 07:55:35.043+00
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.projects (id, user_id, name, type, status, created_at) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.role (id, name, scope, "createdAt", "updatedAt") FROM stdin;
1	owner	global	2026-06-12 07:55:33.843+00	2026-06-12 07:55:33.843+00
2	member	global	2026-06-12 07:55:33.843+00	2026-06-12 07:55:33.843+00
3	owner	workflow	2026-06-12 07:55:33.843+00	2026-06-12 07:55:33.843+00
4	owner	credential	2026-06-12 07:55:33.843+00	2026-06-12 07:55:33.843+00
5	user	credential	2026-06-12 07:55:33.97+00	2026-06-12 07:55:33.97+00
6	editor	workflow	2026-06-12 07:55:33.974+00	2026-06-12 07:55:33.974+00
7	admin	global	2026-06-12 07:55:34.872+00	2026-06-12 07:55:34.872+00
\.


--
-- Data for Name: seo_jobs; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.seo_jobs (id, user_id, keyword, generated_content, tokens_used, status, created_at) FROM stdin;
\.


--
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.settings (key, value, "loadOnStartup") FROM stdin;
ui.banners.dismissed	["V1"]	t
features.ldap	{"loginEnabled":false,"loginLabel":"","connectionUrl":"","allowUnauthorizedCerts":false,"connectionSecurity":"none","connectionPort":389,"baseDn":"","bindingAdminDn":"","bindingAdminPassword":"","firstNameAttribute":"","lastNameAttribute":"","emailAttribute":"","loginIdAttribute":"","ldapIdAttribute":"","userFilter":"","synchronizationEnabled":false,"synchronizationInterval":60,"searchPageSize":0,"searchTimeout":60}	t
features.sourceControl.sshKeys	{"encryptedPrivateKey":"U2FsdGVkX18meMk1yPXq6hKv95uWtRAHsNjTYrSPqt5NF4uy71jZ3Zdyy0K5Of4N91hS8/gq+Nu5G1W0wLOLlwVLeTclm///l5cBf9q5+iygLeG4dEe/RoX/d/K8mURmmVIMyt7lGVOG6X7Rur04eWUXafDRnsGhah2t54Llt52zHnfjgQF2ffKKFHxcGmdkg+fntVgjVxIYCEpLeh6teq2R+lsYJ5sCx6AFJ/80Fn9+UWHkkdeUYfxB1YXi2GE2qVPnrbunX7FBSGptBLc3PlDtNRzXqNorHWDAsHhktKmGqG+fbM8OTR8+xJQaRhy4SaoPtNqVM1AYgVXkDqF5OCCv4Vcf3Hj44vdsyH6QbAGLXB+sjaixztInRr/K2TaYeYXJBOFIPQxPPXHcIU2xgrVsrGH7tHyAMwhwW3Frmsb/1l7JhgjiZzFcXR75jTlIVrvwCfvZTOgOEcbYryVjZbgt5zDcHbAvqBtchqru8LkYKCpZmR/ugWS9XdtEJSnHBYVE/264isix1fzpKZW2YrpyE/tL90HzxhNh66pr28StO71p6d6NUzBR0FMzs/y6","publicKey":"ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDuG26YQyt/tzzRxK2AFRHWFjLLQLybid7N0iWfuID0s n8n deploy key"}	t
features.sourceControl	{"branchName":"main","keyGeneratorType":"ed25519"}	t
userManagement.isInstanceOwnerSetUp	true	t
license.cert	eyJsaWNlbnNlS2V5IjoiLS0tLS1CRUdJTiBMSUNFTlNFIEtFWS0tLS0tXG5ScmltUVZMNUZpSFliSW55TEd5ZUY4NXVjTjZvNFZ0RE1LMytPWEhZN2t1YnJCL1pGcUk2T0F3VWJYdzJMaUp0XG5GSjdjbGJmdTB6UXB4VmxCRHVZY1BDcjBGRTNSVWMyb1VxcFhxUUtaNVdKRjRvYWtzRFB3MjNlejd6S21CZFByXG5WdmN6eEFvU2x0ZXFqOEthUUhWZXdFdzhvbW0zWUw4bW93Ym5EREoxR0wrdS8xV2tLKzB0dWVlYWI5VUI3RHZ0XG42QU5IS0tYdGJxMS9TRmFlUkhqSWx4T3JGSzhZeXlZeVhMTFFiRm5IbHBJd242WUVlanZ6Q1U5d1NRb0ZjSmxUXG5vNTRBSEIxWEYrdWFOdllFR0JXZUozL2U2VllaVzEybHh2ejVkbEVSNFl5cVVpdCtuLyt4VVNweDJ3bmdHN0tZXG5PVjVIdUhGWTZvdEdPTDcxVk1hNUlnPT18fFUyRnNkR1ZrWDEvS3RyNkt1OEQwWjVHc09IYVIxYkxtcTk2OFI0XG5PRmhSdUY0bm13QlA3Q3kzSUlOamtRVHhQWUM1VEhCaTNQMjFtSkkxWVRNUGpKdHY1T1FUS2pnejQ0eG9haXorXG5tbDhLMHM0ZWMzZStmTUFZVEVENm1zcitQZDVGZ1NoN3N4bjJiQm9aT1BXMHEwNDR5NWVKWVM4N0k1a0VsOXh3XG5MR21OR0M2WHgrbkVSc1V5b1UwMVlsWjhRaGRTdVpRYVlxcUF2cUFrMGFHR1R3aG5sZXh5eVd4Smd6eisyaGtRXG5LUVNzVjFMWGdnaE15WUlPdXE3U0ZsT0IyenloYit2OHFYY1AyTFp6NnYycmEzbFZOTDVxRjNETTU5VkMxRXIwXG5NYXV3K2FveG56UVlxNGlIK3VpbmF4VnNJdmtNcyt6b2h0UE1DcExhZ2Z0UzlNTWw2V0psVnJRL0NUTjRuTmhaXG5rYnpFNU5kUmlkc1ppWFNDZ1lqQW5mdDFwY0NvZUZtaXAvUW92RE9FVDZaYzVIY3NqcEcrNmVJOGJ0SXd2VWpjXG42RC9hWFlORnB6MzJaKzlQSVdEYkxvS1QxZVNaeWFNWnZBRFZJbm1FaUcwU1F1dCtUcTBaTXN5VFVFL2dGb3NLXG5WZGlzOHFXZzhYU0dlcUlzbXZkSzJUQmtPTnRCUnRuTjhoZkZuSG51c2N5NnJWQlVwL2FrZllMakdubk1laDA2XG5HcnBleEhVTENrT1J0OVVGQmVpNFdwWGhtWTlvTjh1ajExZzZPTDNaS0dhRXRPTVFSUHhmRzRyUXpSSGNkV2tpXG5qQVVjSWsycVlQUElrOEIzb2k4SGt0RXFWVzFTMTI3a1ZPYnFFOCtaNDBVaDRWbkZLanNYTEF1bzhBeUxFUjQ0XG5BaWt1ak1BRExKcFlEYVM1UEtGd2M0OU8wMlZYT2pqdFlKb1FyNStrZ1hHRDFmeGluRkJ4WUd5SmdRY2p4S085XG56UVJPQ3pDbzFtSHd0Zk90WHlxZjU0a0xhaWtmeXovRkZUOUlTMUpZanpPbjFuTVVxWVFGYzl2eHhIUEFabXp2XG5yZkNpZnNzUndpczBUUlE5ZFBRMFRVVzh3ZFhyZzFSNFAvNExWVDJUQ0E3bFhtbU5wM24xR00wL3Rya2hnaWd5XG4zTitkMU1JekVHcVI3VWk1dmNzZUg4ZnlnSGtRK3BlS1JJYVZhUGxKSUoxdXZyd2hiMktaSE9uTHd1MnQwQkhHXG5qNU1UbWhnZzArOHhDaTBnYU14ZUVreFhoOUM5QlNNZldlV3BWM2NuYWVTc3E3R2I2d3hwcDVFMVh1U1UrYVo1XG5vTUVBeVhXWjJia29SdTNqMW8vTU1MOFMxUmJtTmxVYTJ3SkdSZk5DTHlVa2p2WEhxSDE4NkJQMm9KWmp3TEJTXG5qUGlvLzhtelR6N2lmQVZNdnhXTEY3blBBRTU3RnNhazZ0S0dzYXN6Y3dMQzRGVkJTTUZhc0RNYkJXQ1ZHZjk2XG4ybm93bHF2bHFOQitvTjIvbTRBRHh0Z3RQZ2hnZTBpRktwMi9GdmFJOWM2dzBPZWVYOGVnRHZmTUs3bk9CbUxmXG5ySmhHeFdCdzJtMDRiSmNzcGE2VTQ2TFowaXNJSkMvcThxVkNIZDRHS2dVM2dDRXZ1ZHRGT1pRODBzSUdKK1NoXG4yejYrdG9NZSsya3cvR2MxL25PQnZ3Q1VqUGVObmNacXhCVnpEdTg1cnlSTVJlRkVvc3hrU1pkV0taanB2d2s0XG5qSUFUNk9KTkltOE84MzdKUFREMUZlanBzVkN0NUZoZUlhelVUZWRQZjdpNzhCQ0tZeFRiQjdwb1FsMEc4UW5hXG51UE96MTg5QXFGOWdJelA1MWgzdEF1RmxWR0JPN0kvWnBtQ01QUWF6SHZaL1hWOUxBbGhxNnVhYzAvVGtuOFZ0XG5EeGdPY1RsbWk5NXU3UlhFdytidUFWNmY5aVhzVExHVHZNaDVwT0g5OXY1M0RnSmFGTHRLZFJaczlieTFTMDlCXG5VcE5QbjVsclBLRVhMdTM3TUs0bkhwdHpJZU45a3JwUG5nR0pNb3diSkFGV0xtVzhUUDRLNDFoMklvQUo3ejdEXG5WV3dQdlArWkoyNU1SOGYybE5mM3JqMWpqS2szYklSVDRQSEZZMUFhZXdxMVdPMURiNDJxRW5tc1UyamYzdHFjXG5IVlVNUHprVXdiRU9MblZYVExGdVU3VVVzN3Y3TVZzZGt5K0o4YW1DS1V3WE90QUoxS3lZTm1rbmFncFhMWjV2XG5ZcjZvZUlncXNycHBmM3F5SVRQckpSaXNRVzFxVkM3ZlN3UCs1bmpTLzVJYWFwcmlqUkhXd1g3bVM0RGszeE1mXG5RR0R4UDJQVnA3c01tSitpZWpvdWRVaEt6cXg5dzZIbWJhWkRvNDRCZ1NxWXVQbXRIMVpZbEYwRjNxWjJmdnNrXG5SRGlua2ZBSFhOYy9kb041NXM1eWpJcFBrVGRpRjlZeXNwZmFoZWlrMnNIcnJMcU1WN2xNdWN0Q05QUEVnWmVNXG53NW9kVjA2Q05UN0ZNM2h2QjBHSnBxcHBiV0NuZlcxbFBESXJtMDVWakhjamM2R0tHWDNWdDNGY2pRa25XQ3ZlXG5mOUFXVmNEbkFYUkdiTkNlTDRWb3lRWERsZ1ArYTZ0MkhvdldEdWxnVTh3Rk9id3F4U04rd1k1SHdqVUZXUStEXG5Cdmk2K3MxcXlyOTRrcDRvMjk2cEpiRUFxZW54MTJJK0xxdE1RRHN2MFJFQ0FSVEpsclZGb1ZySUhsNzB5eTRDXG5RanMvakhRNXRyaktnMjU1Y2tHZFpEczlVOEZYalpQR3JvK3hLaDkyUW11TGJ3VnMxT203NmJ2MDcwcW9YRzJaXG5iMlNFVjlQMGh0bTlkWW5FV2pNczRaOUpaRE5mZ1RnaytNa3dlZ1JNQXJML0lBSFZ3TE03SzNkTnFyWXVWM0kvXG4vdEJaSkpPTjhlckw4dHF6UHRaeTdGOUVxWU1uT3RMRnZKdTVaSit3b1pGK1doa3lzVTZVTXB6VENOQXhLK2RoXG5lZDVNZ2czOWlKYTVZbnNOTEEydEE3REJTbFhMY2JiZmhrRXdIWjBXdVBuNUttOXc9PXx8Q2VjaGR1NW5uM3R2XG55emFuRUNuMW1wS09TdFkzMXRZTWx3eXRqa3h3SU80Sk9YRnRCV2t3bWJrdFZEais3WkxDaWU3YURSMk5mVTFmXG5OZzhMU2c5aDRBMUw1T0RXNFZsQXFJc2Vndkt3MEFLTGpYaUE5a3dkeUx4Y090aW9KWVFGa2xPTFRhVjE4UUMyXG5pUVg3OFl4SzU3cWs0YlE4cXpKYU91UmhadStpdGN6U3lib1FveXRSZ202WXFxMURjNDhBTGhkMUhUazBKcFZUXG4zYWY1S0JYT29SS1FsWmYvTC9XNHBlUmZSdVUvZnp3cit4RmVMeGU3YlB2emRHemxiUzdIRHE1UFpIUjJuUk41XG44OHNqVkVpSTBjZ0cvRFErOU9RcXA3dHZVMExUdDZHY2pyNDIxR2ttNlFhbkFSeGpZcXM0Q1A2QnR0SlBMKzhlXG5jZTBsQW93QTFnPT1cbi0tLS0tRU5EIExJQ0VOU0UgS0VZLS0tLS0iLCJ4NTA5IjoiLS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tXG5NSUlFRERDQ0FmUUNDUUNxZzJvRFQ4MHh3akFOQmdrcWhraUc5dzBCQVFVRkFEQklNUXN3Q1FZRFZRUUdFd0pFXG5SVEVQTUEwR0ExVUVDQXdHUW1WeWJHbHVNUTh3RFFZRFZRUUhEQVpDWlhKc2FXNHhGekFWQmdOVkJBTU1EbXhwXG5ZMlZ1YzJVdWJqaHVMbWx2TUI0WERUSXlNRFl5TkRBME1UQTBNRm9YRFRJek1EWXlOREEwTVRBME1Gb3dTREVMXG5NQWtHQTFVRUJoTUNSRVV4RHpBTkJnTlZCQWdNQmtKbGNteHBiakVQTUEwR0ExVUVCd3dHUW1WeWJHbHVNUmN3XG5GUVlEVlFRRERBNXNhV05sYm5ObExtNDRiaTVwYnpDQ0FTSXdEUVlKS29aSWh2Y05BUUVCQlFBRGdnRVBBRENDXG5BUW9DZ2dFQkFNQk0wNVhCNDRnNXhmbUNMd2RwVVR3QVQ4K0NCa3lMS0ZzZXprRDVLLzZXaGFYL1hyc2QvUWQwXG4yMEo3d2w1V2RIVTRjVkJtRlJqVndWemtsQ0syeVlKaThtang4c1hzR3E5UTFsYlVlTUtmVjlkc2dmdWhubEFTXG50blFaZ2x1Z09uRjJGZ1JoWGIvakswdHhUb2FvK2JORTZyNGdJRXpwa3RITEJUWXZ2aXVKbXJlZjdXYlBSdDRJXG5uZDlEN2xoeWJlYnloVjdrdXpqUUEvcFBLSFRGczhNVEhaOGhZVXhSeXJwbTMrTVl6UUQrYmpBMlUxRkljdGFVXG53UVhZV2FON3QydVR3Q3Q5ekFLc21ZL1dlT2J2bDNUWk41T05MQXp5V0dDdWxtNWN3S1IzeGJsQlp6WG5CNmdzXG5Pbk4yT0FkU3RjelRWQ3ljbThwY0ZVcnl0S1NLa0dFQ0F3RUFBVEFOQmdrcWhraUc5dzBCQVFVRkFBT0NBZ0VBXG5sSjAxd2NuMXZqWFhDSHVvaTdSMERKMWxseDErZGFmcXlFcVBBMjdKdStMWG1WVkdYUW9yUzFiOHhqVXFVa2NaXG5UQndiV0ZPNXo1ZFptTnZuYnlqYXptKzZvT2cwUE1hWXhoNlRGd3NJMlBPYmM3YkZ2MmVheXdQdC8xQ3BuYzQwXG5xVU1oZnZSeC9HQ1pQQ1d6My8yUlBKV1g5alFEU0hYQ1hxOEJXK0kvM2N1TERaeVkzZkVZQkIwcDNEdlZtYWQ2XG42V0hRYVVyaU4wL0xxeVNPcC9MWmdsbC90MDI5Z1dWdDA1WmliR29LK2NWaFpFY3NMY1VJaHJqMnVGR0ZkM0ltXG5KTGcxSktKN2pLU0JVUU9kSU1EdnNGVUY3WWRNdk11ckNZQTJzT05OOENaK0k1eFFWMUtTOWV2R0hNNWZtd2dTXG5PUEZ2UHp0RENpMC8xdVc5dE9nSHBvcnVvZGFjdCtFWk5rQVRYQ3ZaaXUydy9xdEtSSkY0VTRJVEVtNWFXMGt3XG42enVDOHh5SWt0N3ZoZHM0OFV1UlNHSDlqSnJBZW1sRWl6dEdJTGhHRHF6UUdZYmxoVVFGR01iQmI3amhlTHlDXG5MSjFXT0c2MkYxc3B4Q0tCekVXNXg2cFIxelQxbWhFZ2Q0TWtMYTZ6UFRwYWNyZDk1QWd4YUdLRUxhMVJXU0ZwXG5NdmRoR2s0TnY3aG5iOHIrQnVNUkM2aWVkUE1DelhxL001MGNOOEFnOGJ3K0oxYUZvKzBFSzJoV0phN2tpRStzXG45R3ZGalNkekNGbFVQaEtra1Vaa1NvNWFPdGNRcTdKdTZrV0JoTG9GWUtncHJscDFRVkIwc0daQTZvNkR0cWphXG5HNy9SazZ2YmFZOHdzTllLMnpCWFRUOG5laDVab1JaL1BKTFV0RUV0YzdZPVxuLS0tLS1FTkQgQ0VSVElGSUNBVEUtLS0tLSJ9	f
\.


--
-- Data for Name: shared_credentials; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.shared_credentials ("credentialsId", "projectId", role, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: shared_workflow; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.shared_workflow ("workflowId", "projectId", role, "createdAt", "updatedAt") FROM stdin;
ZwFTpGawZVmTGLr0	prjhmXnfmAWU8IyF	workflow:owner	2026-06-12 08:17:23.851+00	2026-06-12 08:17:23.851+00
\.


--
-- Data for Name: stream_jobs; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.stream_jobs (id, user_id, stream_name, rtmp_url, status, started_at, ended_at) FROM stdin;
\.


--
-- Data for Name: tag_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.tag_entity (name, "createdAt", "updatedAt", id) FROM stdin;
\.


--
-- Data for Name: test_case_execution; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.test_case_execution (id, "testRunId", "pastExecutionId", "executionId", "evaluationExecutionId", status, "runAt", "completedAt", "errorCode", "errorDetails", metrics, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: test_definition; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.test_definition (name, "workflowId", "evaluationWorkflowId", "annotationTagId", "createdAt", "updatedAt", description, id, "mockedNodes") FROM stdin;
\.


--
-- Data for Name: test_metric; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.test_metric (id, name, "testDefinitionId", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: test_run; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.test_run (id, "testDefinitionId", status, "runAt", "completedAt", metrics, "createdAt", "updatedAt", "totalCases", "passedCases", "failedCases", "errorCode", "errorDetails") FROM stdin;
\.


--
-- Data for Name: thumbnail_jobs; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.thumbnail_jobs (id, user_id, youtube_url, thumbnail_url, generated_image_url, prompt_used, status, created_at) FROM stdin;
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public."user" (id, email, "firstName", "lastName", password, "personalizationAnswers", "createdAt", "updatedAt", settings, disabled, "mfaEnabled", "mfaSecret", "mfaRecoveryCodes", role) FROM stdin;
1adbf2be-b8c7-4a81-af4e-b94cd71cc6b7	hooktgol@atomicmail.io	Flux 	Cast	$2a$10$bXfyMBkPdgBRDOAluVYOKeRrrNcCrNIS.8LfQsSczHZbiJiPYztvi	{"version":"v4","personalization_survey_submitted_at":"2026-06-12T07:57:37.104Z","personalization_survey_n8n_version":"1.80.0","companySize":"20-99","companyType":"saas","role":"business-owner","reportedSource":"youtube"}	2026-06-12 07:55:33.843+00	2026-06-12 07:57:35.397+00	{"userActivated": false}	f	f	\N	\N	global:owner
\.


--
-- Data for Name: user_api_keys; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.user_api_keys (id, "userId", label, "apiKey", "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: user_files; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.user_files (id, user_id, file_name, original_name, file_type, storage_provider, file_url, file_key, size_bytes, status, created_at) FROM stdin;
\.


--
-- Data for Name: user_sessions; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.user_sessions (id, user_id, token_hash, ip_address, user_agent, created_at, expires_at, is_active) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.users (id, email, username, password_hash, plan, credits, created_at, last_login, role) FROM stdin;
1	hooktgol@atomicmail.io	hooktgol	temp_hash	pro	999999	2026-06-12 23:57:57.243508	\N	admin
\.


--
-- Data for Name: variables; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.variables (key, type, value, id) FROM stdin;
\.


--
-- Data for Name: webhook_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.webhook_entity ("webhookPath", method, node, "webhookId", "pathLength", "workflowId") FROM stdin;
\.


--
-- Data for Name: workflow_entity; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.workflow_entity (name, active, nodes, connections, "createdAt", "updatedAt", settings, "staticData", "pinData", "versionId", "triggerCount", id, meta, "parentFolderId") FROM stdin;
My workflow	f	[{"parameters":{},"type":"n8n-nodes-base.manualTrigger","typeVersion":1,"position":[0,0],"id":"a2ef124b-dd16-478a-8e12-0d1b50b77d64","name":"When clicking ‘Test workflow’"}]	{}	2026-06-12 08:17:23.851+00	2026-06-12 08:17:23.851+00	{"executionOrder":"v1"}	\N	{}	e2d1d811-fdc1-4de8-8df4-86e9f9ef41ef	0	ZwFTpGawZVmTGLr0	\N	\N
\.


--
-- Data for Name: workflow_history; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.workflow_history ("versionId", "workflowId", authors, "createdAt", "updatedAt", nodes, connections) FROM stdin;
\.


--
-- Data for Name: workflow_statistics; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.workflow_statistics (count, "latestEvent", name, "workflowId") FROM stdin;
10	2026-06-12 08:32:27.384+00	manual_success	ZwFTpGawZVmTGLr0
\.


--
-- Data for Name: workflows_tags; Type: TABLE DATA; Schema: public; Owner: userRQ2
--

COPY public.workflows_tags ("workflowId", "tagId") FROM stdin;
\.


--
-- Name: api_usage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.api_usage_id_seq', 1, false);


--
-- Name: audit_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.audit_logs_id_seq', 1, false);


--
-- Name: auth_provider_sync_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.auth_provider_sync_history_id_seq', 1, false);


--
-- Name: billing_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.billing_history_id_seq', 1, false);


--
-- Name: credit_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.credit_transactions_id_seq', 1, false);


--
-- Name: deploy_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.deploy_jobs_id_seq', 1, false);


--
-- Name: email_verifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.email_verifications_id_seq', 1, false);


--
-- Name: execution_annotations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.execution_annotations_id_seq', 1, false);


--
-- Name: execution_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.execution_entity_id_seq', 10, true);


--
-- Name: execution_metadata_temp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.execution_metadata_temp_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.migrations_id_seq', 80, true);


--
-- Name: notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.notifications_id_seq', 1, false);


--
-- Name: onboarding_answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.onboarding_answers_id_seq', 1, false);


--
-- Name: password_resets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.password_resets_id_seq', 1, false);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.projects_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.role_id_seq', 7, true);


--
-- Name: seo_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.seo_jobs_id_seq', 1, false);


--
-- Name: stream_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.stream_jobs_id_seq', 1, false);


--
-- Name: thumbnail_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.thumbnail_jobs_id_seq', 1, false);


--
-- Name: user_files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.user_files_id_seq', 1, false);


--
-- Name: user_sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.user_sessions_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: userRQ2
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: test_run PK_011c050f566e9db509a0fadb9b9; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT "PK_011c050f566e9db509a0fadb9b9" PRIMARY KEY (id);


--
-- Name: installed_packages PK_08cc9197c39b028c1e9beca225940576fd1a5804; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.installed_packages
    ADD CONSTRAINT "PK_08cc9197c39b028c1e9beca225940576fd1a5804" PRIMARY KEY ("packageName");


--
-- Name: execution_metadata PK_17a0b6284f8d626aae88e1c16e4; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_metadata
    ADD CONSTRAINT "PK_17a0b6284f8d626aae88e1c16e4" PRIMARY KEY (id);


--
-- Name: project_relation PK_1caaa312a5d7184a003be0f0cb6; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "PK_1caaa312a5d7184a003be0f0cb6" PRIMARY KEY ("projectId", "userId");


--
-- Name: folder_tag PK_27e4e00852f6b06a925a4d83a3e; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "PK_27e4e00852f6b06a925a4d83a3e" PRIMARY KEY ("folderId", "tagId");


--
-- Name: test_metric PK_3e98b8e20acc19c5030a8644142; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_metric
    ADD CONSTRAINT "PK_3e98b8e20acc19c5030a8644142" PRIMARY KEY (id);


--
-- Name: project PK_4d68b1358bb5b766d3e78f32f57; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT "PK_4d68b1358bb5b766d3e78f32f57" PRIMARY KEY (id);


--
-- Name: invalid_auth_token PK_5779069b7235b256d91f7af1a15; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.invalid_auth_token
    ADD CONSTRAINT "PK_5779069b7235b256d91f7af1a15" PRIMARY KEY (token);


--
-- Name: shared_workflow PK_5ba87620386b847201c9531c58f; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "PK_5ba87620386b847201c9531c58f" PRIMARY KEY ("workflowId", "projectId");


--
-- Name: folder PK_6278a41a706740c94c02e288df8; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "PK_6278a41a706740c94c02e288df8" PRIMARY KEY (id);


--
-- Name: annotation_tag_entity PK_69dfa041592c30bbc0d4b84aa00; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.annotation_tag_entity
    ADD CONSTRAINT "PK_69dfa041592c30bbc0d4b84aa00" PRIMARY KEY (id);


--
-- Name: execution_annotations PK_7afcf93ffa20c4252869a7c6a23; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotations
    ADD CONSTRAINT "PK_7afcf93ffa20c4252869a7c6a23" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: installed_nodes PK_8ebd28194e4f792f96b5933423fc439df97d9689; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.installed_nodes
    ADD CONSTRAINT "PK_8ebd28194e4f792f96b5933423fc439df97d9689" PRIMARY KEY (name);


--
-- Name: shared_credentials PK_8ef3a59796a228913f251779cff; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "PK_8ef3a59796a228913f251779cff" PRIMARY KEY ("credentialsId", "projectId");


--
-- Name: test_case_execution PK_90c121f77a78a6580e94b794bce; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "PK_90c121f77a78a6580e94b794bce" PRIMARY KEY (id);


--
-- Name: user_api_keys PK_978fa5caa3468f463dac9d92e69; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT "PK_978fa5caa3468f463dac9d92e69" PRIMARY KEY (id);


--
-- Name: execution_annotation_tags PK_979ec03d31294cca484be65d11f; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "PK_979ec03d31294cca484be65d11f" PRIMARY KEY ("annotationId", "tagId");


--
-- Name: webhook_entity PK_b21ace2e13596ccd87dc9bf4ea6; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.webhook_entity
    ADD CONSTRAINT "PK_b21ace2e13596ccd87dc9bf4ea6" PRIMARY KEY ("webhookPath", method);


--
-- Name: workflow_history PK_b6572dd6173e4cd06fe79937b58; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_history
    ADD CONSTRAINT "PK_b6572dd6173e4cd06fe79937b58" PRIMARY KEY ("versionId");


--
-- Name: processed_data PK_ca04b9d8dc72de268fe07a65773; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.processed_data
    ADD CONSTRAINT "PK_ca04b9d8dc72de268fe07a65773" PRIMARY KEY ("workflowId", context);


--
-- Name: settings PK_dc0fe14e6d9943f268e7b119f69ab8bd; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT "PK_dc0fe14e6d9943f268e7b119f69ab8bd" PRIMARY KEY (key);


--
-- Name: role PK_e853ce24e8200abe5721d2c6ac552b73; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "PK_e853ce24e8200abe5721d2c6ac552b73" PRIMARY KEY (id);


--
-- Name: user PK_ea8f538c94b6e352418254ed6474a81f; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "PK_ea8f538c94b6e352418254ed6474a81f" PRIMARY KEY (id);


--
-- Name: role UQ_5b49d0f504f7ef31045a1fb2eb8; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "UQ_5b49d0f504f7ef31045a1fb2eb8" UNIQUE (scope, name);


--
-- Name: user UQ_e12875dfb3b1d92d7d7c5377e2; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "UQ_e12875dfb3b1d92d7d7c5377e2" UNIQUE (email);


--
-- Name: api_usage api_usage_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.api_usage
    ADD CONSTRAINT api_usage_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: auth_identity auth_identity_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT auth_identity_pkey PRIMARY KEY ("providerId", "providerType");


--
-- Name: auth_provider_sync_history auth_provider_sync_history_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.auth_provider_sync_history
    ADD CONSTRAINT auth_provider_sync_history_pkey PRIMARY KEY (id);


--
-- Name: billing_history billing_history_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.billing_history
    ADD CONSTRAINT billing_history_pkey PRIMARY KEY (id);


--
-- Name: credentials_entity credentials_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.credentials_entity
    ADD CONSTRAINT credentials_entity_pkey PRIMARY KEY (id);


--
-- Name: credit_transactions credit_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.credit_transactions
    ADD CONSTRAINT credit_transactions_pkey PRIMARY KEY (id);


--
-- Name: deploy_jobs deploy_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.deploy_jobs
    ADD CONSTRAINT deploy_jobs_pkey PRIMARY KEY (id);


--
-- Name: email_verifications email_verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.email_verifications
    ADD CONSTRAINT email_verifications_pkey PRIMARY KEY (id);


--
-- Name: event_destinations event_destinations_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.event_destinations
    ADD CONSTRAINT event_destinations_pkey PRIMARY KEY (id);


--
-- Name: execution_data execution_data_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_data
    ADD CONSTRAINT execution_data_pkey PRIMARY KEY ("executionId");


--
-- Name: notifications notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_pkey PRIMARY KEY (id);


--
-- Name: onboarding_answers onboarding_answers_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.onboarding_answers
    ADD CONSTRAINT onboarding_answers_pkey PRIMARY KEY (id);


--
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);


--
-- Name: execution_entity pk_e3e63bbf986767844bbe1166d4e; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_entity
    ADD CONSTRAINT pk_e3e63bbf986767844bbe1166d4e PRIMARY KEY (id);


--
-- Name: workflow_statistics pk_workflow_statistics; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_statistics
    ADD CONSTRAINT pk_workflow_statistics PRIMARY KEY ("workflowId", name);


--
-- Name: workflows_tags pk_workflows_tags; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT pk_workflows_tags PRIMARY KEY ("workflowId", "tagId");


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: seo_jobs seo_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.seo_jobs
    ADD CONSTRAINT seo_jobs_pkey PRIMARY KEY (id);


--
-- Name: stream_jobs stream_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.stream_jobs
    ADD CONSTRAINT stream_jobs_pkey PRIMARY KEY (id);


--
-- Name: tag_entity tag_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.tag_entity
    ADD CONSTRAINT tag_entity_pkey PRIMARY KEY (id);


--
-- Name: test_definition test_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT test_definition_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_jobs thumbnail_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.thumbnail_jobs
    ADD CONSTRAINT thumbnail_jobs_pkey PRIMARY KEY (id);


--
-- Name: user_files user_files_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_files
    ADD CONSTRAINT user_files_pkey PRIMARY KEY (id);


--
-- Name: user_sessions user_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: variables variables_key_key; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_key_key UNIQUE (key);


--
-- Name: variables variables_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.variables
    ADD CONSTRAINT variables_pkey PRIMARY KEY (id);


--
-- Name: workflow_entity workflow_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_entity
    ADD CONSTRAINT workflow_entity_pkey PRIMARY KEY (id);


--
-- Name: IDX_14f68deffaf858465715995508; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_14f68deffaf858465715995508" ON public.folder USING btree ("projectId", id);


--
-- Name: IDX_1e31657f5fe46816c34be7c1b4; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_1e31657f5fe46816c34be7c1b4" ON public.workflow_history USING btree ("workflowId");


--
-- Name: IDX_1ef35bac35d20bdae979d917a3; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_1ef35bac35d20bdae979d917a3" ON public.user_api_keys USING btree ("apiKey");


--
-- Name: IDX_3a4e9cf37111ac3270e2469b47; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_3a4e9cf37111ac3270e2469b47" ON public.test_metric USING btree ("testDefinitionId");


--
-- Name: IDX_3a81713a76f2295b12b46cdfca; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_3a81713a76f2295b12b46cdfca" ON public.test_run USING btree ("testDefinitionId");


--
-- Name: IDX_5f0643f6717905a05164090dde; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_5f0643f6717905a05164090dde" ON public.project_relation USING btree ("userId");


--
-- Name: IDX_61448d56d61802b5dfde5cdb00; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_61448d56d61802b5dfde5cdb00" ON public.project_relation USING btree ("projectId");


--
-- Name: IDX_63d7bbae72c767cf162d459fcc; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_63d7bbae72c767cf162d459fcc" ON public.user_api_keys USING btree ("userId", label);


--
-- Name: IDX_8e4b4774db42f1e6dda3452b2a; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_8e4b4774db42f1e6dda3452b2a" ON public.test_case_execution USING btree ("testRunId");


--
-- Name: IDX_97f863fa83c4786f1956508496; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_97f863fa83c4786f1956508496" ON public.execution_annotations USING btree ("executionId");


--
-- Name: IDX_9ec1ce6fbf82305f489adb971d; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_9ec1ce6fbf82305f489adb971d" ON public.test_definition USING btree ("evaluationWorkflowId");


--
-- Name: IDX_a3697779b366e131b2bbdae297; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_a3697779b366e131b2bbdae297" ON public.execution_annotation_tags USING btree ("tagId");


--
-- Name: IDX_ae51b54c4bb430cf92f48b623f; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_ae51b54c4bb430cf92f48b623f" ON public.annotation_tag_entity USING btree (name);


--
-- Name: IDX_b0dd0087fe3da02b0ffa4b9c5b; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_b0dd0087fe3da02b0ffa4b9c5b" ON public.test_definition USING btree ("workflowId");


--
-- Name: IDX_c1519757391996eb06064f0e7c; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_c1519757391996eb06064f0e7c" ON public.execution_annotation_tags USING btree ("annotationId");


--
-- Name: IDX_cec8eea3bf49551482ccb4933e; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX "IDX_cec8eea3bf49551482ccb4933e" ON public.execution_metadata USING btree ("executionId", key);


--
-- Name: IDX_execution_entity_deletedAt; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_execution_entity_deletedAt" ON public.execution_entity USING btree ("deletedAt");


--
-- Name: IDX_workflow_entity_name; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX "IDX_workflow_entity_name" ON public.workflow_entity USING btree (name);


--
-- Name: idx_07fde106c0b471d8cc80a64fc8; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_07fde106c0b471d8cc80a64fc8 ON public.credentials_entity USING btree (type);


--
-- Name: idx_16f4436789e804e3e1c9eeb240; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_16f4436789e804e3e1c9eeb240 ON public.webhook_entity USING btree ("webhookId", method, "pathLength");


--
-- Name: idx_812eb05f7451ca757fb98444ce; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX idx_812eb05f7451ca757fb98444ce ON public.tag_entity USING btree (name);


--
-- Name: idx_execution_entity_stopped_at_status_deleted_at; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_execution_entity_stopped_at_status_deleted_at ON public.execution_entity USING btree ("stoppedAt", status, "deletedAt") WHERE (("stoppedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_wait_till_status_deleted_at; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_execution_entity_wait_till_status_deleted_at ON public.execution_entity USING btree ("waitTill", status, "deletedAt") WHERE (("waitTill" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_execution_entity_workflow_id_started_at; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_execution_entity_workflow_id_started_at ON public.execution_entity USING btree ("workflowId", "startedAt") WHERE (("startedAt" IS NOT NULL) AND ("deletedAt" IS NULL));


--
-- Name: idx_workflows_tags_workflow_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE INDEX idx_workflows_tags_workflow_id ON public.workflows_tags USING btree ("workflowId");


--
-- Name: pk_credentials_entity_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX pk_credentials_entity_id ON public.credentials_entity USING btree (id);


--
-- Name: pk_tag_entity_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX pk_tag_entity_id ON public.tag_entity USING btree (id);


--
-- Name: pk_test_definition_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX pk_test_definition_id ON public.test_definition USING btree (id);


--
-- Name: pk_variables_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX pk_variables_id ON public.variables USING btree (id);


--
-- Name: pk_workflow_entity_id; Type: INDEX; Schema: public; Owner: userRQ2
--

CREATE UNIQUE INDEX pk_workflow_entity_id ON public.workflow_entity USING btree (id);


--
-- Name: processed_data FK_06a69a7032c97a763c2c7599464; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.processed_data
    ADD CONSTRAINT "FK_06a69a7032c97a763c2c7599464" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: workflow_history FK_1e31657f5fe46816c34be7c1b4b; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_history
    ADD CONSTRAINT "FK_1e31657f5fe46816c34be7c1b4b" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_258d954733841d51edd826a562b; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_258d954733841d51edd826a562b" FOREIGN KEY ("pastExecutionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: execution_metadata FK_31d0b4c93fb85ced26f6005cda3; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_metadata
    ADD CONSTRAINT "FK_31d0b4c93fb85ced26f6005cda3" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: test_metric FK_3a4e9cf37111ac3270e2469b475; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_metric
    ADD CONSTRAINT "FK_3a4e9cf37111ac3270e2469b475" FOREIGN KEY ("testDefinitionId") REFERENCES public.test_definition(id) ON DELETE CASCADE;


--
-- Name: test_run FK_3a81713a76f2295b12b46cdfcab; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_run
    ADD CONSTRAINT "FK_3a81713a76f2295b12b46cdfcab" FOREIGN KEY ("testDefinitionId") REFERENCES public.test_definition(id) ON DELETE CASCADE;


--
-- Name: shared_credentials FK_416f66fc846c7c442970c094ccf; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "FK_416f66fc846c7c442970c094ccf" FOREIGN KEY ("credentialsId") REFERENCES public.credentials_entity(id) ON DELETE CASCADE;


--
-- Name: project_relation FK_5f0643f6717905a05164090dde7; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "FK_5f0643f6717905a05164090dde7" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: project_relation FK_61448d56d61802b5dfde5cdb002; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.project_relation
    ADD CONSTRAINT "FK_61448d56d61802b5dfde5cdb002" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: installed_nodes FK_73f857fc5dce682cef8a99c11dbddbc969618951; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.installed_nodes
    ADD CONSTRAINT "FK_73f857fc5dce682cef8a99c11dbddbc969618951" FOREIGN KEY (package) REFERENCES public.installed_packages("packageName") ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: folder FK_804ea52f6729e3940498bd54d78; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "FK_804ea52f6729e3940498bd54d78" FOREIGN KEY ("parentFolderId") REFERENCES public.folder(id) ON DELETE CASCADE;


--
-- Name: shared_credentials FK_812c2852270da1247756e77f5a4; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_credentials
    ADD CONSTRAINT "FK_812c2852270da1247756e77f5a4" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_8e4b4774db42f1e6dda3452b2af; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_8e4b4774db42f1e6dda3452b2af" FOREIGN KEY ("testRunId") REFERENCES public.test_run(id) ON DELETE CASCADE;


--
-- Name: folder_tag FK_94a60854e06f2897b2e0d39edba; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "FK_94a60854e06f2897b2e0d39edba" FOREIGN KEY ("folderId") REFERENCES public.folder(id) ON DELETE CASCADE;


--
-- Name: execution_annotations FK_97f863fa83c4786f19565084960; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotations
    ADD CONSTRAINT "FK_97f863fa83c4786f19565084960" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_9ec1ce6fbf82305f489adb971d3; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_9ec1ce6fbf82305f489adb971d3" FOREIGN KEY ("evaluationWorkflowId") REFERENCES public.workflow_entity(id) ON DELETE SET NULL;


--
-- Name: execution_annotation_tags FK_a3697779b366e131b2bbdae2976; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "FK_a3697779b366e131b2bbdae2976" FOREIGN KEY ("tagId") REFERENCES public.annotation_tag_entity(id) ON DELETE CASCADE;


--
-- Name: shared_workflow FK_a45ea5f27bcfdc21af9b4188560; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "FK_a45ea5f27bcfdc21af9b4188560" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: folder FK_a8260b0b36939c6247f385b8221; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder
    ADD CONSTRAINT "FK_a8260b0b36939c6247f385b8221" FOREIGN KEY ("projectId") REFERENCES public.project(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_b0dd0087fe3da02b0ffa4b9c5bb; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_b0dd0087fe3da02b0ffa4b9c5bb" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: execution_annotation_tags FK_c1519757391996eb06064f0e7c8; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_annotation_tags
    ADD CONSTRAINT "FK_c1519757391996eb06064f0e7c8" FOREIGN KEY ("annotationId") REFERENCES public.execution_annotations(id) ON DELETE CASCADE;


--
-- Name: test_definition FK_d5d7ea64662dbc62f5e266fbeb0; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_definition
    ADD CONSTRAINT "FK_d5d7ea64662dbc62f5e266fbeb0" FOREIGN KEY ("annotationTagId") REFERENCES public.annotation_tag_entity(id) ON DELETE SET NULL;


--
-- Name: shared_workflow FK_daa206a04983d47d0a9c34649ce; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.shared_workflow
    ADD CONSTRAINT "FK_daa206a04983d47d0a9c34649ce" FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: folder_tag FK_dc88164176283de80af47621746; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.folder_tag
    ADD CONSTRAINT "FK_dc88164176283de80af47621746" FOREIGN KEY ("tagId") REFERENCES public.tag_entity(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_dfbe194e3ebdfe49a87bc4692ca; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_dfbe194e3ebdfe49a87bc4692ca" FOREIGN KEY ("evaluationExecutionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: user_api_keys FK_e131705cbbc8fb589889b02d457; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_api_keys
    ADD CONSTRAINT "FK_e131705cbbc8fb589889b02d457" FOREIGN KEY ("userId") REFERENCES public."user"(id) ON DELETE CASCADE;


--
-- Name: test_case_execution FK_e48965fac35d0f5b9e7f51d8c44; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.test_case_execution
    ADD CONSTRAINT "FK_e48965fac35d0f5b9e7f51d8c44" FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE SET NULL;


--
-- Name: api_usage api_usage_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.api_usage
    ADD CONSTRAINT api_usage_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: audit_logs audit_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE SET NULL;


--
-- Name: auth_identity auth_identity_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.auth_identity
    ADD CONSTRAINT "auth_identity_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."user"(id);


--
-- Name: billing_history billing_history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.billing_history
    ADD CONSTRAINT billing_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: credit_transactions credit_transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.credit_transactions
    ADD CONSTRAINT credit_transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: deploy_jobs deploy_jobs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.deploy_jobs
    ADD CONSTRAINT deploy_jobs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: email_verifications email_verifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.email_verifications
    ADD CONSTRAINT email_verifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: execution_data execution_data_fk; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_data
    ADD CONSTRAINT execution_data_fk FOREIGN KEY ("executionId") REFERENCES public.execution_entity(id) ON DELETE CASCADE;


--
-- Name: execution_entity fk_execution_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.execution_entity
    ADD CONSTRAINT fk_execution_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: webhook_entity fk_webhook_entity_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.webhook_entity
    ADD CONSTRAINT fk_webhook_entity_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: workflow_statistics fk_workflow_statistics_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_statistics
    ADD CONSTRAINT fk_workflow_statistics_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: workflows_tags fk_workflows_tags_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_tag_id FOREIGN KEY ("tagId") REFERENCES public.tag_entity(id) ON DELETE CASCADE;


--
-- Name: workflows_tags fk_workflows_tags_workflow_id; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflows_tags
    ADD CONSTRAINT fk_workflows_tags_workflow_id FOREIGN KEY ("workflowId") REFERENCES public.workflow_entity(id) ON DELETE CASCADE;


--
-- Name: notifications notifications_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.notifications
    ADD CONSTRAINT notifications_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: onboarding_answers onboarding_answers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.onboarding_answers
    ADD CONSTRAINT onboarding_answers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: password_resets password_resets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: projects projects_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: seo_jobs seo_jobs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.seo_jobs
    ADD CONSTRAINT seo_jobs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: stream_jobs stream_jobs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.stream_jobs
    ADD CONSTRAINT stream_jobs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: thumbnail_jobs thumbnail_jobs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.thumbnail_jobs
    ADD CONSTRAINT thumbnail_jobs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_files user_files_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_files
    ADD CONSTRAINT user_files_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: user_sessions user_sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.user_sessions
    ADD CONSTRAINT user_sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: workflow_entity workflow_entity_parentFolderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: userRQ2
--

ALTER TABLE ONLY public.workflow_entity
    ADD CONSTRAINT "workflow_entity_parentFolderId_fkey" FOREIGN KEY ("parentFolderId") REFERENCES public.folder(id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

