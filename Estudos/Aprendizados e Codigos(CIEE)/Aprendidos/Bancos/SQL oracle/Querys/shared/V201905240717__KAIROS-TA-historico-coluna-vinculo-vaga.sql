-- Cria coluna Vinculo vaga

ALTER TABLE HIST_CONTRATOS_ESTUDANTES_EMPRESA ADD ID_VINCULO_VAGA NUMBER(20);

ALTER TABLE HIST_CONTRATOS_ESTUDANTES_EMPRESA  add constraint KRS_INDICE_03440 FOREIGN KEY (ID_VINCULO_VAGA)
    references VINCULOS_VAGA (ID);