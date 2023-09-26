CREATE SEQUENCE SEQ_REGISTRO_LIGACAO_CONVOCACAO
    MINVALUE 1
    MAXVALUE 9999999999999999999999999999
    INCREMENT BY 1
    START WITH 1
    CACHE 20
    NOORDER
    NOCYCLE;

CREATE TABLE REGISTRO_LIGACAO_CONVOCACAO (
        ID                  NUMBER(20) NOT NULL,
        ID_ESTUDANTE        NUMBER(20) NOT NULL,
        ID_VINCULO_VAGA     NUMBER(20) NOT NULL,
        MOTIVO              NUMBER(1) NOT NULL,
        DATA_CRIACAO        TIMESTAMP,
        DATA_ALTERACAO      TIMESTAMP,
        DELETADO            NUMBER(1),
        CRIADO_POR          VARCHAR2(255 CHAR),
        MODIFICADO_POR      VARCHAR2(255 CHAR)
);

COMMENT ON COLUMN REGISTRO_LIGACAO_CONVOCACAO.MOTIVO IS
    'ENUM:
    0-Ninguém atendeu a ligação.
    1-Numero de telefone não existe.
    2-Recebeu sinal de FAX.
    3-Ligação estava ocupada.
    4-Recado na secretaria eletrônica ou celular.
    5-Ligação ficou muda.
    6-A ligação caiu.
    ';

ALTER TABLE REGISTRO_LIGACAO_CONVOCACAO
    ADD CONSTRAINT KRS_INDICE_1010021 PRIMARY KEY(ID);

ALTER TABLE REGISTRO_LIGACAO_CONVOCACAO
    ADD CONSTRAINT KRS_INDICE_1010022 FOREIGN KEY(ID_VINCULO_VAGA)
    REFERENCES VINCULOS_VAGA(ID);

ALTER TABLE REGISTRO_LIGACAO_CONVOCACAO
    ADD CONSTRAINT KRS_INDICE_1010023 FOREIGN KEY(ID_ESTUDANTE)
    REFERENCES REP_ESTUDANTES(ID);