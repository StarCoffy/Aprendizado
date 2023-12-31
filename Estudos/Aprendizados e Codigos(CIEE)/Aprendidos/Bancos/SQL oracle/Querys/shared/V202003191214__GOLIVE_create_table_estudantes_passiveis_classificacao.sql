CREATE TABLE SERVICE_VAGAS_DEV.ESTUDANTES_PASSIVEIS_CLASSIFICACOES 
(	
    ID NUMBER(20,0) NOT NULL ENABLE, 
    ID_ESTUDANTE NUMBER(20,0), 
    ID_CLASSIFICACOES_PARAMETROS_ITENS NUMBER(20,0), 
    DATA_CRIACAO TIMESTAMP (6), 
    DATA_ALTERACAO TIMESTAMP (6), 
    CRIADO_POR VARCHAR2(255 CHAR), 
    MODIFICADO_POR VARCHAR2(255 CHAR), 
    DELETADO NUMBER(1,0), 
    CONSTRAINT KRS_INDICE_07322 PRIMARY KEY (ID)
    USING INDEX TABLESPACE CIEE  ENABLE, 
    CONSTRAINT KRS_INDICE_07323 FOREIGN KEY (ID_ESTUDANTE)
    REFERENCES SERVICE_VAGAS_DEV.REP_ESTUDANTES (ID) DISABLE
) ;

