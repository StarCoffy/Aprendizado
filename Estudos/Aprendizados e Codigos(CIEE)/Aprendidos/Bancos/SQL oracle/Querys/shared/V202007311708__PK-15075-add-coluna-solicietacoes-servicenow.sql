ALTER TABLE SOLICITACOES_SERVICENOW ADD ID_LOCAL_CONTRATO NUMBER(20);

ALTER TABLE SOLICITACOES_SERVICENOW
    ADD CONSTRAINT KRS_INDICE_08260 FOREIGN KEY (ID_LOCAL_CONTRATO)
        REFERENCES REP_LOCAIS_CONTRATO ( ID );