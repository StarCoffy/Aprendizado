
ALTER TABLE COMPONENTES_TEMPLATES_EMPRESA
ADD (
        ID NUMBER(20),
        TIPO_COMPONENTE NUMBER(1)
    );

ALTER TABLE COMPONENTES_TEMPLATES_EMPRESA
ADD CONSTRAINT krs_indice_02702 PRIMARY KEY ( ID );

COMMENT ON COLUMN COMPONENTES_TEMPLATES_EMPRESA.TIPO_COMPONENTE IS
    'ENUM:

  0 - Cabecalho
  1 - Dados da IE
  2 - Dados da Empresa
  3 - Dados de Estudante
  4 - Dados da Unidade CIEE
  5 - Corpo
  6 - Rodape'
;

ALTER TABLE COMPONENTES_TEMPLATES_UNIDADES_CIEE
ADD (
        ID NUMBER(20),
        TIPO_COMPONENTE NUMBER(1)
    );

ALTER TABLE COMPONENTES_TEMPLATES_UNIDADES_CIEE
ADD CONSTRAINT krs_indice_02703 PRIMARY KEY ( ID );

COMMENT ON COLUMN COMPONENTES_TEMPLATES_UNIDADES_CIEE.TIPO_COMPONENTE IS
    'ENUM:

  0 - Cabecalho
  1 - Dados da IE
  2 - Dados da Empresa
  3 - Dados de Estudante
  4 - Dados da Unidade CIEE
  5 - Corpo
  6 - Rodape'
;




