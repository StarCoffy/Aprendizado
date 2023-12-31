

ALTER TABLE TEMPLATE_EMPRESA
DROP COLUMN ID_COMPONENTE;

CREATE TABLE COMPONENTES_TEMPLATES_EMPRESA (
  ID_TEMPLATE_EMPRESA NUMBER(20) NOT NULL,
  ID_COMPONENTE NUMBER(20) NOT NULL
);

ALTER TABLE TEMPLATE_UNIDADES_CIEE
DROP COLUMN ID_COMPONENTE;

CREATE TABLE COMPONENTES_TEMPLATES_UNIDADES_CIEE (
  ID_TEMPLATE_UNIDADES_CIEE NUMBER(20) NOT NULL,
  ID_COMPONENTE NUMBER(20) NOT NULL
);

ALTER TABLE COMPONENTES_TEMPLATES_EMPRESA
ADD CONSTRAINT krs_indice_02680 FOREIGN KEY ( ID_TEMPLATE_EMPRESA )
REFERENCES TEMPLATE_EMPRESA ( ID );

ALTER TABLE COMPONENTES_TEMPLATES_UNIDADES_CIEE
ADD CONSTRAINT krs_indice_02681 FOREIGN KEY ( ID_TEMPLATE_UNIDADES_CIEE )
REFERENCES TEMPLATE_UNIDADES_CIEE;




