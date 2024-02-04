PGDMP         "             
    y            aaqf1    13.3    13.3    7           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            8           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            9           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            :           1262    17803    aaqf1    DATABASE     i   CREATE DATABASE aaqf1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE aaqf1;
                postgres    false            �            1259    17835 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            �            1259    17833    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    207            ;           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    206            �            1259    17845    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            �            1259    17843    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    209            <           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    208            �            1259    17827    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            �            1259    17825    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    205            =           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    204            �            1259    18119     certification_upload_doc_mapping    TABLE     �   CREATE TABLE public.certification_upload_doc_mapping (
    id integer NOT NULL,
    cerdoc_document_id integer,
    cerdoc_user_id integer
);
 4   DROP TABLE public.certification_upload_doc_mapping;
       public         heap    postgres    false            �            1259    18117 '   certification_upload_doc_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.certification_upload_doc_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.certification_upload_doc_mapping_id_seq;
       public          postgres    false    237            >           0    0 '   certification_upload_doc_mapping_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.certification_upload_doc_mapping_id_seq OWNED BY public.certification_upload_doc_mapping.id;
          public          postgres    false    236            �            1259    18111    certification_upload_documents    TABLE     ,  CREATE TABLE public.certification_upload_documents (
    id integer NOT NULL,
    doc_name character varying(100),
    file character varying(100),
    status character varying(10),
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone,
    user_id integer
);
 2   DROP TABLE public.certification_upload_documents;
       public         heap    postgres    false            �            1259    18109 %   certification_upload_documents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.certification_upload_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.certification_upload_documents_id_seq;
       public          postgres    false    235            ?           0    0 %   certification_upload_documents_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.certification_upload_documents_id_seq OWNED BY public.certification_upload_documents.id;
          public          postgres    false    234            �            1259    17879 	   countries    TABLE     �   CREATE TABLE public.countries (
    id bigint NOT NULL,
    sortname character varying(25),
    name character varying(100),
    phonecode integer
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    17877    countries_id_seq    SEQUENCE     y   CREATE SEQUENCE public.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    211            @           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    210            �            1259    18064    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            �            1259    18062    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    231            A           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    230            �            1259    17817    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            �            1259    17815    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    203            B           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    202            �            1259    17806    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            �            1259    17804    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    201            C           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    200            �            1259    18246    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            �            1259    17887    om_membership_plan    TABLE       CREATE TABLE public.om_membership_plan (
    omp_id bigint NOT NULL,
    omp_code character varying(25),
    omp_name character varying(100),
    omp_desc character varying(250),
    omp_price character varying(10),
    omp_duration smallint,
    omp_plan_type character varying(100) NOT NULL,
    omp_order_by smallint,
    omp_is_display boolean NOT NULL,
    CONSTRAINT om_membership_plan_omp_duration_check CHECK ((omp_duration >= 0)),
    CONSTRAINT om_membership_plan_omp_order_by_check CHECK ((omp_order_by >= 0))
);
 &   DROP TABLE public.om_membership_plan;
       public         heap    postgres    false            �            1259    17885    om_membership_plan_omp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.om_membership_plan_omp_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.om_membership_plan_omp_id_seq;
       public          postgres    false    213            D           0    0    om_membership_plan_omp_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.om_membership_plan_omp_id_seq OWNED BY public.om_membership_plan.omp_id;
          public          postgres    false    212            �            1259    17897 	   om_prefix    TABLE     �   CREATE TABLE public.om_prefix (
    op_id bigint NOT NULL,
    op_code character varying(25),
    op_name character varying(100)
);
    DROP TABLE public.om_prefix;
       public         heap    postgres    false            �            1259    17895    om_prefix_op_id_seq    SEQUENCE     |   CREATE SEQUENCE public.om_prefix_op_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.om_prefix_op_id_seq;
       public          postgres    false    215            E           0    0    om_prefix_op_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.om_prefix_op_id_seq OWNED BY public.om_prefix.op_id;
          public          postgres    false    214            �            1259    17905 	   om_suffix    TABLE     �   CREATE TABLE public.om_suffix (
    os_id bigint NOT NULL,
    os_code character varying(25),
    os_name character varying(100)
);
    DROP TABLE public.om_suffix;
       public         heap    postgres    false            �            1259    17903    om_suffix_os_id_seq    SEQUENCE     |   CREATE SEQUENCE public.om_suffix_os_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.om_suffix_os_id_seq;
       public          postgres    false    217            F           0    0    om_suffix_os_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.om_suffix_os_id_seq OWNED BY public.om_suffix.os_id;
          public          postgres    false    216            �            1259    18015 
   paper_list    TABLE     d  CREATE TABLE public.paper_list (
    paper_id integer NOT NULL,
    paper_title text,
    paper_desc text,
    paper_file character varying(100),
    paper_cr_dt timestamp with time zone,
    paper_upd_dt timestamp with time zone,
    paper_marks integer NOT NULL,
    paper_rank integer NOT NULL,
    paper_submit_tf boolean,
    paper_user_id integer
);
    DROP TABLE public.paper_list;
       public         heap    postgres    false            �            1259    18013    paper_list_paper_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paper_list_paper_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.paper_list_paper_id_seq;
       public          postgres    false    227            G           0    0    paper_list_paper_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.paper_list_paper_id_seq OWNED BY public.paper_list.paper_id;
          public          postgres    false    226            �            1259    18088    payment    TABLE     �  CREATE TABLE public.payment (
    id integer NOT NULL,
    trans_id character varying(200),
    order_id character varying(200),
    user_email character varying(200),
    customer_ref character varying(200),
    currency character varying(200),
    payment_status character varying(200),
    payment_mode character varying(100),
    payment_for character varying(100),
    amount numeric(20,3),
    created_dt timestamp with time zone NOT NULL,
    plan_id bigint,
    user_id integer
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    18086    payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.payment_id_seq;
       public          postgres    false    233            H           0    0    payment_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.payment_id_seq OWNED BY public.payment.id;
          public          postgres    false    232            �            1259    17913    states    TABLE     o   CREATE TABLE public.states (
    id bigint NOT NULL,
    name character varying(100),
    country_id bigint
);
    DROP TABLE public.states;
       public         heap    postgres    false            �            1259    17911    states_id_seq    SEQUENCE     v   CREATE SEQUENCE public.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.states_id_seq;
       public          postgres    false    219            I           0    0    states_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.states_id_seq OWNED BY public.states.id;
          public          postgres    false    218            �            1259    18127    upload_documents    TABLE       CREATE TABLE public.upload_documents (
    id integer NOT NULL,
    doc_name character varying(100),
    file character varying(100),
    status character varying(10),
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone,
    user_id integer
);
 $   DROP TABLE public.upload_documents;
       public         heap    postgres    false            �            1259    18125    upload_documents_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_documents_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.upload_documents_id_seq;
       public          postgres    false    239            J           0    0    upload_documents_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.upload_documents_id_seq OWNED BY public.upload_documents.id;
          public          postgres    false    238            �            1259    18135 #   upload_documents_membership_mapping    TABLE     �   CREATE TABLE public.upload_documents_membership_mapping (
    id integer NOT NULL,
    udmm_document_id integer,
    udmm_membership_id bigint
);
 7   DROP TABLE public.upload_documents_membership_mapping;
       public         heap    postgres    false            �            1259    18133 *   upload_documents_membership_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_documents_membership_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.upload_documents_membership_mapping_id_seq;
       public          postgres    false    241            K           0    0 *   upload_documents_membership_mapping_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.upload_documents_membership_mapping_id_seq OWNED BY public.upload_documents_membership_mapping.id;
          public          postgres    false    240            �            1259    18143    upload_image    TABLE       CREATE TABLE public.upload_image (
    id integer NOT NULL,
    image_name character varying(100),
    file character varying(100),
    status character varying(10),
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone,
    user_id integer
);
     DROP TABLE public.upload_image;
       public         heap    postgres    false            �            1259    18141    upload_image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.upload_image_id_seq;
       public          postgres    false    243            L           0    0    upload_image_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.upload_image_id_seq OWNED BY public.upload_image.id;
          public          postgres    false    242            �            1259    18151    upload_image_membership_mapping    TABLE     �   CREATE TABLE public.upload_image_membership_mapping (
    id integer NOT NULL,
    uimm_image_id integer,
    uimm_membership_id bigint
);
 3   DROP TABLE public.upload_image_membership_mapping;
       public         heap    postgres    false            �            1259    18149 &   upload_image_membership_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_image_membership_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.upload_image_membership_mapping_id_seq;
       public          postgres    false    245            M           0    0 &   upload_image_membership_mapping_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.upload_image_membership_mapping_id_seq OWNED BY public.upload_image_membership_mapping.id;
          public          postgres    false    244            �            1259    18167    upload_video_membership_mapping    TABLE     �   CREATE TABLE public.upload_video_membership_mapping (
    id integer NOT NULL,
    uvmm_membership_id bigint,
    uvmm_video_id integer
);
 3   DROP TABLE public.upload_video_membership_mapping;
       public         heap    postgres    false            �            1259    18165 &   upload_video_membership_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_video_membership_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public.upload_video_membership_mapping_id_seq;
       public          postgres    false    249            N           0    0 &   upload_video_membership_mapping_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE public.upload_video_membership_mapping_id_seq OWNED BY public.upload_video_membership_mapping.id;
          public          postgres    false    248            �            1259    18159    upload_videos    TABLE       CREATE TABLE public.upload_videos (
    id integer NOT NULL,
    video_name character varying(100),
    file character varying(100),
    status character varying(10),
    created_date timestamp with time zone NOT NULL,
    updated_date timestamp with time zone,
    user_id integer
);
 !   DROP TABLE public.upload_videos;
       public         heap    postgres    false            �            1259    18157    upload_videos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.upload_videos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.upload_videos_id_seq;
       public          postgres    false    247            O           0    0    upload_videos_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.upload_videos_id_seq OWNED BY public.upload_videos.id;
          public          postgres    false    246            �            1259    18259 	   user_info    TABLE     �  CREATE TABLE public.user_info (
    id integer NOT NULL,
    facility_ceo_name character varying(100),
    facility_ceo_phone bigint,
    facility_ceo_email character varying(100),
    medical_director_name character varying(100),
    medical_director_phone bigint,
    medical_director_email character varying(100),
    cnt_aaqf_name character varying(100),
    cnt_aaqf_phone bigint,
    cnt_aaqf_email character varying(100),
    acnt_name character varying(100),
    acnt_phone bigint,
    acnt_email character varying(100),
    web_facility_type character varying(100),
    providers character varying(100),
    tax_identification_no character varying(100),
    accreditation_id bigint,
    survey_dt timestamp with time zone NOT NULL,
    created_dt timestamp with time zone NOT NULL,
    admin_user boolean NOT NULL,
    user_id integer,
    others character varying(100),
    save_as character varying(100)
);
    DROP TABLE public.user_info;
       public         heap    postgres    false            �            1259    18257    user_info_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.user_info_id_seq;
       public          postgres    false    252            P           0    0    user_info_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.user_info_id_seq OWNED BY public.user_info.id;
          public          postgres    false    251            �            1259    18270    user_info_mapping    TABLE     �   CREATE TABLE public.user_info_mapping (
    id integer NOT NULL,
    trf_owner_name character varying(200),
    trf_personal_address character varying(200),
    trf_phone bigint,
    trf_email character varying(100),
    user_info_id integer
);
 %   DROP TABLE public.user_info_mapping;
       public         heap    postgres    false            �            1259    18268    user_info_mapping_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_info_mapping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_info_mapping_id_seq;
       public          postgres    false    254            Q           0    0    user_info_mapping_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.user_info_mapping_id_seq OWNED BY public.user_info_mapping.id;
          public          postgres    false    253            �            1259    17921    user_master    TABLE     E  CREATE TABLE public.user_master (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    first_name character varying(100),
    middle_name character varying(100),
    last_name character varying(100),
    organization character varying(500),
    title character varying(100),
    address1 character varying(500),
    address2 character varying(500),
    city character varying(100),
    zip_code character varying(10),
    int_province character varying(500),
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    is_subscribe integer,
    user_type integer,
    created_dt timestamp with time zone NOT NULL,
    admin_user boolean NOT NULL,
    membership_id bigint,
    user_oc_id bigint,
    user_op_id bigint,
    user_os_id bigint,
    user_ost_id bigint
);
    DROP TABLE public.user_master;
       public         heap    postgres    false            �            1259    17934    user_master_groups    TABLE     �   CREATE TABLE public.user_master_groups (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    group_id integer NOT NULL
);
 &   DROP TABLE public.user_master_groups;
       public         heap    postgres    false            �            1259    17932    user_master_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_master_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.user_master_groups_id_seq;
       public          postgres    false    223            R           0    0    user_master_groups_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.user_master_groups_id_seq OWNED BY public.user_master_groups.id;
          public          postgres    false    222            �            1259    17919    user_master_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_master_id_seq;
       public          postgres    false    221            S           0    0    user_master_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_master_id_seq OWNED BY public.user_master.id;
          public          postgres    false    220            �            1259    17942    user_master_user_permissions    TABLE     �   CREATE TABLE public.user_master_user_permissions (
    id integer NOT NULL,
    customuser_id integer NOT NULL,
    permission_id integer NOT NULL
);
 0   DROP TABLE public.user_master_user_permissions;
       public         heap    postgres    false            �            1259    17940 #   user_master_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_master_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.user_master_user_permissions_id_seq;
       public          postgres    false    225            T           0    0 #   user_master_user_permissions_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.user_master_user_permissions_id_seq OWNED BY public.user_master_user_permissions.id;
          public          postgres    false    224            �            1259    18026    verified_paper    TABLE     	  CREATE TABLE public.verified_paper (
    vp_id integer NOT NULL,
    vp_cr_dt timestamp with time zone NOT NULL,
    vp_upd_dt timestamp with time zone,
    vp_paper1_id integer,
    vp_paper2_id integer,
    vp_selected_paper_id integer,
    vp_user_id integer
);
 "   DROP TABLE public.verified_paper;
       public         heap    postgres    false            �            1259    18024    verified_paper_vp_id_seq    SEQUENCE     �   CREATE SEQUENCE public.verified_paper_vp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.verified_paper_vp_id_seq;
       public          postgres    false    229            U           0    0    verified_paper_vp_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.verified_paper_vp_id_seq OWNED BY public.verified_paper.vp_id;
          public          postgres    false    228            �           2604    17838    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            �           2604    17848    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208    209            �           2604    17830    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    205    205            �           2604    18122 #   certification_upload_doc_mapping id    DEFAULT     �   ALTER TABLE ONLY public.certification_upload_doc_mapping ALTER COLUMN id SET DEFAULT nextval('public.certification_upload_doc_mapping_id_seq'::regclass);
 R   ALTER TABLE public.certification_upload_doc_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    18114 !   certification_upload_documents id    DEFAULT     �   ALTER TABLE ONLY public.certification_upload_documents ALTER COLUMN id SET DEFAULT nextval('public.certification_upload_documents_id_seq'::regclass);
 P   ALTER TABLE public.certification_upload_documents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    234    235            �           2604    17882    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210    211            �           2604    18067    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    17820    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �           2604    17809    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    201    200    201            �           2604    17890    om_membership_plan omp_id    DEFAULT     �   ALTER TABLE ONLY public.om_membership_plan ALTER COLUMN omp_id SET DEFAULT nextval('public.om_membership_plan_omp_id_seq'::regclass);
 H   ALTER TABLE public.om_membership_plan ALTER COLUMN omp_id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    17900    om_prefix op_id    DEFAULT     r   ALTER TABLE ONLY public.om_prefix ALTER COLUMN op_id SET DEFAULT nextval('public.om_prefix_op_id_seq'::regclass);
 >   ALTER TABLE public.om_prefix ALTER COLUMN op_id DROP DEFAULT;
       public          postgres    false    215    214    215            �           2604    17908    om_suffix os_id    DEFAULT     r   ALTER TABLE ONLY public.om_suffix ALTER COLUMN os_id SET DEFAULT nextval('public.om_suffix_os_id_seq'::regclass);
 >   ALTER TABLE public.om_suffix ALTER COLUMN os_id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    18018    paper_list paper_id    DEFAULT     z   ALTER TABLE ONLY public.paper_list ALTER COLUMN paper_id SET DEFAULT nextval('public.paper_list_paper_id_seq'::regclass);
 B   ALTER TABLE public.paper_list ALTER COLUMN paper_id DROP DEFAULT;
       public          postgres    false    226    227    227            �           2604    18091 
   payment id    DEFAULT     h   ALTER TABLE ONLY public.payment ALTER COLUMN id SET DEFAULT nextval('public.payment_id_seq'::regclass);
 9   ALTER TABLE public.payment ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            �           2604    17916 	   states id    DEFAULT     f   ALTER TABLE ONLY public.states ALTER COLUMN id SET DEFAULT nextval('public.states_id_seq'::regclass);
 8   ALTER TABLE public.states ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    18130    upload_documents id    DEFAULT     z   ALTER TABLE ONLY public.upload_documents ALTER COLUMN id SET DEFAULT nextval('public.upload_documents_id_seq'::regclass);
 B   ALTER TABLE public.upload_documents ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    239    239            �           2604    18138 &   upload_documents_membership_mapping id    DEFAULT     �   ALTER TABLE ONLY public.upload_documents_membership_mapping ALTER COLUMN id SET DEFAULT nextval('public.upload_documents_membership_mapping_id_seq'::regclass);
 U   ALTER TABLE public.upload_documents_membership_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    241    241            �           2604    18146    upload_image id    DEFAULT     r   ALTER TABLE ONLY public.upload_image ALTER COLUMN id SET DEFAULT nextval('public.upload_image_id_seq'::regclass);
 >   ALTER TABLE public.upload_image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    242    243    243            �           2604    18154 "   upload_image_membership_mapping id    DEFAULT     �   ALTER TABLE ONLY public.upload_image_membership_mapping ALTER COLUMN id SET DEFAULT nextval('public.upload_image_membership_mapping_id_seq'::regclass);
 Q   ALTER TABLE public.upload_image_membership_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    244    245            �           2604    18170 "   upload_video_membership_mapping id    DEFAULT     �   ALTER TABLE ONLY public.upload_video_membership_mapping ALTER COLUMN id SET DEFAULT nextval('public.upload_video_membership_mapping_id_seq'::regclass);
 Q   ALTER TABLE public.upload_video_membership_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    249    248    249            �           2604    18162    upload_videos id    DEFAULT     t   ALTER TABLE ONLY public.upload_videos ALTER COLUMN id SET DEFAULT nextval('public.upload_videos_id_seq'::regclass);
 ?   ALTER TABLE public.upload_videos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    247    247            �           2604    18262    user_info id    DEFAULT     l   ALTER TABLE ONLY public.user_info ALTER COLUMN id SET DEFAULT nextval('public.user_info_id_seq'::regclass);
 ;   ALTER TABLE public.user_info ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    18273    user_info_mapping id    DEFAULT     |   ALTER TABLE ONLY public.user_info_mapping ALTER COLUMN id SET DEFAULT nextval('public.user_info_mapping_id_seq'::regclass);
 C   ALTER TABLE public.user_info_mapping ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    17924    user_master id    DEFAULT     p   ALTER TABLE ONLY public.user_master ALTER COLUMN id SET DEFAULT nextval('public.user_master_id_seq'::regclass);
 =   ALTER TABLE public.user_master ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    17937    user_master_groups id    DEFAULT     ~   ALTER TABLE ONLY public.user_master_groups ALTER COLUMN id SET DEFAULT nextval('public.user_master_groups_id_seq'::regclass);
 D   ALTER TABLE public.user_master_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            �           2604    17945    user_master_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.user_master_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.user_master_user_permissions_id_seq'::regclass);
 N   ALTER TABLE public.user_master_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    18029    verified_paper vp_id    DEFAULT     |   ALTER TABLE ONLY public.verified_paper ALTER COLUMN vp_id SET DEFAULT nextval('public.verified_paper_vp_id_seq'::regclass);
 C   ALTER TABLE public.verified_paper ALTER COLUMN vp_id DROP DEFAULT;
       public          postgres    false    229    228    229                      0    17835 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    207   �                0    17845    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    209   	�                0    17827    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    205   &�      #          0    18119     certification_upload_doc_mapping 
   TABLE DATA           b   COPY public.certification_upload_doc_mapping (id, cerdoc_document_id, cerdoc_user_id) FROM stdin;
    public          postgres    false    237   �      !          0    18111    certification_upload_documents 
   TABLE DATA           y   COPY public.certification_upload_documents (id, doc_name, file, status, created_date, updated_date, user_id) FROM stdin;
    public          postgres    false    235   1�      	          0    17879 	   countries 
   TABLE DATA           B   COPY public.countries (id, sortname, name, phonecode) FROM stdin;
    public          postgres    false    211   N�                0    18064    django_admin_log 
   TABLE DATA           �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    231   ƚ                0    17817    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    203   �      �          0    17806    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    201   ��      0          0    18246    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    250   ]�                0    17887    om_membership_plan 
   TABLE DATA           �   COPY public.om_membership_plan (omp_id, omp_code, omp_name, omp_desc, omp_price, omp_duration, omp_plan_type, omp_order_by, omp_is_display) FROM stdin;
    public          postgres    false    213   �                0    17897 	   om_prefix 
   TABLE DATA           <   COPY public.om_prefix (op_id, op_code, op_name) FROM stdin;
    public          postgres    false    215   آ                0    17905 	   om_suffix 
   TABLE DATA           <   COPY public.om_suffix (os_id, os_code, os_name) FROM stdin;
    public          postgres    false    217   
�                0    18015 
   paper_list 
   TABLE DATA           �   COPY public.paper_list (paper_id, paper_title, paper_desc, paper_file, paper_cr_dt, paper_upd_dt, paper_marks, paper_rank, paper_submit_tf, paper_user_id) FROM stdin;
    public          postgres    false    227   '�                0    18088    payment 
   TABLE DATA           �   COPY public.payment (id, trans_id, order_id, user_email, customer_ref, currency, payment_status, payment_mode, payment_for, amount, created_dt, plan_id, user_id) FROM stdin;
    public          postgres    false    233   D�                0    17913    states 
   TABLE DATA           6   COPY public.states (id, name, country_id) FROM stdin;
    public          postgres    false    219   1�      %          0    18127    upload_documents 
   TABLE DATA           k   COPY public.upload_documents (id, doc_name, file, status, created_date, updated_date, user_id) FROM stdin;
    public          postgres    false    239   "      '          0    18135 #   upload_documents_membership_mapping 
   TABLE DATA           g   COPY public.upload_documents_membership_mapping (id, udmm_document_id, udmm_membership_id) FROM stdin;
    public          postgres    false    241   "      )          0    18143    upload_image 
   TABLE DATA           i   COPY public.upload_image (id, image_name, file, status, created_date, updated_date, user_id) FROM stdin;
    public          postgres    false    243   <"      +          0    18151    upload_image_membership_mapping 
   TABLE DATA           `   COPY public.upload_image_membership_mapping (id, uimm_image_id, uimm_membership_id) FROM stdin;
    public          postgres    false    245   Y"      /          0    18167    upload_video_membership_mapping 
   TABLE DATA           `   COPY public.upload_video_membership_mapping (id, uvmm_membership_id, uvmm_video_id) FROM stdin;
    public          postgres    false    249   v"      -          0    18159    upload_videos 
   TABLE DATA           j   COPY public.upload_videos (id, video_name, file, status, created_date, updated_date, user_id) FROM stdin;
    public          postgres    false    247   �"      2          0    18259 	   user_info 
   TABLE DATA             COPY public.user_info (id, facility_ceo_name, facility_ceo_phone, facility_ceo_email, medical_director_name, medical_director_phone, medical_director_email, cnt_aaqf_name, cnt_aaqf_phone, cnt_aaqf_email, acnt_name, acnt_phone, acnt_email, web_facility_type, providers, tax_identification_no, accreditation_id, survey_dt, created_dt, admin_user, user_id, others, save_as) FROM stdin;
    public          postgres    false    252   �"      4          0    18270    user_info_mapping 
   TABLE DATA           y   COPY public.user_info_mapping (id, trf_owner_name, trf_personal_address, trf_phone, trf_email, user_info_id) FROM stdin;
    public          postgres    false    254   �#                0    17921    user_master 
   TABLE DATA           r  COPY public.user_master (id, password, last_login, is_superuser, username, email, is_staff, is_active, date_joined, first_name, middle_name, last_name, organization, title, address1, address2, city, zip_code, int_province, start_date, end_date, is_subscribe, user_type, created_dt, admin_user, membership_id, user_oc_id, user_op_id, user_os_id, user_ost_id) FROM stdin;
    public          postgres    false    221   T$                0    17934    user_master_groups 
   TABLE DATA           I   COPY public.user_master_groups (id, customuser_id, group_id) FROM stdin;
    public          postgres    false    223   �%                0    17942    user_master_user_permissions 
   TABLE DATA           X   COPY public.user_master_user_permissions (id, customuser_id, permission_id) FROM stdin;
    public          postgres    false    225   �%                0    18026    verified_paper 
   TABLE DATA           �   COPY public.verified_paper (vp_id, vp_cr_dt, vp_upd_dt, vp_paper1_id, vp_paper2_id, vp_selected_paper_id, vp_user_id) FROM stdin;
    public          postgres    false    229   &      V           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          postgres    false    206            W           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          postgres    false    208            X           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 96, true);
          public          postgres    false    204            Y           0    0 '   certification_upload_doc_mapping_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.certification_upload_doc_mapping_id_seq', 1, false);
          public          postgres    false    236            Z           0    0 %   certification_upload_documents_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.certification_upload_documents_id_seq', 1, false);
          public          postgres    false    234            [           0    0    countries_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.countries_id_seq', 1, false);
          public          postgres    false    210            \           0    0    django_admin_log_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 9, true);
          public          postgres    false    230            ]           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 24, true);
          public          postgres    false    202            ^           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);
          public          postgres    false    200            _           0    0    om_membership_plan_omp_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.om_membership_plan_omp_id_seq', 7, true);
          public          postgres    false    212            `           0    0    om_prefix_op_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.om_prefix_op_id_seq', 2, true);
          public          postgres    false    214            a           0    0    om_suffix_os_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.om_suffix_os_id_seq', 1, false);
          public          postgres    false    216            b           0    0    paper_list_paper_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.paper_list_paper_id_seq', 1, false);
          public          postgres    false    226            c           0    0    payment_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.payment_id_seq', 2, true);
          public          postgres    false    232            d           0    0    states_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.states_id_seq', 1, false);
          public          postgres    false    218            e           0    0    upload_documents_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.upload_documents_id_seq', 1, false);
          public          postgres    false    238            f           0    0 *   upload_documents_membership_mapping_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.upload_documents_membership_mapping_id_seq', 1, false);
          public          postgres    false    240            g           0    0    upload_image_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.upload_image_id_seq', 1, false);
          public          postgres    false    242            h           0    0 &   upload_image_membership_mapping_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.upload_image_membership_mapping_id_seq', 1, false);
          public          postgres    false    244            i           0    0 &   upload_video_membership_mapping_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.upload_video_membership_mapping_id_seq', 1, false);
          public          postgres    false    248            j           0    0    upload_videos_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.upload_videos_id_seq', 1, false);
          public          postgres    false    246            k           0    0    user_info_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.user_info_id_seq', 2, true);
          public          postgres    false    251            l           0    0    user_info_mapping_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.user_info_mapping_id_seq', 3, true);
          public          postgres    false    253            m           0    0    user_master_groups_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.user_master_groups_id_seq', 1, false);
          public          postgres    false    222            n           0    0    user_master_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.user_master_id_seq', 2, true);
          public          postgres    false    220            o           0    0 #   user_master_user_permissions_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.user_master_user_permissions_id_seq', 1, false);
          public          postgres    false    224            p           0    0    verified_paper_vp_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.verified_paper_vp_id_seq', 1, false);
          public          postgres    false    228            �           2606    17875    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    207            �           2606    17871 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    209    209            �           2606    17850 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    209            �           2606    17840    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    207            �           2606    17857 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    205    205            �           2606    17832 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    205            6           2606    18124 F   certification_upload_doc_mapping certification_upload_doc_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.certification_upload_doc_mapping
    ADD CONSTRAINT certification_upload_doc_mapping_pkey PRIMARY KEY (id);
 p   ALTER TABLE ONLY public.certification_upload_doc_mapping DROP CONSTRAINT certification_upload_doc_mapping_pkey;
       public            postgres    false    237            1           2606    18116 B   certification_upload_documents certification_upload_documents_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.certification_upload_documents
    ADD CONSTRAINT certification_upload_documents_pkey PRIMARY KEY (id);
 l   ALTER TABLE ONLY public.certification_upload_documents DROP CONSTRAINT certification_upload_documents_pkey;
       public            postgres    false    235            �           2606    17884    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    211            *           2606    18073 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    231            �           2606    17824 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    203    203            �           2606    17822 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    203            �           2606    17814 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    201            N           2606    18253 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    250                       2606    17894 *   om_membership_plan om_membership_plan_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.om_membership_plan
    ADD CONSTRAINT om_membership_plan_pkey PRIMARY KEY (omp_id);
 T   ALTER TABLE ONLY public.om_membership_plan DROP CONSTRAINT om_membership_plan_pkey;
       public            postgres    false    213                       2606    17902    om_prefix om_prefix_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.om_prefix
    ADD CONSTRAINT om_prefix_pkey PRIMARY KEY (op_id);
 B   ALTER TABLE ONLY public.om_prefix DROP CONSTRAINT om_prefix_pkey;
       public            postgres    false    215                       2606    17910    om_suffix om_suffix_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.om_suffix
    ADD CONSTRAINT om_suffix_pkey PRIMARY KEY (os_id);
 B   ALTER TABLE ONLY public.om_suffix DROP CONSTRAINT om_suffix_pkey;
       public            postgres    false    217            !           2606    18023    paper_list paper_list_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.paper_list
    ADD CONSTRAINT paper_list_pkey PRIMARY KEY (paper_id);
 D   ALTER TABLE ONLY public.paper_list DROP CONSTRAINT paper_list_pkey;
       public            postgres    false    227            -           2606    18096    payment payment_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    233                       2606    17918    states states_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    219            ;           2606    18140 L   upload_documents_membership_mapping upload_documents_membership_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_documents_membership_mapping
    ADD CONSTRAINT upload_documents_membership_mapping_pkey PRIMARY KEY (id);
 v   ALTER TABLE ONLY public.upload_documents_membership_mapping DROP CONSTRAINT upload_documents_membership_mapping_pkey;
       public            postgres    false    241            8           2606    18132 &   upload_documents upload_documents_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.upload_documents
    ADD CONSTRAINT upload_documents_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.upload_documents DROP CONSTRAINT upload_documents_pkey;
       public            postgres    false    239            B           2606    18156 D   upload_image_membership_mapping upload_image_membership_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_image_membership_mapping
    ADD CONSTRAINT upload_image_membership_mapping_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.upload_image_membership_mapping DROP CONSTRAINT upload_image_membership_mapping_pkey;
       public            postgres    false    245            ?           2606    18148    upload_image upload_image_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.upload_image
    ADD CONSTRAINT upload_image_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.upload_image DROP CONSTRAINT upload_image_pkey;
       public            postgres    false    243            I           2606    18172 D   upload_video_membership_mapping upload_video_membership_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.upload_video_membership_mapping
    ADD CONSTRAINT upload_video_membership_mapping_pkey PRIMARY KEY (id);
 n   ALTER TABLE ONLY public.upload_video_membership_mapping DROP CONSTRAINT upload_video_membership_mapping_pkey;
       public            postgres    false    249            F           2606    18164     upload_videos upload_videos_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.upload_videos
    ADD CONSTRAINT upload_videos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.upload_videos DROP CONSTRAINT upload_videos_pkey;
       public            postgres    false    247            U           2606    18278 (   user_info_mapping user_info_mapping_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.user_info_mapping
    ADD CONSTRAINT user_info_mapping_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.user_info_mapping DROP CONSTRAINT user_info_mapping_pkey;
       public            postgres    false    254            R           2606    18267    user_info user_info_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_pkey;
       public            postgres    false    252                       2606    17996 J   user_master_groups user_master_groups_customuser_id_group_id_7bba8f5a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_master_groups
    ADD CONSTRAINT user_master_groups_customuser_id_group_id_7bba8f5a_uniq UNIQUE (customuser_id, group_id);
 t   ALTER TABLE ONLY public.user_master_groups DROP CONSTRAINT user_master_groups_customuser_id_group_id_7bba8f5a_uniq;
       public            postgres    false    223    223                       2606    17939 *   user_master_groups user_master_groups_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.user_master_groups
    ADD CONSTRAINT user_master_groups_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.user_master_groups DROP CONSTRAINT user_master_groups_pkey;
       public            postgres    false    223                       2606    17929    user_master user_master_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_pkey;
       public            postgres    false    221                       2606    18010 \   user_master_user_permissions user_master_user_permiss_customuser_id_permission_01d873ba_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.user_master_user_permissions
    ADD CONSTRAINT user_master_user_permiss_customuser_id_permission_01d873ba_uniq UNIQUE (customuser_id, permission_id);
 �   ALTER TABLE ONLY public.user_master_user_permissions DROP CONSTRAINT user_master_user_permiss_customuser_id_permission_01d873ba_uniq;
       public            postgres    false    225    225                       2606    17947 >   user_master_user_permissions user_master_user_permissions_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.user_master_user_permissions
    ADD CONSTRAINT user_master_user_permissions_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.user_master_user_permissions DROP CONSTRAINT user_master_user_permissions_pkey;
       public            postgres    false    225                       2606    17931 $   user_master user_master_username_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_username_key UNIQUE (username);
 N   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_username_key;
       public            postgres    false    221            #           2606    18031 "   verified_paper verified_paper_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.verified_paper
    ADD CONSTRAINT verified_paper_pkey PRIMARY KEY (vp_id);
 L   ALTER TABLE ONLY public.verified_paper DROP CONSTRAINT verified_paper_pkey;
       public            postgres    false    229            �           1259    17876    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    207            �           1259    17872 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    209            �           1259    17873 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    209            �           1259    17858 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    205            3           1259    18227 <   certification_upload_doc_mapping_cerdoc_document_id_3bdfd88b    INDEX     �   CREATE INDEX certification_upload_doc_mapping_cerdoc_document_id_3bdfd88b ON public.certification_upload_doc_mapping USING btree (cerdoc_document_id);
 P   DROP INDEX public.certification_upload_doc_mapping_cerdoc_document_id_3bdfd88b;
       public            postgres    false    237            4           1259    18233 8   certification_upload_doc_mapping_cerdoc_user_id_d08a771f    INDEX     �   CREATE INDEX certification_upload_doc_mapping_cerdoc_user_id_d08a771f ON public.certification_upload_doc_mapping USING btree (cerdoc_user_id);
 L   DROP INDEX public.certification_upload_doc_mapping_cerdoc_user_id_d08a771f;
       public            postgres    false    237            2           1259    18240 /   certification_upload_documents_user_id_84fb38fb    INDEX     }   CREATE INDEX certification_upload_documents_user_id_84fb38fb ON public.certification_upload_documents USING btree (user_id);
 C   DROP INDEX public.certification_upload_documents_user_id_84fb38fb;
       public            postgres    false    235            (           1259    18084 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    231            +           1259    18085 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    231            L           1259    18255 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    250            O           1259    18254 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    250                       1259    18056 !   paper_list_paper_user_id_a8daf912    INDEX     a   CREATE INDEX paper_list_paper_user_id_a8daf912 ON public.paper_list USING btree (paper_user_id);
 5   DROP INDEX public.paper_list_paper_user_id_a8daf912;
       public            postgres    false    227            .           1259    18097    payment_plan_id_7593f28e    INDEX     O   CREATE INDEX payment_plan_id_7593f28e ON public.payment USING btree (plan_id);
 ,   DROP INDEX public.payment_plan_id_7593f28e;
       public            postgres    false    233            /           1259    18103    payment_user_id_cfc22004    INDEX     O   CREATE INDEX payment_user_id_cfc22004 ON public.payment USING btree (user_id);
 ,   DROP INDEX public.payment_user_id_cfc22004;
       public            postgres    false    233                       1259    17953    states_country_id_bdb47937    INDEX     S   CREATE INDEX states_country_id_bdb47937 ON public.states USING btree (country_id);
 .   DROP INDEX public.states_country_id_bdb47937;
       public            postgres    false    219            <           1259    18209 =   upload_documents_membership_mapping_udmm_document_id_28bb79aa    INDEX     �   CREATE INDEX upload_documents_membership_mapping_udmm_document_id_28bb79aa ON public.upload_documents_membership_mapping USING btree (udmm_document_id);
 Q   DROP INDEX public.upload_documents_membership_mapping_udmm_document_id_28bb79aa;
       public            postgres    false    241            =           1259    18215 ?   upload_documents_membership_mapping_udmm_membership_id_13b631af    INDEX     �   CREATE INDEX upload_documents_membership_mapping_udmm_membership_id_13b631af ON public.upload_documents_membership_mapping USING btree (udmm_membership_id);
 S   DROP INDEX public.upload_documents_membership_mapping_udmm_membership_id_13b631af;
       public            postgres    false    241            9           1259    18221 !   upload_documents_user_id_c930ac82    INDEX     a   CREATE INDEX upload_documents_user_id_c930ac82 ON public.upload_documents USING btree (user_id);
 5   DROP INDEX public.upload_documents_user_id_c930ac82;
       public            postgres    false    239            C           1259    18191 6   upload_image_membership_mapping_uimm_image_id_77a20b4b    INDEX     �   CREATE INDEX upload_image_membership_mapping_uimm_image_id_77a20b4b ON public.upload_image_membership_mapping USING btree (uimm_image_id);
 J   DROP INDEX public.upload_image_membership_mapping_uimm_image_id_77a20b4b;
       public            postgres    false    245            D           1259    18197 ;   upload_image_membership_mapping_uimm_membership_id_5f88872e    INDEX     �   CREATE INDEX upload_image_membership_mapping_uimm_membership_id_5f88872e ON public.upload_image_membership_mapping USING btree (uimm_membership_id);
 O   DROP INDEX public.upload_image_membership_mapping_uimm_membership_id_5f88872e;
       public            postgres    false    245            @           1259    18203    upload_image_user_id_30c5df0b    INDEX     Y   CREATE INDEX upload_image_user_id_30c5df0b ON public.upload_image USING btree (user_id);
 1   DROP INDEX public.upload_image_user_id_30c5df0b;
       public            postgres    false    243            J           1259    18173 ;   upload_video_membership_mapping_uvmm_membership_id_6731b916    INDEX     �   CREATE INDEX upload_video_membership_mapping_uvmm_membership_id_6731b916 ON public.upload_video_membership_mapping USING btree (uvmm_membership_id);
 O   DROP INDEX public.upload_video_membership_mapping_uvmm_membership_id_6731b916;
       public            postgres    false    249            K           1259    18179 6   upload_video_membership_mapping_uvmm_video_id_21a63711    INDEX     �   CREATE INDEX upload_video_membership_mapping_uvmm_video_id_21a63711 ON public.upload_video_membership_mapping USING btree (uvmm_video_id);
 J   DROP INDEX public.upload_video_membership_mapping_uvmm_video_id_21a63711;
       public            postgres    false    249            G           1259    18185    upload_videos_user_id_7d21188d    INDEX     [   CREATE INDEX upload_videos_user_id_7d21188d ON public.upload_videos USING btree (user_id);
 2   DROP INDEX public.upload_videos_user_id_7d21188d;
       public            postgres    false    247            P           1259    18299 #   user_info_accreditation_id_4e2ec58e    INDEX     e   CREATE INDEX user_info_accreditation_id_4e2ec58e ON public.user_info USING btree (accreditation_id);
 7   DROP INDEX public.user_info_accreditation_id_4e2ec58e;
       public            postgres    false    252            V           1259    18290 '   user_info_mapping_user_info_id_0c7901f5    INDEX     m   CREATE INDEX user_info_mapping_user_info_id_0c7901f5 ON public.user_info_mapping USING btree (user_info_id);
 ;   DROP INDEX public.user_info_mapping_user_info_id_0c7901f5;
       public            postgres    false    254            S           1259    18284    user_info_user_id_5aed5314    INDEX     S   CREATE INDEX user_info_user_id_5aed5314 ON public.user_info USING btree (user_id);
 .   DROP INDEX public.user_info_user_id_5aed5314;
       public            postgres    false    252                       1259    17997 )   user_master_groups_customuser_id_d41037c9    INDEX     q   CREATE INDEX user_master_groups_customuser_id_d41037c9 ON public.user_master_groups USING btree (customuser_id);
 =   DROP INDEX public.user_master_groups_customuser_id_d41037c9;
       public            postgres    false    223                       1259    17998 $   user_master_groups_group_id_1be7c1ad    INDEX     g   CREATE INDEX user_master_groups_group_id_1be7c1ad ON public.user_master_groups USING btree (group_id);
 8   DROP INDEX public.user_master_groups_group_id_1be7c1ad;
       public            postgres    false    223            	           1259    17980 "   user_master_membership_id_2d740c03    INDEX     c   CREATE INDEX user_master_membership_id_2d740c03 ON public.user_master USING btree (membership_id);
 6   DROP INDEX public.user_master_membership_id_2d740c03;
       public            postgres    false    221                       1259    17981    user_master_user_oc_id_bb8b937e    INDEX     ]   CREATE INDEX user_master_user_oc_id_bb8b937e ON public.user_master USING btree (user_oc_id);
 3   DROP INDEX public.user_master_user_oc_id_bb8b937e;
       public            postgres    false    221                       1259    17982    user_master_user_op_id_a0776c5e    INDEX     ]   CREATE INDEX user_master_user_op_id_a0776c5e ON public.user_master USING btree (user_op_id);
 3   DROP INDEX public.user_master_user_op_id_a0776c5e;
       public            postgres    false    221                       1259    17983    user_master_user_os_id_72ecd86c    INDEX     ]   CREATE INDEX user_master_user_os_id_72ecd86c ON public.user_master USING btree (user_os_id);
 3   DROP INDEX public.user_master_user_os_id_72ecd86c;
       public            postgres    false    221                       1259    17984     user_master_user_ost_id_385c7fb2    INDEX     _   CREATE INDEX user_master_user_ost_id_385c7fb2 ON public.user_master USING btree (user_ost_id);
 4   DROP INDEX public.user_master_user_ost_id_385c7fb2;
       public            postgres    false    221                       1259    18011 3   user_master_user_permissions_customuser_id_b9f17728    INDEX     �   CREATE INDEX user_master_user_permissions_customuser_id_b9f17728 ON public.user_master_user_permissions USING btree (customuser_id);
 G   DROP INDEX public.user_master_user_permissions_customuser_id_b9f17728;
       public            postgres    false    225                       1259    18012 3   user_master_user_permissions_permission_id_fb5ee96e    INDEX     �   CREATE INDEX user_master_user_permissions_permission_id_fb5ee96e ON public.user_master_user_permissions USING btree (permission_id);
 G   DROP INDEX public.user_master_user_permissions_permission_id_fb5ee96e;
       public            postgres    false    225                       1259    17979 "   user_master_username_5a403727_like    INDEX     r   CREATE INDEX user_master_username_5a403727_like ON public.user_master USING btree (username varchar_pattern_ops);
 6   DROP INDEX public.user_master_username_5a403727_like;
       public            postgres    false    221            $           1259    18047 $   verified_paper_vp_paper1_id_c02b12f9    INDEX     g   CREATE INDEX verified_paper_vp_paper1_id_c02b12f9 ON public.verified_paper USING btree (vp_paper1_id);
 8   DROP INDEX public.verified_paper_vp_paper1_id_c02b12f9;
       public            postgres    false    229            %           1259    18048 $   verified_paper_vp_paper2_id_36590bcc    INDEX     g   CREATE INDEX verified_paper_vp_paper2_id_36590bcc ON public.verified_paper USING btree (vp_paper2_id);
 8   DROP INDEX public.verified_paper_vp_paper2_id_36590bcc;
       public            postgres    false    229            &           1259    18049 ,   verified_paper_vp_selected_paper_id_82c927ac    INDEX     w   CREATE INDEX verified_paper_vp_selected_paper_id_82c927ac ON public.verified_paper USING btree (vp_selected_paper_id);
 @   DROP INDEX public.verified_paper_vp_selected_paper_id_82c927ac;
       public            postgres    false    229            '           1259    18050 "   verified_paper_vp_user_id_b4bf0bc5    INDEX     c   CREATE INDEX verified_paper_vp_user_id_b4bf0bc5 ON public.verified_paper USING btree (vp_user_id);
 6   DROP INDEX public.verified_paper_vp_user_id_b4bf0bc5;
       public            postgres    false    229            Y           2606    17865 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    3058    209    205            X           2606    17860 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    209    207    3063            W           2606    17851 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3053    203    205            n           2606    18228 ^   certification_upload_doc_mapping certification_upload_cerdoc_document_id_3bdfd88b_fk_certifica    FK CONSTRAINT     �   ALTER TABLE ONLY public.certification_upload_doc_mapping
    ADD CONSTRAINT certification_upload_cerdoc_document_id_3bdfd88b_fk_certifica FOREIGN KEY (cerdoc_document_id) REFERENCES public.certification_upload_documents(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.certification_upload_doc_mapping DROP CONSTRAINT certification_upload_cerdoc_document_id_3bdfd88b_fk_certifica;
       public          postgres    false    3121    237    235            o           2606    18235 Z   certification_upload_doc_mapping certification_upload_cerdoc_user_id_d08a771f_fk_user_mast    FK CONSTRAINT     �   ALTER TABLE ONLY public.certification_upload_doc_mapping
    ADD CONSTRAINT certification_upload_cerdoc_user_id_d08a771f_fk_user_mast FOREIGN KEY (cerdoc_user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.certification_upload_doc_mapping DROP CONSTRAINT certification_upload_cerdoc_user_id_d08a771f_fk_user_mast;
       public          postgres    false    3083    237    221            m           2606    18241 Q   certification_upload_documents certification_upload_user_id_84fb38fb_fk_user_mast    FK CONSTRAINT     �   ALTER TABLE ONLY public.certification_upload_documents
    ADD CONSTRAINT certification_upload_user_id_84fb38fb_fk_user_mast FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 {   ALTER TABLE ONLY public.certification_upload_documents DROP CONSTRAINT certification_upload_user_id_84fb38fb_fk_user_mast;
       public          postgres    false    3083    235    221            i           2606    18074 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    3053    203    231            j           2606    18079 D   django_admin_log django_admin_log_user_id_c564eba6_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_user_master_id;
       public          postgres    false    221    231    3083            d           2606    18057 >   paper_list paper_list_paper_user_id_a8daf912_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.paper_list
    ADD CONSTRAINT paper_list_paper_user_id_a8daf912_fk_user_master_id FOREIGN KEY (paper_user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.paper_list DROP CONSTRAINT paper_list_paper_user_id_a8daf912_fk_user_master_id;
       public          postgres    false    227    221    3083            k           2606    18098 =   payment payment_plan_id_7593f28e_fk_om_membership_plan_omp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_plan_id_7593f28e_fk_om_membership_plan_omp_id FOREIGN KEY (plan_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_plan_id_7593f28e_fk_om_membership_plan_omp_id;
       public          postgres    false    213    233    3073            l           2606    18104 2   payment payment_user_id_cfc22004_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_user_id_cfc22004_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 \   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_user_id_cfc22004_fk_user_master_id;
       public          postgres    false    3083    233    221            Z           2606    17948 1   states states_country_id_bdb47937_fk_countries_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_bdb47937_fk_countries_id FOREIGN KEY (country_id) REFERENCES public.countries(id) DEFERRABLE INITIALLY DEFERRED;
 [   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_bdb47937_fk_countries_id;
       public          postgres    false    219    3071    211            q           2606    18210 _   upload_documents_membership_mapping upload_documents_mem_udmm_document_id_28bb79aa_fk_upload_do    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_documents_membership_mapping
    ADD CONSTRAINT upload_documents_mem_udmm_document_id_28bb79aa_fk_upload_do FOREIGN KEY (udmm_document_id) REFERENCES public.upload_documents(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_documents_membership_mapping DROP CONSTRAINT upload_documents_mem_udmm_document_id_28bb79aa_fk_upload_do;
       public          postgres    false    3128    239    241            r           2606    18216 a   upload_documents_membership_mapping upload_documents_mem_udmm_membership_id_13b631af_fk_om_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_documents_membership_mapping
    ADD CONSTRAINT upload_documents_mem_udmm_membership_id_13b631af_fk_om_member FOREIGN KEY (udmm_membership_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_documents_membership_mapping DROP CONSTRAINT upload_documents_mem_udmm_membership_id_13b631af_fk_om_member;
       public          postgres    false    213    241    3073            p           2606    18222 D   upload_documents upload_documents_user_id_c930ac82_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_documents
    ADD CONSTRAINT upload_documents_user_id_c930ac82_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.upload_documents DROP CONSTRAINT upload_documents_user_id_c930ac82_fk_user_master_id;
       public          postgres    false    221    3083    239            t           2606    18192 X   upload_image_membership_mapping upload_image_members_uimm_image_id_77a20b4b_fk_upload_im    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_image_membership_mapping
    ADD CONSTRAINT upload_image_members_uimm_image_id_77a20b4b_fk_upload_im FOREIGN KEY (uimm_image_id) REFERENCES public.upload_image(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_image_membership_mapping DROP CONSTRAINT upload_image_members_uimm_image_id_77a20b4b_fk_upload_im;
       public          postgres    false    243    245    3135            u           2606    18198 ]   upload_image_membership_mapping upload_image_members_uimm_membership_id_5f88872e_fk_om_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_image_membership_mapping
    ADD CONSTRAINT upload_image_members_uimm_membership_id_5f88872e_fk_om_member FOREIGN KEY (uimm_membership_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_image_membership_mapping DROP CONSTRAINT upload_image_members_uimm_membership_id_5f88872e_fk_om_member;
       public          postgres    false    3073    213    245            s           2606    18204 <   upload_image upload_image_user_id_30c5df0b_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_image
    ADD CONSTRAINT upload_image_user_id_30c5df0b_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.upload_image DROP CONSTRAINT upload_image_user_id_30c5df0b_fk_user_master_id;
       public          postgres    false    221    243    3083            w           2606    18174 ]   upload_video_membership_mapping upload_video_members_uvmm_membership_id_6731b916_fk_om_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_video_membership_mapping
    ADD CONSTRAINT upload_video_members_uvmm_membership_id_6731b916_fk_om_member FOREIGN KEY (uvmm_membership_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_video_membership_mapping DROP CONSTRAINT upload_video_members_uvmm_membership_id_6731b916_fk_om_member;
       public          postgres    false    3073    249    213            x           2606    18180 X   upload_video_membership_mapping upload_video_members_uvmm_video_id_21a63711_fk_upload_vi    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_video_membership_mapping
    ADD CONSTRAINT upload_video_members_uvmm_video_id_21a63711_fk_upload_vi FOREIGN KEY (uvmm_video_id) REFERENCES public.upload_videos(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.upload_video_membership_mapping DROP CONSTRAINT upload_video_members_uvmm_video_id_21a63711_fk_upload_vi;
       public          postgres    false    249    3142    247            v           2606    18186 >   upload_videos upload_videos_user_id_7d21188d_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.upload_videos
    ADD CONSTRAINT upload_videos_user_id_7d21188d_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.upload_videos DROP CONSTRAINT upload_videos_user_id_7d21188d_fk_user_master_id;
       public          postgres    false    247    3083    221            z           2606    18300 :   user_info user_info_accreditation_id_4e2ec58e_fk_om_member    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_accreditation_id_4e2ec58e_fk_om_member FOREIGN KEY (accreditation_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_accreditation_id_4e2ec58e_fk_om_member;
       public          postgres    false    3073    213    252            {           2606    18285 I   user_info_mapping user_info_mapping_user_info_id_0c7901f5_fk_user_info_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_info_mapping
    ADD CONSTRAINT user_info_mapping_user_info_id_0c7901f5_fk_user_info_id FOREIGN KEY (user_info_id) REFERENCES public.user_info(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.user_info_mapping DROP CONSTRAINT user_info_mapping_user_info_id_0c7901f5_fk_user_info_id;
       public          postgres    false    252    3154    254            y           2606    18279 6   user_info user_info_user_id_5aed5314_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_user_id_5aed5314_fk_user_master_id FOREIGN KEY (user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 `   ALTER TABLE ONLY public.user_info DROP CONSTRAINT user_info_user_id_5aed5314_fk_user_master_id;
       public          postgres    false    3083    221    252            `           2606    17985 N   user_master_groups user_master_groups_customuser_id_d41037c9_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master_groups
    ADD CONSTRAINT user_master_groups_customuser_id_d41037c9_fk_user_master_id FOREIGN KEY (customuser_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 x   ALTER TABLE ONLY public.user_master_groups DROP CONSTRAINT user_master_groups_customuser_id_d41037c9_fk_user_master_id;
       public          postgres    false    3083    223    221            a           2606    17990 H   user_master_groups user_master_groups_group_id_1be7c1ad_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master_groups
    ADD CONSTRAINT user_master_groups_group_id_1be7c1ad_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.user_master_groups DROP CONSTRAINT user_master_groups_group_id_1be7c1ad_fk_auth_group_id;
       public          postgres    false    223    207    3063            [           2606    17954 K   user_master user_master_membership_id_2d740c03_fk_om_membership_plan_omp_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_membership_id_2d740c03_fk_om_membership_plan_omp_id FOREIGN KEY (membership_id) REFERENCES public.om_membership_plan(omp_id) DEFERRABLE INITIALLY DEFERRED;
 u   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_membership_id_2d740c03_fk_om_membership_plan_omp_id;
       public          postgres    false    3073    221    213            \           2606    17959 ;   user_master user_master_user_oc_id_bb8b937e_fk_countries_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_user_oc_id_bb8b937e_fk_countries_id FOREIGN KEY (user_oc_id) REFERENCES public.countries(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_user_oc_id_bb8b937e_fk_countries_id;
       public          postgres    false    3071    221    211            ]           2606    17964 >   user_master user_master_user_op_id_a0776c5e_fk_om_prefix_op_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_user_op_id_a0776c5e_fk_om_prefix_op_id FOREIGN KEY (user_op_id) REFERENCES public.om_prefix(op_id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_user_op_id_a0776c5e_fk_om_prefix_op_id;
       public          postgres    false    3075    215    221            ^           2606    17969 >   user_master user_master_user_os_id_72ecd86c_fk_om_suffix_os_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_user_os_id_72ecd86c_fk_om_suffix_os_id FOREIGN KEY (user_os_id) REFERENCES public.om_suffix(os_id) DEFERRABLE INITIALLY DEFERRED;
 h   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_user_os_id_72ecd86c_fk_om_suffix_os_id;
       public          postgres    false    221    217    3077            _           2606    17974 9   user_master user_master_user_ost_id_385c7fb2_fk_states_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master
    ADD CONSTRAINT user_master_user_ost_id_385c7fb2_fk_states_id FOREIGN KEY (user_ost_id) REFERENCES public.states(id) DEFERRABLE INITIALLY DEFERRED;
 c   ALTER TABLE ONLY public.user_master DROP CONSTRAINT user_master_user_ost_id_385c7fb2_fk_states_id;
       public          postgres    false    219    221    3080            b           2606    17999 U   user_master_user_permissions user_master_user_per_customuser_id_b9f17728_fk_user_mast    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master_user_permissions
    ADD CONSTRAINT user_master_user_per_customuser_id_b9f17728_fk_user_mast FOREIGN KEY (customuser_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.user_master_user_permissions DROP CONSTRAINT user_master_user_per_customuser_id_b9f17728_fk_user_mast;
       public          postgres    false    221    225    3083            c           2606    18004 U   user_master_user_permissions user_master_user_per_permission_id_fb5ee96e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_master_user_permissions
    ADD CONSTRAINT user_master_user_per_permission_id_fb5ee96e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
    ALTER TABLE ONLY public.user_master_user_permissions DROP CONSTRAINT user_master_user_per_permission_id_fb5ee96e_fk_auth_perm;
       public          postgres    false    205    3058    225            e           2606    18032 J   verified_paper verified_paper_vp_paper1_id_c02b12f9_fk_paper_list_paper_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.verified_paper
    ADD CONSTRAINT verified_paper_vp_paper1_id_c02b12f9_fk_paper_list_paper_id FOREIGN KEY (vp_paper1_id) REFERENCES public.paper_list(paper_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.verified_paper DROP CONSTRAINT verified_paper_vp_paper1_id_c02b12f9_fk_paper_list_paper_id;
       public          postgres    false    229    227    3105            f           2606    18037 J   verified_paper verified_paper_vp_paper2_id_36590bcc_fk_paper_list_paper_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.verified_paper
    ADD CONSTRAINT verified_paper_vp_paper2_id_36590bcc_fk_paper_list_paper_id FOREIGN KEY (vp_paper2_id) REFERENCES public.paper_list(paper_id) DEFERRABLE INITIALLY DEFERRED;
 t   ALTER TABLE ONLY public.verified_paper DROP CONSTRAINT verified_paper_vp_paper2_id_36590bcc_fk_paper_list_paper_id;
       public          postgres    false    227    229    3105            g           2606    18042 H   verified_paper verified_paper_vp_selected_paper_id_82c927ac_fk_paper_lis    FK CONSTRAINT     �   ALTER TABLE ONLY public.verified_paper
    ADD CONSTRAINT verified_paper_vp_selected_paper_id_82c927ac_fk_paper_lis FOREIGN KEY (vp_selected_paper_id) REFERENCES public.paper_list(paper_id) DEFERRABLE INITIALLY DEFERRED;
 r   ALTER TABLE ONLY public.verified_paper DROP CONSTRAINT verified_paper_vp_selected_paper_id_82c927ac_fk_paper_lis;
       public          postgres    false    227    3105    229            h           2606    18051 C   verified_paper verified_paper_vp_user_id_b4bf0bc5_fk_user_master_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.verified_paper
    ADD CONSTRAINT verified_paper_vp_user_id_b4bf0bc5_fk_user_master_id FOREIGN KEY (vp_user_id) REFERENCES public.user_master(id) DEFERRABLE INITIALLY DEFERRED;
 m   ALTER TABLE ONLY public.verified_paper DROP CONSTRAINT verified_paper_vp_user_id_b4bf0bc5_fk_user_master_id;
       public          postgres    false    221    3083    229                  x������ � �            x������ � �         �  x���ݒ�0����tp� �}��tR��!a�}�&�,K��a�I9: +:�����t�/�97�����l9�^���
�?���0ʅXZ�d.f����Wo�2l�Fe��_�i�[VXi!�*�����{��� ��� ��V#�ZTy��1+�@�Y��]�h��# �"H�U_���8��Ż|�MVY!Z#JWTN�*��T[ăD�7AhD[��ݣ��8ok+NJ����N�Z�1` �c�.H�U��&>>�?�n
n�g�9�J���0�*j���'@���j��}���|�t�lo��_ê`!��4�͇�
M��d\�D�X���ǻ���eh�U��B���#��=Y0�ȁJO�T���X�Թ�*�Hb�Γu�IT�Ɇ�C�y�L���&[n;@�A�||<��1|v<�G�2O��qߓ�yL�"�1�{��
q�5�*>=��#Dp>E��Dp:Mv#EP�W��"�/�4g�Y�⋅�~��o��`�Z�vK �t|�{����i�e|�U�%� �Q��4	�GId|��E�PϿ���t�ۣ�+n7B�5p5w9�����8L����ϋ�c7/� ���;���X�)�n71�AȨ�M���?��&���5�`<�ِ�~]�M��z�M�k7����楛���x�TZ�s����G��5>�z�r����c�p��?�{MH~4v�IY�`��n:)|Iɭ'��n��v�3�����f���u�QY6D(��9�Q\6M(^l��QZ2V(\�N���l��XjCj_	�!�l��ZpX��$]"N�x/*��(vq3����6*�E�-6����E;٥���qBA;�՟̐��fC�P.!�,��Rp X��P%�!NZ8�m\t�����n�gӆ������hj�P4�U����
�wy[����b�{�\�Y�����wQ~R���(��(�T#V�
C�S�j+Q0M��cf-꧙Q����<֖���C)�߬�      #      x������ � �      !      x������ � �      	   h  x�}XKw�H�]_�
��k1}�[Z���0�.��&�,P[Hn!ٍ�wC`W��9��O^�#"#��M,�w����ύ*9��x���Rp<�p0|&p�5�rq����N�f�N��凮�!".�U]si�>����J�5�S�yAĲ}�'Ԩz�p?��X���*���}Uo�}7?4�����9�T�\ò'�N�39 B'��[��� ^#n�M�
��-â�"�:�E��燮�*�K�"�F>�)��N�lfGM#\۰�'�*�Ā�C�D�C���|D�+B�1_���,������Pu{���a[�9��	�m�6���^�2l�{%��Ȱ]���Sw-��)��Ƕ���J�Я����y���ș�d*��D��P��5:a`�����"d�����P��sz.��r��
�Z}�$C,LyV�7��hN�}μx�i��tM��/�z��Ķ�9|^�C����A�]�E�C���/�˼S�>s)�
�r{�^`8>f�i[�@�bH�A"����w�pV�AL�TrU�a���U�]�5焆�����D��^2Z������5&�����J���"�q�o�6�!G��+��cǯ.�BC=~pX��$�nW�|t}T��l�1�~y��e�؆K�8��N[	i`�!ft�:U5���#å{c|�g>���5K��^�!��T�j�z3���t}�ͫ�_V��mV�I�J
����G��m�k�V�6�����չ��z��b¥uœ��Ǥ~S��E}c��#of��T��o���vEBW=:�����]�k�/�pF�ʓ�_��y����o���Lq��a�au�K��
�پ����[L��>��Ĉ��Y��e z��`4�hײ�k�7v1ct��6�-��t�QAN,ޮ�z��c���[�:șF�6/�"W�0b�Ԃ�J��F禺��m�FF�1�^��=�z�c�O��~Y��f�����f�Sŋ��+�^�g6�����nG�8���]�W�[�EF��nJ��R��8���
w�*w�c��c]2J�RX�#��_��*.�>�u!7�}}J�#]��!�Mac��R�亰�q±�A��6�>�0a�������3BCAjV�nd���������x�q��e���%n�a�¸�Z\�.ͻ��m;�>�C�������%��]T�+K?�Zڽ���XFD�37��
�ۈ,��9���/-�Ş#M�]#�1^�3al����w??�U�;񌈾<�\�{�d�(r2����$�D�zߝ��s�WF���,0��}[+Ib2�`��O�g���Or-�0YcҖ��H�V��i��N�����ΰ@���z6�CW�`/�9��0��qIw1�.ÿ�������]�k{>�sLϵ����`�aڨ��D��OpϮ�|�y��^yPH[�$~��^���][����꽘"�QG̞1S����#J	j��3]^�e�����η$6f5Ϣ��-1�X�梪�&�E91[��.��)f���������ǘ]�����"�4�<�\��C��Rb��y똂.QJ���k��J\��<%t��#�ݗu�+���U�92���I q�b�'�S��F��FSz�6b��Csl�
��hQZ�ט��h6�>0L�z"y@�v���8�E�d&��_I�<`QS$c�{uP����,�G��z'���PB$Or���SD$���	#�0�\0.�)�Lƍ�^�Ï�@�Fu.4y�[��Ʉx}>���E�,)�Z"�.ߨ<�[�rى����Jl�s�)�����l��E9�$V\���]ö(�H�?������w�g�H�PG$C$U�������D2 T*�t�&5D���[
N���!Ik�$UՐ���(��p]��ڶ�`��L�C�U��I�CBs�+l� �Z�u�E����(
+BTgl8X,�ЯJ
�������ݍ�������H���b���B쒚�����U�2�e� ���óVW%'�XL�`�׊���a1"�7�õT���J@�>�Z��~��X܁���*^����u@�DW�Ҭ����_�Q��Ei�x�I��"GzxH�p긅KY��a�^n//٘}�PAR���@1�L�gI���4���}����+3#,c�,Iy���Q#,�D^��*yI�&��m`Q,�����# ���K�RaX�	�Ա��+W�x)� ��y�Sy]�zX��9��e��=j�eF�n������+,��J�cE)&���㻒&I���F��m�K�*f�_=`U���t���Wk�ڳ����+>^�B͂8H'H�Hk��)�4�HpR����9w�̅~��Pʒ:`>�͘��\T����2��˜���n*S�V�'�l>or�#��D`_eCw����R:<����������*���'�C��̬:]]��.�7-��HcNh���Jj3���H�.��������K�c_A\��X_vG��-1��H�H�Me�5��G1��8[�+{��)�҂��"��	�N;��2��H���k)�
]�o�ʂ2�3�a�b"�#��NU��C�&��H���i\��iSW<�yi��Wl�I����Oi�#Lo?ᴕno[|Si��ʛ����R��sU��:��C�QS�T� c�g'KI�e�b+rKB߅��BN�)A�g�����%��� �{͞����Y��7Wr�<��C�'����C�E��L��"pBY�!�'�W�I2d�"${&Z~\��'?A�&Ȏ�j�/�����*y�bV�l����eDٍ����,Cƻ����xVm�`�p��l��e}�~K�%����*�۔n$ ��\U��� ���rP�U��hW�Ay�m8�w/*gX��>�XA����~�o�cB�;B<º�����rvK��� C����>c��S��(���C�t+d��u�o�QV���6Ņ����������j��3�[�:A=l�ب�o���Ą��;ț��<����2S���"��k6#lHd*�Yb��&�s��a3&�J��T��/;�@I�I�6�����N��o&�L���;<���k��ڦ��A�d��g4�#���Tٌ:bS =��~&6����i���Pq�N��v�����#�u#��x~�s~ڪ���+���?��i}��           x�u��KA����_1x*��y�g�nR,��f�^�n �YI�OaUZ���~�" �#�4q��;&�+�ĠPU�Au_f������뺩{Io��g��U$�hB@��*�Ɠ�rT=�w�x���+���N�?�N��î�絈,|�1���L/�5��5 a�ڞU�Z�-^����R_7M�#�KI"k�2��I��-��K3 ���׵� ��2C�.�z��R�-)-�N��ϓ��Lؖt-�p2#ż�fH�9��0ӫ��2C=��(~���	           x����n� �㇙�4��ˤ�'�.�P-o?B��j:i�s�|d*�Yvj��'h���E�"��g�>h��.4M��Q�A	�
YpTY(*���"��d?)ʕC����H=�eՒ�Y�n1$�D����%y;K�]�ti[�udI���F�{��*��p�-��;�AE��!e(�B��3r}��&Ϝ �Z��t�7Y�?��C��<�l�@��^�ۀ��w�i^�/�DM�N����/���\�� ����?      �   R  x���ݎ� ��������|�M��p2���F�vǍ}����S���uc�c��Ɇ
!��ؙ���;�w��j�l���H�B�!�h��vp_Voz9ѣ�1L��Tf��g�#��n"ZDX�>Z�'�.�΍k]=�o����:�I����hsH;��?q �A���3h��M�)�c��Bf�(�L�M��w�.�p�M�
?�����|�̝/Z'��1
ID؆Q#�v�L�]Mt>hs�j��z�!��=��� �<����=
L�p�%QXe�0@���<�JQ�<�J��<%������?��*��
2�V�mN^�0g$�R��X&3�+q͈ �����������UJ9H#���
%%�:t�YqR�(�A���%�)���W��Hj�#8純Wyp���6.�77�~��=���SB*���&s��Bt�м�0<_�21O?d��n��=��@R�vb�S�X��X �e��*�-�'�ỳ�bZ
aۺy��xh(Z�����|���M@0� !��)Pʋ��K�?�v����#���+�x�����=B5�jN$�<����r����      0     x���n�0���S�^ԠHQ��Ķ*â!C�L�-�IJ�[��W6�]�[ox���Y���4U�����mN�9�nړU�FwLv�)�a�0�*@0a���C�CM;���O
��`���J\m�$"߬���f�M�P.�����83rOl�-��H�W��Wɽ�Hu^/4����Kb�b�5H��]�a��U�N��K��P.��ۛnF���"��k�~��ÌYKUXT��$4�I�iL%U��G�%S�.1��Ͱg������l�C������ �	`�Q-�������_����q��9\r��|7|�a� ���I �o����z�o-�R�5��H��Z������h$4�AK'Y�Ӟ���0�3臜7E4b��s�Wt2��߰U,6�+�̛�ïe�y�H�b�\�(oX��������/�o؏�ɷ|���O�K9/=�8t�u�����$�Y���U�(��{�s�g*��j�}��x�>���^FB��ⓠa1�<
L����#�`z]rM�֚�BnÇ_-!.F�I�����,�nj�j�[Q�;�����p�m�����7K�=�.".�ǖcc�n�)E�ZN�7����$���tN��S�qd��7�r!c� �~��m<���PH         �   x�����0���):ʠ)�
�$F�D!1�`\P�6���>��6��57��}w.`��x� ���DvIs4�Ŏ��IT�iaSB1pu���d1�b���,��(���״�|�}���.$�Z聨�r���p��l{��d�k�a�Qs>��G�� ��9�F{�lh1J��{P���vh0[nDFv������W� $��ޛ=��e͝���@Յ� Bx����         "   x�3����-��2������,.����� M��            x������ � �            x������ � �         �   x����J�@����)r�,3���&�R���(&��"�6ݚdcӨ}{zP���>��nT�:_g�T�ӫYZ����O���h�c�n[Oήk���k����"O��Kwo�>����f���m���~?���h��u-D�� QR@(��Jh���4��9Q� ғ_�cD����̚E��b���o�2�����h�����/(}��U�XHc4�7-i��OVV�            x�|�˖�-8��B3w�:��4�z���r��3HB�H����LK�������VO��z� d�Oߵ*m�� �x �e���T����0���~g��۶�f���/s�(3�ܘ�m�m��f_��	��n��T�{�=s�i��:{^�Dw4�f���\��M��P�4� ��1�t��Ebl��6��^ز��Y���9�^���1����i.���썫����*��TU/U�3mQ9m�l����8�ȳw��MgN��M��֕o��[��)5q~��7��0�Gk�
Ͳ�P\���|��	�. ���kK���=����W�w�M���:cǕ���t�caP�c�"�m����,��7�g��WM>؃�\̲�n_ئ�(4�>����)�Ⱦ�{�v���Ww:9m�b�}3�+�E����E��,��[�
����:|�'�m�����&�n�a�,gٟ��&�,�.�g��ϴҸ_��G���������<�����]ϳW�S�^�ҿ,��k���eu�_����,{ce����c���4������z/��9����~�]k�{��+�c+cpafI���c�On���(����d͉��,�誦���<��7�������9��_�K%.B�@4��k���ƚPZ����-m�}�;j�-�fj'���|ړ>�ϲ?� ͗ϳ?Ms0G�^d�7����C�_rtx_�pWKb�i��j!r�,�+��5c��Mc[���d/˝iQ�Y��ن�0��]�O�
,�טA��Io�av���g�t�/}���7{�����b*�{�����>I�3�lv�-�γ��ZH�E�6��@j����B��b���4�u�5��M�k����{�L���:A��g�C���`�ڦ����GN�����'+?�P��JaB'�jg7���1g�'�ٖ�֬��*����g��6�^z�3,���^��sWbv,���\�9��D�;��7�,�<�S�B�QԵم�9�Z�R��9��!-�ǂ��T{j�͞����g�)Xa���T���Y��O���ۦq�����#��$	uaq}�D'��ܽ+��A�w!׆s��:�-�b�����;���~H	X�{Ӟ����~�1i��J�%�8��^e�m$V�O�i�p	��j��h�L\N�΅�[p�)�V̯�sw�{�ߗ��U�9�샛�L=5�����N�������_�%Ws���|b,����\CkR"��N��Zm;��o+�6`�zJ
�R�KS��b5�����i����쏪b㞙G��|,��"t�V,:?�_�����%'�	F��>�*A.qo���G�s_�����P���x��f҄f,i,Ġ����,� �4!�F��+ǘ�3�c�M��&���,u����5B������m�˅����e���T��w��%[�f�!1��'�%�e�7�Y�X|�Z��\����voJpZ�i���4��䷾t�;�}��ILX�Y���{-�{�t!9_��ڠ)X#��a}�u��7��vR ��7�ӧ�����~���h��������G�tZ�2B_�[��ؚP��`a��y@b�W_õ�����/�-�k�v����wԟsp2��otS�2��ڣ�r��/��|3ٗ�U�0�]�������y�m�i�����;ɴ�o�0�!U�0G�_r��\ c��$�������̳�oy<�����5�1E3
���4�=���ô���� �"@���`��X��� ���%s$�G��rKok�Nn��0��+R�7�3A���b����R��o�o�\�l�=���S�:?ye��_au��|q>�\g�|S�6~���%(��ͪsH���G���`1���$Kh��C#��>��^TIH����}�9;�������ӄ�k���.��6��"��Uz+�3G�	^b-�К\�-�&���1�X��}_�:��n(]�; �Y���E
�����)���5U�����Ű�D
3ˌ�Fk�����v����d-��
O�fz����.�k'/�!)�����}0��%��s<�A���~R�iz��	WO�CT�0~C�`|Pb��z��?���!Pa�*	��ԧ��
��=Ø��\M�"����R��-t���=��h�G��`�B�+!|��Zj;@,J����s�ԷX��ݵ�����-;[T�l�@��5އ�1��;���{����T�ܫ�����`&Xj.D���Ǯ�Mx��O9�*i�ڵ�ghy�-w�o���U��̿��C`}\�����O 6���������n�WԲ��S`��C8�s�����SiK�	�;.z1�ּ�vҲHEW�'�\���B�n��H��Ҳ	f�u�7Џ�H�<I�,&]%ߘ��q"ds_
���K��oJd��%�`��J�q%!I��^#�o�h��+�\�<ߨ�P��̹�7��e�`�_�����o|��.T&w�Z�_�K�wKa/�����O-���h��^��/�z�k�@�+�TN��e�)�CO��#HlH�
��6����eqCkM}����������?
Qr��;��_b�-/��iV
����C����U���5f�EZ���LפǶ�̾2W���nw��� f�-V���(���+R*��e0��6�*W�@r�螔���+��͡|۞S�(��^�n f�����R���Ҝ�|oks�͓v����q\��.�Y�'�*��u�q]f_����}`�_��QR9"�ԃ9�˳_ߒu����ਟ	��޸�A~����ߓ7�U`&��J���F]-Pz\ׄb��hr@V�������:3��3��2�M���t������8��4Ǟ�rIn�@�*�)|Ҡ�����Ha�q4��K@�j�[�0h�d�=~��A$M"�́�!6ًB�$��jsK�{�zSM�x�,�f�=�t��DvzA��KY���3�,��+0��h���S������/S��7۶>P[�si��`o�Q��PM`F��ؘ}�+1��E_��c{�Z��
�6jѽW������+�g{�7�؄�]���]�덚����kJ�4#�����>�ӛ�)�<��;����`��2���O��`d #<�Q[s�aL�T�K\�C/�bJ#-�q�`H�b���ը.�9��G�53���P�w��'8��ɇ���3g[� dN���2������9H#F7�@.0]?~`�}�Ic<苹�����@��)=����0�.H�S�NO��,��b��kϨO����r+��O]@m�����U4࢝�'��	v�q	F����w��ؐ-oF���>*�|��	�0LJY��c�M�<!�=�
6{��/�l�����R����N��S�N��@~+|e��W"S�o@,�7����Jb�7���.��(��?*�+}��&��~WBFn5�fպ=)�U�����9��=4��@����Y;HNgsn1s��Rrɕ�Y��*��fK�����m��2;����n��a�CA[�o�v$��޻J$/!�B�lE9: �`���T��y%��'�r�陋��{,(��1��������j�O�<��C�6"��Tp,[���������o����s1q-��Fr�ګ�ZfߠB��J���8_����A.2YR��6��)ƿ����}�+j9�ݝWj����mB���36�4�T_�����VZx���t�h`M�����p�:�|	z�tJ
Fa��F���%���豄)Is��!u��0ǐ�i/�=��>�r�C���E_wX͕^��G��Ia崕���D6��3��m����>�J��T�PV�]����>�f��s.}\��S�[�N��*�V�>k}l�F�N�|�\�Cz]jP�k������!�@����Z�"���\��ax��WbNnq�"��;�jɛ��b"70wJ]gj��<�mm&n��=r� W�\y�Ş�]�Nf�9c�Q��5�D<���a!k�΂���(��Ҝ/Vf)�+��G;�<N���o}�W]���.�LL�    N-� ua*�:dYs3����@�z4���z�m�#Dg��
oG��݄W`d��2<�#{�h�Dbr�ǟ���)���(p|4'�r��0ᢩԓy{��9��Q��P,�l�����@*���?�#3d����� V�}c��~s3R1wEH.�ۊ�	�"q�$��R)b������G�������h�-�l;h1��5^��!��.�'��naB"@���`����H��%�h9��ƸP %���y.��.�!�@q������Z�
��3�e�^hY�Z�%i�SRl�B� �����(4?�	\�^�����U�\�Il��B��eƽF�m��ڰ�"���}o�W���'o�����֌P�������Ԝ�-��'}FlA��5�� X��.Q8���r���Z�;���r��]C���4_�����[�l�"	.�7VJ�f��" 5�o;�
Y�~6n���%��>�h��|Me�:6q�Aq��!(	��׏FFi ��Q���{rM���^��K��-��9�h�sk��%父\�k�b��l_+_ҵBH|v���Pr����x
o(Y4f�Y�-�y.�Pʴ-9=L��`u߱�������`t���ih2lȑ�XfTY�k ��%/�[�L�'���#�"J��)FdK���B��?�'g���Eß�| �L�W
����9�Zچ�t�T��0�{�)����P)�!��{��B�Į>���r��zO���#|uv��Q c�KHŸ�KuC�B�G+������"�����gS���6Zq�&�����A�z�l7�p6��?p�K�=�Zz49�����T��c�B�������W{��Q��ex�#�����������k	�6�����a�e���͵�
�"d}H����{�V+�t��ﹾ@�)R9��O��+		���z�����5�訏��`���蜋�%U���am;hI�VN"n	��-�.����/��%��},�Q�k���;�4�2�}�|�b�����/��]��k��I��δM=�n�`�V�)�"�_���
.�����+�:�֠��2)�
_L��X*�t�BIL
.�w��Q�� ��E����|u�|Ҵ9�߃/'�j������;�C>u_A���v�Ͼ�RX���ﮰ�1!��L�[c���|���Q�����L�X�o������&=	���_�KȜ�`�>(�����g�A/U,�J�(�����\	-{=���ߓ����*<��V(`͉�4�ׇ�J�q>
m;�th��2�w�\:.~�"�@��z���'s�w���3ÿ���bd�R�%US�
P�����|��� u_�Y�م�sߠ�����#�n�K%m�M���+��
�è�w�`��������zf�-���@l�W���7�����P�+��L�+?�E�B�\$+:��|Z��
,�)�&{%�
{�ͅ���`�~��w���<�a�tD$�$�-�mk��<F�B���n�af��Dh��L�V�*P���z�-Wd7���'��[��B��kȱV,<��Pei&��j��q���N\��t��Qb��|�
I'��3�����'��Bї�������fN)^KB�($4'�O_���n��O�RReO�a�?�*�y��禎�{�R�v���z��Q[��{n�t�0K	�Ra����wv��jf4�\l=�&(D�9L i�,iwUrM3��ޕ�n`h����\��T���)�m�}��eo� ��Bܩ�:4
�)I����/�����E3ZPmE+�Z�5g��W����3��[�h��iNd-fv�D�}��)K'�O��SP�:u��"�B���ʣ��W�9�o낓b	Z���,=��=f���HN�!;wp��~�<����3Z����u�+��MƇ��J��e���ݵ�!�Jm���u��Sș�p%�aM����󸏹W��)�8���&:V��	�/�	�b��h υ�S����u�j$hǧ��M�@p�߹ob�_�ZS�
�Y�[���IaFٗB��������5#M}������ ��?���?�KU
�᯾�� ��wa���"lTfp\_�&�a�������{�x]��<�S,s�k�%��`��LRjͩ����c�ɢ�@5��!$-(��Н�<��6te��#$��?�9�����Ze�X���P=mi��KHq/�&���a�� uux���+���~�B,h.D�=7t�������&Yh�,��$�R�g�X�5��Ԯ�h��*�r����k��v0
�¯{7��2ly��>ϞT�������67b�D���Ҋ�V�����?�V������cMz��`�1��\�<����B��T5�Y��-HZ>���.����$�H��\$Hb�Z��*ҔA�܌��T'<��&��Qza�3��7�Y*5�Ms�`�V7�y��>�4
��^��QV�(�T�a��:@k�t��_G<�8A�t�.$X��;x譈��Rk8���;���[��:���oԣ��V3АZ;��oITD'\�*�.f��N�H���Jr˶mM(h˳�?��4ȜL�oA�����|�b�7��S@L������NㆮJ��A`h��!h ���9�� �
!{�w-W#A����[}zE��D<� 	�w�����{��uH�Jӯ�)�d7�֑<ZRV٫�6ą^�P�*>�,���r$�Ol��
��U�e�uYj��8(f����_�n�P`�JvB�v����D�A��c-Ш�\'<f|?y�s����7�l����ko��<��%T�f
9R�FVK$̲=m��;M?��u!aN��@Z]W�E�VuBP�nX�^i:C����f����`�N��Ԣ�X��b���
s���������t(\է,["h���?c6�k��>��ޞ�e�x{	
������𿟣�;���<�!aA�b�=*tz�6�H�����R��Zs�~�`��9$0>���"��L?�v��g_��/���O�oh��ɢX�7�C��̝�T�w(|��_tB�(���(Ao����;���9�!�����On�#]���
�*���2B�y��9��
�F���о��so����H��,��J�L���KҜ�z�(9w;����A@v78���>�g�_�WP����|���>����Г���OW���f}���k� ŀv��K�1��bȱ�e;�mzK�yNDN���w�s?�\�OI-�o��h����.G{���(��r�\�.{��U�G� .��t�`��+�+ZVd#F�yH�6N�&B��jU i�2�a9�s�U} �Sg��w��{ME��O%����z ����ӡ߹��R��֩ �5��F�����uJ��V�ҡw�fuP;�n|���6<�r�$�$l�n���Yx3��?��b�a%�Ж7l�B5����Ʉ ��7}8��ྷM�!�AO��.|Y)���5�?wjw�9*��^]j�I���=p����;�|? �vr[u�n��;_U`t��6��K)��Eם&���WO~'<��<��m��� ���<����!��{cGes'Ǧ�[ѦN��I����:�	��^��r8p�iN���(��V�]s��D۵�f(tM��T/X�%�w��V[ +��Jq����)�C[���*�&�cן�wt�
>Y�_�y�z��wPh��'D��%>Y��k�'K������ ѽ�{C�t��p�	`:gã8�D���h��^{��g�l��A�i��+�R�tz�ܛ;!��Gp3d+5BYo�t�U����](u�aU�­H�=q�5�S��Q(���F�m���L+�(L��r[v��A9	��X��� B��`��ϑ��W����G���7�����dê�����Sl0�.�h�hN��A�� %)��o���܈�uO�'�gz.;&�V�5C!.�N) Y���F��:K�6$�Y"����B�/|�8b F,���!楐R�'l 0r\i�l-�!Ó�@b��v�GS�B<��    �y���̐��3!Kg#tU%0d��L%)��D%!��=D�@�Vf�g��y,����?��ߏ��yL��̂K�^�Z${��T�Dц��KJI񣮰���P�������l8>51�> |1���E�4g1:*"�K�0��V;#;�
po�>j��Cl
����-��:|0B*ν�s$6٧FV�X�ۨ��zI�2�}*�{�Ċ�K�5���>fb� � ���,�24�E���^�Z���]��YPc}���.`<h��~�*���sD)�.&���]3�t/�"�t��>�<�Q�;�f7�r���0E)�4}1N/'����W!m�4�g�w�GWO��B%���(��i��M!��51����k�cyIIn��{��UJӦ��kWf�.<�|����<�̓�E�CطEš.	I@/�Qk9�0�����?����I��i:�r�7wM����0k�\�M /�Or9��}��"�e�%���?�>�X�G��v�!(�V�NeеYǃ�͏Q�yv���p��]�#ц���[n�аU�ag�`���vohm��/�y�oTR에H}|Fe�k*Cϊ~�r]��1
��6���Fo9���\�b��y�h�h������D�EX��s��ݾ[�+{]��ތ�U����GY��c�0V��K�Ƨ��Z�m��Ĥ��~'�h5}g]!Cڅ,���hN&@���'���`�P�l��giEl���6� �;�u��`���#��)̓	�/���n#pE����W�:R�W����(��H���ڭ�8�v�9Z��c�I+0�. ��y��Ea']�ed��;�B��3rQ ���8 GJ��Q��bc�%:[wI�M�&I��x�1�;h'���$򕋩�\Ŕ\�S��� OB �r�����	��e7J��޶�(ݦ�C�CcQ�Q�K��LE�v���>�S�3��B�&tE{yi��� 
�$���>$r&��J ]&��t��L�U���7���
p� ]��:Z�\B��)<�қt7 щ�3$�;�W,5��P��x�WԴ$4�^v�4�w�2��+��g_܏s/��<� �"�s�s�9�Bf[�_rI��o�P4���@�@��un��TV!p�w���ύ�1�YQ��g�.�������.׭�/�|o��H��#�_��kZg����|W`�}�b��<:�{Ӎ�/��N���A��*�L�ڧ߃N'���EJ�I�� �?@�9�9Ѵ�u��O�2������͟�z*5���L?r���6{�7��B�a��/�	�#�W�͍��R��&�-f��51gY2���<dr��A�T���	T;�CT��?ة��pON�j:xSٚDbq�b��Nz
�X�gB�u�aːrHI�J��Z�"��Pǎ�h���^xRZ�\6Ǿ���ѱc��.>(^�4M=��P"��<o�cBf<�%�,���UGӡqo��C�<������)ɕ�`�	T=ɔ܈;�H+
l����Ht��a%:�o���D��W�҅LA2�s��S|l)����K@���҉YI9;]��1B���3�j��m���N�6������.��þl[9m�4V�>� w4ALm7}�]h��+�/6nx�+��lzv�GA
ˍ�؅s��oB�׾�4%�0����B}��!�� :�76J^b�([�e���R�U���4��=x�<�ߝj�(�NeZp���񥾎Lޯ6NIFap���M'2��;�.��� M���%S��s���+��[m�,K���<�ĆbÑ;/Ml �DƅPr%Q ��~����G.�$gx�������섑C,-�\�!�#��ھ��N5h/�=�"zo/��RR���;M�hB,{� /��Ek:���5}�:V�d���!dEX�����k�57P�O��N�qIe����Z���e1kn4���,�o�Q!�;�i�����4�x$�C�e�I��;*���Jȥ:�*�R���F� �E��$.U�#N����I��$���F���aKm�5��$0?�q�,����_��EZ��,�ˏ�y�r5$F������jY%:�F\<R���D#�'Ghm�ߝI�`Kۨ����F�oHG��CBwq�<e���T3}A�&��C
G�0�x��W�q 8��s���������9��ԁ�	��`ܑ�H���v�+#�|k�;�f�e��d�,�+�-���x���Û0	D��v�~_��-���T�w��#I�i�O�F�ݷ��!����O�b��:%���ٸ&�-��MO�N�����Bzε���ڀ��	nl�~MJ;N�R�*2�YSy��J3�ծ7.���*r̃��|CdA�~M�� /�W�Nꀈ�{/Q��-��`����2�X�C�����ki�nAIp]�=}��x"C�YD��2b�#[�E��/m�f����ƾ�!�RQ0P<��N�(Q�6�J���x;q�Q@!���<A] "�Ҵ��-�>�|��ۻ´�r���t3��H��t��J+z��@�A�H�����5]A,��P�>@ר����muJ��3$J?��e|}e^�����ezT�����<���ێ��"���͜ ���Op|�r�)4q?��M��B�Z��z5��D8��7�r͓�j�����tVrqӺv�>��3󜀑�d�R9Z^�J�xV���xz��[бEk���m��[�M��W�p'�=��N�\����]#�,%yh#Z
����M�!_*���O�f�~�͙�w*p�yȓ��<�m�N�!�Z3|a"��g�^Cb��_ѩC��'���.Lz)W��Ǒ̢�ϲ������E)���h��[�ݸnR�.~_�X�����������H���F��zJ���&�&T
���\)�[40@a�3��>�da	��L��ެ�s17-�>j�h�w���z�|��Q�4)��w�-�2�Ů��M�-hW��m��bԖ���·ne��[�B�FH^�þ>Nos��H�7��аJ���7��������"�@x�kWh ~� �{{Ɛj6�딞A��52���$�E�6۬`Q.腪Ԓ��1bO�MnO<3[��Uv�E�Qz�d)�^�]$�dN��@n�<9%is�8_s�4�^��cB(,bU'�ަ,l¶�B�>Īɞ��HȚHz41&n�W����Jo�W��,�UW8�%`�OF�g��s�6�uD�-OP ���C�J�䞎"XX]l݂rO�y�2�O�m��cQN��}����w]s��d�XH��2�o09K�Z��~�Κ���T2l ��]��H�b�BEx��J���Ǟ|�@UW�H��4���!�5V�p2��39
�4h}X����QÊee���6�ۜ.h����e�57�m�,�����u�<������Eë��k�@�9�\���4��ǁ�Jd�s#�����i��;���F`�nx(W$`\�}�3`��1u�R���'�m���<f�z�I����������������r}��1ڗ��u}�"6�#�G?ۈ3����a ���J1���Ju��4^u`�v���nLmRf�]��F���[����!���&����k���Yn(�;�6��MN�3g�	��UF!YfX����[�0�=���c�����}?�����N�'f�M�<��+8�)]�ē�`��R_�_#<�*� E�/�S(���U�(㸨m�Z(�!6�3�O�y���'�p9�٤~a[G�р-�׊�A�"���쥭.!a=��#�<�׉@�sǢCm[��] $tb�<�"���F�-�~��9���� �UJr�>�B�@/ǲ1<����p��O�P㮑ԈKy�7�y�b��A�b��/���o�9�ޤ
y��w�.H��`���`���1uN�:<;�>GG�6$�f�����W�d�茠��.�d�UE!� �&��6f�@����0)ז�I��MDh*�m��'�M��:�)9�^I'�@.��z�_�^26D<�V4"]j�%^XHcºQ�tDS�C~�Ɲ����'N0��X��mW~�    �V����N��/�Ӣ�gg ���C�%�}z�]F?@{ɶ�|���b�d����Jn�N|�O炀�'q�&�i ҄}�Q��������f
&tn},k��硵+�EK��E�����Ęd��]v֜����E�[J'�����͉���=i��S���r�K_`��"��=\���Vh%�ԩ 	�n�T�#�&�V�1ux�,��Э�D��~b��SH��6x���� A�����'n��o���'bx%A��D��>"Tw�Z�c��|:�Zf�A�J��H�Z�/�y�(i/?1�"�T.�S+��X�\��*�^( a��Gr��f�����V�r]��k�3%yd�G��c���1��_w�Xf���WrhRzJh4�W;ya�s��[��<�m�7����^M�'��@t�lxhZ�&0>�Da|f�����:��/,ɲ�I�v>��D����B6�ċgrBA�9�y_O��g�W�
)K�3��~u硡2��[j���!��9�]?z_lb�$�Țg�"����J�@Ϳ�_J��Q�L�#�C��rC�E6���C멵�aZ��B�.�t<g�kfIay�DN����;����n�*Ejε�Ҁ���!+�P��K!DɑKzԹ5a)|-�Wh���$��iʚ����:O��X8^4}�Ǧ�1��⾋F�Ӕmt��1=mu�.��,�����h�}*��Z�X��9Lzp�gO���l��~�O�3��N�};�ju��j[bq���4&��+��7�?Low���q�Lˏ&�ڥ�9�` }v"�Xd��=/�j�����{l��L�M�Q���O�A�8zRCh�n�ӏ�xAۧ_����)$n$>U�+�+��W!��UC{V�[K���x	$��|�]��X9�!�\���b����)~�����P)��$D.7K�M����Ǖ�֦���rw�$l����	`��<��)k��-fb/�^(I�q҃'O�Q�<zJH� d)Gc�\3�;�wz�j��۽�}sRr���/?��l��c�А"<Ձ��S��}�G�~��l"2�^�7b���8��q��.֟�:�G�r�`kž1�Vlv���H#Ɲ��ŧEl�)_-�h�7�܌ӞT��=IU�k���
4u��<�yMٟb�lV����v]C�m�Վ�'7���'�O���s�
b�W+�i��=C��ӫnU�Ui����%4�Ɣ'BMv�p^��lL�"Uڞa�~z;����͐�-��e<|��9���X�e�W.�hbS�*OE'��5y�4�]!�41�.Nma�&k�`/�r���#�,�3z�� k
�m���+�D,���]Z*F���gj��뭌
A�*�P�8��jH]�Q�#�� �k�\+F¿���Qt-� �[�����u��A.W<<y��l���ٓ���39WY	R�9Opw��O{\�ws}p�^d�����5�V��Y�fwỖ��64dN��ՙg�k|p��e�3�\�t�,y��$�� �.��Jџ"	]�p���V(�\��X�!�4��V��1�-N��!;�h��O�x�٥�-C���ZiQkKSLy���\�?���H�)��z��ԓ��k.ҋ.zƬ�S�+=_�6����3t�Gso�"��9�R���n���_+�DV���"�;nV���ě�?F����u)J�y��\�+���u�Ԓ���^+��QJ��^��At�y�$�>�è��X�m]�,tg2^n�rَ�D������*<'9�ֶ��־��6a�
���R�(��Xr�����#EO&3$�Z.���'h�el8X�a�bd� �s��d(oG]�4�I��c�cL_���=�i:Ԛr����r���<���?�<��O��0x0=:yct�iv#W2:o=�π�yqܙ����c
]QZ��m��7dS)la�'��R��q0r��@tw���">�w�(���j�ң�VgwCQ`��ZK9�~��x�Z���r,��b��_&eY��chW��[ڿ������]VXUK�D����x��6���f�?�
OM^�ԏc�+WU��ҷ�鯲���Xf����2��Pf52�|V�j/��(M=׎��d�ť�|�9�c��\�x��^L)}&��S�Dr%t�.V$W)�e?<�K�kn�3"+���Wb�E0J�4��cj>o��%8]zb+7`���%u�%5"\�J�:e.�Ɲ��D�:���qrN��Mz#9�ڍ��M�$'Uӻ�v���O�r����F.������Љf����;���W� h��A�6K�o���YьW��s�&�I����z���)��L^�J���[|�:D��ڧ�Ѹkz���t�O�lɝȫ�o����O[.�L�?w�O��"}�=��G�_5�!�&B�������Jv�:�� �x�H��a3eX�}�u$y$�`�dY'�@s������\ϯ���I�6Įz�Ƥ�#�����'�h����9��)�[$yY�C�^W�5�8 +��4�����c�� ?;CS;x�����.""����6>!�bx�b"r*����0�qV9wt�G�':�#����{�"����%Ci��z	�����!�ޥu(ߊ�j��`�n?��!Y��Y��s��u0�0�o�eO����-^t��f:���Y�����~pnpĆn��,����m��ޝ��`o����}��- �쏃K���G5Zݶ����[ߦI��;kc�g�"0T�gaQ� C��F5?}޷�O?1>OJ�ck�'WP�����jAi�(�$�� ��|����F�-�E�}��)�2�d��wN\�@���vC�<���I��kL1�<1�8��t[���-LX������^�J���KR��*J�'��,���˜]�KC��^W����;zz�0v �-Ip듓/M��?�R��r�.%ϳ��[	nҟ��y)�?��+Z�xFb���#�x�Ր΁����4w:w����	m�v�Sl4����b�,����������Q2#�Ԫ!ɟd���b���ϡ��Wto��{���26�ȡ���˅������򨢊�+��Q��[�dGw4�;��}�*��'�ԕ�\��)j�P�7���N�1Q24����mH�l4��dh��]G#a�u����:4V��t��,���<>��͏^��O�����2r�RB���÷��Kº��}�kP���P��x��sHp�"~^ҭ��p\�X9Ԩh�>�W�)���1H]�ϟn3t�d�+��=Gp��&r��*�Mv��<����5���%r+v�C 7��1r׳Д�~M�e���-�@��"���R���k��t���ӂ��*�;��S�\�w���d�:��4���|U�7�9�[�! �F��w2�Q��*-�?�b���F���;�G��h��h4~�2��ѩ)b-�t=�Ri���4o(BsQ}�)U�e�������E1��$��5l.q� P��������� O7�@��Gl �K2-�
lF�B����	�k�g4i�u�&.�%'� PW5cy�;���vg%�R x{��B5 �t������4:��3D�G��>Ӟ�6e�hH�S:
�1�jJr���r��If���ʜlz�i����z�<`V�~�`�ov�J��\x[��{z5��A��	�~���(A���^!ov��bKU���F����(x|Z�b�'�-EBu��ra�Q�Z�E�:^������%<��TC~��G�l�d�&x����@��2,���⣕9'�ܽxN�@��ZyTf���w�I� _�P�\!�
��}w�&)7������~yi~N!�K�iR��S/���"5�|1�G%,!�셱�������z*/(�*ϗ�Ғ��qy����y�|w Q��m-� �e���k��w�#yx-��;|9A m񣧞䝽�e����ڌ�?�{!i=}1z]�ߧ/8Sl���a�><���}I��������H�{?�q� ����S�*�PU������3`��z���-�2p�����hD�R    `	y�-{z�l+� +B���{J�5��(]�@1�!���xS�c�Gx+��~3E��J0�w��gX"ӝ�=ېfH��8�Sd��H� ·�
)#��Œ���uɗT(d^U�wN�G$����]�%=�8ɹ�;�j�e�)I[_+��@�'�7���E��Sg�J�������	�(�i&�y�?����Ғ���jޒ;p�����f������# d{��Cm�*I�a�#���T��6����t��Mj�Z/T�����r=A�:�Uj~C��7�S[w�ʇ>������9� ��6%��?���+S���<�V�״�C�s�E/wv��������qy9���ky��@ʲe� z׎�[��)�p�)#o��˃;��ڳ���3N�)��ߙk_��}�9x�� �G �>�#8��pez~�}�W{�H�1���0輨nJͅJ��7�C�hگ��U�8�A�����:|åD䭠-Au7���v��ݺ�ͥ��`��Hsofg���~'�ʊ�������);V���Ҭ:�,1K������<s?L�Y��\7Tw��5O�M6�������6C=�����eÀ���\yGW�cD(Z�"�*���)�����r�0�ʧ�w��v�2r~2���h�r�H^g�����Xz	WX}����+T8|0��y�U�l��=5aMY����@�%��*�lJҹ�9�]�Q"E\�%_Z�;�IWy˭�iy�o�$]jhVl� ���6�P��|B.7_����*�C腸S�����+"�⍽Sq�Y�÷���N��[
�����?"Mk����� �w����<�����﻾�c�[��!�J�A��k�\*�3vפ��s��X�п�HoT���k��߹�0"��NO��=��j������Ƥ��� �Q�Y��0δ������SrՔ{'\�~��Z��CC�L��@:`��DA�C�-���{� �3ށR� +d�SX�0�1)Ò4��9뀮�9���uƹ�`�k$�5/��ϼ&��n�ˉ{�.@r}�l�*9c�w�� ����S?R�((7~��z-\zx�K�&�<ӗ���۾1ǡ���m1d��v�Hȵ��O�R-WbX�7[pg�,�$'Bw�<�����iǞ\�/"��^�Z̀��O۾�����&����C+:�7����v��1�p4�P&��KA,J�h�R��LD�Cj=韮쮑�:�0�*Hr[n�HAz��+�����b +q	Rr����{�k&ox�Q �>_�Tw�]��궓 ���qSLֽ��Q�K_-Ŷ-[N
�(�tC�W�L�Nx^�>�꠷�aT�F�����m��}'[^��fɢq��ٸҞ#�3�~��]��� �Gd�MH��Q~h;'����ڱ?Ɔ�U�M_�B@�D?��M>��/�s����x]��6As�� ���\��:j�P>��!�"�{�m\g�h���a���ч{	S ��!�螴B[��J��HD�R����î�Kc��0���(�P	�I«�+Fe͡{S���]��<>�����k{��o����B�$���1[.͌r���J(��n�(2g�^��_���[+��e[ujC�_UnP�ǵ��Oj�b	]P���!�;s�ml�`n��a�c'gm=Z�I�`�4�]zC���E�A��.h��"^�J�����0�(�ej6�	����������F%'����h��n�-��c�e��Ĕ�a����;W6[F�+�V��ЄxL!����$���hN[I	��@�f����rIAzHn#ۥW��D9~L�̩�r�iD$��as1t�Wt�G�~P�n�� ZZ+�,���	,��m�ʘ����7O
d�B��� D>@�᢫�:�ɃKA�<ǭˡ2�I�]L)���&W3��T]̾�ݸ�R�W��7��˟J���\ʽ�R���[�<DJ.�Ŭ�$ͨ���Rp�j�$M��/$������7�z��3��J�;��_ ٪���R��~�� ���E�9�2�Ŋ	��m][pU��dM�|��l�g��z�ֈ��ᚚ���A�˱T�����Ty����7S�\e��?�缲e�r�]��IW!ug��75�A��6������b��0'� �%m�J2:���P��D����7Gi�g�O�u�����3��\��.�� �����Gp�ҺX��m�����"A�����r��ob������[n��>�-��P7o��oDl���XU(�� �ƀ��it�醇����-`S �Sfq��F�/g�qNq�1�KXΰ��누]꩞B�(#���lQ�Atn��#���̩N4}�ͩ(��}��zp�>&am��4�6�e�S����p�P��}�u[�ܣP������	�����A#��4��0u|��d�J��(J�'�\c)t1-��4�@6[�\d/�U�c}�îb�4��\�k$�#���!�F�y�R<�ãzP����¦��Z%��M�%@Y�B��F'�{߻�yN�����q6��9�|��`Rv���B(cC��Z�:��ܜ|�-g�l(�"Fw�M��@a%��l9'��(ρ��F,���9A.�D���$�r@đȜM,X�û���I���!T�ViH��p���hɷ�ȜPR�  �ˈL�%<�ިR��<��K�F�\i"� ��E��%͑%�F��Ѩ\q��z_!�>��8�\�!)��4y/F���'���4/�+K�oˈ|&�������/>�z��{�-���SՄ�D�(},���׼�2�4����A�n<|B0�o��goR�Vtl̾�IC�M�W���b
l%D��r��`X��rA�����]Ji	�^��ݮ �|Α��FI�`�$IO�+���gMͨ�H���'�S+��^�1��4EGӋO� )�ܷuf�'�f�$�0�Oɺ��/�xj�(���F"S���鄮�?�ca�T2�T��uPZ�2��/^@*�ᓽgp䔗���,牠�G=�Ț�\�t=�T]
r?�Ҵ�����#oJsO��M����Z d�C�s����#ѹ�cD�{t�lM�����{�%�cE�]j%����*�VP-o!�2�T=��� _����v�<2�(�@
�c�3�A�DE�A	����4��`�?�H�BЇ"�c�$�6G^N��3�mY���J����P�����0�O=]܅gj��?1>��vwH�&{e��3�;��Sx+����y�y�9��M�H�F�1���`XT`X�M,z&�F����7[����t�e�<�,�\�J�h��Ooz>M�ZN�1�Mr)�F�\�p�/������-۰�?d��)<�Q�\(
Y�yl�\.3i[�Q���/s2P�9�3�lwDi���`�SZ�D[�������{�x��R1�X�R& w���e������b*������)�����q)�6��
S��+��c�c�-+羋,f����.�T?��L �j�N��5������Ŋ<��i{
��q�z���e�Y��YCQV(qڏh���_I�3/C*ͮG9T���:��TD��HP
�L>_��c9�N���
l�V���R����U3�T*�������cx533�@�l�2�@��F�5�W�T�Fr-v�Q��G��!-���F��>�yCn#��)�)���T��v�QടD3=� ���Ղ�~��>ׇ����ѥV�PVs�T���^�Zȳg􂏤XL�U�n �����Χ�9�eJ��XK��t�,	}�W��	X���4z�A����E��E��ϩ�~��aM�d�96�[*ѧg�%H��D�4r(0cU�h�������"�/�`xag��(.�l�"���p%�I�U��mfC2�z�+���-ێ �U��Xc�����x������(��j��K��Ol��Z��K)#�m�)kN_'����v��c�~��1�ފ�}�&��t"5�89�X� ��|��qy^������?�ra�����M>�R�\�b��Q    ,w]�^v����x}��JAx����|�,([������@j:Bi�>+Q�X�e�ZN�,T����v��
��Q9�t� �'r=���O������6�Ӹ��L�Ӗ';�]j�<�NŊ�c��}��n��0a1J�Qa�P�|$�O��h�kn�qc@1��W�;����/��`bdB�s��RtϐWJ��w��B>���Kk.�^ɕ�GS���CfP�L0�'��؀n�������-��dL�N�(��A�K��"�����§+��BS�+|���=��S0k��#V�Hj����
л�����p]�ь43AU|�O���h&ow��-�`Ф<z/-f���lS9��H��nI�
�m��GAn�2s 7b���*���b��/O��i��/�TJ22���(���V��%��ޖ����׉��D)77�:ݩS��4�]���z����ڙ:I���^�@R6�ơr���z ��ӑ6}�h1NőN�!-�>]Ro|��j��GߚX3k�JJ��A%6c�����6r�������S�H�e,w�<�[g�9�!���#�^0�G6�c'�*�GZN�����}�^�Il���Q�bs9ON���Ė�s��,y��^|Ǝ>���j&��@�Ҕ珼���M����7��	�P����F���HQ�L$��y���U{�h<�q:�tƱk��ƀ8_��f�^ݳ��U�&љ٥P ���t��6A��a�.`��Q����Β�]��8ߟ�8���?���������~�3����)G�����c�[1�U��AMNi^��@��pr)#�����wf�R)[����Ϋ?��`q�PL!��m���&F�O����i�u��oB��� o{��ފ砦�bjy��C��Hq�����������K��i�i%e��)��7�H��Ň@-��S�gr�b��Cd�
Y���~����R4n�D�A8���K	-ħJ�X���eh����Gd+��h��ceܴ<��,;Ê@��!
�Q�$�D�h�!ʣ{4��<)�F�ד+�{W�r+��Z�zCR.	�9����f�D�m��\�:g�_��Na���E���C:#���s�dPH��+)`<3|X��#��5������SMn!�G�m�D1���R�����&���}y�ju��e�������{	��A�u�[��Q�0rDx0mOÇ���2�9��&���A�-��7�˥8f�X*��U��(,U0�p.�9�Tw.�sr�T���[��F5�h���Lf���)z��ߙsJ�t���;��i�C�]��҆5 �4mh�+�"5���JK�>�����U]C!ِެ4�#:��i-��h�3x�����a}�0@]��q�28��`���t�.��pO��=~,�ڿ�����w��dH����K���������d)�]D{Q	aĘ�md]�E_{E�ȕ!�@��L�]R��p�Rnt�{{*cT��࿴�7�,�c0n���]	#����j=�`�]�O��:��ZS��X���x���F��A>�@��ڗ�A��D�$���F��{��G��4"WzE����{�UT6s�Y��S���ɞr`�4��沔i~#h����R�N��N*�xr�{ �H�/A_�`2��\����^K��.ѹ�b��x�f�&��"r=`j��X�MLW�,.�J�cL�.5\�f��� �7n�
�R�؃�R�U�&���fY�^]F�'aKݚT�C�h.	XJ�79���,������S�4�' 9`B����י|wԋcS�?m��c�0<���l����`��� 0i^C��#͘�G����}'���>�.����LK9w�
x��oKW��ƫ� e���ֶ��F�3���cJ�����٤�����R\��"Q'�)��̸@Ϝ)����+�+�4�)_/t)Q�����g �K�"{qu���?N�ۖQ�4�G����GZ�]M���u�lN"�4M���=��gW�;K��k���(w����\y*�^*_�o:�F���?:���\3��z�O��z78��}�~�f\Ԗ�n䅠,,~ ���+�P�Sw�Цo�C����0z��ʾ\m{2aT=��Nΐ�'�ŁY1�tx�Ο��e�����bp^�q�����w�Ě�������4ȭ�-O?u8Yu)nxT�g(��v���`���Q�k�3ꌒ���E�}3�</A&v�#�=��*��B�¢&dX�|��C	�����>��-�����L>��JX��k�����
���Oz̅�a3���`��-���$:X��h��fd1j/����gX�Y�`���� �
p

�X�Y�m[����RE��m��
�����C\�Sfz�����A8���?��)/��ԩ�)��0ڙ�K��ך2����-#�P���rI����7�=)��I���cx4��&"9�?ͩ2m2�L���rJ��O��	��^���3�[�!�K��6���g�,���'�=E)�Ҫ��!E��R�RTG�L��c�겒`�N�����5G��~4��c)h��l�)"n�₥4/�3-���al�3�pz�� �T�r%A�PʰѢ���V��X���b�Úf�.��+0��������\ʳ"K+c!`���H/����.6,��oRvFk�Ũ�5�{m^̕
��[�.C&H�ہ�-�R�o�_�M�8k�"Y؃�S�x�s��N���"��>��X�!�BB�) ��L|		U�� m�x��.�4O���1�&��֤2�Ti��W�y���AG%T��6=!��F4ݾ۲�o���u-�n�@v�|wwfq�����3v�8?�k6����H�$$S_?}�� )g�\��� ��O�B�7���4{g���=i3���T��M�0�����D����'�f�x	;�� ���Z؆5�����	���P�Ǖ �z2e_�?i�a�0�*���l]�����h��9@�U{�s�\@@KJ��~��Z���h�� ,�k�����3g��i��W 4,G��/��[��#"`��`c3�`zW}J��x��%�p	��(���� lF����K��b�B�?���"SrR#^�s�<x����|�Y�Aܗ��8��a�!�p��F;x�!O��H�>��30e3��''8�O�AO>`�꺄6��&10�,�t��"�Xz��֧'3�������D�L\)H����>14{�'ڂ�+��'��q�h���&�0�� +��~����>f��lw1V��p����䵾XVxkx�������� �ƨ��$�̄��|#,i�>��O�q�E�ŵ�g�|���F��7GD�[N�e����<E�έ. �+�-�a����(Z2�<E���?��8 ��|��Gh��K�*E�Í��>��ۅ}� 4��T\��/�s�'��̽����S��\L�#X�.A�e1cy&2?I1qsl�Qn�F	Bf��A�=�:ѿ���������uV�)i�������w�'�Zd(�n2N�s}~����yb�+^��<Z3?�A�H���."Z1�d�z�9Z5���]*I�既��@k藦EC-�?����>��-,�������5'��h��,��cc���γ��ȴ{
�G�0G6ȭb[���� �Iˁ��z�!`�@�F�w���X�hIPx(�0��#� �7,=�[l怰6�C!�@�oaHk]��9�L�җyL�;��%�$`PO�gv��,��'a--�ﳎ�*C$NO�uQ�r2o�5�/g��3�
s�`%����X���̮|7%�����K&�hF�/��oܡ�mLS�Fx_�O�J#�B'��Bף��ԈJ��I/*�n���p�&�k�^�#�R�pYF�h|��g�L�p�>���}��A	��]	�]7:\�y��S��C�r�](C��&�/�l�" �&yW�ݰ`�ߒ��w�]Ū�)���k8�(�}�$o؁G0��~��||O_��}nVH�W�� 3u!�4�5 ^84���0�`��    �ad܌����aC�_cl6qA{0���qQ+0l�|�Dj�y0kPX>x�>�d|.t�j��_�����t�̓km�E���'��)i�z|S�U�?!�q��[��%������h��CE�8��0�N閴V_������\$C�Pi� ��*�g+��N6�
o�T~��1�¡����A�����@�b[�J!���.�|��2Q��R��k� p�F� �9�=��"���QD<�<� �xN3��0���_�2�G��)����[]�ѿ�U��oOD�9�������Sݧ�9�IE���돈i<澫���\�d�o~�3�=�ߙK����fb�!؜Os(W�~�ܧ3�8��|���� ���(2T�
�
`_`�G��尨$����O@&��"
u};�yQ���b�"��n�[�O�S��΁C	ih+1m[�j)���WO�*�s?��<[#6m�f^)�p��@?�^��- ϊl�O;¥�(�l��> ��G6�,����Y�[E��[� +�̙���/�r�ն�K�#-)�E�9��A�K�gӣ0�k�hs��PFĦ|Z~�%�3���v��Ȃ^�P+�d���i}I1����+f�'>�h͑0��G6������p4n�O�u����M��/}�h������>�4��)ʟ��;	͓7yÌ��`O_L�lj��p����%n:j�E�V�ـ�,�? �T�mpKt`��	����z��s�K����#�x�EH
��b��0�w�����A0M|�A^1�o-�7�0�)P�Р+@�v)E!Q:�0����S�� ����� �jw͸S��=VQd"2v�B���-�U�@Z����B`� 1��)U��vK���PC3�#t����>(�@�+-�QML+<��0(%������LXO�V߫�!���f
o�ڄ�1�3�pj����l�όz�����V%�?���p�r��p�ps�o����r3f��3i�
�w�`���N��5^�׬��oPm�󚺺�������bK|�F�Wx�,�F�>Ͼ�wt��p��;��kNZ ����eU{�K ���i@� �8⚯!v�{�\�!��fY�L��v��������� [FZ�^ �_C|
�� o����< X�2�e��ɶk�Wl=ߋJt�ocZR��L&�v�[[�b$o�d�L\���o�.�*�6�	�/D�w��]!�:I��}��e�6�A)��l�,����z�鴭$�:Y��t.~AZN��Ś�B���Ģ�e*3E�9��)�5���p�A����6x�*@��� ��\���1�\�+�"XRh~�Y_�\t�L�x��/E �'�*�z_ �3����˚s�t~Y���Ғ]��V�֎϶��P,2�̨,�cT�)���Xړ 6���`�� bZ��غ)<�Q��"����`�ͯ �O�ט�Ͼ����K��ae���9�k��?8
@��l�t�8? 3�í�j#������aPq�"�
L ��O�rƌ2�h�s_K����ჿ����)��� 4���� ���'p��,�ep-6j�k�� ����-�����GH�&�KǺ��#�O|I8��*U�o+��}��Vh9�����^��f������7bGu
@��x�u��/���a�����"�M�������9N
��N�dSw�V�L	���_!N��m����s��uH}e꽯��X��w4��;�iݕtUh���b7RW�jл�Vl?���������� ̬Q�a0� �ƿ���<��Z��Zl&���?-b�}UA^�}�٪8�`QE���'M�-��z�X�ĝ���@E������,<`�`41,v���u�X0�ȳ�����?|<$�Ä��H�w�}�a�P�ܨ�Yyl��'{uO�U�c�V�� f�r���hw�u�i�&�*�Y��r���_���n����}�E�1���88&��t�6��
�>�<��L�������8K�-d(6kx���=��t
�:X�OmJ��q��l�s��]E�P��Z C�j.��#�
�@�����a>(S?ʲ��V����F ���!(2�w+��Q��z����]��-�`C3��g�Ю*sk�ͨ���m�T=��bV�c�p|
"���[��o����vǼ*N
�'_�g�,� p�i�+��G�T~�,���Φ.��C|���>� H���a�i���C��t�F������2����!+5}է?>�U��3��F%�˳f��}�)��B*YAfF��e�N��g���j��pPNހ�>���*�'��0���l��֗}���ȣ���!���Q)�q+�Q��F὿*���z�*�=�8�����y| v��� �E�h3ಫ)�j-p�2Fr�
5���%SK����M���^���k|�����b����AP*����"m�Ӟ\b8�L%�#��[\"h1��C�0ӬA�d(���x:�̾9F�M��b��ZQ�ti,�� �2��vU�b��^���;5*�'��ż��q��&we������;^��"�G_2/S�i����<��\��P+����~���3	�~5]�m��	�܃�Ƀ;`6] �I�L���y�]�c۝����H�ߕ���A�5|%@�6΍�`S���a����(����O���� ��������
n���p_o,� �G�p1@��.L���8g��{���������U��YO�?�]^����^���=�+i;�t�@�BT�r�Ic	d�pȓ�)3&G��S��������LE���|�W�W��۰u�9)��EA�L��̥d�Ml�2l�ܡ�+)����� �@�.�M%�����]��F! ������J����/R1�|�ǫ����_|� HsWv�oӌi�|�! �h�U|"8��i*Æ�6i|��_Ѕ4��aN�eoœ�0nN�)�}C�q��
�8�r�G~@���0|��S)�ӄ�a�"3F:s�}��\&����.�/��=��<�3��鄪����J��=&�p��0�G]i�������D9�E$#�
8i#��.8h�3~7�q�J�J̱ k<��=+�����`� M
 ���e ��y���m�����O�1�;7	6���0������p+Q���/��ƀ�E:q��0���K�I��~A�.MZi�'R��C�uu�ݖv��1gʼEmN��f�@�����P_Q]��L%���ZP	N�
YUF'um; ��0/�1��RiX:D�C�Bu��~����f >�b��#B�6A�I�m_����;�y�Q�Nk���"�H���1�5[U�Yl8l�+A�9Sw9���sC���O����a�A���yh��X��>a���f�:�@;�_X��ɷv���)��Fy���c�y�g_��:��F�6b��'�O�.�}M�K.�k9<����)��h�_��ƴ����q:�5Z�*���S��N+�m���a���K����
���S[��i�M�1�2PD�c�2���+w��d!fS�#!�hL_+y�E6�Ƌ[������y�$����^r�����=���e6y�陳g�m?�3�^ �S��ԣ� Oa�p>}1Q^�� ܄玥y�˙��)�7�(�n9�� �mD�1mz.`7ܚ�޵�>*μU�Soa��k()u89��sP$��6b��´�ʹ��.�*��'�Φ�����#����&U��7��G���ag��P[��	0{w6|�) �Q���
2�hC�`6�`��("�K�<<g-V��� � a�����&�kE�7��̖/�%9�OfZK�Aj�e�dۄ�9ǆ�)>3���]�Q}�:�k���j�g��M��jA��B�"��m��v�}��~3�o��z�SK�=� ��{�C%�����|#uKQ���a�à��Oa2��\c;���z3Zi3�F״-<�0����{ �  �S�,�3Q�?��;�H�MS�NK�8h�A���L^��D?�R���a0Dڞ0ъD��LP���m�.��@RG��X�?��b���a$ <lڋ�2U��z�i���6�V�`�>X��'�o��S���:pR+����Z	�^����ڂ_ˈ�Yx�f�fg^��b_7�"D��ݑ��gZyt��6�����a��1}C�Xg�-lBKI����LZ_g�.�<��.��T������!�������Ost���C��C������
W��]�m�5��p���&60�`��LR�v�Pi:yw�����z׀k�(0'�EH���������ka�sp�b�Fa	��� p�~0�ه���S�����h��g�x��_�mk4T-.;����Z\u�{�(�6��5���� |u�.����{ ����c�C4Q�4oc NJ���/~=����=T\�`@�A�eXA0=�C�����O�*!��	�tL[�M%^ˎP� {��a�����z�pt�NA�8�gi�I��۝�L������s��A�:�X(����sX�h���/��/M,��ɘ�V�A^L��n�X8�?�h�㋬�=M�9��fH0�=p�� @}/x�-2�C���o �ݚ�����T�H��=��fK`�`��Ҹ]���� ����7�X�$~6[��Y"^T+�V����k�V�Lj����q���A+$���UH0���֟c����l`�7�3](�[k '�>��?��5c���eo|���m&�J�ʴH�*ݹ����`��� ��r�[Z��K�åGO[�ZM�� �����<�f��d���=g-�U��ᆪ;��x�]|�Z!�@Ě���] M�C���X��ǋɟ�K�(��h��G ��vT>,i�m��� m��i�+E�;�M�]�0��ө�G��]9�ԏL�1B�q�jw�]��ͻ�:u�0'( ���i�,B��,$,"����Th�M����p�4�B����U ! E�6fW٬1���o��k�׋H���(�ж��,N��π�"��7Vah_��(T��Z��7*��,�Wu6��ᑋ=<�0Ž�q���D<>���E`UvZ+Z_�.;���[���u�E�����#��tڢ�mzh���F��FOI�򘏲"�wa/B1 ��CW;��T+:c�k�"S�W;t��0n�䰆 ҤN�
�CAe�ܺC>�"m�[-�S�Yh=}e/����"`S���A�\����v��B�Y��H�����=X51ݦ�s��K�=��&�'������᫠�W�%�PP\A�����5<��;�����w ��/Z�߰e�H�ɛ���Q�kZ��m��J�{���%Ŷ�v��&ū-��|ox嘱�6�緶��_��m��/'J|�����Q��k�}�P��}K� ��b]Wl4G����gi�ݾ��'3�0�x���Q�H٨�ѐX�Ԕݩ+�N�tr�2��s���Y�d�a
Z�K��}�`8V���)@k4"��tr���eɯ�����Ğ���Y3Caf˼���|�p�j؄5��W��j��K_)}�JM����	)��z�J�a;�a�&X�f:�%���LR��C�/m��\����`|lp�u��V��U�<�~��|������Q�-���X�wjB�owxx�'/�I q)Xio5,����f�T���o3�;�W&]``=������j�{�Okk��_\ʱxG/	�$����铯k۩���~���+L��8����3~ދ��VxA0��U^N� p{�V�A������(yPa�21S�h�;���$M��;��w�����C,����r�@ӣ|�x.��m�Z�?M`o�Z����&_��=�}����Ouaz�-[�Χ�V|cQ������ 8@"���f(�DhuR41�\��zs�� �k�`7Yc@�X�v�U�Cd����2�N���2�� �ZǕ�* �It� ���8�2lNL�����BTN7G��LNj��Q��ĆG}_�ymh=\��~��A�����O,�B�uFp<K��.�K��b��l�l3.9R�����!ԫ�}�������8���G�8�������փ���������媽&Å�a1������/�/`�Q�A�����,���@�E���!Pα0y;"�P�>�ֆ�J�o��e����A����!��	�ѩg}@W�`TSX3>�)L���p'�[�fxw�ծ�@�?�`[���i[���Ns,�Ah|�J��@���c�[B��W�?$�G�V2m�g�QK6����v
��/�`���(HA`�����;�7�|���[w����n�����E]W�{S�&F���Es�Xp|�[s����N�$�g,��C�����s�d:bH����6C1Zs�28�"S����i&1�����<�����rGŮs����%6��f������~���t��m�I������X�^��MuD&��� ��UB��@��n<tX�@-�5�����2���Ԋีf�� �3��|��<\���T�k��� ���ya {��8�-]s��7L
�� |	y�2�v/�|����(�t��F��6�2����
�����l+�Ʈ>�Vy6_��ϭ���،�����_�4A��A�R���a��V<$���d3��0)	�g��/�9Ԫ�`�4Ŏ��S���23 }��J»ǆ��W�� �d3�؊5�^G,1�=b�F��.v��a�����?9v���u����kjy��|��.��>�%�:6K�o �5.M���B� ���C����w[X���F��{�7���o�Dp���.A���ho���&�Ζ��:�V�ϵ���@Y���J�����Q���h�z�XQ<$�c&l���%y 5]Sa����`
�z诼�V%/s�.�ȟ豯(��,�P�V��ar��L�q�
(�)Z
b	���A6) 8"ЪE�t�;Z��\�U��˺r�S_<�L- �QḽP\�b�-��Bd [vfP,��Jd\]&���o33@D)y��#����o�w��d����+��<�>��9Do�z1E >��`y��t�Q���'>0y��ްq�툷[����'��P����&�4��6\`��àH�ψ�fq{��8�6�vS9�aa�kAf�dX�t.^L׽�p}_�y��:�Z`�6f���_�6B�F���􂥓���Mێ�W�1��H��:4��Y,`os>[p���-����ޜٲI ��6|�*�z>f���G��'�d: 3`���Wӡ�+ P�j^�E��������=���ɉ�Q�k>����(E��%���l�!t��.��A��%-�q#C.t��N����/�����d�      %      x������ � �      '      x������ � �      )      x������ � �      +      x������ � �      /      x������ � �      -      x������ � �      2     x����n�0���)�OE�CJ©{�=�.��$J�з�۲j�a�~ɱ���o.�dc��%UF���60�x���`�1�8@C�]�Ʌ�J*ui���{C�M����37NK����R�=c��u@Fjd���3�:|��.�|��:�����s��uNm�҆$( $���"'��$R$�T���y ʈ��,>��WO��`P����)�Vg�����v[��M�ڸ�yc�6o��tl�t�gUz嶳�!�(j��-Q�ꗩ?���{�e��      4   q   x�]�11��cNI(����4��}�H��=��A[���iP	W���J�yH�:Z�C$������by�Z�S5W�f��f;��xeZ�1"����.S�p�ʄ�&'��XJ)[%*         p  x����j�@��7O�wbܙ��f�PTKmEEQ)�MS5j4ؤ���Z�V�7]�]fΜ�$�?F��>1(d�O1�1� �e����e�;/�T��>ֹ��i?�xqkL�q7k�6��xc��A�P(S( j�j���w��Q2"���f�82��~]F��I�2��h�Ԕ��P.p/L�꫕��Ȭ��j�}v��(I��~a�::WcܖTIp�Ryng��P �R��ÿ0/��D!-8�5�����Mj�o���� M ��~���$��IoQ2.�nmU��J��pe�J���])���O�	�p���x&'<Q��]��(����J�Y!�@rq�p�e��Dqa�v���U+v�f5N�<ۖe}#,��            x������ � �            x������ � �            x������ � �     