BEGIN;


CREATE TABLE IF NOT EXISTS public.category
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.drink
(
    id integer NOT NULL,
    name character varying(150) COLLATE pg_catalog."default" NOT NULL,
    prise integer NOT NULL,
    CONSTRAINT drink_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.drink_category
(
    id integer NOT NULL,
    drink_id integer NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT "customer _pkey" PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public."order"
(
    id integer NOT NULL,
    "drink_category_id " integer NOT NULL,
    customer_name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.drink_category
    ADD CONSTRAINT fk_category FOREIGN KEY (category_id)
    REFERENCES public.category (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.drink_category
    ADD CONSTRAINT fk_drink FOREIGN KEY (drink_id)
    REFERENCES public.drink (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."order"
    ADD CONSTRAINT fk_drink_order FOREIGN KEY ("drink_category_id ")
    REFERENCES public.drink_category (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
