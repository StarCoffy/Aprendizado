-- Cria colunas utilizadas para o Termo Aditivo

ALTER TABLE CONTRATOS_ESTUDANTES_EMPRESA ADD DATA_VIGENCIA_TA TIMESTAMP(6);
ALTER TABLE HIST_CONTRATOS_ESTUDANTES_EMPRESA ADD DATA_VIGENCIA_TA TIMESTAMP(6);
ALTER TABLE CONTRATO_TA ADD SEQ_TA NUMBER(20);