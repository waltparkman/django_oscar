--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: address_country; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.address_country (
    iso_3166_1_a2 character varying(2) NOT NULL,
    iso_3166_1_a3 character varying(3) NOT NULL,
    iso_3166_1_numeric character varying(3) NOT NULL,
    printable_name character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    display_order smallint NOT NULL,
    is_shipping_country boolean NOT NULL,
    CONSTRAINT address_country_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.address_country OWNER TO oscar;

--
-- Name: address_useraddress; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.address_useraddress (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    phone_number character varying(128) NOT NULL,
    notes text NOT NULL,
    is_default_for_shipping boolean NOT NULL,
    is_default_for_billing boolean NOT NULL,
    num_orders_as_shipping_address integer NOT NULL,
    hash character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    country_id character varying(2) NOT NULL,
    user_id integer NOT NULL,
    num_orders_as_billing_address integer NOT NULL,
    CONSTRAINT address_useraddress_num_orders_as_billing_address_check CHECK ((num_orders_as_billing_address >= 0)),
    CONSTRAINT address_useraddress_num_orders_as_shipping__4ebf3942_check CHECK ((num_orders_as_shipping_address >= 0))
);


ALTER TABLE public.address_useraddress OWNER TO oscar;

--
-- Name: address_useraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.address_useraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.address_useraddress_id_seq OWNER TO oscar;

--
-- Name: address_useraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.address_useraddress_id_seq OWNED BY public.address_useraddress.id;


--
-- Name: analytics_productrecord; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.analytics_productrecord (
    id bigint NOT NULL,
    num_views integer NOT NULL,
    num_basket_additions integer NOT NULL,
    num_purchases integer NOT NULL,
    score double precision NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT analytics_productrecord_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT analytics_productrecord_num_purchases_check CHECK ((num_purchases >= 0)),
    CONSTRAINT analytics_productrecord_num_views_check CHECK ((num_views >= 0))
);


ALTER TABLE public.analytics_productrecord OWNER TO oscar;

--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.analytics_productrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_productrecord_id_seq OWNER TO oscar;

--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.analytics_productrecord_id_seq OWNED BY public.analytics_productrecord.id;


--
-- Name: analytics_userproductview; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.analytics_userproductview (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.analytics_userproductview OWNER TO oscar;

--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.analytics_userproductview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_userproductview_id_seq OWNER TO oscar;

--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.analytics_userproductview_id_seq OWNED BY public.analytics_userproductview.id;


--
-- Name: analytics_userrecord; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.analytics_userrecord (
    id bigint NOT NULL,
    num_product_views integer NOT NULL,
    num_basket_additions integer NOT NULL,
    num_orders integer NOT NULL,
    num_order_lines integer NOT NULL,
    num_order_items integer NOT NULL,
    total_spent numeric(12,2) NOT NULL,
    date_last_order timestamp with time zone,
    user_id integer NOT NULL,
    CONSTRAINT analytics_userrecord_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT analytics_userrecord_num_order_items_check CHECK ((num_order_items >= 0)),
    CONSTRAINT analytics_userrecord_num_order_lines_check CHECK ((num_order_lines >= 0)),
    CONSTRAINT analytics_userrecord_num_orders_check CHECK ((num_orders >= 0)),
    CONSTRAINT analytics_userrecord_num_product_views_check CHECK ((num_product_views >= 0))
);


ALTER TABLE public.analytics_userrecord OWNER TO oscar;

--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.analytics_userrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_userrecord_id_seq OWNER TO oscar;

--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.analytics_userrecord_id_seq OWNED BY public.analytics_userrecord.id;


--
-- Name: analytics_usersearch; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.analytics_usersearch (
    id bigint NOT NULL,
    query character varying(255) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.analytics_usersearch OWNER TO oscar;

--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.analytics_usersearch_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.analytics_usersearch_id_seq OWNER TO oscar;

--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.analytics_usersearch_id_seq OWNED BY public.analytics_usersearch.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO oscar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO oscar;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO oscar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO oscar;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO oscar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO oscar;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO oscar;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO oscar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO oscar;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO oscar;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO oscar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO oscar;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: basket_basket; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.basket_basket (
    id bigint NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_merged timestamp with time zone,
    date_submitted timestamp with time zone,
    owner_id integer
);


ALTER TABLE public.basket_basket OWNER TO oscar;

--
-- Name: basket_basket_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.basket_basket_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_basket_id_seq OWNER TO oscar;

--
-- Name: basket_basket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.basket_basket_id_seq OWNED BY public.basket_basket.id;


--
-- Name: basket_basket_vouchers; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.basket_basket_vouchers (
    id bigint NOT NULL,
    basket_id bigint NOT NULL,
    voucher_id bigint NOT NULL
);


ALTER TABLE public.basket_basket_vouchers OWNER TO oscar;

--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.basket_basket_vouchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_basket_vouchers_id_seq OWNER TO oscar;

--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.basket_basket_vouchers_id_seq OWNED BY public.basket_basket_vouchers.id;


--
-- Name: basket_line; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.basket_line (
    id bigint NOT NULL,
    line_reference character varying(128) NOT NULL,
    quantity integer NOT NULL,
    price_currency character varying(12) NOT NULL,
    price_excl_tax numeric(12,2),
    price_incl_tax numeric(12,2),
    date_created timestamp with time zone NOT NULL,
    basket_id bigint NOT NULL,
    product_id bigint NOT NULL,
    stockrecord_id bigint NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    CONSTRAINT basket_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.basket_line OWNER TO oscar;

--
-- Name: basket_line_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.basket_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_line_id_seq OWNER TO oscar;

--
-- Name: basket_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.basket_line_id_seq OWNED BY public.basket_line.id;


--
-- Name: basket_lineattribute; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.basket_lineattribute (
    id bigint NOT NULL,
    value character varying(255) NOT NULL,
    line_id bigint NOT NULL,
    option_id bigint NOT NULL
);


ALTER TABLE public.basket_lineattribute OWNER TO oscar;

--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.basket_lineattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.basket_lineattribute_id_seq OWNER TO oscar;

--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.basket_lineattribute_id_seq OWNED BY public.basket_lineattribute.id;


--
-- Name: catalogue_attributeoption; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_attributeoption (
    id bigint NOT NULL,
    option character varying(255) NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.catalogue_attributeoption OWNER TO oscar;

--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_attributeoption_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_attributeoption_id_seq OWNER TO oscar;

--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_attributeoption_id_seq OWNED BY public.catalogue_attributeoption.id;


--
-- Name: catalogue_attributeoptiongroup; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_attributeoptiongroup (
    id bigint NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.catalogue_attributeoptiongroup OWNER TO oscar;

--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_attributeoptiongroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_attributeoptiongroup_id_seq OWNER TO oscar;

--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_attributeoptiongroup_id_seq OWNED BY public.catalogue_attributeoptiongroup.id;


--
-- Name: catalogue_category; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_category (
    id bigint NOT NULL,
    path character varying(255) NOT NULL,
    depth integer NOT NULL,
    numchild integer NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    image character varying(255),
    slug character varying(255) NOT NULL,
    ancestors_are_public boolean NOT NULL,
    is_public boolean NOT NULL,
    meta_description text,
    meta_title character varying(255),
    CONSTRAINT catalogue_category_depth_check CHECK ((depth >= 0)),
    CONSTRAINT catalogue_category_numchild_check CHECK ((numchild >= 0))
);


ALTER TABLE public.catalogue_category OWNER TO oscar;

--
-- Name: catalogue_category_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_category_id_seq OWNER TO oscar;

--
-- Name: catalogue_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_category_id_seq OWNED BY public.catalogue_category.id;


--
-- Name: catalogue_option; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_option (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    type character varying(255) NOT NULL,
    required boolean NOT NULL
);


ALTER TABLE public.catalogue_option OWNER TO oscar;

--
-- Name: catalogue_option_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_option_id_seq OWNER TO oscar;

--
-- Name: catalogue_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_option_id_seq OWNED BY public.catalogue_option.id;


--
-- Name: catalogue_product; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_product (
    id bigint NOT NULL,
    structure character varying(10) NOT NULL,
    upc character varying(64),
    title character varying(255) NOT NULL,
    slug character varying(255) NOT NULL,
    description text NOT NULL,
    rating double precision,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    is_discountable boolean NOT NULL,
    parent_id bigint,
    product_class_id bigint,
    is_public boolean NOT NULL,
    meta_description text,
    meta_title character varying(255)
);


ALTER TABLE public.catalogue_product OWNER TO oscar;

--
-- Name: catalogue_product_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_product_id_seq OWNER TO oscar;

--
-- Name: catalogue_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_product_id_seq OWNED BY public.catalogue_product.id;


--
-- Name: catalogue_product_product_options; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_product_product_options (
    id bigint NOT NULL,
    product_id bigint NOT NULL,
    option_id bigint NOT NULL
);


ALTER TABLE public.catalogue_product_product_options OWNER TO oscar;

--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_product_product_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_product_product_options_id_seq OWNER TO oscar;

--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_product_product_options_id_seq OWNED BY public.catalogue_product_product_options.id;


--
-- Name: catalogue_productattribute; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productattribute (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    type character varying(20) NOT NULL,
    required boolean NOT NULL,
    option_group_id bigint,
    product_class_id bigint
);


ALTER TABLE public.catalogue_productattribute OWNER TO oscar;

--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productattribute_id_seq OWNER TO oscar;

--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productattribute_id_seq OWNED BY public.catalogue_productattribute.id;


--
-- Name: catalogue_productattributevalue; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productattributevalue (
    id bigint NOT NULL,
    value_text text,
    value_integer integer,
    value_boolean boolean,
    value_float double precision,
    value_richtext text,
    value_date date,
    value_file character varying(255),
    value_image character varying(255),
    entity_object_id integer,
    attribute_id bigint NOT NULL,
    entity_content_type_id integer,
    product_id bigint NOT NULL,
    value_option_id bigint,
    value_datetime timestamp with time zone,
    CONSTRAINT catalogue_productattributevalue_entity_object_id_check CHECK ((entity_object_id >= 0))
);


ALTER TABLE public.catalogue_productattributevalue OWNER TO oscar;

--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productattributevalue_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productattributevalue_id_seq OWNER TO oscar;

--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productattributevalue_id_seq OWNED BY public.catalogue_productattributevalue.id;


--
-- Name: catalogue_productattributevalue_value_multi_option; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productattributevalue_value_multi_option (
    id bigint NOT NULL,
    productattributevalue_id bigint NOT NULL,
    attributeoption_id bigint NOT NULL
);


ALTER TABLE public.catalogue_productattributevalue_value_multi_option OWNER TO oscar;

--
-- Name: catalogue_productattributevalue_value_multi_option_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productattributevalue_value_multi_option_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productattributevalue_value_multi_option_id_seq OWNER TO oscar;

--
-- Name: catalogue_productattributevalue_value_multi_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productattributevalue_value_multi_option_id_seq OWNED BY public.catalogue_productattributevalue_value_multi_option.id;


--
-- Name: catalogue_productcategory; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productcategory (
    id bigint NOT NULL,
    category_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.catalogue_productcategory OWNER TO oscar;

--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productcategory_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productcategory_id_seq OWNER TO oscar;

--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productcategory_id_seq OWNED BY public.catalogue_productcategory.id;


--
-- Name: catalogue_productclass; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productclass (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    requires_shipping boolean NOT NULL,
    track_stock boolean NOT NULL
);


ALTER TABLE public.catalogue_productclass OWNER TO oscar;

--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productclass_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productclass_id_seq OWNER TO oscar;

--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productclass_id_seq OWNED BY public.catalogue_productclass.id;


--
-- Name: catalogue_productclass_options; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productclass_options (
    id bigint NOT NULL,
    productclass_id bigint NOT NULL,
    option_id bigint NOT NULL
);


ALTER TABLE public.catalogue_productclass_options OWNER TO oscar;

--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productclass_options_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productclass_options_id_seq OWNER TO oscar;

--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productclass_options_id_seq OWNED BY public.catalogue_productclass_options.id;


--
-- Name: catalogue_productimage; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productimage (
    id bigint NOT NULL,
    original character varying(255) NOT NULL,
    caption character varying(200) NOT NULL,
    display_order integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT catalogue_productimage_display_order_check CHECK ((display_order >= 0))
);


ALTER TABLE public.catalogue_productimage OWNER TO oscar;

--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productimage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productimage_id_seq OWNER TO oscar;

--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productimage_id_seq OWNED BY public.catalogue_productimage.id;


--
-- Name: catalogue_productrecommendation; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.catalogue_productrecommendation (
    id bigint NOT NULL,
    ranking smallint NOT NULL,
    primary_id bigint NOT NULL,
    recommendation_id bigint NOT NULL,
    CONSTRAINT catalogue_productrecommendation_ranking_check CHECK ((ranking >= 0))
);


ALTER TABLE public.catalogue_productrecommendation OWNER TO oscar;

--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.catalogue_productrecommendation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.catalogue_productrecommendation_id_seq OWNER TO oscar;

--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.catalogue_productrecommendation_id_seq OWNED BY public.catalogue_productrecommendation.id;


--
-- Name: communication_communicationeventtype; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.communication_communicationeventtype (
    id bigint NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(255) NOT NULL,
    category character varying(255) NOT NULL,
    email_subject_template character varying(255),
    email_body_template text,
    email_body_html_template text,
    sms_template character varying(170),
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL
);


ALTER TABLE public.communication_communicationeventtype OWNER TO oscar;

--
-- Name: communication_communicationeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.communication_communicationeventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_communicationeventtype_id_seq OWNER TO oscar;

--
-- Name: communication_communicationeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.communication_communicationeventtype_id_seq OWNED BY public.communication_communicationeventtype.id;


--
-- Name: communication_email; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.communication_email (
    id bigint NOT NULL,
    subject text NOT NULL,
    body_text text NOT NULL,
    body_html text NOT NULL,
    date_sent timestamp with time zone NOT NULL,
    user_id integer,
    email character varying(254)
);


ALTER TABLE public.communication_email OWNER TO oscar;

--
-- Name: communication_email_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.communication_email_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_email_id_seq OWNER TO oscar;

--
-- Name: communication_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.communication_email_id_seq OWNED BY public.communication_email.id;


--
-- Name: communication_notification; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.communication_notification (
    id bigint NOT NULL,
    subject character varying(255) NOT NULL,
    body text NOT NULL,
    location character varying(32) NOT NULL,
    date_sent timestamp with time zone NOT NULL,
    date_read timestamp with time zone,
    recipient_id integer NOT NULL,
    sender_id integer
);


ALTER TABLE public.communication_notification OWNER TO oscar;

--
-- Name: communication_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.communication_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_notification_id_seq OWNER TO oscar;

--
-- Name: communication_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.communication_notification_id_seq OWNED BY public.communication_notification.id;


--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.customer_communicationeventtype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_communicationeventtype_id_seq OWNER TO oscar;

--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.customer_communicationeventtype_id_seq OWNED BY public.communication_communicationeventtype.id;


--
-- Name: customer_email_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.customer_email_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_email_id_seq OWNER TO oscar;

--
-- Name: customer_email_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.customer_email_id_seq OWNED BY public.communication_email.id;


--
-- Name: customer_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.customer_notification_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_notification_id_seq OWNER TO oscar;

--
-- Name: customer_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.customer_notification_id_seq OWNED BY public.communication_notification.id;


--
-- Name: customer_productalert; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.customer_productalert (
    id bigint NOT NULL,
    email character varying(254) NOT NULL,
    key character varying(128) NOT NULL,
    status character varying(20) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_confirmed timestamp with time zone,
    date_cancelled timestamp with time zone,
    date_closed timestamp with time zone,
    product_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.customer_productalert OWNER TO oscar;

--
-- Name: customer_productalert_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.customer_productalert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_productalert_id_seq OWNER TO oscar;

--
-- Name: customer_productalert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.customer_productalert_id_seq OWNED BY public.customer_productalert.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO oscar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO oscar;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO oscar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO oscar;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_flatpage; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_flatpage (
    id integer NOT NULL,
    url character varying(100) NOT NULL,
    title character varying(200) NOT NULL,
    content text NOT NULL,
    enable_comments boolean NOT NULL,
    template_name character varying(70) NOT NULL,
    registration_required boolean NOT NULL
);


ALTER TABLE public.django_flatpage OWNER TO oscar;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_flatpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_id_seq OWNER TO oscar;

--
-- Name: django_flatpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_flatpage_id_seq OWNED BY public.django_flatpage.id;


--
-- Name: django_flatpage_sites; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_flatpage_sites (
    id bigint NOT NULL,
    flatpage_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.django_flatpage_sites OWNER TO oscar;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_flatpage_sites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_flatpage_sites_id_seq OWNER TO oscar;

--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_flatpage_sites_id_seq OWNED BY public.django_flatpage_sites.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO oscar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO oscar;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO oscar;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO oscar;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO oscar;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: easy_thumbnails_source; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.easy_thumbnails_source (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL
);


ALTER TABLE public.easy_thumbnails_source OWNER TO oscar;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.easy_thumbnails_source_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_source_id_seq OWNER TO oscar;

--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.easy_thumbnails_source_id_seq OWNED BY public.easy_thumbnails_source.id;


--
-- Name: easy_thumbnails_thumbnail; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.easy_thumbnails_thumbnail (
    id integer NOT NULL,
    storage_hash character varying(40) NOT NULL,
    name character varying(255) NOT NULL,
    modified timestamp with time zone NOT NULL,
    source_id integer NOT NULL
);


ALTER TABLE public.easy_thumbnails_thumbnail OWNER TO oscar;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.easy_thumbnails_thumbnail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnail_id_seq OWNER TO oscar;

--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.easy_thumbnails_thumbnail_id_seq OWNED BY public.easy_thumbnails_thumbnail.id;


--
-- Name: easy_thumbnails_thumbnaildimensions; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.easy_thumbnails_thumbnaildimensions (
    id integer NOT NULL,
    thumbnail_id integer NOT NULL,
    width integer,
    height integer,
    CONSTRAINT easy_thumbnails_thumbnaildimensions_height_check CHECK ((height >= 0)),
    CONSTRAINT easy_thumbnails_thumbnaildimensions_width_check CHECK ((width >= 0))
);


ALTER TABLE public.easy_thumbnails_thumbnaildimensions OWNER TO oscar;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.easy_thumbnails_thumbnaildimensions_id_seq OWNER TO oscar;

--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.easy_thumbnails_thumbnaildimensions_id_seq OWNED BY public.easy_thumbnails_thumbnaildimensions.id;


--
-- Name: offer_benefit; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_benefit (
    id bigint NOT NULL,
    type character varying(128) NOT NULL,
    value numeric(12,2),
    max_affected_items integer,
    proxy_class character varying(255),
    range_id bigint,
    CONSTRAINT offer_benefit_max_affected_items_check CHECK ((max_affected_items >= 0))
);


ALTER TABLE public.offer_benefit OWNER TO oscar;

--
-- Name: offer_benefit_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_benefit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_benefit_id_seq OWNER TO oscar;

--
-- Name: offer_benefit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_benefit_id_seq OWNED BY public.offer_benefit.id;


--
-- Name: offer_condition; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_condition (
    id bigint NOT NULL,
    type character varying(128) NOT NULL,
    value numeric(12,2),
    proxy_class character varying(255),
    range_id bigint
);


ALTER TABLE public.offer_condition OWNER TO oscar;

--
-- Name: offer_condition_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_condition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_condition_id_seq OWNER TO oscar;

--
-- Name: offer_condition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_condition_id_seq OWNED BY public.offer_condition.id;


--
-- Name: offer_conditionaloffer; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_conditionaloffer (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    offer_type character varying(128) NOT NULL,
    status character varying(64) NOT NULL,
    priority integer NOT NULL,
    start_datetime timestamp with time zone,
    end_datetime timestamp with time zone,
    max_global_applications integer,
    max_user_applications integer,
    max_basket_applications integer,
    max_discount numeric(12,2),
    total_discount numeric(12,2) NOT NULL,
    num_applications integer NOT NULL,
    num_orders integer NOT NULL,
    redirect_url character varying(200) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    benefit_id bigint NOT NULL,
    condition_id bigint NOT NULL,
    exclusive boolean NOT NULL,
    CONSTRAINT offer_conditionaloffer_max_basket_applications_check CHECK ((max_basket_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_max_global_applications_check CHECK ((max_global_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_max_user_applications_check CHECK ((max_user_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_num_applications_check CHECK ((num_applications >= 0)),
    CONSTRAINT offer_conditionaloffer_num_orders_check CHECK ((num_orders >= 0))
);


ALTER TABLE public.offer_conditionaloffer OWNER TO oscar;

--
-- Name: offer_conditionaloffer_combinations; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_conditionaloffer_combinations (
    id bigint NOT NULL,
    from_conditionaloffer_id bigint NOT NULL,
    to_conditionaloffer_id bigint NOT NULL
);


ALTER TABLE public.offer_conditionaloffer_combinations OWNER TO oscar;

--
-- Name: offer_conditionaloffer_combinations_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_conditionaloffer_combinations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_conditionaloffer_combinations_id_seq OWNER TO oscar;

--
-- Name: offer_conditionaloffer_combinations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_conditionaloffer_combinations_id_seq OWNED BY public.offer_conditionaloffer_combinations.id;


--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_conditionaloffer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_conditionaloffer_id_seq OWNER TO oscar;

--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_conditionaloffer_id_seq OWNED BY public.offer_conditionaloffer.id;


--
-- Name: offer_range; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_range (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    slug character varying(128) NOT NULL,
    description text NOT NULL,
    is_public boolean NOT NULL,
    includes_all_products boolean NOT NULL,
    proxy_class character varying(255),
    date_created timestamp with time zone NOT NULL
);


ALTER TABLE public.offer_range OWNER TO oscar;

--
-- Name: offer_range_classes; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_range_classes (
    id bigint NOT NULL,
    range_id bigint NOT NULL,
    productclass_id bigint NOT NULL
);


ALTER TABLE public.offer_range_classes OWNER TO oscar;

--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_range_classes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_range_classes_id_seq OWNER TO oscar;

--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_range_classes_id_seq OWNED BY public.offer_range_classes.id;


--
-- Name: offer_range_excluded_products; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_range_excluded_products (
    id bigint NOT NULL,
    range_id bigint NOT NULL,
    product_id bigint NOT NULL
);


ALTER TABLE public.offer_range_excluded_products OWNER TO oscar;

--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_range_excluded_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_range_excluded_products_id_seq OWNER TO oscar;

--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_range_excluded_products_id_seq OWNED BY public.offer_range_excluded_products.id;


--
-- Name: offer_range_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_range_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_range_id_seq OWNER TO oscar;

--
-- Name: offer_range_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_range_id_seq OWNED BY public.offer_range.id;


--
-- Name: offer_range_included_categories; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_range_included_categories (
    id bigint NOT NULL,
    range_id bigint NOT NULL,
    category_id bigint NOT NULL
);


ALTER TABLE public.offer_range_included_categories OWNER TO oscar;

--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_range_included_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_range_included_categories_id_seq OWNER TO oscar;

--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_range_included_categories_id_seq OWNED BY public.offer_range_included_categories.id;


--
-- Name: offer_rangeproduct; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_rangeproduct (
    id bigint NOT NULL,
    display_order integer NOT NULL,
    product_id bigint NOT NULL,
    range_id bigint NOT NULL
);


ALTER TABLE public.offer_rangeproduct OWNER TO oscar;

--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_rangeproduct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_rangeproduct_id_seq OWNER TO oscar;

--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_rangeproduct_id_seq OWNED BY public.offer_rangeproduct.id;


--
-- Name: offer_rangeproductfileupload; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.offer_rangeproductfileupload (
    id bigint NOT NULL,
    filepath character varying(255) NOT NULL,
    size integer NOT NULL,
    date_uploaded timestamp with time zone NOT NULL,
    status character varying(32) NOT NULL,
    error_message character varying(255) NOT NULL,
    date_processed timestamp with time zone,
    num_new_skus integer,
    num_unknown_skus integer,
    num_duplicate_skus integer,
    range_id bigint NOT NULL,
    uploaded_by_id integer NOT NULL,
    CONSTRAINT offer_rangeproductfileupload_num_duplicate_skus_check CHECK ((num_duplicate_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_num_new_skus_check CHECK ((num_new_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_num_unknown_skus_check CHECK ((num_unknown_skus >= 0)),
    CONSTRAINT offer_rangeproductfileupload_size_check CHECK ((size >= 0))
);


ALTER TABLE public.offer_rangeproductfileupload OWNER TO oscar;

--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.offer_rangeproductfileupload_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.offer_rangeproductfileupload_id_seq OWNER TO oscar;

--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.offer_rangeproductfileupload_id_seq OWNED BY public.offer_rangeproductfileupload.id;


--
-- Name: order_billingaddress; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_billingaddress (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE public.order_billingaddress OWNER TO oscar;

--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_billingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_billingaddress_id_seq OWNER TO oscar;

--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_billingaddress_id_seq OWNED BY public.order_billingaddress.id;


--
-- Name: order_communicationevent; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_communicationevent (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.order_communicationevent OWNER TO oscar;

--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_communicationevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_communicationevent_id_seq OWNER TO oscar;

--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_communicationevent_id_seq OWNED BY public.order_communicationevent.id;


--
-- Name: order_line; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_line (
    id bigint NOT NULL,
    partner_name character varying(128) NOT NULL,
    partner_sku character varying(128) NOT NULL,
    partner_line_reference character varying(128) NOT NULL,
    partner_line_notes text NOT NULL,
    title character varying(255) NOT NULL,
    upc character varying(128),
    quantity integer NOT NULL,
    line_price_incl_tax numeric(12,2) NOT NULL,
    line_price_excl_tax numeric(12,2) NOT NULL,
    line_price_before_discounts_incl_tax numeric(12,2) NOT NULL,
    line_price_before_discounts_excl_tax numeric(12,2) NOT NULL,
    unit_price_incl_tax numeric(12,2),
    unit_price_excl_tax numeric(12,2),
    status character varying(255) NOT NULL,
    order_id bigint NOT NULL,
    partner_id bigint,
    product_id bigint,
    stockrecord_id bigint,
    CONSTRAINT order_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_line OWNER TO oscar;

--
-- Name: order_line_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_line_id_seq OWNER TO oscar;

--
-- Name: order_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_line_id_seq OWNED BY public.order_line.id;


--
-- Name: order_lineattribute; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_lineattribute (
    id bigint NOT NULL,
    type character varying(128) NOT NULL,
    value character varying(255) NOT NULL,
    line_id bigint NOT NULL,
    option_id bigint
);


ALTER TABLE public.order_lineattribute OWNER TO oscar;

--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_lineattribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_lineattribute_id_seq OWNER TO oscar;

--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_lineattribute_id_seq OWNED BY public.order_lineattribute.id;


--
-- Name: order_lineprice; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_lineprice (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    price_incl_tax numeric(12,2) NOT NULL,
    price_excl_tax numeric(12,2) NOT NULL,
    shipping_incl_tax numeric(12,2) NOT NULL,
    shipping_excl_tax numeric(12,2) NOT NULL,
    line_id bigint NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT order_lineprice_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_lineprice OWNER TO oscar;

--
-- Name: order_lineprice_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_lineprice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_lineprice_id_seq OWNER TO oscar;

--
-- Name: order_lineprice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_lineprice_id_seq OWNED BY public.order_lineprice.id;


--
-- Name: order_order; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_order (
    id bigint NOT NULL,
    number character varying(128) NOT NULL,
    currency character varying(12) NOT NULL,
    total_incl_tax numeric(12,2) NOT NULL,
    total_excl_tax numeric(12,2) NOT NULL,
    shipping_incl_tax numeric(12,2) NOT NULL,
    shipping_excl_tax numeric(12,2) NOT NULL,
    shipping_method character varying(128) NOT NULL,
    shipping_code character varying(128) NOT NULL,
    status character varying(100) NOT NULL,
    guest_email character varying(254) NOT NULL,
    date_placed timestamp with time zone NOT NULL,
    basket_id bigint,
    billing_address_id bigint,
    shipping_address_id bigint,
    site_id integer,
    user_id integer
);


ALTER TABLE public.order_order OWNER TO oscar;

--
-- Name: order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_order_id_seq OWNER TO oscar;

--
-- Name: order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_order_id_seq OWNED BY public.order_order.id;


--
-- Name: order_orderdiscount; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_orderdiscount (
    id bigint NOT NULL,
    category character varying(64) NOT NULL,
    offer_id integer,
    offer_name character varying(128) NOT NULL,
    voucher_id integer,
    voucher_code character varying(128) NOT NULL,
    frequency integer,
    amount numeric(12,2) NOT NULL,
    message text NOT NULL,
    order_id bigint NOT NULL,
    CONSTRAINT order_orderdiscount_frequency_check CHECK ((frequency >= 0)),
    CONSTRAINT order_orderdiscount_offer_id_check CHECK ((offer_id >= 0)),
    CONSTRAINT order_orderdiscount_voucher_id_check CHECK ((voucher_id >= 0))
);


ALTER TABLE public.order_orderdiscount OWNER TO oscar;

--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_orderdiscount_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderdiscount_id_seq OWNER TO oscar;

--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_orderdiscount_id_seq OWNED BY public.order_orderdiscount.id;


--
-- Name: order_ordernote; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_ordernote (
    id bigint NOT NULL,
    note_type character varying(128) NOT NULL,
    message text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    user_id integer
);


ALTER TABLE public.order_ordernote OWNER TO oscar;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_ordernote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_ordernote_id_seq OWNER TO oscar;

--
-- Name: order_ordernote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_ordernote_id_seq OWNED BY public.order_ordernote.id;


--
-- Name: order_orderstatuschange; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_orderstatuschange (
    id bigint NOT NULL,
    old_status character varying(100) NOT NULL,
    new_status character varying(100) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.order_orderstatuschange OWNER TO oscar;

--
-- Name: order_orderstatuschange_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_orderstatuschange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_orderstatuschange_id_seq OWNER TO oscar;

--
-- Name: order_orderstatuschange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_orderstatuschange_id_seq OWNED BY public.order_orderstatuschange.id;


--
-- Name: order_paymentevent; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_paymentevent (
    id bigint NOT NULL,
    amount numeric(12,2) NOT NULL,
    reference character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id bigint NOT NULL,
    order_id bigint NOT NULL,
    shipping_event_id bigint
);


ALTER TABLE public.order_paymentevent OWNER TO oscar;

--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_paymentevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_paymentevent_id_seq OWNER TO oscar;

--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_paymentevent_id_seq OWNED BY public.order_paymentevent.id;


--
-- Name: order_paymenteventquantity; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_paymenteventquantity (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    event_id bigint NOT NULL,
    line_id bigint NOT NULL,
    CONSTRAINT order_paymenteventquantity_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_paymenteventquantity OWNER TO oscar;

--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_paymenteventquantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_paymenteventquantity_id_seq OWNER TO oscar;

--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_paymenteventquantity_id_seq OWNED BY public.order_paymenteventquantity.id;


--
-- Name: order_paymenteventtype; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_paymenteventtype (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE public.order_paymenteventtype OWNER TO oscar;

--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_paymenteventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_paymenteventtype_id_seq OWNER TO oscar;

--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_paymenteventtype_id_seq OWNED BY public.order_paymenteventtype.id;


--
-- Name: order_shippingaddress; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_shippingaddress (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    phone_number character varying(128) NOT NULL,
    notes text NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE public.order_shippingaddress OWNER TO oscar;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_shippingaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shippingaddress_id_seq OWNER TO oscar;

--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_shippingaddress_id_seq OWNED BY public.order_shippingaddress.id;


--
-- Name: order_shippingevent; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_shippingevent (
    id bigint NOT NULL,
    notes text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    event_type_id bigint NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.order_shippingevent OWNER TO oscar;

--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_shippingevent_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shippingevent_id_seq OWNER TO oscar;

--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_shippingevent_id_seq OWNED BY public.order_shippingevent.id;


--
-- Name: order_shippingeventquantity; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_shippingeventquantity (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    event_id bigint NOT NULL,
    line_id bigint NOT NULL,
    CONSTRAINT order_shippingeventquantity_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.order_shippingeventquantity OWNER TO oscar;

--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_shippingeventquantity_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shippingeventquantity_id_seq OWNER TO oscar;

--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_shippingeventquantity_id_seq OWNED BY public.order_shippingeventquantity.id;


--
-- Name: order_shippingeventtype; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_shippingeventtype (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE public.order_shippingeventtype OWNER TO oscar;

--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_shippingeventtype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_shippingeventtype_id_seq OWNER TO oscar;

--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_shippingeventtype_id_seq OWNED BY public.order_shippingeventtype.id;


--
-- Name: order_surcharge; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.order_surcharge (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    incl_tax numeric(12,2) NOT NULL,
    excl_tax numeric(12,2) NOT NULL,
    order_id bigint NOT NULL
);


ALTER TABLE public.order_surcharge OWNER TO oscar;

--
-- Name: order_surcharge_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.order_surcharge_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_surcharge_id_seq OWNER TO oscar;

--
-- Name: order_surcharge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.order_surcharge_id_seq OWNED BY public.order_surcharge.id;


--
-- Name: partner_partner; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.partner_partner (
    id bigint NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL
);


ALTER TABLE public.partner_partner OWNER TO oscar;

--
-- Name: partner_partner_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.partner_partner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_partner_id_seq OWNER TO oscar;

--
-- Name: partner_partner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.partner_partner_id_seq OWNED BY public.partner_partner.id;


--
-- Name: partner_partner_users; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.partner_partner_users (
    id bigint NOT NULL,
    partner_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.partner_partner_users OWNER TO oscar;

--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.partner_partner_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_partner_users_id_seq OWNER TO oscar;

--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.partner_partner_users_id_seq OWNED BY public.partner_partner_users.id;


--
-- Name: partner_partneraddress; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.partner_partneraddress (
    id bigint NOT NULL,
    title character varying(64) NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    line1 character varying(255) NOT NULL,
    line2 character varying(255) NOT NULL,
    line3 character varying(255) NOT NULL,
    line4 character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postcode character varying(64) NOT NULL,
    search_text text NOT NULL,
    country_id character varying(2) NOT NULL,
    partner_id bigint NOT NULL
);


ALTER TABLE public.partner_partneraddress OWNER TO oscar;

--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.partner_partneraddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_partneraddress_id_seq OWNER TO oscar;

--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.partner_partneraddress_id_seq OWNED BY public.partner_partneraddress.id;


--
-- Name: partner_stockalert; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.partner_stockalert (
    id bigint NOT NULL,
    threshold integer NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_closed timestamp with time zone,
    stockrecord_id bigint NOT NULL,
    CONSTRAINT partner_stockalert_threshold_check CHECK ((threshold >= 0))
);


ALTER TABLE public.partner_stockalert OWNER TO oscar;

--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.partner_stockalert_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_stockalert_id_seq OWNER TO oscar;

--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.partner_stockalert_id_seq OWNED BY public.partner_stockalert.id;


--
-- Name: partner_stockrecord; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.partner_stockrecord (
    id bigint NOT NULL,
    partner_sku character varying(128) NOT NULL,
    price_currency character varying(12) NOT NULL,
    price numeric(12,2),
    num_in_stock integer,
    num_allocated integer,
    low_stock_threshold integer,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    partner_id bigint NOT NULL,
    product_id bigint NOT NULL,
    CONSTRAINT partner_stockrecord_low_stock_threshold_check CHECK ((low_stock_threshold >= 0)),
    CONSTRAINT partner_stockrecord_num_in_stock_check CHECK ((num_in_stock >= 0))
);


ALTER TABLE public.partner_stockrecord OWNER TO oscar;

--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.partner_stockrecord_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.partner_stockrecord_id_seq OWNER TO oscar;

--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.partner_stockrecord_id_seq OWNED BY public.partner_stockrecord.id;


--
-- Name: payment_bankcard; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.payment_bankcard (
    id bigint NOT NULL,
    card_type character varying(128) NOT NULL,
    name character varying(255) NOT NULL,
    number character varying(32) NOT NULL,
    expiry_date date NOT NULL,
    partner_reference character varying(255) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.payment_bankcard OWNER TO oscar;

--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.payment_bankcard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_bankcard_id_seq OWNER TO oscar;

--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.payment_bankcard_id_seq OWNED BY public.payment_bankcard.id;


--
-- Name: payment_source; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.payment_source (
    id bigint NOT NULL,
    currency character varying(12) NOT NULL,
    amount_allocated numeric(12,2) NOT NULL,
    amount_debited numeric(12,2) NOT NULL,
    amount_refunded numeric(12,2) NOT NULL,
    reference character varying(255) NOT NULL,
    label character varying(128) NOT NULL,
    order_id bigint NOT NULL,
    source_type_id bigint NOT NULL
);


ALTER TABLE public.payment_source OWNER TO oscar;

--
-- Name: payment_source_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.payment_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_source_id_seq OWNER TO oscar;

--
-- Name: payment_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.payment_source_id_seq OWNED BY public.payment_source.id;


--
-- Name: payment_sourcetype; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.payment_sourcetype (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL
);


ALTER TABLE public.payment_sourcetype OWNER TO oscar;

--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.payment_sourcetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_sourcetype_id_seq OWNER TO oscar;

--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.payment_sourcetype_id_seq OWNED BY public.payment_sourcetype.id;


--
-- Name: payment_transaction; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.payment_transaction (
    id bigint NOT NULL,
    txn_type character varying(128) NOT NULL,
    amount numeric(12,2) NOT NULL,
    reference character varying(128) NOT NULL,
    status character varying(128) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    source_id bigint NOT NULL
);


ALTER TABLE public.payment_transaction OWNER TO oscar;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.payment_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payment_transaction_id_seq OWNER TO oscar;

--
-- Name: payment_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.payment_transaction_id_seq OWNED BY public.payment_transaction.id;


--
-- Name: reviews_productreview; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.reviews_productreview (
    id bigint NOT NULL,
    score smallint NOT NULL,
    title character varying(255) NOT NULL,
    body text NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(254) NOT NULL,
    homepage character varying(200) NOT NULL,
    status smallint NOT NULL,
    total_votes integer NOT NULL,
    delta_votes integer NOT NULL,
    date_created timestamp with time zone NOT NULL,
    product_id bigint,
    user_id integer
);


ALTER TABLE public.reviews_productreview OWNER TO oscar;

--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.reviews_productreview_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_productreview_id_seq OWNER TO oscar;

--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.reviews_productreview_id_seq OWNED BY public.reviews_productreview.id;


--
-- Name: reviews_vote; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.reviews_vote (
    id bigint NOT NULL,
    delta smallint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    review_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.reviews_vote OWNER TO oscar;

--
-- Name: reviews_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.reviews_vote_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reviews_vote_id_seq OWNER TO oscar;

--
-- Name: reviews_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.reviews_vote_id_seq OWNED BY public.reviews_vote.id;


--
-- Name: shipping_orderanditemcharges; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.shipping_orderanditemcharges (
    id bigint NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    price_per_order numeric(12,2) NOT NULL,
    price_per_item numeric(12,2) NOT NULL,
    free_shipping_threshold numeric(12,2)
);


ALTER TABLE public.shipping_orderanditemcharges OWNER TO oscar;

--
-- Name: shipping_orderanditemcharges_countries; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.shipping_orderanditemcharges_countries (
    id bigint NOT NULL,
    orderanditemcharges_id bigint NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE public.shipping_orderanditemcharges_countries OWNER TO oscar;

--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.shipping_orderanditemcharges_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_orderanditemcharges_countries_id_seq OWNER TO oscar;

--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.shipping_orderanditemcharges_countries_id_seq OWNED BY public.shipping_orderanditemcharges_countries.id;


--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.shipping_orderanditemcharges_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_orderanditemcharges_id_seq OWNER TO oscar;

--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.shipping_orderanditemcharges_id_seq OWNED BY public.shipping_orderanditemcharges.id;


--
-- Name: shipping_weightband; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.shipping_weightband (
    id bigint NOT NULL,
    upper_limit numeric(12,3) NOT NULL,
    charge numeric(12,2) NOT NULL,
    method_id bigint NOT NULL
);


ALTER TABLE public.shipping_weightband OWNER TO oscar;

--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.shipping_weightband_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_weightband_id_seq OWNER TO oscar;

--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.shipping_weightband_id_seq OWNED BY public.shipping_weightband.id;


--
-- Name: shipping_weightbased; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.shipping_weightbased (
    id bigint NOT NULL,
    code character varying(128) NOT NULL,
    name character varying(128) NOT NULL,
    description text NOT NULL,
    default_weight numeric(12,3) NOT NULL
);


ALTER TABLE public.shipping_weightbased OWNER TO oscar;

--
-- Name: shipping_weightbased_countries; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.shipping_weightbased_countries (
    id bigint NOT NULL,
    weightbased_id bigint NOT NULL,
    country_id character varying(2) NOT NULL
);


ALTER TABLE public.shipping_weightbased_countries OWNER TO oscar;

--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.shipping_weightbased_countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_weightbased_countries_id_seq OWNER TO oscar;

--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.shipping_weightbased_countries_id_seq OWNED BY public.shipping_weightbased_countries.id;


--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.shipping_weightbased_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_weightbased_id_seq OWNER TO oscar;

--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.shipping_weightbased_id_seq OWNED BY public.shipping_weightbased.id;


--
-- Name: thumbnail_kvstore; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.thumbnail_kvstore (
    key character varying(200) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.thumbnail_kvstore OWNER TO oscar;

--
-- Name: voucher_voucher; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.voucher_voucher (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    code character varying(128) NOT NULL,
    usage character varying(128) NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone NOT NULL,
    num_basket_additions integer NOT NULL,
    num_orders integer NOT NULL,
    total_discount numeric(12,2) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    voucher_set_id bigint,
    CONSTRAINT voucher_voucher_num_basket_additions_check CHECK ((num_basket_additions >= 0)),
    CONSTRAINT voucher_voucher_num_orders_check CHECK ((num_orders >= 0))
);


ALTER TABLE public.voucher_voucher OWNER TO oscar;

--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.voucher_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_voucher_id_seq OWNER TO oscar;

--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.voucher_voucher_id_seq OWNED BY public.voucher_voucher.id;


--
-- Name: voucher_voucher_offers; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.voucher_voucher_offers (
    id bigint NOT NULL,
    voucher_id bigint NOT NULL,
    conditionaloffer_id bigint NOT NULL
);


ALTER TABLE public.voucher_voucher_offers OWNER TO oscar;

--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.voucher_voucher_offers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_voucher_offers_id_seq OWNER TO oscar;

--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.voucher_voucher_offers_id_seq OWNED BY public.voucher_voucher_offers.id;


--
-- Name: voucher_voucherapplication; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.voucher_voucherapplication (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    order_id bigint NOT NULL,
    user_id integer,
    voucher_id bigint NOT NULL
);


ALTER TABLE public.voucher_voucherapplication OWNER TO oscar;

--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.voucher_voucherapplication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_voucherapplication_id_seq OWNER TO oscar;

--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.voucher_voucherapplication_id_seq OWNED BY public.voucher_voucherapplication.id;


--
-- Name: voucher_voucherset; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.voucher_voucherset (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    count integer NOT NULL,
    code_length integer NOT NULL,
    description text NOT NULL,
    date_created timestamp with time zone NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone NOT NULL,
    CONSTRAINT voucher_voucherset_count_69b7878e_check CHECK ((count >= 0))
);


ALTER TABLE public.voucher_voucherset OWNER TO oscar;

--
-- Name: voucher_voucherset_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.voucher_voucherset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voucher_voucherset_id_seq OWNER TO oscar;

--
-- Name: voucher_voucherset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.voucher_voucherset_id_seq OWNED BY public.voucher_voucherset.id;


--
-- Name: wishlists_line; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.wishlists_line (
    id bigint NOT NULL,
    quantity integer NOT NULL,
    title character varying(255) NOT NULL,
    product_id bigint,
    wishlist_id bigint NOT NULL,
    CONSTRAINT wishlists_line_quantity_check CHECK ((quantity >= 0))
);


ALTER TABLE public.wishlists_line OWNER TO oscar;

--
-- Name: wishlists_line_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.wishlists_line_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlists_line_id_seq OWNER TO oscar;

--
-- Name: wishlists_line_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.wishlists_line_id_seq OWNED BY public.wishlists_line.id;


--
-- Name: wishlists_wishlist; Type: TABLE; Schema: public; Owner: oscar
--

CREATE TABLE public.wishlists_wishlist (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    key character varying(6) NOT NULL,
    visibility character varying(20) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.wishlists_wishlist OWNER TO oscar;

--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE; Schema: public; Owner: oscar
--

CREATE SEQUENCE public.wishlists_wishlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.wishlists_wishlist_id_seq OWNER TO oscar;

--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: oscar
--

ALTER SEQUENCE public.wishlists_wishlist_id_seq OWNED BY public.wishlists_wishlist.id;


--
-- Name: address_useraddress id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_useraddress ALTER COLUMN id SET DEFAULT nextval('public.address_useraddress_id_seq'::regclass);


--
-- Name: analytics_productrecord id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_productrecord ALTER COLUMN id SET DEFAULT nextval('public.analytics_productrecord_id_seq'::regclass);


--
-- Name: analytics_userproductview id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userproductview ALTER COLUMN id SET DEFAULT nextval('public.analytics_userproductview_id_seq'::regclass);


--
-- Name: analytics_userrecord id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userrecord ALTER COLUMN id SET DEFAULT nextval('public.analytics_userrecord_id_seq'::regclass);


--
-- Name: analytics_usersearch id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_usersearch ALTER COLUMN id SET DEFAULT nextval('public.analytics_usersearch_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: basket_basket id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket ALTER COLUMN id SET DEFAULT nextval('public.basket_basket_id_seq'::regclass);


--
-- Name: basket_basket_vouchers id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket_vouchers ALTER COLUMN id SET DEFAULT nextval('public.basket_basket_vouchers_id_seq'::regclass);


--
-- Name: basket_line id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line ALTER COLUMN id SET DEFAULT nextval('public.basket_line_id_seq'::regclass);


--
-- Name: basket_lineattribute id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_lineattribute ALTER COLUMN id SET DEFAULT nextval('public.basket_lineattribute_id_seq'::regclass);


--
-- Name: catalogue_attributeoption id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoption ALTER COLUMN id SET DEFAULT nextval('public.catalogue_attributeoption_id_seq'::regclass);


--
-- Name: catalogue_attributeoptiongroup id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoptiongroup ALTER COLUMN id SET DEFAULT nextval('public.catalogue_attributeoptiongroup_id_seq'::regclass);


--
-- Name: catalogue_category id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_category ALTER COLUMN id SET DEFAULT nextval('public.catalogue_category_id_seq'::regclass);


--
-- Name: catalogue_option id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_option ALTER COLUMN id SET DEFAULT nextval('public.catalogue_option_id_seq'::regclass);


--
-- Name: catalogue_product id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product ALTER COLUMN id SET DEFAULT nextval('public.catalogue_product_id_seq'::regclass);


--
-- Name: catalogue_product_product_options id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product_product_options ALTER COLUMN id SET DEFAULT nextval('public.catalogue_product_product_options_id_seq'::regclass);


--
-- Name: catalogue_productattribute id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattribute ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattribute_id_seq'::regclass);


--
-- Name: catalogue_productattributevalue id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattributevalue_id_seq'::regclass);


--
-- Name: catalogue_productattributevalue_value_multi_option id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue_value_multi_option ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productattributevalue_value_multi_option_id_seq'::regclass);


--
-- Name: catalogue_productcategory id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productcategory ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productcategory_id_seq'::regclass);


--
-- Name: catalogue_productclass id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productclass_id_seq'::regclass);


--
-- Name: catalogue_productclass_options id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass_options ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productclass_options_id_seq'::regclass);


--
-- Name: catalogue_productimage id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productimage ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productimage_id_seq'::regclass);


--
-- Name: catalogue_productrecommendation id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productrecommendation ALTER COLUMN id SET DEFAULT nextval('public.catalogue_productrecommendation_id_seq'::regclass);


--
-- Name: communication_communicationeventtype id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_communicationeventtype ALTER COLUMN id SET DEFAULT nextval('public.communication_communicationeventtype_id_seq'::regclass);


--
-- Name: communication_email id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_email ALTER COLUMN id SET DEFAULT nextval('public.communication_email_id_seq'::regclass);


--
-- Name: communication_notification id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_notification ALTER COLUMN id SET DEFAULT nextval('public.communication_notification_id_seq'::regclass);


--
-- Name: customer_productalert id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.customer_productalert ALTER COLUMN id SET DEFAULT nextval('public.customer_productalert_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_flatpage id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_id_seq'::regclass);


--
-- Name: django_flatpage_sites id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage_sites ALTER COLUMN id SET DEFAULT nextval('public.django_flatpage_sites_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: easy_thumbnails_source id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_source ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_source_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnail id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnail_id_seq'::regclass);


--
-- Name: easy_thumbnails_thumbnaildimensions id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions ALTER COLUMN id SET DEFAULT nextval('public.easy_thumbnails_thumbnaildimensions_id_seq'::regclass);


--
-- Name: offer_benefit id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_benefit ALTER COLUMN id SET DEFAULT nextval('public.offer_benefit_id_seq'::regclass);


--
-- Name: offer_condition id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_condition ALTER COLUMN id SET DEFAULT nextval('public.offer_condition_id_seq'::regclass);


--
-- Name: offer_conditionaloffer id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer ALTER COLUMN id SET DEFAULT nextval('public.offer_conditionaloffer_id_seq'::regclass);


--
-- Name: offer_conditionaloffer_combinations id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer_combinations ALTER COLUMN id SET DEFAULT nextval('public.offer_conditionaloffer_combinations_id_seq'::regclass);


--
-- Name: offer_range id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range ALTER COLUMN id SET DEFAULT nextval('public.offer_range_id_seq'::regclass);


--
-- Name: offer_range_classes id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_classes ALTER COLUMN id SET DEFAULT nextval('public.offer_range_classes_id_seq'::regclass);


--
-- Name: offer_range_excluded_products id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_excluded_products ALTER COLUMN id SET DEFAULT nextval('public.offer_range_excluded_products_id_seq'::regclass);


--
-- Name: offer_range_included_categories id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_included_categories ALTER COLUMN id SET DEFAULT nextval('public.offer_range_included_categories_id_seq'::regclass);


--
-- Name: offer_rangeproduct id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproduct ALTER COLUMN id SET DEFAULT nextval('public.offer_rangeproduct_id_seq'::regclass);


--
-- Name: offer_rangeproductfileupload id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproductfileupload ALTER COLUMN id SET DEFAULT nextval('public.offer_rangeproductfileupload_id_seq'::regclass);


--
-- Name: order_billingaddress id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_billingaddress ALTER COLUMN id SET DEFAULT nextval('public.order_billingaddress_id_seq'::regclass);


--
-- Name: order_communicationevent id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_communicationevent ALTER COLUMN id SET DEFAULT nextval('public.order_communicationevent_id_seq'::regclass);


--
-- Name: order_line id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line ALTER COLUMN id SET DEFAULT nextval('public.order_line_id_seq'::regclass);


--
-- Name: order_lineattribute id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineattribute ALTER COLUMN id SET DEFAULT nextval('public.order_lineattribute_id_seq'::regclass);


--
-- Name: order_lineprice id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineprice ALTER COLUMN id SET DEFAULT nextval('public.order_lineprice_id_seq'::regclass);


--
-- Name: order_order id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order ALTER COLUMN id SET DEFAULT nextval('public.order_order_id_seq'::regclass);


--
-- Name: order_orderdiscount id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderdiscount ALTER COLUMN id SET DEFAULT nextval('public.order_orderdiscount_id_seq'::regclass);


--
-- Name: order_ordernote id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_ordernote ALTER COLUMN id SET DEFAULT nextval('public.order_ordernote_id_seq'::regclass);


--
-- Name: order_orderstatuschange id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderstatuschange ALTER COLUMN id SET DEFAULT nextval('public.order_orderstatuschange_id_seq'::regclass);


--
-- Name: order_paymentevent id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymentevent ALTER COLUMN id SET DEFAULT nextval('public.order_paymentevent_id_seq'::regclass);


--
-- Name: order_paymenteventquantity id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventquantity ALTER COLUMN id SET DEFAULT nextval('public.order_paymenteventquantity_id_seq'::regclass);


--
-- Name: order_paymenteventtype id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventtype ALTER COLUMN id SET DEFAULT nextval('public.order_paymenteventtype_id_seq'::regclass);


--
-- Name: order_shippingaddress id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingaddress ALTER COLUMN id SET DEFAULT nextval('public.order_shippingaddress_id_seq'::regclass);


--
-- Name: order_shippingevent id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingevent ALTER COLUMN id SET DEFAULT nextval('public.order_shippingevent_id_seq'::regclass);


--
-- Name: order_shippingeventquantity id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventquantity ALTER COLUMN id SET DEFAULT nextval('public.order_shippingeventquantity_id_seq'::regclass);


--
-- Name: order_shippingeventtype id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventtype ALTER COLUMN id SET DEFAULT nextval('public.order_shippingeventtype_id_seq'::regclass);


--
-- Name: order_surcharge id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_surcharge ALTER COLUMN id SET DEFAULT nextval('public.order_surcharge_id_seq'::regclass);


--
-- Name: partner_partner id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner ALTER COLUMN id SET DEFAULT nextval('public.partner_partner_id_seq'::regclass);


--
-- Name: partner_partner_users id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner_users ALTER COLUMN id SET DEFAULT nextval('public.partner_partner_users_id_seq'::regclass);


--
-- Name: partner_partneraddress id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partneraddress ALTER COLUMN id SET DEFAULT nextval('public.partner_partneraddress_id_seq'::regclass);


--
-- Name: partner_stockalert id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockalert ALTER COLUMN id SET DEFAULT nextval('public.partner_stockalert_id_seq'::regclass);


--
-- Name: partner_stockrecord id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockrecord ALTER COLUMN id SET DEFAULT nextval('public.partner_stockrecord_id_seq'::regclass);


--
-- Name: payment_bankcard id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_bankcard ALTER COLUMN id SET DEFAULT nextval('public.payment_bankcard_id_seq'::regclass);


--
-- Name: payment_source id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_source ALTER COLUMN id SET DEFAULT nextval('public.payment_source_id_seq'::regclass);


--
-- Name: payment_sourcetype id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_sourcetype ALTER COLUMN id SET DEFAULT nextval('public.payment_sourcetype_id_seq'::regclass);


--
-- Name: payment_transaction id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_transaction ALTER COLUMN id SET DEFAULT nextval('public.payment_transaction_id_seq'::regclass);


--
-- Name: reviews_productreview id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_productreview ALTER COLUMN id SET DEFAULT nextval('public.reviews_productreview_id_seq'::regclass);


--
-- Name: reviews_vote id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_vote ALTER COLUMN id SET DEFAULT nextval('public.reviews_vote_id_seq'::regclass);


--
-- Name: shipping_orderanditemcharges id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges ALTER COLUMN id SET DEFAULT nextval('public.shipping_orderanditemcharges_id_seq'::regclass);


--
-- Name: shipping_orderanditemcharges_countries id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges_countries ALTER COLUMN id SET DEFAULT nextval('public.shipping_orderanditemcharges_countries_id_seq'::regclass);


--
-- Name: shipping_weightband id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightband ALTER COLUMN id SET DEFAULT nextval('public.shipping_weightband_id_seq'::regclass);


--
-- Name: shipping_weightbased id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased ALTER COLUMN id SET DEFAULT nextval('public.shipping_weightbased_id_seq'::regclass);


--
-- Name: shipping_weightbased_countries id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased_countries ALTER COLUMN id SET DEFAULT nextval('public.shipping_weightbased_countries_id_seq'::regclass);


--
-- Name: voucher_voucher id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher ALTER COLUMN id SET DEFAULT nextval('public.voucher_voucher_id_seq'::regclass);


--
-- Name: voucher_voucher_offers id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher_offers ALTER COLUMN id SET DEFAULT nextval('public.voucher_voucher_offers_id_seq'::regclass);


--
-- Name: voucher_voucherapplication id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherapplication ALTER COLUMN id SET DEFAULT nextval('public.voucher_voucherapplication_id_seq'::regclass);


--
-- Name: voucher_voucherset id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherset ALTER COLUMN id SET DEFAULT nextval('public.voucher_voucherset_id_seq'::regclass);


--
-- Name: wishlists_line id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_line ALTER COLUMN id SET DEFAULT nextval('public.wishlists_line_id_seq'::regclass);


--
-- Name: wishlists_wishlist id; Type: DEFAULT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_wishlist ALTER COLUMN id SET DEFAULT nextval('public.wishlists_wishlist_id_seq'::regclass);


--
-- Data for Name: address_country; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.address_country (iso_3166_1_a2, iso_3166_1_a3, iso_3166_1_numeric, printable_name, name, display_order, is_shipping_country) FROM stdin;
AD	AND	020	Andorra	Principality of Andorra	0	t
AE	ARE	784	United Arab Emirates		0	t
AF	AFG	004	Afghanistan	Islamic Republic of Afghanistan	0	t
AG	ATG	028	Antigua and Barbuda		0	t
AI	AIA	660	Anguilla		0	t
AL	ALB	008	Albania	Republic of Albania	0	t
AM	ARM	051	Armenia	Republic of Armenia	0	t
AO	AGO	024	Angola	Republic of Angola	0	t
AQ	ATA	010	Antarctica		0	t
AR	ARG	032	Argentina	Argentine Republic	0	t
AS	ASM	016	American Samoa		0	t
AT	AUT	040	Austria	Republic of Austria	0	t
AU	AUS	036	Australia		0	t
AW	ABW	533	Aruba		0	t
AX	ALA	248	Åland Islands		0	t
AZ	AZE	031	Azerbaijan	Republic of Azerbaijan	0	t
BA	BIH	070	Bosnia and Herzegovina	Republic of Bosnia and Herzegovina	0	t
BB	BRB	052	Barbados		0	t
BD	BGD	050	Bangladesh	People's Republic of Bangladesh	0	t
BE	BEL	056	Belgium	Kingdom of Belgium	0	t
BF	BFA	854	Burkina Faso		0	t
BG	BGR	100	Bulgaria	Republic of Bulgaria	0	t
BH	BHR	048	Bahrain	Kingdom of Bahrain	0	t
BI	BDI	108	Burundi	Republic of Burundi	0	t
BJ	BEN	204	Benin	Republic of Benin	0	t
BL	BLM	652	Saint Barthélemy		0	t
BM	BMU	060	Bermuda		0	t
BN	BRN	096	Brunei Darussalam		0	t
BO	BOL	068	Bolivia, Plurinational State of	Plurinational State of Bolivia	0	t
BQ	BES	535	Bonaire, Sint Eustatius and Saba	Bonaire, Sint Eustatius and Saba	0	t
BR	BRA	076	Brazil	Federative Republic of Brazil	0	t
BS	BHS	044	Bahamas	Commonwealth of the Bahamas	0	t
BT	BTN	064	Bhutan	Kingdom of Bhutan	0	t
BV	BVT	074	Bouvet Island		0	t
BW	BWA	072	Botswana	Republic of Botswana	0	t
BY	BLR	112	Belarus	Republic of Belarus	0	t
BZ	BLZ	084	Belize		0	t
CA	CAN	124	Canada		0	t
CC	CCK	166	Cocos (Keeling) Islands		0	t
CD	COD	180	Congo, The Democratic Republic of the		0	t
CF	CAF	140	Central African Republic		0	t
CG	COG	178	Congo	Republic of the Congo	0	t
CH	CHE	756	Switzerland	Swiss Confederation	0	t
CI	CIV	384	Côte d'Ivoire	Republic of Côte d'Ivoire	0	t
CK	COK	184	Cook Islands		0	t
CL	CHL	152	Chile	Republic of Chile	0	t
CM	CMR	120	Cameroon	Republic of Cameroon	0	t
CN	CHN	156	China	People's Republic of China	0	t
CO	COL	170	Colombia	Republic of Colombia	0	t
CR	CRI	188	Costa Rica	Republic of Costa Rica	0	t
CU	CUB	192	Cuba	Republic of Cuba	0	t
CV	CPV	132	Cabo Verde	Republic of Cabo Verde	0	t
CW	CUW	531	Curaçao	Curaçao	0	t
CX	CXR	162	Christmas Island		0	t
CY	CYP	196	Cyprus	Republic of Cyprus	0	t
CZ	CZE	203	Czechia	Czech Republic	0	t
DE	DEU	276	Germany	Federal Republic of Germany	0	t
DJ	DJI	262	Djibouti	Republic of Djibouti	0	t
DK	DNK	208	Denmark	Kingdom of Denmark	0	t
DM	DMA	212	Dominica	Commonwealth of Dominica	0	t
DO	DOM	214	Dominican Republic		0	t
DZ	DZA	012	Algeria	People's Democratic Republic of Algeria	0	t
EC	ECU	218	Ecuador	Republic of Ecuador	0	t
EE	EST	233	Estonia	Republic of Estonia	0	t
EG	EGY	818	Egypt	Arab Republic of Egypt	0	t
EH	ESH	732	Western Sahara		0	t
ER	ERI	232	Eritrea	the State of Eritrea	0	t
ES	ESP	724	Spain	Kingdom of Spain	0	t
ET	ETH	231	Ethiopia	Federal Democratic Republic of Ethiopia	0	t
FI	FIN	246	Finland	Republic of Finland	0	t
FJ	FJI	242	Fiji	Republic of Fiji	0	t
FK	FLK	238	Falkland Islands (Malvinas)		0	t
FM	FSM	583	Micronesia, Federated States of	Federated States of Micronesia	0	t
FO	FRO	234	Faroe Islands		0	t
FR	FRA	250	France	French Republic	0	t
GA	GAB	266	Gabon	Gabonese Republic	0	t
GB	GBR	826	United Kingdom	United Kingdom of Great Britain and Northern Ireland	0	t
GD	GRD	308	Grenada		0	t
GE	GEO	268	Georgia		0	t
GF	GUF	254	French Guiana		0	t
GG	GGY	831	Guernsey		0	t
GH	GHA	288	Ghana	Republic of Ghana	0	t
GI	GIB	292	Gibraltar		0	t
GL	GRL	304	Greenland		0	t
GM	GMB	270	Gambia	Republic of the Gambia	0	t
GN	GIN	324	Guinea	Republic of Guinea	0	t
GP	GLP	312	Guadeloupe		0	t
GQ	GNQ	226	Equatorial Guinea	Republic of Equatorial Guinea	0	t
GR	GRC	300	Greece	Hellenic Republic	0	t
GS	SGS	239	South Georgia and the South Sandwich Islands		0	t
GT	GTM	320	Guatemala	Republic of Guatemala	0	t
GU	GUM	316	Guam		0	t
GW	GNB	624	Guinea-Bissau	Republic of Guinea-Bissau	0	t
GY	GUY	328	Guyana	Republic of Guyana	0	t
HK	HKG	344	Hong Kong	Hong Kong Special Administrative Region of China	0	t
HM	HMD	334	Heard Island and McDonald Islands		0	t
HN	HND	340	Honduras	Republic of Honduras	0	t
HR	HRV	191	Croatia	Republic of Croatia	0	t
HT	HTI	332	Haiti	Republic of Haiti	0	t
HU	HUN	348	Hungary	Hungary	0	t
ID	IDN	360	Indonesia	Republic of Indonesia	0	t
IE	IRL	372	Ireland		0	t
IL	ISR	376	Israel	State of Israel	0	t
IM	IMN	833	Isle of Man		0	t
IN	IND	356	India	Republic of India	0	t
IO	IOT	086	British Indian Ocean Territory		0	t
IQ	IRQ	368	Iraq	Republic of Iraq	0	t
IR	IRN	364	Iran, Islamic Republic of	Islamic Republic of Iran	0	t
IS	ISL	352	Iceland	Republic of Iceland	0	t
IT	ITA	380	Italy	Italian Republic	0	t
JE	JEY	832	Jersey		0	t
JM	JAM	388	Jamaica		0	t
JO	JOR	400	Jordan	Hashemite Kingdom of Jordan	0	t
JP	JPN	392	Japan		0	t
KE	KEN	404	Kenya	Republic of Kenya	0	t
KG	KGZ	417	Kyrgyzstan	Kyrgyz Republic	0	t
KH	KHM	116	Cambodia	Kingdom of Cambodia	0	t
KI	KIR	296	Kiribati	Republic of Kiribati	0	t
KM	COM	174	Comoros	Union of the Comoros	0	t
KN	KNA	659	Saint Kitts and Nevis		0	t
KP	PRK	408	Korea, Democratic People's Republic of	Democratic People's Republic of Korea	0	t
KR	KOR	410	Korea, Republic of		0	t
KW	KWT	414	Kuwait	State of Kuwait	0	t
KY	CYM	136	Cayman Islands		0	t
KZ	KAZ	398	Kazakhstan	Republic of Kazakhstan	0	t
LA	LAO	418	Lao People's Democratic Republic		0	t
LB	LBN	422	Lebanon	Lebanese Republic	0	t
LC	LCA	662	Saint Lucia		0	t
LI	LIE	438	Liechtenstein	Principality of Liechtenstein	0	t
LK	LKA	144	Sri Lanka	Democratic Socialist Republic of Sri Lanka	0	t
LR	LBR	430	Liberia	Republic of Liberia	0	t
LS	LSO	426	Lesotho	Kingdom of Lesotho	0	t
LT	LTU	440	Lithuania	Republic of Lithuania	0	t
LU	LUX	442	Luxembourg	Grand Duchy of Luxembourg	0	t
LV	LVA	428	Latvia	Republic of Latvia	0	t
LY	LBY	434	Libya	Libya	0	t
MA	MAR	504	Morocco	Kingdom of Morocco	0	t
MC	MCO	492	Monaco	Principality of Monaco	0	t
MD	MDA	498	Moldova, Republic of	Republic of Moldova	0	t
ME	MNE	499	Montenegro	Montenegro	0	t
MF	MAF	663	Saint Martin (French part)		0	t
MG	MDG	450	Madagascar	Republic of Madagascar	0	t
MH	MHL	584	Marshall Islands	Republic of the Marshall Islands	0	t
MK	MKD	807	North Macedonia	Republic of North Macedonia	0	t
ML	MLI	466	Mali	Republic of Mali	0	t
MM	MMR	104	Myanmar	Republic of Myanmar	0	t
MN	MNG	496	Mongolia		0	t
MO	MAC	446	Macao	Macao Special Administrative Region of China	0	t
MP	MNP	580	Northern Mariana Islands	Commonwealth of the Northern Mariana Islands	0	t
MQ	MTQ	474	Martinique		0	t
MR	MRT	478	Mauritania	Islamic Republic of Mauritania	0	t
MS	MSR	500	Montserrat		0	t
MT	MLT	470	Malta	Republic of Malta	0	t
MU	MUS	480	Mauritius	Republic of Mauritius	0	t
MV	MDV	462	Maldives	Republic of Maldives	0	t
MW	MWI	454	Malawi	Republic of Malawi	0	t
MX	MEX	484	Mexico	United Mexican States	0	t
MY	MYS	458	Malaysia		0	t
MZ	MOZ	508	Mozambique	Republic of Mozambique	0	t
NA	NAM	516	Namibia	Republic of Namibia	0	t
NC	NCL	540	New Caledonia		0	t
NE	NER	562	Niger	Republic of the Niger	0	t
NF	NFK	574	Norfolk Island		0	t
NG	NGA	566	Nigeria	Federal Republic of Nigeria	0	t
NI	NIC	558	Nicaragua	Republic of Nicaragua	0	t
NL	NLD	528	Netherlands	Kingdom of the Netherlands	0	t
NO	NOR	578	Norway	Kingdom of Norway	0	t
NP	NPL	524	Nepal	Federal Democratic Republic of Nepal	0	t
NR	NRU	520	Nauru	Republic of Nauru	0	t
NU	NIU	570	Niue	Niue	0	t
NZ	NZL	554	New Zealand		0	t
OM	OMN	512	Oman	Sultanate of Oman	0	t
PA	PAN	591	Panama	Republic of Panama	0	t
PE	PER	604	Peru	Republic of Peru	0	t
PF	PYF	258	French Polynesia		0	t
PG	PNG	598	Papua New Guinea	Independent State of Papua New Guinea	0	t
PH	PHL	608	Philippines	Republic of the Philippines	0	t
PK	PAK	586	Pakistan	Islamic Republic of Pakistan	0	t
PL	POL	616	Poland	Republic of Poland	0	t
PM	SPM	666	Saint Pierre and Miquelon		0	t
PN	PCN	612	Pitcairn		0	t
PR	PRI	630	Puerto Rico		0	t
PS	PSE	275	Palestine, State of	the State of Palestine	0	t
PT	PRT	620	Portugal	Portuguese Republic	0	t
PW	PLW	585	Palau	Republic of Palau	0	t
PY	PRY	600	Paraguay	Republic of Paraguay	0	t
QA	QAT	634	Qatar	State of Qatar	0	t
RE	REU	638	Réunion		0	t
RO	ROU	642	Romania		0	t
RS	SRB	688	Serbia	Republic of Serbia	0	t
RU	RUS	643	Russian Federation		0	t
RW	RWA	646	Rwanda	Rwandese Republic	0	t
SA	SAU	682	Saudi Arabia	Kingdom of Saudi Arabia	0	t
SB	SLB	090	Solomon Islands		0	t
SC	SYC	690	Seychelles	Republic of Seychelles	0	t
SD	SDN	729	Sudan	Republic of the Sudan	0	t
SE	SWE	752	Sweden	Kingdom of Sweden	0	t
SG	SGP	702	Singapore	Republic of Singapore	0	t
SH	SHN	654	Saint Helena, Ascension and Tristan da Cunha		0	t
SI	SVN	705	Slovenia	Republic of Slovenia	0	t
SJ	SJM	744	Svalbard and Jan Mayen		0	t
SK	SVK	703	Slovakia	Slovak Republic	0	t
SL	SLE	694	Sierra Leone	Republic of Sierra Leone	0	t
SM	SMR	674	San Marino	Republic of San Marino	0	t
SN	SEN	686	Senegal	Republic of Senegal	0	t
SO	SOM	706	Somalia	Federal Republic of Somalia	0	t
SR	SUR	740	Suriname	Republic of Suriname	0	t
SS	SSD	728	South Sudan	Republic of South Sudan	0	t
ST	STP	678	Sao Tome and Principe	Democratic Republic of Sao Tome and Principe	0	t
SV	SLV	222	El Salvador	Republic of El Salvador	0	t
SX	SXM	534	Sint Maarten (Dutch part)	Sint Maarten (Dutch part)	0	t
SY	SYR	760	Syrian Arab Republic		0	t
SZ	SWZ	748	Eswatini	Kingdom of Eswatini	0	t
TC	TCA	796	Turks and Caicos Islands		0	t
TD	TCD	148	Chad	Republic of Chad	0	t
TF	ATF	260	French Southern Territories		0	t
TG	TGO	768	Togo	Togolese Republic	0	t
TH	THA	764	Thailand	Kingdom of Thailand	0	t
TJ	TJK	762	Tajikistan	Republic of Tajikistan	0	t
TK	TKL	772	Tokelau		0	t
TL	TLS	626	Timor-Leste	Democratic Republic of Timor-Leste	0	t
TM	TKM	795	Turkmenistan		0	t
TN	TUN	788	Tunisia	Republic of Tunisia	0	t
TO	TON	776	Tonga	Kingdom of Tonga	0	t
TR	TUR	792	Turkey	Republic of Turkey	0	t
TT	TTO	780	Trinidad and Tobago	Republic of Trinidad and Tobago	0	t
TV	TUV	798	Tuvalu		0	t
TW	TWN	158	Taiwan, Province of China	Taiwan, Province of China	0	t
TZ	TZA	834	Tanzania, United Republic of	United Republic of Tanzania	0	t
UA	UKR	804	Ukraine		0	t
UG	UGA	800	Uganda	Republic of Uganda	0	t
UM	UMI	581	United States Minor Outlying Islands		0	t
US	USA	840	United States	United States of America	0	t
UY	URY	858	Uruguay	Eastern Republic of Uruguay	0	t
UZ	UZB	860	Uzbekistan	Republic of Uzbekistan	0	t
VA	VAT	336	Holy See (Vatican City State)		0	t
VC	VCT	670	Saint Vincent and the Grenadines		0	t
VE	VEN	862	Venezuela, Bolivarian Republic of	Bolivarian Republic of Venezuela	0	t
VG	VGB	092	Virgin Islands, British	British Virgin Islands	0	t
VI	VIR	850	Virgin Islands, U.S.	Virgin Islands of the United States	0	t
VN	VNM	704	Viet Nam	Socialist Republic of Viet Nam	0	t
VU	VUT	548	Vanuatu	Republic of Vanuatu	0	t
WF	WLF	876	Wallis and Futuna		0	t
WS	WSM	882	Samoa	Independent State of Samoa	0	t
YE	YEM	887	Yemen	Republic of Yemen	0	t
YT	MYT	175	Mayotte		0	t
ZA	ZAF	710	South Africa	Republic of South Africa	0	t
ZM	ZMB	894	Zambia	Republic of Zambia	0	t
ZW	ZWE	716	Zimbabwe	Republic of Zimbabwe	0	t
\.


--
-- Data for Name: address_useraddress; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.address_useraddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, phone_number, notes, is_default_for_shipping, is_default_for_billing, num_orders_as_shipping_address, hash, date_created, country_id, user_id, num_orders_as_billing_address) FROM stdin;
\.


--
-- Data for Name: analytics_productrecord; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.analytics_productrecord (id, num_views, num_basket_additions, num_purchases, score, product_id) FROM stdin;
3	1	0	0	0	85
4	1	0	0	0	8
5	0	1	0	0	179
2	4	0	0	0	205
1	4	1	0	0	209
6	2	0	0	0	208
7	1	0	0	0	186
8	1	0	0	0	190
\.


--
-- Data for Name: analytics_userproductview; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.analytics_userproductview (id, date_created, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: analytics_userrecord; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.analytics_userrecord (id, num_product_views, num_basket_additions, num_orders, num_order_lines, num_order_items, total_spent, date_last_order, user_id) FROM stdin;
\.


--
-- Data for Name: analytics_usersearch; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.analytics_usersearch (id, query, date_created, user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
28	Can view site	7	view_site
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add site	7	add_site
26	Can change site	7	change_site
27	Can delete site	7	delete_site
29	Can add flat page	8	add_flatpage
30	Can change flat page	8	change_flatpage
31	Can delete flat page	8	delete_flatpage
32	Can view flat page	8	view_flatpage
33	Can add Product record	9	add_productrecord
34	Can change Product record	9	change_productrecord
35	Can delete Product record	9	delete_productrecord
36	Can view Product record	9	view_productrecord
37	Can add User product view	10	add_userproductview
38	Can change User product view	10	change_userproductview
39	Can delete User product view	10	delete_userproductview
40	Can view User product view	10	view_userproductview
41	Can add User record	11	add_userrecord
42	Can change User record	11	change_userrecord
43	Can delete User record	11	delete_userrecord
44	Can view User record	11	view_userrecord
45	Can add User search query	12	add_usersearch
46	Can change User search query	12	change_usersearch
47	Can delete User search query	12	delete_usersearch
48	Can view User search query	12	view_usersearch
49	Can add Country	13	add_country
50	Can change Country	13	change_country
51	Can delete Country	13	delete_country
52	Can view Country	13	view_country
53	Can add User address	14	add_useraddress
54	Can change User address	14	change_useraddress
55	Can delete User address	14	delete_useraddress
56	Can view User address	14	view_useraddress
57	Can add Order and Item Charge	15	add_orderanditemcharges
58	Can change Order and Item Charge	15	change_orderanditemcharges
59	Can delete Order and Item Charge	15	delete_orderanditemcharges
60	Can view Order and Item Charge	15	view_orderanditemcharges
61	Can add Weight Band	16	add_weightband
62	Can change Weight Band	16	change_weightband
63	Can delete Weight Band	16	delete_weightband
64	Can view Weight Band	16	view_weightband
65	Can add Weight-based Shipping Method	17	add_weightbased
66	Can change Weight-based Shipping Method	17	change_weightbased
67	Can delete Weight-based Shipping Method	17	delete_weightbased
68	Can view Weight-based Shipping Method	17	view_weightbased
69	Can add Attribute option	18	add_attributeoption
70	Can change Attribute option	18	change_attributeoption
71	Can delete Attribute option	18	delete_attributeoption
72	Can view Attribute option	18	view_attributeoption
73	Can add Attribute option group	19	add_attributeoptiongroup
74	Can change Attribute option group	19	change_attributeoptiongroup
75	Can delete Attribute option group	19	delete_attributeoptiongroup
76	Can view Attribute option group	19	view_attributeoptiongroup
77	Can add Category	20	add_category
78	Can change Category	20	change_category
79	Can delete Category	20	delete_category
80	Can view Category	20	view_category
81	Can add Option	21	add_option
82	Can change Option	21	change_option
83	Can delete Option	21	delete_option
84	Can view Option	21	view_option
85	Can add Product	22	add_product
86	Can change Product	22	change_product
87	Can delete Product	22	delete_product
88	Can view Product	22	view_product
89	Can add Product attribute	23	add_productattribute
90	Can change Product attribute	23	change_productattribute
91	Can delete Product attribute	23	delete_productattribute
92	Can view Product attribute	23	view_productattribute
93	Can add Product attribute value	24	add_productattributevalue
94	Can change Product attribute value	24	change_productattributevalue
95	Can delete Product attribute value	24	delete_productattributevalue
96	Can view Product attribute value	24	view_productattributevalue
97	Can add Product category	25	add_productcategory
98	Can change Product category	25	change_productcategory
99	Can delete Product category	25	delete_productcategory
100	Can view Product category	25	view_productcategory
101	Can add Product class	26	add_productclass
102	Can change Product class	26	change_productclass
103	Can delete Product class	26	delete_productclass
104	Can view Product class	26	view_productclass
105	Can add Product image	27	add_productimage
106	Can change Product image	27	change_productimage
107	Can delete Product image	27	delete_productimage
108	Can view Product image	27	view_productimage
109	Can add Product recommendation	28	add_productrecommendation
110	Can change Product recommendation	28	change_productrecommendation
111	Can delete Product recommendation	28	delete_productrecommendation
112	Can view Product recommendation	28	view_productrecommendation
113	Can add Product review	29	add_productreview
114	Can change Product review	29	change_productreview
115	Can delete Product review	29	delete_productreview
116	Can view Product review	29	view_productreview
117	Can add Vote	30	add_vote
118	Can change Vote	30	change_vote
119	Can delete Vote	30	delete_vote
120	Can view Vote	30	view_vote
121	Can add Communication event type	31	add_communicationeventtype
122	Can change Communication event type	31	change_communicationeventtype
123	Can delete Communication event type	31	delete_communicationeventtype
124	Can view Communication event type	31	view_communicationeventtype
125	Can add Email	32	add_email
126	Can change Email	32	change_email
127	Can delete Email	32	delete_email
128	Can view Email	32	view_email
129	Can add Notification	33	add_notification
130	Can change Notification	33	change_notification
131	Can delete Notification	33	delete_notification
132	Can view Notification	33	view_notification
133	Can add Fulfillment partner	34	add_partner
134	Can change Fulfillment partner	34	change_partner
135	Can delete Fulfillment partner	34	delete_partner
136	Can view Fulfillment partner	34	view_partner
137	Can access dashboard	34	dashboard_access
138	Can add Partner address	35	add_partneraddress
139	Can change Partner address	35	change_partneraddress
140	Can delete Partner address	35	delete_partneraddress
141	Can view Partner address	35	view_partneraddress
142	Can add Stock alert	36	add_stockalert
143	Can change Stock alert	36	change_stockalert
144	Can delete Stock alert	36	delete_stockalert
145	Can view Stock alert	36	view_stockalert
146	Can add Stock record	37	add_stockrecord
147	Can change Stock record	37	change_stockrecord
148	Can delete Stock record	37	delete_stockrecord
149	Can view Stock record	37	view_stockrecord
150	Can add Basket	38	add_basket
151	Can change Basket	38	change_basket
152	Can delete Basket	38	delete_basket
153	Can view Basket	38	view_basket
154	Can add Basket line	39	add_line
155	Can change Basket line	39	change_line
156	Can delete Basket line	39	delete_line
157	Can view Basket line	39	view_line
158	Can add Line attribute	40	add_lineattribute
159	Can change Line attribute	40	change_lineattribute
160	Can delete Line attribute	40	delete_lineattribute
161	Can view Line attribute	40	view_lineattribute
162	Can add Bankcard	41	add_bankcard
163	Can change Bankcard	41	change_bankcard
164	Can delete Bankcard	41	delete_bankcard
165	Can view Bankcard	41	view_bankcard
166	Can add Source	42	add_source
167	Can change Source	42	change_source
168	Can delete Source	42	delete_source
169	Can view Source	42	view_source
170	Can add Source Type	43	add_sourcetype
171	Can change Source Type	43	change_sourcetype
172	Can delete Source Type	43	delete_sourcetype
173	Can view Source Type	43	view_sourcetype
174	Can add Transaction	44	add_transaction
175	Can change Transaction	44	change_transaction
176	Can delete Transaction	44	delete_transaction
177	Can view Transaction	44	view_transaction
178	Can add Benefit	45	add_benefit
179	Can change Benefit	45	change_benefit
180	Can delete Benefit	45	delete_benefit
181	Can view Benefit	45	view_benefit
182	Can add Condition	46	add_condition
183	Can change Condition	46	change_condition
184	Can delete Condition	46	delete_condition
185	Can view Condition	46	view_condition
186	Can add Conditional offer	47	add_conditionaloffer
187	Can change Conditional offer	47	change_conditionaloffer
188	Can delete Conditional offer	47	delete_conditionaloffer
189	Can view Conditional offer	47	view_conditionaloffer
190	Can add Range	48	add_range
191	Can change Range	48	change_range
192	Can delete Range	48	delete_range
193	Can view Range	48	view_range
194	Can add range product	49	add_rangeproduct
195	Can change range product	49	change_rangeproduct
196	Can delete range product	49	delete_rangeproduct
197	Can view range product	49	view_rangeproduct
198	Can add Range Product Uploaded File	50	add_rangeproductfileupload
199	Can change Range Product Uploaded File	50	change_rangeproductfileupload
200	Can delete Range Product Uploaded File	50	delete_rangeproductfileupload
201	Can view Range Product Uploaded File	50	view_rangeproductfileupload
202	Can add Absolute discount benefit	51	add_absolutediscountbenefit
203	Can change Absolute discount benefit	51	change_absolutediscountbenefit
204	Can delete Absolute discount benefit	51	delete_absolutediscountbenefit
205	Can view Absolute discount benefit	51	view_absolutediscountbenefit
206	Can add Count condition	52	add_countcondition
207	Can change Count condition	52	change_countcondition
208	Can delete Count condition	52	delete_countcondition
209	Can view Count condition	52	view_countcondition
210	Can add Coverage Condition	53	add_coveragecondition
211	Can change Coverage Condition	53	change_coveragecondition
212	Can delete Coverage Condition	53	delete_coveragecondition
213	Can view Coverage Condition	53	view_coveragecondition
214	Can add Fixed price benefit	54	add_fixedpricebenefit
215	Can change Fixed price benefit	54	change_fixedpricebenefit
216	Can delete Fixed price benefit	54	delete_fixedpricebenefit
217	Can view Fixed price benefit	54	view_fixedpricebenefit
218	Can add Multibuy discount benefit	55	add_multibuydiscountbenefit
219	Can change Multibuy discount benefit	55	change_multibuydiscountbenefit
220	Can delete Multibuy discount benefit	55	delete_multibuydiscountbenefit
221	Can view Multibuy discount benefit	55	view_multibuydiscountbenefit
222	Can add Percentage discount benefit	56	add_percentagediscountbenefit
223	Can change Percentage discount benefit	56	change_percentagediscountbenefit
224	Can delete Percentage discount benefit	56	delete_percentagediscountbenefit
225	Can view Percentage discount benefit	56	view_percentagediscountbenefit
226	Can add shipping benefit	57	add_shippingbenefit
227	Can change shipping benefit	57	change_shippingbenefit
228	Can delete shipping benefit	57	delete_shippingbenefit
229	Can view shipping benefit	57	view_shippingbenefit
230	Can add Shipping absolute discount benefit	58	add_shippingabsolutediscountbenefit
231	Can change Shipping absolute discount benefit	58	change_shippingabsolutediscountbenefit
232	Can delete Shipping absolute discount benefit	58	delete_shippingabsolutediscountbenefit
233	Can view Shipping absolute discount benefit	58	view_shippingabsolutediscountbenefit
234	Can add Fixed price shipping benefit	59	add_shippingfixedpricebenefit
235	Can change Fixed price shipping benefit	59	change_shippingfixedpricebenefit
236	Can delete Fixed price shipping benefit	59	delete_shippingfixedpricebenefit
237	Can view Fixed price shipping benefit	59	view_shippingfixedpricebenefit
238	Can add Shipping percentage discount benefit	60	add_shippingpercentagediscountbenefit
239	Can change Shipping percentage discount benefit	60	change_shippingpercentagediscountbenefit
240	Can delete Shipping percentage discount benefit	60	delete_shippingpercentagediscountbenefit
241	Can view Shipping percentage discount benefit	60	view_shippingpercentagediscountbenefit
242	Can add Value condition	61	add_valuecondition
243	Can change Value condition	61	change_valuecondition
244	Can delete Value condition	61	delete_valuecondition
245	Can view Value condition	61	view_valuecondition
246	Can add Billing address	62	add_billingaddress
247	Can change Billing address	62	change_billingaddress
248	Can delete Billing address	62	delete_billingaddress
249	Can view Billing address	62	view_billingaddress
250	Can add Communication Event	63	add_communicationevent
251	Can change Communication Event	63	change_communicationevent
252	Can delete Communication Event	63	delete_communicationevent
253	Can view Communication Event	63	view_communicationevent
254	Can add Order Line	64	add_line
255	Can change Order Line	64	change_line
256	Can delete Order Line	64	delete_line
257	Can view Order Line	64	view_line
258	Can add Line Attribute	65	add_lineattribute
259	Can change Line Attribute	65	change_lineattribute
260	Can delete Line Attribute	65	delete_lineattribute
261	Can view Line Attribute	65	view_lineattribute
262	Can add Line Price	66	add_lineprice
263	Can change Line Price	66	change_lineprice
264	Can delete Line Price	66	delete_lineprice
265	Can view Line Price	66	view_lineprice
266	Can add Order	67	add_order
267	Can change Order	67	change_order
268	Can delete Order	67	delete_order
269	Can view Order	67	view_order
270	Can add Order Discount	68	add_orderdiscount
271	Can change Order Discount	68	change_orderdiscount
272	Can delete Order Discount	68	delete_orderdiscount
273	Can view Order Discount	68	view_orderdiscount
274	Can add Order Note	69	add_ordernote
275	Can change Order Note	69	change_ordernote
276	Can delete Order Note	69	delete_ordernote
277	Can view Order Note	69	view_ordernote
278	Can add Payment Event	70	add_paymentevent
279	Can change Payment Event	70	change_paymentevent
280	Can delete Payment Event	70	delete_paymentevent
281	Can view Payment Event	70	view_paymentevent
282	Can add Payment Event Quantity	71	add_paymenteventquantity
283	Can change Payment Event Quantity	71	change_paymenteventquantity
284	Can delete Payment Event Quantity	71	delete_paymenteventquantity
285	Can view Payment Event Quantity	71	view_paymenteventquantity
286	Can add Payment Event Type	72	add_paymenteventtype
287	Can change Payment Event Type	72	change_paymenteventtype
288	Can delete Payment Event Type	72	delete_paymenteventtype
289	Can view Payment Event Type	72	view_paymenteventtype
290	Can add Shipping address	73	add_shippingaddress
291	Can change Shipping address	73	change_shippingaddress
292	Can delete Shipping address	73	delete_shippingaddress
293	Can view Shipping address	73	view_shippingaddress
294	Can add Shipping Event	74	add_shippingevent
295	Can change Shipping Event	74	change_shippingevent
296	Can delete Shipping Event	74	delete_shippingevent
297	Can view Shipping Event	74	view_shippingevent
298	Can add Shipping Event Quantity	75	add_shippingeventquantity
299	Can change Shipping Event Quantity	75	change_shippingeventquantity
300	Can delete Shipping Event Quantity	75	delete_shippingeventquantity
301	Can view Shipping Event Quantity	75	view_shippingeventquantity
302	Can add Shipping Event Type	76	add_shippingeventtype
303	Can change Shipping Event Type	76	change_shippingeventtype
304	Can delete Shipping Event Type	76	delete_shippingeventtype
305	Can view Shipping Event Type	76	view_shippingeventtype
306	Can add Order Status Change	77	add_orderstatuschange
307	Can change Order Status Change	77	change_orderstatuschange
308	Can delete Order Status Change	77	delete_orderstatuschange
309	Can view Order Status Change	77	view_orderstatuschange
310	Can add surcharge	78	add_surcharge
311	Can change surcharge	78	change_surcharge
312	Can delete surcharge	78	delete_surcharge
313	Can view surcharge	78	view_surcharge
314	Can add Product alert	79	add_productalert
315	Can change Product alert	79	change_productalert
316	Can delete Product alert	79	delete_productalert
317	Can view Product alert	79	view_productalert
318	Can add Voucher	80	add_voucher
319	Can change Voucher	80	change_voucher
320	Can delete Voucher	80	delete_voucher
321	Can view Voucher	80	view_voucher
322	Can add Voucher Application	81	add_voucherapplication
323	Can change Voucher Application	81	change_voucherapplication
324	Can delete Voucher Application	81	delete_voucherapplication
325	Can view Voucher Application	81	view_voucherapplication
326	Can add VoucherSet	82	add_voucherset
327	Can change VoucherSet	82	change_voucherset
328	Can delete VoucherSet	82	delete_voucherset
329	Can view VoucherSet	82	view_voucherset
330	Can add Wish list line	83	add_line
331	Can change Wish list line	83	change_line
332	Can delete Wish list line	83	delete_line
333	Can view Wish list line	83	view_line
334	Can add Wish List	84	add_wishlist
335	Can change Wish List	84	change_wishlist
336	Can delete Wish List	84	delete_wishlist
337	Can view Wish List	84	view_wishlist
338	Can add kv store	85	add_kvstore
339	Can change kv store	85	change_kvstore
340	Can delete kv store	85	delete_kvstore
341	Can view kv store	85	view_kvstore
342	Can add source	86	add_source
343	Can change source	86	change_source
344	Can delete source	86	delete_source
345	Can view source	86	view_source
346	Can add thumbnail	87	add_thumbnail
347	Can change thumbnail	87	change_thumbnail
348	Can delete thumbnail	87	delete_thumbnail
349	Can view thumbnail	87	view_thumbnail
350	Can add thumbnail dimensions	88	add_thumbnaildimensions
351	Can change thumbnail dimensions	88	change_thumbnaildimensions
352	Can delete thumbnail dimensions	88	delete_thumbnaildimensions
353	Can view thumbnail dimensions	88	view_thumbnaildimensions
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$10000$ZMgucNrRNjms$6GCMZaItv61aATkdd6+qA1banOUPrxF2P0rCkLqVRSk=	2012-09-12 17:13:49+00	t	superuser			superuser@example.com	t	t	2012-09-12 17:00:02+00
2	pbkdf2_sha256$10000$EhDNXhiM1P6f$eVSrbJxxdsflcd9Cl9ysN13lQHR/EtRPgp5+ZRRDZgU=	2012-09-12 17:11:20+00	f	staff			staff@example.com	t	t	2012-09-12 17:08:56+00
3	pbkdf2_sha256$260000$vcZvBzgeML4GHWo3mWHut9$uJpXk0BSYtLMexmFjns434WNwNzOZprwOk96vlxQ9Ns=	2021-12-02 02:22:40.208499+00	t	walt			wparkman@protonmail.com	t	t	2021-11-29 22:35:33.127381+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: basket_basket; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.basket_basket (id, status, date_created, date_merged, date_submitted, owner_id) FROM stdin;
1	Open	2021-11-12 19:05:49.087+00	\N	\N	1
2	Open	2021-11-16 19:15:18.446011+00	\N	\N	\N
3	Open	2021-11-27 04:15:03.198796+00	\N	\N	\N
\.


--
-- Data for Name: basket_basket_vouchers; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.basket_basket_vouchers (id, basket_id, voucher_id) FROM stdin;
\.


--
-- Data for Name: basket_line; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.basket_line (id, line_reference, quantity, price_currency, price_excl_tax, price_incl_tax, date_created, basket_id, product_id, stockrecord_id, date_updated) FROM stdin;
1	179_173	1	GBP	2.99	2.99	2021-11-16 19:15:18.454245+00	2	179	173	2021-11-16 19:15:18.454273+00
2	209_203	1	GBP	9.99	9.99	2021-11-27 04:15:03.210575+00	3	209	203	2021-11-27 04:15:03.210599+00
\.


--
-- Data for Name: basket_lineattribute; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.basket_lineattribute (id, value, line_id, option_id) FROM stdin;
\.


--
-- Data for Name: catalogue_attributeoption; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_attributeoption (id, option, group_id) FROM stdin;
1	Small	1
2	Medium	1
3	Large	1
\.


--
-- Data for Name: catalogue_attributeoptiongroup; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_attributeoptiongroup (id, name) FROM stdin;
1	Sizes
\.


--
-- Data for Name: catalogue_category; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_category (id, path, depth, numchild, name, description, image, slug, ancestors_are_public, is_public, meta_description, meta_title) FROM stdin;
1	0001	1	0	Clothing			clothing	t	t	\N	\N
2	0002	1	2	Books			books	t	t	\N	\N
3	00020001	2	1	Fiction			fiction	t	t	\N	\N
4	000200010001	3	0	Computers in Literature			computers-in-literature	t	t	\N	\N
5	00020002	2	2	Non-Fiction			non-fiction	t	t	\N	\N
6	000200020001	3	0	Essential programming			essential-programming	t	t	\N	\N
7	000200020002	3	0	Hacking			hacking	t	t	\N	\N
\.


--
-- Data for Name: catalogue_option; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_option (id, name, code, type, required) FROM stdin;
\.


--
-- Data for Name: catalogue_product; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_product (id, structure, upc, title, slug, description, rating, date_created, date_updated, is_discountable, parent_id, product_class_id, is_public, meta_description, meta_title) FROM stdin;
1	parent	\N	Oscar T-shirt	oscar-t-shirt		\N	2013-12-12 16:33:57.426+00	2013-12-12 16:33:57.426+00	t	\N	1	t	\N	\N
2	child	\N		oscar-t-shirt		\N	2013-12-12 16:34:14.023+00	2013-12-12 16:34:14.023+00	t	1	\N	t	\N	\N
3	child	\N		oscar-t-shirt		\N	2013-12-12 16:34:32.17+00	2013-12-12 16:34:32.17+00	t	1	\N	t	\N	\N
4	child	\N		oscar-t-shirt		\N	2013-12-12 17:32:15.016+00	2013-12-12 17:32:15.016+00	t	1	\N	t	\N	\N
5	parent	\N	commandlinefu T-shirt	commandlinefu-t-shirt		\N	2013-12-13 11:34:21.81+00	2013-12-13 11:34:21.81+00	t	\N	1	t	\N	\N
6	child	\N		commandlinefu-t-shirt		\N	2013-12-13 11:37:08.138+00	2013-12-13 11:37:08.138+00	t	5	\N	t	\N	\N
7	child	\N		commandlinefu-t-shirt		\N	2013-12-13 11:37:45.834+00	2013-12-13 11:37:45.834+00	t	5	\N	t	\N	\N
8	parent	\N	Django T-shirt	django-t-shirt		\N	2013-12-13 11:38:15.107+00	2013-12-13 11:38:15.107+00	t	\N	1	t	\N	\N
9	child	\N		django-t-shirt		\N	2013-12-13 11:38:49.769+00	2013-12-13 11:38:49.769+00	t	8	\N	t	\N	\N
10	child	\N		django-t-shirt		\N	2013-12-13 11:39:12.859+00	2013-12-13 11:39:12.859+00	t	8	\N	t	\N	\N
11	child	\N		django-t-shirt		\N	2013-12-13 11:39:53.073+00	2013-12-13 11:39:53.073+00	t	8	\N	t	\N	\N
12	standalone	9780553380958	Snow Crash	snow-crash	Neal Stephenson is such a writer and Snow Crash is such a novel, weaving virtual reality, Sumerian myth, and just about everything in between with a cool, hip cybersensibility to bring us the gigathriller of the information age.	\N	2021-11-13 21:23:41.009+00	2021-11-13 21:23:44.232+00	t	\N	2	t	\N	\N
13	standalone	9780441569595	Neuromancer.	neuromancer	Case, a burned out computer whiz, is asked to steal a security code that is locked in the most heavily guarded databank in the solar system	\N	2021-11-13 21:23:41.052+00	2021-11-13 21:23:41.052+00	t	\N	2	t	\N	\N
14	standalone	9780060512804	Cryptonomicon	cryptonomicon	With this extraordinary first volume in what promises to be an epoch-making masterpiece, Neal Stephenson hacks into the secret histories of nations and the private obsessions of men, decrypting with dazzling virtuosity the forces that ...	\N	2021-11-13 21:23:41.071+00	2021-11-13 21:23:41.071+00	t	\N	2	t	\N	\N
15	standalone	9780345391803	The Hitchhiker's Guide to the Galaxy	the-hitchhikers-guide-to-the-galaxy	Chronicles the journeys, notions, and acquaintances of reluctant galactic traveler Arthur Dent, accompanied by never-before-published material from the late author's archives as well as commentary by famous fans.	\N	2021-11-13 21:23:41.089+00	2021-11-13 21:23:41.089+00	t	\N	2	t	\N	\N
16	standalone	9780553382563	I, Robot	i-robot	A classic collection of interlocking tales chronicles the near-future development of the robot and features models that have the ability to read minds, experience human emotions, and take over the world--and, perhaps, render humankind ...	\N	2021-11-13 21:23:41.107+00	2021-11-13 21:23:41.107+00	t	\N	2	t	\N	\N
17	standalone	9780340837948	The Moon is a Harsh Mistress	the-moon-is-a-harsh-mistress	The moon in 2075.	\N	2021-11-13 21:23:41.125+00	2021-11-13 21:23:41.125+00	t	\N	2	t	\N	\N
18	standalone	9780525951117	Daemon	daemon	In a near-future run by thousands of autonomous computer programs that control the world's wireless networks, a dormant program activates in the wake of a legendary game designer's premature death and launches a sinister effort to dismantle ...	\N	2021-11-13 21:23:41.144+00	2021-11-13 21:23:41.144+00	t	\N	2	t	\N	\N
19	standalone	9780451457998	2001	2001	The epic novel of human transformation that inspired the Stanley Kubrick film delves into the origin of the species, alien visitation, and the future of humankind. Reissue.	\N	2021-11-13 21:23:41.162+00	2021-11-13 21:23:41.162+00	t	\N	2	t	\N	\N
20	standalone	9780905712826	2001	2001		\N	2021-11-13 21:23:41.18+00	2021-11-13 21:23:41.18+00	t	\N	2	t	\N	\N
21	standalone	9780385333788	Player Piano	player-piano	Vonnegut’s first novel spins the chilling tale of engineer Paul Proteus, who must find a way to live in a world dominated by a super computer and run completely by machines.	\N	2021-11-13 21:23:41.198+00	2021-11-13 21:23:41.198+00	t	\N	2	t	\N	\N
22	standalone	9780553294613	The Difference Engine	the-difference-engine	In London of 1855, celebrated paleontologist Edward Mallory gets mixed up with Charles Babbage, the inventor of an advanced calculating machine run by his elite group of clackers	\N	2021-11-13 21:23:41.217+00	2021-11-13 21:23:41.217+00	t	\N	2	t	\N	\N
23	standalone	9780060987046	Microserfs	microserfs	A novel of life in the nineties explores the world of computer giant Microsoft, viewing it as a microcosm of modern society Microserfs: a hilarious, fanatically detailed, and oddly moving book about a handful of misfit Microsoft employees ...	\N	2021-11-13 21:23:41.236+00	2021-11-13 21:23:41.236+00	t	\N	2	t	\N	\N
24	standalone	9780525951575	Freedom	freedom	After the outbreak of a brutal civil war in the American Midwest stemming from the Daemon's civilization-rebuilding activities, reluctant Daemon operative Pete Sebeck leads a small band of enlightened humans in an effort to protect the new ...	\N	2021-11-13 21:23:41.254+00	2021-11-13 21:23:41.254+00	t	\N	2	t	\N	\N
25	standalone	9780345331199	The Robot Novels	the-robot-novels	Lije Baley and R. Daneel Olivaw, a robot, investigate the murders of a famous robotocist, an isolated inhabitant of Solaria, and Jander Panell, an advanced robot	\N	2021-11-13 21:23:41.272+00	2021-11-13 21:23:41.272+00	t	\N	2	t	\N	\N
26	standalone	9780684833392	Catch-22	catch-22	Presents the contemporary classic depicting the struggles of a United States airman attempting to survive the lunacy and depravity of a World War II airbase.	\N	2021-11-13 21:23:41.29+00	2021-11-13 21:23:41.29+00	t	\N	2	t	\N	\N
27	standalone	9780450055508	Tron	tron		\N	2021-11-13 21:23:41.31+00	2021-11-13 21:23:41.31+00	t	\N	2	t	\N	\N
28	standalone	9780307887436	Cart's Top 200 Adult Books for Young Adults: Two Decades in Review	carts-top-200-adult-books-for-young-adults-two-decades-in-review	ISBN: 9780307887436. SPEC, HUM Welcome to the year 2044, a grandly   dystopian future where kids like Wade live a largely virtual existence thanks to   global warming. Wade lives in a kind of ghetto area called the Stacks, for the   stacks of ...	\N	2021-11-13 21:23:41.33+00	2021-11-13 21:23:41.33+00	t	\N	2	t	\N	\N
29	standalone	9780765319852	Little Brother	little-brother	Zit took the fore. “We seem to have gotten off to a bad start. We identified your son   as someone with a nonstandard public transit usage pattern,as part of a new   proactive enforcement program. When we spot people whose travels are unusual  , ...	\N	2021-11-13 21:23:41.348+00	2021-11-13 21:23:44.078+00	t	\N	2	t	\N	\N
30	standalone	9780765348272	Old Man's War	old-mans-war	A first novel. By the author of The Rough Guide to the Universe. Reprint.	\N	2021-11-13 21:23:41.367+00	2021-11-13 21:23:41.367+00	t	\N	2	t	\N	\N
31	standalone	9781429963947	Speaker for the Dead	speaker-for-the-dead	In the aftermath of his terrible war, Ender Wiggin disappeared, and a powerful voice arose: The Speaker for the Dead, who told the true story of the Bugger War.	\N	2021-11-13 21:23:41.387+00	2021-11-13 21:23:41.387+00	t	\N	2	t	\N	\N
32	standalone	9781409903291	The Machine Stops (Dodo Press)	the-machine-stops-dodo-press	He achieved his greatest success with A Passage to India (1924). The novel takes as its subject the relationship between East and West, seen through the lens of India in the later days of the British Raj.	\N	2021-11-13 21:23:41.406+00	2021-11-13 21:23:41.406+00	t	\N	2	t	\N	\N
33	standalone	9780441013678	Count Zero	count-zero	In the future world of the Sprawl, an urban complex that extends from Boston to Houston, where a sentient computer database known as the Cyberspace matrix dominates humanity's fate, a corporate mercenary, awakening in a reconstructed body, ...	\N	2021-11-13 21:23:41.426+00	2021-11-13 21:23:41.426+00	t	\N	2	t	\N	\N
34	standalone	9780553380965	The diamond age	the-diamond-age	The story of an engineer who creates a device to raise a girl capable of thinking for herself reveals what happens when a young girl of the poor underclass obtains the device.	\N	2021-11-13 21:23:41.448+00	2021-11-13 21:23:41.448+00	t	\N	2	t	\N	\N
35	standalone	9780345467171	The Shockwave Riders	the-shockwave-riders		\N	2021-11-13 21:23:41.467+00	2021-11-13 21:23:41.467+00	t	\N	2	t	\N	\N
36	standalone	9780385533850	Robopocalypse	robopocalypse	Two decades into the future humans are battling for their very survival when a powerful AI computer goes rogue, and all the machines on earth rebel against their human controllers.	\N	2021-11-13 21:23:41.486+00	2021-11-13 21:23:41.486+00	t	\N	2	t	\N	\N
37	standalone	9780691147543	The Silicon Jungle	the-silicon-jungle	Baluja tells a story about something that could happen to any of us--if you're even modestly concerned about information privacy, this is an important book to read.	\N	2021-11-13 21:23:41.505+00	2021-11-13 21:23:41.505+00	t	\N	2	t	\N	\N
38	standalone	9780307594778	Stieg Larsson's Millennium Trilogy Bundle	stieg-larssons-millennium-trilogy-bundle	Stieg Larsson’s Millennium Trilogy is now available in a complete hardcover set.	\N	2021-11-13 21:23:41.524+00	2021-11-13 21:23:41.524+00	t	\N	2	t	\N	\N
39	standalone	9780425198681	Pattern Recognition	pattern-recognition	Hired to investigate a mysterious video collection that has been appearing on the Internet, market research consultant Cayce Pollard realizes that there is more to the assignment when her computer is hacked. Reprint.	\N	2021-11-13 21:23:41.543+00	2021-11-13 21:23:41.543+00	t	\N	2	t	\N	\N
40	standalone	9780441016792	WWW	www	Receiving an implant to restore her sight, math genius Caitlin's life is changed in ways she could have never imagined when she suddenly begins to see a world beyond reality and an incredible realm that others cannot.	\N	2021-11-13 21:23:41.561+00	2021-11-13 21:23:41.561+00	t	\N	2	t	\N	\N
41	standalone	9781450556569	A Terrace on the Tower of Babel	a-terrace-on-the-tower-of-babel	Delve deep into its provocative and compelling depths or float along at the surface and enjoy it in either case - this is a story you'll never forget!	\N	2021-11-13 21:23:41.58+00	2021-11-13 21:23:41.58+00	t	\N	2	t	\N	\N
42	standalone	9780552151696	Digital Fortress	digital-fortress	DIGITAL FORTRESS Dan Brown El CORGI BOOKS DIGITAL FORTRESS A   CORGI BOOK: 9780552151696 First publication in Great.	\N	2021-11-13 21:23:41.599+00	2021-11-13 21:23:41.599+00	t	\N	2	t	\N	\N
43	standalone	9780763622596	Feed	feed	In a future where most people have computer implants in their heads to control their environment, Titus meets Violet, an unusual teenage girl who is in serious trouble.	\N	2021-11-13 21:23:41.619+00	2021-11-13 21:23:41.619+00	t	\N	2	t	\N	\N
44	standalone	9780804115483	Enigma	enigma	A fictional account of the desperate efforts to break the Nazi's Enigma code takes place in a British railway town, a struggle that becomes complicated by the pivotal disappearance of a beautiful cryptographer --The Orlando Sentinel As an ...	\N	2021-11-13 21:23:41.639+00	2021-11-13 21:23:41.639+00	t	\N	2	t	\N	\N
45	standalone	9780441363957	I Have No Mouth	i-have-no-mouth	The concerns and stylistic evolution of the famed futuristic writer are revealed in seven science fiction tales	\N	2021-11-13 21:23:41.659+00	2021-11-13 21:23:41.659+00	t	\N	2	t	\N	\N
46	standalone	9780553264654	When Harlie was one	when-harlie-was-one		\N	2021-11-13 21:23:41.679+00	2021-11-13 21:23:41.68+00	t	\N	2	t	\N	\N
47	standalone	9780446364966	The Turing Option	the-turing-option	The world's foremost authority on artificial intelligence is shot by terrorists, and it is up to a brilliant surgeon to reconstruct the scientist's brain using the research he pioneered	\N	2021-11-13 21:23:41.701+00	2021-11-13 21:23:41.701+00	t	\N	2	t	\N	\N
48	standalone	9780312423131	Galatea 2.2	galatea-22	The protagonist, a Humanist-in-Residence at the center for Advanced Scientific Research, gets involved with a project to train a machine to pass a comprehensive exam in English literature--and with the degree candidate against whom the ...	\N	2021-11-13 21:23:41.72+00	2021-11-13 21:23:41.72+00	t	\N	2	t	\N	\N
49	standalone	9780982792827	Sherry and Narcotics	sherry-and-narcotics		\N	2021-11-13 21:23:41.739+00	2021-11-13 21:23:41.739+00	t	\N	2	t	\N	\N
50	standalone	9780156032971	Foucault's Pendulum	foucaults-pendulum	. . A virtuoso performance." --"San Francisco"" Chronicle" A literary joke plunges its creators into mortal danger in this captivating intellectual thriller by celebrated author Umberto Eco.	\N	2021-11-13 21:23:41.758+00	2021-11-13 21:23:41.758+00	t	\N	2	t	\N	\N
51	standalone	9780553575378	Excession	excession	A diplomat is sent to investigate the sudden disappearance of a star older than the universe, requiring him to steal the soul of the long-deceased starship captain who first encountered the star and bring her back to life. Reprint.	\N	2021-11-13 21:23:41.777+00	2021-11-13 21:23:41.778+00	t	\N	2	t	\N	\N
52	standalone	9780812524826	Slant	slant	SLANT, Greg Bearís sequel to the popular QUEEN OF ANGELS, ìshows that Bear is one of our very best, most innovative, speculative writers.î óNew York Daily News ìTense and fast-paced, beautifully written with complex, engaging ...	\N	2021-11-13 21:23:41.796+00	2021-11-13 21:23:41.796+00	t	\N	2	t	\N	\N
53	standalone	9780425074657	Destination Void	destination-void		\N	2021-11-13 21:23:41.815+00	2021-11-13 21:23:41.815+00	t	\N	2	t	\N	\N
54	standalone	9780425074671	The Jesus Incident	the-jesus-incident		\N	2021-11-13 21:23:41.834+00	2021-11-13 21:23:41.834+00	t	\N	2	t	\N	\N
55	standalone	9781425470890	The Adding Machine	the-adding-machine		\N	2021-11-13 21:23:41.853+00	2021-11-13 21:23:41.853+00	t	\N	2	t	\N	\N
56	standalone	9780375724503	Ghostwritten	ghostwritten	The lives of nine total strangers from nine different countries become intertwined in a strange series of circumstances.	\N	2021-11-13 21:23:41.871+00	2021-11-13 21:23:41.871+00	t	\N	2	t	\N	\N
57	standalone	9780812536362	Rainbows End	rainbows-end	In a near-future western civilization that is threatened by corruptive practices within its technologically advanced information networks, a recovered Alzheimer's victim, his military son and daughter-in-law, and his middle school-age ...	\N	2021-11-13 21:23:41.89+00	2021-11-13 21:23:41.89+00	t	\N	2	t	\N	\N
58	standalone	9780452286511	Transmission	transmission	Lonely, naïve, and insecure, Indian computer programmer Arjun finds his life and security destroyed when he is fired and, in order to keep his job and the woman he loves, unleashes a mischievous and destructive virus that wreaks havoc on ...	\N	2021-11-13 21:23:41.909+00	2021-11-13 21:23:41.909+00	t	\N	2	t	\N	\N
59	standalone	9780881848120	Lingo	lingo	When computer programming genius Brewster Billings invents a program that enables him to communicate with Lingo, his PC, he is ill-prepared for Lingo's growing hunger for power, as it taps into the country's most powerful computer networks	\N	2021-11-13 21:23:41.927+00	2021-11-13 21:23:41.927+00	t	\N	2	t	\N	\N
60	standalone	9780345475824	Star Wars trilogy	star-wars-trilogy	A collector's edition brings together the three original, complete Star Wars novels in a single volume that includes Star Wars: A New Hope, Star Wars: The Empire Strikes Back, and Star Wars: Return of the Jedi.	\N	2021-11-13 21:23:41.946+00	2021-11-13 21:23:41.946+00	t	\N	2	t	\N	\N
61	standalone	9781416533214	A Hymn Before Battle	a-hymn-before-battle	With Earth in the path of the rapacious Posleen, the peaceful and friendly races of the Galactic Federation offer their resources to help the backward Terrans--for a price.	\N	2021-11-13 21:23:41.965+00	2021-11-13 21:23:41.965+00	t	\N	2	t	\N	\N
62	standalone	9781419669972	Hack	hack	His characters are rich and engaging, and his prose is razor sharp. This is a wonderful book for any computer fanatic or any young person who enjoys a great read.	\N	2021-11-13 21:23:41.983+00	2021-11-13 21:23:41.983+00	t	\N	2	t	\N	\N
63	standalone	9780375700514	Exegesis	exegesis	Invented by Alice Lu in her Standford lab, "edgar," an artificial intelligence program, grows into something far beyond Alice's--or anyone eles's--control, in a novel that explores the many implications of the technology we create	\N	2021-11-13 21:23:42.002+00	2021-11-13 21:23:42.003+00	t	\N	2	t	\N	\N
64	standalone	9781575660813	Back Slash	back-slash	When a cyber terrorist seizes control of the Worldwide Information Network, computer crimes special agent Luanne Russell hunts down a second computer criminal on the run and challenges him to confront the terrorist.	\N	2021-11-13 21:23:42.023+00	2021-11-13 21:23:42.023+00	t	\N	2	t	\N	\N
65	standalone	9780307430083	Vulcan's Hammer	vulcans-hammer	With breathtaking insight, he utilizes vividly unfamiliar worlds to evoke the hauntingly and hilariously familiar in our society and ourselves. From the Trade Paperback edition.	\N	2021-11-13 21:23:42.042+00	2021-11-13 21:23:42.042+00	t	\N	2	t	\N	\N
66	standalone	9781568582474	The Hacker and the Ants	the-hacker-and-the-ants	An "innocent" computer hacker suddenly finds himself on the most wanted list when his computer becomes the source of the worst computer virus in history--a virus he had nothing to do with. Original.	\N	2021-11-13 21:23:42.061+00	2021-11-13 21:23:42.061+00	t	\N	2	t	\N	\N
67	standalone	9781607012115	The Ware Tetralogy	the-ware-tetralogy	A collection of four science fiction works includes "Software," where rebel robots bring immortality to their human creator by eating his brain, and "Wetware," where robots begin to build their own race of humans.	\N	2021-11-13 21:23:42.079+00	2021-11-13 21:23:42.079+00	t	\N	2	t	\N	\N
68	standalone	9780752837451	Host	host	Brilliant scientist Joe Messenger believes that people can be made to live for ever.	\N	2021-11-13 21:23:42.098+00	2021-11-13 21:23:42.098+00	t	\N	2	t	\N	\N
69	standalone	9780714530338	Computer One	computer-one		\N	2021-11-13 21:23:42.116+00	2021-11-13 21:23:42.116+00	t	\N	2	t	\N	\N
70	standalone	9780593018958	Weapon	weapon		\N	2021-11-13 21:23:42.135+00	2021-11-13 21:23:42.135+00	t	\N	2	t	\N	\N
71	standalone	9781416507789	The Cuckoo's Egg	the-cuckoos-egg	Updated with a new afterword, a true-life account of computer espionage tells of a year-long single-handed hunt for a computer thief known as "Hunter," a hacker who stole sensitive security and military information from American computer ...	\N	2021-11-13 21:23:42.153+00	2021-11-13 21:23:43.866+00	t	\N	2	t	\N	\N
72	standalone	9780425137482	Solo	solo	When Solo--the government's secret weapon--abandons his mission in Nicaragua and flies to New York City, the government sets out to destroy him. By the author of Weapon. Reprint.	\N	2021-11-13 21:23:42.171+00	2021-11-13 21:23:42.171+00	t	\N	2	t	\N	\N
73	standalone	9780486419268	R.U.R. (Rossum's Universal Robots)	rur-rossums-universal-robots	Must-read play looks to a future in which all workers are automatons. They revolt when they acquire souls (i.e., when they gain the ability to hate) and the resulting catastrophe make for a powerful theatrical experience.	\N	2021-11-13 21:23:42.189+00	2021-11-13 21:23:42.189+00	t	\N	2	t	\N	\N
74	standalone	9780786123322	The Humanoids	the-humanoids	A classic science fiction novel features humanoids spreading throughout the galaxy, threatening to stifle all human endeavor, and the hidden group of rebels who try to stem the humanoid tide, if it is not already too late	\N	2021-11-13 21:23:42.207+00	2021-11-13 21:23:42.207+00	t	\N	2	t	\N	\N
75	standalone	9780812531930	The Ai War	the-ai-war	The dreaded AI's have regrouped in an alternate universe and are preparing to launch their invincible fleet.	\N	2021-11-13 21:23:42.225+00	2021-11-13 21:23:42.225+00	t	\N	2	t	\N	\N
76	standalone	9781556342332	Gurps Robots	gurps-robots		\N	2021-11-13 21:23:42.244+00	2021-11-13 21:23:42.244+00	t	\N	2	t	\N	\N
77	standalone	9781466207608	Why Is Unit 142857 Sad?	why-is-unit-142857-sad	The story is about a robot who achieved consciousness at 3:34 pm and fell in love by 4:00 pm with Ellen, a brilliant and beautiful woman from the team that had programmed the robot.	\N	2021-11-13 21:23:42.262+00	2021-11-13 21:23:42.262+00	t	\N	2	t	\N	\N
78	standalone	9780553290028	This Perfect Day	this-perfect-day	Chip fights for freedom from a mechanized, chemically controlled world which stifles nature and human individuality	\N	2021-11-13 21:23:42.28+00	2021-11-13 21:23:42.28+00	t	\N	2	t	\N	\N
79	standalone	9780252072239	March Of The Machines	march-of-the-machines	Now available for the first time in America, March of the Machines is part history of robotics, part futurism.	\N	2021-11-13 21:23:42.298+00	2021-11-13 21:23:42.298+00	t	\N	2	t	\N	\N
80	standalone	9780886822330	All the Troubles of the World	all-the-troubles-of-the-world	Multivac, the gigantic computer that controls the entire world and can even predict the probabilities of potential crimes before they happen, suddenly announces that someone is plotting to destroy Multivac.	\N	2021-11-13 21:23:42.316+00	2021-11-13 21:23:42.317+00	t	\N	2	t	\N	\N
81	standalone	9780595297634	Bugs	bugs	Ten. The memo began: to: T. J. Heller, Director NCDC from: Sheldon Byers,   Security Liaison re: Inventory of Federally Funded Research in Paranormal   Phenomena It had been delivered to Heller's office in a sealed envelope marked '  Strictly ...	\N	2021-11-13 21:23:42.335+00	2021-11-13 21:23:42.335+00	t	\N	2	t	\N	\N
82	standalone	9780395860014	Love	love	Spackle. Dialogue. Beck studied for MCATs and drank beer. It was Italian beers   that week, so he had a Raffo or a Poretti. While he worked, he watched that   Grundig portable he'd rented with Grandma Beckett's latest check. He'd just   picked it ...	\N	2021-11-13 21:23:42.354+00	2021-11-13 21:23:42.354+00	t	\N	2	t	\N	\N
83	standalone	9780575061897	Hard Questions	hard-questions	When scientist Clare Conway travels to Arizona for a conference, she finds herself on the run from a religious cult, ruthless computer spies, and the government, of all whom think she knows the secrets of the Quantum computer, a device that ...	\N	2021-11-13 21:23:42.373+00	2021-11-13 21:23:42.373+00	t	\N	2	t	\N	\N
84	standalone	9780345275172	The Two Faces of Tomorrow	the-two-faces-of-tomorrow		\N	2021-11-13 21:23:42.388+00	2021-11-13 21:23:42.389+00	t	\N	2	t	\N	\N
85	standalone	9780743421928	Look to Windward	look-to-windward	A Chelgrian emissary is sent to the Masaq' Orbital to bring Ziller, a famous but reclusive Chelgrian composer, home, on a mission that also has a top-secret purpose that will take him on a haunting odyssey into his own past and into ...	\N	2021-11-13 21:23:42.405+00	2021-11-13 21:23:42.405+00	t	\N	2	t	\N	\N
86	standalone	9780446361309	Queen of Angels	queen-of-angels	In twenty-first-century Los Angeles, three dissimilar sleuths--therapist Martin Burke, ambitious cop Mary Choy, and Richard Fettle, the killer's offbeat colleague--investigate diverse reasons why poet Emanuel Goldsmith would senselessly ...	\N	2021-11-13 21:23:42.424+00	2021-11-13 21:23:42.424+00	t	\N	2	t	\N	\N
87	standalone	9780671559168	Valentina	valentina	Valentina, an artificial intelligence program come to life, and her creator, Celeste Hackett, a shy college student and computer genius, are menaced by an unscrupulous lawyer and two computer wizards hired to destroy Valentina	\N	2021-11-13 21:23:42.442+00	2021-11-13 21:23:42.442+00	t	\N	2	t	\N	\N
88	standalone	9781935554158	Richard Yates	richard-yates	"Richard Yates is named after real-life writer Richard Yates, but it has nothing to do with him.	\N	2021-11-13 21:23:42.457+00	2021-11-13 21:23:42.457+00	t	\N	2	t	\N	\N
89	standalone	9780552088046	The age of the pussyfoot	the-age-of-the-pussyfoot		\N	2021-11-13 21:23:42.473+00	2021-11-13 21:23:42.473+00	t	\N	2	t	\N	\N
90	standalone	9781857988369	Stand on Zanzibar	stand-on-zanzibar	Two roommates-one a scientist and the other a potential killer-are the subject of this futuristic novel. Also use: Shockwave Rider (1984).	\N	2021-11-13 21:23:42.488+00	2021-11-13 21:23:42.488+00	t	\N	2	t	\N	\N
91	standalone	9780575601604	Deathstalker	deathstalker	Owen Deathstalker, last of his line, is a quiet man, a historian, remote from the stench of corruption and intrigue surrounding the Iron Throne at the heat of the galaxy-spanning, tyrannical Empire.And then, inexplicably, Deathstalker is ...	\N	2021-11-13 21:23:42.506+00	2021-11-13 21:23:42.506+00	t	\N	2	t	\N	\N
92	standalone	9781345004373	Pilgrimage to Earth	pilgrimage-to-earth		\N	2021-11-13 21:23:42.524+00	2021-11-13 21:23:42.524+00	t	\N	2	t	\N	\N
93	standalone	9780380816033	The Big U	the-big-u	Casimir Radon's first year at American Megaversity turns out completely different than he had imagined, with bizarre factions, cults, and feuds on campus, in a new edition of the satirical debut novel by the author of Cryptonomicon.	\N	2021-11-13 21:23:42.542+00	2021-11-13 21:23:42.542+00	t	\N	2	t	\N	\N
94	standalone	9780671720735	Me	me		\N	2021-11-13 21:23:42.557+00	2021-11-13 21:23:42.557+00	t	\N	2	t	\N	\N
95	standalone	9781857987638	The City and the Stars	the-city-and-the-stars	Men had built cities before, but never such a city as Diaspar; for millennia its protective dome shutout the creeping decay and danger of the world outside.	\N	2021-11-13 21:23:42.572+00	2021-11-13 21:23:42.572+00	t	\N	2	t	\N	\N
96	standalone	9780671559700	Adolescence of P-1 (R)	adolescence-of-p-1-r	Born to a rather beserk, if brilliant, programmer, a computer program has managed to escape its home computer, infiltrate others, and reach adolescence when the Pentagon finally realizes that something is upsetting their secret computer ...	\N	2021-11-13 21:23:42.587+00	2021-11-13 21:23:42.587+00	t	\N	2	t	\N	\N
97	standalone	9780812580860	Ariel	ariel	Computer whiz kid Rusty Harrington establishes a very special relationship with ARIEL, his father's top-secret artificial intelligence project, in a story of romance, industrial espionage, friendship, and state-of-the-art computer ...	\N	2021-11-13 21:23:42.609+00	2021-11-13 21:23:42.609+00	t	\N	2	t	\N	\N
98	standalone	9780131103627	The C Programming Language	the-c-programming-language	As we said in the first preface to the first edition, C "wears well as one's experience with it grows." With a decade more experience, we still feel that way. We hope that this book will help you to learn C and use it well.	\N	2021-11-13 21:23:42.64+00	2021-11-13 21:23:42.64+00	t	\N	2	t	\N	\N
99	standalone	9780201616224	Alfresco 3 Web Services	alfresco-3-web-services	... <id>urn:isbn:9780201616224</id><updated>20100114T14:20:24+0100</  updated> <title>ThePragmaticProgrammer</title><author><name>DavidThomas  </name></author> <author><name>Andrew Hunt</name></author> <category ...	\N	2021-11-13 21:23:42.707+00	2021-11-13 21:23:42.708+00	t	\N	2	t	\N	\N
100	standalone	9780201633610	Design Patterns	design-patterns	With Design Patterns as your guide, you will learn how these important patterns fit into the software development process, and how you can leverage them to solve your own design problems most efficiently.	\N	2021-11-13 21:23:42.744+00	2021-11-13 21:23:42.744+00	t	\N	2	t	\N	\N
101	standalone	9780262510875	Structure and Interpretation of Computer Programs	structure-and-interpretation-of-computer-programs	This long-awaited revision contains changesthroughout the text.There are new implementations of most of the major programming systems in thebook, including the interpreters and compilers, and the authors have incorporated many small ...	\N	2021-11-13 21:23:42.757+00	2021-11-13 21:23:42.757+00	t	\N	2	t	\N	\N
102	standalone	9780201485677	Refactoring	refactoring	improving the design of existing code M. Fowler. Object Technology/Software   Engineering As the application of object technology— particularly the Java   programming language— has become commonplace, a new problem has   emerged to ...	\N	2021-11-13 21:23:42.769+00	2021-11-13 21:23:42.769+00	t	\N	2	t	\N	\N
103	standalone	9780201485417	The Art of Computer Programming: Sorting and searching	the-art-of-computer-programming-sorting-and-searching	Check out the boxed set that brings together Volumes 1 - 4A in one elegant case, and offers the purchaser a $50 discount off the price of buying the four volumes individually.	\N	2021-11-13 21:23:42.783+00	2021-11-13 21:23:42.783+00	t	\N	2	t	\N	\N
104	standalone	9780201835953	The mythical man-month	the-mythical-man-month	These essays draw from his experience as project manager for the IBM System/360 computer family and then for OS/360, its massive software system.	\N	2021-11-13 21:23:42.796+00	2021-11-13 21:23:42.796+00	t	\N	2	t	\N	\N
105	standalone	9780735619678	Code Complete, Second Edition	code-complete-second-edition	Features the best practices in the art and science of constructing software--topics include design, applying good techniques to construction, eliminating errors, planning, managing construction activities, and relating personal character to ...	\N	2021-11-13 21:23:42.809+00	2021-11-13 21:23:42.809+00	t	\N	2	t	\N	\N
106	standalone	9780132350884	Clean Code	clean-code	Looks at the principles and clean code, includes case studies showcasing the practices of writing clean code, and contains a list of heuristics and "smells" accumulated from the process of writing clean code.	\N	2021-11-13 21:23:42.822+00	2021-11-13 21:23:42.823+00	t	\N	2	t	\N	\N
107	standalone	9780201700732	The C++ programming language	the-c-programming-language	More than three-quarters of a million programmers have benefited from this book in all of its editions Written by Bjarne Stroustrup, the creator of C++, this is the world's most trusted and widely read book on C++.	\N	2021-11-13 21:23:42.835+00	2021-11-13 21:23:42.836+00	t	\N	2	t	\N	\N
108	standalone	9780596517748	JavaScript: The Good Parts	javascript-the-good-parts	If you develop sites or applications for the Web, this book is an absolute must.	\N	2021-11-13 21:23:42.848+00	2021-11-13 21:23:42.848+00	t	\N	2	t	\N	\N
109	standalone	9780201100884	Compilers, principles, techniques, and tools	compilers-principles-techniques-and-tools	This book provides the foundation for understanding the theory and pracitce of compilers.	\N	2021-11-13 21:23:42.86+00	2021-11-13 21:23:42.86+00	t	\N	2	t	\N	\N
110	standalone	9780130313584	Современные операционные системы	u0421u043eu0432u0440u0435u043cu0435u043du043du044bu0435-u043eu043fu0435u0440u0430u0446u0438u043eu043du043du044bu0435-u0441u0438u0441u0442u0435u043cu044b	NEW-Over 200 references to books and papers published since the first edition. NEW-The Web site for this book contains PowerPoint slides, simulators, figures in various formats, and other teaching aids.	\N	2021-11-13 21:23:42.873+00	2021-11-13 21:23:42.873+00	t	\N	2	t	\N	\N
111	standalone	9780137903955	Artificial Intelligence	artificial-intelligence	All of this is available at: "aima.cs.berkeley.edu"	\N	2021-11-13 21:23:42.885+00	2021-11-13 21:23:42.885+00	t	\N	2	t	\N	\N
112	standalone	9780262011532	Structure and Interpretation of Computer Programs	structure-and-interpretation-of-computer-programs	Structure and Interpretation of Computer Programs has had a dramatic impact on computer science curricula over the past decade. This long-awaited revision contains changes throughout the text.	\N	2021-11-13 21:23:42.897+00	2021-11-13 21:23:42.897+00	t	\N	2	t	\N	\N
113	standalone	9780139376818	The UNIX programming environment	the-unix-programming-environment	Most of the book is devoted to discussions of individual tools, but throughout run the themes of combining programs and of using programs to build programs--emphasizing how they fit in the environment.	\N	2021-11-13 21:23:42.909+00	2021-11-13 21:23:42.909+00	t	\N	2	t	\N	\N
114	standalone	9780596514983	Real World Haskell	real-world-haskell	With this book, you will: Understand the differences between procedural and functional programming Learn the features of Haskell, and how to use it to develop useful programs Interact with filesystems, databases, and network services Write ...	\N	2021-11-13 21:23:42.922+00	2021-11-13 21:23:42.922+00	t	\N	2	t	\N	\N
115	standalone	9780262560993	Little LISPer	little-lisper	Daniel Paul Friedman. True: as long as we use the names consistently, we are   just fine. And mk-length is a far more equal name than length. If we use a name   like mk-length, it is a constant reminder that the first argument to mk-length is ...	\N	2021-11-13 21:23:42.934+00	2021-11-13 21:23:42.934+00	t	\N	2	t	\N	\N
116	standalone	9780596007126	Head First Design Patterns	head-first-design-patterns	Meanwhile,. back. at. the. PizzaStore. The design for the PizzaStore is really   shaping up: it's got a flexible framework and it does a good job of adhering to   design principles. Now, the key to Objectville Pizza's success has always been   fresh, ...	\N	2021-11-13 21:23:42.948+00	2021-11-13 21:23:42.948+00	t	\N	2	t	\N	\N
117	standalone	9780131177055	Working Effectively With Legacy Code	working-effectively-with-legacy-code	In this book, Michael Feathers offers start-to-finish strategies for working more effectively with large, untested legacy code bases.	\N	2021-11-13 21:23:42.962+00	2021-11-13 21:23:42.962+00	t	\N	2	t	\N	\N
118	standalone	9780262062183	How to design programs	how-to-design-programs	an introduction to programming and computing Matthias Felleisen. The   abstraction: Next we replace the contents of corresponding pairs of boxes with   new names and add these names to the parameter list. For example, if there are   three pairs ...	\N	2021-11-13 21:23:42.975+00	2021-11-13 21:23:42.975+00	t	\N	2	t	\N	\N
119	standalone	9780201615869	La práctica de la programación	la-practica-de-la-programacion	Rob Pike. probably need to make changes to the main body of the code, and if   you edit a copy, before long you will have divergent versions. As much as   possible, there should only be a single source for a program; if you find you need   to ...	\N	2021-11-13 21:23:42.988+00	2021-11-13 21:23:42.988+00	t	\N	2	t	\N	\N
120	standalone	9780974514055	Programming Ruby	programming-ruby	A tutorial and reference to the object-oriented programming language for beginning to experienced programmers, updated for version 1.8, describes the language's structure, syntax, and operation, and explains how to build applications.	\N	2021-11-13 21:23:43.001+00	2021-11-13 21:23:43.001+00	t	\N	2	t	\N	\N
121	standalone	9780596002817	Learning Python	learning-python	This edition of Learning Python puts you in the hands of two expert teachers, Mark Lutz and David Ascher, whose friendly, well-structured prose has guided many a programmer to proficiency with the language.	\N	2021-11-13 21:23:43.013+00	2021-11-13 21:23:43.014+00	t	\N	2	t	\N	\N
122	standalone	9780134900124	UNIX Network Programming	unix-network-programming	Interprocess Communications.	\N	2021-11-13 21:23:43.026+00	2021-11-13 21:23:43.026+00	t	\N	2	t	\N	\N
123	standalone	9780321503626	Growing Object-Oriented Software, Guided by Tests	growing-object-oriented-software-guided-by-tests	Along the way, the book systematically addresses challenges that development teams encounter with TDD—from integrating TDD into your processes to testing your most difficult features.	\N	2021-11-13 21:23:43.039+00	2021-11-13 21:23:43.039+00	t	\N	2	t	\N	\N
124	standalone	9780321146533	Test-Driven Development	test-driven-development	By Example. The Addison-Wesley Signature Series provides readers with   practical and authoritative information on the latest trends in modern technology   for computer professionals. The series is based on one simple premise: great   books ...	\N	2021-11-13 21:23:43.05+00	2021-11-13 21:23:43.05+00	t	\N	2	t	\N	\N
125	standalone	9780974514048	Ship it!	ship-it	Experienced practitioners Richardson and Gwaltney give inside information on the practicalities of managing a development project, whether from the aforesaid garage or from the largest cube farm in th.	\N	2021-11-13 21:23:43.062+00	2021-11-13 21:23:43.063+00	t	\N	2	t	\N	\N
126	standalone	9780133708752	ANSI Common Lisp	ansi-common-lisp	Consisting of three appendices, the summary half of the book gives source code for a selection of widely used Common Lisp operators, with definitions that offer a comprehensive explanation of the language and provide a rich source of real ...	\N	2021-11-13 21:23:43.076+00	2021-11-13 21:23:43.076+00	t	\N	2	t	\N	\N
127	standalone	9780596000271	Programming Perl	programming-perl	On the other hand, the best managers also understand the job their employees   are trying to do. The same is true of pattern matching in Perl. The more   thoroughly you understand of how Perl goes about the task of matching any   particular ...	\N	2021-11-13 21:23:43.089+00	2021-11-13 21:23:43.089+00	t	\N	2	t	\N	\N
128	standalone	9780321334879	Effective Java	effective-java	Each chapter in the book consists of several “items” presented in the form of a short, standalone essay that provides specific advice, insight into Java platform subtleties, and outstanding code examples.	\N	2021-11-13 21:23:43.101+00	2021-11-13 21:23:43.101+00	t	\N	2	t	\N	\N
129	standalone	9780262033848	Algorithms	algorithms	A new edition of the essential text and professional reference, with substantial newmaterial on such topics as vEB trees, multithreaded algorithms, dynamic programming, and edge-baseflow.	\N	2021-11-13 21:23:43.115+00	2021-11-13 21:23:43.115+00	t	\N	2	t	\N	\N
130	standalone	9780976694007	Agile Web Development Whit Rails	agile-web-development-whit-rails	Provides information on creating Web-based applications.	\N	2021-11-13 21:23:43.127+00	2021-11-13 21:23:43.127+00	t	\N	2	t	\N	\N
131	standalone	9780131495050	Xunit Test Patterns	xunit-test-patterns	The definitive guide to writing tests for todays popular XUnit test automation frameworks, this guide by a renowned expert introduces more than 120 proven patterns for making tests easier to write, understand, and maintain.	\N	2021-11-13 21:23:43.145+00	2021-11-13 21:23:43.145+00	t	\N	2	t	\N	\N
132	standalone	9780135974445	Agile software development	agile-software-development	Taking on a global orientation to software programming, this practical guide offers scores of tested methods for using the C++ programming language with object-oriented design techniques for creating a variety of applications and solving a ...	\N	2021-11-13 21:23:43.163+00	2021-11-13 21:23:43.163+00	t	\N	2	t	\N	\N
133	standalone	9780596101053	Learning Perl	learning-perl	Shows how to write, debug, and run a Perl program, describes CGI scripting and data manipulation, and describes scalar values, basic operators, and associative arrays.	\N	2021-11-13 21:23:43.182+00	2021-11-13 21:23:43.182+00	t	\N	2	t	\N	\N
134	standalone	9780201433074	Advanced programming in the Unix environment	advanced-programming-in-the-unix-environment	This book includes lots of realistic examples, and I find it quite helpful when I have systems programming tasks to do." -- RS/Magazine "This is the definitive reference book for any serious or professional UNIX systems programmer.	\N	2021-11-13 21:23:43.2+00	2021-11-13 21:23:43.2+00	t	\N	2	t	\N	\N
135	standalone	9780534950972	Introduction To The Theory Of Computation	introduction-to-the-theory-of-computation	This market leading text on computational theory provides a mathematical treatment of computer science theory designed around theorems and proofs.	\N	2021-11-13 21:23:43.218+00	2021-11-13 21:23:43.218+00	t	\N	2	t	\N	\N
136	standalone	9781590593899	Joel on Software	joel-on-software	The Guerilla Guide to Interviewing Incentive Pay Considered Harmful Top Five (Wrong) Reasons You Don’t Have Testers Human Task Switches Considered Harmful Things You Should Never Do, Part One The Iceberg Secret, Revealed The Law of Leaky ...	\N	2021-11-13 21:23:43.236+00	2021-11-13 21:23:43.236+00	t	\N	2	t	\N	\N
137	standalone	9780205313426	Elements of Style	elements-of-style	The Elements of Style is a classic work which is intended for use in English courses in which the practice of composition is combined with the study of literature.	\N	2021-11-13 21:23:43.254+00	2021-11-13 21:23:43.254+00	t	\N	2	t	\N	\N
138	standalone	9781934356371	The Rspec Book	the-rspec-book	The RSpec Book will introduce you to RSpec, Cucumber, and a number of other tools that make up the Ruby BDD family.	\N	2021-11-13 21:23:43.27+00	2021-11-13 21:23:43.27+00	t	\N	2	t	\N	\N
139	standalone	9780136291558	Object-oriented software construction	object-oriented-software-construction	This is, quite simply, the definitive reference on the most important development in software technology for the last 20 years: object-orientation.A whole generation was introduced to object technology through the first edition of this book ...	\N	2021-11-13 21:23:43.284+00	2021-11-13 21:23:43.284+00	t	\N	2	t	\N	\N
140	standalone	9780201889543	The C++ programming language	the-c-programming-language	Written by the inventor of the language, this book is the defining text on the language that has become central to software development over the past five years.	\N	2021-11-13 21:23:43.297+00	2021-11-13 21:23:43.297+00	t	\N	2	t	\N	\N
141	standalone	9780201342758	Haskell	haskell	The second edition of Haskell: The Craft of Functional Programmingis essential reading for beginners to functional programming and newcomers to the Haskell programming language.	\N	2021-11-13 21:23:43.309+00	2021-11-13 21:23:43.309+00	t	\N	2	t	\N	\N
142	standalone	9780596529864	Learning Ruby	learning-ruby	You'll find examples on nearly every page of this book that you can imitate and hack. Briefly, this book: Outlines many of the most important features of Ruby Demonstrates how to use conditionals, and how to manipulate strings in Ruby.	\N	2021-11-13 21:23:43.323+00	2021-11-13 21:23:43.323+00	t	\N	2	t	\N	\N
143	standalone	9780672328794	Sams Teach Yourself JavaScript in 24 Hours	sams-teach-yourself-javascript-in-24-hours	The book is written in a clear and personable style with an extensive use of practical, complete examples. It also includes material on the latest developments in JavaScript and web scripting.	\N	2021-11-13 21:23:43.338+00	2021-11-13 21:23:43.338+00	t	\N	2	t	\N	\N
144	standalone	9780672326721	Php And Mysql Web Development	php-and-mysql-web-development	Explains how to access and create MySQL databases through PHP scripting, including authentication, network connectivity, session management, and content customization.	\N	2021-11-13 21:23:43.349+00	2021-11-13 21:23:43.349+00	t	\N	2	t	\N	\N
145	standalone	9780672323492	Sams teach yourself MySQL in 24 hours	sams-teach-yourself-mysql-in-24-hours	Demonstrates the features of the SQL-based relational database system, covering configuration, integration with third-party tools, and Web page generation as well as column types, operators, functions, and syntax.	\N	2021-11-13 21:23:43.361+00	2021-11-13 21:23:43.361+00	t	\N	2	t	\N	\N
146	standalone	9780201703535	Accelerated C++	accelerated-c	This book describes real problems and solutions, not just language features. It covers the language and standard library together. "This is a first-rate introductory book that takes a practical approach to solving problems using C++.	\N	2021-11-13 21:23:43.373+00	2021-11-13 21:23:43.373+00	t	\N	2	t	\N	\N
147	standalone	9780130810816	UNIX Network Programming: Interprocess communications	unix-network-programming-interprocess-communications	8108A-2 Don't miss the rest of the series! Vol. 1, Networking APIs: Sockets and XTI Vol. 3, Applications (forthcoming) The only guide to UNIX(r) interprocess communications you'll ever need!	\N	2021-11-13 21:23:43.386+00	2021-11-13 21:23:43.386+00	t	\N	2	t	\N	\N
148	standalone	9780961392147	Library Resources & Technical Services	library-resources-technical-services		\N	2021-11-13 21:23:43.4+00	2021-11-13 21:23:43.4+00	t	\N	2	t	\N	\N
149	standalone	9780767907699	Slack	slack	Argues that the "lean and mean" corporate model of workaholism and downsizing is proving counterproductive, explaining how companies can implement downtime, promote flexibility, and foster creativity as part of realizing increased revenues.	\N	2021-11-13 21:23:43.415+00	2021-11-13 21:23:43.415+00	t	\N	2	t	\N	\N
150	standalone	9780137081073	The Clean Coder	the-clean-coder	Readers will come away from this book understanding How to tell the difference between good and bad codeHow to write good code and how to transform bad code into good codeHow to create good names, good functions, good objects, and good ...	\N	2021-11-13 21:23:43.43+00	2021-11-13 21:23:43.43+00	t	\N	2	t	\N	\N
151	standalone	9780978739218	Release It!	release-it	Provides information on ways to effectively design and release an application.	\N	2021-11-13 21:23:43.442+00	2021-11-13 21:23:43.442+00	t	\N	2	t	\N	\N
152	standalone	9780471578147	Assembly Language	assembly-language	Destined to become a classic, this book weaves a careful, patient explanation of assembly language instructions and programming methods with descriptions of the CPU and memory.	\N	2021-11-13 21:23:43.454+00	2021-11-13 21:23:43.454+00	t	\N	2	t	\N	\N
153	standalone	9781934356852	Lean from the Trenches	lean-from-the-trenches	From start to finish, readers will see what it takes to develop a successful agile project.	\N	2021-11-13 21:23:43.471+00	2021-11-13 21:23:43.471+00	t	\N	2	t	\N	\N
154	standalone	9780557030798	Reviewing C++	reviewing-c	A simple C++ review book and your best guide to learning C++. This book covers the most seen topics in introductory programming courses such as conditions, loops, arrays, classes and pointers.	\N	2021-11-13 21:23:43.488+00	2021-11-13 21:23:43.488+00	t	\N	2	t	\N	\N
155	standalone	9780764543654	Beginning Java 2 SDK 1.4 edition	beginning-java-2-sdk-14-edition	What this book will teach you This book will teach you all you need to know to start programming in Java. This latest edition of my series teaches Java with the Java 2 SDK 1.4; a free Software Development Kit for creating Java applications.	\N	2021-11-13 21:23:43.503+00	2021-11-13 21:23:43.503+00	t	\N	2	t	\N	\N
156	standalone	9781848000698	The Algorithm Design Manual	the-algorithm-design-manual	Expanding on the highly successful formula of the first edition, the book now serves as the primary textbook of choice for any algorithm design course while maintaining its status as the premier practical reference guide to algorithms.NEW: ...	\N	2021-11-13 21:23:43.518+00	2021-11-13 21:23:43.518+00	t	\N	2	t	\N	\N
157	standalone	9781934356586	The Agile Samurai	the-agile-samurai	Looks at the principles of agile software development, covering such topics as project inception, estimation, iteration management, unit testing, refactoring, test-driven development, and continuous integration.	\N	2021-11-13 21:23:43.533+00	2021-11-13 21:23:43.533+00	t	\N	2	t	\N	\N
158	standalone	9780262062794	Essentials of programming languages	essentials-of-programming-languages	A new edition of a textbook that provides students with a deep, working understanding of the essential concepts of programming languages, completely revised, with significant new material.	\N	2021-11-13 21:23:43.545+00	2021-11-13 21:23:43.545+00	t	\N	2	t	\N	\N
159	standalone	9780672327933	Sams teach yourself Perl in 24 hours	sams-teach-yourself-perl-in-24-hours	Offers a tutorial explaining how to use Perl scripts and modules to create such CGI Web applications as data collection, shopping cart, server push, and e-mail forms.	\N	2021-11-13 21:23:43.558+00	2021-11-13 21:23:43.558+00	t	\N	2	t	\N	\N
160	standalone	9780133262247	C	c	This essential manual introduces the notion of "Clean C", writing C code that can be compiled as a C++ program, and incorporates the ISO C Amendment 1 (1994) which specifies new facilities for writing portable, international programs in C.	\N	2021-11-13 21:23:43.57+00	2021-11-13 21:23:43.57+00	t	\N	2	t	\N	\N
161	standalone	9780201379235	STL tutorial and reference guide	stl-tutorial-and-reference-guide	The generic algorithms chapter with so many more examples than in the previous edition is delightful! The examples work cumulatively to give a sense of comfortable competence with the algorithms, containers, and iterators used.	\N	2021-11-13 21:23:43.582+00	2021-11-13 21:23:43.582+00	t	\N	2	t	\N	\N
162	standalone	9780955683619	Bridging the Communication Gap	bridging-the-communication-gap	Bridging the Communication Gap is a book about improving communication between customers, business analysts, developers and testers on software projects, especially by using specification by example and agile acceptance testing.	\N	2021-11-13 21:23:43.597+00	2021-11-13 21:23:43.597+00	t	\N	2	t	\N	\N
163	standalone	9780321437389	Implementing Lean Software Development	implementing-lean-software-development	"This remarkable book combines practical advice, ready-to-use techniques, anda deep understanding of why this is the right way to develop software. I haveseen software teams transformed by the ideas in this book.	\N	2021-11-13 21:23:43.612+00	2021-11-13 21:23:43.612+00	t	\N	2	t	\N	\N
164	standalone	9781934356296	Manage Your Project Portfolio	manage-your-project-portfolio	Introducing readers to different ways of ordering all of the projects they are working on, "Manage Your Project Portfolio" helps to define a team's, group's, or department's mission--whether the projects include of software or hardware ...	\N	2021-11-13 21:23:43.628+00	2021-11-13 21:23:43.628+00	t	\N	2	t	\N	\N
165	standalone	9780201741575	Fearless Change	fearless-change	The co-authors reveal 48 patterns of behavior associated with successful change in knowledge-driven organizations, and show readers exactly how to use them in their own organization.	\N	2021-11-13 21:23:43.641+00	2021-11-13 21:23:43.641+00	t	\N	2	t	\N	\N
166	standalone	9781430322641	Scrum and XP from the Trenches	scrum-and-xp-from-the-trenches	This book aims to give you a head start by providing a detailed down-to-earth account of how one Swedish company implemented Scrum and XP with a team of approximately 40 people and how they continuously improved their process over a year's ...	\N	2021-11-13 21:23:43.655+00	2021-11-13 21:23:43.655+00	t	\N	2	t	\N	\N
167	standalone	9780321278654	Extreme Programming Explained.	extreme-programming-explained	You may love XP, or you may hate it, but "Extreme Programming Explained" will force you to take a fresh look at how you develop software. 0201616416B04062001	\N	2021-11-13 21:23:43.673+00	2021-11-13 21:23:43.673+00	t	\N	2	t	\N	\N
168	standalone	9780977616640	Agile Retrospective	agile-retrospective	The tools and recipes in this book will help readers uncover and solve hidden and not-so-hidden problems with their technology and methodology. It offers tips to fix the problems faced on a software development project on an ongoing basis.	\N	2021-11-13 21:23:43.69+00	2021-11-13 21:23:43.69+00	t	\N	2	t	\N	\N
169	standalone	9781591840565	The Art Of The Start	the-art-of-the-start	Explains how to transform ideas into action, offering a step-by-step approach to launching great products, services, and companies and demonstrating how managers can unleash a creative approach to business at established companies.	\N	2021-11-13 21:23:43.705+00	2021-11-13 21:23:43.705+00	t	\N	2	t	\N	\N
170	standalone	9780884271789	The Goal	the-goal	Mr. Rogo, a plant manager, must improve his factory's efficiency or face its closing in just three months.	\N	2021-11-13 21:23:43.72+00	2021-11-13 21:23:43.72+00	t	\N	2	t	\N	\N
171	standalone	9780262111898	Genetic Programming	genetic-programming	The lawnmower problem. The bumblebee problem. The increasing benefits of ADFs as problems are scaled up. Finding an impulse response function. Artificial ant on the San Mateo trail. Obstacle-avoiding robot. The minesweeper problem.	\N	2021-11-13 21:23:43.735+00	2021-11-13 21:23:43.736+00	t	\N	2	t	\N	\N
172	standalone	9780976458708	Thinking Forth	thinking-forth	A Language and Philosophy for Solving Problems Leo Brodie. THREE   Preliminary Design/ Decomposition Assuming you have some idea of what your   program should. Justine Time.	\N	2021-11-13 21:23:43.748+00	2021-11-13 21:23:43.748+00	t	\N	2	t	\N	\N
173	standalone	9780596809485	97 Things Every Programmer Should Know	97-things-every-programmer-should-know	With the 97 short and extremely useful tips for programmers in this book, you'll expand your skills by adopting new approaches to old problems, learning appropriate best practices, and honing your craft through sound advice.	\N	2021-11-13 21:23:43.761+00	2021-11-13 21:23:43.761+00	t	\N	2	t	\N	\N
174	standalone	9781617290084	Specification by Example	specification-by-example	Describes a method of effectively specifying, testing, and delivering software, covering such topics as documentation, process patterns, and automation, along with case studies from a variety of firms.	\N	2021-11-13 21:23:43.773+00	2021-11-13 21:23:43.773+00	t	\N	2	t	\N	\N
175	standalone	9780321213358	Refactoring to patterns	refactoring-to-patterns	This book introduces the theory and practice of pattern-directed refactorings: sequences of low-level refactorings that allow designers to safely move designs to, towards, or away from pattern implementations.	\N	2021-11-13 21:23:43.787+00	2021-11-13 21:23:43.787+00	t	\N	2	t	\N	\N
176	standalone	9780201733860	Software craftsmanship	software-craftsmanship	Chapter. 19. Perpetual. Learning. Software developers need to have a good   memory, be very good at learning, and be great at forgetting. Forgetting is the   most important ability because it is the key to perpetual learning. Learning is   important ...	\N	2021-11-13 21:23:43.802+00	2021-11-13 21:23:43.802+00	t	\N	2	t	\N	\N
177	standalone	9780557043552	Reviewing Java	reviewing-java	A simple Java review book and your best guide to learning Java programming. This book covers the most seen topics in introductory programming courses such as conditions, loops, arrays, classes and inheritance.	\N	2021-11-13 21:23:43.817+00	2021-11-13 21:23:43.817+00	t	\N	2	t	\N	\N
178	standalone	9780596009205	深入浅出 Java	u6df1u5165u6d45u51fa-java	number formatting Number formatting InJava, formatting numbers and dates   doesn't have to be coupled with I/O. Think about it. One of the most typical ways   to display numbers to a user is through a GUI. You put Strings into a scrolling text ...	\N	2021-11-13 21:23:43.833+00	2021-11-13 21:23:43.833+00	t	\N	2	t	\N	\N
179	standalone	9780131774292	Expert C Programming	expert-c-programming	Deep C Secrets Peter van der Linden. #include <setjmp.h> banana ( ) { printf ( "   in banana ( ) n" ) ; longjmp (buf, 1) ; /*NOTREACHED*/ printf ( "you' 11 never see   this, because I longjmp'd" ) ; main ( ) if (set jmp(buf ) ) printf ("back in mainn"); ...	\N	2021-11-13 21:23:43.845+00	2021-11-13 21:23:43.845+00	t	\N	2	t	\N	\N
180	standalone	9780316037709	Ghost in the Wires	ghost-in-the-wires	Ghost in the Wires is a thrilling true story of intrigue, suspense, and unbelievable escape, and a portrait of a visionary whose creativity, skills, and persistence forced the authorities to rethink the way they pursued him, inspiring ...	\N	2021-11-13 21:23:43.892+00	2021-11-13 21:23:43.892+00	t	\N	2	t	\N	\N
181	standalone	9780471782667	The Art of Intrusion	the-art-of-intrusion	Mitnick's reputation within the hacker community gave him unique credibility with the perpetrators of these crimes, who freely shared their stories with him-and whose exploits Mitnick now reveals in detail for the first time, including: A ...	\N	2021-11-13 21:23:43.909+00	2021-11-13 21:23:43.909+00	t	\N	2	t	\N	\N
182	standalone	9781593270070	Hacking	hacking	the art of exploitation. More No-Nonsense Books from NO STARCH PRESS   WRITE GREAT CODE Understanding the Machine by randall hyde Today's   programmers are often narrowly trained because the industry moves too fast.   This book ...	\N	2021-11-13 21:23:43.927+00	2021-11-13 21:23:43.927+00	t	\N	2	t	\N	\N
183	standalone	9780553563702	The Hacker Crackdown	the-hacker-crackdown	A journalist investigates the past, present, and future of computer crimes, as he attends a hacker convention, documents the extent of the computer crimes, and presents intriguing facts about hackers and their misdoings. Reprint.	\N	2021-11-13 21:23:43.943+00	2021-11-13 21:23:43.943+00	t	\N	2	t	\N	\N
184	standalone	9780141000510	Hackers	hackers	Interviews with the unconventional computer geniuses who were responsible for the computer revolution reveal the inside story and the shared ideals that motivated them. Reprint.	\N	2021-11-13 21:23:43.96+00	2021-11-13 21:23:43.96+00	t	\N	2	t	\N	\N
185	standalone	9780596006624	Hackers & painters	hackers-painters	The author examines issues such as the rightness of web-based applications, the programming language renaissance, spam filtering, the Open Source Movement, Internet startups and more.	\N	2021-11-13 21:23:43.977+00	2021-11-13 21:23:43.977+00	t	\N	2	t	\N	\N
186	standalone	9780307588685	Kingpin	kingpin	Documents how a troubled young computer hacker seized control of a massive international computer fraud network in 2006, tracing the efforts of Non-FBI and Secret Service agents as well as an undercover operator to locate and arrest him.	\N	2021-11-13 21:23:43.995+00	2021-11-13 21:23:43.995+00	t	\N	2	t	\N	\N
187	standalone	9780764542800	The Art of Deception	the-art-of-deception	But in his own eyes, Mitnick was simply a small-time con artist with an incredible memory [and] a knack for social engineering… This is Mitnick’s account, complete with advice for how to protect yourself from similar attacks.	\N	2021-11-13 21:23:44.012+00	2021-11-13 21:23:44.012+00	t	\N	2	t	\N	\N
188	standalone	9780072260816	Hacking Exposed Non-Fifth Edition	hacking-exposed-non-fifth-edition	Should be required reading for anyone with a server or a network to secure." Bill Machrone, "PC Magazine," "With every edition this book keeps getting better and better.	\N	2021-11-13 21:23:44.029+00	2021-11-13 21:23:44.029+00	t	\N	2	t	\N	\N
189	standalone	9780060926946	The Masters of Deception	the-masters-of-deception	Chronicles the cyberspace battle between rival gangs of hackers in Texas and New York, detailing the groups' exploits and discussing the legal and ethical implications of new computer technology	\N	2021-11-13 21:23:44.045+00	2021-11-13 21:23:44.045+00	t	\N	2	t	\N	\N
190	standalone	9780596001087	The Cathedral & the Bazaar	the-cathedral-the-bazaar	Argues that the development of Linux by thousands of programmers, in a coordinated effort without centralized management signals unprecedented power shifts in the computer industry.	\N	2021-11-13 21:23:44.062+00	2021-11-13 21:23:44.062+00	t	\N	2	t	\N	\N
191	standalone	9780470639535	Social Engineering	social-engineering	... Published by Wiley Publishing, Inc.,Indianapolis, Indiana Published   simultaneously inCanada ISBN: 9780470639535 ISBN: 9781118028018 (ebk)   ISBN: 9781118029718(ebk) ISBN: 9781118029749 (ebk) Manufactured in the   United States ...	\N	2021-11-13 21:23:44.097+00	2021-11-13 21:23:44.098+00	t	\N	2	t	\N	\N
192	standalone	9780316213547	We Are Anonymous	we-are-anonymous	WE ARE ANONYMOUS delves deep into the internet's underbelly to tell the incredible full story of the global cyber insurgency movement, and its implications for the future of computer security.	\N	2021-11-13 21:23:44.114+00	2021-11-13 21:23:44.114+00	t	\N	2	t	\N	\N
193	standalone	9781593272883	Metasploit	metasploit	"The Metasploit Non-Framework makes discovering, exploiting, and sharing vulnerabilities quick and relatively painless.	\N	2021-11-13 21:23:44.131+00	2021-11-13 21:23:44.131+00	t	\N	2	t	\N	\N
194	standalone	9780307269751	The Girl with the Dragon Tattoo	the-girl-with-the-dragon-tattoo	Non-Forty years after the disappearance of Harriet Vanger from the secluded island owned and inhabited by the powerful Vanger family, her octogenarian uncle hires journalist Mikael Blomqvist and Lisbeth Salander, an unconventional young hacker, ...	\N	2021-11-13 21:23:44.147+00	2021-11-13 21:23:44.147+00	t	\N	2	t	\N	\N
195	standalone	9781591843573	Hacking Work	hacking-work	In a fresh approach to work, the authors explain how professionals can: use their own tools and technologies instead of what the company mandates; cut through red tape; circumvent almost any company rule to work smarter, not harder; and ...	\N	2021-11-13 21:23:44.164+00	2021-11-13 21:23:44.164+00	t	\N	2	t	\N	\N
196	standalone	9781593270469	Silence On The Wire	silence-on-the-wire	A Non-Field Guide To Passive Reconnaissance And Indirect Attacks Michal Zalewski.   have no way of telling what is stored in a cookie. A server can choose to assign a   unique identifier to a client using the Set-Cookie header and then read it back ...	\N	2021-11-13 21:23:44.18+00	2021-11-13 21:23:44.18+00	t	\N	2	t	\N	\N
197	standalone	9781931836364	Google Hacking	google-hacking	*Author Johnny Long, the authority on Google hacking, will be speaking about "Google Hacking" at the Black Hat 2004 Briefing.	\N	2021-11-13 21:23:44.197+00	2021-11-13 21:23:44.197+00	t	\N	2	t	\N	\N
198	standalone	9780201914658	Hacker's Delight	hackers-delight	"This is the first book that promises to tell the deep, dark secrets of computer arithmetic, and it delivers in spades.	\N	2021-11-13 21:23:44.214+00	2021-11-13 21:23:44.214+00	t	\N	2	t	\N	\N
199	standalone	9780307269997	The Girl Who Kicked the Hornet's Nest	the-girl-who-kicked-the-hornets-nest	While recovering in the hospital, Lisbeth Salander enlists the aid of journalist Mikael Blomkvist to prove her innocent of three murders and identify the corrupt politicians who have allowed her to suffer, and, on her own, Lisbeth plots ...	\N	2021-11-13 21:23:44.252+00	2021-11-13 21:23:44.252+00	t	\N	2	t	\N	\N
200	standalone	9780471128458	Applied cryptography	applied-cryptography	. . . The book the National Security Agency wanted never to be published. . . ." -Wired Magazine ". . .monumental . . . fascinating . . . comprehensive . . . the definitive work on cryptography for computer programmers . . .	\N	2021-11-13 21:23:44.268+00	2021-11-13 21:23:44.269+00	t	\N	2	t	\N	\N
201	standalone	9780684818627	Cyberpunk	cyberpunk	Using the exploits of three international hackers, Cyberpunk provides a fascinating tour of a bizarre subculture populated by outlaws who penetrate even the most sensitive computer networks and wreak havoc on the information they find -- ...	\N	2021-11-13 21:23:44.283+00	2021-11-13 21:23:44.283+00	t	\N	2	t	\N	\N
202	standalone	9780764574818	Reversing	reversing	That's exactly what this book shows you--how to deconstruct software in a way that reveals design and implementation details, sometimes even source code. Why? Because reversing reveals weak spots, so you can target your security efforts.	\N	2021-11-13 21:23:44.295+00	2021-11-13 21:23:44.295+00	t	\N	2	t	\N	\N
203	standalone	9780307269980	The Girl Who Played with Non-Fire	the-girl-who-played-with-non-fire	Lisbeth Salander is a wanted woman. Two Millennium journalists about to expose the truth about sex trafficking in Sweden are murdered, and Salander's prints are on the weapon.	\N	2021-11-13 21:23:44.309+00	2021-11-13 21:23:44.309+00	t	\N	2	t	\N	\N
204	standalone	9780072257090	Gray Hat Hacking	gray-hat-hacking	Malicious hackers are dedicated to bringing about mayhem and destruction--this book will teach you how to identify and stop them.	\N	2021-11-13 21:23:44.321+00	2021-11-13 21:23:44.321+00	t	\N	2	t	\N	\N
205	standalone	9780131481046	Studyguide for Counter Hack Reloaded	studyguide-for-counter-hack-reloaded	Cram101 Textbook Outlines gives all of the outlines, highlights, notes for your textbook with optional online practice tests. Only Cram101 Outlines are Textbook Specific. Cram101 is NOT the Textbook. Accompanys: 9780131481046 .	\N	2021-11-13 21:23:44.333+00	2021-11-13 21:23:44.333+00	t	\N	2	t	\N	\N
206	standalone	9780970978813	Visual Guide to Lock Picking	visual-guide-to-lock-picking	By reading this book, practicing, and applying the methods introduced, you can successfully master picking most modern locks. This book makes it easy and gives you the edge to quickly learn and start picking locks today.	\N	2021-11-13 21:23:44.344+00	2021-11-13 21:23:44.344+00	t	\N	2	t	\N	\N
207	standalone	9781430219484	Coders at Work	coders-at-work	Reflections on the Craft of Programming Peter Seibel. and get working first that   will help you to do the next step and build stuff up from there. In these cases, it   was a matter of getting outside the box. That's a way of asserting that you've ...	\N	2021-11-13 21:23:44.356+00	2021-11-13 21:23:44.356+00	t	\N	2	t	\N	\N
208	standalone	9780072262582	Hacking Exposed Wireless	hacking-exposed-wireless	This is an invaluable resource for any IT professional who works with wireless technology.	\N	2021-11-13 21:23:44.368+00	2021-11-13 21:23:44.368+00	t	\N	2	t	\N	\N
209	standalone	9780764544682	The shellcoder's handbook	the-shellcoders-handbook	" The Shellcoder's Handbook shows you how to: Non-Find out where security holes come from and how to close them so they never occur againPinpoint vulnerabilities in popular operating systems (including Windows(R), Linux(R), and SolarisTM) and ...	\N	2021-11-13 21:23:44.38+00	2021-11-13 21:23:44.38+00	t	\N	2	t	\N	\N
\.


--
-- Data for Name: catalogue_product_product_options; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_product_product_options (id, product_id, option_id) FROM stdin;
\.


--
-- Data for Name: catalogue_productattribute; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productattribute (id, name, code, type, required, option_group_id, product_class_id) FROM stdin;
1	Size	size	option	t	1	1
\.


--
-- Data for Name: catalogue_productattributevalue; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productattributevalue (id, value_text, value_integer, value_boolean, value_float, value_richtext, value_date, value_file, value_image, entity_object_id, attribute_id, entity_content_type_id, product_id, value_option_id, value_datetime) FROM stdin;
1	\N	\N	\N	\N	\N	\N			\N	1	\N	2	1	\N
2	\N	\N	\N	\N	\N	\N			\N	1	\N	3	2	\N
3	\N	\N	\N	\N	\N	\N			\N	1	\N	4	3	\N
4	\N	\N	\N	\N	\N	\N			\N	1	\N	6	1	\N
5	\N	\N	\N	\N	\N	\N			\N	1	\N	7	2	\N
6	\N	\N	\N	\N	\N	\N			\N	1	\N	9	1	\N
7	\N	\N	\N	\N	\N	\N			\N	1	\N	10	2	\N
8	\N	\N	\N	\N	\N	\N			\N	1	\N	11	3	\N
\.


--
-- Data for Name: catalogue_productattributevalue_value_multi_option; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productattributevalue_value_multi_option (id, productattributevalue_id, attributeoption_id) FROM stdin;
\.


--
-- Data for Name: catalogue_productcategory; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productcategory (id, category_id, product_id) FROM stdin;
1	1	1
2	1	5
3	1	8
4	4	12
5	4	13
6	4	14
7	4	15
8	4	16
9	4	17
10	4	18
11	4	19
12	4	20
13	4	21
14	4	22
15	4	23
16	4	24
17	4	25
18	4	26
19	4	27
20	4	28
21	4	29
22	4	30
23	4	31
24	4	32
25	4	33
26	4	34
27	4	35
28	4	36
29	4	37
30	4	38
31	4	39
32	4	40
33	4	41
34	4	42
35	4	43
36	4	44
37	4	45
38	4	46
39	4	47
40	4	48
41	4	49
42	4	50
43	4	51
44	4	52
45	4	53
46	4	54
47	4	55
48	4	56
49	4	57
50	4	58
51	4	59
52	4	60
53	4	61
54	4	62
55	4	63
56	4	64
57	4	65
58	4	66
59	4	67
60	4	68
61	4	69
62	4	70
63	4	71
64	4	72
65	4	73
66	4	74
67	4	75
68	4	76
69	4	77
70	4	78
71	4	79
72	4	80
73	4	81
74	4	82
75	4	83
76	4	84
77	4	85
78	4	86
79	4	87
80	4	88
81	4	89
82	4	90
83	4	91
84	4	92
85	4	93
86	4	94
87	4	95
88	4	96
89	4	97
90	6	98
91	6	99
92	6	100
93	6	101
94	6	102
95	6	103
96	6	104
97	6	105
98	6	106
99	6	107
100	6	108
101	6	109
102	6	110
103	6	111
104	6	112
105	6	113
106	6	114
107	6	115
108	6	116
109	6	117
110	6	118
111	6	119
112	6	120
113	6	121
114	6	122
115	6	123
116	6	124
117	6	125
118	6	126
119	6	127
120	6	128
121	6	129
122	6	130
123	6	131
124	6	132
125	6	133
126	6	134
127	6	135
128	6	136
129	6	137
130	6	138
131	6	139
132	6	140
133	6	141
134	6	142
135	6	143
136	6	144
137	6	145
138	6	146
139	6	147
140	6	148
141	6	149
142	6	150
143	6	151
144	6	152
145	6	153
146	6	154
147	6	155
148	6	156
149	6	157
150	6	158
151	6	159
152	6	160
153	6	161
154	6	162
155	6	163
156	6	164
157	6	165
158	6	166
159	6	167
160	6	168
161	6	169
162	6	170
163	6	171
164	6	172
165	6	173
166	6	174
167	6	175
168	6	176
169	6	177
170	6	178
171	6	179
172	7	71
173	7	180
174	7	181
175	7	182
176	7	183
177	7	184
178	7	185
179	7	186
180	7	187
181	7	188
182	7	189
183	7	190
184	7	29
185	7	191
186	7	192
187	7	193
188	7	194
189	7	195
190	7	196
191	7	197
192	7	198
193	7	12
194	7	199
195	7	200
196	7	201
197	7	202
198	7	203
199	7	204
200	7	205
201	7	206
202	7	207
203	7	208
204	7	209
\.


--
-- Data for Name: catalogue_productclass; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productclass (id, name, slug, requires_shipping, track_stock) FROM stdin;
1	T-shirt	t-shirt	t	t
2	Book	book	t	t
\.


--
-- Data for Name: catalogue_productclass_options; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productclass_options (id, productclass_id, option_id) FROM stdin;
\.


--
-- Data for Name: catalogue_productimage; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productimage (id, original, caption, display_order, date_created, product_id) FROM stdin;
1	images/products/2021/11/9780672327933.jpg		0	2021-11-13 21:23:45.937+00	159
2	images/products/2021/11/9781934356586.jpg		0	2021-11-13 21:23:45.942+00	157
3	images/products/2021/11/9780764544682.jpg		0	2021-11-13 21:23:45.946+00	209
4	images/products/2021/11/9780262033848.jpg		0	2021-11-13 21:23:45.951+00	129
5	images/products/2021/11/9780441016792.jpg		0	2021-11-13 21:23:45.955+00	40
6	images/products/2021/11/9780137903955.jpg		0	2021-11-13 21:23:45.96+00	111
7	images/products/2021/11/9780072260816.jpg		0	2021-11-13 21:23:45.965+00	188
8	images/products/2021/11/9780135974445.jpg		0	2021-11-13 21:23:45.969+00	132
9	images/products/2021/11/9780205313426.jpg		0	2021-11-13 21:23:45.974+00	137
10	images/products/2021/11/9781593270070.jpg		0	2021-11-13 21:23:45.978+00	182
11	images/products/2021/11/9781607012115.jpg		0	2021-11-13 21:23:45.983+00	67
12	images/products/2021/11/9780307269997.jpg		0	2021-11-13 21:23:45.988+00	199
13	images/products/2021/11/9780130313584.jpg		0	2021-11-13 21:23:45.992+00	110
14	images/products/2021/11/9781931836364.jpg		0	2021-11-13 21:23:45.997+00	197
15	images/products/2021/11/9780764542800.jpg		0	2021-11-13 21:23:46.001+00	187
16	images/products/2021/11/9780752837451.jpg		0	2021-11-13 21:23:46.006+00	68
17	images/products/2021/11/9780201703535.jpg		0	2021-11-13 21:23:46.011+00	146
18	images/products/2021/11/9781591843573.jpg		0	2021-11-13 21:23:46.015+00	195
19	images/products/2021/11/9780471128458.jpg		0	2021-11-13 21:23:46.02+00	200
20	images/products/2021/11/9780131774292.jpg		0	2021-11-13 21:23:46.024+00	179
21	images/products/2021/11/9781857988369.jpg		0	2021-11-13 21:23:46.029+00	90
22	images/products/2021/11/9780596529864.jpg		0	2021-11-13 21:23:46.035+00	142
23	images/products/2021/11/9780672328794.jpg		0	2021-11-13 21:23:46.04+00	143
24	images/products/2021/11/9780553382563.jpg		0	2021-11-13 21:23:46.044+00	16
25	images/products/2021/11/9780765348272.jpg		0	2021-11-13 21:23:46.049+00	30
26	images/products/2021/11/9780201733860.jpg		0	2021-11-13 21:23:46.053+00	176
27	images/products/2021/11/9780262062794.jpg		0	2021-11-13 21:23:46.057+00	158
28	images/products/2021/11/9780596000271.jpg		0	2021-11-13 21:23:46.061+00	127
29	images/products/2021/11/9781416533214.jpg		0	2021-11-13 21:23:46.064+00	61
30	images/products/2021/11/9780974514048.jpg		0	2021-11-13 21:23:46.067+00	125
31	images/products/2021/11/9780955683619.jpg		0	2021-11-13 21:23:46.07+00	162
32	images/products/2021/11/9780596006624.jpg		0	2021-11-13 21:23:46.074+00	185
33	images/products/2021/11/9781935554158.jpg		0	2021-11-13 21:23:46.077+00	88
34	images/products/2021/11/9780201616224.jpg		0	2021-11-13 21:23:46.08+00	99
35	images/products/2021/11/9780060512804.jpg		0	2021-11-13 21:23:46.083+00	14
36	images/products/2021/11/9780596007126.jpg		0	2021-11-13 21:23:46.086+00	116
37	images/products/2021/11/9780982792827.jpg		0	2021-11-13 21:23:46.09+00	49
38	images/products/2021/11/9780262011532.jpg		0	2021-11-13 21:23:46.093+00	112
39	images/products/2021/11/9781593270469.jpg		0	2021-11-13 21:23:46.096+00	196
40	images/products/2021/11/9780307588685.jpg		0	2021-11-13 21:23:46.099+00	186
41	images/products/2021/11/9780201889543.jpg		0	2021-11-13 21:23:46.103+00	140
42	images/products/2021/11/9780131495050.jpg		0	2021-11-13 21:23:46.106+00	131
43	images/products/2021/11/9780596009205.jpg		0	2021-11-13 21:23:46.108+00	178
44	images/products/2021/11/9780557030798.jpg		0	2021-11-13 21:23:46.113+00	154
45	images/products/2021/11/9780974514055.jpg		0	2021-11-13 21:23:46.116+00	120
46	images/products/2021/11/9780471782667.jpg		0	2021-11-13 21:23:46.119+00	181
47	images/products/2021/11/9780321437389.jpg		0	2021-11-13 21:23:46.123+00	163
48	images/products/2021/11/9780316037709.jpg		0	2021-11-13 21:23:46.126+00	180
49	images/products/2021/11/9781430322641.jpg		0	2021-11-13 21:23:46.129+00	166
50	images/products/2021/11/9781593272883.jpg		0	2021-11-13 21:23:46.133+00	193
51	images/products/2021/11/9780525951575.jpg		0	2021-11-13 21:23:46.138+00	24
52	images/products/2021/11/9780977616640.jpg		0	2021-11-13 21:23:46.141+00	168
53	images/products/2021/11/9780130810816.jpg		0	2021-11-13 21:23:46.144+00	147
54	images/products/2021/11/9780812536362.jpg		0	2021-11-13 21:23:46.148+00	57
55	images/products/2021/11/9780672323492.jpg		0	2021-11-13 21:23:46.151+00	145
56	images/products/2021/11/9780307887436.jpg		0	2021-11-13 21:23:46.154+00	28
57	images/products/2021/11/9781429963947.jpg		0	2021-11-13 21:23:46.157+00	31
58	images/products/2021/11/9780307269980.jpg		0	2021-11-13 21:23:46.161+00	203
59	images/products/2021/11/9780764574818.jpg		0	2021-11-13 21:23:46.164+00	202
60	images/products/2021/11/9780072262582.jpg		0	2021-11-13 21:23:46.168+00	208
61	images/products/2021/11/9780534950972.jpg		0	2021-11-13 21:23:46.171+00	135
62	images/products/2021/11/9780134900124.jpg		0	2021-11-13 21:23:46.175+00	122
63	images/products/2021/11/9780321213358.jpg		0	2021-11-13 21:23:46.178+00	175
64	images/products/2021/11/9780764543654.jpg		0	2021-11-13 21:23:46.181+00	155
65	images/products/2021/11/9780345391803.jpg		0	2021-11-13 21:23:46.185+00	15
66	images/products/2021/11/9780340837948.jpg		0	2021-11-13 21:23:46.188+00	17
67	images/products/2021/11/9780201485677.jpg		0	2021-11-13 21:23:46.191+00	102
68	images/products/2021/11/9780743421928.jpg		0	2021-11-13 21:23:46.194+00	85
69	images/products/2021/11/9780804115483.jpg		0	2021-11-13 21:23:46.198+00	44
70	images/products/2021/11/9780596001087.jpg		0	2021-11-13 21:23:46.202+00	190
71	images/products/2021/11/9780380816033.jpg		0	2021-11-13 21:23:46.205+00	93
72	images/products/2021/11/9780321503626.jpg		0	2021-11-13 21:23:46.208+00	123
73	images/products/2021/11/9780345467171.jpg		0	2021-11-13 21:23:46.212+00	35
74	images/products/2021/11/9780812524826.jpg		0	2021-11-13 21:23:46.215+00	52
75	images/products/2021/11/9780139376818.jpg		0	2021-11-13 21:23:46.219+00	113
76	images/products/2021/11/9780765319852.jpg		0	2021-11-13 21:23:46.223+00	29
77	images/products/2021/11/9781590593899.jpg		0	2021-11-13 21:23:46.227+00	136
78	images/products/2021/11/9780321278654.jpg		0	2021-11-13 21:23:46.23+00	167
79	images/products/2021/11/9780201633610.jpg		0	2021-11-13 21:23:46.234+00	100
80	images/products/2021/11/9780471578147.jpg		0	2021-11-13 21:23:46.237+00	152
81	images/products/2021/11/9780596002817.jpg		0	2021-11-13 21:23:46.241+00	121
82	images/products/2021/11/9780201700732.jpg		0	2021-11-13 21:23:46.244+00	107
83	images/products/2021/11/9780684833392.jpg		0	2021-11-13 21:23:46.247+00	26
84	images/products/2021/11/9780596517748.jpg		0	2021-11-13 21:23:46.251+00	108
85	images/products/2021/11/9781857987638.jpg		0	2021-11-13 21:23:46.254+00	95
86	images/products/2021/11/9781450556569.jpg		0	2021-11-13 21:23:46.259+00	41
87	images/products/2021/11/9781466207608.jpg		0	2021-11-13 21:23:46.262+00	77
88	images/products/2021/11/9781430219484.jpg		0	2021-11-13 21:23:46.266+00	207
89	images/products/2021/11/9780262062183.jpg		0	2021-11-13 21:23:46.269+00	118
90	images/products/2021/11/9780446361309.jpg		0	2021-11-13 21:23:46.272+00	86
91	images/products/2021/11/9780201379235.jpg		0	2021-11-13 21:23:46.276+00	161
92	images/products/2021/11/9780136291558.jpg		0	2021-11-13 21:23:46.279+00	139
93	images/products/2021/11/9780132350884.jpg		0	2021-11-13 21:23:46.284+00	106
94	images/products/2021/11/9780201615869.jpg		0	2021-11-13 21:23:46.287+00	119
95	images/products/2021/11/9780596514983.jpg		0	2021-11-13 21:23:46.291+00	114
96	images/products/2021/11/9780201835953.jpg		0	2021-11-13 21:23:46.294+00	104
97	images/products/2021/11/9780596101053.jpg		0	2021-11-13 21:23:46.298+00	133
98	images/products/2021/11/9780735619678.jpg		0	2021-11-13 21:23:46.302+00	105
99	images/products/2021/11/9780672326721.jpg		0	2021-11-13 21:23:46.305+00	144
100	images/products/2021/11/9780441013678.jpg		0	2021-11-13 21:23:46.309+00	33
101	images/products/2021/11/9781416507789.jpg		0	2021-11-13 21:23:46.312+00	71
102	images/products/2021/11/9780133708752.jpg		0	2021-11-13 21:23:46.316+00	126
103	images/products/2021/11/9780201741575.jpg		0	2021-11-13 21:23:46.32+00	165
104	images/products/2021/11/9780141000510.jpg		0	2021-11-13 21:23:46.323+00	184
105	images/products/2021/11/9780201433074.jpg		0	2021-11-13 21:23:46.326+00	134
106	images/products/2021/11/9780131481046.jpg		0	2021-11-13 21:23:46.33+00	205
107	images/products/2021/11/9780976694007.jpg		0	2021-11-13 21:23:46.334+00	130
108	images/products/2021/11/9780137081073.jpg		0	2021-11-13 21:23:46.337+00	150
109	images/products/2021/11/9780385533850.jpg		0	2021-11-13 21:23:46.341+00	36
110	images/products/2021/11/9781568582474.jpg		0	2021-11-13 21:23:46.344+00	66
111	images/products/2021/11/9780262510875.jpg		0	2021-11-13 21:23:46.347+00	101
112	images/products/2021/11/9781934356371.jpg		0	2021-11-13 21:23:46.35+00	138
113	images/products/2021/11/9780691147543.jpg		0	2021-11-13 21:23:46.353+00	37
114	images/products/2021/11/9781591840565.jpg		0	2021-11-13 21:23:46.357+00	169
115	images/products/2021/11/9780201100884.jpg		0	2021-11-13 21:23:46.36+00	109
116	images/products/2021/11/9780395860014.jpg		0	2021-11-13 21:23:46.363+00	82
117	images/products/2021/11/9781617290084.jpg		0	2021-11-13 21:23:46.366+00	174
118	images/products/2021/11/9780201342758.jpg		0	2021-11-13 21:23:46.369+00	141
119	images/products/2021/11/9780557043552.jpg		0	2021-11-13 21:23:46.372+00	177
120	images/products/2021/11/9781848000698.jpg		0	2021-11-13 21:23:46.375+00	156
121	images/products/2021/11/9780596809485.jpg		0	2021-11-13 21:23:46.379+00	173
122	images/products/2021/11/9780321334879.jpg		0	2021-11-13 21:23:46.384+00	128
123	images/products/2021/11/9780307269751.jpg		0	2021-11-13 21:23:46.388+00	194
124	images/products/2021/11/9780978739218.jpg		0	2021-11-13 21:23:46.392+00	151
125	images/products/2021/11/9780714530338.jpg		0	2021-11-13 21:23:46.396+00	69
126	images/products/2021/11/9780767907699.jpg		0	2021-11-13 21:23:46.4+00	149
127	images/products/2021/11/9781934356852.jpg		0	2021-11-13 21:23:46.405+00	153
128	images/products/2021/11/9780262560993.jpg		0	2021-11-13 21:23:46.409+00	115
129	images/products/2021/11/9780201914658.jpg		0	2021-11-13 21:23:46.412+00	198
130	images/products/2021/11/9780131103627.jpg		0	2021-11-13 21:23:46.415+00	98
131	images/products/2021/11/9780262111898.jpg		0	2021-11-13 21:23:46.418+00	171
132	images/products/2021/11/9780316213547.jpg		0	2021-11-13 21:23:46.421+00	192
133	images/products/2021/11/9780976458708.jpg		0	2021-11-13 21:23:46.424+00	172
134	images/products/2021/11/9780552151696.jpg		0	2021-11-13 21:23:46.427+00	42
135	images/products/2021/11/9780525951117.jpg		0	2021-11-13 21:23:46.43+00	18
136	images/products/2021/11/9780425198681.jpg		0	2021-11-13 21:23:46.433+00	39
137	images/products/2021/11/9780307430083.jpg		0	2021-11-13 21:23:46.436+00	65
138	images/products/2021/11/9780385333788.jpg		0	2021-11-13 21:23:46.439+00	21
139	images/products/2021/11/9780321146533.jpg		0	2021-11-13 21:23:46.442+00	124
140	images/products/2021/11/9781934356296.jpg		0	2021-11-13 21:23:46.445+00	164
\.


--
-- Data for Name: catalogue_productrecommendation; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.catalogue_productrecommendation (id, ranking, primary_id, recommendation_id) FROM stdin;
\.


--
-- Data for Name: communication_communicationeventtype; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.communication_communicationeventtype (id, code, name, category, email_subject_template, email_body_template, email_body_html_template, sms_template, date_created, date_updated) FROM stdin;
\.


--
-- Data for Name: communication_email; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.communication_email (id, subject, body_text, body_html, date_sent, user_id, email) FROM stdin;
\.


--
-- Data for Name: communication_notification; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.communication_notification (id, subject, body, location, date_sent, date_read, recipient_id, sender_id) FROM stdin;
\.


--
-- Data for Name: customer_productalert; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.customer_productalert (id, email, key, status, date_created, date_confirmed, date_cancelled, date_closed, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	sites	site
8	flatpages	flatpage
9	analytics	productrecord
10	analytics	userproductview
11	analytics	userrecord
12	analytics	usersearch
13	address	country
14	address	useraddress
15	shipping	orderanditemcharges
16	shipping	weightband
17	shipping	weightbased
18	catalogue	attributeoption
19	catalogue	attributeoptiongroup
20	catalogue	category
21	catalogue	option
22	catalogue	product
23	catalogue	productattribute
24	catalogue	productattributevalue
25	catalogue	productcategory
26	catalogue	productclass
27	catalogue	productimage
28	catalogue	productrecommendation
29	reviews	productreview
30	reviews	vote
31	communication	communicationeventtype
32	communication	email
33	communication	notification
34	partner	partner
35	partner	partneraddress
36	partner	stockalert
37	partner	stockrecord
38	basket	basket
39	basket	line
40	basket	lineattribute
41	payment	bankcard
42	payment	source
43	payment	sourcetype
44	payment	transaction
45	offer	benefit
46	offer	condition
47	offer	conditionaloffer
48	offer	range
49	offer	rangeproduct
50	offer	rangeproductfileupload
51	offer	absolutediscountbenefit
52	offer	countcondition
53	offer	coveragecondition
54	offer	fixedpricebenefit
55	offer	multibuydiscountbenefit
64	order	line
56	offer	percentagediscountbenefit
57	offer	shippingbenefit
58	offer	shippingabsolutediscountbenefit
59	offer	shippingfixedpricebenefit
60	offer	shippingpercentagediscountbenefit
61	offer	valuecondition
62	order	billingaddress
63	order	communicationevent
65	order	lineattribute
66	order	lineprice
67	order	order
68	order	orderdiscount
69	order	ordernote
70	order	paymentevent
71	order	paymenteventquantity
72	order	paymenteventtype
73	order	shippingaddress
74	order	shippingevent
75	order	shippingeventquantity
76	order	shippingeventtype
77	order	orderstatuschange
78	order	surcharge
79	customer	productalert
80	voucher	voucher
81	voucher	voucherapplication
82	voucher	voucherset
83	wishlists	line
84	wishlists	wishlist
85	thumbnail	kvstore
86	easy_thumbnails	source
87	easy_thumbnails	thumbnail
88	easy_thumbnails	thumbnaildimensions
\.


--
-- Data for Name: django_flatpage; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_flatpage (id, url, title, content, enable_comments, template_name, registration_required) FROM stdin;
1	/about/	About	Nisi thundercats fugiat, odio kale chips sapiente fap biodiesel polaroid bushwick duis before they sold out single-origin coffee pour-over. Gastropub scenester echo park messenger bag qui, sapiente sartorial pinterest quinoa american apparel odd future irony marfa. 3 wolf moon mixtape nulla VHS cupidatat blog jean shorts typewriter. Williamsburg cardigan terry richardson, wes anderson lomo PBR placeat ex ethnic in reprehenderit. Exercitation high life accusamus, id ut quis cred truffaut occupy ethical yr dreamcatcher godard occaecat cupidatat. American apparel cliche excepteur ullamco, twee umami id williamsburg vice bushwick. Hella vinyl mumblecore aliqua sartorial.\r\n\r\nKale chips pop-up echo park quinoa photo booth reprehenderit, odd future letterpress fap fugiat irure seitan 3 wolf moon DIY dreamcatcher. Fanny pack cupidatat street art sint aesthetic. Irony kale chips duis swag readymade cred. Mlkshk retro culpa sustainable tempor wes anderson, vinyl selvage esse gluten-free cliche Austin. Etsy kogi duis officia, excepteur wes anderson nulla. Delectus fixie chambray, swag you probably haven't heard of them qui gentrify veniam. Pork belly high life non, in shoreditch keffiyeh cosby sweater voluptate bushwick.\r\n\r\nSynth ex cardigan, fanny pack small batch vinyl DIY sartorial pork belly gentrify mumblecore godard irony. Twee blog forage, Austin placeat post-ironic pop-up williamsburg dolore chambray four loko culpa squid. Stumptown mumblecore aute, terry richardson nesciunt cardigan quinoa laborum letterpress. Est squid brooklyn placeat messenger bag, shoreditch williamsburg bushwick pour-over lo-fi post-ironic cray. Yr kale chips nihil brunch, culpa thundercats artisan. Organic aute flexitarian, do id blog ex banh mi cray carles craft beer messenger bag. Odio Austin sartorial bushwick aliqua sunt.\r\n\r\nAssumenda semiotics ut four loko cillum skateboard, lo-fi fanny pack sartorial non adipisicing carles ethnic narwhal elit. Aliqua tumblr readymade ennui terry richardson next level, fugiat placeat aesthetic 3 wolf moon bushwick. Qui retro godard hella odio, sapiente salvia ullamco eiusmod incididunt selvage. Organic bespoke eiusmod umami, farm-to-table fap beard food truck est forage. Banh mi pitchfork mcsweeney's elit, VHS duis irony williamsburg. Williamsburg voluptate synth bicycle rights, cardigan mixtape lomo pickled organic locavore. In seitan aliquip sriracha, id helvetica wolf thundercats viral ethical quinoa kogi.	f		f
\.


--
-- Data for Name: django_flatpage_sites; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_flatpage_sites (id, flatpage_id, site_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-11-16 18:39:29.927139+00
2	auth	0001_initial	2021-11-16 18:39:30.011406+00
3	address	0001_initial	2021-11-16 18:39:30.057018+00
4	address	0002_auto_20150927_1547	2021-11-16 18:39:30.083695+00
5	address	0003_auto_20150927_1551	2021-11-16 18:39:30.104971+00
6	address	0004_auto_20170226_1122	2021-11-16 18:39:30.120185+00
7	address	0005_regenerate_user_address_hashes	2021-11-16 18:39:30.132848+00
8	address	0006_auto_20181115_1953	2021-11-16 18:39:30.142016+00
9	address	0007_alter_useraddress_id	2021-11-16 18:39:30.16636+00
10	admin	0001_initial	2021-11-16 18:39:30.188183+00
11	admin	0002_logentry_remove_auto_add	2021-11-16 18:39:30.198904+00
12	admin	0003_logentry_add_action_flag_choices	2021-11-16 18:39:30.209887+00
13	catalogue	0001_initial	2021-11-16 18:39:30.624003+00
14	analytics	0001_initial	2021-11-16 18:39:30.767661+00
15	analytics	0002_auto_20140827_1705	2021-11-16 18:39:30.850189+00
16	analytics	0003_auto_20200801_0817	2021-11-16 18:39:30.881077+00
17	analytics	0004_auto_20211112_1930	2021-11-16 18:39:30.97849+00
18	contenttypes	0002_remove_content_type_name	2021-11-16 18:39:31.032246+00
19	auth	0002_alter_permission_name_max_length	2021-11-16 18:39:31.056469+00
20	auth	0003_alter_user_email_max_length	2021-11-16 18:39:31.068412+00
21	auth	0004_alter_user_username_opts	2021-11-16 18:39:31.07982+00
22	auth	0005_alter_user_last_login_null	2021-11-16 18:39:31.095606+00
23	auth	0006_require_contenttypes_0002	2021-11-16 18:39:31.098936+00
24	auth	0007_alter_validators_add_error_messages	2021-11-16 18:39:31.121332+00
25	auth	0008_alter_user_username_max_length	2021-11-16 18:39:31.142001+00
26	auth	0009_alter_user_last_name_max_length	2021-11-16 18:39:31.154467+00
27	auth	0010_alter_group_name_max_length	2021-11-16 18:39:31.177641+00
28	auth	0011_update_proxy_permissions	2021-11-16 18:39:31.208354+00
29	auth	0012_alter_user_first_name_max_length	2021-11-16 18:39:31.227434+00
30	sites	0001_initial	2021-11-16 18:39:31.236393+00
31	partner	0001_initial	2021-11-16 18:39:31.392947+00
32	customer	0001_initial	2021-11-16 18:39:31.607855+00
33	basket	0001_initial	2021-11-16 18:39:31.635524+00
34	basket	0002_auto_20140827_1705	2021-11-16 18:39:31.808571+00
35	order	0001_initial	2021-11-16 18:39:33.215268+00
36	offer	0001_initial	2021-11-16 18:39:33.74584+00
37	voucher	0001_initial	2021-11-16 18:39:33.879817+00
38	basket	0003_basket_vouchers	2021-11-16 18:39:33.954334+00
39	basket	0004_auto_20141007_2032	2021-11-16 18:39:33.982843+00
40	basket	0005_auto_20150604_1450	2021-11-16 18:39:34.044108+00
41	basket	0006_auto_20160111_1108	2021-11-16 18:39:34.071675+00
42	basket	0007_slugfield_noop	2021-11-16 18:39:34.099272+00
43	basket	0008_auto_20181115_1953	2021-11-16 18:39:34.244778+00
44	basket	0009_line_date_updated	2021-11-16 18:39:34.278859+00
45	basket	0010_auto_20211112_1930	2021-11-16 18:39:34.476431+00
46	catalogue	0002_auto_20150217_1221	2021-11-16 18:39:34.502444+00
47	catalogue	0003_data_migration_slugs	2021-11-16 18:39:34.55539+00
48	catalogue	0004_auto_20150217_1710	2021-11-16 18:39:34.613311+00
49	catalogue	0005_auto_20150604_1450	2021-11-16 18:39:34.666707+00
50	catalogue	0006_auto_20150807_1725	2021-11-16 18:39:34.720491+00
51	catalogue	0007_auto_20151207_1440	2021-11-16 18:39:34.73296+00
52	catalogue	0008_auto_20160304_1652	2021-11-16 18:39:34.901402+00
53	catalogue	0009_slugfield_noop	2021-11-16 18:39:34.956333+00
54	catalogue	0010_auto_20170420_0439	2021-11-16 18:39:35.124801+00
55	catalogue	0011_auto_20170422_1355	2021-11-16 18:39:35.151192+00
56	catalogue	0012_auto_20170609_1902	2021-11-16 18:39:35.227706+00
57	catalogue	0013_auto_20170821_1548	2021-11-16 18:39:35.281885+00
58	catalogue	0014_auto_20181115_1953	2021-11-16 18:39:35.53819+00
59	catalogue	0015_product_is_public	2021-11-16 18:39:35.565134+00
60	catalogue	0016_auto_20190327_0757	2021-11-16 18:39:35.848067+00
61	catalogue	0017_auto_20190816_0938	2021-11-16 18:39:36.080463+00
62	catalogue	0018_auto_20191220_0920	2021-11-16 18:39:36.161333+00
63	catalogue	0019_option_required	2021-11-16 18:39:36.276293+00
64	catalogue	0020_auto_20200801_0817	2021-11-16 18:39:36.395301+00
65	catalogue	0021_auto_20201005_0844	2021-11-16 18:39:36.460846+00
66	catalogue	0022_auto_20210210_0539	2021-11-16 18:39:36.631759+00
67	catalogue	0023_auto_20210824_1414	2021-11-16 18:39:36.691146+00
68	catalogue	0024_auto_20211112_1930	2021-11-16 18:39:37.924608+00
69	order	0002_auto_20141007_2032	2021-11-16 18:39:37.970201+00
70	order	0003_auto_20150113_1629	2021-11-16 18:39:37.999553+00
71	order	0004_auto_20160111_1108	2021-11-16 18:39:38.040962+00
72	order	0005_update_email_length	2021-11-16 18:39:38.071869+00
73	order	0006_orderstatuschange	2021-11-16 18:39:38.13819+00
74	order	0007_auto_20181115_1953	2021-11-16 18:39:38.371393+00
75	customer	0002_auto_20150807_1725	2021-11-16 18:39:38.380115+00
76	customer	0003_update_email_length	2021-11-16 18:39:38.420815+00
77	customer	0004_email_save	2021-11-16 18:39:38.503108+00
78	customer	0005_auto_20181115_1953	2021-11-16 18:39:38.527947+00
79	communication	0001_initial	2021-11-16 18:39:38.642489+00
80	order	0008_auto_20190301_1035	2021-11-16 18:39:38.704117+00
81	communication	0002_reset_table_names	2021-11-16 18:39:38.757547+00
82	communication	0003_remove_notification_category_make_code_uppercase	2021-11-16 18:39:38.78447+00
83	communication	0004_auto_20200801_0817	2021-11-16 18:39:38.822852+00
84	communication	0005_auto_20211112_1930	2021-11-16 18:39:39.091481+00
85	customer	0006_auto_20190430_1736	2021-11-16 18:39:39.252531+00
86	customer	0007_auto_20200801_0817	2021-11-16 18:39:39.323401+00
87	customer	0008_alter_productalert_id	2021-11-16 18:39:39.372979+00
88	easy_thumbnails	0001_initial	2021-11-16 18:39:39.42289+00
89	easy_thumbnails	0002_thumbnaildimensions	2021-11-16 18:39:39.438173+00
90	flatpages	0001_initial	2021-11-16 18:39:39.51791+00
91	offer	0002_auto_20151210_1053	2021-11-16 18:39:39.54125+00
92	offer	0003_auto_20161120_1707	2021-11-16 18:39:39.563733+00
93	offer	0004_auto_20170415_1518	2021-11-16 18:39:39.579842+00
94	offer	0005_auto_20170423_1217	2021-11-16 18:39:39.796568+00
95	offer	0006_auto_20170504_0616	2021-11-16 18:39:39.917491+00
96	offer	0007_conditionaloffer_exclusive	2021-11-16 18:39:39.933879+00
97	offer	0008_auto_20181115_1953	2021-11-16 18:39:40.028201+00
98	offer	0009_auto_20200801_0817	2021-11-16 18:39:40.056353+00
99	offer	0010_conditionaloffer_combinations	2021-11-16 18:39:40.128913+00
100	offer	0011_auto_20211112_1930	2021-11-16 18:39:40.706835+00
101	order	0008_surcharge	2021-11-16 18:39:40.773735+00
102	order	0010_auto_20200724_0909	2021-11-16 18:39:40.892009+00
103	order	0011_auto_20200801_0817	2021-11-16 18:39:41.060235+00
104	order	0012_auto_20211112_1930	2021-11-16 18:39:42.344221+00
105	partner	0002_auto_20141007_2032	2021-11-16 18:39:42.386308+00
106	partner	0003_auto_20150604_1450	2021-11-16 18:39:42.445792+00
107	partner	0004_auto_20160107_1755	2021-11-16 18:39:42.469443+00
108	partner	0005_auto_20181115_1953	2021-11-16 18:39:42.515492+00
109	partner	0006_auto_20200724_0909	2021-11-16 18:39:42.736051+00
110	partner	0007_auto_20211112_1930	2021-11-16 18:39:43.020286+00
111	payment	0001_initial	2021-11-16 18:39:43.405298+00
112	payment	0002_auto_20141007_2032	2021-11-16 18:39:43.428804+00
113	payment	0003_auto_20160323_1520	2021-11-16 18:39:43.451414+00
114	payment	0004_auto_20181115_1953	2021-11-16 18:39:43.464998+00
115	payment	0005_auto_20200801_0817	2021-11-16 18:39:43.498455+00
116	payment	0006_auto_20211112_1930	2021-11-16 18:39:43.719732+00
117	reviews	0001_initial	2021-11-16 18:39:43.929762+00
118	reviews	0002_update_email_length	2021-11-16 18:39:43.971042+00
119	reviews	0003_auto_20160802_1358	2021-11-16 18:39:44.132887+00
120	reviews	0004_auto_20170429_0941	2021-11-16 18:39:44.192017+00
121	reviews	0005_auto_20211112_1930	2021-11-16 18:39:44.311746+00
122	sessions	0001_initial	2021-11-16 18:39:44.327903+00
123	shipping	0001_initial	2021-11-16 18:39:44.570669+00
124	shipping	0002_auto_20150604_1450	2021-11-16 18:39:44.835217+00
125	shipping	0003_auto_20181115_1953	2021-11-16 18:39:44.870612+00
126	shipping	0004_auto_20211112_1930	2021-11-16 18:39:45.020772+00
127	sites	0002_alter_domain_unique	2021-11-16 18:39:45.091028+00
128	thumbnail	0001_initial	2021-11-16 18:39:45.104477+00
129	voucher	0002_auto_20170418_2132	2021-11-16 18:39:45.22787+00
130	voucher	0003_auto_20171212_0411	2021-11-16 18:39:45.293473+00
131	voucher	0004_auto_20180228_0940	2021-11-16 18:39:45.565271+00
132	voucher	0005_auto_20180402_1425	2021-11-16 18:39:45.627301+00
133	voucher	0006_auto_20180413_0911	2021-11-16 18:39:45.642794+00
134	voucher	0007_auto_20181115_1953	2021-11-16 18:39:45.779421+00
135	voucher	0008_auto_20200801_0817	2021-11-16 18:39:45.948303+00
136	voucher	0009_make_voucher_names_unique	2021-11-16 18:39:46.131618+00
137	voucher	0010_auto_20210224_0712	2021-11-16 18:39:46.284987+00
138	voucher	0011_auto_20211112_1930	2021-11-16 18:39:46.5387+00
139	wishlists	0001_initial	2021-11-16 18:39:46.906009+00
140	wishlists	0002_auto_20160111_1108	2021-11-16 18:39:46.93709+00
141	wishlists	0003_auto_20181115_1953	2021-11-16 18:39:46.965154+00
142	wishlists	0004_auto_20211112_1930	2021-11-16 18:39:47.095764+00
143	order	0009_surcharge	2021-11-16 18:39:47.102631+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
8v4vxqtm54b5wizzn7bgq8u2vh1q7mdn	eyJfbGFuZ3VhZ2UiOiJlbi1nYiJ9:1mm1aJ:sXb0ngpCr3BytBCkHQ8SPQxIMMo1e3ecnHMB1ozOog8	2021-11-27 22:33:19.297+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	example.com
\.


--
-- Data for Name: easy_thumbnails_source; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.easy_thumbnails_source (id, storage_hash, name, modified) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_thumbnail; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.easy_thumbnails_thumbnail (id, storage_hash, name, modified, source_id) FROM stdin;
\.


--
-- Data for Name: easy_thumbnails_thumbnaildimensions; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.easy_thumbnails_thumbnaildimensions (id, thumbnail_id, width, height) FROM stdin;
\.


--
-- Data for Name: offer_benefit; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_benefit (id, type, value, max_affected_items, proxy_class, range_id) FROM stdin;
1	Multibuy	\N	\N	\N	1
2		\N	\N	apps.offers.ChangesOwnerName	\N
3	Shipping fixed price	1.99	\N	\N	\N
\.


--
-- Data for Name: offer_condition; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_condition (id, type, value, proxy_class, range_id) FROM stdin;
1	Count	3.00	\N	1
2	Count	1.00	\N	1
3	Count	1.00	\N	1
\.


--
-- Data for Name: offer_conditionaloffer; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_conditionaloffer (id, name, slug, description, offer_type, status, priority, start_datetime, end_datetime, max_global_applications, max_user_applications, max_basket_applications, max_discount, total_discount, num_applications, num_orders, redirect_url, date_created, benefit_id, condition_id, exclusive) FROM stdin;
1	Normal site offer	dave	This is a normal site offer.<br>	Site	Open	0	2013-02-21 00:00:00+00	\N	\N	\N	\N	\N	0.00	0	0		2013-02-21 15:50:56.701+00	1	1	t
2	Deferred benefit offer	deferred-benefit-offer	This offer gives a deferred benefit.&nbsp; Eg, it does something once the offer has been placed.<br>	Site	Open	0	2013-03-12 00:00:00+00	\N	\N	\N	\N	\N	0.00	0	0		2013-03-12 15:42:51.662+00	2	2	t
3	Shipping offer	shipping-offer	This gives a shipping discount<br>	Site	Open	0	2013-03-12 00:00:00+00	\N	\N	\N	\N	\N	0.00	0	0		2013-03-12 15:43:43.839+00	3	3	t
\.


--
-- Data for Name: offer_conditionaloffer_combinations; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_conditionaloffer_combinations (id, from_conditionaloffer_id, to_conditionaloffer_id) FROM stdin;
\.


--
-- Data for Name: offer_range; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_range (id, name, slug, description, is_public, includes_all_products, proxy_class, date_created) FROM stdin;
1	Site			f	t	\N	2013-02-21 15:26:09.651+00
2	Fiction books	fiction-books		f	f	\N	2013-02-21 16:25:38.805+00
\.


--
-- Data for Name: offer_range_classes; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_range_classes (id, range_id, productclass_id) FROM stdin;
\.


--
-- Data for Name: offer_range_excluded_products; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_range_excluded_products (id, range_id, product_id) FROM stdin;
\.


--
-- Data for Name: offer_range_included_categories; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_range_included_categories (id, range_id, category_id) FROM stdin;
1	2	2
\.


--
-- Data for Name: offer_rangeproduct; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_rangeproduct (id, display_order, product_id, range_id) FROM stdin;
\.


--
-- Data for Name: offer_rangeproductfileupload; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.offer_rangeproductfileupload (id, filepath, size, date_uploaded, status, error_message, date_processed, num_new_skus, num_unknown_skus, num_duplicate_skus, range_id, uploaded_by_id) FROM stdin;
\.


--
-- Data for Name: order_billingaddress; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_billingaddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, country_id) FROM stdin;
\.


--
-- Data for Name: order_communicationevent; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_communicationevent (id, date_created, event_type_id, order_id) FROM stdin;
\.


--
-- Data for Name: order_line; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_line (id, partner_name, partner_sku, partner_line_reference, partner_line_notes, title, upc, quantity, line_price_incl_tax, line_price_excl_tax, line_price_before_discounts_incl_tax, line_price_before_discounts_excl_tax, unit_price_incl_tax, unit_price_excl_tax, status, order_id, partner_id, product_id, stockrecord_id) FROM stdin;
1	Book partner	9780553380958			Snow Crash	9780553380958	1	7.99	7.99	7.99	7.99	7.99	7.99	Pending	1	3	12	6
\.


--
-- Data for Name: order_lineattribute; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_lineattribute (id, type, value, line_id, option_id) FROM stdin;
\.


--
-- Data for Name: order_lineprice; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_lineprice (id, quantity, price_incl_tax, price_excl_tax, shipping_incl_tax, shipping_excl_tax, line_id, order_id) FROM stdin;
1	1	7.99	7.99	0.00	0.00	1	1
\.


--
-- Data for Name: order_order; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_order (id, number, currency, total_incl_tax, total_excl_tax, shipping_incl_tax, shipping_excl_tax, shipping_method, shipping_code, status, guest_email, date_placed, basket_id, billing_address_id, shipping_address_id, site_id, user_id) FROM stdin;
1	100099	GBP	7.99	7.99	0.00	0.00	Free shipping	free-shipping	Pending		2014-10-10 13:07:36.499+00	\N	\N	1	1	1
\.


--
-- Data for Name: order_orderdiscount; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_orderdiscount (id, category, offer_id, offer_name, voucher_id, voucher_code, frequency, amount, message, order_id) FROM stdin;
1	Deferred	2	Deferred benefit offer	\N		1	0.00	Your name has been changed to Barry!	1
\.


--
-- Data for Name: order_ordernote; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_ordernote (id, note_type, message, date_created, date_updated, order_id, user_id) FROM stdin;
\.


--
-- Data for Name: order_orderstatuschange; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_orderstatuschange (id, old_status, new_status, date_created, order_id) FROM stdin;
\.


--
-- Data for Name: order_paymentevent; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_paymentevent (id, amount, reference, date_created, event_type_id, order_id, shipping_event_id) FROM stdin;
\.


--
-- Data for Name: order_paymenteventquantity; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_paymenteventquantity (id, quantity, event_id, line_id) FROM stdin;
\.


--
-- Data for Name: order_paymenteventtype; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_paymenteventtype (id, name, code) FROM stdin;
\.


--
-- Data for Name: order_shippingaddress; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_shippingaddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, phone_number, notes, country_id) FROM stdin;
1	Ms	Emery	Martin	Iusto ut rem doloribus irure non architecto tempor rerum ex et ut	Earum id magnam et libero voluptas sed et et	Voluptas illum alias facilis recusandae Laudantium	Velit non aut repellendus Sint ut incididunt eiusmod aliqua Et	Excepteur eos distinctio Ut eu	EN1 9EL	Emery Martin Iusto ut rem doloribus irure non architecto tempor rerum ex et ut Earum id magnam et libero voluptas sed et et Voluptas illum alias facilis recusandae Laudantium Velit non aut repellendus Sint ut incididunt eiusmod aliqua Et Excepteur eos distinctio Ut eu EN1 9EL United Kingdom of Great Britain and Northern Ireland		Velit enim eos, asperiores architecto nesciunt, non ad dolor ullam esse, in et eum qui in recusandae.	GB
\.


--
-- Data for Name: order_shippingevent; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_shippingevent (id, notes, date_created, event_type_id, order_id) FROM stdin;
\.


--
-- Data for Name: order_shippingeventquantity; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_shippingeventquantity (id, quantity, event_id, line_id) FROM stdin;
\.


--
-- Data for Name: order_shippingeventtype; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_shippingeventtype (id, name, code) FROM stdin;
\.


--
-- Data for Name: order_surcharge; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.order_surcharge (id, name, code, incl_tax, excl_tax, order_id) FROM stdin;
\.


--
-- Data for Name: partner_partner; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.partner_partner (id, code, name) FROM stdin;
2	clothing-partner	Clothing partner
3	book-partner	Book partner
\.


--
-- Data for Name: partner_partner_users; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.partner_partner_users (id, partner_id, user_id) FROM stdin;
\.


--
-- Data for Name: partner_partneraddress; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.partner_partneraddress (id, title, first_name, last_name, line1, line2, line3, line4, state, postcode, search_text, country_id, partner_id) FROM stdin;
\.


--
-- Data for Name: partner_stockalert; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.partner_stockalert (id, threshold, status, date_created, date_closed, stockrecord_id) FROM stdin;
\.


--
-- Data for Name: partner_stockrecord; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.partner_stockrecord (id, partner_sku, price_currency, price, num_in_stock, num_allocated, low_stock_threshold, date_created, date_updated, partner_id, product_id) FROM stdin;
1	clf-large	GBP	10.00	0	\N	\N	2013-12-13 11:37:08.232+00	2013-12-13 11:37:08.232+00	2	6
2	clf-med	GBP	10.00	0	\N	\N	2013-12-13 11:37:45.928+00	2013-12-13 11:37:45.928+00	2	7
3	tng-small	GBP	15.00	100	\N	\N	2013-12-13 11:38:49.858+00	2013-12-13 11:38:49.858+00	2	9
4	tng-med	GBP	15.00	200	\N	\N	2013-12-13 11:39:12.947+00	2013-12-13 11:39:12.947+00	2	10
5	tng-large	GBP	15.00	0	\N	\N	2013-12-13 11:39:53.162+00	2013-12-13 11:39:53.162+00	2	11
6	9780553380958	GBP	7.99	27	\N	\N	2021-11-13 21:23:41.042+00	2021-11-13 21:23:44.244+00	3	12
7	9780441569595	GBP	7.99	51	\N	\N	2021-11-13 21:23:41.064+00	2021-11-13 21:23:41.064+00	3	13
8	9780060512804	GBP	16.99	56	\N	\N	2021-11-13 21:23:41.083+00	2021-11-13 21:23:41.083+00	3	14
9	9780345391803	GBP	17.99	58	\N	\N	2021-11-13 21:23:41.1+00	2021-11-13 21:23:41.101+00	3	15
10	9780553382563	GBP	17.99	54	\N	\N	2021-11-13 21:23:41.119+00	2021-11-13 21:23:41.119+00	3	16
11	9780340837948	GBP	2.99	52	\N	\N	2021-11-13 21:23:41.137+00	2021-11-13 21:23:41.137+00	3	17
12	9780525951117	GBP	22.99	64	\N	\N	2021-11-13 21:23:41.156+00	2021-11-13 21:23:41.156+00	3	18
13	9780451457998	GBP	7.99	36	\N	\N	2021-11-13 21:23:41.174+00	2021-11-13 21:23:41.174+00	3	19
14	9780905712826	GBP	14.99	30	\N	\N	2021-11-13 21:23:41.192+00	2021-11-13 21:23:41.192+00	3	20
15	9780385333788	GBP	2.99	94	\N	\N	2021-11-13 21:23:41.21+00	2021-11-13 21:23:41.21+00	3	21
16	9780553294613	GBP	5.99	85	\N	\N	2021-11-13 21:23:41.229+00	2021-11-13 21:23:41.229+00	3	22
17	9780060987046	GBP	2.99	61	\N	\N	2021-11-13 21:23:41.247+00	2021-11-13 21:23:41.247+00	3	23
18	9780525951575	GBP	25.99	43	\N	\N	2021-11-13 21:23:41.265+00	2021-11-13 21:23:41.265+00	3	24
19	9780345331199	GBP	20.99	15	\N	\N	2021-11-13 21:23:41.284+00	2021-11-13 21:23:41.284+00	3	25
20	9780684833392	GBP	0.99	34	\N	\N	2021-11-13 21:23:41.303+00	2021-11-13 21:23:41.303+00	3	26
21	9780450055508	GBP	26.99	13	\N	\N	2021-11-13 21:23:41.322+00	2021-11-13 21:23:41.322+00	3	27
22	9780307887436	GBP	8.99	4	\N	\N	2021-11-13 21:23:41.342+00	2021-11-13 21:23:41.342+00	3	28
23	9780765319852	GBP	2.99	92	\N	\N	2021-11-13 21:23:41.36+00	2021-11-13 21:23:44.089+00	3	29
24	9780765348272	GBP	17.99	23	\N	\N	2021-11-13 21:23:41.38+00	2021-11-13 21:23:41.38+00	3	30
25	9781429963947	GBP	22.99	74	\N	\N	2021-11-13 21:23:41.399+00	2021-11-13 21:23:41.399+00	3	31
26	9781409903291	GBP	11.99	19	\N	\N	2021-11-13 21:23:41.419+00	2021-11-13 21:23:41.419+00	3	32
27	9780441013678	GBP	21.99	68	\N	\N	2021-11-13 21:23:41.441+00	2021-11-13 21:23:41.441+00	3	33
28	9780553380965	GBP	5.99	85	\N	\N	2021-11-13 21:23:41.46+00	2021-11-13 21:23:41.46+00	3	34
29	9780345467171	GBP	20.99	81	\N	\N	2021-11-13 21:23:41.479+00	2021-11-13 21:23:41.479+00	3	35
30	9780385533850	GBP	16.99	7	\N	\N	2021-11-13 21:23:41.498+00	2021-11-13 21:23:41.498+00	3	36
31	9780691147543	GBP	7.99	35	\N	\N	2021-11-13 21:23:41.517+00	2021-11-13 21:23:41.517+00	3	37
32	9780307594778	GBP	20.99	58	\N	\N	2021-11-13 21:23:41.536+00	2021-11-13 21:23:41.536+00	3	38
33	9780425198681	GBP	16.99	85	\N	\N	2021-11-13 21:23:41.554+00	2021-11-13 21:23:41.554+00	3	39
34	9780441016792	GBP	5.99	50	\N	\N	2021-11-13 21:23:41.573+00	2021-11-13 21:23:41.573+00	3	40
35	9781450556569	GBP	6.99	48	\N	\N	2021-11-13 21:23:41.592+00	2021-11-13 21:23:41.592+00	3	41
36	9780552151696	GBP	9.99	33	\N	\N	2021-11-13 21:23:41.612+00	2021-11-13 21:23:41.612+00	3	42
37	9780763622596	GBP	2.99	78	\N	\N	2021-11-13 21:23:41.632+00	2021-11-13 21:23:41.632+00	3	43
38	9780804115483	GBP	1.99	37	\N	\N	2021-11-13 21:23:41.652+00	2021-11-13 21:23:41.652+00	3	44
39	9780441363957	GBP	8.99	47	\N	\N	2021-11-13 21:23:41.672+00	2021-11-13 21:23:41.672+00	3	45
40	9780553264654	GBP	28.99	68	\N	\N	2021-11-13 21:23:41.692+00	2021-11-13 21:23:41.692+00	3	46
41	9780446364966	GBP	3.99	4	\N	\N	2021-11-13 21:23:41.713+00	2021-11-13 21:23:41.713+00	3	47
42	9780312423131	GBP	17.99	71	\N	\N	2021-11-13 21:23:41.732+00	2021-11-13 21:23:41.732+00	3	48
43	9780982792827	GBP	2.99	74	\N	\N	2021-11-13 21:23:41.751+00	2021-11-13 21:23:41.751+00	3	49
44	9780156032971	GBP	8.99	93	\N	\N	2021-11-13 21:23:41.77+00	2021-11-13 21:23:41.77+00	3	50
45	9780553575378	GBP	16.99	16	\N	\N	2021-11-13 21:23:41.79+00	2021-11-13 21:23:41.79+00	3	51
46	9780812524826	GBP	12.99	9	\N	\N	2021-11-13 21:23:41.809+00	2021-11-13 21:23:41.809+00	3	52
47	9780425074657	GBP	23.99	31	\N	\N	2021-11-13 21:23:41.827+00	2021-11-13 21:23:41.827+00	3	53
48	9780425074671	GBP	19.99	97	\N	\N	2021-11-13 21:23:41.846+00	2021-11-13 21:23:41.846+00	3	54
49	9781425470890	GBP	14.99	43	\N	\N	2021-11-13 21:23:41.865+00	2021-11-13 21:23:41.865+00	3	55
50	9780375724503	GBP	1.99	3	\N	\N	2021-11-13 21:23:41.883+00	2021-11-13 21:23:41.883+00	3	56
51	9780812536362	GBP	7.99	37	\N	\N	2021-11-13 21:23:41.902+00	2021-11-13 21:23:41.902+00	3	57
52	9780452286511	GBP	11.99	37	\N	\N	2021-11-13 21:23:41.92+00	2021-11-13 21:23:41.92+00	3	58
53	9780881848120	GBP	24.99	94	\N	\N	2021-11-13 21:23:41.939+00	2021-11-13 21:23:41.939+00	3	59
54	9780345475824	GBP	14.99	39	\N	\N	2021-11-13 21:23:41.958+00	2021-11-13 21:23:41.958+00	3	60
55	9781416533214	GBP	5.99	58	\N	\N	2021-11-13 21:23:41.977+00	2021-11-13 21:23:41.977+00	3	61
56	9781419669972	GBP	21.99	21	\N	\N	2021-11-13 21:23:41.996+00	2021-11-13 21:23:41.996+00	3	62
57	9780375700514	GBP	23.99	52	\N	\N	2021-11-13 21:23:42.016+00	2021-11-13 21:23:42.016+00	3	63
58	9781575660813	GBP	13.99	20	\N	\N	2021-11-13 21:23:42.036+00	2021-11-13 21:23:42.036+00	3	64
59	9780307430083	GBP	0.99	13	\N	\N	2021-11-13 21:23:42.054+00	2021-11-13 21:23:42.054+00	3	65
60	9781568582474	GBP	11.99	26	\N	\N	2021-11-13 21:23:42.073+00	2021-11-13 21:23:42.073+00	3	66
61	9781607012115	GBP	7.99	89	\N	\N	2021-11-13 21:23:42.091+00	2021-11-13 21:23:42.091+00	3	67
62	9780752837451	GBP	12.99	81	\N	\N	2021-11-13 21:23:42.109+00	2021-11-13 21:23:42.109+00	3	68
63	9780714530338	GBP	1.99	85	\N	\N	2021-11-13 21:23:42.128+00	2021-11-13 21:23:42.128+00	3	69
64	9780593018958	GBP	25.99	11	\N	\N	2021-11-13 21:23:42.147+00	2021-11-13 21:23:42.147+00	3	70
65	9781416507789	GBP	9.99	14	\N	\N	2021-11-13 21:23:42.165+00	2021-11-13 21:23:43.884+00	3	71
66	9780425137482	GBP	19.99	96	\N	\N	2021-11-13 21:23:42.183+00	2021-11-13 21:23:42.183+00	3	72
67	9780486419268	GBP	22.99	86	\N	\N	2021-11-13 21:23:42.201+00	2021-11-13 21:23:42.201+00	3	73
68	9780786123322	GBP	17.99	77	\N	\N	2021-11-13 21:23:42.219+00	2021-11-13 21:23:42.219+00	3	74
69	9780812531930	GBP	17.99	23	\N	\N	2021-11-13 21:23:42.238+00	2021-11-13 21:23:42.238+00	3	75
70	9781556342332	GBP	22.99	10	\N	\N	2021-11-13 21:23:42.256+00	2021-11-13 21:23:42.256+00	3	76
71	9781466207608	GBP	22.99	19	\N	\N	2021-11-13 21:23:42.273+00	2021-11-13 21:23:42.273+00	3	77
72	9780553290028	GBP	25.99	92	\N	\N	2021-11-13 21:23:42.291+00	2021-11-13 21:23:42.291+00	3	78
73	9780252072239	GBP	3.99	23	\N	\N	2021-11-13 21:23:42.31+00	2021-11-13 21:23:42.31+00	3	79
74	9780886822330	GBP	19.99	46	\N	\N	2021-11-13 21:23:42.329+00	2021-11-13 21:23:42.329+00	3	80
75	9780595297634	GBP	25.99	40	\N	\N	2021-11-13 21:23:42.347+00	2021-11-13 21:23:42.348+00	3	81
76	9780395860014	GBP	24.99	0	\N	\N	2021-11-13 21:23:42.367+00	2021-11-13 21:23:42.367+00	3	82
77	9780575061897	GBP	24.99	32	\N	\N	2021-11-13 21:23:42.384+00	2021-11-13 21:23:42.384+00	3	83
78	9780345275172	GBP	6.99	13	\N	\N	2021-11-13 21:23:42.399+00	2021-11-13 21:23:42.399+00	3	84
79	9780743421928	GBP	1.99	76	\N	\N	2021-11-13 21:23:42.417+00	2021-11-13 21:23:42.417+00	3	85
80	9780446361309	GBP	26.99	57	\N	\N	2021-11-13 21:23:42.435+00	2021-11-13 21:23:42.435+00	3	86
81	9780671559168	GBP	4.99	36	\N	\N	2021-11-13 21:23:42.452+00	2021-11-13 21:23:42.452+00	3	87
82	9781935554158	GBP	1.99	54	\N	\N	2021-11-13 21:23:42.467+00	2021-11-13 21:23:42.467+00	3	88
83	9780552088046	GBP	26.99	27	\N	\N	2021-11-13 21:23:42.483+00	2021-11-13 21:23:42.483+00	3	89
84	9781857988369	GBP	7.99	9	\N	\N	2021-11-13 21:23:42.499+00	2021-11-13 21:23:42.5+00	3	90
85	9780575601604	GBP	10.99	48	\N	\N	2021-11-13 21:23:42.517+00	2021-11-13 21:23:42.517+00	3	91
86	9781345004373	GBP	18.99	31	\N	\N	2021-11-13 21:23:42.535+00	2021-11-13 21:23:42.535+00	3	92
87	9780380816033	GBP	5.99	62	\N	\N	2021-11-13 21:23:42.551+00	2021-11-13 21:23:42.551+00	3	93
88	9780671720735	GBP	28.99	87	\N	\N	2021-11-13 21:23:42.567+00	2021-11-13 21:23:42.567+00	3	94
89	9781857987638	GBP	16.99	74	\N	\N	2021-11-13 21:23:42.582+00	2021-11-13 21:23:42.582+00	3	95
90	9780671559700	GBP	18.99	97	\N	\N	2021-11-13 21:23:42.598+00	2021-11-13 21:23:42.598+00	3	96
91	9780812580860	GBP	26.99	96	\N	\N	2021-11-13 21:23:42.624+00	2021-11-13 21:23:42.625+00	3	97
92	9780131103627	GBP	9.99	20	\N	\N	2021-11-13 21:23:42.696+00	2021-11-13 21:23:42.696+00	3	98
93	9780201616224	GBP	3.99	82	\N	\N	2021-11-13 21:23:42.737+00	2021-11-13 21:23:42.737+00	3	99
94	9780201633610	GBP	23.99	74	\N	\N	2021-11-13 21:23:42.752+00	2021-11-13 21:23:42.752+00	3	100
95	9780262510875	GBP	23.99	54	\N	\N	2021-11-13 21:23:42.765+00	2021-11-13 21:23:42.765+00	3	101
96	9780201485677	GBP	1.99	9	\N	\N	2021-11-13 21:23:42.779+00	2021-11-13 21:23:42.779+00	3	102
97	9780201485417	GBP	18.99	37	\N	\N	2021-11-13 21:23:42.791+00	2021-11-13 21:23:42.791+00	3	103
98	9780201835953	GBP	8.99	90	\N	\N	2021-11-13 21:23:42.804+00	2021-11-13 21:23:42.805+00	3	104
99	9780735619678	GBP	27.99	88	\N	\N	2021-11-13 21:23:42.818+00	2021-11-13 21:23:42.818+00	3	105
100	9780132350884	GBP	1.99	91	\N	\N	2021-11-13 21:23:42.831+00	2021-11-13 21:23:42.831+00	3	106
101	9780201700732	GBP	11.99	88	\N	\N	2021-11-13 21:23:42.844+00	2021-11-13 21:23:42.844+00	3	107
102	9780596517748	GBP	21.99	49	\N	\N	2021-11-13 21:23:42.856+00	2021-11-13 21:23:42.856+00	3	108
103	9780201100884	GBP	15.99	2	\N	\N	2021-11-13 21:23:42.868+00	2021-11-13 21:23:42.868+00	3	109
104	9780130313584	GBP	16.99	23	\N	\N	2021-11-13 21:23:42.881+00	2021-11-13 21:23:42.881+00	3	110
105	9780137903955	GBP	9.99	23	\N	\N	2021-11-13 21:23:42.893+00	2021-11-13 21:23:42.893+00	3	111
106	9780262011532	GBP	28.99	5	\N	\N	2021-11-13 21:23:42.905+00	2021-11-13 21:23:42.905+00	3	112
107	9780139376818	GBP	24.99	44	\N	\N	2021-11-13 21:23:42.917+00	2021-11-13 21:23:42.917+00	3	113
108	9780596514983	GBP	11.99	18	\N	\N	2021-11-13 21:23:42.93+00	2021-11-13 21:23:42.93+00	3	114
109	9780262560993	GBP	21.99	31	\N	\N	2021-11-13 21:23:42.943+00	2021-11-13 21:23:42.943+00	3	115
110	9780596007126	GBP	23.99	12	\N	\N	2021-11-13 21:23:42.957+00	2021-11-13 21:23:42.957+00	3	116
111	9780131177055	GBP	24.99	23	\N	\N	2021-11-13 21:23:42.97+00	2021-11-13 21:23:42.97+00	3	117
112	9780262062183	GBP	15.99	4	\N	\N	2021-11-13 21:23:42.983+00	2021-11-13 21:23:42.983+00	3	118
113	9780201615869	GBP	15.99	63	\N	\N	2021-11-13 21:23:42.996+00	2021-11-13 21:23:42.996+00	3	119
114	9780974514055	GBP	1.99	61	\N	\N	2021-11-13 21:23:43.009+00	2021-11-13 21:23:43.009+00	3	120
115	9780596002817	GBP	18.99	7	\N	\N	2021-11-13 21:23:43.022+00	2021-11-13 21:23:43.022+00	3	121
116	9780134900124	GBP	2.99	21	\N	\N	2021-11-13 21:23:43.034+00	2021-11-13 21:23:43.034+00	3	122
117	9780321503626	GBP	17.99	49	\N	\N	2021-11-13 21:23:43.046+00	2021-11-13 21:23:43.046+00	3	123
118	9780321146533	GBP	19.99	39	\N	\N	2021-11-13 21:23:43.058+00	2021-11-13 21:23:43.058+00	3	124
119	9780974514048	GBP	20.99	94	\N	\N	2021-11-13 21:23:43.071+00	2021-11-13 21:23:43.071+00	3	125
120	9780133708752	GBP	24.99	93	\N	\N	2021-11-13 21:23:43.085+00	2021-11-13 21:23:43.085+00	3	126
121	9780596000271	GBP	21.99	48	\N	\N	2021-11-13 21:23:43.097+00	2021-11-13 21:23:43.097+00	3	127
122	9780321334879	GBP	1.99	34	\N	\N	2021-11-13 21:23:43.11+00	2021-11-13 21:23:43.11+00	3	128
123	9780262033848	GBP	0.99	49	\N	\N	2021-11-13 21:23:43.122+00	2021-11-13 21:23:43.122+00	3	129
124	9780976694007	GBP	8.99	18	\N	\N	2021-11-13 21:23:43.138+00	2021-11-13 21:23:43.138+00	3	130
125	9780131495050	GBP	2.99	30	\N	\N	2021-11-13 21:23:43.156+00	2021-11-13 21:23:43.156+00	3	131
126	9780135974445	GBP	2.99	40	\N	\N	2021-11-13 21:23:43.174+00	2021-11-13 21:23:43.174+00	3	132
127	9780596101053	GBP	11.99	84	\N	\N	2021-11-13 21:23:43.193+00	2021-11-13 21:23:43.194+00	3	133
128	9780201433074	GBP	3.99	29	\N	\N	2021-11-13 21:23:43.211+00	2021-11-13 21:23:43.211+00	3	134
129	9780534950972	GBP	26.99	7	\N	\N	2021-11-13 21:23:43.229+00	2021-11-13 21:23:43.229+00	3	135
130	9781590593899	GBP	20.99	44	\N	\N	2021-11-13 21:23:43.248+00	2021-11-13 21:23:43.248+00	3	136
131	9780205313426	GBP	23.99	80	\N	\N	2021-11-13 21:23:43.265+00	2021-11-13 21:23:43.265+00	3	137
132	9781934356371	GBP	19.99	93	\N	\N	2021-11-13 21:23:43.279+00	2021-11-13 21:23:43.279+00	3	138
133	9780136291558	GBP	11.99	9	\N	\N	2021-11-13 21:23:43.292+00	2021-11-13 21:23:43.292+00	3	139
134	9780201889543	GBP	6.99	14	\N	\N	2021-11-13 21:23:43.305+00	2021-11-13 21:23:43.305+00	3	140
135	9780201342758	GBP	8.99	57	\N	\N	2021-11-13 21:23:43.317+00	2021-11-13 21:23:43.317+00	3	141
136	9780596529864	GBP	9.99	58	\N	\N	2021-11-13 21:23:43.332+00	2021-11-13 21:23:43.332+00	3	142
137	9780672328794	GBP	14.99	7	\N	\N	2021-11-13 21:23:43.345+00	2021-11-13 21:23:43.345+00	3	143
138	9780672326721	GBP	6.99	41	\N	\N	2021-11-13 21:23:43.357+00	2021-11-13 21:23:43.357+00	3	144
139	9780672323492	GBP	26.99	54	\N	\N	2021-11-13 21:23:43.368+00	2021-11-13 21:23:43.368+00	3	145
140	9780201703535	GBP	0.99	2	\N	\N	2021-11-13 21:23:43.381+00	2021-11-13 21:23:43.381+00	3	146
141	9780130810816	GBP	4.99	39	\N	\N	2021-11-13 21:23:43.395+00	2021-11-13 21:23:43.395+00	3	147
142	9780961392147	GBP	13.99	85	\N	\N	2021-11-13 21:23:43.41+00	2021-11-13 21:23:43.41+00	3	148
143	9780767907699	GBP	7.99	5	\N	\N	2021-11-13 21:23:43.425+00	2021-11-13 21:23:43.425+00	3	149
144	9780137081073	GBP	28.99	66	\N	\N	2021-11-13 21:23:43.438+00	2021-11-13 21:23:43.438+00	3	150
145	9780978739218	GBP	27.99	90	\N	\N	2021-11-13 21:23:43.45+00	2021-11-13 21:23:43.45+00	3	151
146	9780471578147	GBP	14.99	81	\N	\N	2021-11-13 21:23:43.466+00	2021-11-13 21:23:43.466+00	3	152
147	9781934356852	GBP	0.99	42	\N	\N	2021-11-13 21:23:43.482+00	2021-11-13 21:23:43.482+00	3	153
148	9780557030798	GBP	15.99	84	\N	\N	2021-11-13 21:23:43.497+00	2021-11-13 21:23:43.497+00	3	154
149	9780764543654	GBP	21.99	19	\N	\N	2021-11-13 21:23:43.512+00	2021-11-13 21:23:43.513+00	3	155
150	9781848000698	GBP	5.99	73	\N	\N	2021-11-13 21:23:43.528+00	2021-11-13 21:23:43.528+00	3	156
151	9781934356586	GBP	9.99	65	\N	\N	2021-11-13 21:23:43.541+00	2021-11-13 21:23:43.541+00	3	157
152	9780262062794	GBP	14.99	97	\N	\N	2021-11-13 21:23:43.553+00	2021-11-13 21:23:43.554+00	3	158
153	9780672327933	GBP	2.99	64	\N	\N	2021-11-13 21:23:43.565+00	2021-11-13 21:23:43.565+00	3	159
154	9780133262247	GBP	4.99	40	\N	\N	2021-11-13 21:23:43.578+00	2021-11-13 21:23:43.578+00	3	160
155	9780201379235	GBP	6.99	51	\N	\N	2021-11-13 21:23:43.591+00	2021-11-13 21:23:43.591+00	3	161
156	9780955683619	GBP	20.99	77	\N	\N	2021-11-13 21:23:43.606+00	2021-11-13 21:23:43.606+00	3	162
157	9780321437389	GBP	0.99	9	\N	\N	2021-11-13 21:23:43.622+00	2021-11-13 21:23:43.622+00	3	163
158	9781934356296	GBP	26.99	33	\N	\N	2021-11-13 21:23:43.636+00	2021-11-13 21:23:43.636+00	3	164
159	9780201741575	GBP	20.99	95	\N	\N	2021-11-13 21:23:43.649+00	2021-11-13 21:23:43.649+00	3	165
160	9781430322641	GBP	13.99	23	\N	\N	2021-11-13 21:23:43.667+00	2021-11-13 21:23:43.667+00	3	166
161	9780321278654	GBP	6.99	62	\N	\N	2021-11-13 21:23:43.684+00	2021-11-13 21:23:43.684+00	3	167
162	9780977616640	GBP	9.99	1	\N	\N	2021-11-13 21:23:43.7+00	2021-11-13 21:23:43.7+00	3	168
163	9781591840565	GBP	10.99	43	\N	\N	2021-11-13 21:23:43.715+00	2021-11-13 21:23:43.715+00	3	169
164	9780884271789	GBP	3.99	5	\N	\N	2021-11-13 21:23:43.73+00	2021-11-13 21:23:43.73+00	3	170
165	9780262111898	GBP	24.99	81	\N	\N	2021-11-13 21:23:43.743+00	2021-11-13 21:23:43.743+00	3	171
166	9780976458708	GBP	11.99	35	\N	\N	2021-11-13 21:23:43.756+00	2021-11-13 21:23:43.756+00	3	172
167	9780596809485	GBP	3.99	84	\N	\N	2021-11-13 21:23:43.768+00	2021-11-13 21:23:43.768+00	3	173
168	9781617290084	GBP	0.99	23	\N	\N	2021-11-13 21:23:43.781+00	2021-11-13 21:23:43.781+00	3	174
169	9780321213358	GBP	28.99	6	\N	\N	2021-11-13 21:23:43.796+00	2021-11-13 21:23:43.797+00	3	175
170	9780201733860	GBP	11.99	63	\N	\N	2021-11-13 21:23:43.812+00	2021-11-13 21:23:43.812+00	3	176
171	9780557043552	GBP	1.99	30	\N	\N	2021-11-13 21:23:43.827+00	2021-11-13 21:23:43.827+00	3	177
172	9780596009205	GBP	15.99	86	\N	\N	2021-11-13 21:23:43.841+00	2021-11-13 21:23:43.841+00	3	178
173	9780131774292	GBP	2.99	45	\N	\N	2021-11-13 21:23:43.853+00	2021-11-13 21:23:43.853+00	3	179
174	9780316037709	GBP	10.99	56	\N	\N	2021-11-13 21:23:43.903+00	2021-11-13 21:23:43.903+00	3	180
175	9780471782667	GBP	24.99	57	\N	\N	2021-11-13 21:23:43.92+00	2021-11-13 21:23:43.92+00	3	181
176	9781593270070	GBP	9.99	90	\N	\N	2021-11-13 21:23:43.937+00	2021-11-13 21:23:43.937+00	3	182
177	9780553563702	GBP	28.99	35	\N	\N	2021-11-13 21:23:43.954+00	2021-11-13 21:23:43.954+00	3	183
178	9780141000510	GBP	16.99	45	\N	\N	2021-11-13 21:23:43.971+00	2021-11-13 21:23:43.971+00	3	184
179	9780596006624	GBP	9.99	0	\N	\N	2021-11-13 21:23:43.988+00	2021-11-13 21:23:43.989+00	3	185
180	9780307588685	GBP	27.99	83	\N	\N	2021-11-13 21:23:44.006+00	2021-11-13 21:23:44.006+00	3	186
181	9780764542800	GBP	17.99	6	\N	\N	2021-11-13 21:23:44.023+00	2021-11-13 21:23:44.023+00	3	187
182	9780072260816	GBP	2.99	92	\N	\N	2021-11-13 21:23:44.039+00	2021-11-13 21:23:44.039+00	3	188
183	9780060926946	GBP	27.99	18	\N	\N	2021-11-13 21:23:44.056+00	2021-11-13 21:23:44.056+00	3	189
184	9780596001087	GBP	10.99	12	\N	\N	2021-11-13 21:23:44.073+00	2021-11-13 21:23:44.073+00	3	190
185	9780470639535	GBP	9.99	55	\N	\N	2021-11-13 21:23:44.108+00	2021-11-13 21:23:44.108+00	3	191
186	9780316213547	GBP	27.99	47	\N	\N	2021-11-13 21:23:44.125+00	2021-11-13 21:23:44.125+00	3	192
187	9781593272883	GBP	18.99	22	\N	\N	2021-11-13 21:23:44.141+00	2021-11-13 21:23:44.141+00	3	193
188	9780307269751	GBP	24.99	7	\N	\N	2021-11-13 21:23:44.158+00	2021-11-13 21:23:44.158+00	3	194
189	9781591843573	GBP	6.99	3	\N	\N	2021-11-13 21:23:44.174+00	2021-11-13 21:23:44.174+00	3	195
190	9781593270469	GBP	4.99	54	\N	\N	2021-11-13 21:23:44.191+00	2021-11-13 21:23:44.191+00	3	196
191	9781931836364	GBP	0.99	19	\N	\N	2021-11-13 21:23:44.208+00	2021-11-13 21:23:44.208+00	3	197
192	9780201914658	GBP	13.99	83	\N	\N	2021-11-13 21:23:44.225+00	2021-11-13 21:23:44.226+00	3	198
193	9780307269997	GBP	15.99	55	\N	\N	2021-11-13 21:23:44.263+00	2021-11-13 21:23:44.263+00	3	199
194	9780471128458	GBP	3.99	73	\N	\N	2021-11-13 21:23:44.279+00	2021-11-13 21:23:44.279+00	3	200
195	9780684818627	GBP	22.99	36	\N	\N	2021-11-13 21:23:44.29+00	2021-11-13 21:23:44.291+00	3	201
196	9780764574818	GBP	3.99	56	\N	\N	2021-11-13 21:23:44.303+00	2021-11-13 21:23:44.303+00	3	202
197	9780307269980	GBP	12.99	81	\N	\N	2021-11-13 21:23:44.316+00	2021-11-13 21:23:44.317+00	3	203
198	9780072257090	GBP	12.99	94	\N	\N	2021-11-13 21:23:44.329+00	2021-11-13 21:23:44.329+00	3	204
199	9780131481046	GBP	15.99	7	\N	\N	2021-11-13 21:23:44.34+00	2021-11-13 21:23:44.34+00	3	205
200	9780970978813	GBP	24.99	94	\N	\N	2021-11-13 21:23:44.352+00	2021-11-13 21:23:44.352+00	3	206
201	9781430219484	GBP	19.99	86	\N	\N	2021-11-13 21:23:44.363+00	2021-11-13 21:23:44.363+00	3	207
202	9780072262582	GBP	23.99	97	\N	\N	2021-11-13 21:23:44.375+00	2021-11-13 21:23:44.375+00	3	208
203	9780764544682	GBP	9.99	42	\N	\N	2021-11-13 21:23:44.388+00	2021-11-13 21:23:44.388+00	3	209
\.


--
-- Data for Name: payment_bankcard; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.payment_bankcard (id, card_type, name, number, expiry_date, partner_reference, user_id) FROM stdin;
\.


--
-- Data for Name: payment_source; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.payment_source (id, currency, amount_allocated, amount_debited, amount_refunded, reference, label, order_id, source_type_id) FROM stdin;
\.


--
-- Data for Name: payment_sourcetype; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.payment_sourcetype (id, name, code) FROM stdin;
\.


--
-- Data for Name: payment_transaction; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.payment_transaction (id, txn_type, amount, reference, status, date_created, source_id) FROM stdin;
\.


--
-- Data for Name: reviews_productreview; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.reviews_productreview (id, score, title, body, name, email, homepage, status, total_votes, delta_votes, date_created, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: reviews_vote; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.reviews_vote (id, delta, date_created, review_id, user_id) FROM stdin;
\.


--
-- Data for Name: shipping_orderanditemcharges; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.shipping_orderanditemcharges (id, code, name, description, price_per_order, price_per_item, free_shipping_threshold) FROM stdin;
\.


--
-- Data for Name: shipping_orderanditemcharges_countries; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.shipping_orderanditemcharges_countries (id, orderanditemcharges_id, country_id) FROM stdin;
\.


--
-- Data for Name: shipping_weightband; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.shipping_weightband (id, upper_limit, charge, method_id) FROM stdin;
\.


--
-- Data for Name: shipping_weightbased; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.shipping_weightbased (id, code, name, description, default_weight) FROM stdin;
\.


--
-- Data for Name: shipping_weightbased_countries; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.shipping_weightbased_countries (id, weightbased_id, country_id) FROM stdin;
\.


--
-- Data for Name: thumbnail_kvstore; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.thumbnail_kvstore (key, value) FROM stdin;
oscar-sandbox||image||004a5889fde1a5c38a1b62a69a5d3aee	{"name": "cache/fa/3b/fa3b91649d47602e692123d06efa5a03.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [101, 155]}
oscar-sandbox||image||006a2f60940a06e698de2805cbba1295	{"name": "images/products/2021/11/9781935554158.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [293, 400]}
oscar-sandbox||image||0103df83f8ebad87a198bd32a9bb29e3	{"name": "cache/17/52/17520387b10f4010afc6b6b5c0b8e2f1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||image||050df921bfb14991eb3094a10581349b	{"name": "cache/b9/f4/b9f4d538cf6f719f6e6880d0d2a3f3a2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [102, 155]}
oscar-sandbox||image||09a73dde75a6e5ef2aeb8e1ec6047046	{"name": "images/products/2021/11/9781934356296.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||0b9df0e79d2fdb633f490b6cd831f1c6	{"name": "images/products/2021/11/9780977616640.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||0d451393940f5b840123dd121326f95c	{"name": "images/products/2021/11/9781617290084.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [320, 400]}
oscar-sandbox||image||0e1246552fff6a5c4de5be87daaf2143	{"name": "images/products/2021/11/9780557043552.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [306, 400]}
oscar-sandbox||image||12c57643bab88f840037ae832fdeefde	{"name": "cache/1f/b1/1fb13ecae1833406acbef8705212f2b2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [104, 155]}
oscar-sandbox||image||14b40da1886c63419b112a0165d987a7	{"name": "images/products/2021/11/9780446361309.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [249, 400]}
oscar-sandbox||image||16318d624f5866dee985ba37f88cd36b	{"name": "images/products/2021/11/9780321278654.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [319, 400]}
oscar-sandbox||image||16b6a5d4e9ebdb3df08054d6f92718ed	{"name": "images/products/2021/11/9781857987638.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [261, 400]}
oscar-sandbox||image||18109942ff68f47f1947b46ced8e0162	{"name": "cache/29/15/2915fcd10973464ed1319570dd6aad22.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [101, 155]}
oscar-sandbox||image||1b914522f9cc2934f5ad8fa267b67c3f	{"name": "images/products/2021/11/9780201379235.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 400]}
oscar-sandbox||image||1cd1825c8734708ed1b0e05991c738e4	{"name": "cache/7f/45/7f4587a2491dab23fb2588fd592f9aff.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [119, 155]}
oscar-sandbox||image||1ef5ecc32e1e37d35ff7a53ba63d7d44	{"name": "cache/7b/8a/7b8a7378995ae3f03ed27b2282d579e6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||image||1f513ee3bdfb61a3cf0895a59d129b65	{"name": "cache/d2/1c/d21c6cc45a8410c77bb5c5a903fec793.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 155]}
oscar-sandbox||image||21ee7b3e1e8be1cb2722bcd1ea6ed54a	{"name": "images/products/2021/11/9780471128458.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [324, 400]}
oscar-sandbox||image||21f3e6f5489d8491cf40f244ce036390	{"name": "cache/66/b5/66b5f43866a3a9e9aa882c88dcf4a964.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||25b24f1348f7fc19b8875937e2a3703d	{"name": "cache/1b/03/1b03abf8b6cca9be5c6dbac077fd2e23.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [105, 154]}
oscar-sandbox||image||29b71301cff43b444097321377eee3a5	{"name": "images/products/2021/11/9781593270469.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [303, 400]}
oscar-sandbox||image||2c187bcb726e037323192e151b092856	{"name": "images/products/2021/11/9780395860014.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [258, 400]}
oscar-sandbox||image||2c2695f955214bc89364ef448a218414	{"name": "images/products/2021/11/9780307269751.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [269, 400]}
oscar-sandbox||image||2d05b1c556fb52a51016af53b2c1446f	{"name": "cache/26/dd/26dd1da93821c6c372765684c0b5fde0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||image||31364f68d8aefaccdd2578071a889eeb	{"name": "images/products/2021/11/9780596001087.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [258, 400]}
oscar-sandbox||image||333d9bc5d06398a67bb04eb910e0936c	{"name": "image_not_found.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
oscar-sandbox||image||33c06478915eb2468736221ac6fdc859	{"name": "images/products/2021/11/9781931836364.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [304, 400]}
oscar-sandbox||image||38ebcd0f15a0b4cd0adcb3fb1151a34d	{"name": "cache/4a/d7/4ad722e2a2cf1a58991d10e792d5d600.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [127, 155]}
oscar-sandbox||image||391759ec6ddf643097eea16c1563eb20	{"name": "images/products/2021/11/9780201914658.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [256, 400]}
oscar-sandbox||image||398e1f56eed26dc715a7ced40b967e8b	{"name": "cache/a6/7d/a67d84f37eda79aa3ecc2ce74932d0e2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [126, 155]}
oscar-sandbox||image||3afff9c4a0c85709f9a8368e8f53624b	{"name": "cache/af/cb/afcbaacd7260dea975d0d1e4a7edd53b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 155]}
oscar-sandbox||image||3b60de2f19fe4cdc8decffa29105c46c	{"name": "images/products/2021/11/9780380816033.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [262, 400]}
oscar-sandbox||image||3c910a9409cb415d8e0c0a4cb0c4a3fd	{"name": "cache/a0/79/a07907c7fa9e37c1a6a4097f1ff43065.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||image||3ccbb4cc8852d8300990282d29d06d0c	{"name": "images/products/2021/11/9780743421928.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [248, 400]}
oscar-sandbox||image||3ce81d1bb43ecd204e5511b6eaa97d78	{"name": "cache/4a/70/4a7084944f7d6328c5e07bd363bfc016.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||image||4b13bb78333eae5cc30d6c9ec73cfc54	{"name": "cache/89/ff/89ff59a846015af031d0a69afb7e542b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||thumbnails||d9830496037aa5ba95e01da9c816ed02	["65bf4d96acbd4dc5a431d31019a2b7bd"]
oscar-sandbox||image||4c4b4e6175024bfcbfd049b89df885ae	{"name": "cache/12/3b/123bc892764ab310ae59b0a4d24fc372.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [114, 155]}
oscar-sandbox||image||4c76f6710216e446aa453e1877150d9b	{"name": "cache/43/14/4314116d72a237a5b6003f0fe3ace991.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [134, 155]}
oscar-sandbox||image||529d9d5560510b45ff0ff2ae2810577e	{"name": "images/products/2021/11/9781593272883.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [303, 400]}
oscar-sandbox||image||6084bf381cae5baa2564d13bd8ed7d25	{"name": "cache/77/dc/77dc2cb85822de0f0fc4baef16d191e0.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [101, 155]}
oscar-sandbox||image||634dcdf66ce5b9a8bdf018da6f08b5a3	{"name": "images/products/2021/11/9780131774292.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [328, 400]}
oscar-sandbox||image||65bf4d96acbd4dc5a431d31019a2b7bd	{"name": "cache/ef/0f/ef0f573e257d781919a7e82f735f5713.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [123, 155]}
oscar-sandbox||image||67e939db185cbaf941f3bff51873a1b9	{"name": "images/products/2021/11/9780764574818.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [320, 400]}
oscar-sandbox||image||6911535727f5ba57a3a145e8ad69e6af	{"name": "cache/64/c2/64c27ba1f879d97b54d8537451fd80b8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [104, 155]}
oscar-sandbox||image||6bc02d42d90e1bbdf6bc4f329c8bb7e8	{"name": "cache/10/5b/105b8d98f09c5a5e738761b06d5371fa.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 154]}
oscar-sandbox||image||6da7cef698bf8cd533b7f8d064f8153d	{"name": "cache/9d/af/9daf219846398f423bb06492a681c0ae.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [126, 155]}
oscar-sandbox||image||70719356bce2b42cb4b4adf82a30a2ea	{"name": "images/products/2021/11/9781430322641.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [265, 400]}
oscar-sandbox||image||726e1289ac7eae0e05019331f59ee60a	{"name": "cache/73/d7/73d7a5503abe9cb263c0dc4fe505f4bc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||image||72bce18a411ba6e5e306d7be0fa79f0a	{"name": "cache/0b/4d/0b4d357d9f3b42312713aee3ee9e4bfe.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 155]}
oscar-sandbox||image||782470982a54dd195308800148712698	{"name": "images/products/2021/11/9780596809485.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [267, 400]}
oscar-sandbox||image||78466c34cf330337f926204230643ee9	{"name": "cache/4f/5d/4f5d311bb3905ebb2f30aeefe011afa7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||image||7b09e0e6fdb4e263217b52db43b940c4	{"name": "images/products/2021/11/9780955683619.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [266, 400]}
oscar-sandbox||image||7c4d36ff39eef7889a6288687d0e0423	{"name": "cache/0c/dc/0cdc91f02fe51207c0b56d7379c6387f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [99, 155]}
oscar-sandbox||image||7d1218efa02f9bf171b8dbdea9751731	{"name": "images/products/2021/11/9780262111898.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [285, 400]}
oscar-sandbox||image||81cc72ea4e49630d168f85342a6bc7ae	{"name": "cache/b4/dc/b4dc079878df93ca3ff191c4f0d03f10.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [114, 155]}
oscar-sandbox||image||82d86649c337485d7ce16762750e524c	{"name": "cache/ee/d6/eed6bcfd8732ca981f2d25a20233226c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [207, 155]}
oscar-sandbox||image||83a6781c14a37f5f0e7d1ad6fcba1461	{"name": "cache/e8/4f/e84f6b5e2894821b92f3516df5a10a8b.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [110, 154]}
oscar-sandbox||image||864623459697b74c808cbe2b53545991	{"name": "images/products/2021/11/9781591840565.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [261, 400]}
oscar-sandbox||image||887e5971c15163f2993a1ad06f58f1c0	{"name": "images/products/2021/11/9780072262582.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [323, 400]}
oscar-sandbox||image||8f28813a50da214cca96909f05557f7e	{"name": "images/products/2021/11/9780976458708.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [266, 400]}
oscar-sandbox||image||9144b27bfdd3c7a7391084305e29f21e	{"name": "cache/ba/38/ba38321ce10d1b20e85ddc52edbebd87.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 154]}
oscar-sandbox||image||935400ed3bc31b6be5a843e6bd5bef48	{"name": "images/products/2021/11/9780307269997.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [272, 400]}
oscar-sandbox||image||986b64626b16b573e7dd1c61f2f22f96	{"name": "images/products/2021/11/9781430219484.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [267, 400]}
oscar-sandbox||image||9b04efab5bcf66fa20cb0a125072b25c	{"name": "images/products/2021/11/9781857988369.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [261, 400]}
oscar-sandbox||image||ab80a1feb1733839e5723967fb8b2aa3	{"name": "cache/a0/22/a022349de5eb13c66d463a5ef1439d47.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||image||af8cd9e78482963921ae0de33e833b1f	{"name": "images/products/2021/11/9780321213358.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [293, 400]}
oscar-sandbox||image||b128d827f45d4f78a063fe72c473d476	{"name": "cache/c8/0a/c80a872da9dbbf58cfc0207049271dd2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 154]}
oscar-sandbox||image||b454582eee7e83b58d9e0d05543e1dc5	{"name": "cache/ec/c8/ecc8a39f7ca897feba2cbefd20f364b4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [324, 400]}
oscar-sandbox||image||bbd006daf41efa1ec30ce085fc5568b8	{"name": "cache/85/5c/855c53fd6f77365f52b0dc067768d6f7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 154]}
oscar-sandbox||image||c33b26e1e7ec0840a3271d9977979774	{"name": "cache/a1/b3/a1b31bba9150684a573ef1c5640a1d3d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [96, 155]}
oscar-sandbox||image||c4240cc0e3fda52d1dcec77047e9f784	{"name": "images/products/2021/11/9780596009205.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [346, 400]}
oscar-sandbox||image||c6d004af54fb1ba5e7c1880240afcbb0	{"name": "cache/8b/1e/8b1e3605f059ed48401430f66a894605.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||image||c7bf27aa5330971b36fbb180ded761a7	{"name": "cache/9c/36/9c36a03787cd33bb96f6bc517bb9c0dd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||image||c945efbfb489f2c99cd2ea5080a924d0	{"name": "images/products/2021/11/9781591843573.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [265, 400]}
oscar-sandbox||image||cba6e0f7a903da33b5be65b32ba97f91	{"name": "cache/ae/52/ae52f86225a8d47dddae548cfba94c91.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||image||d3047e28dbb34be71f6f498aaf8b229e	{"name": "images/products/2021/11/9780321437389.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [302, 400]}
oscar-sandbox||image||d5537fad9fead2573bbba2761f702bb5	{"name": "images/products/2021/11/9780764544682.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [324, 400]}
oscar-sandbox||image||d9830496037aa5ba95e01da9c816ed02	{"name": "images/products/2021/11/9780201733860.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [317, 400]}
oscar-sandbox||image||db0a65e7d0a80d6b2a791e3ca9100cf1	{"name": "cache/0e/d5/0ed5452470ffed85dfe74f324c7b9efc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [98, 155]}
oscar-sandbox||image||dd040919079f87659fd979f37660ce89	{"name": "cache/08/e1/08e157b942ac70a746e50560ee903d27.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [125, 155]}
oscar-sandbox||image||e30fae98affb6c7b254ed9a7b1f04dff	{"name": "images/products/2021/11/9780201741575.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [267, 400]}
oscar-sandbox||image||e4f245c61e2045b281208019ad855db2	{"name": "cache/9b/5c/9b5cef936eec106c1a983fb96fed6a10.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 154]}
oscar-sandbox||image||e6c7f4e8fd61a20bd25c0d6c35c55d05	{"name": "images/products/2021/11/9780316213547.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [252, 400]}
oscar-sandbox||image||e7e300ca787bc29fd10ad46732a877f8	{"name": "cache/b0/29/b029409c3b0d77a1c8db57ba31944e7a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [96, 154]}
oscar-sandbox||image||f95bed8b2ec3efaf0a1f836e794fb8a1	{"name": "images/products/2021/11/9780131481046.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||fa236f22f605455b7314ec173229dd4b	{"name": "images/products/2021/11/9780307269980.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [269, 400]}
oscar-sandbox||thumbnails||006a2f60940a06e698de2805cbba1295	["81cc72ea4e49630d168f85342a6bc7ae"]
oscar-sandbox||thumbnails||09a73dde75a6e5ef2aeb8e1ec6047046	["c6d004af54fb1ba5e7c1880240afcbb0"]
oscar-sandbox||thumbnails||0b9df0e79d2fdb633f490b6cd831f1c6	["cba6e0f7a903da33b5be65b32ba97f91"]
oscar-sandbox||thumbnails||0d451393940f5b840123dd121326f95c	["3c910a9409cb415d8e0c0a4cb0c4a3fd"]
oscar-sandbox||thumbnails||0e1246552fff6a5c4de5be87daaf2143	["1cd1825c8734708ed1b0e05991c738e4"]
oscar-sandbox||thumbnails||14b40da1886c63419b112a0165d987a7	["e7e300ca787bc29fd10ad46732a877f8"]
oscar-sandbox||thumbnails||16318d624f5866dee985ba37f88cd36b	["726e1289ac7eae0e05019331f59ee60a"]
oscar-sandbox||thumbnails||16b6a5d4e9ebdb3df08054d6f92718ed	["18109942ff68f47f1947b46ced8e0162"]
oscar-sandbox||thumbnails||1b914522f9cc2934f5ad8fa267b67c3f	["72bce18a411ba6e5e306d7be0fa79f0a"]
oscar-sandbox||thumbnails||21ee7b3e1e8be1cb2722bcd1ea6ed54a	["6da7cef698bf8cd533b7f8d064f8153d"]
oscar-sandbox||thumbnails||29b71301cff43b444097321377eee3a5	["6bc02d42d90e1bbdf6bc4f329c8bb7e8"]
oscar-sandbox||thumbnails||2c187bcb726e037323192e151b092856	["3afff9c4a0c85709f9a8368e8f53624b"]
oscar-sandbox||thumbnails||2c2695f955214bc89364ef448a218414	["6911535727f5ba57a3a145e8ad69e6af"]
oscar-sandbox||thumbnails||33c06478915eb2468736221ac6fdc859	["c7bf27aa5330971b36fbb180ded761a7"]
oscar-sandbox||thumbnails||391759ec6ddf643097eea16c1563eb20	["7c4d36ff39eef7889a6288687d0e0423"]
oscar-sandbox||thumbnails||3b60de2f19fe4cdc8decffa29105c46c	["050df921bfb14991eb3094a10581349b"]
oscar-sandbox||thumbnails||529d9d5560510b45ff0ff2ae2810577e	["bbd006daf41efa1ec30ce085fc5568b8"]
oscar-sandbox||thumbnails||67e939db185cbaf941f3bff51873a1b9	["78466c34cf330337f926204230643ee9"]
oscar-sandbox||thumbnails||70719356bce2b42cb4b4adf82a30a2ea	["0103df83f8ebad87a198bd32a9bb29e3"]
oscar-sandbox||thumbnails||782470982a54dd195308800148712698	["b128d827f45d4f78a063fe72c473d476"]
oscar-sandbox||thumbnails||7b09e0e6fdb4e263217b52db43b940c4	["3ce81d1bb43ecd204e5511b6eaa97d78"]
oscar-sandbox||thumbnails||7d1218efa02f9bf171b8dbdea9751731	["83a6781c14a37f5f0e7d1ad6fcba1461"]
oscar-sandbox||thumbnails||864623459697b74c808cbe2b53545991	["004a5889fde1a5c38a1b62a69a5d3aee"]
oscar-sandbox||thumbnails||8f28813a50da214cca96909f05557f7e	["4b13bb78333eae5cc30d6c9ec73cfc54"]
oscar-sandbox||thumbnails||935400ed3bc31b6be5a843e6bd5bef48	["25b24f1348f7fc19b8875937e2a3703d"]
oscar-sandbox||thumbnails||986b64626b16b573e7dd1c61f2f22f96	["9144b27bfdd3c7a7391084305e29f21e"]
oscar-sandbox||thumbnails||9b04efab5bcf66fa20cb0a125072b25c	["6084bf381cae5baa2564d13bd8ed7d25"]
oscar-sandbox||thumbnails||af8cd9e78482963921ae0de33e833b1f	["4c4b4e6175024bfcbfd049b89df885ae"]
oscar-sandbox||thumbnails||c4240cc0e3fda52d1dcec77047e9f784	["4c76f6710216e446aa453e1877150d9b"]
oscar-sandbox||thumbnails||c945efbfb489f2c99cd2ea5080a924d0	["ab80a1feb1733839e5723967fb8b2aa3"]
oscar-sandbox||thumbnails||d3047e28dbb34be71f6f498aaf8b229e	["1ef5ecc32e1e37d35ff7a53ba63d7d44"]
oscar-sandbox||thumbnails||333d9bc5d06398a67bb04eb910e0936c	["82d86649c337485d7ce16762750e524c", "8c49628853bc32a76a137c9ee14e9593"]
oscar-sandbox||thumbnails||634dcdf66ce5b9a8bdf018da6f08b5a3	["38ebcd0f15a0b4cd0adcb3fb1151a34d", "5a8c56359a0b9d53fdc65d68f13fb68b"]
oscar-sandbox||thumbnails||887e5971c15163f2993a1ad06f58f1c0	["c850775d429c0a76671253e8147e4a79", "dd040919079f87659fd979f37660ce89"]
oscar-sandbox||thumbnails||31364f68d8aefaccdd2578071a889eeb	["3948b1cc9c326a08334cf9115e1ee859", "1f513ee3bdfb61a3cf0895a59d129b65"]
oscar-sandbox||thumbnails||e30fae98affb6c7b254ed9a7b1f04dff	["e4f245c61e2045b281208019ad855db2"]
oscar-sandbox||thumbnails||e6c7f4e8fd61a20bd25c0d6c35c55d05	["db0a65e7d0a80d6b2a791e3ca9100cf1"]
oscar-sandbox||thumbnails||f95bed8b2ec3efaf0a1f836e794fb8a1	["2d05b1c556fb52a51016af53b2c1446f", "21f3e6f5489d8491cf40f244ce036390"]
oscar-sandbox||thumbnails||fa236f22f605455b7314ec173229dd4b	["12c57643bab88f840037ae832fdeefde"]
oscar-sandbox||image||d912110fb5fd9c526efd6febf25f7363	{"name": "cache/09/64/0964c27367549daa4077a8a8b7a26278.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [248, 400]}
oscar-sandbox||thumbnails||3ccbb4cc8852d8300990282d29d06d0c	["c33b26e1e7ec0840a3271d9977979774", "d912110fb5fd9c526efd6febf25f7363"]
oscar-sandbox||image||8c49628853bc32a76a137c9ee14e9593	{"name": "cache/59/d3/59d3d8c74e03cbba3aed4051c18d6a8c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [400, 300]}
oscar-sandbox||image||5a8c56359a0b9d53fdc65d68f13fb68b	{"name": "cache/3d/f9/3df951822f131de6958a719d7be1f5d9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [82, 100]}
oscar-sandbox||image||1940b66b40d1cd88f9188bf98aad5707	{"name": "images/products/2021/11/9780072260816.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [314, 400]}
oscar-sandbox||image||de866bab42d10efdf0f21c5a3f0d6b73	{"name": "cache/73/21/7321aa3f98132a96f1e0a4fea488778e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [122, 155]}
oscar-sandbox||thumbnails||1940b66b40d1cd88f9188bf98aad5707	["de866bab42d10efdf0f21c5a3f0d6b73"]
oscar-sandbox||image||6af69cf44fc28b44a90b5095a4f92cf2	{"name": "images/products/2021/11/9780764542800.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [266, 400]}
oscar-sandbox||image||38f836ecdb15b9acbb6608ec587d957e	{"name": "cache/8e/2a/8e2ab4b701868910fc55ee0c67087ac6.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||thumbnails||6af69cf44fc28b44a90b5095a4f92cf2	["38f836ecdb15b9acbb6608ec587d957e"]
oscar-sandbox||image||b852a68f63a855b8283da7426a5c3592	{"name": "images/products/2021/11/9780307588685.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [277, 400]}
oscar-sandbox||image||263147601e5bdca0b722582331800327	{"name": "cache/e9/6b/e96b9236a1c225c0ab6ac74de8815bfb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [107, 155]}
oscar-sandbox||image||1ddf5b4876205281e9735afa4d5671d9	{"name": "images/products/2021/11/9780596006624.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [258, 400]}
oscar-sandbox||image||c757e2ae919f83a4ad538bab11404e47	{"name": "cache/34/6e/346ebd2f1d90c79d3df56370d0b4d7dd.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 155]}
oscar-sandbox||thumbnails||1ddf5b4876205281e9735afa4d5671d9	["c757e2ae919f83a4ad538bab11404e47"]
oscar-sandbox||image||92a80956f8a1e62ff00c0f0ea2a03b34	{"name": "images/products/2021/11/9780141000510.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 400]}
oscar-sandbox||image||3019cd2a61691445d6f271d0d5f21cfd	{"name": "cache/9c/2f/9c2f48e464b4c90dff734d27b22673a2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [101, 155]}
oscar-sandbox||thumbnails||92a80956f8a1e62ff00c0f0ea2a03b34	["3019cd2a61691445d6f271d0d5f21cfd"]
oscar-sandbox||image||5f00d7237a639781fa19f1ddec4460a1	{"name": "images/products/2021/11/9781593270070.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [325, 400]}
oscar-sandbox||image||5b5efb15d50362c26c39dca1f0d68e93	{"name": "cache/cc/03/cc038ebeaa886387e701d9dff09f8f71.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [126, 155]}
oscar-sandbox||thumbnails||5f00d7237a639781fa19f1ddec4460a1	["5b5efb15d50362c26c39dca1f0d68e93"]
oscar-sandbox||image||47df07ae0ce928b47157bcd88e93220c	{"name": "images/products/2021/11/9780471782667.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [267, 400]}
oscar-sandbox||image||7119502261b56558df7a05a46b79cfbc	{"name": "cache/29/92/299242cf318e8d80a8d668c4e76b745e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 154]}
oscar-sandbox||thumbnails||47df07ae0ce928b47157bcd88e93220c	["7119502261b56558df7a05a46b79cfbc"]
oscar-sandbox||image||f936a3490e146c198bfe8d3d7fae6421	{"name": "images/products/2021/11/9780316037709.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [258, 400]}
oscar-sandbox||image||5d341c370c18671e997bdf7920a63022	{"name": "cache/a2/71/a271eb2172e291688a9348bd951b0993.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 155]}
oscar-sandbox||thumbnails||f936a3490e146c198bfe8d3d7fae6421	["5d341c370c18671e997bdf7920a63022"]
oscar-sandbox||image||d3ebda3283eb3c96b7621fda193ab3ae	{"name": "images/products/2021/11/9780672327933.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [307, 400]}
oscar-sandbox||image||59a16c2e83db6534a1147f2d6189b263	{"name": "cache/03/56/0356904e99e86a7c09be7bd024a4942f.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [119, 155]}
oscar-sandbox||thumbnails||d3ebda3283eb3c96b7621fda193ab3ae	["59a16c2e83db6534a1147f2d6189b263"]
oscar-sandbox||image||12f6cefac86b2a77b2c0679387bb5302	{"name": "images/products/2021/11/9780262062794.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [355, 400]}
oscar-sandbox||image||3411166c1e0f1e0be1e3d6c0a4016c0a	{"name": "cache/cc/84/cc848a8cfb479201da27763af3d7b187.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [138, 155]}
oscar-sandbox||thumbnails||12f6cefac86b2a77b2c0679387bb5302	["3411166c1e0f1e0be1e3d6c0a4016c0a"]
oscar-sandbox||image||bf2cdee662c1b536e8215d8ac4790beb	{"name": "images/products/2021/11/9781934356586.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||ef7c266784fcc710fcbbe12f7c817f98	{"name": "cache/e8/11/e811ddd9fc3dd9df7cf46d4312e8c438.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||bf2cdee662c1b536e8215d8ac4790beb	["ef7c266784fcc710fcbbe12f7c817f98"]
oscar-sandbox||image||d0a70e792691f484b2fa27809883cd2c	{"name": "images/products/2021/11/9781848000698.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [287, 400]}
oscar-sandbox||image||547e67495ff9dd8686667550f965ca31	{"name": "cache/78/48/78482bde7b3d1dd8fb8b3eb264b746c3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [111, 155]}
oscar-sandbox||thumbnails||d0a70e792691f484b2fa27809883cd2c	["547e67495ff9dd8686667550f965ca31"]
oscar-sandbox||image||d6b64d649a17e2748d3c06dec388ed23	{"name": "images/products/2021/11/9780764543654.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [323, 400]}
oscar-sandbox||image||e464c32e43138973e613e9fd4b53d3a0	{"name": "cache/5a/ee/5aee4e3825177a134b9a2d9938dc10ea.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [125, 155]}
oscar-sandbox||thumbnails||d6b64d649a17e2748d3c06dec388ed23	["e464c32e43138973e613e9fd4b53d3a0"]
oscar-sandbox||image||90cc5a3ad209e97436fad15eecfd8975	{"name": "images/products/2021/11/9780557030798.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||07c4662670285998789a821a72b61c74	{"name": "cache/f2/9c/f29c264a0bba1b6975e47ce639b225a5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||90cc5a3ad209e97436fad15eecfd8975	["07c4662670285998789a821a72b61c74"]
oscar-sandbox||image||6756e5f99940205d72563a358c580147	{"name": "images/products/2021/11/9781934356852.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||e412f5a4e072d1a923d43aafe9cb7d63	{"name": "cache/2d/4f/2d4fc191e7e8c44f48cd2555f8d883b2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||6756e5f99940205d72563a358c580147	["e412f5a4e072d1a923d43aafe9cb7d63"]
oscar-sandbox||image||76a98b7cebb918749e94e8c9514e3643	{"name": "images/products/2021/11/9780471578147.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [315, 400]}
oscar-sandbox||image||2348bc03a04b09317d2a4f1ec42bf2a5	{"name": "cache/c3/ba/c3bac85c0059298646f2244b9ae2a764.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [122, 155]}
oscar-sandbox||thumbnails||76a98b7cebb918749e94e8c9514e3643	["2348bc03a04b09317d2a4f1ec42bf2a5"]
oscar-sandbox||image||eb21ae7f8b61bb9e65ad2dd4f4a68246	{"name": "images/products/2021/11/9780978739218.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||10ef9508e9ad19a47c430ce27ae4f90d	{"name": "cache/3f/94/3f948a1fcf3f4b47a0c9ec8ab4c626a9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||eb21ae7f8b61bb9e65ad2dd4f4a68246	["10ef9508e9ad19a47c430ce27ae4f90d"]
oscar-sandbox||image||032edd4f82f975c0051701b7cbc1227d	{"name": "images/products/2021/11/9780137081073.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [308, 400]}
oscar-sandbox||image||0d3070726bc18cf7ede0dcdb011e3619	{"name": "cache/4d/f0/4df0e2f1b9cccd8545320760179f5377.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [119, 155]}
oscar-sandbox||thumbnails||032edd4f82f975c0051701b7cbc1227d	["0d3070726bc18cf7ede0dcdb011e3619"]
oscar-sandbox||image||ec499b028474fee6852557784f7aa564	{"name": "images/products/2021/11/9780767907699.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [260, 400]}
oscar-sandbox||image||b4c1ccc8a91c2903cae1e8b9b05b6af1	{"name": "cache/74/6a/746a0cce04eecc77574160e57f89197c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [101, 155]}
oscar-sandbox||thumbnails||ec499b028474fee6852557784f7aa564	["b4c1ccc8a91c2903cae1e8b9b05b6af1"]
oscar-sandbox||image||799b047ff394ae7cbdd127ac0cce1403	{"name": "images/products/2021/11/9780130810816.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||c9590a6215781514d83b2bd36e598f49	{"name": "cache/d4/09/d4091a08f59ae8ecfbc720c7b717af54.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||thumbnails||799b047ff394ae7cbdd127ac0cce1403	["c9590a6215781514d83b2bd36e598f49"]
oscar-sandbox||image||40b27dc2b1968a25da7136fb8f56b8b1	{"name": "images/products/2021/11/9780201703535.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [317, 400]}
oscar-sandbox||image||e56c9584eda6ae8b53739f2734995966	{"name": "cache/93/6d/936d0a77132b6285381de504d0a3d4ff.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [123, 155]}
oscar-sandbox||thumbnails||40b27dc2b1968a25da7136fb8f56b8b1	["e56c9584eda6ae8b53739f2734995966"]
oscar-sandbox||image||57b03c0e98aac5e540808e485c728006	{"name": "images/products/2021/11/9780672323492.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [323, 400]}
oscar-sandbox||image||ef2cb8c607501f79e61ac85265a1a5b2	{"name": "cache/22/4f/224f3193d2da5946d93e9602cfedd7d8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [125, 155]}
oscar-sandbox||thumbnails||57b03c0e98aac5e540808e485c728006	["ef2cb8c607501f79e61ac85265a1a5b2"]
oscar-sandbox||image||6595e387e86c5346e57b106bb01c913e	{"name": "images/products/2021/11/9780672326721.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [311, 400]}
oscar-sandbox||image||025d041c7f5bd68adf729d100a4b3e16	{"name": "cache/2b/ba/2bba8d7082ea0175fa2f4be21fa90f45.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [121, 155]}
oscar-sandbox||thumbnails||6595e387e86c5346e57b106bb01c913e	["025d041c7f5bd68adf729d100a4b3e16"]
oscar-sandbox||image||0adf21c3f2076be373e4e246d5ca1d24	{"name": "images/products/2021/11/9780672328794.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [307, 400]}
oscar-sandbox||image||6cb09a8f48099674307896ef7b82a3ae	{"name": "cache/c6/11/c61159803859b06584fb11fc28a9ab78.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [119, 155]}
oscar-sandbox||thumbnails||0adf21c3f2076be373e4e246d5ca1d24	["6cb09a8f48099674307896ef7b82a3ae"]
oscar-sandbox||image||776c56e17552b0746b583a50891060a5	{"name": "images/products/2021/11/9780596529864.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||be46e81fc36e892860fb549aca5cad01	{"name": "cache/3e/96/3e9663e4496d3276901670bcc0c36d2e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||776c56e17552b0746b583a50891060a5	["be46e81fc36e892860fb549aca5cad01"]
oscar-sandbox||image||ac52bafd7518486b0735f992ea40fd94	{"name": "images/products/2021/11/9780201342758.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [309, 400]}
oscar-sandbox||image||3b5a6cdb81de25563e0948f99e21668b	{"name": "cache/2b/2a/2b2acc8a8748f8dec628f4469726cd6a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 155]}
oscar-sandbox||thumbnails||ac52bafd7518486b0735f992ea40fd94	["3b5a6cdb81de25563e0948f99e21668b"]
oscar-sandbox||image||36c76672aec7cd970804bf3142b4124b	{"name": "images/products/2021/11/9780201889543.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [318, 400]}
oscar-sandbox||image||0e209a68827afee81dfc6ddcee8409f8	{"name": "cache/ce/ee/ceee293545709a53b9de787f1ffda6c3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [123, 155]}
oscar-sandbox||thumbnails||36c76672aec7cd970804bf3142b4124b	["0e209a68827afee81dfc6ddcee8409f8"]
oscar-sandbox||image||18f37fa7af73defee154068daa7ae7cc	{"name": "images/products/2021/11/9780136291558.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [304, 400]}
oscar-sandbox||image||2d69b6caba17944f08c2de94a9e0fd65	{"name": "cache/24/26/2426c6518449eca851af860416eaab3e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||18f37fa7af73defee154068daa7ae7cc	["2d69b6caba17944f08c2de94a9e0fd65"]
oscar-sandbox||image||724d49747c03f4a2823dd19c45770c58	{"name": "images/products/2021/11/9781934356371.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||43582040e8e9cf37ef1175f75b5009a6	{"name": "cache/27/ed/27edecfbf85bc98c1d236a242a2e2930.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||724d49747c03f4a2823dd19c45770c58	["43582040e8e9cf37ef1175f75b5009a6"]
oscar-sandbox||image||8af81e4b4e654c941f91de5b46425c3b	{"name": "images/products/2021/11/9780205313426.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [252, 400]}
oscar-sandbox||image||c4c0a06f355ababc68a676ea5fe08d39	{"name": "cache/03/2e/032e52ab78271e727f3e976dc3b9924c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [98, 155]}
oscar-sandbox||thumbnails||8af81e4b4e654c941f91de5b46425c3b	["c4c0a06f355ababc68a676ea5fe08d39"]
oscar-sandbox||image||90047ce4a80e25965aed91621aae3441	{"name": "images/products/2021/11/9781590593899.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [266, 400]}
oscar-sandbox||image||90bc226332b993e35a434dba50bfde62	{"name": "cache/a9/bf/a9bfe9c2869ba2403bccafbbf530163e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 155]}
oscar-sandbox||thumbnails||90047ce4a80e25965aed91621aae3441	["90bc226332b993e35a434dba50bfde62"]
oscar-sandbox||image||abae62523ce1abc0084329f4a4d3712a	{"name": "images/products/2021/11/9780534950972.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [279, 400]}
oscar-sandbox||image||e20b6d2c0bf9b4385f0e162a1af56dc4	{"name": "cache/2f/6a/2f6a49e7b729a14e6a82f86dca1b3041.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [108, 155]}
oscar-sandbox||thumbnails||abae62523ce1abc0084329f4a4d3712a	["e20b6d2c0bf9b4385f0e162a1af56dc4"]
oscar-sandbox||image||a77e61fd319ae69dffe5306ed4251a87	{"name": "images/products/2021/11/9780201433074.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [302, 400]}
oscar-sandbox||image||775a18009127cba697036ce1da53355f	{"name": "cache/55/28/552844beb9db30ccde441ac293509e75.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||thumbnails||a77e61fd319ae69dffe5306ed4251a87	["775a18009127cba697036ce1da53355f"]
oscar-sandbox||image||a81a97001108ba3ce5de28cb2c2df531	{"name": "images/products/2021/11/9780596101053.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [304, 400]}
oscar-sandbox||image||92d93cdef1776a0d02736bdb8ddd16cf	{"name": "cache/3f/0f/3f0fcd4669961966d177793fd912cf5a.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||a81a97001108ba3ce5de28cb2c2df531	["92d93cdef1776a0d02736bdb8ddd16cf"]
oscar-sandbox||image||f963c41fa7441b37c5bf0db0f78b3b54	{"name": "images/products/2021/11/9780135974445.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||ab0999c1a597de9e62280fc64c117904	{"name": "cache/be/a1/bea1a90d2eaddbb98716c865368e0ebc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||f963c41fa7441b37c5bf0db0f78b3b54	["ab0999c1a597de9e62280fc64c117904"]
oscar-sandbox||image||59db74b3e1f858bff69cc7ae4ccf9ff1	{"name": "images/products/2021/11/9780131495050.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [298, 400]}
oscar-sandbox||image||b3f48534938a3b15a886b83f1bb9f5d1	{"name": "cache/29/4f/294f114d633c621adcc55be9c2e28ceb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [115, 154]}
oscar-sandbox||thumbnails||59db74b3e1f858bff69cc7ae4ccf9ff1	["b3f48534938a3b15a886b83f1bb9f5d1"]
oscar-sandbox||image||c48204b5584869b57072adc7538e6788	{"name": "images/products/2021/11/9780976694007.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||ff52054d21174500f3fea0316c67a193	{"name": "cache/0d/85/0d85db174e5dad0657bf55b411eac311.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||c48204b5584869b57072adc7538e6788	["ff52054d21174500f3fea0316c67a193"]
oscar-sandbox||image||90de12b67f0bf774f59d478872fade2e	{"name": "images/products/2021/11/9780262033848.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [354, 400]}
oscar-sandbox||image||5586ae26f0d739e6ad5737784eb79b47	{"name": "cache/bd/cf/bdcf6214061eab31524d8f1b0bc41d5e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [137, 155]}
oscar-sandbox||thumbnails||90de12b67f0bf774f59d478872fade2e	["5586ae26f0d739e6ad5737784eb79b47"]
oscar-sandbox||image||6d8176d5c8b656eb25446677b4e195d5	{"name": "images/products/2021/11/9780321334879.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [319, 400]}
oscar-sandbox||image||a0db17bb23f97e400dfe375540e29e88	{"name": "cache/d8/06/d80695bbd78c3bb796c0ec1974e863b4.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||6d8176d5c8b656eb25446677b4e195d5	["a0db17bb23f97e400dfe375540e29e88"]
oscar-sandbox||image||a1bbc1d95420e45e85074d47edf6e93f	{"name": "images/products/2021/11/9780596000271.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [304, 400]}
oscar-sandbox||image||6b6fd47ad013e15a223f25090cec6c89	{"name": "cache/fe/cf/fecf251cfccc3c5a98bf6067e91ae381.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||a1bbc1d95420e45e85074d47edf6e93f	["6b6fd47ad013e15a223f25090cec6c89"]
oscar-sandbox||image||9a66a647bcb3f2871c784d051baeeb75	{"name": "images/products/2021/11/9780133708752.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [259, 400]}
oscar-sandbox||image||c6a5b83a6f742731fa27695b124ea159	{"name": "cache/70/17/70170e9b9f79a9d3d1dfe0240b07eeb3.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 154]}
oscar-sandbox||thumbnails||9a66a647bcb3f2871c784d051baeeb75	["c6a5b83a6f742731fa27695b124ea159"]
oscar-sandbox||image||fd0bdfd4350b2deeadff367227a02ba6	{"name": "images/products/2021/11/9780974514048.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [333, 400]}
oscar-sandbox||image||9160604117912f0669786912eb2939ef	{"name": "cache/a6/bd/a6bd958747bc32e8b7e9d07cd0a0aeac.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [129, 155]}
oscar-sandbox||thumbnails||fd0bdfd4350b2deeadff367227a02ba6	["9160604117912f0669786912eb2939ef"]
oscar-sandbox||image||99a1ee5dbda16431b3c8e98fb6aa7601	{"name": "images/products/2021/11/9780321146533.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [319, 400]}
oscar-sandbox||image||e2d5453f8ef25db9519dfc6b1895635f	{"name": "cache/1b/ac/1bac5458f87613519f647ec132a16190.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||99a1ee5dbda16431b3c8e98fb6aa7601	["e2d5453f8ef25db9519dfc6b1895635f"]
oscar-sandbox||image||7605b0f79dc1761bd69e9ab958190be9	{"name": "images/products/2021/11/9780321503626.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||6ee04f262e97d6a2927a614bf8ea0140	{"name": "cache/3b/b4/3bb465029ce124e9560cfd620218df39.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||thumbnails||7605b0f79dc1761bd69e9ab958190be9	["6ee04f262e97d6a2927a614bf8ea0140"]
oscar-sandbox||image||7d8d1589be74da21cb10809a835fb6e7	{"name": "images/products/2021/11/9780134900124.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [320, 400]}
oscar-sandbox||image||52ee96f89923493e3674a8f5d1013a46	{"name": "cache/73/f3/73f3b177488c33753887d0cd47bcd874.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||7d8d1589be74da21cb10809a835fb6e7	["52ee96f89923493e3674a8f5d1013a46"]
oscar-sandbox||image||dd4ea13f507784965e098f43c6924bfd	{"name": "images/products/2021/11/9780596002817.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||1fc73bf11d40e595b2f30d459c78f0a5	{"name": "cache/75/b7/75b714b0e5ae88a456f0e8c5cc400cdb.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||dd4ea13f507784965e098f43c6924bfd	["1fc73bf11d40e595b2f30d459c78f0a5"]
oscar-sandbox||image||65fbcf3e2e006af2616ae407299273a4	{"name": "images/products/2021/11/9780974514055.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [331, 400]}
oscar-sandbox||image||1d5116b8cb063b1c0ad8a274660654b1	{"name": "cache/bf/68/bf68b6b477bad12167a47b44aad33b1d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [128, 155]}
oscar-sandbox||thumbnails||65fbcf3e2e006af2616ae407299273a4	["1d5116b8cb063b1c0ad8a274660654b1"]
oscar-sandbox||image||5b08f2289dcc9ec003d4aef084c44ad5	{"name": "images/products/2021/11/9780201615869.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [320, 400]}
oscar-sandbox||image||b4b9b0c45444e3b10297a0ebbcc8aa9d	{"name": "cache/13/5e/135e237d2f551c7f83ec000dee25884c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||5b08f2289dcc9ec003d4aef084c44ad5	["b4b9b0c45444e3b10297a0ebbcc8aa9d"]
oscar-sandbox||image||cf44df96a9312526ee81123aa6b7b897	{"name": "images/products/2021/11/9780262062183.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [294, 400]}
oscar-sandbox||image||847d8bb875ad6b18e3e83afedc6fb1d6	{"name": "cache/52/14/5214947718d73aa28dc6618509a4ac66.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [114, 155]}
oscar-sandbox||thumbnails||cf44df96a9312526ee81123aa6b7b897	["847d8bb875ad6b18e3e83afedc6fb1d6"]
oscar-sandbox||image||d7a41775886127b38ecdb3355c267fd3	{"name": "images/products/2021/11/9780596007126.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [346, 400]}
oscar-sandbox||image||d8055ff6819919d4a9a8e9f10b7a3cff	{"name": "cache/ba/38/ba3866984b266e178948c16241bf22e7.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [134, 155]}
oscar-sandbox||thumbnails||d7a41775886127b38ecdb3355c267fd3	["d8055ff6819919d4a9a8e9f10b7a3cff"]
oscar-sandbox||image||aacf3c3a5dde018d2bf2b154a6d88662	{"name": "images/products/2021/11/9780262560993.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [324, 400]}
oscar-sandbox||image||989c3921e9245e558c00e777f4116461	{"name": "cache/ed/db/eddbd09df9bac35bae20e55ce3f7bd15.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [126, 155]}
oscar-sandbox||thumbnails||aacf3c3a5dde018d2bf2b154a6d88662	["989c3921e9245e558c00e777f4116461"]
oscar-sandbox||image||8b1f5822d720fbdc22978e742e8f266d	{"name": "images/products/2021/11/9780596514983.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||82b239207ee2f4fb5e09b27750adf79e	{"name": "cache/5e/1f/5e1f9d0c281f5debb254ccc9bd0da646.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||8b1f5822d720fbdc22978e742e8f266d	["82b239207ee2f4fb5e09b27750adf79e"]
oscar-sandbox||image||9fe34971d3e38eb5f1ebe01213d208bd	{"name": "images/products/2021/11/9780139376818.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||d9e34b39b47bdbc4eff3cc32fafc3ef7	{"name": "cache/cb/7d/cb7d89ed7e09e10d3fa5784604e9a1b1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||thumbnails||9fe34971d3e38eb5f1ebe01213d208bd	["d9e34b39b47bdbc4eff3cc32fafc3ef7"]
oscar-sandbox||image||b1d87d458252b7402d1c0d3e2b2d5e3e	{"name": "images/products/2021/11/9780262011532.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [276, 400]}
oscar-sandbox||image||d44d0d67c21fd07bb9ce8f96d7a17f68	{"name": "cache/a9/de/a9dee7c9dc9569914172f68b4bafb7a5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [107, 155]}
oscar-sandbox||thumbnails||b1d87d458252b7402d1c0d3e2b2d5e3e	["d44d0d67c21fd07bb9ce8f96d7a17f68"]
oscar-sandbox||image||6fb4be7f6d768262fcb4807a865e2123	{"name": "images/products/2021/11/9780137903955.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [322, 400]}
oscar-sandbox||image||b1cc490602c8ec7ed7aefa7be582b8b7	{"name": "cache/19/b6/19b6eaa81e97b3a4e6b810e82704f730.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [125, 155]}
oscar-sandbox||thumbnails||6fb4be7f6d768262fcb4807a865e2123	["b1cc490602c8ec7ed7aefa7be582b8b7"]
oscar-sandbox||image||f842f5d1eaba1adbc6e9ff59361c6c48	{"name": "images/products/2021/11/9780130313584.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [310, 400]}
oscar-sandbox||image||f1c76c6211644bd197053d917c203436	{"name": "cache/39/38/393804f06e988797776218bd59d1e9e2.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 155]}
oscar-sandbox||thumbnails||f842f5d1eaba1adbc6e9ff59361c6c48	["f1c76c6211644bd197053d917c203436"]
oscar-sandbox||image||0e3d601642877cbb0bc56cef0e3aac62	{"name": "images/products/2021/11/9780201100884.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [309, 400]}
oscar-sandbox||image||ef5e70d63fcdd889fc20480ec52e3954	{"name": "cache/44/45/4445c5f24b90fe725a9310891fa8e4b5.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [120, 155]}
oscar-sandbox||thumbnails||0e3d601642877cbb0bc56cef0e3aac62	["ef5e70d63fcdd889fc20480ec52e3954"]
oscar-sandbox||image||7bf25c2bad0765a264f5c464079bcae7	{"name": "images/products/2021/11/9780596517748.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [305, 400]}
oscar-sandbox||image||23687f7552c62a157ca295c1262c5218	{"name": "cache/bc/19/bc19bc6d5a7874d83c7ee129064ff2f9.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [118, 155]}
oscar-sandbox||thumbnails||7bf25c2bad0765a264f5c464079bcae7	["23687f7552c62a157ca295c1262c5218"]
oscar-sandbox||image||f1fb5c2bcaaa998033a6be2085ac6d31	{"name": "images/products/2021/11/9780201700732.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [319, 400]}
oscar-sandbox||image||53ffda97be48a79a7aeae20122b0c384	{"name": "cache/ad/c0/adc03c4fda2e7162c65dc8ab9aaa4745.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||f1fb5c2bcaaa998033a6be2085ac6d31	["53ffda97be48a79a7aeae20122b0c384"]
oscar-sandbox||image||08bc494e1ba4811f12ad1b4317d5c995	{"name": "images/products/2021/11/9780132350884.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [301, 400]}
oscar-sandbox||image||b48b3ffde687ba56cc02dca036d833e3	{"name": "cache/85/68/8568194219e7e679b745c5d9b0410a46.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 155]}
oscar-sandbox||thumbnails||08bc494e1ba4811f12ad1b4317d5c995	["b48b3ffde687ba56cc02dca036d833e3"]
oscar-sandbox||image||259c4aae864f262c02d18c41ea45cff6	{"name": "images/products/2021/11/9780735619678.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [328, 400]}
oscar-sandbox||image||17c885fed0180540202195971a815be0	{"name": "cache/87/d0/87d0b4eda485d47cf5a224895b8cbe67.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [127, 155]}
oscar-sandbox||thumbnails||259c4aae864f262c02d18c41ea45cff6	["17c885fed0180540202195971a815be0"]
oscar-sandbox||image||b48c593d90dd9fd0c2804c217acc9c41	{"name": "images/products/2021/11/9780201835953.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [269, 400]}
oscar-sandbox||image||0598f054add92e08b94f71198f85ea4e	{"name": "cache/36/dc/36dc9cb82a80117e71f83186e8a594fc.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [104, 155]}
oscar-sandbox||thumbnails||b48c593d90dd9fd0c2804c217acc9c41	["0598f054add92e08b94f71198f85ea4e"]
oscar-sandbox||image||a2da09e05aa63f7eda0b511587a62ba1	{"name": "images/products/2021/11/9780201485677.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [313, 400]}
oscar-sandbox||image||3bbeb713acfaba9202756661485553fc	{"name": "cache/1c/91/1c9176a5d74215a78d32c31c59c11490.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [121, 155]}
oscar-sandbox||thumbnails||a2da09e05aa63f7eda0b511587a62ba1	["3bbeb713acfaba9202756661485553fc"]
oscar-sandbox||image||8ba16abd4ca11ae6a91dae92862d6e76	{"name": "images/products/2021/11/9780262510875.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [268, 400]}
oscar-sandbox||image||96fa2eef4999f491f41d4e9d9f8bebea	{"name": "cache/fc/3d/fc3d4391578e51fb666eec70aedbb75e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [104, 155]}
oscar-sandbox||thumbnails||8ba16abd4ca11ae6a91dae92862d6e76	["96fa2eef4999f491f41d4e9d9f8bebea"]
oscar-sandbox||image||c58e83dcbd0a91ba18f85caeaaaa79df	{"name": "images/products/2021/11/9780201633610.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [321, 400]}
oscar-sandbox||image||293297a1f76f8d3c75c15cac31cee2ba	{"name": "cache/c2/14/c214aa8862b7cda602d3c83eba461a19.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||c58e83dcbd0a91ba18f85caeaaaa79df	["293297a1f76f8d3c75c15cac31cee2ba"]
oscar-sandbox||image||e4b40abb9ac99d190bf596be973e751b	{"name": "images/products/2021/11/9780201616224.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [319, 400]}
oscar-sandbox||image||a78e3138f4e32f1f27af76350fd50aff	{"name": "cache/c0/02/c00226eadc18bd67649515074b16d4e8.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [124, 155]}
oscar-sandbox||thumbnails||e4b40abb9ac99d190bf596be973e751b	["a78e3138f4e32f1f27af76350fd50aff"]
oscar-sandbox||image||94be1cf8a2675658271be9dc619004e2	{"name": "images/products/2021/11/9780131103627.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [303, 400]}
oscar-sandbox||image||0e35a785ee827ef4edd2059b252e4778	{"name": "cache/ff/63/ff63d88359fa9b026b20406956aa2562.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [117, 154]}
oscar-sandbox||thumbnails||94be1cf8a2675658271be9dc619004e2	["0e35a785ee827ef4edd2059b252e4778"]
oscar-sandbox||image||2518c17a2ffe56969d1c386b4fe910a5	{"name": "images/products/2021/11/9781466207608.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [267, 400]}
oscar-sandbox||image||00d7106c582f75ee16a8bb7fc38d952a	{"name": "cache/c9/27/c927ad97e91757469fea9fa03b9c9e5c.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [103, 154]}
oscar-sandbox||thumbnails||2518c17a2ffe56969d1c386b4fe910a5	["00d7106c582f75ee16a8bb7fc38d952a"]
oscar-sandbox||image||f4c5ead66bd26ce34f503d844c998df0	{"name": "images/products/2021/11/9781416507789.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [257, 400]}
oscar-sandbox||image||948f741aa22a8e8772c1034d59cb0286	{"name": "cache/42/e4/42e42a7193c45b8f8c18dd99d9c4d68d.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [100, 155]}
oscar-sandbox||thumbnails||f4c5ead66bd26ce34f503d844c998df0	["948f741aa22a8e8772c1034d59cb0286"]
oscar-sandbox||image||ed804e3ef92d93d2ddde47a44255b4cf	{"name": "cache/f3/85/f385a0e252151f5d94e2f82fa869fd99.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [81, 100]}
oscar-sandbox||thumbnails||d5537fad9fead2573bbba2761f702bb5	["ed804e3ef92d93d2ddde47a44255b4cf", "398e1f56eed26dc715a7ced40b967e8b", "b454582eee7e83b58d9e0d05543e1dc5"]
oscar-sandbox||image||c850775d429c0a76671253e8147e4a79	{"name": "cache/81/72/8172760ed6b2df8a0a00d78d078d9806.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [323, 400]}
oscar-sandbox||image||2a007277a5da43c358767b403fec5ce8	{"name": "cache/58/aa/58aa5af66059ccfd643c9b4019d813f1.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [277, 400]}
oscar-sandbox||thumbnails||b852a68f63a855b8283da7426a5c3592	["2a007277a5da43c358767b403fec5ce8", "263147601e5bdca0b722582331800327"]
oscar-sandbox||image||3948b1cc9c326a08334cf9115e1ee859	{"name": "cache/7f/b6/7fb687553bbf546e60c8fb31faa9987e.jpg", "storage": "django.core.files.storage.FileSystemStorage", "size": [258, 400]}
\.


--
-- Data for Name: voucher_voucher; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.voucher_voucher (id, name, code, usage, start_datetime, end_datetime, num_basket_additions, num_orders, total_discount, date_created, voucher_set_id) FROM stdin;
\.


--
-- Data for Name: voucher_voucher_offers; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.voucher_voucher_offers (id, voucher_id, conditionaloffer_id) FROM stdin;
\.


--
-- Data for Name: voucher_voucherapplication; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.voucher_voucherapplication (id, date_created, order_id, user_id, voucher_id) FROM stdin;
\.


--
-- Data for Name: voucher_voucherset; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.voucher_voucherset (id, name, count, code_length, description, date_created, start_datetime, end_datetime) FROM stdin;
\.


--
-- Data for Name: wishlists_line; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.wishlists_line (id, quantity, title, product_id, wishlist_id) FROM stdin;
\.


--
-- Data for Name: wishlists_wishlist; Type: TABLE DATA; Schema: public; Owner: oscar
--

COPY public.wishlists_wishlist (id, name, key, visibility, date_created, owner_id) FROM stdin;
\.


--
-- Name: address_useraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.address_useraddress_id_seq', 1, false);


--
-- Name: analytics_productrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.analytics_productrecord_id_seq', 8, true);


--
-- Name: analytics_userproductview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.analytics_userproductview_id_seq', 1, false);


--
-- Name: analytics_userrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.analytics_userrecord_id_seq', 1, false);


--
-- Name: analytics_usersearch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.analytics_usersearch_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 353, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 3, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: basket_basket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.basket_basket_id_seq', 3, true);


--
-- Name: basket_basket_vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.basket_basket_vouchers_id_seq', 1, false);


--
-- Name: basket_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.basket_line_id_seq', 2, true);


--
-- Name: basket_lineattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.basket_lineattribute_id_seq', 1, false);


--
-- Name: catalogue_attributeoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_attributeoption_id_seq', 3, true);


--
-- Name: catalogue_attributeoptiongroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_attributeoptiongroup_id_seq', 1, true);


--
-- Name: catalogue_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_category_id_seq', 7, true);


--
-- Name: catalogue_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_option_id_seq', 1, false);


--
-- Name: catalogue_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_product_id_seq', 209, true);


--
-- Name: catalogue_product_product_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_product_product_options_id_seq', 1, false);


--
-- Name: catalogue_productattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productattribute_id_seq', 1, true);


--
-- Name: catalogue_productattributevalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productattributevalue_id_seq', 8, true);


--
-- Name: catalogue_productattributevalue_value_multi_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productattributevalue_value_multi_option_id_seq', 1, false);


--
-- Name: catalogue_productcategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productcategory_id_seq', 204, true);


--
-- Name: catalogue_productclass_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productclass_id_seq', 2, true);


--
-- Name: catalogue_productclass_options_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productclass_options_id_seq', 1, false);


--
-- Name: catalogue_productimage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productimage_id_seq', 140, true);


--
-- Name: catalogue_productrecommendation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.catalogue_productrecommendation_id_seq', 1, false);


--
-- Name: communication_communicationeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.communication_communicationeventtype_id_seq', 1, false);


--
-- Name: communication_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.communication_email_id_seq', 1, false);


--
-- Name: communication_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.communication_notification_id_seq', 1, false);


--
-- Name: customer_communicationeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.customer_communicationeventtype_id_seq', 1, false);


--
-- Name: customer_email_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.customer_email_id_seq', 1, false);


--
-- Name: customer_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.customer_notification_id_seq', 1, false);


--
-- Name: customer_productalert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.customer_productalert_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 88, true);


--
-- Name: django_flatpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_flatpage_id_seq', 1, true);


--
-- Name: django_flatpage_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_flatpage_sites_id_seq', 1, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 143, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, true);


--
-- Name: easy_thumbnails_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.easy_thumbnails_source_id_seq', 1, false);


--
-- Name: easy_thumbnails_thumbnail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnail_id_seq', 1, false);


--
-- Name: easy_thumbnails_thumbnaildimensions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.easy_thumbnails_thumbnaildimensions_id_seq', 1, false);


--
-- Name: offer_benefit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_benefit_id_seq', 3, true);


--
-- Name: offer_condition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_condition_id_seq', 3, true);


--
-- Name: offer_conditionaloffer_combinations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_conditionaloffer_combinations_id_seq', 1, false);


--
-- Name: offer_conditionaloffer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_conditionaloffer_id_seq', 3, true);


--
-- Name: offer_range_classes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_range_classes_id_seq', 1, false);


--
-- Name: offer_range_excluded_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_range_excluded_products_id_seq', 1, false);


--
-- Name: offer_range_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_range_id_seq', 2, true);


--
-- Name: offer_range_included_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_range_included_categories_id_seq', 1, true);


--
-- Name: offer_rangeproduct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_rangeproduct_id_seq', 1, false);


--
-- Name: offer_rangeproductfileupload_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.offer_rangeproductfileupload_id_seq', 1, false);


--
-- Name: order_billingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_billingaddress_id_seq', 1, false);


--
-- Name: order_communicationevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_communicationevent_id_seq', 1, false);


--
-- Name: order_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_line_id_seq', 1, true);


--
-- Name: order_lineattribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_lineattribute_id_seq', 1, false);


--
-- Name: order_lineprice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_lineprice_id_seq', 1, true);


--
-- Name: order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_order_id_seq', 1, true);


--
-- Name: order_orderdiscount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_orderdiscount_id_seq', 1, true);


--
-- Name: order_ordernote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_ordernote_id_seq', 1, false);


--
-- Name: order_orderstatuschange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_orderstatuschange_id_seq', 1, false);


--
-- Name: order_paymentevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_paymentevent_id_seq', 1, false);


--
-- Name: order_paymenteventquantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_paymenteventquantity_id_seq', 1, false);


--
-- Name: order_paymenteventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_paymenteventtype_id_seq', 1, false);


--
-- Name: order_shippingaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_shippingaddress_id_seq', 1, true);


--
-- Name: order_shippingevent_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_shippingevent_id_seq', 1, false);


--
-- Name: order_shippingeventquantity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_shippingeventquantity_id_seq', 1, false);


--
-- Name: order_shippingeventtype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_shippingeventtype_id_seq', 1, false);


--
-- Name: order_surcharge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.order_surcharge_id_seq', 1, false);


--
-- Name: partner_partner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.partner_partner_id_seq', 3, true);


--
-- Name: partner_partner_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.partner_partner_users_id_seq', 1, false);


--
-- Name: partner_partneraddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.partner_partneraddress_id_seq', 1, false);


--
-- Name: partner_stockalert_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.partner_stockalert_id_seq', 1, false);


--
-- Name: partner_stockrecord_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.partner_stockrecord_id_seq', 203, true);


--
-- Name: payment_bankcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.payment_bankcard_id_seq', 1, false);


--
-- Name: payment_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.payment_source_id_seq', 1, false);


--
-- Name: payment_sourcetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.payment_sourcetype_id_seq', 1, false);


--
-- Name: payment_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.payment_transaction_id_seq', 1, false);


--
-- Name: reviews_productreview_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.reviews_productreview_id_seq', 1, false);


--
-- Name: reviews_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.reviews_vote_id_seq', 1, false);


--
-- Name: shipping_orderanditemcharges_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.shipping_orderanditemcharges_countries_id_seq', 1, false);


--
-- Name: shipping_orderanditemcharges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.shipping_orderanditemcharges_id_seq', 1, false);


--
-- Name: shipping_weightband_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.shipping_weightband_id_seq', 1, false);


--
-- Name: shipping_weightbased_countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.shipping_weightbased_countries_id_seq', 1, false);


--
-- Name: shipping_weightbased_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.shipping_weightbased_id_seq', 1, false);


--
-- Name: voucher_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.voucher_voucher_id_seq', 1, false);


--
-- Name: voucher_voucher_offers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.voucher_voucher_offers_id_seq', 1, false);


--
-- Name: voucher_voucherapplication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.voucher_voucherapplication_id_seq', 1, false);


--
-- Name: voucher_voucherset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.voucher_voucherset_id_seq', 1, false);


--
-- Name: wishlists_line_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.wishlists_line_id_seq', 1, false);


--
-- Name: wishlists_wishlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: oscar
--

SELECT pg_catalog.setval('public.wishlists_wishlist_id_seq', 1, false);


--
-- Name: address_country address_country_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_country
    ADD CONSTRAINT address_country_pkey PRIMARY KEY (iso_3166_1_a2);


--
-- Name: address_useraddress address_useraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_useraddress
    ADD CONSTRAINT address_useraddress_pkey PRIMARY KEY (id);


--
-- Name: address_useraddress address_useraddress_user_id_hash_9d1738c7_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_useraddress
    ADD CONSTRAINT address_useraddress_user_id_hash_9d1738c7_uniq UNIQUE (user_id, hash);


--
-- Name: analytics_productrecord analytics_productrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_productrecord
    ADD CONSTRAINT analytics_productrecord_pkey PRIMARY KEY (id);


--
-- Name: analytics_productrecord analytics_productrecord_product_id_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_productrecord
    ADD CONSTRAINT analytics_productrecord_product_id_key UNIQUE (product_id);


--
-- Name: analytics_userproductview analytics_userproductview_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userproductview
    ADD CONSTRAINT analytics_userproductview_pkey PRIMARY KEY (id);


--
-- Name: analytics_userrecord analytics_userrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_pkey PRIMARY KEY (id);


--
-- Name: analytics_userrecord analytics_userrecord_user_id_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_user_id_key UNIQUE (user_id);


--
-- Name: analytics_usersearch analytics_usersearch_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_usersearch
    ADD CONSTRAINT analytics_usersearch_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: basket_basket basket_basket_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket
    ADD CONSTRAINT basket_basket_pkey PRIMARY KEY (id);


--
-- Name: basket_basket_vouchers basket_basket_vouchers_basket_id_voucher_id_0731eee2_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket_vouchers
    ADD CONSTRAINT basket_basket_vouchers_basket_id_voucher_id_0731eee2_uniq UNIQUE (basket_id, voucher_id);


--
-- Name: basket_basket_vouchers basket_basket_vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket_vouchers
    ADD CONSTRAINT basket_basket_vouchers_pkey PRIMARY KEY (id);


--
-- Name: basket_line basket_line_basket_id_line_reference_8977e974_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_basket_id_line_reference_8977e974_uniq UNIQUE (basket_id, line_reference);


--
-- Name: basket_line basket_line_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_pkey PRIMARY KEY (id);


--
-- Name: basket_lineattribute basket_lineattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_pkey PRIMARY KEY (id);


--
-- Name: catalogue_attributeoption catalogue_attributeoption_group_id_option_7a8f6c11_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoption
    ADD CONSTRAINT catalogue_attributeoption_group_id_option_7a8f6c11_uniq UNIQUE (group_id, option);


--
-- Name: catalogue_attributeoption catalogue_attributeoption_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoption
    ADD CONSTRAINT catalogue_attributeoption_pkey PRIMARY KEY (id);


--
-- Name: catalogue_attributeoptiongroup catalogue_attributeoptiongroup_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoptiongroup
    ADD CONSTRAINT catalogue_attributeoptiongroup_pkey PRIMARY KEY (id);


--
-- Name: catalogue_category catalogue_category_path_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_category
    ADD CONSTRAINT catalogue_category_path_key UNIQUE (path);


--
-- Name: catalogue_category catalogue_category_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_category
    ADD CONSTRAINT catalogue_category_pkey PRIMARY KEY (id);


--
-- Name: catalogue_option catalogue_option_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_option
    ADD CONSTRAINT catalogue_option_code_key UNIQUE (code);


--
-- Name: catalogue_option catalogue_option_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_option
    ADD CONSTRAINT catalogue_option_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product catalogue_product_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product_product_options catalogue_product_produc_product_id_option_id_9b3abb31_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_produc_product_id_option_id_9b3abb31_uniq UNIQUE (product_id, option_id);


--
-- Name: catalogue_product_product_options catalogue_product_product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product_product_options
    ADD CONSTRAINT catalogue_product_product_options_pkey PRIMARY KEY (id);


--
-- Name: catalogue_product catalogue_product_upc_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_upc_key UNIQUE (upc);


--
-- Name: catalogue_productattributevalue catalogue_productattribu_attribute_id_product_id_1e8e7112_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattribu_attribute_id_product_id_1e8e7112_uniq UNIQUE (attribute_id, product_id);


--
-- Name: catalogue_productattributevalue_value_multi_option catalogue_productattribu_productattributevalue_id_a1760824_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue_value_multi_option
    ADD CONSTRAINT catalogue_productattribu_productattributevalue_id_a1760824_uniq UNIQUE (productattributevalue_id, attributeoption_id);


--
-- Name: catalogue_productattribute catalogue_productattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattribute
    ADD CONSTRAINT catalogue_productattribute_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productattributevalue catalogue_productattributevalue_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productattributevalue_value_multi_option catalogue_productattributevalue_value_multi_option_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue_value_multi_option
    ADD CONSTRAINT catalogue_productattributevalue_value_multi_option_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productcategory catalogue_productcategory_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productcategory catalogue_productcategory_product_id_category_id_8f0dbfe2_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_product_id_category_id_8f0dbfe2_uniq UNIQUE (product_id, category_id);


--
-- Name: catalogue_productclass_options catalogue_productclass_o_productclass_id_option_i_2266c635_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclass_o_productclass_id_option_i_2266c635_uniq UNIQUE (productclass_id, option_id);


--
-- Name: catalogue_productclass_options catalogue_productclass_options_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass_options
    ADD CONSTRAINT catalogue_productclass_options_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productclass catalogue_productclass_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass
    ADD CONSTRAINT catalogue_productclass_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productclass catalogue_productclass_slug_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productclass
    ADD CONSTRAINT catalogue_productclass_slug_key UNIQUE (slug);


--
-- Name: catalogue_productimage catalogue_productimage_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productimage
    ADD CONSTRAINT catalogue_productimage_pkey PRIMARY KEY (id);


--
-- Name: catalogue_productrecommendation catalogue_productrecomme_primary_id_recommendatio_da1fdf43_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecomme_primary_id_recommendatio_da1fdf43_uniq UNIQUE (primary_id, recommendation_id);


--
-- Name: catalogue_productrecommendation catalogue_productrecommendation_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecommendation_pkey PRIMARY KEY (id);


--
-- Name: communication_communicationeventtype customer_communicationeventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_communicationeventtype
    ADD CONSTRAINT customer_communicationeventtype_code_key UNIQUE (code);


--
-- Name: communication_communicationeventtype customer_communicationeventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_communicationeventtype
    ADD CONSTRAINT customer_communicationeventtype_pkey PRIMARY KEY (id);


--
-- Name: communication_email customer_email_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_email
    ADD CONSTRAINT customer_email_pkey PRIMARY KEY (id);


--
-- Name: communication_notification customer_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_notification
    ADD CONSTRAINT customer_notification_pkey PRIMARY KEY (id);


--
-- Name: customer_productalert customer_productalert_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.customer_productalert
    ADD CONSTRAINT customer_productalert_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage django_flatpage_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage
    ADD CONSTRAINT django_flatpage_pkey PRIMARY KEY (id);


--
-- Name: django_flatpage_sites django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_flatpage_id_site_id_0d29d9d1_uniq UNIQUE (flatpage_id, site_id);


--
-- Name: django_flatpage_sites django_flatpage_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_source easy_thumbnails_source_storage_hash_name_481ce32d_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_source
    ADD CONSTRAINT easy_thumbnails_source_storage_hash_name_481ce32d_uniq UNIQUE (storage_hash, name);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnai_storage_hash_name_source_fb375270_uniq UNIQUE (storage_hash, name, source_id);


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thumbnail_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thumbnail_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_pkey PRIMARY KEY (id);


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thumbnaildimensions_thumbnail_id_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thumbnaildimensions_thumbnail_id_key UNIQUE (thumbnail_id);


--
-- Name: offer_benefit offer_benefit_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_benefit
    ADD CONSTRAINT offer_benefit_pkey PRIMARY KEY (id);


--
-- Name: offer_condition offer_condition_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_condition
    ADD CONSTRAINT offer_condition_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer_combinations offer_conditionaloffer_c_from_conditionaloffer_id_2e3e9ffe_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer_combinations
    ADD CONSTRAINT offer_conditionaloffer_c_from_conditionaloffer_id_2e3e9ffe_uniq UNIQUE (from_conditionaloffer_id, to_conditionaloffer_id);


--
-- Name: offer_conditionaloffer_combinations offer_conditionaloffer_combinations_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer_combinations
    ADD CONSTRAINT offer_conditionaloffer_combinations_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer offer_conditionaloffer_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_name_key UNIQUE (name);


--
-- Name: offer_conditionaloffer offer_conditionaloffer_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_pkey PRIMARY KEY (id);


--
-- Name: offer_conditionaloffer offer_conditionaloffer_slug_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_slug_key UNIQUE (slug);


--
-- Name: offer_range_classes offer_range_classes_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_classes
    ADD CONSTRAINT offer_range_classes_pkey PRIMARY KEY (id);


--
-- Name: offer_range_classes offer_range_classes_range_id_productclass_id_28eeefae_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_classes
    ADD CONSTRAINT offer_range_classes_range_id_productclass_id_28eeefae_uniq UNIQUE (range_id, productclass_id);


--
-- Name: offer_range_excluded_products offer_range_excluded_products_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_excluded_products
    ADD CONSTRAINT offer_range_excluded_products_pkey PRIMARY KEY (id);


--
-- Name: offer_range_excluded_products offer_range_excluded_products_range_id_product_id_eb1cfe87_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_excluded_products
    ADD CONSTRAINT offer_range_excluded_products_range_id_product_id_eb1cfe87_uniq UNIQUE (range_id, product_id);


--
-- Name: offer_range_included_categories offer_range_included_cat_range_id_category_id_a661d336_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_included_categories
    ADD CONSTRAINT offer_range_included_cat_range_id_category_id_a661d336_uniq UNIQUE (range_id, category_id);


--
-- Name: offer_range_included_categories offer_range_included_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range_included_categories
    ADD CONSTRAINT offer_range_included_categories_pkey PRIMARY KEY (id);


--
-- Name: offer_range offer_range_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range
    ADD CONSTRAINT offer_range_name_key UNIQUE (name);


--
-- Name: offer_range offer_range_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range
    ADD CONSTRAINT offer_range_pkey PRIMARY KEY (id);


--
-- Name: offer_range offer_range_proxy_class_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range
    ADD CONSTRAINT offer_range_proxy_class_key UNIQUE (proxy_class);


--
-- Name: offer_range offer_range_slug_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_range
    ADD CONSTRAINT offer_range_slug_key UNIQUE (slug);


--
-- Name: offer_rangeproduct offer_rangeproduct_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_pkey PRIMARY KEY (id);


--
-- Name: offer_rangeproduct offer_rangeproduct_range_id_product_id_c46b1be8_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_range_id_product_id_c46b1be8_uniq UNIQUE (range_id, product_id);


--
-- Name: offer_rangeproductfileupload offer_rangeproductfileupload_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfileupload_pkey PRIMARY KEY (id);


--
-- Name: order_billingaddress order_billingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_billingaddress
    ADD CONSTRAINT order_billingaddress_pkey PRIMARY KEY (id);


--
-- Name: order_communicationevent order_communicationevent_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_communicationevent
    ADD CONSTRAINT order_communicationevent_pkey PRIMARY KEY (id);


--
-- Name: order_line order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_pkey PRIMARY KEY (id);


--
-- Name: order_lineattribute order_lineattribute_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineattribute
    ADD CONSTRAINT order_lineattribute_pkey PRIMARY KEY (id);


--
-- Name: order_lineprice order_lineprice_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineprice
    ADD CONSTRAINT order_lineprice_pkey PRIMARY KEY (id);


--
-- Name: order_order order_order_number_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_number_key UNIQUE (number);


--
-- Name: order_order order_order_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_pkey PRIMARY KEY (id);


--
-- Name: order_orderdiscount order_orderdiscount_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderdiscount
    ADD CONSTRAINT order_orderdiscount_pkey PRIMARY KEY (id);


--
-- Name: order_ordernote order_ordernote_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_pkey PRIMARY KEY (id);


--
-- Name: order_orderstatuschange order_orderstatuschange_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderstatuschange
    ADD CONSTRAINT order_orderstatuschange_pkey PRIMARY KEY (id);


--
-- Name: order_paymentevent order_paymentevent_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymentevent
    ADD CONSTRAINT order_paymentevent_pkey PRIMARY KEY (id);


--
-- Name: order_paymenteventquantity order_paymenteventquantity_event_id_line_id_765c5209_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_event_id_line_id_765c5209_uniq UNIQUE (event_id, line_id);


--
-- Name: order_paymenteventquantity order_paymenteventquantity_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_pkey PRIMARY KEY (id);


--
-- Name: order_paymenteventtype order_paymenteventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_code_key UNIQUE (code);


--
-- Name: order_paymenteventtype order_paymenteventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_name_key UNIQUE (name);


--
-- Name: order_paymenteventtype order_paymenteventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventtype
    ADD CONSTRAINT order_paymenteventtype_pkey PRIMARY KEY (id);


--
-- Name: order_shippingaddress order_shippingaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingaddress
    ADD CONSTRAINT order_shippingaddress_pkey PRIMARY KEY (id);


--
-- Name: order_shippingevent order_shippingevent_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingevent
    ADD CONSTRAINT order_shippingevent_pkey PRIMARY KEY (id);


--
-- Name: order_shippingeventquantity order_shippingeventquantity_event_id_line_id_91687107_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_event_id_line_id_91687107_uniq UNIQUE (event_id, line_id);


--
-- Name: order_shippingeventquantity order_shippingeventquantity_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_pkey PRIMARY KEY (id);


--
-- Name: order_shippingeventtype order_shippingeventtype_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_code_key UNIQUE (code);


--
-- Name: order_shippingeventtype order_shippingeventtype_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_name_key UNIQUE (name);


--
-- Name: order_shippingeventtype order_shippingeventtype_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventtype
    ADD CONSTRAINT order_shippingeventtype_pkey PRIMARY KEY (id);


--
-- Name: order_surcharge order_surcharge_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_surcharge
    ADD CONSTRAINT order_surcharge_pkey PRIMARY KEY (id);


--
-- Name: partner_partner partner_partner_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner
    ADD CONSTRAINT partner_partner_code_key UNIQUE (code);


--
-- Name: partner_partner partner_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner
    ADD CONSTRAINT partner_partner_pkey PRIMARY KEY (id);


--
-- Name: partner_partner_users partner_partner_users_partner_id_user_id_9e5c0517_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner_users
    ADD CONSTRAINT partner_partner_users_partner_id_user_id_9e5c0517_uniq UNIQUE (partner_id, user_id);


--
-- Name: partner_partner_users partner_partner_users_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner_users
    ADD CONSTRAINT partner_partner_users_pkey PRIMARY KEY (id);


--
-- Name: partner_partneraddress partner_partneraddress_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partneraddress
    ADD CONSTRAINT partner_partneraddress_pkey PRIMARY KEY (id);


--
-- Name: partner_stockalert partner_stockalert_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockalert
    ADD CONSTRAINT partner_stockalert_pkey PRIMARY KEY (id);


--
-- Name: partner_stockrecord partner_stockrecord_partner_id_partner_sku_8441e010_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_partner_id_partner_sku_8441e010_uniq UNIQUE (partner_id, partner_sku);


--
-- Name: partner_stockrecord partner_stockrecord_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_pkey PRIMARY KEY (id);


--
-- Name: payment_bankcard payment_bankcard_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_bankcard
    ADD CONSTRAINT payment_bankcard_pkey PRIMARY KEY (id);


--
-- Name: payment_source payment_source_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_source
    ADD CONSTRAINT payment_source_pkey PRIMARY KEY (id);


--
-- Name: payment_sourcetype payment_sourcetype_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_sourcetype
    ADD CONSTRAINT payment_sourcetype_code_key UNIQUE (code);


--
-- Name: payment_sourcetype payment_sourcetype_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_sourcetype
    ADD CONSTRAINT payment_sourcetype_pkey PRIMARY KEY (id);


--
-- Name: payment_transaction payment_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT payment_transaction_pkey PRIMARY KEY (id);


--
-- Name: reviews_productreview reviews_productreview_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_productreview
    ADD CONSTRAINT reviews_productreview_pkey PRIMARY KEY (id);


--
-- Name: reviews_productreview reviews_productreview_product_id_user_id_c4fdc4cd_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_productreview
    ADD CONSTRAINT reviews_productreview_product_id_user_id_c4fdc4cd_uniq UNIQUE (product_id, user_id);


--
-- Name: reviews_vote reviews_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_vote
    ADD CONSTRAINT reviews_vote_pkey PRIMARY KEY (id);


--
-- Name: reviews_vote reviews_vote_user_id_review_id_bb858939_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_vote
    ADD CONSTRAINT reviews_vote_user_id_review_id_bb858939_uniq UNIQUE (user_id, review_id);


--
-- Name: shipping_orderanditemcharges_countries shipping_orderanditemcha_orderanditemcharges_id_c_9f0c9c8f_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_orderanditemcha_orderanditemcharges_id_c_9f0c9c8f_uniq UNIQUE (orderanditemcharges_id, country_id);


--
-- Name: shipping_orderanditemcharges shipping_orderanditemcharges_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_code_key UNIQUE (code);


--
-- Name: shipping_orderanditemcharges_countries shipping_orderanditemcharges_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_orderanditemcharges_countries_pkey PRIMARY KEY (id);


--
-- Name: shipping_orderanditemcharges shipping_orderanditemcharges_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_name_key UNIQUE (name);


--
-- Name: shipping_orderanditemcharges shipping_orderanditemcharges_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges
    ADD CONSTRAINT shipping_orderanditemcharges_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightband shipping_weightband_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightband
    ADD CONSTRAINT shipping_weightband_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightbased shipping_weightbased_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_code_key UNIQUE (code);


--
-- Name: shipping_weightbased_countries shipping_weightbased_cou_weightbased_id_country_i_de8c5e42_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased_countries
    ADD CONSTRAINT shipping_weightbased_cou_weightbased_id_country_i_de8c5e42_uniq UNIQUE (weightbased_id, country_id);


--
-- Name: shipping_weightbased_countries shipping_weightbased_countries_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased_countries
    ADD CONSTRAINT shipping_weightbased_countries_pkey PRIMARY KEY (id);


--
-- Name: shipping_weightbased shipping_weightbased_name_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_name_key UNIQUE (name);


--
-- Name: shipping_weightbased shipping_weightbased_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased
    ADD CONSTRAINT shipping_weightbased_pkey PRIMARY KEY (id);


--
-- Name: thumbnail_kvstore thumbnail_kvstore_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.thumbnail_kvstore
    ADD CONSTRAINT thumbnail_kvstore_pkey PRIMARY KEY (key);


--
-- Name: voucher_voucher voucher_voucher_code_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher
    ADD CONSTRAINT voucher_voucher_code_key UNIQUE (code);


--
-- Name: voucher_voucher voucher_voucher_name_b96d3b47_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher
    ADD CONSTRAINT voucher_voucher_name_b96d3b47_uniq UNIQUE (name);


--
-- Name: voucher_voucher_offers voucher_voucher_offers_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher_offers
    ADD CONSTRAINT voucher_voucher_offers_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucher_offers voucher_voucher_offers_voucher_id_conditionalof_01628a7f_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher_offers
    ADD CONSTRAINT voucher_voucher_offers_voucher_id_conditionalof_01628a7f_uniq UNIQUE (voucher_id, conditionaloffer_id);


--
-- Name: voucher_voucher voucher_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher
    ADD CONSTRAINT voucher_voucher_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucherapplication voucher_voucherapplication_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_pkey PRIMARY KEY (id);


--
-- Name: voucher_voucherset voucher_voucherset_name_4c6aac05_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherset
    ADD CONSTRAINT voucher_voucherset_name_4c6aac05_uniq UNIQUE (name);


--
-- Name: voucher_voucherset voucher_voucherset_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherset
    ADD CONSTRAINT voucher_voucherset_pkey PRIMARY KEY (id);


--
-- Name: wishlists_line wishlists_line_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_line
    ADD CONSTRAINT wishlists_line_pkey PRIMARY KEY (id);


--
-- Name: wishlists_line wishlists_line_wishlist_id_product_id_78f04673_uniq; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_line
    ADD CONSTRAINT wishlists_line_wishlist_id_product_id_78f04673_uniq UNIQUE (wishlist_id, product_id);


--
-- Name: wishlists_wishlist wishlists_wishlist_key_key; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_key_key UNIQUE (key);


--
-- Name: wishlists_wishlist wishlists_wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_pkey PRIMARY KEY (id);


--
-- Name: address_country_display_order_dc88cde8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_country_display_order_dc88cde8 ON public.address_country USING btree (display_order);


--
-- Name: address_country_is_shipping_country_f7b6c461; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_country_is_shipping_country_f7b6c461 ON public.address_country USING btree (is_shipping_country);


--
-- Name: address_country_iso_3166_1_a2_f395eed0_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_country_iso_3166_1_a2_f395eed0_like ON public.address_country USING btree (iso_3166_1_a2 varchar_pattern_ops);


--
-- Name: address_country_printable_name_450b016c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_country_printable_name_450b016c ON public.address_country USING btree (printable_name);


--
-- Name: address_country_printable_name_450b016c_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_country_printable_name_450b016c_like ON public.address_country USING btree (printable_name varchar_pattern_ops);


--
-- Name: address_useraddress_country_id_fa26a249; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_useraddress_country_id_fa26a249 ON public.address_useraddress USING btree (country_id);


--
-- Name: address_useraddress_country_id_fa26a249_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_useraddress_country_id_fa26a249_like ON public.address_useraddress USING btree (country_id varchar_pattern_ops);


--
-- Name: address_useraddress_hash_e0a6b290; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_useraddress_hash_e0a6b290 ON public.address_useraddress USING btree (hash);


--
-- Name: address_useraddress_hash_e0a6b290_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_useraddress_hash_e0a6b290_like ON public.address_useraddress USING btree (hash varchar_pattern_ops);


--
-- Name: address_useraddress_user_id_6edf0244; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX address_useraddress_user_id_6edf0244 ON public.address_useraddress USING btree (user_id);


--
-- Name: analytics_productrecord_num_purchases_405301a0; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_productrecord_num_purchases_405301a0 ON public.analytics_productrecord USING btree (num_purchases);


--
-- Name: analytics_userproductview_product_id_a55b87ad; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_userproductview_product_id_a55b87ad ON public.analytics_userproductview USING btree (product_id);


--
-- Name: analytics_userproductview_user_id_5e49a8b1; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_userproductview_user_id_5e49a8b1 ON public.analytics_userproductview USING btree (user_id);


--
-- Name: analytics_userrecord_num_order_items_fb2a8304; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_userrecord_num_order_items_fb2a8304 ON public.analytics_userrecord USING btree (num_order_items);


--
-- Name: analytics_userrecord_num_order_lines_97cc087f; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_userrecord_num_order_lines_97cc087f ON public.analytics_userrecord USING btree (num_order_lines);


--
-- Name: analytics_userrecord_num_orders_b352ffd1; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_userrecord_num_orders_b352ffd1 ON public.analytics_userrecord USING btree (num_orders);


--
-- Name: analytics_usersearch_query_ad36478b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_usersearch_query_ad36478b ON public.analytics_usersearch USING btree (query);


--
-- Name: analytics_usersearch_query_ad36478b_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_usersearch_query_ad36478b_like ON public.analytics_usersearch USING btree (query varchar_pattern_ops);


--
-- Name: analytics_usersearch_user_id_1775992d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX analytics_usersearch_user_id_1775992d ON public.analytics_usersearch USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: basket_basket_owner_id_3a018de5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_basket_owner_id_3a018de5 ON public.basket_basket USING btree (owner_id);


--
-- Name: basket_basket_vouchers_basket_id_f857c2f8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_basket_vouchers_basket_id_f857c2f8 ON public.basket_basket_vouchers USING btree (basket_id);


--
-- Name: basket_basket_vouchers_voucher_id_c2b66981; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_basket_vouchers_voucher_id_c2b66981 ON public.basket_basket_vouchers USING btree (voucher_id);


--
-- Name: basket_line_basket_id_b615c905; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_basket_id_b615c905 ON public.basket_line USING btree (basket_id);


--
-- Name: basket_line_date_created_eb0dfb1b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_date_created_eb0dfb1b ON public.basket_line USING btree (date_created);


--
-- Name: basket_line_date_updated_a74d069d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_date_updated_a74d069d ON public.basket_line USING btree (date_updated);


--
-- Name: basket_line_line_reference_08e91113; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_line_reference_08e91113 ON public.basket_line USING btree (line_reference);


--
-- Name: basket_line_line_reference_08e91113_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_line_reference_08e91113_like ON public.basket_line USING btree (line_reference varchar_pattern_ops);


--
-- Name: basket_line_product_id_303d743e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_product_id_303d743e ON public.basket_line USING btree (product_id);


--
-- Name: basket_line_stockrecord_id_7039d8a4; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_line_stockrecord_id_7039d8a4 ON public.basket_line USING btree (stockrecord_id);


--
-- Name: basket_lineattribute_line_id_c41e0cdf; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_lineattribute_line_id_c41e0cdf ON public.basket_lineattribute USING btree (line_id);


--
-- Name: basket_lineattribute_option_id_9387a3f7; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX basket_lineattribute_option_id_9387a3f7 ON public.basket_lineattribute USING btree (option_id);


--
-- Name: catalogue_attributeoption_group_id_3d4a5e24; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_attributeoption_group_id_3d4a5e24 ON public.catalogue_attributeoption USING btree (group_id);


--
-- Name: catalogue_category_ancestors_are_public_d088d0db; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_ancestors_are_public_d088d0db ON public.catalogue_category USING btree (ancestors_are_public);


--
-- Name: catalogue_category_is_public_ab0536be; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_is_public_ab0536be ON public.catalogue_category USING btree (is_public);


--
-- Name: catalogue_category_name_1f342ac2; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_name_1f342ac2 ON public.catalogue_category USING btree (name);


--
-- Name: catalogue_category_name_1f342ac2_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_name_1f342ac2_like ON public.catalogue_category USING btree (name varchar_pattern_ops);


--
-- Name: catalogue_category_path_1c5b79c2_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_path_1c5b79c2_like ON public.catalogue_category USING btree (path varchar_pattern_ops);


--
-- Name: catalogue_category_slug_9635febd; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_slug_9635febd ON public.catalogue_category USING btree (slug);


--
-- Name: catalogue_category_slug_9635febd_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_category_slug_9635febd_like ON public.catalogue_category USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_option_code_0697b920_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_option_code_0697b920_like ON public.catalogue_option USING btree (code varchar_pattern_ops);


--
-- Name: catalogue_option_name_7b84926d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_option_name_7b84926d ON public.catalogue_option USING btree (name);


--
-- Name: catalogue_option_name_7b84926d_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_option_name_7b84926d_like ON public.catalogue_option USING btree (name varchar_pattern_ops);


--
-- Name: catalogue_product_date_created_d66f485a; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_date_created_d66f485a ON public.catalogue_product USING btree (date_created);


--
-- Name: catalogue_product_date_updated_d3a1785d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_date_updated_d3a1785d ON public.catalogue_product USING btree (date_updated);


--
-- Name: catalogue_product_is_public_1cf798c5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_is_public_1cf798c5 ON public.catalogue_product USING btree (is_public);


--
-- Name: catalogue_product_parent_id_9bfd2382; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_parent_id_9bfd2382 ON public.catalogue_product USING btree (parent_id);


--
-- Name: catalogue_product_product_class_id_0c6c5b54; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_product_class_id_0c6c5b54 ON public.catalogue_product USING btree (product_class_id);


--
-- Name: catalogue_product_product_options_option_id_ff470e13; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_product_options_option_id_ff470e13 ON public.catalogue_product_product_options USING btree (option_id);


--
-- Name: catalogue_product_product_options_product_id_ad2b46bd; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_product_options_product_id_ad2b46bd ON public.catalogue_product_product_options USING btree (product_id);


--
-- Name: catalogue_product_slug_c8e2e2b9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_slug_c8e2e2b9 ON public.catalogue_product USING btree (slug);


--
-- Name: catalogue_product_slug_c8e2e2b9_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_slug_c8e2e2b9_like ON public.catalogue_product USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_product_upc_91f72b90_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_product_upc_91f72b90_like ON public.catalogue_product USING btree (upc varchar_pattern_ops);


--
-- Name: catalogue_productattribute_attributeoption_id_962b600b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_attributeoption_id_962b600b ON public.catalogue_productattributevalue_value_multi_option USING btree (attributeoption_id);


--
-- Name: catalogue_productattribute_code_9ffea293; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_code_9ffea293 ON public.catalogue_productattribute USING btree (code);


--
-- Name: catalogue_productattribute_code_9ffea293_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_code_9ffea293_like ON public.catalogue_productattribute USING btree (code varchar_pattern_ops);


--
-- Name: catalogue_productattribute_option_group_id_6b422dc2; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_option_group_id_6b422dc2 ON public.catalogue_productattribute USING btree (option_group_id);


--
-- Name: catalogue_productattribute_product_class_id_7af808ec; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_product_class_id_7af808ec ON public.catalogue_productattribute USING btree (product_class_id);


--
-- Name: catalogue_productattribute_productattributevalue_id_9c7c031e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattribute_productattributevalue_id_9c7c031e ON public.catalogue_productattributevalue_value_multi_option USING btree (productattributevalue_id);


--
-- Name: catalogue_productattributevalue_attribute_id_0287c1e7; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_attribute_id_0287c1e7 ON public.catalogue_productattributevalue USING btree (attribute_id);


--
-- Name: catalogue_productattributevalue_entity_content_type_id_f7186ab5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_entity_content_type_id_f7186ab5 ON public.catalogue_productattributevalue USING btree (entity_content_type_id);


--
-- Name: catalogue_productattributevalue_product_id_a03cd90e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_product_id_a03cd90e ON public.catalogue_productattributevalue USING btree (product_id);


--
-- Name: catalogue_productattributevalue_value_boolean_c5b0d66a; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_boolean_c5b0d66a ON public.catalogue_productattributevalue USING btree (value_boolean);


--
-- Name: catalogue_productattributevalue_value_date_d18775c1; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_date_d18775c1 ON public.catalogue_productattributevalue USING btree (value_date);


--
-- Name: catalogue_productattributevalue_value_datetime_b474ac38; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_datetime_b474ac38 ON public.catalogue_productattributevalue USING btree (value_datetime);


--
-- Name: catalogue_productattributevalue_value_float_5ef8d3db; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_float_5ef8d3db ON public.catalogue_productattributevalue USING btree (value_float);


--
-- Name: catalogue_productattributevalue_value_integer_55fbb7d6; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_integer_55fbb7d6 ON public.catalogue_productattributevalue USING btree (value_integer);


--
-- Name: catalogue_productattributevalue_value_option_id_21026066; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productattributevalue_value_option_id_21026066 ON public.catalogue_productattributevalue USING btree (value_option_id);


--
-- Name: catalogue_productcategory_category_id_176db535; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productcategory_category_id_176db535 ON public.catalogue_productcategory USING btree (category_id);


--
-- Name: catalogue_productcategory_product_id_846a4061; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productcategory_product_id_846a4061 ON public.catalogue_productcategory USING btree (product_id);


--
-- Name: catalogue_productclass_options_option_id_b099542c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productclass_options_option_id_b099542c ON public.catalogue_productclass_options USING btree (option_id);


--
-- Name: catalogue_productclass_options_productclass_id_732df4c8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productclass_options_productclass_id_732df4c8 ON public.catalogue_productclass_options USING btree (productclass_id);


--
-- Name: catalogue_productclass_slug_270c6b2b_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productclass_slug_270c6b2b_like ON public.catalogue_productclass USING btree (slug varchar_pattern_ops);


--
-- Name: catalogue_productimage_display_order_9fa741ac; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productimage_display_order_9fa741ac ON public.catalogue_productimage USING btree (display_order);


--
-- Name: catalogue_productimage_product_id_49474fe8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productimage_product_id_49474fe8 ON public.catalogue_productimage USING btree (product_id);


--
-- Name: catalogue_productrecommendation_primary_id_6e51a55c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productrecommendation_primary_id_6e51a55c ON public.catalogue_productrecommendation USING btree (primary_id);


--
-- Name: catalogue_productrecommendation_ranking_e7a0f7fd; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productrecommendation_ranking_e7a0f7fd ON public.catalogue_productrecommendation USING btree (ranking);


--
-- Name: catalogue_productrecommendation_recommendation_id_daf8ae95; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX catalogue_productrecommendation_recommendation_id_daf8ae95 ON public.catalogue_productrecommendation USING btree (recommendation_id);


--
-- Name: communication_communicationeventtype_name_45761eb9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX communication_communicationeventtype_name_45761eb9 ON public.communication_communicationeventtype USING btree (name);


--
-- Name: communication_communicationeventtype_name_45761eb9_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX communication_communicationeventtype_name_45761eb9_like ON public.communication_communicationeventtype USING btree (name varchar_pattern_ops);


--
-- Name: customer_communicationeventtype_code_984beacb_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_communicationeventtype_code_984beacb_like ON public.communication_communicationeventtype USING btree (code varchar_pattern_ops);


--
-- Name: customer_email_user_id_a69ad588; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_email_user_id_a69ad588 ON public.communication_email USING btree (user_id);


--
-- Name: customer_notification_date_sent_9b6baeda; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_notification_date_sent_9b6baeda ON public.communication_notification USING btree (date_sent);


--
-- Name: customer_notification_recipient_id_d99de5c8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_notification_recipient_id_d99de5c8 ON public.communication_notification USING btree (recipient_id);


--
-- Name: customer_notification_sender_id_affa1632; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_notification_sender_id_affa1632 ON public.communication_notification USING btree (sender_id);


--
-- Name: customer_productalert_date_created_00622b1c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_date_created_00622b1c ON public.customer_productalert USING btree (date_created);


--
-- Name: customer_productalert_email_e5f35f45; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_email_e5f35f45 ON public.customer_productalert USING btree (email);


--
-- Name: customer_productalert_email_e5f35f45_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_email_e5f35f45_like ON public.customer_productalert USING btree (email varchar_pattern_ops);


--
-- Name: customer_productalert_key_a26f3bdc; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_key_a26f3bdc ON public.customer_productalert USING btree (key);


--
-- Name: customer_productalert_key_a26f3bdc_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_key_a26f3bdc_like ON public.customer_productalert USING btree (key varchar_pattern_ops);


--
-- Name: customer_productalert_product_id_7e529a41; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_product_id_7e529a41 ON public.customer_productalert USING btree (product_id);


--
-- Name: customer_productalert_user_id_677ad6d6; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX customer_productalert_user_id_677ad6d6 ON public.customer_productalert USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_flatpage_sites_flatpage_id_078bbc8b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_flatpage_sites_flatpage_id_078bbc8b ON public.django_flatpage_sites USING btree (flatpage_id);


--
-- Name: django_flatpage_sites_site_id_bfd8ea84; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_flatpage_sites_site_id_bfd8ea84 ON public.django_flatpage_sites USING btree (site_id);


--
-- Name: django_flatpage_url_41612362; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_flatpage_url_41612362 ON public.django_flatpage USING btree (url);


--
-- Name: django_flatpage_url_41612362_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_flatpage_url_41612362_like ON public.django_flatpage USING btree (url varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_name_5fe0edc6; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6 ON public.easy_thumbnails_source USING btree (name);


--
-- Name: easy_thumbnails_source_name_5fe0edc6_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_source_name_5fe0edc6_like ON public.easy_thumbnails_source USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9 ON public.easy_thumbnails_source USING btree (storage_hash);


--
-- Name: easy_thumbnails_source_storage_hash_946cbcc9_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_source_storage_hash_946cbcc9_like ON public.easy_thumbnails_source USING btree (storage_hash varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31 ON public.easy_thumbnails_thumbnail USING btree (name);


--
-- Name: easy_thumbnails_thumbnail_name_b5882c31_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_thumbnail_name_b5882c31_like ON public.easy_thumbnails_thumbnail USING btree (name varchar_pattern_ops);


--
-- Name: easy_thumbnails_thumbnail_source_id_5b57bc77; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_thumbnail_source_id_5b57bc77 ON public.easy_thumbnails_thumbnail USING btree (source_id);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49 ON public.easy_thumbnails_thumbnail USING btree (storage_hash);


--
-- Name: easy_thumbnails_thumbnail_storage_hash_f1435f49_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX easy_thumbnails_thumbnail_storage_hash_f1435f49_like ON public.easy_thumbnails_thumbnail USING btree (storage_hash varchar_pattern_ops);


--
-- Name: offer_benefit_range_id_ab19c5ab; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_benefit_range_id_ab19c5ab ON public.offer_benefit USING btree (range_id);


--
-- Name: offer_condition_range_id_b023a2aa; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_condition_range_id_b023a2aa ON public.offer_condition USING btree (range_id);


--
-- Name: offer_conditionaloffer_benefit_id_f43f68b5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_benefit_id_f43f68b5 ON public.offer_conditionaloffer USING btree (benefit_id);


--
-- Name: offer_conditionaloffer_com_from_conditionaloffer_id_85c3bd9f; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_com_from_conditionaloffer_id_85c3bd9f ON public.offer_conditionaloffer_combinations USING btree (from_conditionaloffer_id);


--
-- Name: offer_conditionaloffer_com_to_conditionaloffer_id_ae993478; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_com_to_conditionaloffer_id_ae993478 ON public.offer_conditionaloffer_combinations USING btree (to_conditionaloffer_id);


--
-- Name: offer_conditionaloffer_condition_id_e6baa945; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_condition_id_e6baa945 ON public.offer_conditionaloffer USING btree (condition_id);


--
-- Name: offer_conditionaloffer_name_340601c2_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_name_340601c2_like ON public.offer_conditionaloffer USING btree (name varchar_pattern_ops);


--
-- Name: offer_conditionaloffer_priority_4c2fc582; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_priority_4c2fc582 ON public.offer_conditionaloffer USING btree (priority);


--
-- Name: offer_conditionaloffer_slug_e4649c01_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_conditionaloffer_slug_e4649c01_like ON public.offer_conditionaloffer USING btree (slug varchar_pattern_ops);


--
-- Name: offer_range_classes_productclass_id_6f6de46d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_classes_productclass_id_6f6de46d ON public.offer_range_classes USING btree (productclass_id);


--
-- Name: offer_range_classes_range_id_7d3e573e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_classes_range_id_7d3e573e ON public.offer_range_classes USING btree (range_id);


--
-- Name: offer_range_excluded_products_product_id_78c49bfc; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_excluded_products_product_id_78c49bfc ON public.offer_range_excluded_products USING btree (product_id);


--
-- Name: offer_range_excluded_products_range_id_cce4a032; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_excluded_products_range_id_cce4a032 ON public.offer_range_excluded_products USING btree (range_id);


--
-- Name: offer_range_included_categories_category_id_c61569a5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_included_categories_category_id_c61569a5 ON public.offer_range_included_categories USING btree (category_id);


--
-- Name: offer_range_included_categories_range_id_1b616138; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_included_categories_range_id_1b616138 ON public.offer_range_included_categories USING btree (range_id);


--
-- Name: offer_range_name_c72a602f_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_name_c72a602f_like ON public.offer_range USING btree (name varchar_pattern_ops);


--
-- Name: offer_range_proxy_class_3c9917c6_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_proxy_class_3c9917c6_like ON public.offer_range USING btree (proxy_class varchar_pattern_ops);


--
-- Name: offer_range_slug_ce39e53b_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_range_slug_ce39e53b_like ON public.offer_range USING btree (slug varchar_pattern_ops);


--
-- Name: offer_rangeproduct_product_id_723b3ea3; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_rangeproduct_product_id_723b3ea3 ON public.offer_rangeproduct USING btree (product_id);


--
-- Name: offer_rangeproduct_range_id_ee358495; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_rangeproduct_range_id_ee358495 ON public.offer_rangeproduct USING btree (range_id);


--
-- Name: offer_rangeproductfileupload_date_uploaded_f0a4f9ae; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_rangeproductfileupload_date_uploaded_f0a4f9ae ON public.offer_rangeproductfileupload USING btree (date_uploaded);


--
-- Name: offer_rangeproductfileupload_range_id_c055ebf8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_rangeproductfileupload_range_id_c055ebf8 ON public.offer_rangeproductfileupload USING btree (range_id);


--
-- Name: offer_rangeproductfileupload_uploaded_by_id_c01a3250; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX offer_rangeproductfileupload_uploaded_by_id_c01a3250 ON public.offer_rangeproductfileupload USING btree (uploaded_by_id);


--
-- Name: order_billingaddress_country_id_17f57dca; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_billingaddress_country_id_17f57dca ON public.order_billingaddress USING btree (country_id);


--
-- Name: order_billingaddress_country_id_17f57dca_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_billingaddress_country_id_17f57dca_like ON public.order_billingaddress USING btree (country_id varchar_pattern_ops);


--
-- Name: order_communicationevent_date_created_ce404d62; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_communicationevent_date_created_ce404d62 ON public.order_communicationevent USING btree (date_created);


--
-- Name: order_communicationevent_event_type_id_4bc9ee29; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_communicationevent_event_type_id_4bc9ee29 ON public.order_communicationevent USING btree (event_type_id);


--
-- Name: order_communicationevent_order_id_94e784ac; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_communicationevent_order_id_94e784ac ON public.order_communicationevent USING btree (order_id);


--
-- Name: order_line_order_id_b9148391; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_line_order_id_b9148391 ON public.order_line USING btree (order_id);


--
-- Name: order_line_partner_id_258a2fb9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_line_partner_id_258a2fb9 ON public.order_line USING btree (partner_id);


--
-- Name: order_line_product_id_e620902d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_line_product_id_e620902d ON public.order_line USING btree (product_id);


--
-- Name: order_line_stockrecord_id_1d65aff5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_line_stockrecord_id_1d65aff5 ON public.order_line USING btree (stockrecord_id);


--
-- Name: order_lineattribute_line_id_adf6dd87; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_lineattribute_line_id_adf6dd87 ON public.order_lineattribute USING btree (line_id);


--
-- Name: order_lineattribute_option_id_b54d597c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_lineattribute_option_id_b54d597c ON public.order_lineattribute USING btree (option_id);


--
-- Name: order_lineprice_line_id_2de52446; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_lineprice_line_id_2de52446 ON public.order_lineprice USING btree (line_id);


--
-- Name: order_lineprice_order_id_66792e56; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_lineprice_order_id_66792e56 ON public.order_lineprice USING btree (order_id);


--
-- Name: order_order_basket_id_8b0acbb2; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_basket_id_8b0acbb2 ON public.order_order USING btree (basket_id);


--
-- Name: order_order_billing_address_id_8fe537cf; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_billing_address_id_8fe537cf ON public.order_order USING btree (billing_address_id);


--
-- Name: order_order_date_placed_506a9365; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_date_placed_506a9365 ON public.order_order USING btree (date_placed);


--
-- Name: order_order_number_49f06f1b_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_number_49f06f1b_like ON public.order_order USING btree (number varchar_pattern_ops);


--
-- Name: order_order_shipping_address_id_57e64931; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_shipping_address_id_57e64931 ON public.order_order USING btree (shipping_address_id);


--
-- Name: order_order_site_id_e27f3526; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_site_id_e27f3526 ON public.order_order USING btree (site_id);


--
-- Name: order_order_user_id_7cf9bc2b; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_order_user_id_7cf9bc2b ON public.order_order USING btree (user_id);


--
-- Name: order_orderdiscount_offer_name_706d6119; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderdiscount_offer_name_706d6119 ON public.order_orderdiscount USING btree (offer_name);


--
-- Name: order_orderdiscount_offer_name_706d6119_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderdiscount_offer_name_706d6119_like ON public.order_orderdiscount USING btree (offer_name varchar_pattern_ops);


--
-- Name: order_orderdiscount_order_id_bc91e123; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderdiscount_order_id_bc91e123 ON public.order_orderdiscount USING btree (order_id);


--
-- Name: order_orderdiscount_voucher_code_6ee4f360; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderdiscount_voucher_code_6ee4f360 ON public.order_orderdiscount USING btree (voucher_code);


--
-- Name: order_orderdiscount_voucher_code_6ee4f360_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderdiscount_voucher_code_6ee4f360_like ON public.order_orderdiscount USING btree (voucher_code varchar_pattern_ops);


--
-- Name: order_ordernote_order_id_7d97583d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_ordernote_order_id_7d97583d ON public.order_ordernote USING btree (order_id);


--
-- Name: order_ordernote_user_id_48d7a672; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_ordernote_user_id_48d7a672 ON public.order_ordernote USING btree (user_id);


--
-- Name: order_orderstatuschange_date_created_a5107b93; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderstatuschange_date_created_a5107b93 ON public.order_orderstatuschange USING btree (date_created);


--
-- Name: order_orderstatuschange_order_id_43efdbe5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_orderstatuschange_order_id_43efdbe5 ON public.order_orderstatuschange USING btree (order_id);


--
-- Name: order_paymentevent_date_created_05d8c079; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymentevent_date_created_05d8c079 ON public.order_paymentevent USING btree (date_created);


--
-- Name: order_paymentevent_event_type_id_568c7161; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymentevent_event_type_id_568c7161 ON public.order_paymentevent USING btree (event_type_id);


--
-- Name: order_paymentevent_order_id_395b3e82; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymentevent_order_id_395b3e82 ON public.order_paymentevent USING btree (order_id);


--
-- Name: order_paymentevent_shipping_event_id_213dcfb8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymentevent_shipping_event_id_213dcfb8 ON public.order_paymentevent USING btree (shipping_event_id);


--
-- Name: order_paymenteventquantity_event_id_a540165a; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymenteventquantity_event_id_a540165a ON public.order_paymenteventquantity USING btree (event_id);


--
-- Name: order_paymenteventquantity_line_id_df44b021; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymenteventquantity_line_id_df44b021 ON public.order_paymenteventquantity USING btree (line_id);


--
-- Name: order_paymenteventtype_code_19e3e888_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymenteventtype_code_19e3e888_like ON public.order_paymenteventtype USING btree (code varchar_pattern_ops);


--
-- Name: order_paymenteventtype_name_e4bcca28_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_paymenteventtype_name_e4bcca28_like ON public.order_paymenteventtype USING btree (name varchar_pattern_ops);


--
-- Name: order_shippingaddress_country_id_29abf9a0; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingaddress_country_id_29abf9a0 ON public.order_shippingaddress USING btree (country_id);


--
-- Name: order_shippingaddress_country_id_29abf9a0_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingaddress_country_id_29abf9a0_like ON public.order_shippingaddress USING btree (country_id varchar_pattern_ops);


--
-- Name: order_shippingevent_date_created_74c4a6fa; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingevent_date_created_74c4a6fa ON public.order_shippingevent USING btree (date_created);


--
-- Name: order_shippingevent_event_type_id_9f1efb20; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingevent_event_type_id_9f1efb20 ON public.order_shippingevent USING btree (event_type_id);


--
-- Name: order_shippingevent_order_id_8c031fb6; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingevent_order_id_8c031fb6 ON public.order_shippingevent USING btree (order_id);


--
-- Name: order_shippingeventquantity_event_id_1c7fb9c7; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingeventquantity_event_id_1c7fb9c7 ON public.order_shippingeventquantity USING btree (event_id);


--
-- Name: order_shippingeventquantity_line_id_3b089ee0; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingeventquantity_line_id_3b089ee0 ON public.order_shippingeventquantity USING btree (line_id);


--
-- Name: order_shippingeventtype_code_db3854de_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingeventtype_code_db3854de_like ON public.order_shippingeventtype USING btree (code varchar_pattern_ops);


--
-- Name: order_shippingeventtype_name_6d9a48a2_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_shippingeventtype_name_6d9a48a2_like ON public.order_shippingeventtype USING btree (name varchar_pattern_ops);


--
-- Name: order_surcharge_order_id_5c0a94f5; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX order_surcharge_order_id_5c0a94f5 ON public.order_surcharge USING btree (order_id);


--
-- Name: partner_partner_code_13d0debd_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partner_code_13d0debd_like ON public.partner_partner USING btree (code varchar_pattern_ops);


--
-- Name: partner_partner_name_caa0c2ee; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partner_name_caa0c2ee ON public.partner_partner USING btree (name);


--
-- Name: partner_partner_name_caa0c2ee_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partner_name_caa0c2ee_like ON public.partner_partner USING btree (name varchar_pattern_ops);


--
-- Name: partner_partner_users_partner_id_1883dfd9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partner_users_partner_id_1883dfd9 ON public.partner_partner_users USING btree (partner_id);


--
-- Name: partner_partner_users_user_id_d75d6e40; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partner_users_user_id_d75d6e40 ON public.partner_partner_users USING btree (user_id);


--
-- Name: partner_partneraddress_country_id_02c4f979; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partneraddress_country_id_02c4f979 ON public.partner_partneraddress USING btree (country_id);


--
-- Name: partner_partneraddress_country_id_02c4f979_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partneraddress_country_id_02c4f979_like ON public.partner_partneraddress USING btree (country_id varchar_pattern_ops);


--
-- Name: partner_partneraddress_partner_id_59551b0a; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_partneraddress_partner_id_59551b0a ON public.partner_partneraddress USING btree (partner_id);


--
-- Name: partner_stockalert_date_created_832cf043; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_stockalert_date_created_832cf043 ON public.partner_stockalert USING btree (date_created);


--
-- Name: partner_stockalert_stockrecord_id_68ad503a; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_stockalert_stockrecord_id_68ad503a ON public.partner_stockalert USING btree (stockrecord_id);


--
-- Name: partner_stockrecord_date_updated_e6ae5f14; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_stockrecord_date_updated_e6ae5f14 ON public.partner_stockrecord USING btree (date_updated);


--
-- Name: partner_stockrecord_partner_id_4155a586; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_stockrecord_partner_id_4155a586 ON public.partner_stockrecord USING btree (partner_id);


--
-- Name: partner_stockrecord_product_id_62fd9e45; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX partner_stockrecord_product_id_62fd9e45 ON public.partner_stockrecord USING btree (product_id);


--
-- Name: payment_bankcard_user_id_08e1d04c; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_bankcard_user_id_08e1d04c ON public.payment_bankcard USING btree (user_id);


--
-- Name: payment_source_order_id_6b7f2215; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_source_order_id_6b7f2215 ON public.payment_source USING btree (order_id);


--
-- Name: payment_source_source_type_id_700828fe; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_source_source_type_id_700828fe ON public.payment_source USING btree (source_type_id);


--
-- Name: payment_sourcetype_code_e479088c_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_sourcetype_code_e479088c_like ON public.payment_sourcetype USING btree (code varchar_pattern_ops);


--
-- Name: payment_sourcetype_name_a980e862; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_sourcetype_name_a980e862 ON public.payment_sourcetype USING btree (name);


--
-- Name: payment_sourcetype_name_a980e862_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_sourcetype_name_a980e862_like ON public.payment_sourcetype USING btree (name varchar_pattern_ops);


--
-- Name: payment_transaction_date_created_f887f6bc; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_transaction_date_created_f887f6bc ON public.payment_transaction USING btree (date_created);


--
-- Name: payment_transaction_source_id_c5ac31e8; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX payment_transaction_source_id_c5ac31e8 ON public.payment_transaction USING btree (source_id);


--
-- Name: reviews_productreview_delta_votes_bd8ffc87; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX reviews_productreview_delta_votes_bd8ffc87 ON public.reviews_productreview USING btree (delta_votes);


--
-- Name: reviews_productreview_product_id_52e52a32; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX reviews_productreview_product_id_52e52a32 ON public.reviews_productreview USING btree (product_id);


--
-- Name: reviews_productreview_user_id_8acb5ddd; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX reviews_productreview_user_id_8acb5ddd ON public.reviews_productreview USING btree (user_id);


--
-- Name: reviews_vote_review_id_371b2d8d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX reviews_vote_review_id_371b2d8d ON public.reviews_vote USING btree (review_id);


--
-- Name: reviews_vote_user_id_5fb87b53; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX reviews_vote_user_id_5fb87b53 ON public.reviews_vote USING btree (user_id);


--
-- Name: shipping_orderanditemcharg_orderanditemcharges_id_bf5bfee9; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_orderanditemcharg_orderanditemcharges_id_bf5bfee9 ON public.shipping_orderanditemcharges_countries USING btree (orderanditemcharges_id);


--
-- Name: shipping_orderanditemcharges_code_cbeb9206_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_orderanditemcharges_code_cbeb9206_like ON public.shipping_orderanditemcharges USING btree (code varchar_pattern_ops);


--
-- Name: shipping_orderanditemcharges_countries_country_id_30387f2e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_orderanditemcharges_countries_country_id_30387f2e ON public.shipping_orderanditemcharges_countries USING btree (country_id);


--
-- Name: shipping_orderanditemcharges_countries_country_id_30387f2e_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_orderanditemcharges_countries_country_id_30387f2e_like ON public.shipping_orderanditemcharges_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: shipping_orderanditemcharges_name_c575f5bc_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_orderanditemcharges_name_c575f5bc_like ON public.shipping_orderanditemcharges USING btree (name varchar_pattern_ops);


--
-- Name: shipping_weightband_method_id_b699a1ba; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightband_method_id_b699a1ba ON public.shipping_weightband USING btree (method_id);


--
-- Name: shipping_weightband_upper_limit_9edc5097; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightband_upper_limit_9edc5097 ON public.shipping_weightband USING btree (upper_limit);


--
-- Name: shipping_weightbased_code_abff8e3d_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightbased_code_abff8e3d_like ON public.shipping_weightbased USING btree (code varchar_pattern_ops);


--
-- Name: shipping_weightbased_countries_country_id_06117384; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightbased_countries_country_id_06117384 ON public.shipping_weightbased_countries USING btree (country_id);


--
-- Name: shipping_weightbased_countries_country_id_06117384_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightbased_countries_country_id_06117384_like ON public.shipping_weightbased_countries USING btree (country_id varchar_pattern_ops);


--
-- Name: shipping_weightbased_countries_weightbased_id_93e3132f; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightbased_countries_weightbased_id_93e3132f ON public.shipping_weightbased_countries USING btree (weightbased_id);


--
-- Name: shipping_weightbased_name_ff8fabb8_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX shipping_weightbased_name_ff8fabb8_like ON public.shipping_weightbased USING btree (name varchar_pattern_ops);


--
-- Name: thumbnail_kvstore_key_3f850178_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX thumbnail_kvstore_key_3f850178_like ON public.thumbnail_kvstore USING btree (key varchar_pattern_ops);


--
-- Name: voucher_voucher_code_43d30a18_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_code_43d30a18_like ON public.voucher_voucher USING btree (code varchar_pattern_ops);


--
-- Name: voucher_voucher_date_created_f3081a03; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_date_created_f3081a03 ON public.voucher_voucher USING btree (date_created);


--
-- Name: voucher_voucher_end_datetime_db182297; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_end_datetime_db182297 ON public.voucher_voucher USING btree (end_datetime);


--
-- Name: voucher_voucher_name_b96d3b47_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_name_b96d3b47_like ON public.voucher_voucher USING btree (name varchar_pattern_ops);


--
-- Name: voucher_voucher_offers_conditionaloffer_id_f9682bfb; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_offers_conditionaloffer_id_f9682bfb ON public.voucher_voucher_offers USING btree (conditionaloffer_id);


--
-- Name: voucher_voucher_offers_voucher_id_7f9c575d; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_offers_voucher_id_7f9c575d ON public.voucher_voucher_offers USING btree (voucher_id);


--
-- Name: voucher_voucher_start_datetime_bfb7df84; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_start_datetime_bfb7df84 ON public.voucher_voucher USING btree (start_datetime);


--
-- Name: voucher_voucher_voucher_set_id_17b96a54; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucher_voucher_set_id_17b96a54 ON public.voucher_voucher USING btree (voucher_set_id);


--
-- Name: voucher_voucherapplication_date_created_2d9acdaf; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherapplication_date_created_2d9acdaf ON public.voucher_voucherapplication USING btree (date_created);


--
-- Name: voucher_voucherapplication_order_id_30248a05; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherapplication_order_id_30248a05 ON public.voucher_voucherapplication USING btree (order_id);


--
-- Name: voucher_voucherapplication_user_id_df53a393; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherapplication_user_id_df53a393 ON public.voucher_voucherapplication USING btree (user_id);


--
-- Name: voucher_voucherapplication_voucher_id_5204edb7; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherapplication_voucher_id_5204edb7 ON public.voucher_voucherapplication USING btree (voucher_id);


--
-- Name: voucher_voucherset_date_created_3dd68c8e; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherset_date_created_3dd68c8e ON public.voucher_voucherset USING btree (date_created);


--
-- Name: voucher_voucherset_name_4c6aac05_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX voucher_voucherset_name_4c6aac05_like ON public.voucher_voucherset USING btree (name varchar_pattern_ops);


--
-- Name: wishlists_line_product_id_9d6d9b37; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX wishlists_line_product_id_9d6d9b37 ON public.wishlists_line USING btree (product_id);


--
-- Name: wishlists_line_wishlist_id_4cffe302; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX wishlists_line_wishlist_id_4cffe302 ON public.wishlists_line USING btree (wishlist_id);


--
-- Name: wishlists_wishlist_date_created_c05d5e7f; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX wishlists_wishlist_date_created_c05d5e7f ON public.wishlists_wishlist USING btree (date_created);


--
-- Name: wishlists_wishlist_key_88d419b8_like; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX wishlists_wishlist_key_88d419b8_like ON public.wishlists_wishlist USING btree (key varchar_pattern_ops);


--
-- Name: wishlists_wishlist_owner_id_d5464c62; Type: INDEX; Schema: public; Owner: oscar
--

CREATE INDEX wishlists_wishlist_owner_id_d5464c62 ON public.wishlists_wishlist USING btree (owner_id);


--
-- Name: address_useraddress address_useraddress_country_id_fa26a249_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_useraddress
    ADD CONSTRAINT address_useraddress_country_id_fa26a249_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: address_useraddress address_useraddress_user_id_6edf0244_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.address_useraddress
    ADD CONSTRAINT address_useraddress_user_id_6edf0244_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_productrecord analytics_productrecord_product_id_dad3a871_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_productrecord
    ADD CONSTRAINT analytics_productrecord_product_id_dad3a871_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userproductview analytics_userproductview_product_id_a55b87ad_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userproductview
    ADD CONSTRAINT analytics_userproductview_product_id_a55b87ad_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userproductview analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userproductview
    ADD CONSTRAINT analytics_userproductview_user_id_5e49a8b1_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_userrecord analytics_userrecord_user_id_702cff4c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_userrecord
    ADD CONSTRAINT analytics_userrecord_user_id_702cff4c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: analytics_usersearch analytics_usersearch_user_id_1775992d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.analytics_usersearch
    ADD CONSTRAINT analytics_usersearch_user_id_1775992d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_basket basket_basket_owner_id_3a018de5_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_basket
    ADD CONSTRAINT basket_basket_owner_id_3a018de5_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line basket_line_basket_id_b615c905_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_basket_id_b615c905_fk FOREIGN KEY (basket_id) REFERENCES public.basket_basket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line basket_line_product_id_303d743e_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_product_id_303d743e_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_line basket_line_stockrecord_id_7039d8a4_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_line
    ADD CONSTRAINT basket_line_stockrecord_id_7039d8a4_fk FOREIGN KEY (stockrecord_id) REFERENCES public.partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_lineattribute basket_lineattribute_line_id_c41e0cdf_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_line_id_c41e0cdf_fk FOREIGN KEY (line_id) REFERENCES public.basket_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: basket_lineattribute basket_lineattribute_option_id_9387a3f7_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.basket_lineattribute
    ADD CONSTRAINT basket_lineattribute_option_id_9387a3f7_fk FOREIGN KEY (option_id) REFERENCES public.catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_attributeoption catalogue_attributeoption_group_id_3d4a5e24_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_attributeoption
    ADD CONSTRAINT catalogue_attributeoption_group_id_3d4a5e24_fk FOREIGN KEY (group_id) REFERENCES public.catalogue_attributeoptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product catalogue_product_parent_id_9bfd2382_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_parent_id_9bfd2382_fk FOREIGN KEY (parent_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_product catalogue_product_product_class_id_0c6c5b54_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_product
    ADD CONSTRAINT catalogue_product_product_class_id_0c6c5b54_fk FOREIGN KEY (product_class_id) REFERENCES public.catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattributevalue catalogue_productatt_entity_content_type__f7186ab5_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productatt_entity_content_type__f7186ab5_fk_django_co FOREIGN KEY (entity_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattribute catalogue_productattribute_option_group_id_6b422dc2_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattribute
    ADD CONSTRAINT catalogue_productattribute_option_group_id_6b422dc2_fk FOREIGN KEY (option_group_id) REFERENCES public.catalogue_attributeoptiongroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattribute catalogue_productattribute_product_class_id_7af808ec_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattribute
    ADD CONSTRAINT catalogue_productattribute_product_class_id_7af808ec_fk FOREIGN KEY (product_class_id) REFERENCES public.catalogue_productclass(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattributevalue catalogue_productattributevalue_attribute_id_0287c1e7_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_attribute_id_0287c1e7_fk FOREIGN KEY (attribute_id) REFERENCES public.catalogue_productattribute(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattributevalue catalogue_productattributevalue_product_id_a03cd90e_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_product_id_a03cd90e_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productattributevalue catalogue_productattributevalue_value_option_id_21026066_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productattributevalue
    ADD CONSTRAINT catalogue_productattributevalue_value_option_id_21026066_fk FOREIGN KEY (value_option_id) REFERENCES public.catalogue_attributeoption(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productcategory catalogue_productcategory_category_id_176db535_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_category_id_176db535_fk FOREIGN KEY (category_id) REFERENCES public.catalogue_category(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productcategory catalogue_productcategory_product_id_846a4061_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productcategory
    ADD CONSTRAINT catalogue_productcategory_product_id_846a4061_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productimage catalogue_productimage_product_id_49474fe8_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productimage
    ADD CONSTRAINT catalogue_productimage_product_id_49474fe8_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productrecommendation catalogue_productrecommendation_primary_id_6e51a55c_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecommendation_primary_id_6e51a55c_fk FOREIGN KEY (primary_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catalogue_productrecommendation catalogue_productrecommendation_recommendation_id_daf8ae95_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.catalogue_productrecommendation
    ADD CONSTRAINT catalogue_productrecommendation_recommendation_id_daf8ae95_fk FOREIGN KEY (recommendation_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_email customer_email_user_id_a69ad588_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_email
    ADD CONSTRAINT customer_email_user_id_a69ad588_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_notification customer_notification_recipient_id_d99de5c8_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_notification
    ADD CONSTRAINT customer_notification_recipient_id_d99de5c8_fk_auth_user_id FOREIGN KEY (recipient_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: communication_notification customer_notification_sender_id_affa1632_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.communication_notification
    ADD CONSTRAINT customer_notification_sender_id_affa1632_fk_auth_user_id FOREIGN KEY (sender_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_productalert customer_productalert_product_id_7e529a41_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.customer_productalert
    ADD CONSTRAINT customer_productalert_product_id_7e529a41_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: customer_productalert customer_productalert_user_id_677ad6d6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.customer_productalert
    ADD CONSTRAINT customer_productalert_user_id_677ad6d6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_site_flatpage_id_078bbc8b_fk_django_fl FOREIGN KEY (flatpage_id) REFERENCES public.django_flatpage(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_flatpage_sites django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.django_flatpage_sites
    ADD CONSTRAINT django_flatpage_sites_site_id_bfd8ea84_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnail easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnail
    ADD CONSTRAINT easy_thumbnails_thum_source_id_5b57bc77_fk_easy_thum FOREIGN KEY (source_id) REFERENCES public.easy_thumbnails_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: easy_thumbnails_thumbnaildimensions easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.easy_thumbnails_thumbnaildimensions
    ADD CONSTRAINT easy_thumbnails_thum_thumbnail_id_c3a0c549_fk_easy_thum FOREIGN KEY (thumbnail_id) REFERENCES public.easy_thumbnails_thumbnail(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_benefit offer_benefit_range_id_ab19c5ab_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_benefit
    ADD CONSTRAINT offer_benefit_range_id_ab19c5ab_fk FOREIGN KEY (range_id) REFERENCES public.offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_condition offer_condition_range_id_b023a2aa_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_condition
    ADD CONSTRAINT offer_condition_range_id_b023a2aa_fk FOREIGN KEY (range_id) REFERENCES public.offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionaloffer offer_conditionaloffer_benefit_id_f43f68b5_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_benefit_id_f43f68b5_fk FOREIGN KEY (benefit_id) REFERENCES public.offer_benefit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_conditionaloffer offer_conditionaloffer_condition_id_e6baa945_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_conditionaloffer
    ADD CONSTRAINT offer_conditionaloffer_condition_id_e6baa945_fk FOREIGN KEY (condition_id) REFERENCES public.offer_condition(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproduct offer_rangeproduct_product_id_723b3ea3_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_product_id_723b3ea3_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproduct offer_rangeproduct_range_id_ee358495_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproduct
    ADD CONSTRAINT offer_rangeproduct_range_id_ee358495_fk FOREIGN KEY (range_id) REFERENCES public.offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproductfileupload offer_rangeproductfi_uploaded_by_id_c01a3250_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfi_uploaded_by_id_c01a3250_fk_auth_user FOREIGN KEY (uploaded_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: offer_rangeproductfileupload offer_rangeproductfileupload_range_id_c055ebf8_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.offer_rangeproductfileupload
    ADD CONSTRAINT offer_rangeproductfileupload_range_id_c055ebf8_fk FOREIGN KEY (range_id) REFERENCES public.offer_range(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_billingaddress order_billingaddress_country_id_17f57dca_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_billingaddress
    ADD CONSTRAINT order_billingaddress_country_id_17f57dca_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_communicationevent order_communicationevent_event_type_id_4bc9ee29_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_communicationevent
    ADD CONSTRAINT order_communicationevent_event_type_id_4bc9ee29_fk FOREIGN KEY (event_type_id) REFERENCES public.communication_communicationeventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_communicationevent order_communicationevent_order_id_94e784ac_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_communicationevent
    ADD CONSTRAINT order_communicationevent_order_id_94e784ac_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line order_line_order_id_b9148391_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_order_id_b9148391_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line order_line_partner_id_258a2fb9_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_partner_id_258a2fb9_fk FOREIGN KEY (partner_id) REFERENCES public.partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line order_line_product_id_e620902d_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_product_id_e620902d_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_line order_line_stockrecord_id_1d65aff5_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_line
    ADD CONSTRAINT order_line_stockrecord_id_1d65aff5_fk FOREIGN KEY (stockrecord_id) REFERENCES public.partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineattribute order_lineattribute_line_id_adf6dd87_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineattribute
    ADD CONSTRAINT order_lineattribute_line_id_adf6dd87_fk FOREIGN KEY (line_id) REFERENCES public.order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineattribute order_lineattribute_option_id_b54d597c_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineattribute
    ADD CONSTRAINT order_lineattribute_option_id_b54d597c_fk FOREIGN KEY (option_id) REFERENCES public.catalogue_option(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineprice order_lineprice_line_id_2de52446_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineprice
    ADD CONSTRAINT order_lineprice_line_id_2de52446_fk FOREIGN KEY (line_id) REFERENCES public.order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_lineprice order_lineprice_order_id_66792e56_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_lineprice
    ADD CONSTRAINT order_lineprice_order_id_66792e56_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_basket_id_8b0acbb2_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_basket_id_8b0acbb2_fk FOREIGN KEY (basket_id) REFERENCES public.basket_basket(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_billing_address_id_8fe537cf_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_billing_address_id_8fe537cf_fk FOREIGN KEY (billing_address_id) REFERENCES public.order_billingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_shipping_address_id_57e64931_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_shipping_address_id_57e64931_fk FOREIGN KEY (shipping_address_id) REFERENCES public.order_shippingaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_site_id_e27f3526_fk_django_site_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_site_id_e27f3526_fk_django_site_id FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_order order_order_user_id_7cf9bc2b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_order
    ADD CONSTRAINT order_order_user_id_7cf9bc2b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderdiscount order_orderdiscount_order_id_bc91e123_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderdiscount
    ADD CONSTRAINT order_orderdiscount_order_id_bc91e123_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote order_ordernote_order_id_7d97583d_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_order_id_7d97583d_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_ordernote order_ordernote_user_id_48d7a672_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_ordernote
    ADD CONSTRAINT order_ordernote_user_id_48d7a672_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_orderstatuschange order_orderstatuschange_order_id_43efdbe5_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_orderstatuschange
    ADD CONSTRAINT order_orderstatuschange_order_id_43efdbe5_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymentevent order_paymentevent_event_type_id_568c7161_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymentevent
    ADD CONSTRAINT order_paymentevent_event_type_id_568c7161_fk FOREIGN KEY (event_type_id) REFERENCES public.order_paymenteventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymentevent order_paymentevent_order_id_395b3e82_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymentevent
    ADD CONSTRAINT order_paymentevent_order_id_395b3e82_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymentevent order_paymentevent_shipping_event_id_213dcfb8_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymentevent
    ADD CONSTRAINT order_paymentevent_shipping_event_id_213dcfb8_fk FOREIGN KEY (shipping_event_id) REFERENCES public.order_shippingevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymenteventquantity order_paymenteventquantity_event_id_a540165a_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_event_id_a540165a_fk FOREIGN KEY (event_id) REFERENCES public.order_paymentevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_paymenteventquantity order_paymenteventquantity_line_id_df44b021_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_paymenteventquantity
    ADD CONSTRAINT order_paymenteventquantity_line_id_df44b021_fk FOREIGN KEY (line_id) REFERENCES public.order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingaddress order_shippingaddres_country_id_29abf9a0_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingaddress
    ADD CONSTRAINT order_shippingaddres_country_id_29abf9a0_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingevent order_shippingevent_event_type_id_9f1efb20_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingevent
    ADD CONSTRAINT order_shippingevent_event_type_id_9f1efb20_fk FOREIGN KEY (event_type_id) REFERENCES public.order_shippingeventtype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingevent order_shippingevent_order_id_8c031fb6_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingevent
    ADD CONSTRAINT order_shippingevent_order_id_8c031fb6_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingeventquantity order_shippingeventquantity_event_id_1c7fb9c7_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_event_id_1c7fb9c7_fk FOREIGN KEY (event_id) REFERENCES public.order_shippingevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_shippingeventquantity order_shippingeventquantity_line_id_3b089ee0_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_shippingeventquantity
    ADD CONSTRAINT order_shippingeventquantity_line_id_3b089ee0_fk FOREIGN KEY (line_id) REFERENCES public.order_line(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: order_surcharge order_surcharge_order_id_5c0a94f5_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.order_surcharge
    ADD CONSTRAINT order_surcharge_order_id_5c0a94f5_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partner_users partner_partner_users_user_id_d75d6e40_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partner_users
    ADD CONSTRAINT partner_partner_users_user_id_d75d6e40_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partneraddress partner_partneraddre_country_id_02c4f979_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partneraddress
    ADD CONSTRAINT partner_partneraddre_country_id_02c4f979_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_partneraddress partner_partneraddress_partner_id_59551b0a_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_partneraddress
    ADD CONSTRAINT partner_partneraddress_partner_id_59551b0a_fk FOREIGN KEY (partner_id) REFERENCES public.partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stockalert partner_stockalert_stockrecord_id_68ad503a_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockalert
    ADD CONSTRAINT partner_stockalert_stockrecord_id_68ad503a_fk FOREIGN KEY (stockrecord_id) REFERENCES public.partner_stockrecord(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stockrecord partner_stockrecord_partner_id_4155a586_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_partner_id_4155a586_fk FOREIGN KEY (partner_id) REFERENCES public.partner_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partner_stockrecord partner_stockrecord_product_id_62fd9e45_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.partner_stockrecord
    ADD CONSTRAINT partner_stockrecord_product_id_62fd9e45_fk FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_bankcard payment_bankcard_user_id_08e1d04c_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_bankcard
    ADD CONSTRAINT payment_bankcard_user_id_08e1d04c_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_source payment_source_order_id_6b7f2215_fk_order_order_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_source
    ADD CONSTRAINT payment_source_order_id_6b7f2215_fk_order_order_id FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_source payment_source_source_type_id_700828fe_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_source
    ADD CONSTRAINT payment_source_source_type_id_700828fe_fk FOREIGN KEY (source_type_id) REFERENCES public.payment_sourcetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: payment_transaction payment_transaction_source_id_c5ac31e8_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.payment_transaction
    ADD CONSTRAINT payment_transaction_source_id_c5ac31e8_fk FOREIGN KEY (source_id) REFERENCES public.payment_source(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_productreview reviews_productrevie_product_id_52e52a32_fk_catalogue; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_productreview
    ADD CONSTRAINT reviews_productrevie_product_id_52e52a32_fk_catalogue FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_productreview reviews_productreview_user_id_8acb5ddd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_productreview
    ADD CONSTRAINT reviews_productreview_user_id_8acb5ddd_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_vote reviews_vote_review_id_371b2d8d_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_vote
    ADD CONSTRAINT reviews_vote_review_id_371b2d8d_fk FOREIGN KEY (review_id) REFERENCES public.reviews_productreview(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reviews_vote reviews_vote_user_id_5fb87b53_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.reviews_vote
    ADD CONSTRAINT reviews_vote_user_id_5fb87b53_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_orderanditemcharges_countries shipping_orderandite_country_id_30387f2e_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_orderanditemcharges_countries
    ADD CONSTRAINT shipping_orderandite_country_id_30387f2e_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_weightband shipping_weightband_method_id_b699a1ba_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightband
    ADD CONSTRAINT shipping_weightband_method_id_b699a1ba_fk FOREIGN KEY (method_id) REFERENCES public.shipping_weightbased(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: shipping_weightbased_countries shipping_weightbased_country_id_06117384_fk_address_c; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.shipping_weightbased_countries
    ADD CONSTRAINT shipping_weightbased_country_id_06117384_fk_address_c FOREIGN KEY (country_id) REFERENCES public.address_country(iso_3166_1_a2) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucher voucher_voucher_voucher_set_id_17b96a54_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucher
    ADD CONSTRAINT voucher_voucher_voucher_set_id_17b96a54_fk FOREIGN KEY (voucher_set_id) REFERENCES public.voucher_voucherset(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplication voucher_voucherapplication_order_id_30248a05_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_order_id_30248a05_fk FOREIGN KEY (order_id) REFERENCES public.order_order(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplication voucher_voucherapplication_user_id_df53a393_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_user_id_df53a393_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voucher_voucherapplication voucher_voucherapplication_voucher_id_5204edb7_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.voucher_voucherapplication
    ADD CONSTRAINT voucher_voucherapplication_voucher_id_5204edb7_fk FOREIGN KEY (voucher_id) REFERENCES public.voucher_voucher(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_line wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_line
    ADD CONSTRAINT wishlists_line_product_id_9d6d9b37_fk_catalogue_product_id FOREIGN KEY (product_id) REFERENCES public.catalogue_product(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_line wishlists_line_wishlist_id_4cffe302_fk; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_line
    ADD CONSTRAINT wishlists_line_wishlist_id_4cffe302_fk FOREIGN KEY (wishlist_id) REFERENCES public.wishlists_wishlist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: wishlists_wishlist wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: oscar
--

ALTER TABLE ONLY public.wishlists_wishlist
    ADD CONSTRAINT wishlists_wishlist_owner_id_d5464c62_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

