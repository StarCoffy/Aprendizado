CREATE TABLE REP_APOLICES_CIEE
(
    ID                           NUMBER       NOT NULL,
    NUMERO                       VARCHAR2(20) NOT NULL,
    ID_SEGURADORA                NUMBER,
    DATA_CRIACAO                 TIMESTAMP(6) NOT NULL,
    DATA_ALTERACAO               TIMESTAMP(6) NOT NULL,
    CRIADO_POR                   VARCHAR2(255),
    MODIFICADO_POR               VARCHAR2(255),
    DELETADO                     NUMBER(1),
    data_inicio DATE NOT NULL,
    data_termino DATE NOT NULL,
    susep_apolice VARCHAR2(20 CHAR),
    susep_seguradora VARCHAR2(6 CHAR),
    id_tel_auxilio_funeral NUMBER(22, 2),
    id_tel_ouvidoria_seguradora NUMBER(22, 2)
);
ALTER TABLE REP_APOLICES_CIEE ADD CONSTRAINT KRS_INDICE_02483 PRIMARY KEY (ID);

CREATE TABLE REP_APOLICES_VALORES
(
  ID_APOLICE         NUMBER NOT NULL,
  ID_VALORES_APOLICE NUMBER NOT NULL
);

ALTER TABLE REP_APOLICES_VALORES ADD CONSTRAINT KRS_INDICE_02484 PRIMARY KEY (ID_APOLICE, ID_VALORES_APOLICE);

CREATE TABLE REP_VALORES_APOLICES_CIEE
(
    ID             NUMBER(20)    NOT NULL,
    MORTE          NUMBER(20, 2) NOT NULL,
    DATA_CRIACAO   TIMESTAMP(6)  NOT NULL,
    DATA_ALTERACAO TIMESTAMP(6)  NOT NULL,
    CRIADO_POR     VARCHAR2(255),
    MODIFICADO_POR VARCHAR2(255),
    DELETADO       NUMBER(1),
    invalidez NUMBER(10, 2) NOT NULL,
    premio NUMBER(20, 2) NOT NULl,
    iof NUMBER(6, 3) NOT NULL,
    custo_total NUMBER(20, 2) NOT NULL,
    cobertura NUMBER(20, 2) NOT NULL
);

ALTER TABLE REP_VALORES_APOLICES_CIEE ADD CONSTRAINT KRS_INDICE_02485 PRIMARY KEY (ID);

ALTER TABLE REP_EMPRESAS ADD ID_APOLICES_CIEE NUMBER;
ALTER TABLE REP_EMPRESAS ADD CONSTRAINT KRS_INDICE_02486 FOREIGN KEY (ID_APOLICES_CIEE) REFERENCES REP_APOLICES_CIEE (ID);
    
ALTER TABLE REP_APOLICES_CIEE ADD CONSTRAINT KRS_INDICE_02487 FOREIGN KEY (ID_SEGURADORA) REFERENCES REP_SEGURADORAS (ID);

ALTER TABLE REP_APOLICES_VALORES ADD CONSTRAINT KRS_INDICE_02488 FOREIGN KEY (ID_VALORES_APOLICE) REFERENCES REP_VALORES_APOLICES_CIEE (ID);
ALTER TABLE REP_APOLICES_VALORES ADD CONSTRAINT KRS_INDICE_02489 FOREIGN KEY (ID_APOLICE) REFERENCES REP_APOLICES_CIEE (ID);