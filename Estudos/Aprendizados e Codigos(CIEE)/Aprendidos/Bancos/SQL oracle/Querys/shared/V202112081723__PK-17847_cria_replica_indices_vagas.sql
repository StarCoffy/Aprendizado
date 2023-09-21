-- cria réplica rep_indices_company


CREATE TABLE REP_INDICES_COMPANY (	
	ID NUMBER NOT NULL, 
	DESCRICAO VARCHAR2(100 CHAR) NOT NULL, 
	ATIVO NUMBER(1,0), 
	DELETADO NUMBER(1,0),
	DATA_CRIACAO TIMESTAMP (6) NOT NULL, 
	DATA_ALTERACAO TIMESTAMP (6) NOT NULL, 
	CRIADO_POR VARCHAR2(255 BYTE), 
	MODIFICADO_POR VARCHAR2(255 BYTE)
);

ALTER TABLE REP_INDICES_COMPANY ADD CONSTRAINT krs_indice_10887 PRIMARY KEY ( id );
COMMENT ON TABLE REP_INDICES_COMPANY IS 'COMPANY_DEV:SERVICE_COMPANY_DEV:INDICES:id';