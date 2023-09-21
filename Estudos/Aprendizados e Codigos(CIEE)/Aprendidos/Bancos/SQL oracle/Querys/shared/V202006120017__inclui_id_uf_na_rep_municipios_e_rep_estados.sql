CREATE TABLE REP_ESTADOS_CORE (
    ID                NUMBER(19) NOT NULL,
    CRIADO_POR        VARCHAR2(255 CHAR),
    DATA_CRIACAO      TIMESTAMP,
    DELETADO          NUMBER(1),
    MODIFICADO_POR    VARCHAR2(255 CHAR),
    DATA_ALTERACAO    TIMESTAMP,
    ATIVO             NUMBER(1),
    DESCRICAO_ESTADO  VARCHAR2(50 CHAR),
    SIGLA_ESTADO      VARCHAR2(2 CHAR)
);
COMMENT ON TABLE REP_ESTADOS_CORE IS
    'CORE_DEV:SERVICE_CORE_DEV:ESTADOS:ID';
ALTER TABLE REP_ESTADOS_CORE ADD CONSTRAINT KRS_INDICE_07744 PRIMARY KEY ( ID );
--
ALTER TABLE REP_MUNICIPIOS ADD ID_ESTADO NUMBER(19);
ALTER TABLE REP_MUNICIPIOS
    ADD CONSTRAINT KRS_INDICE_07743 FOREIGN KEY ( ID_ESTADO )
        REFERENCES REP_ESTADOS_CORE ( ID );