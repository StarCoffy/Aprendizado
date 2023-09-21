--PK-15840 - Criar migration para guardar referencia de CONTRATO_ESTUDANTE_EMPRESA e PRE_CONTRATO_ESTUDANTE_EMPRESA
CREATE TABLE CONTR_EST_EMP_PRE_CONTR_EST_EMP
(
    ID                                      NUMBER(20) NOT NULL,
    ID_CONTRATOS_ESTUDANTES_EMPRESAS        NUMBER(20) NOT NULL,
    ID_PRE_CONTRATOS_ESTUDANTES_EMPRESA     NUMBER(20) NOT NULL,
    DATA_CRIACAO                            TIMESTAMP  NOT NULL,
    DATA_ALTERACAO                          TIMESTAMP  NOT NULL,
    CRIADO_POR                              VARCHAR2(255 CHAR),
    MODIFICADO_POR                          VARCHAR2(255 CHAR),
    DELETADO                                NUMBER(1) DEFAULT 0
);

ALTER TABLE CONTR_EST_EMP_PRE_CONTR_EST_EMP
    ADD CONSTRAINT KRS_INDICE_1010101 PRIMARY KEY (ID);

ALTER TABLE CONTR_EST_EMP_PRE_CONTR_EST_EMP
    ADD CONSTRAINT KRS_INDICE_1010102
    FOREIGN KEY (ID_CONTRATOS_ESTUDANTES_EMPRESAS) REFERENCES CONTRATOS_ESTUDANTES_EMPRESA(ID);

ALTER TABLE CONTR_EST_EMP_PRE_CONTR_EST_EMP
    ADD CONSTRAINT KRS_INDICE_1010103
    FOREIGN KEY (ID_PRE_CONTRATOS_ESTUDANTES_EMPRESA) REFERENCES PRE_CONTRATOS_ESTUDANTES_EMPRESA(ID);

CREATE SEQUENCE SEQ_CONTR_EST_EMP_PRE_CONTR_EST_EMP
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    INCREMENT BY 1
    START WITH 1 CACHE 20 NOORDER NOCYCLE NOKEEP NOSCALE GLOBAL;
