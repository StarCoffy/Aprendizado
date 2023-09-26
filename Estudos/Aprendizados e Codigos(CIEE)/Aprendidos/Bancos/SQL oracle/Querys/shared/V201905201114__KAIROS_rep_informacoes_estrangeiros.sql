
CREATE TABLE REP_INFORMACOES_ESTRANGEIROS
(
    ID                  NUMBER        not null,
    RNE                 VARCHAR2(255) not null,
    DATA_PERMANENCIA    DATE          not null,
    CLASSIFICACAO_VISTO NUMBER,
    DATA_CHEGADA        DATE,
    CASADO_BRASILEIRO   NUMBER(1),
    FILHO_BRASILEIRO    NUMBER(1),
    DELETADO            NUMBER(1),
    DATA_CRIACAO        TIMESTAMP(6)  not null,
    DATA_ALTERACAO      TIMESTAMP(6)  not null,
    CRIADO_POR          VARCHAR2(255),
    MODIFICADO_POR      VARCHAR2(255)
);

ALTER TABLE REP_INFORMACOES_ESTRANGEIROS
ADD CONSTRAINT krs_indice_03414 PRIMARY KEY ( ID );
