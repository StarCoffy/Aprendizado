ALTER TABLE CONTRATOS_ESTUDANTES_EMPRESA ADD ORDEM_PAGAMENTO NUMBER(1,0) DEFAULT 0;   
COMMENT ON COLUMN CONTRATOS_ESTUDANTES_EMPRESA.ORDEM_PAGAMENTO IS 'Enum: 0 - Não    1 - Sim';

ALTER TABLE CONTRATOS_ESTUDANTES_EMPRESA ADD SITUACAO_DADOS_BANCARIOS NUMBER(1,0) DEFAULT 1;   
COMMENT ON COLUMN CONTRATOS_ESTUDANTES_EMPRESA.ORDEM_PAGAMENTO IS 'Enum: 1 - PENDENTE    2 - EM VALIDACAO   3 - VALIDADO   4 - REJEITADO ';