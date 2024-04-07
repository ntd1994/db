PGDMP                      |         
   tinnongtod    16.2 (Debian 16.2-1.pgdg120+2)    16.2 Y               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    18237 
   tinnongtod    DATABASE     u   CREATE DATABASE tinnongtod WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE tinnongtod;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    5            e           1247    26440    enum_advertisement_position    TYPE     {   CREATE TYPE public.enum_advertisement_position AS ENUM (
    'top',
    'left',
    'right',
    'center',
    'bottom'
);
 .   DROP TYPE public.enum_advertisement_position;
       public          postgres    false    5            h           1247    26452    enum_advertisement_status    TYPE     W   CREATE TYPE public.enum_advertisement_status AS ENUM (
    'active',
    'inactive'
);
 ,   DROP TYPE public.enum_advertisement_status;
       public          postgres    false    5            k           1247    26458    enum_categories_style_show    TYPE     a   CREATE TYPE public.enum_categories_style_show AS ENUM (
    'news1',
    'news2',
    'news3'
);
 -   DROP TYPE public.enum_categories_style_show;
       public          postgres    false    5            n           1247    26466    enum_category_status    TYPE     R   CREATE TYPE public.enum_category_status AS ENUM (
    'active',
    'inactive'
);
 '   DROP TYPE public.enum_category_status;
       public          postgres    false    5            q           1247    26472    enum_category_type    TYPE     X   CREATE TYPE public.enum_category_type AS ENUM (
    'news',
    'raovat',
    'menu'
);
 %   DROP TYPE public.enum_category_type;
       public          postgres    false    5            t           1247    26480    enum_document_type    TYPE     =   CREATE TYPE public.enum_document_type AS ENUM (
    'pdf'
);
 %   DROP TYPE public.enum_document_type;
       public          postgres    false    5            w           1247    26484    enum_history_action    TYPE     �   CREATE TYPE public.enum_history_action AS ENUM (
    'get',
    'create',
    'update',
    'delete',
    'login',
    'logout'
);
 &   DROP TYPE public.enum_history_action;
       public          postgres    false    5            z           1247    26498    enum_media_type    TYPE     V   CREATE TYPE public.enum_media_type AS ENUM (
    'image',
    'video',
    'audio'
);
 "   DROP TYPE public.enum_media_type;
       public          postgres    false    5            }           1247    26506    enum_news_status    TYPE     L   CREATE TYPE public.enum_news_status AS ENUM (
    'draft',
    'publish'
);
 #   DROP TYPE public.enum_news_status;
       public          postgres    false    5            �           1247    26512    enum_users_status    TYPE     O   CREATE TYPE public.enum_users_status AS ENUM (
    'active',
    'inactive'
);
 $   DROP TYPE public.enum_users_status;
       public          postgres    false    5            �            1259    26517    ads    TABLE     I  CREATE TABLE public.ads (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    url text,
    "order" integer,
    imageurl character varying(100),
    status public.enum_advertisement_status DEFAULT 'active'::public.enum_advertisement_status,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    "position" public.enum_advertisement_position DEFAULT 'top'::public.enum_advertisement_position NOT NULL
);
    DROP TABLE public.ads;
       public         heap    postgres    false    5    5    872    869    5    869    872            �            1259    26528 
   categories    TABLE     �  CREATE TABLE public.categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    parent_id uuid,
    slug character varying(255),
    is_deleted boolean DEFAULT false,
    type public.enum_category_type,
    status public.enum_category_status,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    style_show public.enum_categories_style_show
);
    DROP TABLE public.categories;
       public         heap    postgres    false    5    5    881    875    878    5            �            1259    26535    comments    TABLE     �  CREATE TABLE public.comments (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    content text,
    news_id uuid,
    user_id uuid,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    anonymous_email character varying(255),
    anonymous_name character varying(255),
    anonymous_address character varying(255),
    rao_vat_id uuid
);
    DROP TABLE public.comments;
       public         heap    postgres    false    5    5    5            �            1259    26544    configs    TABLE     f  CREATE TABLE public.configs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    key character varying(100),
    value text,
    type character varying(10),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.configs;
       public         heap    postgres    false    5    5    5            �            1259    26553 	   documents    TABLE     }  CREATE TABLE public.documents (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    url character varying(100),
    type public.enum_document_type,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.documents;
       public         heap    postgres    false    5    5    884    5            �            1259    26560    media    TABLE     v  CREATE TABLE public.media (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    url character varying(100),
    type public.enum_media_type,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.media;
       public         heap    postgres    false    5    5    890    5            �            1259    26567    menu    TABLE     �  CREATE TABLE public.menu (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "order" integer,
    name character varying(100),
    category_id uuid,
    slug character varying(255),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.menu;
       public         heap    postgres    false    5    5    5            �            1259    26574 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    hash character varying(40) NOT NULL,
    executed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.migrations;
       public         heap    postgres    false    5            �            1259    26578    news    TABLE     �  CREATE TABLE public.news (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(255),
    description text,
    content text,
    publish_date timestamp without time zone,
    user_id uuid,
    category_id uuid,
    imageurl character varying(255),
    status public.enum_news_status,
    slug character varying(255),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    is_hot_news boolean,
    meta_keyword character varying(255),
    view character varying(255),
    custom_id numeric
);
    DROP TABLE public.news;
       public         heap    postgres    false    5    5    893    5            �            1259    26587 	   news_tags    TABLE     ;  CREATE TABLE public.news_tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    news_id uuid,
    tag_id uuid,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.news_tags;
       public         heap    postgres    false    5    5    5            �            1259    26594    permissions    TABLE     ;  CREATE TABLE public.permissions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.permissions;
       public         heap    postgres    false    5    5    5            �            1259    26601    qas    TABLE     �  CREATE TABLE public.qas (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    question character varying(255),
    answer text,
    publish_date timestamp without time zone,
    user_id uuid,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.qas;
       public         heap    postgres    false    5    5    5            �            1259    26610    rao_vats    TABLE     �  CREATE TABLE public.rao_vats (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    title character varying(100),
    content text,
    imageurl character varying(100),
    category_id uuid,
    publish_date timestamp without time zone,
    slug character varying(255),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    facebook character varying(255),
    phone_number character varying(255),
    contact_name character varying(255),
    meta_keyword character varying(255),
    view character varying(255),
    extra_images character varying(255)[],
    website_url character varying(255),
    email character varying(255),
    address character varying(255),
    description character varying(255),
    status public.enum_news_status,
    custom_id numeric
);
    DROP TABLE public.rao_vats;
       public         heap    postgres    false    5    5    5    893            �            1259    26619    role_permissions    TABLE     I  CREATE TABLE public.role_permissions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    role_id uuid,
    permission_id uuid,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
 $   DROP TABLE public.role_permissions;
       public         heap    postgres    false    5    5    5            �            1259    26626    roles    TABLE     U  CREATE TABLE public.roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(100),
    key character varying(100),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.roles;
       public         heap    postgres    false    5    5    5            �            1259    26633    tags    TABLE     3  CREATE TABLE public.tags (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.tags;
       public         heap    postgres    false    5    5    5            �            1259    26640    user_histories    TABLE     �  CREATE TABLE public.user_histories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    history character varying(100),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    action public.enum_history_action NOT NULL,
    entity_id uuid,
    entity_name character varying(255),
    entity_type character varying(100)
);
 "   DROP TABLE public.user_histories;
       public         heap    postgres    false    5    5    5    887            �            1259    26647    users    TABLE     �  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(255),
    email character varying(255),
    bio text,
    role_id uuid,
    status public.enum_users_status,
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now(),
    password character varying(255),
    google_id character varying(30),
    facebook_id character varying(30),
    phone_number character varying(255),
    avatar character varying(255),
    refresh_token character varying(2000)
);
    DROP TABLE public.users;
       public         heap    postgres    false    5    5    5    896            �            1259    26656    website    TABLE     �  CREATE TABLE public.website (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    logo character varying(255),
    footer_content text,
    facebook_url character varying(255),
    twitter_url character varying(255),
    google_url character varying(255),
    linkedin_url character varying(255),
    is_deleted boolean DEFAULT false,
    created_by uuid,
    updated_by uuid,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now()
);
    DROP TABLE public.website;
       public         heap    postgres    false    5    5    5                      0    26517    ads 
   TABLE DATA           �   COPY public.ads (id, name, url, "order", imageurl, status, is_deleted, created_by, updated_by, created_at, updated_at, "position") FROM stdin;
    public          postgres    false    216   )�                 0    26528 
   categories 
   TABLE DATA           �   COPY public.categories (id, name, parent_id, slug, is_deleted, type, status, created_by, updated_by, created_at, updated_at, style_show) FROM stdin;
    public          postgres    false    217   F�                 0    26535    comments 
   TABLE DATA           �   COPY public.comments (id, content, news_id, user_id, is_deleted, created_by, updated_by, created_at, updated_at, anonymous_email, anonymous_name, anonymous_address, rao_vat_id) FROM stdin;
    public          postgres    false    218   c�                 0    26544    configs 
   TABLE DATA           s   COPY public.configs (id, key, value, type, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    219   ��                 0    26553 	   documents 
   TABLE DATA           t   COPY public.documents (id, name, url, type, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    220   ��       	          0    26560    media 
   TABLE DATA           p   COPY public.media (id, name, url, type, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    221   ��       
          0    26567    menu 
   TABLE DATA           �   COPY public.menu (id, "order", name, category_id, slug, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    222   ׂ                 0    26574 
   migrations 
   TABLE DATA           A   COPY public.migrations (id, name, hash, executed_at) FROM stdin;
    public          postgres    false    223   �                 0    26578    news 
   TABLE DATA           �   COPY public.news (id, title, description, content, publish_date, user_id, category_id, imageurl, status, slug, is_deleted, created_by, updated_by, created_at, updated_at, is_hot_news, meta_keyword, view, custom_id) FROM stdin;
    public          postgres    false    224   �                 0    26587 	   news_tags 
   TABLE DATA           t   COPY public.news_tags (id, news_id, tag_id, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    225   .�                 0    26594    permissions 
   TABLE DATA           k   COPY public.permissions (id, name, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    226   K�                 0    26601    qas 
   TABLE DATA           �   COPY public.qas (id, question, answer, publish_date, user_id, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    227   h�                 0    26610    rao_vats 
   TABLE DATA           "  COPY public.rao_vats (id, title, content, imageurl, category_id, publish_date, slug, is_deleted, created_by, updated_by, created_at, updated_at, facebook, phone_number, contact_name, meta_keyword, view, extra_images, website_url, email, address, description, status, custom_id) FROM stdin;
    public          postgres    false    228   ��                 0    26619    role_permissions 
   TABLE DATA           �   COPY public.role_permissions (id, role_id, permission_id, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    229   ��                 0    26626    roles 
   TABLE DATA           j   COPY public.roles (id, name, key, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    230   ��                 0    26633    tags 
   TABLE DATA           d   COPY public.tags (id, name, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    231   ܃                 0    26640    user_histories 
   TABLE DATA           �   COPY public.user_histories (id, user_id, history, is_deleted, created_by, updated_by, created_at, updated_at, action, entity_id, entity_name, entity_type) FROM stdin;
    public          postgres    false    232   ��                 0    26647    users 
   TABLE DATA           �   COPY public.users (id, name, email, bio, role_id, status, is_deleted, created_by, updated_by, created_at, updated_at, password, google_id, facebook_id, phone_number, avatar, refresh_token) FROM stdin;
    public          postgres    false    233   �                 0    26656    website 
   TABLE DATA           �   COPY public.website (id, logo, footer_content, facebook_url, twitter_url, google_url, linkedin_url, is_deleted, created_by, updated_by, created_at, updated_at) FROM stdin;
    public          postgres    false    234   3�       ?           2606    26666    ads ads_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.ads DROP CONSTRAINT ads_pkey;
       public            postgres    false    216            A           2606    26668    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    217            C           2606    26670    comments comments_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_pkey;
       public            postgres    false    218            E           2606    26672    configs configs_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.configs
    ADD CONSTRAINT configs_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.configs DROP CONSTRAINT configs_pkey;
       public            postgres    false    219            G           2606    26674    documents documents_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.documents DROP CONSTRAINT documents_pkey;
       public            postgres    false    220            I           2606    26676    media media_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.media
    ADD CONSTRAINT media_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.media DROP CONSTRAINT media_pkey;
       public            postgres    false    221            K           2606    26678    menu menu_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_pkey;
       public            postgres    false    222            M           2606    26680    migrations migrations_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_name_key;
       public            postgres    false    223            O           2606    26682    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    223            Q           2606    26684    news news_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.news DROP CONSTRAINT news_pkey;
       public            postgres    false    224            S           2606    26686    news_tags news_tags_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.news_tags DROP CONSTRAINT news_tags_pkey;
       public            postgres    false    225            U           2606    26688    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    226            W           2606    26690    qas qas_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY public.qas
    ADD CONSTRAINT qas_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.qas DROP CONSTRAINT qas_pkey;
       public            postgres    false    227            Y           2606    26692    rao_vats rao_vats_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.rao_vats
    ADD CONSTRAINT rao_vats_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.rao_vats DROP CONSTRAINT rao_vats_pkey;
       public            postgres    false    228            [           2606    26694 &   role_permissions role_permissions_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_pkey;
       public            postgres    false    229            ]           2606    26696    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    230            _           2606    26698    tags tags_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.tags DROP CONSTRAINT tags_pkey;
       public            postgres    false    231            a           2606    26700 "   user_histories user_histories_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.user_histories
    ADD CONSTRAINT user_histories_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.user_histories DROP CONSTRAINT user_histories_pkey;
       public            postgres    false    232            c           2606    26702    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    233            e           2606    26704    website website_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.website
    ADD CONSTRAINT website_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.website DROP CONSTRAINT website_pkey;
       public            postgres    false    234            f           2606    26705 $   categories categories_parent_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES public.categories(id);
 N   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_parent_id_fkey;
       public          postgres    false    217    3393    217            g           2606    26710    comments comments_news_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_news_id_fkey FOREIGN KEY (news_id) REFERENCES public.news(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_news_id_fkey;
       public          postgres    false    3409    224    218            h           2606    26715 !   comments comments_rao_vat_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_rao_vat_id_fkey FOREIGN KEY (rao_vat_id) REFERENCES public.rao_vats(id);
 K   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_rao_vat_id_fkey;
       public          postgres    false    218    3417    228            i           2606    26720    comments comments_user_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 H   ALTER TABLE ONLY public.comments DROP CONSTRAINT comments_user_id_fkey;
       public          postgres    false    3427    218    233            j           2606    26725    menu menu_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 D   ALTER TABLE ONLY public.menu DROP CONSTRAINT menu_category_id_fkey;
       public          postgres    false    3393    222    217            k           2606    26730    news news_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 D   ALTER TABLE ONLY public.news DROP CONSTRAINT news_category_id_fkey;
       public          postgres    false    224    3393    217            m           2606    26735     news_tags news_tags_news_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_news_id_fkey FOREIGN KEY (news_id) REFERENCES public.news(id);
 J   ALTER TABLE ONLY public.news_tags DROP CONSTRAINT news_tags_news_id_fkey;
       public          postgres    false    224    3409    225            n           2606    26740    news_tags news_tags_tag_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY public.news_tags
    ADD CONSTRAINT news_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(id);
 I   ALTER TABLE ONLY public.news_tags DROP CONSTRAINT news_tags_tag_id_fkey;
       public          postgres    false    225    231    3423            l           2606    26745    news news_user_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY public.news
    ADD CONSTRAINT news_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 @   ALTER TABLE ONLY public.news DROP CONSTRAINT news_user_id_fkey;
       public          postgres    false    3427    224    233            o           2606    26750    qas qas_user_id_fkey    FK CONSTRAINT     s   ALTER TABLE ONLY public.qas
    ADD CONSTRAINT qas_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 >   ALTER TABLE ONLY public.qas DROP CONSTRAINT qas_user_id_fkey;
       public          postgres    false    227    233    3427            p           2606    26755 "   rao_vats rao_vats_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.rao_vats
    ADD CONSTRAINT rao_vats_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id);
 L   ALTER TABLE ONLY public.rao_vats DROP CONSTRAINT rao_vats_category_id_fkey;
       public          postgres    false    217    228    3393            q           2606    26760 4   role_permissions role_permissions_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES public.permissions(id);
 ^   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_permission_id_fkey;
       public          postgres    false    226    3413    229            r           2606    26765 .   role_permissions role_permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.role_permissions
    ADD CONSTRAINT role_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 X   ALTER TABLE ONLY public.role_permissions DROP CONSTRAINT role_permissions_role_id_fkey;
       public          postgres    false    230    3421    229            s           2606    26770 *   user_histories user_histories_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_histories
    ADD CONSTRAINT user_histories_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);
 T   ALTER TABLE ONLY public.user_histories DROP CONSTRAINT user_histories_user_id_fkey;
       public          postgres    false    232    233    3427            t           2606    26775    users users_role_id_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    233    3421    230                  x������ � �            x������ � �            x������ � �            x������ � �            x������ � �      	      x������ � �      
      x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �            x������ � �     