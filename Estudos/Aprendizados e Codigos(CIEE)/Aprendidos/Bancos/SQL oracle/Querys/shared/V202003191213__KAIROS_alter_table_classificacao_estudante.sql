ALTER TABLE CLASSIFICACOES_ESTUDANTES_ANALITICO DROP COLUMN ID_CLASSIFICACAO_ESTUDANTE_CONSOLIDADO CASCADE CONSTRAINTS;
ALTER TABLE CLASSIFICACOES_ESTUDANTES_ANALITICO ADD ID_ESTUDANTE NUMBER(20);
ALTER TABLE CLASSIFICACOES_ESTUDANTES_ANALITICO
    ADD CONSTRAINT KRS_INDICE_07360 FOREIGN KEY ( ID_ESTUDANTE )
        REFERENCES REP_ESTUDANTES ( ID );

